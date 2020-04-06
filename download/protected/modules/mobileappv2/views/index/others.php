
<div class="card" id="box_wrap">
<div class="card-body">



<ul class="nav nav-tabs" id="tab_others" role="tablist">
  <li class="nav-item">
    <a class="nav-link active"  data-toggle="tab" 
    href="#nav_web_config" role="tab" aria-selected="true">
    <?php echo mt("Web config")?>
    </a>
  </li>
  
  <li class="nav-item">
    <a class="nav-link"  data-toggle="tab" 
    href="#nav_cron" role="tab" aria-selected="true">
    <?php echo mt("Cron Jobs")?>
    </a>
  </li>
  
  <li class="nav-item">
    <a class="nav-link"  data-toggle="tab" 
    href="#nav_update" role="tab" aria-selected="true">
    <?php echo mt("Update Database")?>
    </a>
  </li>
  
</ul>

<div class="tab-content" >
  <div class="tab-pane fade show active" id="nav_web_config" role="tabpanel">


  <?php echo CHtml::beginForm('','post',array(
	 'onsubmit'=>"return false;",
	 'id'=>"frm",
	 'data-action'=>"save_webconfig"
	)); 
  ?>  
  
  
  <div class="form-group" > 
    <label><?php echo mobileWrapper::t("Popup Notification Delay")?></label>        
    <?php 
    echo CHtml::textField('mobile2_notification_delay',getOptionA('mobile2_notification_delay'),array(
     'class'=>"form-control",
     'required'=>true,
     'number'=>true,
     'placeholder'=>mt('default is 1 seconds')
    ));
    ?>        
    <small class="form-text text-muted">
       <?php echo mt("this is the notification appear when you save the settings etc.")?>       
    </small>
  </div>  
  
  <div class="form-group"> 
    <label><?php echo mobileWrapper::t("Table List Page Length")?></label>        
    <?php 
    echo CHtml::textField('mobile2_table_length',getOptionA('mobile2_table_length'),array(
     'class'=>"form-control",
     'required'=>true,     
     'number'=>true,
     'placeholder'=>mt('default is 10')
    ));
    ?>    
    <small class="form-text text-muted">
    <?php echo mt("show how many records per page for table list")?>    
    </small>
  </div>  
    
  
  <button type="submit" class="btn <?php echo APP_BTN?>"><?php echo mt("Save Settings")?></button>
  
  <?php echo CHtml::endForm(); ?>
  
  </div> <!--tab pane-->
  
  
  <div class="tab-pane fade" id="nav_cron" role="tabpanel">
   <p><?php echo mt("Run the following cron jobs in your cpanel")?></p>
   <?php if(is_array($cron) && count($cron)>=1):?>
   <ul>      
     <?php foreach ($cron as $val):?>
      <li><a href="<?php echo $val['link']?>" target="_blank"><?php echo $val['link']?></a> - <?php echo $val['notes']?></li>
     <?php endforeach;?>
   </ul>
   <?php endif;?>
   
   <p><?php echo mt("Example")?>:<br/>
   curl <?php echo $cron_sample?>
   </p>
   
   <p><?php echo mt("Video tutorial")?><br/>
   <a href="https://youtu.be/eKDDD_BqAH0" target="_blank">https://youtu.be/eKDDD_BqAH0</a>
   </p>
   
  </div> <!--tab pane-->
  
  <div class="tab-pane fade" id="nav_update" role="tabpanel">
    <p><?php echo mt("click [link] to update your database",array(
      '[link]'=>'<a href="'.$update_db.'" target="_blank" >'.mt("here").'</a>'
    ))?></p>
  </div> <!--tab pane-->
  
</div> <!-- tab content-->
  

</div> <!--card body-->
</div> <!--card-->