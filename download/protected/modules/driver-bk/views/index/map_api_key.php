
<form id="frm_map_keys" class="frm_map_keys form-horizontal" onsubmit="return false;">

<div class="form-group">
    <label class="col-sm-2 control-label"><?php echo Driver::t("Choose Map Provider")?></label>
    <div class="col-sm-6">
     <?php
     echo CHtml::dropDownList('driver_map_provider',getOptionA('driver_map_provider'),array(
       'google.maps'=>Driver::t("Google Maps (default)"),
       'mapbox'=>Driver::t("Mapbox"),
     ),array(
      'class'=>"form-control"
     ))
     ?>	    
    </div>
  </div>	  
  
  <hr/>
  
  <h4><?php echo Driver::t("Google Maps")?></h4>
  
  <div class="form-group">
   <label class="col-sm-2 control-label"><?php echo Driver::t("Google Api Key")?></label>
    <div class="col-sm-9">
      <?php echo CHtml::textField('drv_google_api',
      getOptionA('drv_google_api')
      ,array(
       'class'=>"form-control"	       
      ))?>
    <p class="top5 text-muted"><?php echo Driver::t("Enabled Google Maps Distance Matrix API, Google Maps Geocoding API and Google Maps JavaScript API in your google developer account")?>.</p>
    <p class="top5 text-muted">     
    </p>
    </div>
  </div>  
  
  <div class="form-group">
    <label class="col-sm-2 control-label"><?php echo Driver::t("Enabled Curl")?></label>
    <div class="col-sm-6">
      <?php
      echo CHtml::checkBox('driver_google_use_curl',
      getOptionA('driver_google_use_curl')==1?true:false,array(
        'class'=>"switch-boostrap"
      ))
      ?>	      
    </div>
  </div>	  
  
  <hr/>
  
  <h4><?php echo Driver::t("Mapbox")?></h4>
  
  
  <div class="form-group">
   <label class="col-sm-2 control-label"><?php echo Driver::t("Access Token")?></label>
    <div class="col-sm-9">
      <?php echo CHtml::textField('drv_mapbox_token',
      getOptionA('drv_mapbox_token')
      ,array(
       'class'=>"form-control"	       
      ))?>    
    </div>
 </div>  
  
  <hr/>
  
   <div class="form-group">
    <label class="col-sm-2 control-label"></label>
    <div class="col-sm-6">
	  <button type="submit" class="orange-button medium rounded">
	  <?php echo Driver::t("Save")?>
	  </button>
    </div>	 
  </div>

</form>