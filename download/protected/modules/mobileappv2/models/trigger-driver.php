<?php
$key = $val['order_status'];
$enabled_push=getOptionA($key."_PUSH");
$message=getOptionA($key."_PUSH_TPL");

if($enabled_push==1 && !empty($message)){
	if($info = mobileWrapper::getTaskViewByOrderID($order_id)){
		
		$message=FunctionsV3::smarty('TaskID',$info['task_id'],$message);
		$message=FunctionsV3::smarty('CustomerName',$info['customer_name'],$message);
		$message=FunctionsV3::smarty('CustomerAddress',$info['delivery_address'],$message);
		$message=FunctionsV3::smarty('DeliveryDateTime',FunctionsV3::prettyDate($info['delivery_date']),$message);
		$message=FunctionsV3::smarty('PickUpDateTime',FunctionsV3::prettyDate($info['delivery_date']),$message);
		$message=FunctionsV3::smarty('DriverName',$info['driver_name'],$message);
		$message=FunctionsV3::smarty('DriverPhone',$info['driver_phone'],$message);
		$message=FunctionsV3::smarty('OrderNo',$info['order_id'],$message);
		$message=FunctionsV3::smarty('CompanyName',$website_title,$message);				
		
		$push_title =  str_replace("_"," ",$key);					
		$push_title = mt($push_title);
								
		if ($customer = mobileWrapper::getAllDeviceByClientID($val['client_id'],$trigger_id)){			
			foreach ($customer as $customer_val) {		    			
    			$params = array(
    			  'trigger_id'=>$trigger_id,
    			  'client_id'=>!empty($val['client_id'])?$val['client_id']:'',
    			  'client_name'=>!empty($val['customer_name'])?$val['customer_name']:'',
    			  'device_platform'=>!empty($customer_val['device_platform'])?$customer_val['device_platform']:'',
    			  'device_id'=>!empty($customer_val['device_id'])?$customer_val['device_id']:'',
    			  'device_uiid'=>!empty($customer_val['device_uiid'])?$customer_val['device_uiid']:'',
    			  'push_title'=>!empty($push_title)?$push_title:'',
    			  'push_message'=>!empty($message)?$message:'',
    			  'date_created'=>FunctionsV3::dateNow(),
    			  'ip_address'=>$_SERVER['REMOTE_ADDR']
    			);    			
    			$db->insertData("{{mobile2_push_logs}}",$params);
    		}    		
    		$error = "process";    		
		} else $error = "no customer device registered";
			
	} else $error = "order id not found";
} else $error = $key. " " ."template is not properly set in driver panel -> notifications";