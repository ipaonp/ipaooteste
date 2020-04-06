
<form id="frm_fcm_settings" class="frm_fcm_settings form-horizontal" onsubmit="return false;">

<div class="form-group">
    <label class="col-sm-2 control-label"><?php echo Driver::t("Server Key")?></label>
    <div class="col-sm-10">
     <?php
     echo CHtml::textField('drv_fcm_server_key',getOptionA('drv_fcm_server_key'),array(
       'class'=>'form-control'
     ));
     ?>	    
    </div>
  </div>	  
  
   <div class="form-group">
    <label class="col-sm-2 control-label"></label>
    <div class="col-sm-6">
	  <button type="submit" class="orange-button medium rounded">
	  <?php echo Driver::t("Save")?>
	  </button>
    </div>	 
  </div>

</form>