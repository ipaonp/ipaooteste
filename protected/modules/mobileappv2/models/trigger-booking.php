<?php
$enabled=getOptionA('booking_update_status_push');   	   	   	   
$push_title=getOptionA("booking_update_status_push_title_$lang"); 
$tpl=getOptionA("booking_update_status_push_content_$lang"); 

if($enabled==1 && !empty($push_title)){
	if($booking = FunctionsV3::getBookingByIDWithDetails($val['order_id'])){
		
	   $pattern=array(		    
		   'customer_name'=>"booking_name",
		   'restaurant_name'=>'restaurant_name',	
		   'number_guest'=>'number_guest',
		   'date_booking'=>'date_booking',
		   'time'=>"booking_time",
		   'email'=>"email",
		   'mobile'=>"mobile",
		   'instruction'=>"booking_notes",
		   'booking_id'=>"booking_id",
		   'status'=>'status',
		   'merchant_remarks'=>'booking_notes',
		   'sitename'=>getOptionA('website_title'),
		   'siteurl'=>websiteUrl(),	 		    	   
	  );
	  $push_title=FunctionsV3::replaceTemplateTags($push_title,$pattern,$booking);
	  $tpl=FunctionsV3::replaceTemplateTags($tpl,$pattern,$booking);    	 

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
				  'push_title'=>!empty($push_title)?$push_title:'',
				  'push_message'=>!empty($tpl)?$tpl:'',
				  'date_created'=>FunctionsV3::dateNow(),
				  'ip_address'=>$_SERVER['REMOTE_ADDR']
				);			
				$db->insertData("{{mobile2_push_logs}}",$params);
			}		
			$error = "process";		
		} else $error = "no customer device registered";		 
	} else $error = "Booking id not found";
} else $error = "BOOKING_UPDATE_STATUS template is not properly set in admin -> notification template";