
<div class="card" id="box_wrap">
<div class="card-body">

<table class="table table-striped data_tables" data-action_name="home_banner_list">
 <thead>
  <tr>
   <th><?php echo mobileWrapper::t("ID")?></th>
   <th width="18%"><?php echo mobileWrapper::t("Title")?></th>
   <th width="18%"><?php echo mobileWrapper::t("Banner")?></th>
   <th><?php echo mobileWrapper::t("Sequence")?></th>   
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
	 <a href="<?php echo Yii::app()->createUrl("/".APP_FOLDER."/index/home_banner_new")?>" class="btn <?php echo APP_BTN?> "  >
	 <?php echo mobileWrapper::t("Add new")?>
	 <ion-icon name="add"></ion-icon> 
	 </a>
 </div>
 
 <div class="col-sm">
   <button type="button" class="btn btn-secondary refresh_datatables"  >
	 <?php echo mobileWrapper::t("Refresh")?>
	 <ion-icon name="refresh"></ion-icon> 
	 </button>
 </div>
 
</div> 
 
</div> 
</div><!-- floating_action-->

