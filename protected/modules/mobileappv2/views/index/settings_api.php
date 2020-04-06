<?php echo CHtml::beginForm('','post',array(
 'onsubmit'=>"return false;"
)); ?> 

<div class="form-group">
    <label><?php echo mobileWrapper::t("Your mobile API URL")?></label>
    <input name="api_url" type="text" class="form-control copy_text" readonly
 value="<?php echo websiteUrl()."/".APP_FOLDER."/api"?>"
    >
    <small class="form-text text-muted">
       <?php echo mobileWrapper::t("Set this url on your mobile app config files on www/js/config.js")?>
    </small>
  </div>
  
  

<div class="form-group">
    <label><?php echo mobileWrapper::t("API hash key")?></label>
    
    <div class="relative password_wrap">
    <?php 
    echo CHtml::passwordField('mobileapp2_api_has_key',getOptionA('mobileapp2_api_has_key'),array(
     'class'=>"form-control show_password_field",
     'required'=>true
    ));
    ?>
    <a href="javascript:;" class="show_password" data-togle="1"><?php echo mobileWrapper::t("Show")?></a>
    </div>
    <small class="form-text text-muted">
       <?php echo mobileWrapper::t("api hash key is optional this features make your api secure. make sure you put same api hash key on your www/js/config.js")?>
    </small>
  </div>  
  
  <!--<button type="submit" class="btn btn-primary"><?php echo mobileWrapper::t("Save Settings")?></button>-->
  
  <?php
echo CHtml::ajaxSubmitButton(
	mobileWrapper::t('Save Settings'),
	array('ajax/savesettings'),
	array(
		'type'=>'POST',
		'dataType'=>'json',
		'beforeSend'=>'js:function(){
		   loader(1);                 
		}
		',
		'complete'=>'js:function(){		                 
		   loader(2);
		 }',
		'success'=>'js:function(data){	
		   if(data.code==1){
		     notify(data.msg);
		   } else {
		     notify(data.msg,"danger");
		   }
		}
		'
	),array(
	  'class'=>'btn '.APP_BTN,
	  'id'=>'save_api'
	)
);
?>

<a href="<?php echo Yii::app()->createUrl("/".APP_FOLDER."/index/test_api")?>" 
class="btn btn-primary" style="color:#fff;" target="_blank">
  <?php echo mobileWrapper::t("TEST API")?>
</a>

<?php echo CHtml::endForm(); ?>