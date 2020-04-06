<?php

$enabled_push = getOptionA('order_request_cancel_to_customer_push');
$subject = getOptionA("order_request_cancel_to_customer_push_title_$lang");
$tpl = getOptionA("order_request_cancel_to_customer_push_content_$lang");

if($enabled_push==1 && !empty($tpl)){
	$pattern=array(
	   'customer_name'=>'customer_name',
	   'order_id'=>'order_id',
	   'restaurant_name'=>'restaurant_name',
	   'total_amount'=>'total_w_tax',
	   'order_status'=>'order_status',
	   'sitename'=>$website_title,
	   'siteurl'=>$website_url,
	   'remarks'=>$val['remarks'],
	   'request_status'=>'order_status'
	);	
	$subject=FunctionsV3::replaceTemplateTags($subject,$pattern,$val);
	$tpl=FunctionsV3::replaceTemplateTags($tpl,$pattern,$val);
	
	/*LOOP TRU DEVICE ID*/
	if ($customer = mobileWrapper::getAllDeviceByClientID($val['client_id'],$trigger_id)){
		//dump("CUSTOMER RESULT");
		foreach ($customer as $customer_val) {		    			
			$params = array(
			  'trigger_id'=>$trigger_id,
			  'client_id'=>!empty($val['client_id'])?$val['client_id']:'',
			  'client_name'=>!empty($val['customer_name'])?$val['customer_name']:'',
			  'device_platform'=>!empty($val['device_platform'])?$val['device_platform']:'',
			  'device_id'=>!empty($val['device_id'])?$val['device_id']:'',
			  'device_uiid'=>!empty($val['device_uiid'])?$val['device_uiid']:'',
			  'push_title'=>!empty($subject)?$subject:'',
			  'push_message'=>!empty($tpl)?$tpl:'',
			  'date_created'=>FunctionsV3::dateNow(),
			  'ip_address'=>$_SERVER['REMOTE_ADDR']
			);
			$db->insertData("{{mobile2_push_logs}}",$params);
		}		
		$error = "process";		
	} else $error = "no customer device registered";	
} else $error = "ORDER_REQUEST_CANCEL_TO_CUSTOMER template is not properly set in admin -> notification template";