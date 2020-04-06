<?php
require 'authorize-sdk/vendor/autoload.php';
use net\authorize\api\contract\v1 as AnetAPI;
use net\authorize\api\controller as AnetController;

class AuthorizePayWrapper
{
	static $mode;
	static $api;
	static $key;
	static $error;
	
    public static function Paynow($data='', $client_id='')
    {    	
    	$amount_to_pay  = number_format($data['total_w_tax'],2,'.','');
    	
    	$merchantAuthentication = new AnetAPI\MerchantAuthenticationType();
        $merchantAuthentication->setName(self::$api);
        $merchantAuthentication->setTransactionKey(self::$key);
                
        $creditCard = new AnetAPI\CreditCardType();    
        $creditCard->setCardNumber( $data['cc_number'] );
        $creditCard->setExpirationDate( $data['expiration_month']."-".$data['expiration_yr'] );
        $creditCard->setCardCode( $data['cvv'] );
           
        $paymentOne = new AnetAPI\PaymentType();
        $paymentOne->setCreditCard($creditCard);
        
        $payment_ref=Yii::app()->functions->generateRandomKey(6)."-".Yii::app()->functions->getLastIncrement('{{order}}');
        
        $order = new AnetAPI\OrderType();
        $order->setInvoiceNumber($payment_ref);
        $order->setDescription($data['paymet_desc']);
        
        // Set the customer's Bill To address
		$customerAddress = new AnetAPI\CustomerAddressType();
		$customerAddress->setFirstName(isset($data['x_first_name'])?$data['x_first_name']:'');
		$customerAddress->setLastName(isset($data['x_last_name'])?$data['x_last_name']:'');
		
		//$customerAddress->setCompany("");
	    $customerAddress->setAddress(isset($data['x_address'])?$data['x_address']:'');
	    $customerAddress->setCity(isset($data['x_city'])?$data['x_city']:'');
	    $customerAddress->setState(isset($data['x_state'])?$data['x_state']:'');
	    $customerAddress->setZip(isset($data['x_zip'])?$data['x_zip']:'');
	    $customerAddress->setCountry(isset($data['x_country'])?$data['x_country']:'');
	    
	    if($client_id>0){
		    if ($client_info = Yii::app()->functions->getClientInfo($client_id)){		    	
			    $customerData = new AnetAPI\CustomerDataType();
	            $customerData->setType("individual");
	            $customerData->setId($client_id);
	            $customerData->setEmail($client_info['email_address']);
		    }
	    }
	    
	    $duplicateWindowSetting = new AnetAPI\SettingType();
        $duplicateWindowSetting->setSettingName("duplicateWindow");
        $duplicateWindowSetting->setSettingValue("60");
        
        $transactionRequestType = new AnetAPI\TransactionRequestType();
	    $transactionRequestType->setTransactionType("authCaptureTransaction");
	    $transactionRequestType->setAmount($amount_to_pay);
	    $transactionRequestType->setOrder($order);
	    $transactionRequestType->setPayment($paymentOne);
	    $transactionRequestType->setBillTo($customerAddress);
	    $transactionRequestType->setCustomer($customerData);
	    $transactionRequestType->addToTransactionSettings($duplicateWindowSetting);
		    
	    $request = new AnetAPI\CreateTransactionRequest();
        $request->setMerchantAuthentication($merchantAuthentication);
        $request->setRefId($payment_ref);
        $request->setTransactionRequest($transactionRequestType);
            
        $controller = new AnetController\CreateTransactionController($request);
        if(self::$mode=="sandbox"){
        	$response = $controller->executeWithApiResponse(\net\authorize\api\constants\ANetEnvironment::SANDBOX);
        } else {
            $response = $controller->executeWithApiResponse(\net\authorize\api\constants\ANetEnvironment::PRODUCTION);	
        }    
                
        if ($response != null) {
        	$resp_code = $response->getMessages()->getResultCode();
        	if ($response->getMessages()->getResultCode() == "Ok") {
        		$tresponse = $response->getTransactionResponse();
        		if ($tresponse != null && $tresponse->getMessages() != null) {
        			$transaction_id = $tresponse->getTransId();
        			$resp_description = $tresponse->getMessages()[0]->getDescription();
        			
			        $raw_response = array(
        			  'resp_code'=>$resp_code,
        			  'transaction_id'=>$transaction_id,
        			  'resp_description'=>$resp_description
        			);
        			
        			$params_logs=array(			          
			          'payment_type'=>Yii::app()->functions->paymentCode('authorize'),
			          'raw_response'=>json_encode($raw_response),
			          'date_created'=>FunctionsV3::dateNow(),
			          'ip_address'=>$_SERVER['REMOTE_ADDR'],
			          'payment_reference'=>$transaction_id
			        );
			        
			        return $params_logs;
			        
        		} else {
        		   self::$error = t("Transaction Failed")."\n";
            	   self::$error.= $tresponse->getErrors()[0]->getErrorText();	
        		}        
        	} else {
        	   self::$error = t("Transaction Failed")."\n";
               $tresponse = $response->getTransactionResponse();
               if ($tresponse != null && $tresponse->getErrors() != null) {
               	   self::$error.= $tresponse->getErrors()[0]->getErrorText() . "\n";
               } else {
               	   self::$error.=  $response->getMessages()->getMessage()[0]->getText() . "\n";
               }        	
        	}        
        } else self::$error = t("No response returned");
        
        return false;
    }
    
} /*end class*/