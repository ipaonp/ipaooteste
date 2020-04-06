<?php $this->renderPartial('/layouts/header');?>
<body>

<div class="main_wrap">

<div class="header_wrap">

  <h3><?php echo $this->pageTitle?></h3>

  <ul class="top_nav">
   <li>
    <a href="<?php echo Yii::app()->createUrl('/admin/dashboard')?>" >
    <i class="ion-log-out" style="font-size:30px;"></i>
    </a>
   </li>
  </ul>
</div>
<!--header_wrap-->

<div class="sidebar_wrap">
  <?php $this->renderPartial('/layouts/left_menu');?>  
</div>
<!--sidebar_wrap-->

<div class="content_wrap">  
   <?php echo $content;?>   
</div> <!--content_wrap-->

</div> 
<!--main_wrap-->


</body>
<?php $this->renderPartial('/layouts/footer');?>