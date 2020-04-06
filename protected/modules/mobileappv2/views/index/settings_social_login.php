<?php echo CHtml::beginForm('','post',array(
 'onsubmit'=>"return false;"
)); 
?> 

<div class="custom-control custom-checkbox">  
  <?php 
  echo CHtml::checkBox('mobile2_enabled_fblogin',
  getOptionA('mobile2_enabled_fblogin')==1?true:false
  ,array(
    'id'=>'mobile2_enabled_fblogin',
    'class'=>"custom-control-input"
  ));
  ?>
  <label class="custom-control-label" for="mobile2_enabled_fblogin">
    <?php echo mobileWrapper::t("Enabled Facebook Login")?>
  </label>
</div>

<div class="height10"></div>



<div class="custom-control custom-checkbox">  
  <?php 
  echo CHtml::checkBox('mobile2_enabled_googlogin',
  getOptionA('mobile2_enabled_googlogin')==1?true:false
  ,array(
    'id'=>'mobile2_enabled_googlogin',
    'class'=>"custom-control-input"
  ));
  ?>
  <label class="custom-control-label" for="mobile2_enabled_googlogin">
    <?php echo mobileWrapper::t("Enabled Google Login")?>
  </label>
</div>

<div class="height10"></div>



<?php
echo CHtml::ajaxSubmitButton(
	mobileWrapper::t('Save Settings'),
	array('ajax/savesettings_social'),
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
	  'id'=>'save_social'
	)
);
?>

<?php echo CHtml::endForm(); ?>