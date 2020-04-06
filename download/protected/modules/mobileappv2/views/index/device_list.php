
<div class="card" id="box_wrap">
<div class="card-body">


<table class="table table-striped data_tables" data-action_name="device_list">
 <thead>
  <tr>
   <th><?php echo mobileWrapper::t("ID")?></th>
   <th><?php echo mobileWrapper::t("Name")?></th>
   <th><?php echo mobileWrapper::t("Platform")?></th>
   <th><?php echo mobileWrapper::t("UIID")?></th>
   <th><?php echo mobileWrapper::t("Device ID")?></th>
   <th><?php echo mobileWrapper::t("Push Enabled")?></th>
   <th><?php echo mobileWrapper::t("Date Created")?></th>
   <th><?php echo mobileWrapper::t("Last Login")?></th>
   <th><?php echo mobileWrapper::t("Actions")?></th>
  </tr>
 </thead>
 <tbody>  
 </tbody>
</table>

</div> <!--card body-->
</div> <!--card-->

<div class="floating_action">
 <button type="button" class="btn <?php echo APP_BTN?> refresh_datatables"  >
 <?php echo mobileWrapper::t("Refresh")?>
 <ion-icon name="refresh"></ion-icon> 
 </button>
</div>

<div class="modal fade" id="sendPushModal" tabindex="-1" role="dialog" aria-labelledby="sendPushModal" aria-hidden="true">
<div>
 <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header"> <h5 class="modal-title" ><?php echo mt("Send Push Notification")?></h5></div>
        
        <!--<form id="frm" method="post" onsubmit="return false;" data-action="send_push">-->			
		<?php echo CHtml::beginForm('','post',array(
		  'id'=>"frm",
		  'onsubmit'=>"return false;",
		  'data-action'=>"send_push"
		)); 
		?> 
        
        <div class="modal-body">
        <?php echo CHtml::hiddenField('id','')?>
	    
		<div class="form-group">
		<label><?php echo mt("Push Title")?></label>
		<?php 
		echo CHtml::textField('push_title','',array('class'=>"form-control",'required'=>true ));
		?>
		</div> 
		
		<div class="form-group">
		<label><?php echo mt("Push Message")?></label>
		<?php 
		echo CHtml::textArea('push_message','',array('class'=>"form-control",'maxlength'=>"255",'required'=>true));
		?>
		</div> 
		
        
        </div> <!--modal body-->
        
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">
           <?php echo mt("Close")?>
          </button>
          <button type="submit" class="btn <?php echo APP_BTN;?>"><?php echo mt("Send Push")?></button>
       </div>
       
      <!--</form>-->
      <?php echo CHtml::endForm() ; ?>
        
      </div><!-- content-->
 </div>
</div>