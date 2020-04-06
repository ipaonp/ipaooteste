
<?php echo CHtml::beginForm('','post',array(
'class'=>"form-horizontal"
)); ?> 

<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#tabapi"><?php echo merchantApp::t("API")?></a></li>
  <li><a data-toggle="tab" href="#tabappsettings"><?php echo merchantApp::t("App Settings")?></a></li>
  <li><a data-toggle="tab" href="#fcm"><?php echo merchantApp::t("Firebase Cloud Messaging")?></a></li>
  <!--<li><a data-toggle="tab" href="#legacy"><?php echo merchantApp::t("Push Legacy Settings")?></a></li>-->
</ul>  

<div class="tab-content">

  <div id="tabapi" class="tab-pane in active pad10">

	<div style="padding-left:20px;">
	 <div class="form-group" id="chosen-field">
	  <label ><b><?php echo merchantApp::t("Your mobile API URL")?></b></label><br/>
	  <p class="bg-success inlineblock"><?php echo websiteUrl()."/merchantapp/api" ?></p>
	  <p><?php echo merchantApp::t("Set this url on your merchant app config files on")?> www/js/config.js</p>
	 </div>
	 </div>
 	
	<div class="form-group ">
	<label class="col-sm-2 control-label"><?php echo merchantApp::t("API hash key")?></label>
	<div class="col-sm-8">
	<?php 
	echo CHtml::textField('merchant_app_hash_key',getOptionA('merchant_app_hash_key'),array(
	  'class'=>'form-control'      
	));
	?>   
	</div>
	</div>
	<p class="text-small text-muted">
	<?php echo merchantApp::t("api hash key is optional this features make your api secure. make sure you put same api hash key on your")?> www/js/config.js <br/>
	<?php echo merchantApp::t("Sample api hash key").": <b>".md5(Yii::app()->functions->generateCode(50))."</b>"?>
	</p>
   
  </div> <!--tabapi-->
  
  <DIV id="tabappsettings" class="tab-pane pad10">

    <div class="form-group ">
	  <label class="col-sm-2 control-label"><?php echo merchantApp::t("Enabled New Order Alert")?></label>
	  <div class="col-sm-8">
	    <?php 
	    echo CHtml::checkBox('merchant_app_enabled_alert',
	    $merchant_app_enabled_alert==1?true:false
	    ,array(
	      'value'=>1
	    ));
	    ?>   
	    <p class="text-muted top5">
	    <?php echo merchantApp::t("This will continue to alert when there is new order it will not stop unless the order is open")?>.
	    </p>
	  </div>
	</div>  
	
	<div class="form-group ">
	  <label class="col-sm-2 control-label"><?php echo merchantApp::t("Order Alert Interval")?></label>
	  <div class="col-sm-8">
	    <?php 
	    echo CHtml::textField('merchant_app_alert_interval',$merchant_app_alert_interval,array(
	     'class'=>'form-control numeric_only',
	     'style'=>'width:100px;',	     
	    ));
	    ?>   
	    <p class="text-muted top5">
	    <?php echo merchantApp::t("in seconds. default is 15 seconds")?>.
	    </p>
	  </div>
	</div>  
	
	
	<div class="form-group ">
	  <label class="col-sm-2 control-label"><?php echo merchantApp::t("Enabled Request Cancel Order Alert")?></label>
	  <div class="col-sm-8">
	    <?php 
	    echo CHtml::checkBox('merchant_app_cancel_order_alert',
	    $merchant_app_cancel_order_alert==1?true:false
	    ,array(
	      'value'=>1
	    ));
	    ?>   
	    <p class="text-muted top5">
	    <?php echo merchantApp::t("This will continue to alert when there is cancel order it will not stop unless the order is open")?>.
	    </p>
	  </div>
	</div>  
	
	<div class="form-group ">
	  <label class="col-sm-2 control-label"><?php echo merchantApp::t("Cancel Order Alert Interval")?></label>
	  <div class="col-sm-8">
	    <?php 
	    echo CHtml::textField('merchant_app_cancel_order_alert_interval',$merchant_app_cancel_order_alert_interval,array(
	     'class'=>'form-control numeric_only',
	     'style'=>'width:100px;',	     
	    ));
	    ?>   
	    <p class="text-muted top5">
	    <?php echo merchantApp::t("in seconds. default is 15 seconds")?>.
	    </p>
	  </div>
	</div>  
	
	 <div class="form-group ">
	  <label class="col-sm-2 control-label"><?php echo merchantApp::t("Keep App awake")?></label>
	  <div class="col-sm-8">
	    <?php 
	    echo CHtml::checkBox('merchant_app_keep_awake',
	    $merchant_app_keep_awake==1?true:false
	    ,array(
	      'value'=>1
	    ));
	    ?>   
	    <p class="text-muted top5">
	    <?php echo merchantApp::t("this options will not turn off screen when the app is active")?>.
	    </p>
	  </div>
	</div>  
	
	<div class="form-group ">
	  <label class="col-sm-2 control-label"><?php echo merchantApp::t("App Default Language")?></label>
	  <div class="col-sm-8">
	    <?php     
	    echo CHtml::dropDownList('merchant_app_force_lang',
	    getOptionA('merchant_app_force_lang')
	    ,
	    (array)FunctionsV3::getEnabledLanguageList(true)	    
	    ,array(
	      'class'=>"form-control"
	    ));
	    ?>  
	    <p><?php echo merchantApp::t("Force default language")?></p> 
	  </div>
	</div>	
	
    <div class="form-group ">
	  <label class="col-sm-2 control-label"><?php echo merchantApp::t("New Order Push Status")?></label>
	  <div class="col-sm-8">
	    <?php 
	    echo CHtml::dropDownList('merchant_app_new_order_status',
	    getOptionA('merchant_app_new_order_status'),
	    (array)Yii::app()->functions->orderStatusList(),array(
	      'class'=>"form-control"
	    ));
	    ?>   
	    <p class="text-muted top5">
		<?php echo merchantApp::t("send push notification based on this order status")?>
		</p>
	  </div>
	</div>  
		
	<div class="form-group ">
	  <label class="col-sm-2 control-label"><?php echo merchantApp::t("Pending orders tab")?></label>
	  <div class="col-sm-8" id="chosen-field">
	   <?php 
	   $order_status_list2 = $order_status_list;
	   unset($order_status_list2[0]);
	   echo CHtml::dropDownList('merchant_app_pending_tabs[]',
	   (array)$pending_tabs,
	   (array)$order_status_list2,
	   array(
	    'class'=>'form-control chosen',
	    'multiple'=>true
	   ))?>  
	    <p class="text-muted top5">
		<?php echo merchantApp::t("Set the status of pending orders that will show on pending tab on the app. if you leave it empty default is pending")?>
		</p>
	  </div>
	</div>	
		
	<div class="form-group">
	    <label class="col-sm-2 control-label"><?php echo merchantApp::t("Accept Order Status")?></label>
	    <div class="col-sm-6">
	      <?php
	      echo CHtml::dropDownList('merchant_app_accept_order_status',getOptionA('merchant_app_accept_order_status'),
	      (array)$order_status_list,array(
	        'class'=>"form-control"
	      ))
	      ?>
	     <p class="text-muted top5">
		 <?php echo merchantApp::t("this will be the status when the merchant accept the order")?>
		 </p>	      
	    </div>
	</div>	  	
	
	<div class="form-group">
	    <label class="col-sm-2 control-label"><?php echo merchantApp::t("Decline Order Status")?></label>
	    <div class="col-sm-6">
	      <?php
	      echo CHtml::dropDownList('merchant_app_decline_order_status',getOptionA('merchant_app_decline_order_status'),
	      (array)$order_status_list,array(
	        'class'=>"form-control"
	      ))
	      ?>	      
	      <p class="text-muted top5">
		 <?php echo merchantApp::t("this will be the status when the merchant decline the order")?>
		 </p>	      
	    </div>
	</div>	  	

	<div class="form-group">
	    <label class="col-sm-2 control-label"><?php echo merchantApp::t("Driver App Order Status Accepted")?></label>
	    <div class="col-sm-6">
	      <?php
	      echo CHtml::dropDownList('drv_order_status',getOptionA('drv_order_status'),
	      (array)$order_status_list,array(
	        'class'=>"form-control"
	      ))
	      ?>
	      <p class="text-muted top5">
	      <?php echo merchantApp::t("The order status that will based to insert the order as task")?>
	      </p>
	    </div>
	</div>	 	
	
	
	<div class="form-group">
	    <label class="col-sm-2 control-label"><?php echo merchantApp::t("Request Cancel Order approved status")?></label>
	    <div class="col-sm-6">
	      <?php
	      echo CHtml::dropDownList('website_review_approved_status',getOptionA('website_review_approved_status'),
	      (array)$order_status_list,array(
	        'class'=>"form-control"
	      ))
	      ?>
	      <p class="text-muted top5">
	      <?php echo merchantApp::t("The order status that will set when the request order cancel is approved")?>
	      </p>
	    </div>
	</div>	 	
  
  </DIV><!-- tabappsettings-->
  
  <DIV id="fcm" class="tab-pane pad10">

    <div class="form-group" >
	    <label class="col-sm-2 control-label"><?php echo merchantApp::t("Server Key")?></label>
	    <div class="col-sm-10">
	    <?php 
	    echo CHtml::textField('merchantapp_push_server_key',getOptionA('merchantapp_push_server_key'),array(
		'class'=>'form-control',
		));
	    ?>        
	    </div>
	 </div>	  
  
  </DIV><!-- tabappsettings-->
  
  <DIV id="legacy" class="tab-pane  pad10">
	     
	<div class="form-group ">
	  <label class="col-sm-2 control-label"><?php echo merchantApp::t("Android Push API Key")?></label>
	  <div class="col-sm-8">
	    <?php 
	    echo CHtml::textField('merchant_android_api_key',getOptionA('merchant_android_api_key'),array(
	      'class'=>'form-control'      
	    ));
	    ?>   
	  </div>
	</div> 
	
 <div class="form-group">
    <label class="col-sm-2 control-label"><?php echo merchantApp::t("IOS Push Mode")?></label>
    <div class="col-sm-8">
    <?php 
    echo CHtml::dropDownList('mt_ios_push_mode',getOptionA('mt_ios_push_mode'),array(
      "development"=>merchantApp::t("Development"),
      "production"=>merchantApp::t("Production")
    ),array(
      'class'=>"form-control"
    ));
    ?>
    </div>
  </div>
      
  <div class="form-group">
    <label class="col-sm-2 control-label"><?php echo merchantApp::t("IOS Push Certificate PassPhrase")?></label>
    <div class="col-sm-8">
    <?php 
    echo CHtml::textField('mt_ios_passphrase',getOptionA('mt_ios_passphrase'),array(
      'class'=>'form-control',
    ));
    ?>
    </div>
  </div>
  
  <div class="form-group">
    <label class="col-sm-2 control-label"><?php echo merchantApp::t("IOS Push Development Certificate")?></label>
    <div class="col-sm-8">
    <a id="upload-certificate-dev" href="javascript:;" class="btn btn-default"><?php echo merchantApp::t("Browse")?></a>        
    <?php if (!empty($ios_push_dev_cer)):?>
    <span><?php echo $ios_push_dev_cer?></span>
    <?php endif;?>
    </div>
  </div>
  
  <div class="form-group">
    <label class="col-sm-2 control-label"><?php echo merchantApp::t("IOS Push Production Certificate")?></label>
    <div class="col-sm-8">
    <a id="upload-certificate-prod" href="javascript:;" class="btn btn-default"><?php echo merchantApp::t("Browse")?></a> 
    <?php if (!empty($ios_push_prod_cer)):?>
    <span><?php echo $ios_push_prod_cer?></span>
    <?php endif;?>
    </div>
  </div>
  	
  
  </DIV><!-- tabappsettings-->
  
 
</div><!--tab-content-->

<div class="form-group pad10">  
  
  <?php
echo CHtml::ajaxSubmitButton(
	merchantApp::t('Save Settings'),
	array('ajax/savesettings'),
	array(
		'type'=>'POST',
		'dataType'=>'json',
		'beforeSend'=>'js:function(){
		                 busy(true); 	
		                 $("#save-settings").val("'.merchantApp::t('processing').'");
		                 $("#save-settings").css({ "pointer-events" : "none" });	                 	                 
		              }
		',
		'complete'=>'js:function(){
		                 busy(false); 		                 
		                 $("#save-settings").val("'.merchantApp::t('Save Settings').'");
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
 
</div> <!--div-->

<?php echo CHtml::endForm(); ?>