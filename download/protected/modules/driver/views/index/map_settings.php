<form id="frm_map_settings" class="frm_map_settings form-horizontal" onsubmit="return false;">


<div class="form-group">
	    <label class="col-sm-2 control-label"><?php echo Driver::t("Default Map Country")?></label>
	    <div class="col-sm-6">	      
	      <?php
	      $drv_default_location=getOptionA('drv_default_location');
	      echo CHtml::dropDownList('drv_default_location',
	      !empty($drv_default_location)?$drv_default_location:"US",
	      (array)$country_list,array(
	        'class'=>"form-control"
	      ))
	      ?>
	      <p class="text-muted top5">
	      <?php echo Driver::t("Set the default country to your map")?>
	      </p>
	    </div>
	  </div>	  
	  
	  <div class="form-group">
	    <label class="col-sm-2 control-label"><?php echo Driver::t("Disabled Activity Tracking")?></label>
	    <div class="col-sm-6">
	      <?php
	      echo CHtml::checkBox('driver_disabled_auto_refresh',
	      getOptionA('driver_disabled_auto_refresh')==1?true:false,array(
	        'class'=>"switch-boostrap"
	      ))
	      ?>	      
	    </div>
	  </div>	  	  	  	
	  
	  <div class="form-group">
	    <label class="col-sm-2 control-label"><?php echo Driver::t("Activity refresh interval")?></label>
	    <div class="col-sm-6">
	      <?php
	      echo CHtml::textField('driver_map_refresh_interval',getOptionA('driver_map_refresh_interval'),array(
	        'class'=>"form-control numeric_only",
	        'style'=>"width:100px;"
	      ));
	      ?>	      
	      <p><?php echo Driver::t("in seconds. default is 15 seconds")?></p>
	    </div>
	  </div>
	  
	   <div class="form-group">
	    <label class="col-sm-2 control-label"><?php echo Driver::t("Driver activity Refresh")?></label>
	    <div class="col-sm-6">
	      <?php
	      echo CHtml::checkBox('driver_refresh_map_driver_activity',
	      getOptionA('driver_refresh_map_driver_activity')==1?true:false,array(
	        'class'=>"switch-boostrap"
	      ))
	      ?>	
	      <p><?php echo Driver::t("Map/dashboard will refresh if there is driver activity")?></p>      
	    </div>
	  </div>	 
	  	  
	 <div class="form-group">
	    <label class="col-sm-2 control-label"><?php echo Driver::t("Auto Geocode Address")?></label>
	    <div class="col-sm-6">
	      <?php
	      echo CHtml::checkBox('driver_auto_geocode_address',
	      getOptionA('driver_auto_geocode_address')==1?true:false,array(
	        'class'=>"switch-boostrap"
	      ))
	      ?>	      
	      <p><?php echo Driver::t("auto fill address after dragging the marker on map only for google maps")?></p>      
	    </div>
	  </div>	   
	  
	  <div class="form-group">
	    <label class="col-sm-2 control-label"><?php echo Driver::t("Include offline driver on map")?></label>
	    <div class="col-sm-6">
	      <?php
	      echo CHtml::checkBox('driver_include_offline_driver_map',
	      getOptionA('driver_include_offline_driver_map')==1?true:false,array(
	        'class'=>"switch-boostrap"
	      ))
	      ?>	      
	    </div>
	  </div>	  
	
	   <div class="form-group">
	    <label class="col-sm-2 control-label"><?php echo Driver::t("Hide Pickup Task")?></label>
	    <div class="col-sm-6">
	      <?php
	      echo CHtml::checkBox('driver_hide_pickup_task',
	      getOptionA('driver_hide_pickup_task')==1?true:false,array(
	        'class'=>"switch-boostrap"
	      ))
	      ?>	      
	    </div>
	  </div>	  
	  
	   <div class="form-group">
	    <label class="col-sm-2 control-label"><?php echo Driver::t("Hide Delivery Task")?></label>
	    <div class="col-sm-6">
	      <?php
	      echo CHtml::checkBox('driver_hide_delivery_task',
	      getOptionA('driver_hide_delivery_task')==1?true:false,array(
	        'class'=>"switch-boostrap"
	      ))
	      ?>	      
	    </div>
	  </div>	  	  
	  
	   <div class="form-group">
	    <label class="col-sm-2 control-label"><?php echo Driver::t("Hide Successful Task")?></label>
	    <div class="col-sm-6">
	      <?php
	      echo CHtml::checkBox('driver_hide_successful_task',
	      getOptionA('driver_hide_successful_task')==1?true:false,array(
	        'class'=>"switch-boostrap"
	      ))
	      ?>	      
	    </div>
	  </div>	 
	  
	  
	    <div class="form-group">
	    <label class="col-sm-2 control-label"><?php echo Driver::t("Google Map Style")?></label>
	    <div class="col-sm-6">
	      <?php
	      echo CHtml::textArea('drv_map_style',getOptionA('drv_map_style'),array(
	         'class'=>"form-control",
	         'style'=>"height:250px;"
	      ))
	      ?>
	      <p class="text-muted top5">
	      <?php echo Driver::t("Set the style of your map")?>.
	      <?php echo Driver::t("get it on")?> <a target="_blank" href="https://snazzymaps.com">https://snazzymaps.com</a>
	      <br/>
	      <?php echo Driver::t("leave it empty if if you are unsure")?>.
	      </p>
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