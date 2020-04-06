<?php
class MercadopagoController extends CController
{
	public $layout='mobile_layout';
	
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
			if ($credentials = mercadopagoWrapper::getCredentials($merchant_id)){
				
				$success_url = websiteUrl()."/mobileapp/mercadopago/success?reference_id=".urlencode($reference_id)."&trans_type=$trans_type";
				$cancel_url = websiteUrl()."/mobileapp/mercadopago/cancel";
				$failure_url=$cancel_url;
				
				try {					
					$params=array(
					  'title'=>$payment_description,
					  'quantity'=>1,
					  'currency_id'=>FunctionsV3::getCurrencyCode(),
					  'unit_price'=>$amount_to_pay,
					  'email'=>$data['email_address'],
					  'external_reference'=>$reference_id,
					  'success'=>$success_url,
					  'failure'=>$failure_url,
					  'pending'=>$cancel_url,
					);		
										
					$resp = mercadopagoWrapper::createPayment($credentials,$params);			
					$this->redirect($resp);
			        Yii::app()->end();
					
				} catch (Exception $e){
			       $error = $e->getMessage();
		        }		
		        
			} else $error=t("invalid payment credentials");
		}
		
		if(!empty($error)){						
			$this->redirect(Yii::app()->createUrl('/mobileapp/mercadopago/error',array(
			   'error'=>$error
			))); 
		}
	}
	
	public function actionsuccess()
	{
		$db=new DbExt();
		$get = $_GET;$error = '';		
		$reference_id = isset($get['reference_id'])?$get['reference_id']:'';
		$trans_type = isset($get['trans_type'])?$get['trans_type']:'';			
		$merchant_order_id = isset($get['merchant_order_id'])?$get['merchant_order_id']:'';			
		
		if(!empty($reference_id)){
			if ($data = FunctionsV3::getOrderInfoByToken($reference_id)){				
				$merchant_id=isset($data['merchant_id'])?$data['merchant_id']:'';	
        	    $client_id = $data['client_id'];
        	    $order_id = $data['order_id'];
        	    
        	    if($credentials = mercadopagoWrapper::getCredentials($merchant_id)){
        	    	if($data['status']=="paid"){
        	    		echo "order status is already paid";
		    		  	Yii::app()->end();
        	    	} else {
	        	    	$resp = mercadopagoWrapper::getPaymentStatus($credentials,$reference_id);
	        	    	
	        	    	/*SEND EMAIL RECEIPT*/
			            AddonMobileApp::notifyCustomer($order_id);	
			            
			            FunctionsV3::updateOrderPayment($order_id,mercadopagoWrapper::paymentCode(),
	        	    	$merchant_order_id,$get,$reference_id);
	        	    	
	        	    	FunctionsV3::callAddons($order_id);
	        	    	
	        	    	echo Yii::t("mobile","payment successfull with payment reference id [ref]",array(
                            '[ref]'=>$merchant_order_id
                          ));
		    		  	Yii::app()->end();
        	    	}
        	    } else $error = t("invalid payment credentials");				
        	    
			} else $error = t("Failed getting order information");
		} else $error = t("invalid reference_id");		
		
		if(!empty($error)){						
			$this->redirect(Yii::app()->createUrl('/mobileapp/stripe/error',array(
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
/*END CLASS*/