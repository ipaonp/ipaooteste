<?php echo CHtml::beginForm('','post',array(
 'onsubmit'=>"return false;"
)); 
?> 

<div class="custom-control custom-checkbox">  
  <?php 
  echo CHtml::checkBox('mobile2_analytics_enabled',
  getOptionA('mobile2_analytics_enabled')==1?true:false
  ,array(
    'id'=>'mobile2_analytics_enabled',
    'class'=>"custom-control-input"
  ));
  ?>
  <label class="custom-control-label" for="mobile2_analytics_enabled">
    <?php echo mobileWrapper::t("Enabled Analytics")?>
  </label>
</div>

<div class="height10"></div>



<div class="form-group">
    <label><?php echo mobileWrapper::t("Analytics ID")?></label>
        
    <?php 
    echo CHtml::textField('mobile2_analytics_id',getOptionA('mobile2_analytics_id'),array(
     'class'=>"form-control",
     'required'=>true,
     'placeholder'=>mobileWrapper::t("UA-XXXX-YY")
    ));
    ?>        
  </div>  



<?php
echo CHtml::ajaxSubmitButton(
	mobileWrapper::t('Save Settings'),
	array('ajax/savesettings_analytics'),
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
	  'id'=>'save_analytics'
	)
);
?>

<?php echo CHtml::endForm(); ?>