<div class="header_mobile"> 
 <img src="<?php echo $logo?>" />
</div>

<div class="mobile_body">
 <h3 style="text-align: left;padding-left: 10px;"><?php echo t("Pay using voguepay")?></h3>  
   
   <form method='POST' action='https://voguepay.com/pay/' onclick="showPreloader();">
   <?php
   echo CHtml::hiddenField('v_merchant_id',$credentials['merchant_id']);
   echo CHtml::hiddenField('merchant_ref',$reference_id);
   echo CHtml::hiddenField('memo',stripslashes($payment_description));
   echo CHtml::hiddenField('total', number_format($amount_to_pay,2,'.','') );
   echo CHtml::hiddenField('cur', Yii::app()->functions->adminCurrencyCode() );
   
   echo CHtml::hiddenField('success_url', websiteUrl()."/mobileapp/voguepay/success?reference_id=".urlencode($reference_id) );   	
   echo CHtml::hiddenField('fail_url', websiteUrl()."/mobileapp/voguepay/error?reference_id=".urlencode($reference_id) );   	
   ?>   
   <table class="table" style="text-align:left;">          
     <tr>
      <td><?php echo t("Description")?></td>
      <td><?php echo $payment_description?></td>
     </tr>     
     <tr>
      <td><?php echo t("Amount")?></td>
      <td><?php echo FunctionsV3::prettyPrice($amount_to_pay)?></td>
     </tr>     
     <tr>
      <td colspan="2">        
        <button type="submit" class="btn btn-primary" ><?php echo t("Pay Now")?></button>
      </td>
     </tr>
   </table>    
   </form>
</div>

<!--PRELOADER-->
<div class="main-preloader">
   <div class="inner">
   <div class="ploader"></div>
   </div>
</div> 
<!--PRELOADER-->