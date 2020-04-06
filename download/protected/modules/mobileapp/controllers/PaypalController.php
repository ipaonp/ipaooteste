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
		if(empty($error)){
			if ($credentials=PaypalWrapper::getCredentials($merchant_id)){			
				$success_url = websiteUrl()."/mobileapp/paypal/success/?reference_id=".urlencode($reference_id)."&trans_type=$trans_type";
				$cancel_url = websiteUrl()."/mobileapp/paypal/cancel";
				
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
					$error = Yii::t("default","Caught exception: [error]",array(
					  '[error]'=>$e->getMessage()
					));
				}    
			} else $error = t("invalid merchant credentials");
		}
		
		if(!empty($error)){			
			$this->redirect(Yii::app()->createUrl('/mobileapp/paypal/error',array(
			   'error'=>$error
			 ))); 
		}
	}
	
	public function actionsuccess()
	{
		$db=new DbExt();
		$get = $_GET; $back_url='';
		$error='';
		$payment_code = PaypalWrapper::paymentCode();
				
		$reference_id = isset($get['reference_id'])?$get['reference_id']:'';
		$trans_type = isset($get['trans_type'])?$get['trans_type']:'';
		$payer_id = isset($get['PayerID'])?$get['PayerID']:'';
		$payment_token = isset($get['token'])?$get['token']:'';	
				
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
		    		  	  echo "order status is already paid";
		    		  	  Yii::app()->end();
		    		  } else {
		    		  		  	     
		    		  	  FunctionsV3::updateOrderPayment($order_id,$payment_code,
		    		  	  $resp['id'],$resp,$reference_id);		    		  	 
		    		  	  FunctionsV3::callAddons($order_id);
		    		  	  
		    		  	  /*SEND EMAIL RECEIPT*/
                          AddonMobileApp::notifyCustomer($order_id);
                          
                          echo Yii::t("mobile","payment successfull with payment reference id [ref]",array(
                            '[ref]'=>$resp['id']
                          ));
		    		  	  Yii::app()->end();
		    		  }
		    		  
		           } catch (Exception $e) {		           	    
						$error = Yii::t("default","Caught exception: [error]",array(
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
		        } else t("invalid payment credentials");
				
			} else $error = t("Failed getting order information");
		} else $error = t("Sorry but we cannot find what you are looking for");
		
		if(!empty($error)){			
			$this->redirect(Yii::app()->createUrl('/mobileapp/paypal/error',array(
			   'error'=>$error
			 ))); 
		}
	}
	
	public function actionerror()
	{
		$error = isset($_GET['error'])?$_GET['error']:'';
		if(!empty($error)){
			echo $error;
		} else echo Yii::t("mobile","undefined error");
	}
	
	public function actioncancel()
	{
		
	}
	
}
/*end class*/