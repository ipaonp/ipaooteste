<?php
class itemWrapper
{
	static $sizes = array();
	static $enabled_trans=false;
	
	public static function setMultiTranslation()
	{
		$enabled_trans=getOptionA('enabled_multiple_translation');
		if($enabled_trans==2){
			self::$enabled_trans = true;
		}
	}
	
	public static function getMenu($merchant_id='', $pagenumber=0, $pagelimit=10)
	{	
							
		$p = new CHtmlPurifier();
		
		$paginate_total=0;
		$menu_type = mobileWrapper::getMenuType();
		
		$default_image='';
		
		$disabled_default_image = getOptionA('mobile2_disabled_default_image');
		$merchant_menu_type = getOptionA('mobileapp2_merchant_menu_type');		
		if($merchant_menu_type==3){
			$default_image='resto_banner.jpg';
			$disabled_default_image=false;
		}
		
		if($merchant_id>0){
			self::$sizes = self::getSize($merchant_id);
			
			$todays_day = date("l");
            $todays_day = !empty($todays_day)?strtolower($todays_day):'';
            
            $and='';
            
            $enabled_category_sked = getOption($merchant_id,'enabled_category_sked'); 
            if($enabled_category_sked==1){
    		    $and .= " AND $todays_day='1' ";
    	    }    	    
			$db = new DbExt();
			$stmt="
			SELECT SQL_CALC_FOUND_ROWS *
			FROM
			{{category}}
			WHERE
			merchant_id = ".FunctionsV3::q($merchant_id)."
			AND status in ('publish','published')
			$and
			ORDER BY sequence,date_created ASC
			LIMIT $pagenumber,$pagelimit
			";			
			//dump($stmt);
			if($res = $db->rst($stmt)){
				
				$total_records=0;
				$stmtc="SELECT FOUND_ROWS() as total_records";
				if ($resp=$db->rst($stmtc)){			 			
					$total_records=$resp[0]['total_records'];
				}		
				
				$paginate_total = ceil( $total_records / $pagelimit );
				
				foreach ($res as $val) {					
					$new_data['cat_id']=$val['cat_id'];
					$new_data['category_name']=$val['category_name'];
					$new_data['category_description']=$val['category_description'];
					$new_data['category_pic']=mobileWrapper::getImage($val['photo'],$default_image,$disabled_default_image);
					
					if(self::$enabled_trans==TRUE){
					  $category_name['category_name_trans']=!empty($val['category_name_trans'])?json_decode($val['category_name_trans'],true):'';
					  $new_data['category_name'] = qTranslate($new_data['category_name'],'category_name',$category_name);
					  
					  $category_description['category_description_trans']=!empty($val['category_description_trans'])?json_decode($val['category_description_trans'],true):'';
					  $new_data['category_description'] = qTranslate($new_data['category_description'],'category_description',$category_description);					  
					}
					
					
					$new_data['category_description'] = self::limitText($p,$new_data['category_description']);
					
					//dump($menu_type);					
					if($menu_type==1){
					   $item_data = self::getItemByCategory($merchant_id,$val['cat_id'],false);
					   $new_data['item'] = is_array($item_data['data'])?$item_data['data']:array();
					}
					$data[]=$new_data;
				}
				return array(
				  'paginate_total'=>$paginate_total,
				  'list'=>$data
				);
			}
			unset($db);
		}
		return false;
	}
	
	public static function getMerchantCategory($merchant_id='')
	{		
		$data = array();
		if($merchant_id>0){
			
			$todays_day = date("l");
            $todays_day = !empty($todays_day)?strtolower($todays_day):'';
            
            $and='';
            
            $enabled_category_sked = getOption($merchant_id,'enabled_category_sked'); 
            if($enabled_category_sked==1){
    		    $and .= " AND $todays_day='1' ";
    	    }    	 
    	    
    	    $cart_theme = getOptionA('mobileapp2_cart_theme');
    	    
			$db = new DbExt();
			$stmt="
			SELECT 
			cat_id,
			category_name,
			category_description,
			photo,
			status,
			category_name_trans,
			category_description_trans
			FROM
			{{category}}
			WHERE
			merchant_id = ".FunctionsV3::q($merchant_id)."
			AND status in ('publish','published')
			$and
			ORDER BY sequence,date_created ASC			
			";					
			if($res = $db->rst($stmt)){			
				if($cart_theme==2){
					self::$enabled_trans = true;
				}
					
				if(self::$enabled_trans!=TRUE){
					return $res;
				}				
				foreach ($res as $val) {					
					$val['category_name'] = qTranslate($val['category_name'],'category_name',array(
					  'category_name_trans'=>json_decode($val['category_name_trans'],true)
					));				
					$val['category_description'] = qTranslate($val['category_description'],'category_description',array(
					  'category_description_trans'=>json_decode($val['category_description_trans'],true)
					));					
					
					if($cart_theme==2){						
						$item_count = self::getItemCountByCategory($val['cat_id']);
						$val['item_count']= mt("[count] item",array(
						  '[count]'=>$item_count
						));
					}
					
					$data[]=$val;
				}
				return $data;
			}
		}
		return false;
	}
	
	public static function getCategoryByID($cat_id='')
	{
		$db = new DbExt();
		
		if($cat_id>0){
			
			$stmt="SELECT 
			cat_id,
			category_name,
			category_description,
			photo,
			status,
			category_name_trans,
			category_description_trans
			 FROM
			{{category}}
			WHERE cat_id=".FunctionsV3::q($cat_id)."
			AND status in ('publish')
			LIMIT 0,1
			";
			if($res = $db->rst($stmt)){
				return $res[0];
			}			
		}
		return false;
	}
	
	public static function getItemByCategory($merchant_id='',$category_id='', $paginate=false, 
	$pagenumber=0, $pagelimit=10, $filter_dishes = array() )
	{		
		$p = new CHtmlPurifier();
		
		$paginate_total=0; 
		$limit="LIMIT $pagenumber,$pagelimit";
		
		if($merchant_id>0 && $category_id>0){
			
		if(!$paginate){
			$limit='';
		}
		
		$and = '';
		
		$default_image='';
				
		$disabled_default_image = getOptionA('mobile2_disabled_default_image');
		$merchant_menu_type = getOptionA('mobileapp2_merchant_menu_type');
		if($merchant_menu_type==3){
			$default_image='resto_banner.jpg';
			$disabled_default_image=false;
		}
		
		$food_option_not_available = getOption($merchant_id,'food_option_not_available');
		if($food_option_not_available==1){
			$and = "AND not_available <> '2' ";
		}
		
		if(!empty($filter_dishes)){			
			$and.=" AND dish like ".FunctionsV3::q('%"'.$filter_dishes.'"%')." ";
		}
			
		$db = new DbExt();
		$stmt="
		SELECT SQL_CALC_FOUND_ROWS 
		item_id,
		merchant_id,
		item_name,
		item_description,
		item_name_trans,
		item_description_trans,
		status,
		price,
		photo,
		discount,
		dish
		FROM
		{{item}}
		WHERE
		category like ".FunctionsV3::q('%"'.$category_id.'"%')."
		AND
		status IN ('publish','published')
		AND merchant_id = ".FunctionsV3::q($merchant_id)."
		$and
		ORDER BY sequence ASC
		$limit
		";		
		//dump($stmt);				
		if ($res = $db->rst($stmt)){
			
			$total_records=0;
			$stmtc="SELECT FOUND_ROWS() as total_records";
			if ($resp=$db->rst($stmtc)){			 			
				$total_records=$resp[0]['total_records'];
			}		
			
			$paginate_total = ceil( $total_records / $pagelimit );
			
			$data = array();
			foreach ($res as $val) {				
				$price=''; $prices = array(); $prices2 = array(); 
				if ( json_decode($val['price'])){
					$price = json_decode($val['price'],true);					
					foreach ($price as $size_id=>$priceval) {
												
						$original_price = $priceval;
						$discounted_price = 0;
						
						if($val['discount']>=0.001){
							$priceval = $priceval-$val['discount'];
							$discounted_price = $priceval;
						}					
							
						if(array_key_exists($size_id,(array)self::$sizes)){
							$prices[]=self::$sizes[$size_id]."&nbsp;".FunctionsV3::prettyPrice($priceval);
							$prices2[] = array(							  
							  'original_price'=>self::$sizes[$size_id]."&nbsp;".FunctionsV3::prettyPrice($original_price),
							  'discount'=>$val['discount'],
							  'discounted_price_pretty'=>self::$sizes[$size_id]."&nbsp;".FunctionsV3::prettyPrice($priceval),
							);
						} else {							
							$prices[]=FunctionsV3::prettyPrice($priceval);		
							$prices2[] = array(							  
							  'original_price'=>FunctionsV3::prettyPrice($original_price),
							  'discount'=>$val['discount'],
							  'discounted_price_pretty'=>FunctionsV3::prettyPrice($priceval),
							);
						}
					}					
				} 
				
				if(self::$enabled_trans==TRUE){
					$val['item_name'] = qTranslate($val['item_name'],'item_name',array(
					  'item_name_trans'=>json_decode($val['item_name_trans'],true)
					));
					
					$val['item_description'] = qTranslate($val['item_description'],'item_description',array(
					  'item_description_trans'=>json_decode($val['item_description_trans'],true)
					));
				}
								
				$val['photo']=mobileWrapper::getImage($val['photo'],$default_image,$disabled_default_image);												
				//$val['item_description']=strip_tags($val['item_description']);				
				$val['item_description']=self::limitText($p,$val['item_description']);				
				
				$val['prices']=$prices;
				$val['prices2']=$prices2;
				$val['cat_id']=$category_id;
				
				$icon_dish= array();
				if(!empty($val['dish'])){				
					if (method_exists("FunctionsV3","getDishIcon")){	   
				       $icon_dish = FunctionsV3::getDishIcon($val['dish']);
					} else $icon_dish='';
				} else $icon_dish='';
				
				$val['dish_image'] = $icon_dish;
				
				$data[] = $val;
			}
			
			
			return array(
			  'data'=>$data,
			  'paginate_total'=>$paginate_total
			);
		}
		unset($db);
		}
		return false;			
	}
	
	public static function getSize($merchant_id='')
	{		
		$db = new DbExt();
		$stmt="SELECT 
		size_id,
		size_name,
		size_name_trans
		FROM
		{{size}}
		WHERE
		merchant_id = ".FunctionsV3::q($merchant_id)."
		AND status IN ('publish')
		";
		if($res=$db->rst($stmt)){
			$data = array();			
		   	foreach ($res as $val) {		   
		   		if(self::$enabled_trans==TRUE){
		   			$val['size_name'] = qTranslate($val['size_name'],'size_name',array(
					  'size_name_trans'=>json_decode($val['size_name_trans'],true)
					));
		   		}
		   		$data[$val['size_id']]=$val['size_name'];
		   	}
		   	return $data;
		}
		return false;
	}
	
	public static function searchItemByName($merchant_id='',$item_name='')
	{
		$db = new DbExt();
		if($merchant_id>0 && !empty($item_name)){		
			$stmt="
			SELECT 
			item_id,
			merchant_id,
			item_name,
			category,
			item_name_trans,
			item_description,
			item_description_trans,
			photo
			FROM {{item}}
			WHERE merchant_id = ".FunctionsV3::q($merchant_id)."
			AND item_name like ".FunctionsV3::q( "%$item_name%" )."
			AND not_available <> '2'
			ORDER BY item_name ASC
			";								
			if($res = $db->rst($stmt)){
				return $res;
			}
		}
		return false;
	}
	
	public static function searchByCategoryByName($merchant_id='',$category_name='')
	{
		$db = new DbExt();
		if($merchant_id>0 && !empty($category_name)){		
			
			$and='';
			$todays_day = date("l");
            $todays_day = !empty($todays_day)?strtolower($todays_day):'';                        
            $enabled_category_sked = getOption($merchant_id,'enabled_category_sked'); 
            if($enabled_category_sked==1){
    		    $and .= " AND $todays_day='1' ";
    	    }    	    	    
			
			$stmt="
			SELECT 
			cat_id,
			merchant_id,
			category_name,
			category_description,
			photo,
			status,
			category_name_trans,
			category_description_trans			
			FROM {{category}}
			WHERE merchant_id = ".FunctionsV3::q($merchant_id)."				
			$and		
			AND ( category_name like ".FunctionsV3::q( "%$category_name%" )." OR 
			category_description LIKE ".FunctionsV3::q( "%$category_name%" )."  )			
			ORDER BY category_name ASC
			";					
			//dump($stmt);			
			if($res = $db->rst($stmt)){
				return $res;
			}
		}
		return false;
	}
	
	
	public static function translateCookingRef($data=array())
	{
		$new_data = array();
		if(self::$enabled_trans==TRUE){	
			if(is_array($data) && count($data)>=1){
				foreach ($data as $cook_id=>$val) {
					if($res = Yii::app()->functions->getCookingRef($cook_id)){
						$val = qTranslate($res['cooking_name'],'cooking_name',array(
						  'cooking_name_trans'=>json_decode($res['cooking_name_trans'],true)
						));
					}
					$new_data[$cook_id]=$val;
				}
				return $new_data;
			}			
		}
		return $data;
	}
	
	public static function translateIngredients($data=array())
	{
		$new_data = array();
		if(self::$enabled_trans==TRUE){
			if(is_array($data) && count($data)>=1){
				foreach ($data as $ingredients_id=>$val) {
					if($res = Yii::app()->functions->getIngredients($ingredients_id)){
						$val = qTranslate($res['ingredients_name'],'ingredients_name',array(
						  'ingredients_name_trans'=>json_decode($res['ingredients_name_trans'],true)
						));
					}
					$new_data[$ingredients_id]=$val;
				}
				return $new_data;
			}
		} 
		return $data;
	}
	
	public static function dishesList()
	{
		$data = array();
		$db = new DbExt();
		$stmt="
		SELECT 
		dish_id,dish_name
		FROM {{dishes}}
		WHERE
		status IN ('publish')
		ORDER BY dish_id ASC
		";
		if($res = $db->rst($stmt)){
			foreach ($res as $val) {
				$data[]=array(
				  'dish_id'=>$val['dish_id'],
				  'dish_name'=>$val['dish_name'],
				);
			}
		}
		return $data;
	}
	
	public static function getItemCountByCategory($category_id='')
	{
		$db = new DbExt();
		$stmt="
		SELECT COUNT(*) AS total
		FROM {{item}}
		WHERE category like ".FunctionsV3::q('%"'.$category_id.'"%')."
		";
		if($res = $db->rst($stmt)){
			return $res[0]['total'];
		}
		return 0;
	}
	
	public static function limitText($p='',$text='', $limit = 100)
	{
		return $text;
		/*if(strlen($text)>=100){
			$text = $p->purify( strip_tags($text) );
			$text = substr($text,0,100)."...";
		}
		return $text;*/
	}
		
}
/*end class*/