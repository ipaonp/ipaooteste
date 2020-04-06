<?php echo CHtml::beginForm('','post',array(
 'onsubmit'=>"return false;",
 'id'=>"upload_form"
)); 
echo CHtml::hiddenField('android_push_icon',$upload_push_icon);
echo CHtml::hiddenField('android_push_picture',$upload_push_picture);
?> 

<div class="form-group">
<button id="uploadpushicon" type="button" class="btn btn-light">
 <?php echo mobileWrapper::t("Browse")?>
</button>    
<label><?php echo mobileWrapper::t("Android Push Icon")?></label>

<small class="form-text text-muted">
   <?php echo mobileWrapper::t("Push icon is needed for android 6,7")?>
</small>
    
</div> 

<?php if(!empty($upload_push_icon)):?> 
<div class="card preview_uploadpushicon" style="width: 10rem;">
	<img class="img-thumbnail" src="<?php echo mobileWrapper::getImage($upload_push_icon)?>" >
	
	<div class="card-body">
	  <a href="javascript:;" data-id="uploadpushicon" 
	  data-fieldname="android_push_icon" 
	  class="card-link remove_picture"><?php echo mobileWrapper::t("Remove Image");?></a>
	</div>
	
</div>			 
<div class="height10"></div>
<?php endif;?>


<div class="custom-control custom-checkbox">  
  <?php 
  echo CHtml::checkBox('android_enabled_pushpic',
  getOptionA('android_enabled_pushpic')==1?true:false
  ,array(
    'id'=>'android_enabled_pushpic',
    'class'=>"custom-control-input"
  ));
  ?>
  <label class="custom-control-label" for="android_enabled_pushpic">
    <?php echo mobileWrapper::t("Enabled Push Picture")?>
  </label>
</div>

<div class="height10"></div>

<div class="form-group">
<button id="uploadpushpicture" type="button" class="btn btn-light">
 <?php echo mobileWrapper::t("Browse")?>
</button>    
<label><?php echo mobileWrapper::t("Android Push Picture")?></label>

<small class="form-text text-muted">
   <?php echo mobileWrapper::t("Push Picture will work only on android 5,6,7")?>
</small>

</div> 

<?php if(!empty($upload_push_picture)):?> 
<div class="card preview_uploadpushpicture" style="width: 10rem;">
	<img class="img-thumbnail" src="<?php echo mobileWrapper::getImage($upload_push_picture)?>" >
	
	<div class="card-body">
	  <a href="javascript:;" data-id="uploadpushpicture" 
	  data-fieldname="android_push_picture" 
	  class="card-link remove_picture"><?php echo mobileWrapper::t("Remove Image");?></a>
	</div>
	
</div>			 
<div class="height10"></div>
<?php endif;?>

<?php
echo CHtml::ajaxSubmitButton(
	mobileWrapper::t('Save Settings'),
	array('ajax/savesettings_android'),
	array(
		'type'=>'POST',
		'dataType'=>'json',
		'beforeSend'=>'js:function(){
		   loader(1);                 
		}',
		'complete'=>'js:function(){		                 
		   loader(2);
		}',
		'success'=>'js:function(data){	
		   if(data.code==1){
		     notify(data.msg);
		   } else {
		     notify(data.msg,"danger");
		   }
		}',
		'error'=>'js:function(data){
		   notify(error_ajax_message,"danger");
		}',
	),array(
	  'class'=>'btn '.APP_BTN,
	  'id'=>'save_android'
	)
);
?>

<?php echo CHtml::endForm(); ?>