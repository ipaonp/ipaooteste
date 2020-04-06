
<div class="card" id="box_wrap">
<div class="card-body">

<table class="table table-striped data_tables" data-action_name="broadcast_list" >
 <thead>
  <tr>
   <th><?php echo mobileWrapper::t("ID")?></th>
   <th><?php echo mobileWrapper::t("Push Title")?></th>
   <th><?php echo mobileWrapper::t("Push Content")?></th>
   <th><?php echo mobileWrapper::t("Platform")?></th>      
   <th><?php echo mobileWrapper::t("Date")?></th>   
   <th><?php echo mobileWrapper::t("Actions")?></th>
  </tr>
 </thead>
 <tbody>  
 </tbody>
</table>

</div> <!--card body-->
</div> <!--card-->

<div class="floating_action">
<div class="floating_action_inner">
 <div class="row">
  <div class="col-sm">
	 <button type="button" class="btn <?php echo APP_BTN?> " data-toggle="modal" data-target="#broadcastNewModal" >
	 <?php echo mobileWrapper::t("Add new")?>
	 <ion-icon name="add"></ion-icon> 
	 </button>
 </div>
 
 <div class="col-sm">
	 <button type="button" class="btn btn-secondary refresh_datatables"  >
	 <?php echo mobileWrapper::t("Refresh")?>
	 <ion-icon name="refresh"></ion-icon> 
	 </button>
 </div>
 
 </div> <!--row-->
</div> 
</div> <!--floating_action-->

<div class="modal fade" id="broadcastNewModal" tabindex="-1" role="dialog" aria-labelledby="broadcastNewModal" aria-hidden="true">
 <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header"> <h5 class="modal-title" ><?php echo mt("Broadcast")?></h5></div>
        
        <!--<form id="frm" method="post" onsubmit="return false;" data-action="save_broadcast">-->
        
        <?php echo CHtml::beginForm('','post',array(
		  'id'=>"frm",
		  'onsubmit'=>"return false;",
		  'data-action'=>"save_broadcast"
		)); 
		?> 
		
        <div class="modal-body">
        
	    
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
		
		<div class="form-group">
		<label><?php echo mt("Send to Device Platform")?></label>
		<?php 
		echo CHtml::dropDownList('device_platform','',mobileWrapper::platFormList(),array(
		  'class'=>"form-control",
		  'required'=>true
		));
		?>
		</div> 
        
        </div> <!--modal body-->
        
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">
           <?php echo mt("Close")?>
          </button>
          <button type="submit" class="btn <?php echo APP_BTN;?>"><?php echo mt("Save broadcast")?></button>
       </div>
       
      <!--</form>-->
      <?php echo CHtml::endForm() ; ?>
        
      </div><!-- content-->
 </div>
</div>