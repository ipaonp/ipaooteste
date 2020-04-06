<?php
class PaypalController extends CController
{

	public function __construct()
	{
		Yii::app()->setImport(array(			
		  'application.components.*',
		));		
		require_once 'Functions.php';
	}
	
	public function actionIndex()
	{				
		require_once('buy.php');
		
		$device_uiid = isset($_GET['device_uiid'])?$_GET['device_uiid']:'';
		
		if(empty($error)){
			if ($credentials=PaypalWrapper::getCredentials($merchant_id)){			
				$success_url = websiteUrl()."/".APP_FOLDER."/paypal/verify/?reference_id=".urlencode($reference_id)."&trans_type=$trans_type";
				$success_url.="&device_uiid=".urlencode($device_uiid);
				
				$cancel_url = websiteUrl()."/".APP_FOLDER."/paypal/cancel";
								
				try {
					
					 $params = array(
			            'intent' => 'CAPTURE',
			            'application_context' => array(
			                'return_url' => $success_url,
			                'cancel_url' => $cancel_url,   				                
			            ),
			            'purchase_units' => array(
			                0 => array(
			                    'reference_id' => $reference_id,
			                    'description' => $payment_description,   
			                    'amount' => array(
			                        'currency_code' => $currency_code,
			                        'value' => $amount_to_pay,
			                        'breakdown' => array(
			                            'item_total' => array(
			                                'currency_code' => $currency_code,
			                                'value' => $amount_to_pay
			                            )
			                        )
			                    ),
			                    'items' => array(
			                        0 => array(
			                            'name' => t("Purchase"),
			                            'description' => $description,				                            
			                            'unit_amount' => array(
			                                'currency_code' => $currency_code,
			                                'value' => $amount_to_pay
			                            ),
			                            'quantity' => '1',				                            
			                        )
			                    )
			                )
			            )
			        );
			        
			     	        
			        $resp = PaypalWrapper::createOrder(
						$credentials['client_id'],
						$credentials['secret_key'],
						$credentials['mode'],
						$params
					);
					
					$this->redirect($resp['approve']);
					Yii::app()->end();
					
				} catch (Exception $e) {
					$error = Yii::t("mobile2","Caught exception: [error]",array(
					  '[error]'=>$e->getMessage()
					));
				}    
			} else $error = mt("invalid merchant credentials");
		}
		
		if(!empty($error)){			
			$this->redirect(Yii::app()->createUrl('/'.APP_FOLDER.'/paypal/error/?error='.$error )); 
		}
	}
	
	public function actionverify()
	{
		$db=new DbExt();
		$get = $_GET; $back_url='';
		$error='';
		$payment_code = PaypalWrapper::paymentCode();
				
		$reference_id = isset($get['reference_id'])?$get['reference_id']:'';
		$trans_type = isset($get['trans_type'])?$get['trans_type']:'';
		$payer_id = isset($get['PayerID'])?$get['PayerID']:'';
		$payment_token = isset($get['token'])?$get['token']:'';	
		$device_uiid = isset($get['device_uiid'])?$get['device_uiid']:'';
				
		if(!empty($reference_id) && !empty($trans_type)){
			if ($data = FunctionsV3::getOrderInfoByToken($reference_id)){
				
				$merchant_id=isset($data['merchant_id'])?$data['merchant_id']:'';	
		        $client_id = $data['client_id'];
		        $order_id = $data['order_id'];
		        
		        if($credentials = PaypalWrapper::getCredentials($merchant_id)){
		           try {
		           	
		           	  $resp = PaypalWrapper::captureRequest(
		    			  $credentials['client_id'],
					      $credentials['secret_key'],
					      $credentials['mode'],
		    			  $payment_token
		    		  );
		    		  
		    		  if($data['status']=="paid"){
		    		  	  echo mt("order status is already paid");
		    		  	  Yii::app()->end();
		    		  } else {
		    		  		  	     
		    		  	  FunctionsV3::updateOrderPayment($order_id,$payment_code,
		    		  	  $resp['id'],$resp,$reference_id);		 
		    		  	     		  	 		    		  	  		    		  	  
		    		  	  /*SEND EMAIL RECEIPT*/
                          mobileWrapper::sendNotification($order_id);	
                          
                          mobileWrapper::executeAddons($order_id);
                          
                          /*CLEAR CART*/
	                      mobileWrapper::clearCartByCustomerID($client_id);	                      
                          
                          $message = Yii::t("mobile2","payment successfull with payment reference id [ref]",array(
                            '[ref]'=>$resp['id']
                          ));
                                                    
						  $this->redirect(Yii::app()->createUrl('/'.APP_FOLDER.'/paypal/success/?message='.$message )); 
						  
		    		  	  Yii::app()->end();
		    		  }
		    		  
		           } catch (Exception $e) {		           	    
						$error = Yii::t("mobile2","Caught exception: [error]",array(
						  '[error]'=>$e->getMessage()
						));
						$raw = $e->getMessage();
						$json= json_decode($raw,true);
						if(is_array($json) && count($json)>=1){
							if(isset($json['message'])){
								$error = $json['message'];
							}
						}
				   }    
		        } else mt("invalid payment credentials");
				
			} else $error = mt("Failed getting order information");
		} else $error = mt("Sorry but we cannot find what you are looking for");
		
		if(!empty($error)){				
			 $this->redirect(Yii::app()->createUrl('/'.APP_FOLDER.'/paypal/error/?error='.$error )); 
		}
	}
	
	public function actionsuccess()
	{
		$msg = isset($_GET['message'])?$_GET['message']:'';
		if(!empty($msg)){
			echo $msg;
		} else {
			echo mt("payment successfull");
		}
	}
	
	public function actionerror()
	{
		$error = isset($_GET['error'])?$_GET['error']:'';
		if(!empty($error)){
			echo $error;
		} else echo mt("undefined error");
	}
	
	public function actioncancel()
	{
		
	}
	
}
/*end class*/