<?php
class CronController extends CController
{

	public function __construct()
	{				
		$website_timezone=getOptionA('website_timezone');
	    if (!empty($website_timezone)){
	 	   Yii::app()->timeZone=$website_timezone;
	    }		
	}		
	
	public function actionIndex()
	{
		echo 'cron is working';
	}
	
	public function actionProcessBroadcast()
	{
		dump("running ProcessBroadcast...");
		
		$db = new DbExt();
		$stmt="
		SELECT * FROM
		{{mobile2_broadcast}}
		WHERE status='pending'
		LIMIT 0,1
		";
		if($res = $db->rst($stmt)){
		   $res = $res[0];		   
		   $broadcast_id=$res['broadcast_id'];
		   $push_title=$res['push_title'];
		   $push_message=$res['push_message'];
		   
		   $date_created  = FunctionsV3::dateNow();
		   $ip_address = $_SERVER['REMOTE_ADDR'];
		   
	       $and='';
	       switch ($res['device_platform']) {
    		case "1":	    				    		    
    		    $and=" AND a.device_platform IN ('Android','android') ";
    			break;
    	
    		case "2":		    		   
    		   $and=" AND a.device_platform IN ('ios','iOS') ";
    		   break;  
    		   
    		default:
    			break;
	       }
	       
	       $and.=" 
	    	  AND a.client_id NOT IN (
	    	  select client_id from {{mobile2_push_logs}}
	    	  where client_id=a.client_id
	    	  and broadcast_id=".FunctionsV3::q($broadcast_id)."
	    	)
	    	";

	       $stmt2="
	        INSERT INTO {{mobile2_push_logs}} 
	        (
		        broadcast_id,		        
		        client_id,
		        client_name,
		        device_platform,
		        device_id,
		        push_title,
		        push_message,
		        date_created,
		        ip_address
	        )	    	
	        SELECT
	        ".FunctionsV3::q($broadcast_id).",
	        a.client_id,
	        concat(b.first_name,' ',b.last_name),
	        a.device_platform,
	        a.device_id,
	        ".FunctionsV3::q($push_title).",
	        ".FunctionsV3::q($push_message).",
	        ".FunctionsV3::q($date_created).",
	        ".FunctionsV3::q($ip_address)."
	        FROM {{mobile2_device_reg}} a
	        LEFT JOIN {{client}} b
	        ON
	        a.client_id = b.client_id
	        
	        WHERE a.push_enabled='1'
	        AND a.push_enabled='1'
	    	AND a.status in ('active')
	    	AND a.device_id !='' 
	    	$and
	    	";    	       
	        if(isset($_GET['debug'])){
	           dump($stmt2);	    
	        }
	        $db->qry($stmt2);
	        
	        $params_update=array(
	          'status'=>"process",
	          'date_modified'=>FunctionsV3::dateNow(),	          
	        );
	        $db->updateData('{{mobile2_broadcast}}',$params_update,'broadcast_id',$broadcast_id);
	        
		} else {
			if(isset($_GET['debug'])){
			   echo 'no records to process';
			}
		}
	}
	
	public function actionprocesspush()
	{		
		dump("running processpush...");
		
		$server_key = getOptionA('mobileapp2_push_server_key');
		$push_icon = getOptionA('android_push_icon');
		
		$pushpic = '';
		$enabled_pushpic = getOptionA('android_enabled_pushpic');
		if($enabled_pushpic==1){		   
			$pushpic = getOptionA('android_push_picture');
		}
		
		$process_date = FunctionsV3::dateNow();
		$channel_id = 'mobile2_channel';
		
		$db = new DbExt();
		$stmt="
		SELECT * FROM
		{{mobile2_push_logs}}
		WHERE status='pending'		
		ORDER BY id ASC		
		LIMIT 0,20
		";
		if($res = $db->rst($stmt)){
			foreach ($res as $val) {
				$process_status=''; $json_response='';
			    $device_id = $val['device_id'];
				
			    switch (strtolower($val['device_platform'])) {
			    	case "android":
			    		$data = array(
						  'title'=>$val['push_title'],
						  'body'=>$val['push_message'],
						  'vibrate'	=> 1,			
			              'soundname'=> 'beep',
			              'android_channel_id'=>$channel_id,
			              'content-available'=>1,
			              'count'=>1,			              
			              'badge'=>1,
			              'push_type'=>$val['push_type']
						 );			
						 if(!empty($push_icon)){
						 	$data['image'] = mobileWrapper::getImage($push_icon);
						 }			 
						 
						 if($enabled_pushpic==1 && !empty($pushpic)){
						 	$data['style'] ="picture";
						 	$data['picture'] = mobileWrapper::getImage($pushpic);
						 }
						 
						 if(!empty($server_key)){
						 	 try {
							 	$json_response = fcmPush::pushAndroid($data,$device_id,$server_key);						 	
							 	$process_status='process';
							 } catch (Exception $e) {
				                $process_status = 'Caught exception:'. $e->getMessage();
			                 }
						 } else $process_status = 'server key is empty';
			    		break;
			    		
			    	case "ios":
			    		try {
							 $data = array( 
						      'title' =>$val['push_title'],
						      'body' => $val['push_message'],
						      'sound'=>'beep.wav',
						      'android_channel_id'=>$channel_id,
						      'badge'=>1,
						      'content-available'=>1,
						      'push_type'=>$val['push_type']
						    );						   
							$json_response = fcmPush::pushIOS($data,$device_id,$server_key);
							$process_status='process';							
						} catch (Exception $e) {
							$process_status =  $e->getMessage();
						}		
			    		break;
			    		
			    	default:
			    		$process_status='undefined device platform'; 
			    		break;		
			    }
			    
			    if(!empty($process_status)){
		   	  	   $process_status=substr( strip_tags($process_status) ,0,255);
		   	    } 	
		   	    $params = array(
				  'status'=>$process_status,
				  'date_process'=>$process_date,
				  'json_response'=>json_encode($json_response)
				);				
				$db->updateData("{{mobile2_push_logs}}",$params,'id',$val['id']);
			    
			} /*end foreach*/
		} else {
			if(isset($_GET['debug'])){
			   echo 'no records to process';
			}
		}
	}
	
	public function actiontriggerorder()
	{
		dump("running triggerorder...");
		$db = new DbExt();
		$stmt="
		SELECT
		a.trigger_id,
		a.trigger_type,
		a.order_id,
		a.order_status,
		a.remarks,	
		a.status,
		a.language,
		b.order_id as b_order_id,
		b.client_id,
		b.merchant_id,
		concat(c.first_name,' ',c.last_name) as customer_name,
		d.restaurant_name
		
		FROM {{mobile2_order_trigger}} a
		left join {{order}} b
		ON a.order_id = b.order_id
		
		left join {{client}} c
		ON b.client_id = c.client_id
		
		left join {{merchant}} d
		ON b.merchant_id = d.merchant_id
		
		WHERE 
		a.status='pending'
		ORDER BY trigger_id ASC
		LIMIT 0,1
		";
		
		$website_title = getOptionA('website_title');
		$website_url = websiteUrl(); 
		$error='';
		
		
		if($res = $db->rst($stmt)){
			foreach ($res as $val) {
				
				$trigger_id = $val['trigger_id'];
				$lang = $val['language'];
				$status = $val['order_status'];
				$order_id = $val['order_id'];
								
				switch ($val['trigger_type']) {
					case "driver":						
					    require "trigger-driver.php";
						break;
						
					case "order":
						require "trigger-order.php";
						break;	
						
					case "order_request_cancel":
						require "trigger-cancel-order.php";
						break;	
						
					case "booking":	
					    require "trigger-booking.php";
					break;	
				
					default:
						$error = "invalid trigger type";						
						break;
				}				
						    			    	
		    	$params_update = array(
		    	  'status'=>$error,
		    	  'date_process'=>FunctionsV3::dateNow(),
		    	  'ip_address'=>$_SERVER['REMOTE_ADDR']
		    	);
		    	$db->updateData("{{mobile2_order_trigger}}",$params_update,'trigger_id',$trigger_id);		    	
		    	FunctionsV3::fastRequest(FunctionsV3::getHostURL().Yii::app()->createUrl(APP_FOLDER."/cron/processpush"));
		    			    	
			} /*end foreach*/
		} else {
		    dump("no records to process");
		}
	}
	
	public function actiongetfbavatar()
	{
		dump("running getfbavatar...");
		
		$db = new DbExt();
		$stmt="
		SELECT client_id,avatar,social_id
		FROM {{client}}
		WHERE avatar =''
		AND social_id !=''
		AND social_strategy ='fb_mobile'
		LIMIT 0,2
		";
		if($res = $db->rst($stmt)){
			foreach ($res as $val) {				
				$params = array();
				$client_id = $val['client_id'];
				if($avatar = FunctionsV3::saveFbAvatarPicture($val['social_id'])){
				   $params['avatar'] = $avatar;
				} else $params['avatar'] = "avatar.jpg";
				$params['date_modified']=FunctionsV3::dateNow();
				$params['ip_address']=$_SERVER['REMOTE_ADDR'];				
				$db->updateData('{{client}}',$params,'client_id',$client_id);
			}
		} else {
			if(isset($_GET['debug'])){
			   echo 'no records to process';
			}	
		}
	}	
	
	public function actionRemoveInActiveDevice()
	{
		dump("running RemoveInActiveDevice...");
		
		$date_now=date('Y-m-d g:i:s a');
		$days_inactive = 30;
		
		$db = new DbExt();
		$stmt="
		SELECT * FROM
		{{mobile2_device_reg}}
		WHERE status ='active'
		ORDER BY date_created ASC
		LIMIT 0,20
		";
		if($res = $db->rst($stmt)){
			foreach ($res as $val) {				
				$time=date("Y-m-d g:i:s a",strtotime($val['date_created']));	
				$date_diff=Yii::app()->functions->dateDifference($time,$date_now);				
				if (is_array($date_diff) && count($date_diff)>=1){					
					if($date_diff['days']>=$days_inactive){						
						$db->updateData("{{mobile2_device_reg}}",array(
								  'status'=>'deactivated',
								  'date_modified'=>FunctionsV3::dateNow()
								),'id',$val['id']);
					}
				}
			}
		}
	}
	
}
/*end class*/