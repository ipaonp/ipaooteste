<div class="header_mobile"> 
 <img src="<?php echo $logo?>" />
</div>

<div class="mobile_body">
   
   <?php echo CHtml::beginForm( $success_url , 'post', 
		array(
		  'id'=>'checkout'
	));?>     
   
   <div style="padding:10px;text-align:left;">
     <div id="payment-form"></div>
     <div style="height:10px;"></div>
     <input type="submit" class="btn btn-primary" value="<?php echo mt("Pay Now")?>">
   </div>
   
   <?php echo CHtml::endForm() ; ?>
</div>

<!--PRELOADER-->
<div class="main-preloader">
   <div class="inner">
   <div class="ploader"></div>
   </div>
</div> 
<!--PRELOADER-->