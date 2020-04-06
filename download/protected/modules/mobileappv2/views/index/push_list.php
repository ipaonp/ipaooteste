
<div class="card" id="box_wrap">
<div class="card-body">

<?php 
if(isset($bid)){
	echo CHtml::hiddenField('broadcast_id',$bid);
}
?>
<table class="table table-striped data_tables" data-action_name="push_list" >
 <thead>
  <tr>
   <th><?php echo mobileWrapper::t("ID")?></th>
   <th><?php echo mobileWrapper::t("Push Type")?></th>
   <th><?php echo mobileWrapper::t("Name")?></th>
   <th><?php echo mobileWrapper::t("Platform")?></th>   
   <th><?php echo mobileWrapper::t("Device ID")?></th>   
   <th><?php echo mobileWrapper::t("Push Title")?></th>   
   <th><?php echo mobileWrapper::t("Push Content")?></th>   
   <th><?php echo mobileWrapper::t("Date")?></th>         
   <th><?php echo mobileWrapper::t("Process")?></th> 
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

