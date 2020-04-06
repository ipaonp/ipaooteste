<?php
/*POINTS PROGRAM*/
if (FunctionsV3::hasModuleAddon("pointsprogram")){
	unset($_SESSION['pts_redeem_amt']);
	unset($_SESSION['pts_redeem_points']);
}

$merchant_photo_bg=getOption($merchant_id,'merchant_photo_bg');
if ( !file_exists(FunctionsV3::uploadPath()."/$merchant_photo_bg")){
	$merchant_photo_bg='';
} 

/*RENDER MENU HEADER FILE*/

/*GET MINIMUM ORDER*/

/*dump($distance);
dump($distance_type_raw);
dump($data['minimum_order']);*/

$min_fees=FunctionsV3::getMinOrderByTableRates($merchant_id,
   $distance,
   $distance_type_raw,
   $data['minimum_order']
);

//dump($min_fees);

$ratings=Yii::app()->functions->getRatings($merchant_id);   
$merchant_info=array(   
  'merchant_id'=>$merchant_id ,
  //'minimum_order'=>$data['minimum_order'],
  'minimum_order'=>$min_fees,
  'ratings'=>$ratings,
  'merchant_address'=>$data['merchant_address'],
  'cuisine'=>$data['cuisine'],
  'restaurant_name'=>$data['restaurant_name'],
  'background'=>$merchant_photo_bg,
  'merchant_website'=>$merchant_website,
  'merchant_logo'=>FunctionsV3::getMerchantLogo($merchant_id),
  'contact_phone'=>$data['contact_phone'],
  'restaurant_phone'=>$data['restaurant_phone'],
  'social_facebook_page'=>$social_facebook_page,
  'social_twitter_page'=>$social_twitter_page,
  'social_google_page'=>$social_google_page,
);
$this->renderPartial('/front/menu-header',$merchant_info);

/*ADD MERCHANT INFO AS JSON */
$cs = Yii::app()->getClientScript();
$cs->registerScript(
  'merchant_information',
  "var merchant_information =".json_encode($merchant_info)."",
  CClientScript::POS_HEAD
);		

/*PROGRESS ORDER BAR*/
$this->renderPartial('/front/order-progress-bar',array(
   'step'=>3,
   'show_bar'=>true
));

$now=date('Y-m-d');
$now_time='';

$todays_day = date("l");

$checkout=FunctionsV3::isMerchantcanCheckout($merchant_id); 
$menu=Yii::app()->functions->getMerchantMenu($merchant_id , isset($_GET['sname'])?$_GET['sname']:'' , $todays_day ); 
//dump($menu);
//die();

//dump($checkout);

echo CHtml::hiddenField('is_merchant_open',isset($checkout['code'])?$checkout['code']:'' );

/*hidden TEXT*/
echo CHtml::hiddenField('restaurant_slug',$data['restaurant_slug']);
echo CHtml::hiddenField('merchant_id',$merchant_id);
echo CHtml::hiddenField('is_client_login',Yii::app()->functions->isClientLogin());

echo CHtml::hiddenField('website_disbaled_auto_cart',
Yii::app()->functions->getOptionAdmin('website_disbaled_auto_cart'));

$hide_foodprice=Yii::app()->functions->getOptionAdmin('website_hide_foodprice');
echo CHtml::hiddenField('hide_foodprice',$hide_foodprice);

echo CHtml::hiddenField('accept_booking_sameday',getOption($merchant_id
,'accept_booking_sameday'));

echo CHtml::hiddenField('customer_ask_address',getOptionA('customer_ask_address'));

echo CHtml::hiddenField('merchant_required_delivery_time',
  Yii::app()->functions->getOption("merchant_required_delivery_time",$merchant_id));   
  
/** add minimum order for pickup status*/
$merchant_minimum_order_pickup=Yii::app()->functions->getOption('merchant_minimum_order_pickup',$merchant_id);
if (!empty($merchant_minimum_order_pickup)){
	  echo CHtml::hiddenField('merchant_minimum_order_pickup',$merchant_minimum_order_pickup);
	  
	  echo CHtml::hiddenField('merchant_minimum_order_pickup_pretty',
         displayPrice(baseCurrency(),prettyFormat($merchant_minimum_order_pickup)));
}
 
$merchant_maximum_order_pickup=Yii::app()->functions->getOption('merchant_maximum_order_pickup',$merchant_id);
if (!empty($merchant_maximum_order_pickup)){
	  echo CHtml::hiddenField('merchant_maximum_order_pickup',$merchant_maximum_order_pickup);
	  
	  echo CHtml::hiddenField('merchant_maximum_order_pickup_pretty',
         displayPrice(baseCurrency(),prettyFormat($merchant_maximum_order_pickup)));
}  

/*add minimum and max for delivery*/
//$minimum_order=Yii::app()->functions->getOption('merchant_minimum_order',$merchant_id);
$minimum_order=$min_fees;
if (!empty($minimum_order)){
	echo CHtml::hiddenField('minimum_order',unPrettyPrice($minimum_order));
	echo CHtml::hiddenField('minimum_order_pretty',
	 displayPrice(baseCurrency(),prettyFormat($minimum_order))
	);
}
$merchant_maximum_order=Yii::app()->functions->getOption("merchant_maximum_order",$merchant_id);
 if (is_numeric($merchant_maximum_order)){
 	echo CHtml::hiddenField('merchant_maximum_order',unPrettyPrice($merchant_maximum_order));
    echo CHtml::hiddenField('merchant_maximum_order_pretty',baseCurrency().prettyFormat($merchant_maximum_order));
 }

$is_ok_delivered=1;
if (is_numeric($merchant_delivery_distance)){
	if ( $distance>$merchant_delivery_distance){
		$is_ok_delivered=2;
		/*check if distance type is feet and meters*/
		//if($distance_type=="ft" || $distance_type=="mm" || $distance_type=="mt"){
		if($distance_type=="ft" || $distance_type=="mm" || $distance_type=="mt" || $distance_type=="meter"){
			$is_ok_delivered=1;
		}
	}
} 

echo CHtml::hiddenField('is_ok_delivered',$is_ok_delivered);
echo CHtml::hiddenField('merchant_delivery_miles',$merchant_delivery_distance);
echo CHtml::hiddenField('unit_distance',$distance_type);
echo CHtml::hiddenField('from_address', FunctionsV3::getSessionAddress() );

echo CHtml::hiddenField('merchant_close_store',getOption($merchant_id,'merchant_close_store'));
/*$close_msg=getOption($merchant_id,'merchant_close_msg');
if(empty($close_msg)){
	$close_msg=t("This restaurant is closed now. Please check the opening times.");
}*/
echo CHtml::hiddenField('merchant_close_msg',
isset($checkout['msg'])?$checkout['msg']:t("Sorry merchant is closed."));

echo CHtml::hiddenField('disabled_website_ordering',getOptionA('disabled_website_ordering'));
echo CHtml::hiddenField('web_session_id',session_id());

echo CHtml::hiddenField('merchant_map_latitude',$data['latitude']);
echo CHtml::hiddenField('merchant_map_longtitude',$data['lontitude']);
echo CHtml::hiddenField('restaurant_name',$data['restaurant_name']);


echo CHtml::hiddenField('current_page','menu');

if ($search_by_location){
	echo CHtml::hiddenField('search_by_location',$search_by_location);
}

echo CHtml::hiddenField('minimum_order_dinein',FunctionsV3::prettyPrice($minimum_order_dinein));
echo CHtml::hiddenField('maximum_order_dinein',FunctionsV3::prettyPrice($maximum_order_dinein));

/*add meta tag for image*/
Yii::app()->clientScript->registerMetaTag(
Yii::app()->getBaseUrl(true).FunctionsV3::getMerchantLogo($merchant_id)
,'og:image');

$remove_delivery_info=false;
if($data['service']==3 || $data['service']==6 || $data['service']==7 ){	
	$remove_delivery_info=true;
}

/*CHECK IF MERCHANT SET TO PREVIEW*/
$is_preview=false;
if ($food_viewing_private==2){		
	if (isset($_GET['preview'])){
		if($_GET['preview']=='true'){
			if(!isset($_GET['token'])){
				$_GET['token']='';
			}
			if (md5($data['password'])==$_GET['token']){
			   $is_preview=true;
			}
		}
	}
	if($is_preview==false){
		$menu='';
		$enabled_food_search_menu='';
	}
}
?>

<div class="sections section-menu section-grey2">
<div class="container">
  <div class="row">

     <div class="col-md-8 border menu-left-content">
	 <?php
$row='';
$item_data=array();
$price_select='';
$size_select='';
if ($_SESSION['kr_item']){
	
	$item_data=$_SESSION['kr_item'][0];
	//dump($item_data);
	$price=Yii::app()->functions->explodeData($item_data['price']);
	if (is_array($price) && count($price)>=1){
		$price_select=isset($price[0])?$price[0]:'';
		$size_select=isset($price[1])?$price[1]:'';
	}
	$row++;
}


$data=Yii::app()->functions->getItemById($_GET['item_id']);
$disabled_website_ordering=Yii::app()->functions->getOptionAdmin('disabled_website_ordering');
$hide_foodprice=Yii::app()->functions->getOptionAdmin('website_hide_foodprice');
echo CHtml::hiddenField('hide_foodprice',$hide_foodprice);
?>

<?php if (is_array($data) && count($data)>=1):?>
<?php 
$data=$data[0];
//dump($data);

$mtid=$data['merchant_id'];
$apply_tax=getOption($mtid,'merchant_apply_tax');
$tax=FunctionsV3::getMerchantTax($mtid);

$show_subcategory_description=false;
?>

<form class="frm-fooditem" id="frm-fooditem" method="POST" onsubmit="return false;">
<?php echo CHtml::hiddenField('action','addToCart')?>
<?php echo CHtml::hiddenField('item_id',$_GET['item_id'])?>
<?php echo CHtml::hiddenField('row',isset($row)?$row:"")?>
<?php echo CHtml::hiddenField('merchant_id',isset($data['merchant_id'])?$data['merchant_id']:'')?>


<?php echo CHtml::hiddenField('discount',isset($data['discount'])?$data['discount']:"" )?>
<?php echo CHtml::hiddenField('currentController','store')?>

<?php
 if (isset($item_data['category_id'])){
 	echo CHtml::hiddenField('category_id', isset($item_data['category_id'])?$item_data['category_id']:'' );
 } else echo CHtml::hiddenField('category_id', isset($_GET['category_id'])?$_GET['category_id']:'' );
 ?>

<?php 
//dump($data);
/** two flavores */
if ($data['two_flavors']==2){
	$data['prices'][0]=array(
	  'price'=>0,
	  'size'=>''
	);	
	echo CHtml::hiddenField('two_flavors',$data['two_flavors']);
}
//dump($data['dish']);
?>

<div class="container  view-food-item-wrap">
   
  <!--ITEM NAME & DESCRIPTION-->
  <div class="row">
    <div class="col-md-3 ">              
       <img src="<?php echo FunctionsV3::getFoodDefaultImage($data['photo']);?>" alt="<?php echo $data['item_name']?>" title="<?php echo $data['item_name']?>" class="logo-small">
    </div> <!--col-->
    <div class="col-md-9 ">
       <p class="bold"><?php echo qTranslate($data['item_name'],'item_name',$data)?></p>
       <?php echo Widgets::displaySpicyIconNew($data['dish'],'dish-category');?> 
       <p><?php echo qTranslate($data['item_description'],'item_description',$data)?></p>
    </div> <!--col-->
  </div> <!--row-->
  <!--ITEM NAME & DESCRIPTION--
     
  <!--FOOD ITEM GALLERY-->
  <?php if (getOption($data['merchant_id'],'disabled_food_gallery')!=2):?>  
  <?php $gallery_photo=!empty($data['gallery_photo'])?json_decode($data['gallery_photo']):false; ?>
     <?php if (is_array($gallery_photo) && count($gallery_photo)>=1):?>
      <div class="section-label">
        <a class="section-label-a">
          <span class="bold">
          <?php echo t("Gallery")?></span>
          <b></b>
        </a>     
        <div class="food-gallery-wrap row ">
          <?php foreach ($gallery_photo as $gal_val):?>
          <div class="col-md-3 ">
            <a href="<?php echo websiteUrl()."/upload/$gal_val"?>">
              <div class="food-pic" style="background:url('<?php echo websiteUrl()."/upload/$gal_val"?>')"></div>
              <img style="display:none;" src="<?php echo websiteUrl()."/upload/$gal_val"?>" alt="" title="">
            </a>
          </div> <!--col-->         
          <?php endforeach;?>
        </div> <!--food-gallery-wrap-->   
      </div> <!--section-label-->
     <?php endif;?>
  <?php endif;?>
  <!--FOOD ITEM GALLERY-->
    
  
  <!--PRICE-->
  <div class="section-label">
    <a class="section-label-a">
      <span class="bold">
      <?php echo t("Price")?></span>
      <b></b>
    </a>     
    <div class="row">
    <?php //dump($data['prices']);?>
    
    <?php    
   /*  if item has no price 
   if(!is_array($data['prices']) && empty($data['prices'])){
    	$data['prices'][0]=array(
    	  'price'=>0,
    	  'formatted_price'=>FunctionsV3::prettyPrice(0),
    	  'size'=>''
    	);
    }*/
    ?>
    
    <?php if (is_array($data['prices']) && count($data['prices'])>=1):?>  
      <?php foreach ($data['prices'] as $price):?>
          <?php $price['price']=Yii::app()->functions->unPrettyPrice($price['price'])?>
          <div class="col-md-5 ">
             <?php if ( !empty($price['size'])):?>                 
                 <?php 
                 echo CHtml::hiddenField('with_size',2);
                 $size_id=isset($price['size_id'])?$price['size_id']:'';
                 ?>
                 <?php echo CHtml::radioButton('price',
		          $size_select==$price['size']?true:false
		          ,array(
		            'value'=>$price['price']."|".$price['size']."|".$size_id,
		            'class'=>"price_cls item_price"
		          ))?>
		          <?php echo qTranslate($price['size'],'size',$price)?>
              <?php else :?>
                  <?php echo CHtml::hiddenField('with_size',1)?>              
                  <?php echo CHtml::radioButton('price',
		            count((array)$price['price'])==1?true:false
		            ,array(
		            'value'=>$price['price'],
		            'class'=>"price_cls item_price"
		          ))?>
             <?php endif;?>
             
             <?php 
             /*if ($apply_tax==1 && $tax>0){
             	$price['price']=$price['price'] + ($price['price']*$tax);
             }*/
             ?>
                          
             <?php if (isset($price['price'])):?>  
                <?php if (is_numeric($data['discount'])):?>
                    <span class="line-tru"><?php echo FunctionsV3::prettyPrice($price['price'])?></span>
                    <span class="text-danger"><?php echo FunctionsV3::prettyPrice($price['price']-$data['discount'])?></span>
                <?php else :?>
                    <?php echo FunctionsV3::prettyPrice($price['price'])?>
                 <?php endif;?>
             <?php endif;?>
             
          </div> <!--col-->
      <?php endforeach;?>
    <?php endif;?>
    </div> <!--row-->
  </div>        
  <!--PRICE-->
  
  <!--QUANTITY-->
  <?php if (is_array($data['prices']) && count($data['prices'])>=1):?>
  <div class="section-label">
    <a class="section-label-a">
      <span class="bold">
      <?php echo t("Quantity")?></span>
      <b></b>
    </a>     
    <div class="row">
       <div class="col-md-1 col-xs-1 border into-row">
          <a href="javascript:;" class="green-button inline qty-minus" ><i class="ion-minus"></i></a>
       </div>
       <div class="col-md-2 col-xs-2 border into-row">
          <?php echo CHtml::textField('qty',
	      isset($item_data['qty'])?$item_data['qty']:1
	      ,array(
	      'class'=>"uk-form-width-mini numeric_only qty", 
	      'maxlength'=>5     
	      ))?>
       </div>
       <div class="col-md-1 col-xs-1 border into-row">
         <a href="javascript:;" class="qty-plus green-button inline"><i class="ion-plus"></i></a>
       </div>
       <div class="col-md-6 col-xs-6 border into-row">
         <a href="javascript:;" class="special-instruction orange-button inline"><?php echo t("Special Instructions")?></a>
       </div>
    </div> <!--row-->
  </div> <!-- section-label--> 
  
  <div class="notes-wrap">
  <?php echo CHtml::textArea('notes',
  isset($item_data['notes'])?$item_data['notes']:""
  ,array(
   'class'=>'uk-width-1-1',
   'placeholder'=>Yii::t("default","Special Instructions")
  ))?>
  </div> <!--notes-wrap-->
  
  <?php else :?>
  <!--do nothing-->
  <?php endif;?>  
  <!--QUANTITY-->
    
  
  
  <!--COOKING REF-->
  <?php if (isset($data['cooking_ref'])):?>
  <?php if (is_array($data['cooking_ref']) && count($data['cooking_ref'])>=1):?>
  <div class="section-label">
  
    <div class="section-label-a">
      <span class="bold">
      <?php echo t("Cooking Preference")?></span>
      <b></b>
       <!--<a href="javascript:;"><i class="ion-ios-plus-outline"></i></a>-->
    </div>        
    
    <div class="row">    
      <?php foreach ($data['cooking_ref'] as $cooking_ref_id=>$val):?>
      
      <div class="col-md-5 ">
         <?php $item_data['cooking_ref']=isset($item_data['cooking_ref'])?$item_data['cooking_ref']:''; ?>
         <?php echo CHtml::radioButton('cooking_ref',
	       $item_data['cooking_ref']==$val?true:false
	       ,array(
	         'value'=>$val
	       ))?>&nbsp;             
	       <?php 
	       $cooking_ref_trans=Yii::app()->functions->getCookingTranslation($val,$data['merchant_id']);
	       echo qTranslate($val,'cooking_name',$cooking_ref_trans);
	       ?>
      </div> <!--col-->
      <?php endforeach;?>
    </div> <!--row-->
  </div>  <!--section-label--> 
  <?php endif;?>
  <?php endif;?>
  <!--COOKING REF-->  
  
  <!--Ingredients-->  
  <?php 
  if (!isset($item_data['ingredients'])){
  	  $item_data['ingredients']='';
  }  
  ?>
  <?php if (isset($data['ingredients'])):?>  
  <?php if (is_array($data['ingredients']) && count($data['ingredients'])>=1):?>
  <div class="section-label">
    <a class="section-label-a">
      <span class="bold">
      <?php echo t("Ingredients")?></span>
      <b></b>
    </a>             
     <div class="row">     
         <?php foreach ($data['ingredients'] as $ingredients_id =>  $val):
         $ingredients_name_trans=array();
         $_ingredienst=Yii::app()->functions->getIngredients($ingredients_id);
         if ($_ingredienst){
         	$ingredients_name_trans['ingredients_name_trans']=!empty($_ingredienst['ingredients_name_trans'])?json_decode($_ingredienst['ingredients_name_trans'],true):'';
         }         
         ?>
         <?php $item_data['ingredients_id']=isset($item_data['ingredients_id'])?$item_data['ingredients_id']:''; ?>
         <div class="col-md-5 ">
           <?php echo CHtml::checkbox('ingredients[]',
	       in_array($val,(array)$item_data['ingredients'])?true:false
	       ,array(
	         'value'=>$val
	       ))?>&nbsp;             
	       <?php echo qTranslate($val,'ingredients_name',$ingredients_name_trans);?>
         </div>         
         <?php endforeach;?>
     </div>     
  </div>  
  <?php endif;?>
  <?php endif;?>
  <!--END Ingredients-->
  
  
  <!--FOOD ADDON-->
  <div class="sub-item-rows">
  <?php if (isset($data['addon_item'])):?>
  <?php if (is_array($data['addon_item']) && count($data['addon_item'])>=1):?>
    <?php foreach ($data['addon_item'] as $val): //dump($val);?>
    
     <?php echo CHtml::hiddenField('require_addon_'.$val['subcat_id'],$val['require_addons'],array(
     'class'=>"require_addon require_addon_".$val['subcat_id'],
     'data-id'=>$val['subcat_id'],
     'data-name'=>strtoupper($val['subcat_name'])
    ))?>
    
	  <div class="section-label">
	    <a class="section-label-a">
	      <span class="bold">
	      <?php echo qTranslate($val['subcat_name'],'subcat_name',$val)?>
	      </span>
	      <b></b>	      
	    </a>     
	    
	    <?php if($show_subcategory_description):?>
		    <?php 
		    $subcat_id = $val['subcat_id'];	    
		    $subcategory_description = '';
		    if($subcat_id>0){	    	
		    	if($subcat_data = Yii::app()->functions->getAddonCategory($subcat_id)){			    		
		    		$subcategory_description=$subcat_data['subcategory_description'];
		    	}
		    }
		    ?>
		    
		    <?php if(!empty($subcategory_description)):?>
		    <p><?php echo nl2br(stripslashes($subcategory_description))?></p>
		    <?php endif;?>
	    <?php endif;?>
	    
	    
	  </div>  
	  <?php 	  
	  $enabled_select_addon=false;
	  $multi_option_selected=$val['multi_option'];
	  $addon_data=array();	  	 

	  if (!empty($val['two_flavor_position'])){
	  	 $enabled_select_addon=false;
	  }
	  ?>
	  
	  <?php if ($multi_option_selected=="one" && $enabled_select_addon==TRUE) :?>
	     <?php 	     	     
	     $sub_addon_selected_id='';
	     $subcat_id=$val['subcat_id'];
	     $item_data['sub_item']=isset($item_data['sub_item'])?$item_data['sub_item']:'';
	     if (array_key_exists($subcat_id,(array)$item_data['sub_item'])){
	         $sub_addon_selected=$item_data['sub_item'][$subcat_id];	         
	         if(is_array($sub_addon_selected) && count($sub_addon_selected)>=1){
	         	$sub_addon_selected_id = $sub_addon_selected[0];	  	         	
	         }	         
	     }
	     
	     $addon_data[]=t("Choose one")."...";
	     $subcat_id=$val['subcat_id'];
         //$sub_item_id=$val_addon['sub_item_id'];
         $multi_option_val=$val['multi_option'];
         $sub_item_name="sub_item[$subcat_id][]";          
	     //dump($sub_item_name);	  
	     if (is_array($val['sub_item']) && count($val['sub_item'])>=1){
	     	foreach ($val['sub_item'] as $val_addon){	     	
	     		$key=$val_addon['sub_item_id']."|".$val_addon['price']."|".$val_addon['sub_item_name']."|".$val['two_flavor_position'];
	     		if ($val_addon['price']>0){
	     			$addon_data[$key]=$val_addon['sub_item_name']." (".prettyFormat($val_addon['price']).")";	
	     		} else $addon_data[$key]=$val_addon['sub_item_name'];		     		
	     	}	     		     	
	     	?>
	     	<div class="row top10">
	     	  <div class="col-md-12 col-xs-12 border into-row">
	     	   <?php 
	     	   echo CHtml::dropDownList($sub_item_name, $sub_addon_selected_id ,(array)$addon_data,array(
	     	     'class'=>'select_sub_item sub_item_name sub_item_name_'.$val['subcat_id'],
	     	     'data-type'=>"select"
	     	   ));
	     	   ?>
	     	  </div>
	     	</div>
	     	<?php	     	
	     }
	     ?>
	     
	  <?php else :?>
	  
	  <?php if (is_array($val['sub_item']) && count($val['sub_item'])>=1):?>
	  <?php $x=0;?>
	  <?php foreach ($val['sub_item'] as $val_addon):?>    
	  <?php 
	  $subcat_id=$val['subcat_id'];
      $sub_item_id=$val_addon['sub_item_id'];
      $multi_option_val=$val['multi_option'];
      
       /** fixed select only one addon*/
        if ( $val['multi_option']=="custom" || $val['multi_option']=="multiple"){
        	$sub_item_name="sub_item[$subcat_id][$x]";
        } else $sub_item_name="sub_item[$subcat_id][]"; 
        
        $sub_addon_selected=array();
        $sub_addon_selected_id=array();
                    
        $item_data['sub_item']=isset($item_data['sub_item'])?$item_data['sub_item']:'';
        if (array_key_exists($subcat_id,(array)$item_data['sub_item'])){
        	$sub_addon_selected=$item_data['sub_item'][$subcat_id];
        	if (is_array($sub_addon_selected) && count($sub_addon_selected)>=1){
            	foreach ($sub_addon_selected as $val_addon_selected) {
            		$val_addon_selected=Yii::app()->functions->explodeData($val_addon_selected);
            		if (is_array($val_addon_selected)){
            		    $sub_addon_selected_id[]=$val_addon_selected[0];
            		}
            	}
        	}
        }
	  ?>	    
	    <div class="row top10">
	        <div class="col-md-5 col-xs-5 border into-row">
	        <?php 
	         if ( $val['multi_option']=="custom" || $val['multi_option']=="multiple"): 
                            
	            echo CHtml::checkBox($sub_item_name,
	            in_array($sub_item_id,(array)$sub_addon_selected_id)?true:false
	            ,array(
	              'value'=>$val_addon['sub_item_id']."|".$val_addon['price']."|".$val_addon['sub_item_name']."|".$val['two_flavor_position'],
	              'data-id'=>$val['subcat_id'],
	              'data-option'=>$val['multi_option_val'],
	              'rel'=>$val['multi_option'],
	              'class'=>'sub_item_name sub_item_name_'.$val['subcat_id']
	            ));
            else :            	                            
	            echo CHtml::radioButton($sub_item_name,
	            in_array($sub_item_id,(array)$sub_addon_selected_id)?true:false
	            ,array(
	              'value'=>$val_addon['sub_item_id']."|".$val_addon['price']."|".$val_addon['sub_item_name']."|".$val['two_flavor_position'],	             
	              'class'=>'sub_item sub_item_name_'.$val['subcat_id'],
	              'data-type'=>"radio"	             
	            ));
            endif;
                        
            echo "&nbsp;".qTranslate($val_addon['sub_item_name'],'sub_item_name',$val_addon);
            echo "<p>".qTranslate($val_addon['item_description'],'item_description',$val_addon)."</p>";
	        ?>
	        </div> <!--col-->
	        
	        <div class="col-md-4 col-xs-4 border into-row ">
	          <?php if ($val['multi_option']=="multiple"):?>
		      <?php             
	          $qty_selected=1;
	          if (!isset($item_data['addon_qty'])){
	           	 $item_data['addon_qty']='';
	          }
	          if (array_key_exists($subcat_id,(array)$item_data['addon_qty'])){            	            
	          	  if(isset($item_data['addon_qty'][$subcat_id][$x])){
	                $qty_selected=$item_data['addon_qty'][$subcat_id][$x];
	          	  }
	          }            
	          ?>
	          
	          <div class="row quantity-wrap-small">
	            <div class="col-md-3 col-xs-3 border ">
	              <a href="javascript:;" class="green-button inline qty-addon-minus"><i class="ion-minus"></i></a>
	            </div>
	            <div class="col-md-5 col-xs-5 border">
	              <?php echo CHtml::textField("addon_qty[$subcat_id][$x]",$qty_selected,array(
		          'class'=>"numeric_only left addon_qty",   
		          'maxlength'=>5
		          ))?>
	            </div>
	            <div class="col-md-3 col-xs-3 border ">
	              <a href="javascript:;" class="green-button inline qty-addon-plus"><i class="ion-plus"></i></a>
	            </div>
	          </div>
	          
	          <?php endif;?>
	        </div> <!--col-->
	        
	        <?php 
	        /*if ($apply_tax==1 && $tax>0){
	        	$val_addon['price']=$val_addon['price']+($val_addon['price']*$tax);
	        }*/
	        ?>
	        <div class="col-md-3 col-xs-3 border text-right into-row">
	        <span class="hide-food-price">
	        <?php echo !empty($val_addon['price'])? FunctionsV3::prettyPrice($val_addon['price']) :"-";?>
	        </span>
	        </div> <!--col-->
	    </div> <!--row-->	    
	    <?php $x++;?>
	  <?php endforeach;?>	  
	  <?php endif;?>  <!--endif sub_item-->	  
	  <?php endif;?> 
	  	  
     <?php endforeach;?> <!--endforeach val-->
  <?php endif;?>
  <?php endif;?>
  </div><!-- .sub-item-rows-->
  <!--FOOD ADDON-->

<?php if ($disabled_website_ordering==""):?>
<div class="section-label top25">
<a class="section-label-a">
  <span class="bold">
  &nbsp;
  </span>
  <b></b>
</a>        
</div>  
<div class="row food-item-actions">
  
  <div class="col-md-12 col-xs-12 border into-row">
     <input type="submit" value="<?php echo empty($row)?Yii::t("default","add to cart"):Yii::t("default","update cart");?>" 
     class="add_to_cart orange-button upper-text">
  </div>
  
</div>
<?php endif;?>
  
</div> <!--view-item-wrap-->
</form>
<?php else :?>
<p class="text-danger"><?php echo Yii::t("default","Sorry but we cannot find what you are looking for.")?></p>
<?php endif;?>

	 
     </div> <!-- menu-left-content-->
     
     <?php if (getOptionA('disabled_website_ordering')!="yes"):?>
     <div id="menu-right-content" class="col-md-4 border menu-right-content <?php echo $disabled_addcart=="yes"?"hide":''?>" >
     
     <div class="theiaStickySidebar">
      <div class="box-grey rounded  relative">
              
        <!--DELIVERY INFO-->
        <?php if ($remove_delivery_info==false):?>
        <div class="star-float"></div>
        <div class="inner center">
         <button type="button" class="close modal-close-btn" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true">&times;</span>
         </button> 
                   
            <?php if ($data['service']==3):?>
            <p class="bold"><?php echo t("Distance Information")?></p>
            <?php else :?>
	        <p class="bold"><?php echo t("Delivery Information")?></p>
	        <?php endif;?>
	        
	        <p>
	        <?php 
	        if(!$search_by_location){
		        if ($distance){
		        	echo t("Distance").": ".number_format($distance,1)." $distance_type";
		        } else echo  t("Distance").": ".t("not available");
	        }
	        ?>
	        </p>
	        
	        <p class="delivery-fee-wrap">
	        <?php echo t("Delivery Est")?>: <?php echo FunctionsV3::getDeliveryEstimation($merchant_id)?></p>
	        
	        <p class="delivery-fee-wrap">
	        <?php 
	        if(!$search_by_location){
		        if (!empty($merchant_delivery_distance)){
		        	echo t("Delivery Distance Covered").": ".$merchant_delivery_distance." $distance_type_orig";
		        } else echo  t("Delivery Distance Covered").": ".t("not available");
	        }
	        ?>
	        </p>
	        
	        <p class="delivery-fee-wrap">
	        <?php 
	        if ($delivery_fee){
	             echo t("Delivery Fee").": ".FunctionsV3::prettyPrice($delivery_fee);
	        } else echo  t("Delivery Fee").": ".t("Free Delivery");
	        ?>
	        </p>
	        
	        
	        <?php if(FunctionsV3::enabledExtraCharges()):?>
	        <?php $extra_charge_notification  = getOption($merchant_id,'extra_charge_notification')?>
	        <?php if(!empty($extra_charge_notification)):?>
	          <p class="extra_charge_notification"><?php echo $extra_charge_notification;?></p>
	        <?php endif;?>
	        <?php endif;?>
	        
	        <?php if($search_by_location):?>
	        <a href="javascript:;" class="top10 green-color change-location block text-center">
	        [<?php echo t("Change Location here")?>]
	        </a>
	        <?php else:?>
	        <a href="javascript:;" class="top10 green-color change-address block text-center">
	        [<?php echo t("Change Your Address here")?>]
	        </a>
	        <?php endif;?>
	        
	        
        </div>
        <!--END DELIVERY INFO-->
        <?php else :?>
        
        <?php endif;?>
        
        <!--CART-->
        <div class="inner line-top relative">
        
           <i class="order-icon your-order-icon"></i>
           
           <p class="bold center"><?php echo t("Your Order")?></p>
           
           <div class="item-order-wrap"></div>
           
           <!--VOUCHER STARTS HERE-->
           <?php //Widgets::applyVoucher($merchant_id);?>
           <!--VOUCHER STARTS HERE-->
           
           <!--MAX AND MIN ORDR-->
           <?php if ($minimum_order>0):?>
           <div class="delivery-min">
              <p class="small center"><?php echo Yii::t("default","Subtotal must exceed")?> 
              <?php echo displayPrice(baseCurrency(),prettyFormat($minimum_order,$merchant_id))?>
           </div>
           <?php endif;?>
           
           <?php if ($merchant_minimum_order_pickup>0):?>
           <div class="pickup-min">
              <p class="small center"><?php echo Yii::t("default","Subtotal must exceed")?> 
              <?php echo displayPrice(baseCurrency(),prettyFormat($merchant_minimum_order_pickup,$merchant_id))?>
           </div>
           <?php endif;?>
                      
           <?php if($minimum_order_dinein>0):?>
           <div class="dinein-min">
              <p class="small center"><?php echo Yii::t("default","Subtotal must exceed")?> 
              <?php echo FunctionsV3::prettyPrice($minimum_order_dinein)?>
           </div>
           <?php endif;?>
              
	        <a href="javascript:;" class="clear-cart">[<?php echo t("Clear Order")?>]</a>
           
        </div> <!--inner-->
        <!--END CART-->
        
        <!--DELIVERY OPTIONS-->
        <div class="inner line-top relative delivery-option center">
           <i class="order-icon delivery-option-icon"></i>
           
           <?php if ($remove_delivery_info==false):?>
             <p class="bold"><?php echo t("Delivery Options")?></p>
           <?php else :?>
             <p class="bold"><?php echo t("Options")?></p>
           <?php endif;?>
           
           <?php echo CHtml::dropDownList('delivery_type',$now,
           (array)Yii::app()->functions->DeliveryOptions($merchant_id),array(
             'class'=>'grey-fields'
           ))?>
                      
           <?php             
            if($website_use_date_picker==2){
            	echo CHtml::dropDownList('delivery_date','',
            	(array)FunctionsV3::getDateList($merchant_id)
            	,array(
            	  'class'=>'grey-fields date_list'
            	));
            } else {
            	echo CHtml::hiddenField('delivery_date',$now);
	            echo CHtml::textField('delivery_date1',
	            FormatDateTime($now,false),array('class'=>"j_date grey-fields",'data-id'=>'delivery_date'));
            }
           ?>
           
           <div class="delivery_asap_wrap">            
            <?php $detect = new Mobile_Detect;?>           
            <?php if ( $detect->isMobile() ) :?>
             <?php                           
             echo CHtml::dropDownList('delivery_time',$now_time,
             (array)FunctionsV3::timeList()
             ,array(
              'class'=>"grey-fields"
             ))
             ?>
            <?php else :?>                       
	          <?php
	          $website_use_time_picker = getOptionA('website_use_time_picker');
	          $delivery_time_list = FunctionsV3::getTimeList($merchant_id,$now);	          
	          if($website_use_time_picker==3){
	          	  echo CHtml::dropDownList('delivery_time','', (array)$delivery_time_list ,array(
	          	    'class'=>'grey-fields time_list'
	          	  ));
	          } else {
	          	  $now_time=date("h:i A");
		          echo CHtml::textField('delivery_time',$now_time,
		          array('class'=>"timepick grey-fields",'placeholder'=>Yii::t("default","Delivery Time")));
	          }
	          ?>
	       <?php endif;?>  	          	  

	          <?php if ( $checkout['is_pre_order']==2):?>         
	          <span class="delivery-asap">
	           <?php echo CHtml::checkBox('delivery_asap',false,array('class'=>"icheck"))?>
	            <span class="text-muted"><?php echo Yii::t("default","Delivery ASAP?")?></span>	          
	         </span>       	         	        	     
	         <?php endif;?>    
	         
           </div><!-- delivery_asap_wrap-->
           
           <?php if ( $checkout['code']==1):?>
              <a href="javascript:;" class="orange-button medium checkout"><?php echo $checkout['button']?></a>
           <?php else :?>
              <?php if ( $checkout['holiday']==1):?>
                 <?php echo CHtml::hiddenField('is_holiday',$checkout['msg'],array('class'=>'is_holiday'));?>
                 <p class="text-danger"><?php echo $checkout['msg']?></p>
              <?php else :?>
                 <p class="text-danger"><?php echo $checkout['msg']?></p>
                 <p class="small">
                 <?php echo Yii::app()->functions->translateDate(date('F d l')."@".timeFormat(date('c'),true));?></p>
              <?php endif;?>
           <?php endif;?>
                                                                
        </div> <!--inner-->
        <!--END DELIVERY OPTIONS-->
        
      </div> <!-- box-grey-->
      </div> <!--end theiaStickySidebar-->
     
     </div> <!--menu-right-content--> 
     <?php endif;?>
  
  </div> <!--row-->
</div> <!--container-->
</div> <!--section-menu-->
<style>
.edit_item{
	display:none
}
</style>
<script type="text/javascript">
jQuery(document).ready(function() {	
	var hide_foodprice=$("#hide_foodprice").val();	
	if ( hide_foodprice=="yes"){
		$(".hide-food-price").hide();
		$("span.price").hide();		
		$(".view-item-wrap").find(':input').each(function() {			
			$(this).hide();
		});
	}
	

	var price_cls=$(".price_cls:checked").length; 	
	if ( price_cls<=0){
		var x=0
		$( ".price_cls" ).each(function( index ) {
			if ( x==0){
				dump('set check');
				$(this).attr("checked",true);
			}
			x++;
		});
	}
		

if ( $(".food-gallery-wrap").exists()){
	  $('.food-gallery-wrap').magnificPopup({
      delegate: 'a',
      type: 'image',
      closeOnContentClick: false,
      closeBtnInside: false,
      mainClass: 'mfp-with-zoom mfp-img-mobile',
      image: {
        verticalFit: true,
        titleSrc: function(item) {
          return '';
        }
      },
      gallery: {
        enabled: true
      },
      zoom: {
        enabled: true,
        duration: 300, // don't foget to change the duration also in CSS
        opener: function(element) {
          return element.find('img');
        }
      }      
    });
    	  
}

   $( document ).on( "change", ".qty", function() {	
	 	var value = parseInt($(this).val());
	 	if ( value<=0){
	 		$(this).val(1);
	 	}
   });
   	
});	 /*END READY*/
</script>