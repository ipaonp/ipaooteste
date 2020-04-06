<?php
class IndexController extends CController
{
	public $layout='layout';	
	
	public function init()
	{
		
		$cs = Yii::app()->getClientScript();
		
		$map_provider = FunctionsV3::getMapProvider();
		
		$cs->registerScript(
		  'map_provider',
		  "var map_provider='$map_provider[provider]';",
		  CClientScript::POS_HEAD
		);
		
		$cs->registerScript(
		  'map_token',
		  "var map_token='$map_provider[token]';",
		  CClientScript::POS_HEAD
		);
		
		if($map_provider['provider']=="google.maps"){
			$cs->registerScriptFile("//maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&key=".$map_provider['token']
			,CClientScript::POS_END); 		
										
			$cs->registerScriptFile(Yii::app()->baseUrl . '/protected/modules/'.APP_FOLDER.'/assets/vendor/gmaps.js'
			,CClientScript::POS_END); 			
		} else {
			
			$cs->registerScriptFile(Yii::app()->baseUrl . '/protected/modules/'.APP_FOLDER.'/assets/vendor/leaflet/leaflet.js'
			,CClientScript::POS_END); 			
			
			$cs->registerCssFile(Yii::app()->baseUrl . '/protected/modules/'.APP_FOLDER."/assets/vendor/leaflet/leaflet.css");
		}		
					
		$error_ajax_message = mobileWrapper::t("an error has occured");
		$cs->registerScript(
		  'error_ajax_message',
		  "var error_ajax_message='$error_ajax_message';",
		  CClientScript::POS_HEAD
		);
		
		$image_limit_size=FunctionsV3::imageLimitSize();
		$cs->registerScript(
		  'image_limit_size',
		  "var image_limit_size='$image_limit_size';",
		  CClientScript::POS_HEAD
		);
		
		$page_length = Yii::app()->functions->getOptionAdmin('mobile2_table_length');
		if($page_length<=0){
			$page_length=10;
		}
		$cs->registerScript(
		  'page_length',
		  "var page_length='$page_length';",
		  CClientScript::POS_HEAD
		);
		
		$notify_delay = Yii::app()->functions->getOptionAdmin('mobile2_notification_delay');
		if($notify_delay<=0){
			$notify_delay=1;
		}
		$cs->registerScript(
		  'notify_delay',
		  "var notify_delay='$notify_delay';",
		  CClientScript::POS_HEAD
		);
	}
	
	public function beforeAction($action)
	{		
		if(!Yii::app()->functions->isAdminLogin()){
		   $this->redirect(Yii::app()->createUrl('/admin/noaccess'));
		   Yii::app()->end();		
		}
		
		$action_name = "mobileappv2";	
		$aa_access=Yii::app()->functions->AAccess();
	    $menu_list=Yii::app()->functions->AAmenuList();		    
	    if (in_array($action_name,(array)$menu_list)){
	    	if (!in_array($action_name,(array)$aa_access)){	   	    		
	    		$this->redirect(Yii::app()->createUrl('/admin/noaccess'));
	    	}
	    }
	    
	    $action_name = $action->id;			
		$cs = Yii::app()->getClientScript();				
		$cs->registerScript(
		  'current_page',
		  "var current_page='$action_name';",
		  CClientScript::POS_HEAD
		);
			    		
		/*CHECK DATABASE*/
	    $new=0;
	    
	    if( !FunctionsV3::checkIfTableExist('mobile2_device_reg')){
	        $this->redirect(Yii::app()->createUrl('/mobileappv2/update'));
			Yii::app()->end();
	    }	    
	    	    
	    $new_fields=array('social_id'=>"social_id");
		if ( !FunctionsV3::checkTableFields('client',$new_fields)){			
			$new++;
		}		
		
		/*1.3*/
		if( !FunctionsV3::checkIfTableExist('mobile2_homebanner')){
			$new++;
		}
		$new_fields=array('distance_unit'=>"distance_unit");
		if ( !FunctionsV3::checkTableFields('mobile2_cart',$new_fields)){			
			$new++;
		}		
		
		if($new>0){
			$this->redirect(Yii::app()->createUrl('/mobileappv2/update'));
			Yii::app()->end();
		}
		/*END CHECK DATABASE*/
							
		return true;
	}
	
	public function actionIndex(){
		$this->redirect(Yii::app()->createUrl(APP_FOLDER.'/index/settings'));
	}		
	
	public function actionsettings()
	{
		$this->pageTitle = mobileWrapper::t("Settings");
		
		$country_list=require_once('CountryCode.php');
		$mobile_country_list=getOptionA('mobile_country_list');
		if (!empty($mobile_country_list)){
			$mobile_country_list=json_decode($mobile_country_list);
		} else $mobile_country_list=array();
		
		$search_options = mobileWrapper::getDataSearchOptions();		
		
		$this->render('settings',array(
		  'country_list'=>$country_list,
		  'mobile_country_list'=>$mobile_country_list,
		  'search_options'=>$search_options,
		  'order_status_list'=>Yii::app()->functions->orderStatusList2(true),
		));
	}
	
	public function actiondevice_list()
	{
		$this->pageTitle = mobileWrapper::t("Device List");
		$this->render('device_list');
	}
	
	public function actionbroadcast_list()
	{
		$this->pageTitle = mobileWrapper::t("Broadcast");
		$this->render('broadcast_list');
	}
	
	public function actionpush_list()
	{
		$this->pageTitle = mobileWrapper::t("Push Logs");
		$this->render('push_list');
	}
	
	public function actionpage_list()
	{
		if(Yii::app()->functions->multipleField()){ 
			DBTableWrapper::alterTablePages();
		}
		
		$this->pageTitle = mobileWrapper::t("Page");
		$this->render('page_list');
	}
	
	public function actionothers()
	{
		$this->pageTitle = mobileWrapper::t("Others");
		
		$cron[] = array(
		  'link'=>FunctionsV3::getHostURL().Yii::app()->createUrl(APP_FOLDER."/cron/processpush"),
		  'notes'=>mt("run this every minute")
		);
		$cron[] = array(
		  'link'=>FunctionsV3::getHostURL().Yii::app()->createUrl(APP_FOLDER."/cron/processbroadcast"),
		  'notes'=>mt("run this every minute")
		);
		$cron[] = array(
		  'link'=>FunctionsV3::getHostURL().Yii::app()->createUrl(APP_FOLDER."/cron/triggerorder"),
		  'notes'=>mt("run this every minute")
		);
		$cron[] = array(
		  'link'=>FunctionsV3::getHostURL().Yii::app()->createUrl(APP_FOLDER."/cron/getfbavatar"),
		  'notes'=>mt("run this every 5 minutes")
		);
		$cron[] = array(
		  'link'=>FunctionsV3::getHostURL().Yii::app()->createUrl(APP_FOLDER."/cron/removeinactivedevice"),
		  'notes'=>mt("run once in a day")
		);
		
		$update_db = FunctionsV3::getHostURL().Yii::app()->createUrl(APP_FOLDER."/update");
		
		$this->render('others',array(
		  'cron'=>$cron,
		  'cron_sample'=>$cron[0]['link'],
		  'update_db'=>$update_db
		));
	}
	
	public function actiontest_api()
	{
		$api_has_key = getOptionA('mobileapp2_api_has_key');		
		$api_settings = websiteUrl()."/".APP_FOLDER."/api/getsettings";
		if(!empty($api_has_key)){
			$api_settings.="/?api_key=".urlencode($api_has_key);
		}				
		$this->redirect($api_settings);
	}
	
	public function actionbroadcast_details()
	{
		$bid = isset($_GET['bid'])?$_GET['bid']:'';
		$this->pageTitle = mobileWrapper::t("Broadcast details [id]",array(
		  'id'=>$bid
		));
		$this->render('push_list',array(
		  'bid'=>$bid
		));
	}
	
	public function actionorder_trigger()
	{
		$this->pageTitle = mt("Order Trigger Notification");
		$this->render('order_trigger');
	}
	
	public function actionhome_banner_list()
	{		
		$this->pageTitle = mt("Home Banner");
		$this->render('banner_list');
	}
	
	public function actionhome_banner_new()
	{
		$data = $_GET; $banner_id = '';  $resp = array();
		if(isset($data['banner_id'])){
			$banner_id = $data['banner_id'];
			if(!$resp = mobileWrapper::getHomeBannerByID($banner_id)){
				$this->pageTitle = mt("Home Banner");
				$this->render('error',array(
				  'error'=>mt("sorry but we cannot find what you are looking for")
				));
				return ;
			}
		}
		
		$last_increment = Yii::app()->functions->getLastIncrement('{{mobile2_homebanner}}');		
		
		$this->pageTitle = mt("Home Banner");
		$this->render('banner_add',array(
		 'data'=>$resp,
		 'last_increment'=>$last_increment+0
		));
	}
	
} /*end class*/