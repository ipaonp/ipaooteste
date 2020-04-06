<?php
$enabled = getOptionA("order_status_".$status."_push");	  
$tpl = getOptionA("order_status_".$status."_push_content_$lang"); 
$subject = getOptionA("order_status_".$status."_push_title_$lang");				

if($enabled==1 && !empty($subject)) {
	$pattern=array(
	   'customer_name'=>'customer_name',
	   'order_id'=>'order_id',
	   'restaurant_name'=>'restaurant_name',
	   'total_amount'=>'total_w_tax',
	   'order_status'=>'order_status',
	   'sitename'=>$website_title,
	   'siteurl'=>$website_url,
	   'remarks'=>$val['remarks']
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
			  'device_platform'=>!empty($customer_val['device_platform'])?$customer_val['device_platform']:'',
			  'device_id'=>!empty($customer_val['device_id'])?$customer_val['device_id']:'',
			  'device_uiid'=>!empty($customer_val['device_uiid'])?$customer_val['device_uiid']:'',
			  'push_title'=>!empty($subject)?$subject:'',
			  'push_message'=>!empty($tpl)?$tpl:'',
			  'date_created'=>FunctionsV3::dateNow(),
			  'ip_address'=>$_SERVER['REMOTE_ADDR']
			);
			//dump($params);
			$db->insertData("{{mobile2_push_logs}}",$params);
		}
		
		$error = "process";
		
	} else $error = "no customer device registered";
} else $error = "order_status_".$status. " " ."template is not properly set in admin -> notification template";
