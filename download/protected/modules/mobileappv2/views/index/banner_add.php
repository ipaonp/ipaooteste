<?php echo CHtml::beginForm('','post',array(
		  'id'=>"frm",
		  'onsubmit'=>"return false;",
		  'data-action'=>"save_home_banner"
		)); 
		?> 
		
<?php 
echo CHtml::hiddenField('banner_id', isset($data['banner_id'])?$data['banner_id']:'' );
echo CHtml::hiddenField('home_banner', isset($data['banner_name'])?$data['banner_name']:''  );
?>		


<div class="form-group">
<label><?php echo mt("Title")?></label>		
<?php 
echo CHtml::textField('title',
isset($data['title'])?$data['title']:'' 
,array('class'=>"form-control",'required'=>true ));
?>			
</div> 

<div class="form-group">
<button id="upload_banner" type="button" class="btn btn-info">
 <?php echo mobileWrapper::t("Browse")?>
</button>    
</div> 			


<div class="form-group">
<label><?php echo mt("Sequence")?></label>		
<?php 
echo CHtml::textField('sequence',
isset($data['sequence'])?$data['sequence']:$last_increment 
,array('class'=>"form-control numeric_only",'required'=>true ));
?>			
</div> 

<div class="form-group">
	<label><?php echo mt("Status")?></label>		
	<?php 
	echo CHtml::dropDownList('status',
    isset($data['status'])?$data['status']:'' 
    ,statusList() ,array(
      'class'=>'form-control',      
      'required'=>true
    ));
	?>
	</div> 

<!--FLOATING-->
<div class="floating_action">
<div class="floating_action_inner">

<div class="row">
  <div class="col-sm">
	 <button class="btn <?php echo APP_BTN?> "  >
	 <?php if(isset($data['banner_id'])):?>
	 <?php echo mobileWrapper::t("Update")?>
	 <?php else :?>
	 <?php echo mobileWrapper::t("Save")?>
	 <?php endif;?>
	 <ion-icon name="add"></ion-icon> 
	 </button>
 </div>
 
 <div class="col-sm">
   <a href="<?php echo Yii::app()->createUrl("/".APP_FOLDER."/index/home_banner_list")?>" class="btn btn-secondary refresh_datatables"  >
	 <?php echo mobileWrapper::t("Back")?>
	 <ion-icon name="refresh"></ion-icon> 
	 </a>
 </div>
 
</div> 
 
</div> 
</div><!-- floating_action-->

<?php echo CHtml::endForm() ; ?>	