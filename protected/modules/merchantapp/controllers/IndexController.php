<?php
//if (!isset($_SESSION)) { session_start(); }

class IndexController extends CController
{
	public $layout='layout';
	public $needs_db_update=false;
	
	public function init()
	{
		FunctionsV3::handleLanguage();
		$lang=Yii::app()->language;				
		$cs = Yii::app()->getClientScript();
		$cs->registerScript(
		  'lang',
		  "var lang='$lang';",
		  CClientScript::POS_HEAD
		);
		
	   $table_translation=array(
	      "tablet_1"=>merchantApp::t("No data available in table"),
    	  "tablet_2"=>merchantApp::t("Showing _START_ to _END_ of _TOTAL_ entries"),
    	  "tablet_3"=>merchantApp::t("Showing 0 to 0 of 0 entries"),
    	  "tablet_4"=>merchantApp::t("(filtered from _MAX_ total entries)"),
    	  "tablet_5"=>merchantApp::t("Show _MENU_ entries"),
    	  "tablet_6"=>merchantApp::t("Loading..."),
    	  "tablet_7"=>merchantApp::t("Processing..."),
    	  "tablet_8"=>merchantApp::t("Search:"),
    	  "tablet_9"=>merchantApp::t("No matching records found"),
    	  "tablet_10"=>merchantApp::t("First"),
    	  "tablet_11"=>merchantApp::t("Last"),
    	  "tablet_12"=>merchantApp::t("Next"),
    	  "tablet_13"=>merchantApp::t("Previous"),
    	  "tablet_14"=>merchantApp::t(": activate to sort column ascending"),
    	  "tablet_15"=>merchantApp::t(": activate to sort column descending"),
	   );	
	   $js_translation=json_encode($table_translation);
		
	   $cs->registerScript(
		  'js_translation',
		  "var js_translation=$js_translation;",
		  CClientScript::POS_HEAD
		);	
	   	
	}
	
	public function beforeAction($action)
	{		
		if(!Yii::app()->functions->isAdminLogin()){
			$this->redirect(Yii::app()->createUrl('/admin/noaccess'));
			Yii::app()->end();		
		}
		
		$action_name= "merchantapp";	
		$aa_access=Yii::app()->functions->AAccess();
	    $menu_list=Yii::app()->functions->AAmenuList();	 	    
	    if (in_array($action_name,(array)$menu_list)){
	    	if (!in_array($action_name,(array)$aa_access)){	   	    		
	    		$this->redirect(Yii::app()->createUrl('/admin/noaccess'));
	    	}
	    }	    
	    
	    
	    /*CHECK DATABASE*/
	    $new=0;
	    if( !FunctionsV3::checkIfTableExist('mobile_device_merchant')){
			$new++;
		}	
		
		if ($new>0){
			$this->needs_db_update=true;
		} else $this->needs_db_update=false;
	    
		return true;
	}
	
	public function actionIndex(){		
		$lang_params='';
        if(isset($_COOKIE['kr_admin_lang_id'])){	
           if($_COOKIE['kr_admin_lang_id']!="-9999"){
	         $lang_params="/?lang_id=".$_COOKIE['kr_admin_lang_id'];
           }
        }
		$this->redirect(Yii::app()->createUrl('/merchantapp/index/settings'.$lang_params));
	}		
	
	public function actionSettings()
	{
		$pending_tabs=getOptionA('merchant_app_pending_tabs');
		if(!empty($pending_tabs)){
		   $pending_tabs=json_decode($pending_tabs,true);
		}
		if($order_status_list=Yii::app()->functions->orderStatusList()){		   
		}
		
		$this->pageTitle = merchantApp::moduleName()." - ".Yii::t("default","Settings");
		$this->render('settings',array(
		   'pending_tabs'=>$pending_tabs,
		   'order_status_list'=>$order_status_list,
		   'merchant_app_enabled_alert'=>getOptionA('merchant_app_enabled_alert'),
		   'merchant_app_alert_interval'=>getOptionA('merchant_app_alert_interval'),
		   'merchant_app_cancel_order_alert'=>getOptionA('merchant_app_cancel_order_alert'),
		   'merchant_app_cancel_order_alert_interval'=>getOptionA('merchant_app_cancel_order_alert_interval'),
		   'merchant_app_keep_awake'=>getOptionA('merchant_app_keep_awake'),
		   'website_review_approved_status'=>getOptionA('website_review_approved_status')
		));
	}
	
	public function actiontranslation()
	{
		$this->render('translation',array(		  
		));
	}
	
	public function actionRegisteredDevice()
	{
		$this->render('registered-device',array(		  
		));
	}

	public function actionCronJobs()
	{
		$this->render('cron-jobs',array(		  
		));
	}

	public function actionPushLogs()
	{
		$this->render('push-logs',array(		  
		));
	}
	
	public function actionPush()
	{
		if ( $res=merchantApp::getDeviceByID($_GET['id'])){
	    $this->render('push_form',array(		  
	      'data'=>$res
		));
		} else $this->render('error',array(
		  'msg'=> merchantApp::t("cannot find records")
		));
	}
	
} /*end*/