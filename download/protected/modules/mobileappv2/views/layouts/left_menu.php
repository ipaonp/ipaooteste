<?php
$menu =  array(  		    		    
    'activeCssClass'=>'active', 
    'encodeLabel'=>false,
    'htmlOptions' => array(
      'class'=>'menu_nav',
     ),
    'items'=>array(
    
        array('visible'=>true,
        'label'=>'<i class="ion-ios-gear"></i>',
        'url'=>array('/'.APP_FOLDER.'/index/settings'),'linkOptions'=>array(
          'data-content'=>mobileWrapper::t("Settings")
        )),               
        
         array('visible'=>true,
        'label'=>'<i class="ion-iphone"></i>',
        'url'=>array('/'.APP_FOLDER.'/index/device_list'),'linkOptions'=>array(
          'data-content'=>mobileWrapper::t("Device List")
        )), 
        
        array('visible'=>true,
        'label'=>'<i class="ion-ios-paper-outline"></i>',
        'url'=>array('/'.APP_FOLDER.'/index/broadcast_list'),'linkOptions'=>array(
          'data-content'=>mobileWrapper::t("Broadcast")
        )), 
        
        array('visible'=>true,
        'label'=>'<i class="ion-ios-filing-outline"></i>',
        'url'=>array('/'.APP_FOLDER.'/index/push_list'),'linkOptions'=>array(
          'data-content'=>mobileWrapper::t("Push Logs")
        )), 
        
        array('visible'=>true,
        'label'=>'<i class="ion-hammer"></i>',
        'url'=>array('/'.APP_FOLDER.'/index/order_trigger'),'linkOptions'=>array(
          'data-content'=>mobileWrapper::t("Order Trigger Notification")
        )), 
        
        
        array('visible'=>true,
        'label'=>'<i class="ion-images"></i>',
        'url'=>array('/'.APP_FOLDER.'/index/home_banner_list'),'linkOptions'=>array(
          'data-content'=>mobileWrapper::t("Home Banner")
        )), 
        
        array('visible'=>true,
        'label'=>'<i class="ion-document"></i>',
        'url'=>array('/'.APP_FOLDER.'/index/page_list'),'linkOptions'=>array(
          'data-content'=>mobileWrapper::t("Page")
        )), 
        
                
        array('visible'=>true,
        'label'=>'<i class="ion-plus"></i>',
        'url'=>array('/'.APP_FOLDER.'/index/others'),'linkOptions'=>array(
          'data-content'=>mobileWrapper::t("Others")
        )), 
     )   
);       

$this->widget('zii.widgets.CMenu', $menu);