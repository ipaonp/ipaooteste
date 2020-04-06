<h5><?php echo mt('Set Map Default location')?></h5>

<?php echo CHtml::beginForm('','post',array(
 'onsubmit'=>"return false;"
));

 $default_lat = getOptionA('mobile2_default_lat');
 $default_lng = getOptionA('mobile2_default_lng');

 echo CHtml::hiddenField('mobile2_default_lat', $default_lat);
 echo CHtml::hiddenField('mobile2_default_lng', $default_lng);

if(!empty($default_lng) && !empty($default_lng)) {
	$cs = Yii::app()->getClientScript();
	$cs->registerScript(
	  'mobile2_default_lat',
	  "var mobile2_default_lat='$default_lat';",
	  CClientScript::POS_HEAD
	);
	$cs = Yii::app()->getClientScript();
	 $cs->registerScript(
	  'mobile2_default_lng',
	  "var mobile2_default_lng='$default_lng';",
	  CClientScript::POS_HEAD
	);
}
?> 

<div class="map_canvas" id="map_wrapper">
</div>

<?php
echo CHtml::ajaxSubmitButton(
	mobileWrapper::t('Save Settings'),
	array('ajax/savemap_settings'),
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
	  'id'=>'save_map_settings'
	)
);
?>

<?php echo CHtml::endForm(); ?>