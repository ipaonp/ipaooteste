
<div id="layout_1">
<?php 
$this->renderPartial('/tpl/layout1_top',array(   
));
?> 
</div> <!--layout_1-->

<div class="parent-wrapper task-list-area">

 <div class="content_1 white">   
   <?php 
   $this->renderPartial('/tpl/menu',array(   
   ));
   ?>
 </div> <!--content_1-->
 
 <div class="content_main">

   <div class="nav_option">
      <div class="row">
        <div class="col-md-6 border">
         <b><?php echo Driver::t("Task")?></b>
        </div> <!--col-->
        <div class="col-md-6 border text-right">
                       
           <a class="green-button left rounded" target="_blank" href="<?php echo Yii::app()->createUrl('driver/index/export_task')?>"><?php echo Driver::t("Export")?></a>
           <a class="orange-button left rounded" href="javascript:tableReload();"><?php echo Driver::t("Refresh")?></a>
         
        </div> <!--col-->
      </div> <!--row-->
   </div> <!--nav_option-->
  
   <div class="inner">
   <form id="frm_table" class="frm_table">
   <?php echo CHtml::hiddenField('action','taskList')?>
   <table id="table_list" class="table table-hover">
   <thead>
    <tr>
      <th width="10%"><?php echo Driver::t("Task ID")?></th>
      <th width="10%"><?php echo Driver::t("Order No")?></th>
      <th><?php echo Driver::t("Task Type")?></th>
      <th><?php echo Driver::t("Description")?></th>
      <th><?php echo Driver::t("Driver Name")?></th>
	   <th><?php echo Driver::t("Task Rating")?></th>
      <th><?php echo Driver::t("Name")?></th>
      <th><?php echo Driver::t("Address")?></th>
      <th><?php echo Driver::t("Complete Before")?></th>
      <th><?php echo Driver::t("Status")?></th>
      <th></th>
    </tr>
    </thead>
    <tbody>     
    </tbody>     
   </table>
   </form>
   </div>
 
 </div> <!--content_2-->

</div> <!--parent-wrapper-->

<style>
* {
  box-sizing: border-box;
}



.heading {
  font-size: 25px;
  margin-right: 25px;
}

.fa {
  font-size: 12px;
}

.checked {
  color: orange;
}

/* Three column layout */
.side {
  float: left;
  width: 15%;
  margin-top:10px;
}

.middle {
  margin-top:10px;
  float: left;
  width: 70%;
}

/* Place text to the right */
.right {
  text-align: right;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* The bar container */
.bar-container {
  width: 100%;
  background-color: #f1f1f1;
  text-align: center;
  color: white;
}

/* Individual bars */
.bar-5 {width: 60%; height: 18px; background-color: #4CAF50;}
.bar-4 {width: 30%; height: 18px; background-color: #2196F3;}
.bar-3 {width: 10%; height: 18px; background-color: #00bcd4;}
.bar-2 {width: 4%; height: 18px; background-color: #ff9800;}
.bar-1 {width: 15%; height: 18px; background-color: #f44336;}

/* Responsive layout - make the columns stack on top of each other instead of next to each other */
@media (max-width: 400px) {
  .side, .middle {
    width: 100%;
  }
  .right {
    display: none;
  }
}

</style>