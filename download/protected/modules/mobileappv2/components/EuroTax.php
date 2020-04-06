<?php
class EuroTax
{
	
	public static function isApplyTax($merchant_id='')
	{
		$apply_tax = getOption($merchant_id,'merchant_apply_tax');
		$euro_tax = FunctionsV3::getMerchantTax($merchant_id);
		if ( $apply_tax==1 && $euro_tax>0.0001){
			return $euro_tax;
		}
		return false;
	}
	
	public static function computeWithTax($data=array(), $merchant_id='')
	{
				
		$total_plus_charges = 0; $total_food=0; $grand_total=0;
		
		/*GET TOTAL FOOD*/
		if(is_array($data['item']) && count($data['item'])>=1){
			foreach ($data['item'] as $row => $item) {
				
				 $price=$item['normal_price'];
			     if ( $item['discount']>0){
			     	$price=$item['discounted_price'];
			     }
			     $total_food+=$item['qty']*$price;
			     
			     if (is_array($item['new_sub_item']) && count($item['new_sub_item'])>=1){
			         foreach ($item['new_sub_item'] as $sub_name => $sub_item){
			         	 foreach ($sub_item as $sub_item2){			         	 	 
			         	 	 $total_food+=$sub_item2['addon_price']*$sub_item2['addon_qty'];
			         	 }
			         }	
			     }			     
			}
		}
				
		$data_total = $data['total'];			
				
		$debug = false;
		if(isset($_GET['debug'])){		
			$debug=true;
		}
		
		if($debug){
		   dump($data_total);
		   dump("total food :$total_food");
		}
		
		$total_plus_charges = $total_food;
		if (isset($data_total['delivery_charges'])){
			if($data_total['delivery_charges']>0.001){				
				$total_plus_charges+=$data_total['delivery_charges'];
			}
		}
		if (isset($data_total['merchant_packaging_charge'])){
			if($data_total['merchant_packaging_charge']>0.001){
				$total_plus_charges+=$data_total['merchant_packaging_charge'];
			}
		}
		
		if (isset($data_total['card_fee'])){
			if ($data_total['card_fee']>0.001){
				$total_plus_charges+=$data_total['card_fee'];
			}
		}
				
		if ( $data_total['cart_tip_percentage']>0.001){
			$data_total['tips']=$total_food*($data_total['cart_tip_percentage']/100);
			$total_plus_charges+=+$data_total['tips'];
		}
		
		if (isset($data_total['less_voucher'])){
			if ($data_total['less_voucher']>0.001){
				if (empty($data_total['voucher_type'])){			
				   $total_plus_charges+=-$data_total['less_voucher'];
				} else {
				   $data_total['less_voucher']=$total_food*($data_total['voucher_value']/100);	
				   $total_plus_charges+=-$data_total['less_voucher'];
				}
			}
		}
		
		if (isset($data_total['pts_redeem_amt'])){
			if ($data_total['pts_redeem_amt']>0.001){
				$total_plus_charges+=-$data_total['pts_redeem_amt'];
			}
		}
				
		if($debug){
		   dump("total_plus_charge :$total_plus_charges");
		}
		
		$grand_total+=$total_plus_charges;
		
		if ( $data_total['discounted_amount']>0.001){	
			$data_total['discounted_amount']=$total_food*($data_total['merchant_discount_amount']/100);
			$grand_total+=-$data_total['discounted_amount'];
		}
		
		if($debug){
		   dump("grand total :".$grand_total);
		}
		
		$tax = FunctionsV3::getMerchantTax($merchant_id);
		
		if($debug){
		   dump("tax :".$tax);
		}
		
		$data_total['total']=$grand_total;
        $data_total['subtotal']=$grand_total/($tax+1); 
        $data_total['taxable_total']=$data_total['total']-$data_total['subtotal'];

        if($debug){
           dump("tax :".$data_total['taxable_total']);
        }                   
		return $data_total;
	}
	
	public static function tableRow($label='', $value='')
	{
		$html='<tr>';
		  $html.="<td class=\"col-1\">$label</td>";
		  $html.="<td class=\"col-2\">$value</td>";
		$html.='</tr>';
		return $html;
	}
			
	
}/* end class*/