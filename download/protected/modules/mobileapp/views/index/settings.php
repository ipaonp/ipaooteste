
<div class="pad10">

 <?php echo CHtml::beginForm(); ?>  
 
 <?php  
 $ios_push_dev_cer=getOptionA('ios_push_dev_cer');
 $ios_push_prod_cer=getOptionA('ios_push_prod_cer');
 
 echo CHtml::hiddenField('mobile_default_image_not_available',
 getOptionA('mobile_default_image_not_available')
 ,array(
   'class'=>'mobile_default_image_not_available'
 ));
 
 echo CHtml::hiddenField('ios_push_dev_cer',$ios_push_dev_cer,array(
  'class'=>'ios_push_dev_cer'
 ));
 echo CHtml::hiddenField('ios_push_prod_cer',$ios_push_prod_cer,array(
  'class'=>'ios_push_prod_cer'
 ));
 ?>
 
 
  <ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#tabapi"><?php echo AddonMobileApp::t("API")?></a></li>
  <li><a data-toggle="tab" href="#tabappsettings"><?php echo AddonMobileApp::t("App Settings")?></a></li>
  <li><a data-toggle="tab" href="#tabfacebook"><?php echo AddonMobileApp::t("Social Login")?></a></li>
  <li><a data-toggle="tab" href="#tabanalytics"><?php echo AddonMobileApp::t("Google Analytics")?></a></li>
  <li><a data-toggle="tab" href="#androidsettings"><?php echo AddonMobileApp::t("Android Settings")?></a></li>
  <li><a data-toggle="tab" href="#fcm"><?php echo AddonMobileApp::t("Firebase Cloud Messaging")?></a></li>
  <li><a data-toggle="tab" href="#legacy"><?php echo AddonMobileApp::t("Push Legacy Settings")?></a></li>
</ul>

<div class="tab-content">

  <div id="tabapi" class="tab-pane in active pad10">

	<div class="form-group" id="chosen-field">
	<label ><?php echo AddonMobileApp::t("Your mobile API URL")?></label><br/>
	<p class="bg-success inlineblock"><?php echo websiteUrl()."/mobileapp/api" ?></p>
	<p class="text-muted"><?php echo AddonMobileApp::t("Set this url on your mobile app config files on")?> www/js/config.js</p>
	</div>
	
	<p>
	<?php if(!empty($mobileapp_api_has_key)):?>
	<a href="<?php echo Yii::app()->createUrl('mobileapp/api/testapi'."/?api_key=$mobileapp_api_has_key")?>" target="_blank" class="btn btn-info">
	<?php else :?>
	<a href="<?php echo Yii::app()->createUrl('mobileapp/api/testapi')?>" target="_blank" class="btn btn-info">
	<?php endif;?>
	<?php echo AddonMobileApp::t("Click here to test your api")?>
	</a>
	</p>
	
	<div class="form-group">
	<label ><?php echo AddonMobileApp::t("API hash key")?></label>
	<?php 
	echo CHtml::textField('mobileapp_api_has_key',$mobileapp_api_has_key,array(
	'class'=>'form-control',
	));
	?>
	</div>
	<P class="text-small text-muted">
	<?php echo AddonMobileApp::t("api hash key is optional this features make your api secure. make sure you put same api hash key on your")?> www/js/config.js <br/>
	<?php echo AddonMobileApp::t("Sample api hash key").": <b>".md5(Yii::app()->functions->generateCode(50))."</b>"?>
	</P>
	
	
  </div> <!--tab tabapi-->
  
  <div id="tabappsettings" class="tab-pane pad10">

  <div class="form-group" id="chosen-field">
    <label ><?php echo AddonMobileApp::t("Location")?></label>
    <?php echo CHtml::dropDownList('mobile_country_list[]',
    $mobile_country_list,
   (array)$country_list,
   array(
    'class'=>'form-control chosen',
    'multiple'=>true
  ))?>  
  </div> 
  
  <div class="form-group">
	<label ><?php echo AddonMobileApp::t("Default Image")?></label>
	<a id="upload-file" href="javascript:;" class="btn btn-default"><?php echo AddonMobileApp::t("Browse")?></a>
	<?php if (!empty($default_image_url)):?>
	<img src="<?php echo $default_image_url?>" alt="" class="my-thumb img-thumbnail">       
	<?php endif;?>
	</div>
	
  <div class="form-group" >
    <label style="padding-right:10px;" ><?php echo AddonMobileApp::t("Show Description on addon item")?></label>
    <?php 
    echo CHtml::checkBox('show_addon_description',
    getOptionA('show_addon_description')==1?true:false
    ,array(
      'value'=>1
    ))
    ?>
    </div>  
    
<!--    <div class="form-group" >
	<label style="padding-right:10px;" ><?php echo AddonMobileApp::t("Enabled Delivery Select Map")?></label>
	<?php 
	echo CHtml::checkBox('web_enabled_delivery_select_map',
	getOptionA('web_enabled_delivery_select_map')==1?true:false
	,array(
	'value'=>1
	))
	?>
	<p class="text-muted"><?php echo AddonMobileApp::t("this will enabled select address from map during checkout")?></p>
	</div>
	-->
	
    <div class="form-group" >
	<label style="padding-right:10px;" ><?php echo AddonMobileApp::t("Activate Menu 1")?></label>
	<?php 
	echo CHtml::checkBox('mobile_menu',
	getOptionA('mobile_menu')==1?true:false
	,array(
	'value'=>1
	))
	?>
	<p class="text-muted"><?php echo AddonMobileApp::t("this menu options display only food name and price")?></p>
	</div>
	
	<div class="form-group" >
	<label style="padding-right:10px;" ><?php echo AddonMobileApp::t("Show category image")?></label>
	<?php 
	echo CHtml::checkBox('mobile_show_category_image',
	getOptionA('mobile_show_category_image')==1?true:false
	,array(
	'value'=>1
	))
	?>	
	</div>
	
	 <div class="form-group" >
	    <label style="padding-right:10px;"><?php echo AddonMobileApp::t("Save cart to database")?></label>
	    <?php 
	    echo CHtml::checkBox('mobile_save_cart_db',
	    getOptionA('mobile_save_cart_db')==1?true:false
	    ,array(
	      'value'=>1
	    ))
	    ?>    
	    <p class="text-muted"><?php echo AddonMobileApp::t("this options will save the cart on database instead on device")?></p>
	  </div>
	  
	<div class="form-group" >
	<label style="padding-right:10px;"><?php echo AddonMobileApp::t("Enabled Auto Location")?></label>
	<?php 
	echo CHtml::checkBox('mobile_auto_location',
	getOptionA('mobile_auto_location')==1?true:false
	,array(
	  'value'=>1
	))
	?>    	
	</div>
	  	  
 <div class="form-group" >
	    <label style="padding-right:10px;"><?php echo AddonMobileApp::t("App Default Language")?></label>
	    <?php 
	    $lang_list[0]=t("Please select");
	    $enabled_lang=FunctionsV3::getEnabledLanguage();	    
	    if(is_array($enabled_lang) && count($enabled_lang)>=1){
	    	foreach ($enabled_lang as $val) {
	    		$lang_list[$val]=$val;
	    	}
	    }
	    	    
	    echo CHtml::dropDownList('force_app_default_lang',getOptionA('force_app_default_lang'),
	    (array)$lang_list,array(
	      'class'=>"form-control"
	    ));
	    ?>    
	    <p class="text-muted"><?php echo AddonMobileApp::t("Force default language")?></p>
	  </div>  

 <div class="form-group" >
	    <label style="padding-right:10px;"><?php echo AddonMobileApp::t("Location Accuracy")?></label>
	    <?php 
	    echo CHtml::dropDownList('mobileapp_location_accuracy',getOptionA('mobileapp_location_accuracy'),
	    array(
	      'true'=>AddonMobileApp::t("true"),
	      'false'=>AddonMobileApp::t("false"),
	    ),array(
	      'class'=>"form-control"
	    ));
	    ?>    
	    <!--<p class="text-muted"><?php echo AddonMobileApp::t("Force default language")?></p>-->
	  </div>   

 <div class="form-group" >
	    <label style="padding-right:10px;"><?php echo AddonMobileApp::t("Get Current location results")?></label>
	    <?php 
	    echo CHtml::dropDownList('app_current_location_results',getOptionA('app_current_location_results'),
	    array(
	       'formatted_address'=>AddonMobileApp::t("formatted address"),
	       'address'=>AddonMobileApp::t("address"),
	       'city'=>AddonMobileApp::t("city"),
	       'state'=>AddonMobileApp::t("state")
	    )
	    ,array(
	      'class'=>"form-control"
	    ));
	    ?>        
	  </div> 	    
  
  </div> <!--tab tabappsettings-->
  
  
  <div id="tabfacebook" class="tab-pane pad10">

   <!--  <div class="form-group">
	<label ><?php echo AddonMobileApp::t("Facebook APP ID")?></label>
	<?php 
	echo CHtml::textField('mobile_facebookid',getOptionA('mobile_facebookid'),array(
	  'class'=>'form-control',
	  'style'=>"width:200px;"
	));
	?>
	</div> -->
	
	<h3><?php echo AddonMobileApp::t("Facebook")?></h3>
	
	<div class="form-group" style="margin-top: 30px">
    <label style="padding-right:10px;"><?php echo AddonMobileApp::t("Enabled Facebook Login")?></label>
    <?php 
    echo CHtml::checkBox('mobile_enabled_fblogin',
    getOptionA('mobile_enabled_fblogin')==1?true:false
    ,array(
      'value'=>1
    ))
    ?>        
  </div>	
  
  <div class="form-group" style="margin-top: 30px">
    <label style="padding-right:10px;"><?php echo AddonMobileApp::t("Save profile picture")?></label>
    <?php 
    echo CHtml::checkBox('mobile_fb_save_pic',
    getOptionA('mobile_fb_save_pic')==1?true:false
    ,array(
      'value'=>1
    ))
    ?>        
  </div>	
  
   <hr/>
   
   <h3><?php echo AddonMobileApp::t("Google")?></h3>
	
	<div class="form-group" style="margin-top: 30px">
    <label style="padding-right:10px;"><?php echo AddonMobileApp::t("Enabled Google Login")?></label>
    <?php 
    echo CHtml::checkBox('mobile_enabled_googlogin',
    getOptionA('mobile_enabled_googlogin')==1?true:false
    ,array(
      'value'=>1
    ))
    ?>        
  </div>	
  
  </div> <!--tabfacebook-->
  
  
  <div id="tabanalytics" class="tab-pane pad10">
     <div class="row">
     <div class="form-group">
		<label ><?php echo AddonMobileApp::t("Google Analytics ID")?></label>
		<?php 
		echo CHtml::textField('mobile_analytics_id',getOptionA('mobile_analytics_id'),array(
		  'class'=>'form-control',
		  'style'=>"width:200px;",
		  'placeholder'=>AddonMobileApp::t("UA-XXXX-YY")
		));
		?> 
    </div> 
    
     <div class="form-group" style="margin-top: 30px">
	    <label style="padding-right:10px;"><?php echo AddonMobileApp::t("Enabled")?></label>
	    <?php 
	    echo CHtml::checkBox('mobile_analytics_enabled',
	    getOptionA('mobile_analytics_enabled')==1?true:false
	    ,array(
	      'value'=>1
	    ))
	    ?>        
	  </div>	
    
    </div>
    
  </div> <!--tabgoogle-->
  
  <div id="androidsettings" class="tab-pane pad10">
	
	<?php echo CHtml::hiddenField('upload_push_icon',$upload_push_icon)?>
	<?php echo CHtml::hiddenField('upload_push_picture',$upload_push_picture)?>
	
	<div class="form-group">
	<label ><?php echo AddonMobileApp::t("Android Push Icon")?></label>
	<a id="upload-push-icon" href="javascript:;" class="btn btn-default"><?php echo AddonMobileApp::t("Browse")?></a>	    
	<img src="<?php echo !empty($upload_push_icon)?AddonMobileApp::getImage($upload_push_icon):'';?>" 
	alt="" class="upload_push_icon thumb <?php echo empty($upload_push_icon)?"hide":''?>" > 
	</div>
	
	<?php if(!empty($upload_push_icon)):?>
	<p><a href="javascript:;" class="remove_icon"><?php echo AddonMobileApp::t("remove icon")?></a></p>
	<?php endif;?>
	
	<p class="text-muted"><?php echo AddonMobileApp::t("Push icon is needed for android")?> 6,7</p>
	
	<div class="form-group">
	<label ><?php echo AddonMobileApp::t("Android Push Picture")?></label>
	<a id="upload-push-picture" href="javascript:;" class="btn btn-default"><?php echo AddonMobileApp::t("Browse")?></a>
	
	<img src="<?php echo !empty($upload_push_picture)?AddonMobileApp::getImage($upload_push_picture):'';?>" 
	alt="" class="upload_push_picture thumb <?php echo empty($upload_push_picture)?"hide":''?>" > 
	
	</div> 
	
	<p class="text-muted"><?php echo AddonMobileApp::t("Push Picture will work only on android")?> 5,6,7</p>
	
	<?php if(!empty($upload_push_picture)):?>
	<p><a href="javascript:;" class="remove_push_pic"><?php echo AddonMobileApp::t("remove push picture")?></a></p>
	<?php endif;?>
	
	<div class="form-group" style="margin-top: 30px">
	<label style="padding-right:10px;" ><?php echo AddonMobileApp::t("Enabled Push Picture")?></label>
	<?php 
	echo CHtml::checkBox('mobileapp_enabled_push_picture',
	getOptionA('mobileapp_enabled_push_picture')==1?true:false
	,array(
	  'value'=>1
	))
	?>
	</div>  
   
  </div> <!--androidsettings-->
    
  <div id="fcm" class="tab-pane pad10">

       <div class="form-group" style="margin-top: 30px">
	    <label style="padding-right:10px;"><?php echo AddonMobileApp::t("Server Key")?></label>
	    <?php 
	    echo CHtml::textField('mobileapp_push_server_key',getOptionA('mobileapp_push_server_key'),array(
		'class'=>'form-control',
		));
	    ?>        
	  </div>	 
  
  </div> <!--tab fcm-->
  
  <div id="legacy" class="tab-pane pad10">

     <h3><?php echo AddonMobileApp::t("Android Settings")?></h3>
     <hr/>

     <p><?php echo AddonMobileApp::t("This section is to make your old version of mobile app to still work")?></p>

<div class="form-group">
<label ><?php echo AddonMobileApp::t("Android Push API Key")?></label>
<?php 
echo CHtml::textField('mobile_android_push_key',getOptionA('mobile_android_push_key'),array(
  'class'=>'form-control',
));
?>
</div> 



     <h3><?php echo AddonMobileApp::t("iOS Settings")?></h3>
     <hr/>
     
       <p style="font-size:12px;color:red;">
  <?php echo AddonMobileApp::t("Note: for ios push notification to work make sure your server port 2195 is open")?>.
  </p>
  
   <div class="form-group">
      <label><?php echo AddonMobileApp::t("IOS Push Mode")?></label>
       <?php 
	    echo CHtml::dropDownList('ios_push_mode',getOptionA('ios_push_mode'),array(
	      "development"=>AddonMobileApp::t("Development"),
	      "production"=>AddonMobileApp::t("Production")
	    ),array(
	      'class'=>"form-control"
	    ));
	    ?>
   </div>
   
   <div class="form-group">
    <label><?php echo AddonMobileApp::t("IOS Push Certificate PassPhrase")?></label>
    <?php 
    echo CHtml::textField('ios_passphrase',getOptionA('ios_passphrase'),array(
      'class'=>'form-control',
    ));
    ?>
   </div>    
   
    <div class="form-group">
    <label ><?php echo AddonMobileApp::t("IOS Push Development Certificate")?></label>
    <a id="upload-certificate-dev" href="javascript:;" class="btn btn-default"><?php echo AddonMobileApp::t("Browse")?></a>        
    <?php if (!empty($ios_push_dev_cer)):?>
    <span><?php echo $ios_push_dev_cer?>...</span>
    <?php endif;?>
  </div>
  
   <div class="form-group">
    <label ><?php echo AddonMobileApp::t("IOS Push Production Certificate")?></label>
    <a id="upload-certificate-prod" href="javascript:;" class="btn btn-default"><?php echo AddonMobileApp::t("Browse")?></a> 
    <?php if (!empty($ios_push_prod_cer)):?>
    <span><?php echo $ios_push_prod_cer?>...</span>
    <?php endif;?>
  </div>
  
  </div> <!--tab fcm-->
  
</div><!-- tab-content--> 

  
  <div class="form-group pad10">  
  <?php
echo CHtml::ajaxSubmitButton(
	AddonMobileApp::t('Save Settings'),
	array('ajax/savesettings'),
	array(
		'type'=>'POST',
		'dataType'=>'json',
		'beforeSend'=>'js:function(){
		                 busy(true); 	
		                 $("#save-settings").val("'.AddonMobileApp::t('Processing').'");
		                 $("#save-settings").css({ "pointer-events" : "none" });	                 	                 
		              }
		',
		'complete'=>'js:function(){
		                 busy(false); 		                 
		                 $("#save-settings").val("'.AddonMobileApp::t("Save Settings").'");
		                 $("#save-settings").css({ "pointer-events" : "auto" });	                 	                 
		              }',
		'success'=>'js:function(data){	
		               if(data.code==1){		               
		                 nAlert(data.msg,"success");
		               } else {
		                  nAlert(data.msg,"warning");
		               }
		            }
		'
	),array(
	  'class'=>'btn btn-primary',
	  'id'=>'save-settings'
	)
);
?>
  </div>
  
 <?php echo CHtml::endForm(); ?>

</div>