<Div class="content_wrap normal">

<div class="header_mobile"> 
 <img src="<?php echo $logo?>" />
</div>


<div class="mobile_body">
 <h3 style="text-align: left;padding-left: 10px;"><?php echo mt("Pay using Stripe Payment")?></h3> 
 
   <?php    
   echo CHtml::hiddenField('PAY_REQUEST_ID',isset($resp['PAY_REQUEST_ID'])?$resp['PAY_REQUEST_ID']:'');
   echo CHtml::hiddenField('CHECKSUM',isset($resp['CHECKSUM'])?$resp['CHECKSUM']:'');
   ?>
   <table class="table" style="text-align:left;">     
     
     <tr>
      <td><?php echo mt("Description")?></td>
      <td><?php echo $payment_description?></td>
     </tr>   
     
     <?php if($card_fee>0):?>     
     <tr>
      <td><?php echo mt("Amount")?></td>
      <td><?php echo FunctionsV3::prettyPrice($amount_to_pay-$card_fee)?></td>
     </tr>
      <tr>
      <td><?php echo mt("Card fee")?></td>
      <td><?php echo FunctionsV3::prettyPrice($card_fee)?></td>
      </tr>      
      <tr>
      <td><?php echo mt("Total")?></td>
      <td><?php echo FunctionsV3::prettyPrice($amount_to_pay)?></td>
      </tr>     
     <?php else :?> 
     <tr>
      <td><?php echo mt("Amount")?></td>
      <td><?php echo FunctionsV3::prettyPrice($amount_to_pay)?></td>
     </tr>
     <?php endif;?>
     
     <tr>
      <td colspan="2">        
        <button type="button" class="btn btn-primary paynow_stripe" ><?php echo mt("Pay Now")?></button>
      </td>
     </tr>
   </table>    
 
</div>


<!--PRELOADER-->
<div class="main-preloader">
   <div class="inner">
   <div class="ploader"></div>
   </div>
</div> 
<!--PRELOADER-->

</Div>