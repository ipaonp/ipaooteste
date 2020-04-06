<style>

.checked {
  color: orange;
}
.modal-body{
	    border: 1px solid;
    padding: 10px;
    margin-bottom: 10px;
    text-align: center;
}
.view-receipt-pop {
    width: 500px;
    padding: 10px;
}
</style>
<?php
$order_id=$this->data['id'];
echo CHtml::hiddenField('printing_order_id',$order_id);
if ( $data=Yii::app()->functions->getOrder2($order_id)){			
    $merchant_id=$data['merchant_id'];
    $json_details=!empty($data['json_details'])?json_decode($data['json_details'],true):false;
    if ( $json_details !=false){
	    Yii::app()->functions->displayOrderHTML(array(
	       'merchant_id'=>$data['merchant_id'],
	       'order_id'=>$order_id,
	       'delivery_type'=>$data['trans_type'],
	       'delivery_charge'=>$data['delivery_charge'],
	       'packaging'=>$data['packaging'],
	       'cart_tip_value'=>$data['cart_tip_value'],
		   'cart_tip_percentage'=>$data['cart_tip_percentage']/100,
		   'card_fee'=>$data['card_fee'],
		   'donot_apply_tax_delivery'=>$data['donot_apply_tax_delivery'],
		   'points_discount'=>isset($data['points_discount'])?$data['points_discount']:'' /*POINTS PROGRAM*/,
		   'voucher_amount'=>$data['voucher_amount'],
		   'voucher_type'=>$data['voucher_type'],
		   'tax_set'=>$data['tax'],
	     ),$json_details,true);
	     
	     /*ITEM TAXABLE*/	     
	     $mtid=$merchant_id;
	     $apply_tax= $data['apply_food_tax'];
	     $tax_set = $data['tax'];	         	 
    	 if ( $apply_tax==1 && $tax_set>0){		    		    		
    		Yii::app()->functions->details['html']=Yii::app()->controller->renderPartial('/front/cart-with-tax',array(
    		   'data'=>Yii::app()->functions->details['raw'],
    		   'tax'=>$tax_set,
    		   'receipt'=>true,
    		   'merchant_id'=>$mtid
    		),true);
    		   		
    	 }	    
	     
	     $data2=Yii::app()->functions->details;
		
        $merchant_info=Yii::app()->functions->getMerchant(isset($merchant_id)?$merchant_id:'');
$full_merchant_address=$merchant_info['street']." ".$merchant_info['city']. " ".$merchant_info['state'].
" ".$merchant_info['post_code'];

		if (isset($data['contact_phone1'])){
			if (!empty($data['contact_phone1'])){
				$data['contact_phone']=$data['contact_phone1'];
			}
		}				
		if (isset($data['location_name1'])){
			if (!empty($data['location_name1'])){
				$data['location_name']=$data['location_name1'];
			}
		}
		
		$transaction_type=$data['trans_type'];		
				
		$creditcard_info=array();
		if($data['payment_type']=="ocr"){
			$creditcard_info = FunctionsV3::getCreditCardInfo($data['client_id'],$data['cc_id']);			
		}		
		
	    ?>
	    <div class="view-receipt-pop <?php echo "currentController_".$_GET['currentController']?>" >
	    <div class="receipt-main-wrap">		   
		   <div class="receipt-wrap order-list-wrap">
		   
		   <!--<a href="javascript:;" class="close-receipt"><i class="fa fa-times"></i></a>-->
		   
		   <?php 
		   $website_enabled_rcpt=getOptionA('website_enabled_rcpt');
		   $website_receipt_logo=getOptionA('website_receipt_logo');
		   if(!empty($website_receipt_logo)){		   	  
		   	  if($website_enabled_rcpt==2){
		   	  echo '<img style="max-width:200px;max-height:130px;display:block;margin:auto;" src="'. uploadURL()."/$website_receipt_logo" .'" />';
		   	  }
		   }
		   ?>
		   
		   <h4><?php echo Yii::t("default","Order Details")?></h4>
	       <div class="input-block">
	         <div class="label"><?php echo Yii::t("default","Name")?> :</div>
	         <div class="value"><?php echo $data['full_name']?></div>
	         <div class="clear"></div>
	       </div>
	       	       
	       
	       <div class="input-block">
	         <div class="label"><?php echo Yii::t("default","Merchant Name")?> :</div>
	         <div class="value"><?php echo stripslashes($data['merchant_name'])?></div>
	         <div class="clear"></div>
	       </div>
	       	       
		   <?php if (isset($data['abn']) && !empty($data['abn'])):?>		   
	       <div class="input-block">
	         <div class="label"><?php echo Yii::t("default","ABN")?> :</div>
	         <div class="value"><?php echo $data['abn']?></div>
	         <div class="clear"></div>
	       </div>	       
		   <?php endif;?>
	       
	       <div class="input-block">
	         <div class="label"><?php echo Yii::t("default","Telephone")?> :</div>
	         <div class="value"><?php echo $data['merchant_contact_phone']?></div>
	         <div class="clear"></div>
	       </div>
		   
		   <div class="input-block">
	         <div class="label"><?php echo Yii::t("default","Address")?> :</div>
	         <div class="value"><?php echo $full_merchant_address?></div>
	         <div class="clear"></div>
	       </div>	       
	       <h4><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><?php echo Yii::t("default","driver rating")?></font></font></h4>
		   <?php 
		   	 $numberifrevuew=0;
		 $totalStars =0;
		 $average=0;
		 $starshow='';
		 	$ratinlist='';
		  $view_rating='';
		$review_data=Yii::app()->functions->getdriver_review_for_merchant($data['order_id']);
	
	//print_r($review_data);
				if($review_data){
					
					
						if($review_data[0]['rating']>0 and $review_data[0]['rating']<=1){
						$starshows='<span class="fa fa-star checked"></span><span class="fa fa-star "></span><span class="fa fa-star "></span><span class="fa fa-star "></span><span class="fa fa-star"></span>';
					}else if($review_data[0]['rating']>1 and$review_data[0]['rating']<=2){
						$starshows='<span class="fa fa-star checked"></span><span class="fa fa-star checked " ></span><span class="fa fa-star "></span><span class="fa fa-star "></span><span class="fa fa-star"></span>';
					}else if($review_data[0]['rating']>2 and $review_data[0]['rating']<=3){
						$starshows='<span class="fa fa-star checked"></span><span class="fa fa-star checked" ></span><span class="fa fa-star " checked></span><span class="fa fa-star "></span><span class="fa fa-star"></span>';
					}else if($review_data[0]['rating']>3 and $review_data[0]['rating']<=4){
						$starshows='<span class="fa fa-star checked"></span><span class="fa fa-star checked" ></span><span class="fa fa-star checked" ></span><span class="fa fa-star checked " ></span><span class="fa fa-star"></span>';
					}else if($review_data[0]['rating']>4 and $review_data[0]['rating']<=5){
						$starshows='<span class="fa fa-star checked"></span><span class="fa fa-star checked " ></span><span class="fa fa-star checked" ></span><span class="fa fa-star checked " ></span><span class="fa fa-star checked" ></span>';
					}else{
						$starshows='<span class="fa fa-star "></span><span class="fa fa-star " ></span><span class="fa fa-star " ></span><span class="fa fa-star " ></span><span class="fa fa-star" ></span>';
					}
						
						
						 $review_data[0]['rating'];
						   $numberifrevuew++;
                            $totalStars += $review_data[0]['rating'];
							$ratinlist.='<tr>';
							$ratinlist.='<td>';
								$ratinlist.=$review_data['driver_details']['driver_id'];
							$ratinlist.='</td>';
							$ratinlist.='<td>';
								$ratinlist.=$review_data['driver_details']['first_name']." ".$review_data['driver_details']['last_name'];
							$ratinlist.='</td>';
							$ratinlist.='<td>';
								$ratinlist.=$review_data['driver_details']['phone'];
							$ratinlist.='</td>';
							$ratinlist.='<td>';
								$ratinlist.=$review_data[0]['rating_comment'];
							$ratinlist.='</td>';
							$ratinlist.='<td>';
								$ratinlist.=$starshows;
							$ratinlist.='</td>';
							$ratinlist.='</tr>';
					
    
				}else{
					$ratinlist='0';
				}
		  
		   if($ratinlist!='0'){ ?>
	           <div class="modal-body">
			   <table class="table table-hover dataTable"> <thead> <tr><th> <?php echo Yii::t("default","Driver ID")?></th><th> <?php echo Yii::t("default","Driver name")?></th><th> <?php echo Yii::t("default","Driver Phone")?></th><th> <?php echo Yii::t("default","client Feedback")?></th><th style="    width: 144px;"> <?php echo Yii::t("default","rating")?></th><tr></thead><tbody><?=$ratinlist ?></tbody></table></div>
	<?php 	}else{ ?>
			<div class="modal-body"> <?php echo Yii::t("default","No rating Found")?> </div>
	  
	  <?php 	}
		  
	     
	       $merchant_tax_number=getOption($merchant_id,'merchant_tax_number');
	       if (!empty($merchant_tax_number)):?>
		       <div class="input-block">
		         <div class="label"><?php echo Yii::t("default","Tax number")?> :</div>
		         <div class="value"><?php echo $merchant_tax_number?></div>
		         <div class="clear"></div>
		       </div>	       
	       <?php endif;?>
	       
	       <div class="input-block">
	         <div class="label"><?php echo Yii::t("default","TRN Type")?> :</div>
	         <div class="value"><?php echo Yii::t("default",ucwords($data['trans_type']))?></div>
	         <div class="clear"></div>
	       </div>
	       
	       <div class="input-block">
	         <div class="label"><?php echo Yii::t("default","Payment Type")?> :</div>
	         <!--<div class="value"><?php echo strtoupper(Yii::t("default",$data['payment_type']))?></div>-->
	         <div class="value"><?php echo FunctionsV3::prettyPaymentType('payment_order',
	           $data['payment_type'],$data['order_id'],$data['trans_type']
	         )?></div>
	         <div class="clear"></div>
	       </div>
	       
	       <?php if ( $data['payment_type'] =="pyp"):?>
	       <?php 
	       $paypal_info=Yii::app()->functions->getPaypalOrderPayment($data['order_id']);	       
	       ?>
	       <div class="input-block">
	         <div class="label"><?php echo Yii::t("default","Paypal Transaction ID")?> :</div>
	         <div class="value"><?php echo isIsset($paypal_info['TRANSACTIONID'])?></div>
	         <div class="clear"></div>
	       </div>
	       <?php endif;?>
	       
	       <div class="input-block">
	         <div class="label"><?php echo Yii::t("default","Reference #")?> :</div>
	         <div class="value"><?php echo Yii::app()->functions->formatOrderNumber($data['order_id'])?></div>
	         <div class="clear"></div>
	       </div>
	       
	       <?php if ( $data['payment_provider_name']):?>
	       <div class="input-block">
	         <div class="label"><?php echo Yii::t("default","Card#")?> :</div>
	         <div class="value"><?php echo $data['payment_provider_name']?></div>
	         <div class="clear"></div>
	       </div>
	       <?php endif;?>
	       
	       <?php if ( !empty($data['payment_reference'])):?>
	       <div class="input-block">
	         <div class="label"><?php echo Yii::t("default","Payment Ref")?> :</div>
	         <div class="value"><?php echo $data['payment_reference']?></div>
	         <div class="clear"></div>
	       </div>	       
	       <?php endif;?>
	       	       
	       <?php if ($data['payment_type']=="ccr" || $data['payment_type']=="ocr" ):?>
	       
	       <div class="input-block">
	         <div class="label"><?php echo Yii::t("default","Card #")?> :</div>
	         
	         <?php if (isset($_GET['backend'])):?>
	         
	         <?php if(isset($creditcard_info['encrypted_card'])):?>
	            <?php 
	            $decryp_card = $creditcard_info['credit_card_number'];
	            try {
					$decryp_card = CreditCardWrapper::decryptCard($creditcard_info['encrypted_card']);
				} catch (Exception $e) {
					$decryp_card = Yii::t("default","Caught exception: [error]",array(
					  '[error]'=>$e->getMessage()
					));
				}
	            ?>
	            <div class="value"><?php echo $decryp_card;?></div>           
	         <?php else :?>
	         <div class="value"><?php echo FunctionsV3::prettyCC($data['credit_card_number'])?></div>           
	         <?php endif;?>
	         
	         
	         <?php else :?>
	         <div class="value"><?php echo Yii::app()->functions->maskCardnumber($data['credit_card_number'])?></div>           
	         <?php endif;?>
	         <div class="clear"></div>
	       </div>
	       	       	      
	       <?php if (isset($_GET['backend'])):?>
	       <?php if ( $card_info=Yii::app()->functions->getCreditCardInfo($data['cc_id']) ):?>
	       <div class="input-block">
	         <div class="label"><?php echo Yii::t("default","Card name")?> :</div>
	         <div class="value"><?php echo $card_info['card_name']?></div>
	         <div class="clear"></div>
	       </div> 
	       <div class="input-block">
	         <div class="label"><?php echo Yii::t("default","Expiration month")?> :</div>
	         <div class="value"><?php echo $card_info['expiration_month']?></div>
	         <div class="clear"></div>
	       </div> 
	       <div class="input-block">
	         <div class="label"><?php echo Yii::t("default","Expiration year")?> :</div>
	         <div class="value"><?php echo $card_info['expiration_yr']?></div>
	         <div class="clear"></div>
	       </div> 
	       <div class="input-block">
	         <div class="label"><?php echo Yii::t("default","CVV")?> :</div>
	         <div class="value"><?php echo $card_info['cvv']?></div>
	         <div class="clear"></div>
	       </div> 
	       <div class="input-block">
	         <div class="label"><?php echo Yii::t("default","Billing Address")?> :</div>
	         <div class="value"><?php echo $card_info['billing_address']?></div>
	         <div class="clear"></div>
	       </div> 
	       <?php endif;?>
	       <?php endif;?>
	       
	       <?php endif;?><!-- ccr-->
	       
	       <div class="input-block">
	         <div class="label"><?php echo Yii::t("default","TRN Date")?> :</div>
	         <div class="value"><?php 
	         /*$date= date('M d,Y G:i:s',strtotime($data['date_created']));
	         echo $date=Yii::app()->functions->translateDate($date);*/	         
	         $date = FunctionsV3::prettyDate($data['date_created'])." ".FunctionsV3::prettyTime($data['date_created']);
	         echo $date;
	         ?></div>
	         <div class="clear"></div>
	       </div>
	       
	       <?php if ($data['trans_type']=="delivery"):?>
		       	       
		       <?php if (isset($data['delivery_date'])):?>
		       <div class="input-block">
		         <div class="label"><?php echo Yii::t("default","Delivery Date")?> :</div>
		         <div class="value">
		         <?php 
		         /*$date = prettyDate($data['delivery_date']);
		         echo $date=Yii::app()->functions->translateDate($date);*/
		         echo $date = FunctionsV3::prettyDate($data['delivery_date']);
		         ?>
		         </div>
		         <div class="clear"></div>
		       </div>
		       <?php endif;?>
		       
		       <?php if($data['delivery_asap']!=1):?>
		       <?php if (isset($data['delivery_time'])):?>
		       <?php if ( !empty($data['delivery_time'])):?>
		       <div class="input-block">
		         <div class="label"><?php echo Yii::t("default","Delivery Time")?> :</div>
		         <div class="value">
		         <?php //echo $data['delivery_time']?>
		         <?php 
		         /*echo Yii::app()->functions->timeFormat($data['delivery_time'],true);*/
		         echo FunctionsV3::prettyTime($data['delivery_time'],true);
		         ?>
		         </div>
		         <div class="clear"></div>
		       </div>
		       <?php endif;?>
		       <?php endif;?>
		       <?php endif;?>
		       
		       <?php if($data['delivery_asap']==1):?>
		       <?php if (isset($data['delivery_asap'])):?>
		       <?php if ( !empty($data['delivery_asap'])):?>
		       <div class="input-block">
		         <div class="label"><?php echo Yii::t("default","Deliver ASAP")?> :</div>
		         <div class="value"><?php echo $data['delivery_asap']==1?"Yes":'';?></div>
		         <div class="clear"></div>
		       </div>
		       <?php endif;?>
		       <?php endif;?>
		       <?php endif;?>
		       
		       <div class="input-block">
		         <div class="label"><?php echo Yii::t("default","Deliver to")?> :</div>
		         <div class="value"><?php 
		         if (!empty($data['client_full_address'])){
		         	echo $delivery_address=$data['client_full_address'];
		         } else echo $delivery_address=$data['full_address'];
		         ?></div>
		         <div class="clear"></div>
		       </div>
		       
		       <div class="input-block">
		         <div class="label"><?php echo Yii::t("default","Delivery Instruction")?> :</div>
		         <div class="value"><?php echo $data['delivery_instruction']?></div>
		         <div class="clear"></div>
		       </div>
		       
		       <div class="input-block">
		         <div class="label"><?php echo Yii::t("default","Location Name")?> :</div>
		         <div class="value"><?php 
		         if (!empty($data['location_name1'])){
		         	$data['location_name']=$data['location_name1'];
		         }
		         echo $data['location_name'];
		         ?></div>
		         <div class="clear"></div>
		       </div>
		       
		       <div class="input-block">
		         <div class="label"><?php echo Yii::t("default","Contact Number")?> :</div>
		         <div class="value"><?php 
		         if ( !empty($data['contact_phone1'])){
		         	$data['contact_phone']=$data['contact_phone1'];
		         }
		         echo $data['contact_phone'];?></div>
		         <div class="clear"></div>
		       </div>
		       
		       <?php if ($data['order_change']>=0.1):?>	
		       <div class="input-block">
		         <div class="label"><?php echo Yii::t("default","Change")?> :</div>
		         <div class="value"><?php echo displayPrice( baseCurrency(), normalPrettyPrice($data['order_change']))?></div>
		         <div class="clear"></div>
		       </div>		       
		       <?php endif;?>
		   <?php else :?>   
		   
		       <?php 
		       $label_date=t("Pickup Date");
		       $label_time=t("Pickup Time");
		       if ($transaction_type=="dinein"){
		      	   $label_date=t("Dine in Date");
		           $label_time=t("Dine in Time");
		       }
		       ?> 
		   
			   <div class="input-block">
		         <div class="label"><?php echo Yii::t("default","Contact Number")?> :</div>
		         <div class="value"><?php echo $data['contact_phone']?></div>
		         <div class="clear"></div>
		       </div>		       		       
	       
		      <?php if (isset($data['delivery_date'])):?>
		       <div class="input-block">
		         <div class="label"><?php echo $label_date?> :</div>
		         <div class="value"><?php echo FunctionsV3::prettyDate($data['delivery_date'])?></div>
		         <div class="clear"></div>
		       </div>
		       <?php endif;?>
		       
		       <?php if (isset($data['delivery_time'])):?>
		       <?php if ( !empty($data['delivery_time'])):?>
		       <div class="input-block">
		         <div class="label"><?php echo $label_time?> :</div>
		         <div class="value"><?php echo FunctionsV3::prettyTime($data['delivery_time'])?></div>
		         <div class="clear"></div>
		       </div>
		       <?php endif;?>
		       <?php endif;?>
		       
		       <?php if ($data['order_change']>=0.1):?>	
		       <div class="input-block">
		         <div class="label"><?php echo Yii::t("default","Change")?> :</div>
		         <div class="value"><?php echo displayPrice( baseCurrency(), normalPrettyPrice($data['order_change']))?></div>
		         <div class="clear"></div>
		       </div>		       
		       <?php endif;?>
		       
		       <?php if ($transaction_type=="dinein"):?>
		       <div class="input-block">
		         <div class="label"><?php echo t("Number of guest")?> :</div>
		         <div class="value"><?php echo $data['dinein_number_of_guest']?></div>
		         <div class="clear"></div>
		       </div>		       
		       <div class="input-block">
		         <div class="label"><?php echo t("Table number")?> :</div>
		         <div class="value"><?php echo $data['dinein_table_number']?></div>
		         <div class="clear"></div>
		       </div>		       
		       <div class="input-block">
		         <div class="label"><?php echo t("Special instructions")?> :</div>
		         <div class="value"><?php echo $data['dinein_special_instruction']?></div>
		         <div class="clear"></div>
		       </div>		       
		       <?php endif;?>
	       
	       <?php endif;?>
	       
	       <div class="spacer-small"></div>
		   
		   <?php echo $data2['html'];?>
		   
		  </div>
		  
        </div>
        </div>
        
        
          <div class="print_wrap">
            <!--<a class="print_element left" href="javascript:;">-->
                        
            <?php if (FunctionsV3::hasModuleAddon("printer")):?>
            <a class="print_receipt_thermal left" href="javascript:;" data-id="<?php echo $order_id?>">
             <i class="fa fa-print"></i> <?php echo Yii::t("default","Click here to print")?>
            </a>          
            <?php else :?>
            <a class="print_thermal left" href="javascript:;">
             <i class="fa fa-print"></i> <?php echo Yii::t("default","Click here to print")?>
            </a>          
            <?php endif;?>
            
            <a data-id="<?php echo $data['order_id']?>" class="edit-order right" href="javascript:"><?php echo t("Edit")?></a>          
            <div class="clear"></div>
          </div> <!--print_wrap-->	    
        
	    <?php
    }
}

