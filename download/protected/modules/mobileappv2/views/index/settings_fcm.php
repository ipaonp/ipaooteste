<?php echo CHtml::beginForm('','post',array(
 'onsubmit'=>"return false;"
)); 
?> 
<div class="form-group">
    <label><?php echo mobileWrapper::t("Server Key")?></label>
        
    <?php 
    echo CHtml::textField('mobileapp2_push_server_key',getOptionA('mobileapp2_push_server_key'),array(
     'class'=>"form-control",
     'required'=>true,     
    ));
    ?>        
  </div>  



<?php
echo CHtml::ajaxSubmitButton(
	mobileWrapper::t('Save Settings'),
	array('ajax/savesettings_fcm'),
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
	  'id'=>'save_fcm'
	)
);
?>

<?php echo CHtml::endForm(); ?>