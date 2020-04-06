
<div id="mobile-header" class="container">
<div class="row">
 <div class="col-xs-1 center"> 
    <!--<a class="back-mobile" href="<?php echo Yii::app()->createUrl('/store/menu/merchant/'.$slug)?>">-->
	  <?php   if($_GET['item_page']==1){ ?>
	   <a class="back-mobile" href="<?php echo Yii::app()->createUrl('/menu-'.$slug.'?item_id='.$_GET['item_id'])?>">
	  <?php }else{ ?>
	  
	   <a class="back-mobile" href="<?php echo Yii::app()->createUrl('/menu-'.$slug)?>">
	  <?php } ?>
 
    <i class="ion-ios-arrow-back"></i>
    </a>
 </div>
 <div class="col-xs-10 ">
    <h1 class="center"><?php echo isset($title)?$title:''?></h1>
 </div>
</div> <!--row-->
</div> <!--container-->