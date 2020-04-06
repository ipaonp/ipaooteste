<?php
/* ********************************************************
 *   Karenderia Mobile App version 2
 *
 *   Last Update : august 19, 2019 - initial release
 *   Last Update : september 23, 2019 - 1.2
 *   Last Update : november 18, 2019 - 1.3
 *   Last Update : january 09, 2019 - 1.4 

***********************************************************/

define("APP_FOLDER",'mobileappv2');
define("APP_BTN",'btn-info');

class Mobileappv2Module extends CWebModule
{
	public $defaultController='home';	
	static $global_dict;
	 
	public function init()
	{
		//echo Yii::getPathOfAlias('mobileappv2');		
		
		$session = Yii::app()->session;
				
		$this->setImport(array(			
			'mobileappv2.components.*',
			'mobileappv2.models.*',
			'application.components.*',
		));			
		require_once 'Functions.php';
		
		$ajaxurl=Yii::app()->baseUrl.'/'.APP_FOLDER.'/ajax';
		
		Yii::app()->clientScript->scriptMap=array(
          'jquery.js'=>false,
          'jquery.min.js'=>false
        );

		$cs = Yii::app()->getClientScript();  
		
		FunctionsV3::handleLanguage();
		$lang=Yii::app()->language;				
		$cs = Yii::app()->getClientScript();
		$cs->registerScript(
		  'lang',
		  "var lang='$lang';",
		  CClientScript::POS_HEAD
		);
						
		$dict = mobileWrapper::getAppLanguage();
		self::$global_dict = $dict;
				
		$dict=json_encode($dict);
		$cs->registerScript(
		  'dict',
		  "var dict=$dict;",
		  CClientScript::POS_HEAD
		);
		
		$cs->registerScript(
		  'ajaxurl',
		 "var ajaxurl='$ajaxurl';",
		  CClientScript::POS_HEAD
		);
		
		
        $csrfTokenName = Yii::app()->request->csrfTokenName;
        $csrfToken = Yii::app()->request->csrfToken;        
        
		$cs->registerScript(
		  "$csrfTokenName",
		 "var $csrfTokenName='$csrfToken';",
		  CClientScript::POS_HEAD
		);
		
		/*JS FILE*/				
		Yii::app()->clientScript->registerScriptFile(
        Yii::app()->baseUrl . '/protected/modules/'.APP_FOLDER.'/assets/js/jquery-v3.4.1.js',
		CClientScript::POS_END
		);
				
		Yii::app()->clientScript->registerScriptFile(
        Yii::app()->baseUrl . '/protected/modules/'.APP_FOLDER.'/assets/vendor/jquery-ui-1.12.1/jquery-ui.min.js',
		CClientScript::POS_END
		);
					
		Yii::app()->clientScript->registerScriptFile(
        Yii::app()->baseUrl . '/protected/modules/'.APP_FOLDER.'/assets/vendor/bootstrap-4.2.1/js/bootstrap.min.js',
		CClientScript::POS_END
		);
		
		Yii::app()->clientScript->registerScriptFile(
        Yii::app()->baseUrl . '/protected/modules/'.APP_FOLDER.'/assets/vendor/popper.min.js',
		CClientScript::POS_END
		);
				
					
		Yii::app()->clientScript->registerScriptFile(
        Yii::app()->baseUrl . '/protected/modules/'.APP_FOLDER.'/assets/vendor/jquery.webui-popover.min.js',
		CClientScript::POS_END
		);
		
		Yii::app()->clientScript->registerScriptFile(
        Yii::app()->baseUrl . '/protected/modules/'.APP_FOLDER.'/assets/vendor/datatables/datatables.min.js',
		CClientScript::POS_END
		);
		
		Yii::app()->clientScript->registerScriptFile(
	        Yii::app()->baseUrl . '/protected/modules/'.APP_FOLDER.'/assets/js/jquery.translate.js',
			CClientScript::POS_END
		);
		
		Yii::app()->clientScript->registerScriptFile(
	        Yii::app()->baseUrl . '/protected/modules/'.APP_FOLDER.'/assets/vendor/loader/jquery.loading.min.js',
			CClientScript::POS_END
		);
		
		Yii::app()->clientScript->registerScriptFile(
	        Yii::app()->baseUrl . '/protected/modules/'.APP_FOLDER.'/assets/vendor/notify/bootstrap-notify.min.js',
			CClientScript::POS_END
		);
		
		Yii::app()->clientScript->registerScriptFile(
	        Yii::app()->baseUrl . '/protected/modules/'.APP_FOLDER.'/assets/js/SimpleAjaxUploader.min.js',
			CClientScript::POS_END
		);
				
				
		Yii::app()->clientScript->registerScriptFile(
	        Yii::app()->baseUrl . '/protected/modules/'.APP_FOLDER.'/assets/vendor/jquery.validate.min.js',
			CClientScript::POS_END
		);
		
		Yii::app()->clientScript->registerScriptFile(
	        Yii::app()->baseUrl . '/mobileappv2/ajax/validate_lang',
			CClientScript::POS_END
		);
		
		Yii::app()->clientScript->registerScriptFile(
	        Yii::app()->baseUrl . '/protected/modules/'.APP_FOLDER.'/assets/vendor/chosen/chosen.jquery.min.js',
			CClientScript::POS_END
		);
		
		Yii::app()->clientScript->registerScriptFile(
	        Yii::app()->baseUrl . '/protected/modules/'.APP_FOLDER.'/assets/js/app.js',
			CClientScript::POS_END
		);
		
		Yii::app()->clientScript->registerScriptFile(
	        Yii::app()->baseUrl . '/protected/modules/'.APP_FOLDER.'/assets/js/map_wrapper.js',
			CClientScript::POS_END
		);
		
		/*END JS FILE*/
				
		/*CSS FILE*/
		$baseUrl = Yii::app()->baseUrl."/protected/modules/".APP_FOLDER; 		
		$cs = Yii::app()->getClientScript();		
		$cs->registerCssFile($baseUrl."/assets/vendor/bootstrap-4.2.1/css/bootstrap.min.css");		
		$cs->registerCssFile($baseUrl."/assets/vendor/ionicons-2.0.1/css/ionicons.min.css");
		$cs->registerCssFile($baseUrl."/assets/vendor/jquery.webui-popover.min.css");
		$cs->registerCssFile("//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css");			
		$cs->registerCssFile($baseUrl."/assets/vendor/datatables/datatables.min.css");
		
		$cs->registerCssFile($baseUrl."/assets/css/animate.min.css");
		$cs->registerCssFile($baseUrl."/assets/vendor/loader/jquery.loading.min.css");									
		$cs->registerCssFile($baseUrl."/assets/vendor/chosen/chosen.min.css");	
		
		$cs->registerCssFile($baseUrl."/assets/css/app.css?ver=1.0");
		$cs->registerCssFile($baseUrl."/assets/css/responsive.css?ver=1.0");
	}

	public function beforeControllerAction($controller, $action)
	{				
		if(parent::beforeControllerAction($controller, $action))
		{
			// this method is called before any module controller action is performed
			// you may place customized code here									
			return true;
		}
		else
			return false;
	}
}

function mt($words='', $params=array())
{
	return mobileWrapper::t($words,$params);
}