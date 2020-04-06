<?php
class CronController extends CController
{
	
	public function actionIndex()
	{
		
	}
	
	public function actionProcesspush()
	{
		$iOSPush=new iOSPush;
		$DbExt=new DbExt; 

		$ring_tone_filename = 'beep';
		
		$ios_push_mode=Yii::app()->functions->getOptionAdmin('ios_push_mode');		
		$ios_push_mode=$ios_push_mode=="development"?false:true;
		
		$ios_passphrase=Yii::app()->functions->getOptionAdmin('ios_passphrase');
		$ios_push_dev_cer=Yii::app()->functions->getOptionAdmin('ios_push_dev_cer');
		$ios_push_prod_cer=Yii::app()->functions->getOptionAdmin('ios_push_prod_cer');
							
		$api_key=Yii::app()->functions->getOptionAdmin('mobile_android_push_key');		
		$msg_count=1;		
		
		$upload_push_icon = getOptionA('upload_push_icon');
		$mobileapp_enabled_push_picture=getOptionA('mobileapp_enabled_push_picture');		
		$upload_push_picture=getOptionA('upload_push_picture');
		
		$push_server_key = getOptionA('mobileapp_push_server_key');
				
		$stmt="SELECT a.*,
		b.app_version
		FROM
		{{mobile_push_logs}} a
		
		left join {{mobile_registered}} b
        ON
        a.client_id=b.client_id
        		
		WHERE
		a.status='pending'
		ORDER BY id ASC
		LIMIT 0,10
		";
		if($res=$DbExt->rst($stmt)){		   
		   foreach ($res as $val) {		
		   	   $status='';
		   	   $json_response='';
		   	   $record_id=$val['id'];		
		   	   		   	  		   	   	   	 
		   	   $device_id = trim($val['device_id']);
		   	   $device_platform = strtolower($val['device_platform']);
		   	   $app_version = $val['app_version'];
		   	   		   	   		   	  		   	  
		   	   switch ($device_platform) {
			   	
			   	 case "android":
			   	 	
			   	    if($app_version>=2.6){
				    					    	
				    	$data = array(
						  'title'=>$val['push_title'],
						  'body'=>$val['push_message'],
						  'vibrate'	=> 1,			
			              'soundname'=> 'beep',
			              'android_channel_id'=>"kmrs_channel",
			              'content-available'=>1,
			              'count'=>1,
			              'badge'=>1,
			              'push_type'=>$val['push_type']
						 );
						 
						 if(!empty($upload_push_icon)){
						   	 $data['image'] = AddonMobileApp::getImage($upload_push_icon);
					     }
					    				  
					     if ($mobileapp_enabled_push_picture==1 && !empty($upload_push_picture)){
					   	     $data['style']='picture';
					   	     $data['picture']=AddonMobileApp::getImage($upload_push_picture);			   	   
					     }
					    
						 if(isset($_GET['debug'])){
					       dump($data);
					     }
					     
						 if(!empty($push_server_key)){
							 try {
							 	$json_response = MobileFCMPush::pushAndroid($data,$device_id,$push_server_key);						 	
							 	$status='process';
							 } catch (Exception $e) {
				                $status = 'Caught exception:'. $e->getMessage();
				                $json_response = $status;
				                $status=substr( strip_tags($status) ,0,255);
			                 }
						 } else $status = 'server key is empty';
						 
				    } else {
				    	
				    	/*OLD DEVICE*/				    	
				    	$message=array(		 
						 'title'=>$val['push_title'],
						 'message'=>$val['push_message'],
						 'soundname'=>$ring_tone_filename,
						 'count'=>$msg_count,
						 'additionalData'=>array(
						   'push_type'=>$val['push_type']		   		 
						 )
					    );			
						
					    if(isset($_GET['debug'])){
					       dump($message);
					    }
				    	
				    	if(!empty($upload_push_icon)){
						   	  $message['image'] = AddonMobileApp::getImage($upload_push_icon);
					    }
					    				  
					    if ($mobileapp_enabled_push_picture==1 && !empty($upload_push_picture)){
					   	   $message['style']='picture';
					   	   $message['picture']=AddonMobileApp::getImage($upload_push_picture);			   	   
					    }
				    
					    if (!empty($api_key)){
				   	       $resp=AddonMobileApp::sendPush($val['device_platform'],$api_key,$val['device_id'],$message);
				   	       if (AddonMobileApp::isArray($resp)){
				   	       	   if(isset($_GET['debug'])){
				   	       	       dump($resp);
				   	       	   }
				   	       	   if( $resp['success']>0){			   	       	   	   
				   	       	   	   $status="process";
				   	       	   } else {		   	       	   	   
				   	       	   	   $status=$resp['results'][0]['error'];
				   	       	   }
				   	       } else $status="uknown push response";
					    } else $status="Invalid API Key";
				    }
				    			   	 	
			   	 	break;
			   	 				   	 	
			   	 case "ios":
			   	 	
			   	 	
			   	 	if($app_version>=2.6){
			   	 		
			   	 		try {
							 $data = array( 
						      'title' =>$val['push_title'],
						      'body' => $val['push_message'],
						      'sound'=>'beep.wav',
						      'android_channel_id'=>"kmrs_channel",
						      'badge'=>1,
						      'content-available'=>1,
						      'push_type'=>$val['push_type']
						    );			
						    
						    if(isset($_GET['debug'])){
					   	       dump($message);
					   	    }
				   	    			   
							$json_response = MobileFCMPush::pushIOS($data,$device_id,$push_server_key);
							$status='process';	
													
						} catch (Exception $e) {
							$status =  $e->getMessage();
							$json_response=$status;
							$status=substr( strip_tags($status) ,0,255);
						}		
			   	 		
			   	 	} else {
			   	 		
				   	    if(isset($_GET['debug'])){
				   	       dump($message);
				   	    }
				   	    			   	    
				   	    $iOSPush->pass_prase=$ios_passphrase;
				   	    $iOSPush->dev_certificate=$ios_push_dev_cer;
				   	    $iOSPush->prod_certificate=$ios_push_prod_cer;
				   	   		   				   	   			   	   
				   	    if ($resp=$iOSPush->push($val['push_message'],$val['device_id'],$ios_push_mode,$val['push_type'])){
				   	   	   $status="process";
				   	    } else $status=$iOSPush->get_msg();				   	    
			   	 	}
				    
			   	 	break;
			   }
			   			   
			   $params_update=array(
			     'status'=>empty($status)?"uknown status":$status,
			     'date_process'=>AddonMobileApp::dateNow(),
			     'json_response'=>json_encode($json_response)
			   );
			   
			   if(isset($_GET['debug'])){
			       dump($params_update);
			   }
			   
			   $DbExt->updateData('{{mobile_push_logs}}',$params_update,'id',$record_id);			   			   
		   }
		}  else {
			if(isset($_GET['debug'])){
			   echo "No records to process<br/>";
			}
		}
	} 		
	
	public function actionProcessBroadcast()
	{
		$DbExt=new DbExt; 
	    $stmt="
	    SELECT * FROM
	    {{mobile_broadcast}}
	    WHERE
	    status='pending'
	    ORDER BY broadcast_id ASC
	    LIMIT 0,1	    
	    ";
	    if ( $res=$DbExt->rst($stmt)){
	    	$res=$res[0];	    	
	    	$broadcast_id=$res['broadcast_id'];
	    	
	    	$and='';
	    	switch ($res['device_platform']) {
	    		case "1":	    			
	    		    //$and=" AND mobile_device_platform ='Android'";
	    		    $and=" AND device_platform IN ('Android','android') ";
	    			break;
	    	
	    		case "2":	
	    		   //$and=" AND mobile_device_platform ='iOS'";
	    		   $and=" AND device_platform IN ('ios','iOS') ";
	    		   break;  
	    		   
	    		default:
	    			break;
	    	}
	    	$stmt2="
	    	SELECT * FROM
	    	{{mobile_registered_view}}
	    	WHERE
	    	enabled_push='1'
	    	AND status in ('active')
	    	AND device_id !='' 
	    	$and   	
	    	";
	    	if ($res2=$DbExt->rst($stmt2)){
	    		foreach ($res2 as $val) {	    			
	    			$params=array(
	    			  'client_id'=>$val['client_id'],
	    			  'client_name'=>!empty($val['client_name'])?$val['client_name']:'no name',
	    			  'device_platform'=>$val['device_platform'],
	    			  'device_id'=>$val['device_id'],
	    			  'push_title'=>$res['push_title'],
	    			  'push_message'=>$res['push_message'],
	    			  'push_type'=>'campaign',
	    			  'date_created'=>AddonMobileApp::dateNow(),
	    			  'ip_address'=>$_SERVER['REMOTE_ADDR'],
	    			  'broadcast_id'=>$res['broadcast_id']
	    			);
	    			if(isset($_GET['debug'])){
	    			   dump($params);
	    			}
	    			$DbExt->insertData("{{mobile_push_logs}}",$params);
	    		}
	    		if(isset($_GET['debug'])){
	    		   dump("Finish");
	    		}
	    	}
	    	
	    	$params_update=array('status'=>"process");
	    	$DbExt->updateData('{{mobile_broadcast}}',$params_update,'broadcast_id',$broadcast_id);
	    	
	    } else {
	    	if(isset($_GET['debug'])){
	    	   echo 'No records to process';
	    	}
	    }
	}
	
}/* end class*/