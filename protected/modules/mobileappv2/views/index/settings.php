
<div class="card" id="box_wrap">
<div class="card-body">

<ul class="nav nav-tabs" id="tab_settings" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="nav-api" data-toggle="tab" 
    href="#nav_api_settings" role="tab" aria-selected="false">
    <?php echo mobileWrapper::t("API Settings")?>
    </a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="nav-app" data-toggle="tab" 
    href="#nav_app_settings" role="tab" aria-selected="true">
    <?php echo mobileWrapper::t("Application Settings")?>
    </a>
  </li>
  
  <li class="nav-item">
    <a class="nav-link" id="nav-startup" data-toggle="tab" 
    href="#nav_startup" role="tab" aria-selected="true">
    <?php echo mobileWrapper::t("App Startup")?>
    </a>
  </li>
  
  <li class="nav-item">
    <a class="nav-link" id="nav-social" data-toggle="tab" 
    href="#nav_social_login" role="tab"  aria-selected="false">
      <?php echo mobileWrapper::t("Social Login")?>
    </a>
  </li>
  
  <li class="nav-item">
    <a class="nav-link" id="nav-analytics" data-toggle="tab" 
    href="#nav_analytics" role="tab"  aria-selected="false">
      <?php echo mobileWrapper::t("Google Analytics")?>
    </a>
  </li>
  
  <li class="nav-item">
    <a class="nav-link" id="nav-andrpoid" data-toggle="tab" 
    href="#nav_android_settings" role="tab"  aria-selected="false">
      <?php echo mobileWrapper::t("Android Settings")?>
    </a>
  </li>
  
   <li class="nav-item">
    <a class="nav-link" id="nav-fcm" data-toggle="tab" 
    href="#nav_fcm" role="tab"  aria-selected="false">
      <?php echo mobileWrapper::t("FCM")?>
    </a>
  </li>
  
  <li class="nav-item">
    <a class="nav-link" id="nav-map" data-toggle="tab" 
    href="#nav_map" role="tab"  aria-selected="false">
      <?php echo mobileWrapper::t("Map Settings")?>
    </a>
  </li>
  
</ul>


<div class="tab-content" >
  <div class="tab-pane fade active show" id="nav_api_settings" role="tabpanel">
     <?php $this->renderPartial('/index/settings_api');?>
  </div>
  <div class="tab-pane fade" id="nav_app_settings" role="tabpanel">
     <?php $this->renderPartial('/index/settings_application',array(
          'country_list'=>$country_list,
		  'mobile_country_list'=>$mobile_country_list,
		  'search_options'=>$search_options,
		  'order_status_list'=>$order_status_list
     ));?>
  </div>
  
  <div class="tab-pane fade" id="nav_startup" role="tabpanel">
   <?php 
   $startup_banner = getOptionA('mobileapp2_startup_banner');   
   $this->renderPartial('/index/settings_startup',array(
     'startup_banner'=>!empty($startup_banner)?json_decode($startup_banner):false
   ));?>
  </div>
  
  <div class="tab-pane fade" id="nav_social_login" role="tabpanel" >
    <?php $this->renderPartial('/index/settings_social_login');?>
  </div>
  <div class="tab-pane fade" id="nav_analytics" role="tabpanel" >
     <?php $this->renderPartial('/index/settings_analytics');?>
  </div>
  
  <div class="tab-pane fade" id="nav_android_settings" role="tabpanel" >
    <?php $this->renderPartial('/index/settings_android',array(
      'upload_push_icon'=>getOptionA('android_push_icon'),
      'upload_push_picture'=>getOptionA('android_push_picture'),
    ));?>
  </div>
  
  <div class="tab-pane fade" id="nav_fcm" role="tabpanel" >
   <?php $this->renderPartial('/index/settings_fcm');?>
  </div>
  
  <div class="tab-pane fade" id="nav_map" role="tabpanel" >
   <?php $this->renderPartial('/index/map_settings');?>
  </div>
  
</div>

</div> <!--card-->
</div>
<!--box_wrap-->