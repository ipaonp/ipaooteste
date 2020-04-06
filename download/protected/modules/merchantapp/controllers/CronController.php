<?php
class CronController extends CController
{
	
	public function init()
	{		
		 // set website timezone
		 $website_timezone=Yii::app()->functions->getOptionAdmin("website_timezone");		 
		 if (!empty($website_timezone)){		 	
		 	Yii::app()->timeZone=$website_timezone;
		 }		 		 
	}
	
	public function actionIndex()
	{
		
	}
		
	public function actionProcesspush()
	{
		$iOSPush=new iOSPush;
		$DbExt=new DbExt; 
		
		$push_server_key = getOptionA('merchantapp_push_server_key');		
		$channel = 'kmrs_merchant_channel';
		
		$stmt="SELECT * FROM
		{{mobile_merchant_pushlogs}}
		WHERE
		status='pending'
		ORDER BY id ASC
		LIMIT 0,10
		";
		if(isset($_GET['debug'])){
			dump($stmt);
		}
		if($res=$DbExt->rst($stmt)){		   
		   foreach ($res as $val) {		
		   	
		   	  if(isset($_GET['debug'])){
		   	     dump($val);
		   	  }
		   	  		   	  
		   	  $status=''; $json_response = array();
		   	  
		   	  $record_id=$val['id'];
		   	  $device_id = trim($val['device_id']);
		   	  $device_platform = strtolower($val['device_platform']);
		   	  
		   	  switch ($device_platform) {
		   	  	 case "android":
		   	  	 	
		   	  	 	$data = array(
					  'title'=>$val['push_title'],
					  'body'=>$val['push_message'],
					  'vibrate'	=> 1,			
		              'soundname'=> 'beep',
		              'android_channel_id'=>$channel,
		              'content-available'=>1,
		              'count'=>1,
		              'badge'=>1,
		              'push_type'=>$val['push_type']
					);					
					if(!empty($push_server_key)){
						 try {
						 	$json_response = MobileFCMPush::pushAndroid($data,$device_id,$push_server_key);						 	
						 	$status='process';
						 } catch (Exception $e) {
			                $status = 'Caught exception:'. $e->getMessage();
		                 }
					 } else $status = 'server key is empty';
		   	  	 	
		   	  	 	break;
		   	  	 	
		   	  	 case "ios":
		   	  	 	
		   	  	 	try {
						 $data = array( 
					      'title' =>$val['push_title'],
					      'body' => $val['push_message'],
					      'sound'=>'beep.wav',
					      'android_channel_id'=>$channel,
					      'badge'=>1,
					      'content-available'=>1,
					      'push_type'=>$val['push_type']
					    );					    					   
						$json_response = MobileFCMPush::pushIOS($data,$device_id,$push_server_key);
						$status='process';	
												
					} catch (Exception $e) {
						$status =  $e->getMessage();
					}		
						
		   	  	 	break;	
		   	  	 	
		   	  	 default:
		   	  	 	$status='invalid device platform';
		   	  	 	break;
		   	  }
		   	  
		   	  if(!empty($status)){
		   	  	$status=substr( strip_tags($status) ,0,255);
		   	  }
		   	  
			  $params_update=array(
			     'status'=>empty($status)?"uknown status":$status,
			     'date_process'=>FunctionsV3::dateNow(),
			     'json_response'=>json_encode($json_response)
			  );			  
			  if(isset($_GET['debug'])){
		   	     dump($params_update);
		   	  }
			  $DbExt->updateData('{{mobile_merchant_pushlogs}}',$params_update,'id',$record_id);			   			   
		   }
		}  else {
			if(isset($_GET['debug'])){echo "No records to process<br/>";}
		}
	} 	

	public function actiongetunopen()
	{
		$app_enabled_alert  = getOptionA('merchant_app_enabled_alert');
		if($app_enabled_alert!=1){
			die("alert not enabled");
		}
		
		$db=new DbExt();
		$stmt="
    	      SELECT 
    	      a.merchant_id,
    	      a.order_id,
    	      count(*) as total_unopen
    	      FROM
    	      {{order}} a
    	      WHERE 1
    	      AND date_created like '".date('Y-m-d')."%'    	      
    	      AND merchantapp_viewed<=0 
    	      AND status NOT IN ('".initialStatus()."')
    	      ORDER BY date_created DESC
    	      LIMIT 0,10
    	";    
		if($res=$db->rst($stmt)){
			foreach ($res as $val) {				
				if($val['total_unopen']>0){
				   $this->sendUnOpeniOS($val['merchant_id'],$val['order_id'],$val['total_unopen']);
				}
			}
		}
		unset($db);
	}
	
	private function sendUnOpeniOS($merchant_id='', $order_id='', $total_unopen='')
	{		
		$db=new DbExt();
		$stmt="
		SELECT * FROM
		{{mobile_device_merchant}}
		WHERE
		device_platform='iOS'
		AND merchant_id=".FunctionsV3::q($merchant_id)."
		AND app_status='1'
		AND status='active'
		AND enabled_push='1'
		";
		//dump($stmt);
		if($res = $db->rst($stmt)){
			foreach ($res as $val) {
				//dump($val);
				$push_title = Yii::t("merchantapp-backend","[total] New Order has been placed.",array(
				  '[total]'=>$total_unopen
				));
				$push_message =  Yii::t("merchantapp-backend","Order id #[order_id]",array(
				  '[order_id]'=>$order_id
				));
				
				$params = array(
				  'merchant_id'=>$val['merchant_id'],
				  'user_type'=>$val['user_type'],
				  'merchant_user_id'=>isset($val['merchant_user_id'])?$val['merchant_user_id']:0,
				  'device_platform'=>$val['device_platform'],
				  'device_id'=>$val['device_id'],
				  'push_title'=>$push_title,
				  'push_message'=>$push_message,
				  'order_id'=>$order_id,
				  'date_created'=>FunctionsV3::dateNow(),
				  'ip_address'=>$_SERVER['REMOTE_ADDR']
				);
				//dump($params);
				$db->insertData("{{mobile_merchant_pushlogs}}",$params);
			}
		}
		unset($db);
		
		FunctionsV3::fastRequest(FunctionsV3::getHostURL().Yii::app()->createUrl("merchantapp/cron/processpush"));
	}
	
}/* end class*/