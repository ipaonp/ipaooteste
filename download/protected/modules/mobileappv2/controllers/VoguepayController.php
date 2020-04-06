<?php
class VoguepayController extends CController
{	
	public $layout=APP_FOLDER.'.views.layouts.mobile_layout';
	
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
			if($credentials  = FunctionsV3::GetVogueCredentials($merchant_id)){
				
			   if($merchant_id>0){
				   $logo = FunctionsV3::getMerchantLogo($merchant_id);		
			   } else $logo = FunctionsV3::getDesktopLogo();		
			   
			   $success_url = websiteUrl()."/".APP_FOLDER."/voguepay/verify?reference_id=".urlencode($reference_id);
			   $success_url.="&device_uiid=".urlencode($device_uiid);
				
			   $fail_url = websiteUrl()."/".APP_FOLDER."/voguepay/error?reference_id=".urlencode($reference_id);
			   
			   $this->render(APP_FOLDER.'.views.index.voguepay_buy',array(				       
			       'logo'=>$logo,				
			       'reference_id'=>$reference_id,			       
			       'amount_to_pay'=>$amount_to_pay,	
			       'payment_description'=>$payment_description,		       
			       'credentials'=>$credentials,
			       'success_url'=>$success_url,
			       'fail_url'=>$fail_url
			    ));
				    
			} else $error = mt("invalid merchant credentials");
		}
		
		if(!empty($error)){								
			 $this->redirect(Yii::app()->createUrl('/'.APP_FOLDER.'/voguepay/error/?error='.$error )); 
		}
	}
	
	public function actionverify()
	{		
				
		if(isset($_GET['error'])){
			if(!empty($_GET['error'])){
				echo $_GET['error'];
				Yii::app()->end();
			}
		}
		$DbExt = new DbExt();
		$error='';  $data=$_POST;	
		$reference_id = isset($_GET['reference_id'])?$_GET['reference_id']:'';
		$transaction_id = isset($data['transaction_id'])?$data['transaction_id']:'';
		$device_uiid = isset($_GET['device_uiid'])?$_GET['device_uiid']:'';
		
		if(isset($transaction_id)){			
			if ($res = FunctionsV3::getOrderByToken($reference_id)){
				$merchant_id = $res['merchant_id'];
				$order_id = $res['order_id'];				
				if($credentials=FunctionsV3::GetVogueCredentials($merchant_id)){
					$is_demo=false;				    
				    if($credentials['merchant_id']=="demo"){
				    	$is_demo=true;
				    }	    	
				    if ( $vog_res=voguepayClass::getTransaction($transaction_id,$is_demo)){				    	
				    	switch (strtolower($vog_res['status'])) {
				    		case "failed":
			    			case "disputed":	
			    			case "pending":	
			    			case "cancelled":
			    				$params_update=array(
			                      'status'=>$vog_res['status'],
			                      'date_modified'=>FunctionsV3::dateNow(),
			                      'ip_address'=>$_SERVER['REMOTE_ADDR']
			                    );	
			                    $DbExt->updateData("{{order}}",$params_update,'order_id',$order_id);
			                    $error = $vog_res['status'];
			    				break;
			    			
			    			case "approved":
			    				
			    				FunctionsV3::updateOrderPayment($order_id,'vog',
	        	    		    $transaction_id,$vog_res,$reference_id);
	        	    		    	        	    		    
			    				/*SEND EMAIL RECEIPT*/
			                    mobileWrapper::sendNotification($order_id);	
			    							    				
	        	    		    mobileWrapper::executeAddons($order_id);
	        	    		    
	        	    		    /*CLEAR CART*/
	                            mobileWrapper::clearCartByCustomerID($client_id);
	        	    		    
	        	    		    $message = Yii::t("mobile2","payment successfull with payment reference id [ref]",array(
		                            '[ref]'=>$transaction_id
		                        ));
		                        $this->redirect(Yii::app()->createUrl('/'.APP_FOLDER.'/voguepay/success/?message='.$message )); 
			    		  	    Yii::app()->end();
	        	    		
			    				break;		
			    				
			    			default:
			    				break;	
				    	}
				    } else $error=mt("Failed getting transaction information");
				    	
				} else $error = mt('Failed getting merchant credentials');
			} else $error = mt("Failed getting order information");
		} else $error=mt("Payment Failed");
		
		if(!empty($error)){						
			$this->redirect(Yii::app()->createUrl('/'.APP_FOLDER.'/voguepay/error/?error='.$error )); 
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
		$error='';  $data=$_POST;	
		$reference_id = isset($_GET['reference_id'])?$_GET['reference_id']:'';
		$transaction_id = isset($data['transaction_id'])?$data['transaction_id']:'';
		if(isset($transaction_id)){
			if ($res = FunctionsV3::getOrderByToken($reference_id)){
				$merchant_id = $res['merchant_id'];
				$order_id = $res['order_id'];				
				if($credentials=FunctionsV3::GetVogueCredentials($merchant_id)){
					$is_demo=false;				    
				    if($credentials['merchant_id']=="demo"){
				    	$is_demo=true;
				    }	    		    
				    if ( $vog_res=voguepayClass::getTransaction($transaction_id,$is_demo)){
				    	if(isset($vog_res['response_message'])){
							$error = Yii::t("mobile2", "Payment failed reason : [reason]",array(
							  '[reason]'=>$vog_res['response_message']
							));
						} else $error = mt("Payment Failed");
				    } else $error=mt("Payment Failed");
				} else $error = mt('Failed getting merchant credentials');
			} else $error = mt("Failed getting order information");
		} else $error=mt("Payment Failed");
		
		echo $error;
	}
	
}
/*end class*/