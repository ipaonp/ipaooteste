<?php
require_once('mobileWrapper.php');

class AjaxController extends CController
{
	public $code=2;
	public $msg;
	public $details;
	public $data;
	
	public function __construct()
	{
		$this->data=$_POST;	
		
		FunctionsV3::handleLanguage();
	    $lang=Yii::app()->language;	    	   
	    if(isset($_GET['debug'])){
	       dump($lang);
	    }
	}
	
	public function beforeAction($action)
	{		
		if(!Yii::app()->functions->isAdminLogin()){
		   $this->redirect(Yii::app()->createUrl('/admin/noaccess'));
		   Yii::app()->end();		
		}				
		return true;
	}
	
	public function t($words='' , $params=array())
	{
		return mobileWrapper::t($words,$params);
	}
	
	private function jsonResponse()
	{
		$resp=array('code'=>$this->code,'msg'=>$this->msg,'details'=>$this->details);
		echo CJSON::encode($resp);
		Yii::app()->end();
	}
	
	private function otableNodata()
	{
		if (isset($_GET['draw'])){
			$feed_data['draw']=$_GET['draw'];
		} else $feed_data['draw']=1;	   
		     
        $feed_data['recordsTotal']=0;
        $feed_data['recordsFiltered']=0;
        $feed_data['data']=array();		
        echo json_encode($feed_data);
    	die();
	}

	private function otableOutput($feed_data='')
	{
	  echo json_encode($feed_data);
	  die();
    }
    
    public function actionsavesettings()
    {
    
    	Yii::app()->functions->updateOptionAdmin('mobileapp2_api_has_key',
		isset($this->data['mobileapp2_api_has_key'])? trim($this->data['mobileapp2_api_has_key']) :''
		);
			
    	$this->code=1;
	    $this->msg=$this->t("settings saved");
		$this->jsonResponse();	
    }
    
    public function actionsavesettings_app()
    {
    	Yii::app()->functions->updateOptionAdmin('mobileapp2_language',
		isset($this->data['mobileapp2_language'])?$this->data['mobileapp2_language']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_select_map',
		isset($this->data['mobileapp2_select_map'])?$this->data['mobileapp2_select_map']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_location_accuracy',
		isset($this->data['mobileapp2_location_accuracy'])?$this->data['mobileapp2_location_accuracy']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobile2_home_offer',
		isset($this->data['mobile2_home_offer'])?$this->data['mobile2_home_offer']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobile2_home_featured',
		isset($this->data['mobile2_home_featured'])?$this->data['mobile2_home_featured']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobile2_home_cuisine',
		isset($this->data['mobile2_home_cuisine'])?$this->data['mobile2_home_cuisine']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobile2_home_all_restaurant',
		isset($this->data['mobile2_home_all_restaurant'])?$this->data['mobile2_home_all_restaurant']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_merchant_list_type',
		isset($this->data['mobileapp2_merchant_list_type'])?$this->data['mobileapp2_merchant_list_type']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_merchant_menu_type',
		isset($this->data['mobileapp2_merchant_menu_type'])?$this->data['mobileapp2_merchant_menu_type']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobile2_disabled_default_image',
		isset($this->data['mobile2_disabled_default_image'])?$this->data['mobile2_disabled_default_image']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_distance_results',
		isset($this->data['mobileapp2_distance_results'])?$this->data['mobileapp2_distance_results']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobile2_search_data',
		isset($this->data['mobile2_search_data'])?json_encode($this->data['mobile2_search_data']):''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobile2_enabled_menu_carousel',
		isset($this->data['mobile2_enabled_menu_carousel'])?$this->data['mobile2_enabled_menu_carousel']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_order_processing',
		isset($this->data['mobileapp2_order_processing'])?json_encode($this->data['mobileapp2_order_processing']):''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_order_completed',
		isset($this->data['mobileapp2_order_completed'])?json_encode($this->data['mobileapp2_order_completed']):''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_order_cancelled',
		isset($this->data['mobileapp2_order_cancelled'])?json_encode($this->data['mobileapp2_order_cancelled']):''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobile2_home_favorite_restaurant',
		isset($this->data['mobile2_home_favorite_restaurant'])?$this->data['mobile2_home_favorite_restaurant']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobile2_show_only_current_location',
		isset($this->data['mobile2_show_only_current_location'])?$this->data['mobile2_show_only_current_location']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobile2_enabled_dish',
		isset($this->data['mobile2_enabled_dish'])?$this->data['mobile2_enabled_dish']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_turnoff_prefix',
		isset($this->data['mobileapp2_turnoff_prefix'])?$this->data['mobileapp2_turnoff_prefix']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_reg_email',
		isset($this->data['mobileapp2_reg_email'])?$this->data['mobileapp2_reg_email']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_reg_phone',
		isset($this->data['mobileapp2_reg_phone'])?$this->data['mobileapp2_reg_phone']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_prefix',
		isset($this->data['mobileapp2_prefix'])?$this->data['mobileapp2_prefix']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_tracking_theme',
		isset($this->data['mobileapp2_tracking_theme'])?$this->data['mobileapp2_tracking_theme']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_tracking_interval',
		isset($this->data['mobileapp2_tracking_interval'])?$this->data['mobileapp2_tracking_interval']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobile2_disabled_image_menu1',
		isset($this->data['mobile2_disabled_image_menu1'])?$this->data['mobile2_disabled_image_menu1']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobile2_home_banner',
		isset($this->data['mobile2_home_banner'])?$this->data['mobile2_home_banner']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_cart_auto_address',
		isset($this->data['mobileapp2_cart_auto_address'])?$this->data['mobileapp2_cart_auto_address']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_cart_theme',
		isset($this->data['mobileapp2_cart_theme'])?$this->data['mobileapp2_cart_theme']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_search_mode',
		isset($this->data['mobileapp2_search_mode'])?$this->data['mobileapp2_search_mode']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_future_order_confirm',
		isset($this->data['mobileapp2_future_order_confirm'])?$this->data['mobileapp2_future_order_confirm']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_custom_pages_position',
		isset($this->data['mobileapp2_custom_pages_position'])?$this->data['mobileapp2_custom_pages_position']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobile2_home_banner_full',
		isset($this->data['mobile2_home_banner_full'])?$this->data['mobile2_home_banner_full']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobile2_enabled_addon_desc',
		isset($this->data['mobile2_enabled_addon_desc'])?$this->data['mobile2_enabled_addon_desc']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_enabled_contact',
		isset($this->data['mobileapp2_enabled_contact'])?$this->data['mobileapp2_enabled_contact']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_remove_contact',
		isset($this->data['mobileapp2_remove_contact'])?$this->data['mobileapp2_remove_contact']:''
		);
		
    	$this->code=1;
	    $this->msg=$this->t("settings saved");
		$this->jsonResponse();	
    }
    
    public function actionsavesettings_social()
    {
    	Yii::app()->functions->updateOptionAdmin('mobile2_enabled_fblogin',
		isset($this->data['mobile2_enabled_fblogin'])?$this->data['mobile2_enabled_fblogin']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobile2_enabled_googlogin',
		isset($this->data['mobile2_enabled_googlogin'])?$this->data['mobile2_enabled_googlogin']:''
		);
		
    	$this->code=1;
	    $this->msg=$this->t("settings saved");
		$this->jsonResponse();	
    }
    
    public function actionsavesettings_analytics()
    {    	
    	Yii::app()->functions->updateOptionAdmin('mobile2_analytics_enabled',
		isset($this->data['mobile2_analytics_enabled'])?$this->data['mobile2_analytics_enabled']:''
		);
		Yii::app()->functions->updateOptionAdmin('mobile2_analytics_id',
		isset($this->data['mobile2_analytics_id'])?$this->data['mobile2_analytics_id']:''
		);
    	$this->code=1;
	    $this->msg=$this->t("settings saved");
		$this->jsonResponse();	
    }
    
    public function actionsavesettings_fcm()
    {
    	Yii::app()->functions->updateOptionAdmin('mobileapp2_push_server_key',
		isset($this->data['mobileapp2_push_server_key'])?$this->data['mobileapp2_push_server_key']:''
		);
		
    	$this->code=1;
	    $this->msg=$this->t("settings saved");
		$this->jsonResponse();	
    }
    
    public function actionuploadFile()
    {
    	require_once('SimpleUploader.php');
    	if ( !Yii::app()->functions->isAdminLogin()){
			$this->msg = t("Session has expired");
			$this->jsonResponse();
		}
		
		$path_to_upload  = mobileWrapper::uploadPath();
		
		$valid_extensions = FunctionsV3::validImageExtension();        
		$Upload = new FileUpload('uploadfile');
		$ext = $Upload->getExtension();
		$time=time();
        $filename = $Upload->getFileNameWithoutExt();       
        $new_filename =  "$time-$filename.$ext";
        $Upload->newFileName = $new_filename;
        $Upload->sizeLimit = FunctionsV3::imageLimitSize();
        $result = $Upload->handleUpload($path_to_upload, $valid_extensions); 
	    if (!$result) {
	    	 $this->msg=$Upload->getErrorMsg();
	    } else {
	    	
	    	 $fields = ''; $remove_class='remove_picture';
	    	 if($_GET['id']=="multi_upload"){
	    	 	$remove_class='multi_remove_picture';
	    	 	$fields = '<input type="hidden" name="'.$_GET['field_name'].'[]" value="'.$new_filename.'" > ';
	    	 }
	    	
	    	 $class_name = "preview_".$_GET['id'];
	    	 $html_preview='	    	 
	    	 <div class="card '.$class_name.'" style="width: 10rem;">
				<img class="img-thumbnail" src="'.websiteUrl()."/upload/$new_filename".'" >
				
				<div class="card-body">
				  <a href="javascript:;" data-id="'.$_GET['id'].'" 
				  data-fieldname="'.$_GET['field_name'].'" 
				  class="card-link '.$remove_class.'">'.mobileWrapper::t("Remove Image").'</a>
				</div>
				
				'.$fields.'
				
			 </div>			 
			 <div class="height10"></div>
	    	 ';
	    	 	    	 
	    	 
	    	 $this->code = 1;
	    	 $this->msg="OK";
	    	 $this->details=array(
	    	   'file_name'=>$new_filename,
	    	   'file_url'=>websiteUrl()."/upload/$new_filename",
	    	   'html_preview'=>$html_preview
	    	 );
	    }
	    $this->jsonResponse();
    }
    
    public function actionsavesettings_android()
    {
    	Yii::app()->functions->updateOptionAdmin('android_push_icon',
		isset($this->data['android_push_icon'])?$this->data['android_push_icon']:''
		);
		Yii::app()->functions->updateOptionAdmin('android_push_picture',
		isset($this->data['android_push_picture'])?$this->data['android_push_picture']:''
		);
		Yii::app()->functions->updateOptionAdmin('android_enabled_pushpic',
		isset($this->data['android_enabled_pushpic'])?$this->data['android_enabled_pushpic']:''
		);
    	
    	$this->code=1;
	    $this->msg=$this->t("settings saved");
		$this->jsonResponse();	
    }
    
    public function actiondevice_list()
    {
    	$db=new DbExt();
    	$this->data = $_GET; 
    	$feed_data = array();
    	
    	$cols = array(
		  'id','full_name','device_platform','device_uiid','device_id','push_enabled',
		  'date_created','last_login','id'
		);			
		//dump($cols);	
				
		$resp = DatatablesWrapper::format($cols,$this->data);
		//dump($resp);
		$where = $resp['where'];
		$order = $resp['order'];
		$limit = $resp['limit'];
		
		$stmt="SELECT SQL_CALC_FOUND_ROWS a.* FROM
		{{mobile2_device_reg_view}} a
		WHERE status = 'active'
		AND push_enabled = '1'
		AND device_id<>''
		$where
		$order
		$limit
		";		
		if(isset($this->data['debug'])){
		    dump($stmt);
		}
		if($res=$db->rst($stmt)){			
			$total_records=0;						
			$stmtc="SELECT FOUND_ROWS() as total_records";
			if ( $resc=$db->rst($stmtc)){									
				$total_records=$resc[0]['total_records'];
			}			
			$feed_data['draw']=$this->data['draw'];
			$feed_data['recordsTotal']=$total_records;
			$feed_data['recordsFiltered']=$total_records;
				
			$datas=array(); 
			foreach ($res as $val) {
				
				$actions='<a href="javascript:;" data-id="'.$val['id'].'" class="send_push" >'.mobileWrapper::t("send push").'</a>';
				
				$cols_data = array();
				foreach ($cols as $key_cols=> $cols_val) {						   
				   if(array_key_exists($cols_val,(array)$val)){		
				   	  if($key_cols==6 || $key_cols==7){
				   	  	 $cols_data[]=FunctionsV3::prettyDate( $val[$cols_val] )." ".FunctionsV3::prettyTime( $val[$cols_val] );
				   	  } elseif ( $key_cols==2){
				   	  	 $cols_data[] = mobileWrapper::t($val[$cols_val]);
				   	  } elseif ( $key_cols==4){	 
				   	  	  $cols_data[] = '<div class="concat-text">'.$val[$cols_val]."</div>" ;
				   	  } elseif ( $key_cols==5){
				   	  	 if($val[$cols_val]==1){
				   	  	 	$cols_data[] = mobileWrapper::t("yes");
				   	  	 } else $cols_data[]=mobileWrapper::t("no");
				   	  } elseif ( $key_cols==8){	 
				   	  	  $cols_data[] = $actions;
				   	  } else $cols_data[]=$val[$cols_val];
				   }			
				}
				$datas[]=$cols_data;
			}			
			$feed_data['data']=$datas;			
			//dump($feed_data);
			$this->otableOutput($feed_data);			
		} else $this->otableNodata();
    }
    
    public function actiondatable_localize()
    {
    	header('Content-type: application/json');
    	$data = array(
    	  'decimal'=>'',
    	  'emptyTable'=> $this->t('No data available in table'),
    	  'info'=> mobileWrapper::t('Showing [start] to [end] of [total] entries',array(
    	    '[start]'=>"_START_",
    	    '[end]'=>"_END_",
    	    '[total]'=>"_TOTAL_",
    	  )),
    	  'infoEmpty'=> $this->t("Showing 0 to 0 of 0 entries"),
    	  'infoFiltered'=>$this->t("(filtered from [max] total entries)",array(
    	    '[max]'=>"_MAX_"
    	  )),
    	  'infoPostFix'=>'',
    	  'thousands'=>',',
    	  'lengthMenu'=> $this->t("Show [menu] entries",array(
    	    '[menu]'=>"_MENU_"
    	  )),
    	  'loadingRecords'=>$this->t('Loading...'),
    	  'processing'=>$this->t("Processing..."),
    	  'search'=>$this->t("Search:"),
    	  'zeroRecords'=>$this->t("No matching records found"),
    	  'paginate' =>array(
    	    'first'=>$this->t("First"),
    	    'last'=>$this->t("Last"),
    	    'next'=>$this->t("Next"),
    	    'previous'=>$this->t("Previous")
    	  ),
    	  'aria'=>array(
    	    'sortAscending'=>$this->t(": activate to sort column ascending"),
    	    'sortDescending'=>$this->t(": activate to sort column descending")
    	  )
    	);
    	echo json_encode($data);
    }
    
    public function actionbroadcast_list()
    {
    	$db=new DbExt();
    	$this->data = $_GET; 
    	$feed_data = array();
    	
    	$cols = array(
		  'broadcast_id','push_title','push_message',
		  'device_platform','date_created','date_created','broadcast_id'
		);			
		//dump($cols);	
				
		$resp = DatatablesWrapper::format($cols,$this->data);
		//dump($resp);
		$where = $resp['where'];
		$order = $resp['order'];
		$limit = $resp['limit'];
		
		$stmt="SELECT SQL_CALC_FOUND_ROWS a.* FROM
		{{mobile2_broadcast}} a
		WHERE 1
		$where
		$order
		$limit
		";		
		if(isset($this->data['debug'])){
		    dump($stmt);
		}
		
		if($res=$db->rst($stmt)){			
			$total_records=0;						
			$stmtc="SELECT FOUND_ROWS() as total_records";
			if ( $resc=$db->rst($stmtc)){									
				$total_records=$resc[0]['total_records'];
			}			
			$feed_data['draw']=$this->data['draw'];
			$feed_data['recordsTotal']=$total_records;
			$feed_data['recordsFiltered']=$total_records;
			
			$platform_list = mobileWrapper::platFormList();
				
			$datas=array(); 
			foreach ($res as $val) {
				
				$link=Yii::app()->createUrl(APP_FOLDER."/index/broadcast_details",array(
				  'bid'=>$val['broadcast_id']
				));
				$actions='<a href="'.$link.'" >'.mobileWrapper::t("view details").'</a>';
								
				$cols_data = array();
				foreach ($cols as $key_cols=> $cols_val) {						   
				   if(array_key_exists($cols_val,(array)$val)){		
				   	  if($key_cols==4 ){				   	  	 
				   	  	 $t = mobileWrapper::prettyBadge( $val['status'] );
				   	  	 $t .= "<div></div>";
				   	  	 $t.= FunctionsV3::prettyDate( $val[$cols_val] )." ".FunctionsV3::prettyTime( $val[$cols_val] );				   	  	 
				   	  	 $cols_data[]= $t;
				   	  }elseif ($key_cols==3){
				   	  	 $cols_data[] = mt($platform_list[$val[$cols_val]]);				   	  
				   	  }elseif ($key_cols==5){
				   	  	 $cols_data[]=$actions;
				   	  } else $cols_data[]=$val[$cols_val];
				   }			
				}
				$datas[]=$cols_data;
			}			
			$feed_data['data']=$datas;			
			//dump($feed_data);
			$this->otableOutput($feed_data);			
		} else $this->otableNodata();
    }
    
    public function actionvalidate_lang()
    {    	
    	echo '
		$.extend( $.validator.messages, {
			required: "'. $this->t("This field is required.") . '" ,
			remote:  "'. $this->t("Please correct this field to continue") . '" ,
			email: "'. $this->t("Please enter a valid email address") . '" ,
			url: "'. $this->t("Please enter a valid website address") . '" ,
			date: "'. $this->t("Please enter a valid date") . '" ,
			dateISO: "'. $this->t("Please enter a valid date (ISO)") . '" ,
			number: "'. $this->t("Please enter a valid number") . '" ,
			digits: "'. $this->t("Please enter numbers only") . '" ,
			creditcard: "'. $this->t("Please enter a valid credit card number") . '" ,
			equalTo: "'. $this->t("Please enter the same value") . '" ,
			extension: "'. $this->t("Please enter a file with an approved extension") . '" ,
			maxlength: $.validator.format( "'. $this->t("Maximum number of characters is {0}") . '"  ),
			minlength: $.validator.format( "'. $this->t("The minimum number of characters is {0}") . '"  ),
			rangelength: $.validator.format( "'. $this->t("The number of characters must be between {0} and {1}") . '"  ),
			range: $.validator.format( "'. $this->t("Please enter a value between {0} and {1}") . '"   ),
			max: $.validator.format( "'. $this->t("Please enter less than or equal to {0}") . '"  ),
			min: $.validator.format(  "'. $this->t("Please enter more than or equal to {0}") . '"  )
		} ); ';	
    }
    
    public function actionsave_broadcast()
    {    	    	
    	
    	$params = array(
    	   'push_title'=>$this->data['push_title'],
    	   'push_message'=>$this->data['push_message'],
    	   'device_platform'=>$this->data['device_platform'],
    	   'date_created'=>FunctionsV3::dateNow(),
    	   'ip_address'=>$_SERVER['REMOTE_ADDR']
    	);
    	$db=new DbExt();
    	if ($db->insertData("{{mobile2_broadcast}}",$params)){
    		$this->code = 1;
    		$this->msg = mt("Successful");
    		    		    		
    		FunctionsV3::fastRequest(FunctionsV3::getHostURL().Yii::app()->createUrl("mobileappv2/cron/processbroadcast"));
    		FunctionsV3::fastRequest(FunctionsV3::getHostURL().Yii::app()->createUrl("mobileappv2/cron/processpush"));
    		
    	} else $this->msg = mt("Failed cannot insert records");
    	$this->jsonResponse();
    }
    
    public function actionpush_list()
    {
    	$db=new DbExt();
    	$this->data = $_GET; 
    	$feed_data = array();
    	    	
    	$cols = array(
		  'id','push_type','client_name','device_platform','device_id',
		  'push_title','push_message','date_created','date_process'
		);			
		//dump($cols);	
				
		$resp = DatatablesWrapper::format($cols,$this->data);
		//dump($resp);
		$where = $resp['where'];
		$order = $resp['order'];
		$limit = $resp['limit'];
		
		$and='';
		if(isset($this->data['broadcast_id'])){
			$and=" AND broadcast_id=".FunctionsV3::q($this->data['broadcast_id'])." ";
		}
		
		$stmt="SELECT SQL_CALC_FOUND_ROWS a.* FROM
		{{mobile2_push_logs}} a
		WHERE 1
		$where
		$and
		$order
		$limit
		";		
		if(isset($this->data['debug'])){
		    dump($stmt);
		}
		if($res=$db->rst($stmt)){
			$total_records=0;						
			$stmtc="SELECT FOUND_ROWS() as total_records";
			if ( $resc=$db->rst($stmtc)){									
				$total_records=$resc[0]['total_records'];
			}			
			$feed_data['draw']=$this->data['draw'];
			$feed_data['recordsTotal']=$total_records;
			$feed_data['recordsFiltered']=$total_records;
			
			$datas=array(); 
			foreach ($res as $val) {
								
				$cols_data = array();
				foreach ($cols as $key_cols=> $cols_val) {						   
				   if(array_key_exists($cols_val,(array)$val)){		
				   	  if($key_cols==7){			
				   	  	$t = mobileWrapper::prettyBadge( $val['status'] );
						$t .= "<div></div>";
						$t.= FunctionsV3::prettyDate( $val[$cols_val] )." ".FunctionsV3::prettyTime( $val[$cols_val] );
						$cols_data[]=$t;					   	  	
					  } elseif ( $key_cols==1 || $key_cols==3 ){				   	  		
					  	$cols_data[]=mt($val[$cols_val]);
					  } elseif ( $key_cols==4){				   	  	
					  	 $cols_data[] = '<div class="concat-text">'.$val[$cols_val]."</div>" ;
				   	  } elseif ( $key_cols==8){				   	  	
				   	  	$cols_data[]=FunctionsV3::prettyDate( $val[$cols_val] )." ".FunctionsV3::prettyTime( $val[$cols_val] ); 
				   	  } else $cols_data[]=$val[$cols_val];
				   }			
				}				
				//dump($cols_data);
				$datas[]=$cols_data;
			}			
			$feed_data['data']=$datas;						
			$this->otableOutput($feed_data);	
		} else $this->otableNodata();
    }
    
    public function actionpage_list()
    {
    	$p = new CHtmlPurifier();
    	
    	$db=new DbExt();
    	$this->data = $_GET; 
    	$feed_data = array();
    	
    	$cols = array(
		  'page_id','title','content','icon','use_html','sequence',
		  'date_created','page_id'
		);			
		//dump($cols);	
				
		$resp = DatatablesWrapper::format($cols,$this->data);
		//dump($resp);
		$where = $resp['where'];
		$order = $resp['order'];
		$limit = $resp['limit'];
		
		$stmt="SELECT SQL_CALC_FOUND_ROWS a.* FROM
		{{mobile2_pages}} a
		WHERE 1
		$where
		$order
		$limit
		";		
		if(isset($this->data['debug'])){
		    dump($stmt);
		}
		if($res=$db->rst($stmt)){
			$total_records=0;						
			$stmtc="SELECT FOUND_ROWS() as total_records";
			if ( $resc=$db->rst($stmtc)){									
				$total_records=$resc[0]['total_records'];
			}			
			$feed_data['draw']=$this->data['draw'];
			$feed_data['recordsTotal']=$total_records;
			$feed_data['recordsFiltered']=$total_records;
			
			$datas=array(); 
			foreach ($res as $val) {
				
				$page_id = $val['page_id'];
				$actions ='<a href="javascript:;" class="edit_page btn btn-info" data-page_id="'.$page_id.'" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>';
				$actions.='<a href="javascript:;" class="delete_page btn btn-danger" data-page_id="'.$page_id.'" ><i class="fa fa-trash" aria-hidden="true"></i></a>';
								
				$cols_data = array();
				foreach ($cols as $key_cols=> $cols_val) {						   
				   if(array_key_exists($cols_val,(array)$val)){		
				   	  if($key_cols==6 ){
				   	  	 
						$t = mobileWrapper::prettyBadge( $val['status'] );
						$t .= "<div></div>";
						$t.= FunctionsV3::prettyDate( $val[$cols_val] )." ".FunctionsV3::prettyTime( $val[$cols_val] );
						$cols_data[]=$t;

					  } elseif ( $key_cols==2){
					   	$cols_data[] = '<div class="concat-text">'.strip_tags($p->purify($val[$cols_val]))."</div>" ;
				   	  } elseif ( $key_cols==4){
				   	  	$cols_data[]=$val[$cols_val]==1?'<i class="fa fa-check" aria-hidden="true"></i>':'';
				   	  } elseif ( $key_cols==7){
				   	  	 $cols_data[]=$actions;
				   	  } else $cols_data[]=$val[$cols_val];
				   }			
				}
				$datas[]=$cols_data;
			}			
			$feed_data['data']=$datas;						
			$this->otableOutput($feed_data);	
		} else $this->otableNodata();
    }
    
    public function actionsave_page()
    {    	
    	$db = new DbExt();
    	$params = array(
    	  'title'=>isset($this->data['title'])?$this->data['title']:'',
    	  'content'=>isset($this->data['content'])?$this->data['content']:'',
    	  'use_html'=>isset($this->data['use_html'])?$this->data['use_html']:0,
    	  'icon'=>isset($this->data['icon'])?$this->data['icon']:'',
    	  'sequence'=>isset($this->data['sequence'])?$this->data['sequence']:'0',
    	  'status'=>isset($this->data['status'])?$this->data['status']:'',
    	  'date_created'=>FunctionsV3::dateNow(),
    	  'ip_address'=>$_SERVER['REMOTE_ADDR']
    	);
    	
    	if($params['sequence']<=0){    		
    		if($max_count = mobileWrapper::getMaxPage()){    			
    			$params['sequence']=$max_count;
    		}     		
    	}
    	
    	/*dump($params);
    	die();*/
    	
    	if(Yii::app()->functions->multipleField()){       		
    		if ( $fields=FunctionsV3::getLanguageList(false)){
    			foreach ($fields as $lang) {    				
    				$params["title_$lang"] = isset($this->data["title_$lang"])?$this->data["title_$lang"]:'';
    				$params["content_$lang"] = isset($this->data["content_$lang"])?$this->data["content_$lang"]:'';
    			}
    		}    		
    	}
    	    	
    	$page_id = isset($this->data['page_id'])?$this->data['page_id']:'';
    	if($page_id>0){    		
    		unset($params['date_created']);
    		$params['date_modified']=FunctionsV3::dateNow();    		
    		if($db->updateData("{{mobile2_pages}}",$params,'page_id',$page_id)){
    			$this->code = 1;
    			$this->msg = mt("Successful");    			
    		} else $this->msg = mt("Failed cannot update records");
    	} else {
    		if (!mobileWrapper::getPageByTitle($params['title'])){
    			$db->insertData("{{mobile2_pages}}",$params);
    			$this->code = 1;
    			$this->msg = mt("Successful");
    		} else $this->msg = mt("Page title already exist");
    	}
    	
    	$this->jsonResponse();
    }
    
    public function actiondelete_page()
    {
    	$page_id = isset($this->data['page_id'])?$this->data['page_id']:'';
    	if($page_id>=1){
    		mobileWrapper::deletePage($page_id);
    		$this->code = 1;
    		$this->msg = mt("Successful");
    	} else $this->msg = mt("Invalid page id");
    	$this->jsonResponse();
    }
    
    public function actionget_page()
    {
    	$page_id = isset($this->data['page_id'])?$this->data['page_id']:'';    
    	if($page_id>=1){
    		if ($res=mobileWrapper::getPageByID($page_id)){   
    			
    			$lang=array();
    			if(Yii::app()->functions->multipleField()){
    				$lang = DBTableWrapper::getLangList();
    			}
    			 			
    			$this->code = 1;
    			$this->msg = "ok";
    			$this->details = array(
    			 'lang'=>$lang,
    			 'data'=>$res
    			);
    			    			
    		} else $this->msg = mt("records not found");
    	} else $this->msg = mt("Invalid page id");
    	$this->jsonResponse();
    }
    
    public function actionsend_push()
    {    	
    	$id = isset($this->data['id'])?$this->data['id']:'';    
    	if($id>=1){
    		if ($res = mobileWrapper::getDeviceByID($id)){    			
    			$params = array(
    			  'push_type'=>'campaign',
    			  'client_id'=>$res['client_id'],
    			  'client_name'=>$res['full_name'],
    			  'device_platform'=>trim($res['device_platform']),
    			  'device_id'=>trim($res['device_id']),
    			  'device_uiid'=>trim($res['device_uiid']),
    			  'push_title'=>trim($this->data['push_title']),
    			  'push_message'=>trim($this->data['push_message']),
    			  'date_created'=>FunctionsV3::dateNow(),
    			  'ip_address'=>$_SERVER['REMOTE_ADDR']
    			);    			
    			$db=new DbExt();
    			if($db->insertData("{{mobile2_push_logs}}",$params)){
    				$this->code = 1;
    				$this->msg = mt("Request has been sent");
    				
    				FunctionsV3::fastRequest(FunctionsV3::getHostURL().Yii::app()->createUrl(APP_FOLDER."/cron/processpush"));
    				
    			} else $this->msg = mt("failed cannot insert records");
    		} else $this->msg = mt("Record not found");
    	} else $this->msg = mt("Invalid id");
    	$this->jsonResponse();
    }
    
    public function actionsave_webconfig()
    {
    	Yii::app()->functions->updateOptionAdmin('mobile2_notification_delay',
		isset($this->data['mobile2_notification_delay'])?$this->data['mobile2_notification_delay']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobile2_table_length',
		isset($this->data['mobile2_table_length'])?$this->data['mobile2_table_length']:''
		);
			
    	$this->code=1;
	    $this->msg=$this->t("settings saved");
		$this->jsonResponse();	
    }
    
    public function actionsavemap_settings()
    {
    	
    	if(!isset($this->data['mobile2_default_lat'])){
    		$this->msg=$this->t("invalid latitude");
		    $this->jsonResponse();	
    	}
    	if(!isset($this->data['mobile2_default_lng'])){
    		$this->msg=$this->t("invalid longitude");
		    $this->jsonResponse();	
    	}
    	
    	if(empty($this->data['mobile2_default_lat'])){
    		$this->msg=$this->t("empty latitude");
		    $this->jsonResponse();	
    	}
    	if(empty($this->data['mobile2_default_lng'])){
    		$this->msg=$this->t("empty longtitude");
		    $this->jsonResponse();	
    	}
    	
    	Yii::app()->functions->updateOptionAdmin('mobile2_default_lat',
		isset($this->data['mobile2_default_lat'])?$this->data['mobile2_default_lat']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobile2_default_lng',
		isset($this->data['mobile2_default_lng'])?$this->data['mobile2_default_lng']:''
		);
			
    	$this->code=1;
	    $this->msg=$this->t("settings saved");
		$this->jsonResponse();	
		
    	$this->jsonResponse();
    }
    
    public function actionorder_trigger()
    {
    	$db=new DbExt();
    	$this->data = $_GET; 
    	$feed_data = array();
    	
    	$cols = array(
		  'trigger_id','trigger_type',
		  'order_id','order_status','remarks','date_created'
		);			
		//dump($cols);	
				
		$resp = DatatablesWrapper::format($cols,$this->data);
		//dump($resp);
		$where = $resp['where'];
		$order = $resp['order'];
		$limit = $resp['limit'];
		
		$stmt="SELECT SQL_CALC_FOUND_ROWS a.* FROM
		{{mobile2_order_trigger}} a
		WHERE 1
		$where
		$order
		$limit
		";		
		if(isset($this->data['debug'])){
		    dump($stmt);
		}
		if($res=$db->rst($stmt)){
			$total_records=0;						
			$stmtc="SELECT FOUND_ROWS() as total_records";
			if ( $resc=$db->rst($stmtc)){									
				$total_records=$resc[0]['total_records'];
			}			
			$feed_data['draw']=$this->data['draw'];
			$feed_data['recordsTotal']=$total_records;
			$feed_data['recordsFiltered']=$total_records;
			
			$datas=array(); 
			foreach ($res as $val) {
											
				$cols_data = array();
				foreach ($cols as $key_cols=> $cols_val) {						   
				   if(array_key_exists($cols_val,(array)$val)){		
				   	  if($key_cols==5 ){
				   	  	 
						$t = mobileWrapper::prettyBadge( $val['status'] );
						$t .= "<div></div>";
						$t.= FunctionsV3::prettyDate( $val[$cols_val] )." ".FunctionsV3::prettyTime( $val[$cols_val] );
						$cols_data[]=$t;
					  
				   	  } elseif ( $key_cols==1){
				   	  	$cols_data[]=mt($val[$cols_val]);
				   	  } elseif ( $key_cols==3){
				   	  	$cols_data[]=mt($val[$cols_val]);	
				   	  } else $cols_data[]=$val[$cols_val];
				   }			
				}
				$datas[]=$cols_data;
			}			
			$feed_data['data']=$datas;						
			$this->otableOutput($feed_data);	
		} else $this->otableNodata();
    }
    
    public function actionsavesettings_startup()
    {
    	    	    	
    	Yii::app()->functions->updateOptionAdmin('mobileapp2_startup',
		isset($this->data['mobileapp2_startup'])?$this->data['mobileapp2_startup']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_startup_banner',
		isset($this->data['mobileapp2_startup_banner'])?json_encode($this->data['mobileapp2_startup_banner']):''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobile2_enabled_select_language',
		isset($this->data['mobile2_enabled_select_language'])?$this->data['mobile2_enabled_select_language']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_startup_interval',
		isset($this->data['mobileapp2_startup_interval'])?$this->data['mobileapp2_startup_interval']:''
		);
		
		Yii::app()->functions->updateOptionAdmin('mobileapp2_startup_auto_scroll',
		isset($this->data['mobileapp2_startup_auto_scroll'])?$this->data['mobileapp2_startup_auto_scroll']:''
		);
			
    	$this->code=1;
	    $this->msg=$this->t("settings saved");
		$this->jsonResponse();	
		
    	$this->jsonResponse();
    }
    
    public function actionsave_home_banner()
    {    	
    	
    	$banner_id = isset($this->data['banner_id'])?$this->data['banner_id']:'';
    	$params = array(
    	  'title'=>isset($this->data['title'])?$this->data['title']:'',
    	  'banner_name'=>isset($this->data['home_banner'])?$this->data['home_banner']:'',
    	  'sequence'=>isset($this->data['sequence'])?$this->data['sequence']:'',
    	  'date_created'=>FunctionsV3::dateNow(),
    	  'ip_address'=>$_SERVER['REMOTE_ADDR'],
    	  'status'=>isset($this->data['status'])?$this->data['status']:'',
    	);    	
    	
    	if(!is_numeric($params['sequence'])){
    		$params['sequence']=0;
    	}
    	
    	if(!empty($params['banner_name'])){
    		$db = new DbExt();
    		if($banner_id>0){
    			unset($params['date_created']);
    			$params['date_modified']=FunctionsV3::dateNow();
    			$db->updateData("{{mobile2_homebanner}}",$params,'banner_id',$banner_id);
    			$this->code = 1;
	    	    $this->msg = mt("Successfully updated");
    		} else {    			    	    
	    	    $db->insertData("{{mobile2_homebanner}}",$params);	    	    
	    	    $banner_id = Yii::app()->db->getLastInsertID();
	    	    $redirect_link = Yii::app()->createUrl("/".APP_FOLDER."/index/home_banner_new",array(
				 'banner_id'=>$banner_id
				));
	    	    
	    	    $this->code = 1;
	    	    $this->msg = mt("Successful");
	    	    $this->details = $redirect_link;
    		}
    		unset($db);
    	} else $this->msg = mt("please upload your banner");
    	$this->jsonResponse();
    }
	
    public function actionhome_banner_list()
    {
    	$db=new DbExt();
    	$this->data = $_GET; 
    	$feed_data = array();
    	
    	$cols = array(
		  'banner_id','title','banner_name','sequence','date_created','banner_id'
		);			
		//dump($cols);	
				
		$resp = DatatablesWrapper::format($cols,$this->data);
		//dump($resp);
		$where = $resp['where'];
		$order = $resp['order'];
		$limit = $resp['limit'];
		
		$stmt="SELECT SQL_CALC_FOUND_ROWS a.* FROM
		{{mobile2_homebanner}} a
		WHERE 1
		$where
		$order
		$limit
		";		
		if(isset($this->data['debug'])){
		    dump($stmt);
		}
		if($res=$db->rst($stmt)){
			$total_records=0;						
			$stmtc="SELECT FOUND_ROWS() as total_records";
			if ( $resc=$db->rst($stmtc)){									
				$total_records=$resc[0]['total_records'];
			}			
			$feed_data['draw']=$this->data['draw'];
			$feed_data['recordsTotal']=$total_records;
			$feed_data['recordsFiltered']=$total_records;
			
			$datas=array(); 
			foreach ($res as $val) {
				
				$banner_id = $val['banner_id'];
				
				$edit_link = Yii::app()->createUrl("/".APP_FOLDER."/index/home_banner_new",array(
				 'banner_id'=>$banner_id
				));
				
				$actions ='<a href="'.$edit_link.'" class="edit_page btn btn-info" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>';
				$actions.='<a href="javascript:;" class="delete_home_banner btn btn-danger" data-banner_id="'.$banner_id.'" ><i class="fa fa-trash" aria-hidden="true"></i></a>';
				
				$image_url = mobileWrapper::getImage($val['banner_name']);
				$image_link = "<p><a target=\"_blank\" href=\"$image_url\" targe=\"_blank\" >".mt("view")."</a></p>";
								
				$cols_data = array();
				foreach ($cols as $key_cols=> $cols_val) {						   
				   if(array_key_exists($cols_val,(array)$val)){		
				   	  if($key_cols==4 ){
				   	  	 
						$t = mobileWrapper::prettyBadge( $val['status'] );
						$t .= "<div></div>";
						$t.= FunctionsV3::prettyDate( $val[$cols_val] )." ".FunctionsV3::prettyTime( $val[$cols_val] );
						$cols_data[]=$t;

					  } elseif ( $key_cols==2){
					   	$cols_data[] = '<div class="concat-text">'.$val[$cols_val]. $image_link ."</div>" ;				   	  
				   	  } elseif ( $key_cols==5){
				   	  	 $cols_data[]=$actions;
				   	  } else $cols_data[]=$val[$cols_val];
				   }			
				}
				$datas[]=$cols_data;
			}			
			$feed_data['data']=$datas;						
			$this->otableOutput($feed_data);	
		} else $this->otableNodata();
    }
    
    public function actiondelete_home_banner()
    {    	
    	$banner_id = isset($this->data['banner_id'])?$this->data['banner_id']:'';
    	if($banner_id>0){
    		if($resp = mobileWrapper::getHomeBannerByID($banner_id)){
    			$db = new DbExt();
    			$stmt="DELETE FROM
    			{{mobile2_homebanner}}
    			WHERE banner_id=".FunctionsV3::q($banner_id)."    			
    			";
    			$db->qry($stmt);
    			$this->code = 1;
	    	    $this->msg = mt("Successful");
    			unset($db);
    		} else $this->msg = mt("invalid banner id");
    	} else $this->msg = mt("invalid banner id");
    	$this->jsonResponse();
    }
    
}/* end class*/