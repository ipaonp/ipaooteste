
<?php echo CHtml::beginForm('','post',array(
 'onsubmit'=>"return false;"
)); 
?> 


<p><b><?php echo mobileWrapper::t("Startup Options")?></b></p>


<div class="custom-control custom-checkbox">  
  <?php 
  echo CHtml::checkBox('mobile2_enabled_select_language',
  getOptionA('mobile2_enabled_select_language')==1?true:false
  ,array(
    'id'=>'mobile2_enabled_select_language',
    'class'=>"custom-control-input",
    'value'=>1
  ));
  ?>
  <label class="custom-control-label" for="mobile2_enabled_select_language">
    <?php echo mobileWrapper::t("Enabled Select Language")?>
  </label>
</div>

<div class="height10"></div><div class="height10"></div>

<div class="row">

<div class="col-md-3">
	   <div class="radio">
		  <label>
		  <?php 
		  echo CHtml::radioButton('mobileapp2_startup',
		  getOptionA('mobileapp2_startup')==1?true:false
		  ,array(
		    'id'=>'mobileapp2_startup',		    
		    'value'=>1
		  ));
		  ?>
		  <?php echo mobileWrapper::t("Startup 1")?>
		  </label>
		</div>
		<p class="text-muted"><?php echo mt("This will be normal startup")?></p>
	</div> <!--col-->
	
	<div class="col-md-3">
	   <div class="radio">
		  <label>
		  <?php 
		  echo CHtml::radioButton('mobileapp2_startup',
		  getOptionA('mobileapp2_startup')==2?true:false
		  ,array(
		    'id'=>'mobileapp2_startup',		    
		    'value'=>2
		  ));
		  ?>
		  <?php echo mobileWrapper::t("Startup 2")?>
		  </label>
		</div>
		<p class="text-muted"><?php echo mt("This will contain a banner where in you can add your own updates,promo,vouchers et.")?></p>
	</div> <!--col-->
  
</div> <!--row-->



<div class="form-group">
<label><?php echo mt("Startup 2 Banner")?></label>    
<button id="multi_upload" type="button" class="btn btn-light">
 <?php echo mobileWrapper::t("Browse")?>
</button>   

<p class="small"><?php echo mt("Drag image to sort")?></p>
</div> 

<div class="row">
<div id="sortable1" class="col-md-5 d-flex flex-center flex-wrap banner_preview">
<?php if(is_array($startup_banner) && count((array)$startup_banner)>=1):?>
<?php foreach ($startup_banner as $val):?>
  <div class="card preview_uploadpushpicture" style="width: 10rem;">
	<img class="img-thumbnail" src="<?php echo mobileWrapper::getImage($val)?>" >
	
	<div class="card-body">
	  <a href="javascript:;" data-id="uploadpushpicture" 
	  data-fieldname="android_push_picture" 
	  class="card-link multi_remove_picture"><?php echo mobileWrapper::t("Remove Image");?></a>
	</div>
	
	<input type="hidden" name="mobileapp2_startup_banner[]" value="<?php echo $val?>">
 </div>			 
 <div class="height10"></div> 
<?php endforeach;?>
<?php endif;?>
</div>
</div>

<div class="height20"></div>
<div class="height10"></div>



<div class="row">
  
 <div class="col-md-3">
  
   <div class="form-group" >
	    <label ><?php echo mt("Scroll Interval")?></label>
	    <?php 
	    echo CHtml::textField('mobileapp2_startup_interval',
	    getOptionA('mobileapp2_startup_interval')
	    ,array(
	      'class'=>"form-control numeric_only",
	      'placeholder'=>mt("Default is 3000 miliseconds")
	    ));
	    ?>    	    
	</div>  
	
 </div> <!--row-->
 
 <div class="col-md-2">
  <?php echo htmlWrapper::checkbox('mobileapp2_startup_auto_scroll','',"Auto Scroll", getOptionA('mobileapp2_startup_auto_scroll') );?>
 </div> <!--row-->
 
 <div class="col-md-3">
  
 </div> <!--row-->
 
</div>
  
  <?php
echo CHtml::ajaxSubmitButton(
	mobileWrapper::t('SAVE SETTINGS'),
	array('ajax/savesettings_startup'),
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
	  'id'=>'save_startup'
	)
);
?>


<?php echo CHtml::endForm(); ?>