<?php
class mobileWrapper
{
	
	public static function t($words='', $params=array())
	{
		return Yii::t("mobile2",$words,$params);
	}
	
	public static function uploadPath()
	{
		return Yii::getPathOfAlias('webroot')."/upload/";
	}
	
	public static function platFormList()
    {
    	return array(
	    	1=>mt("android"),
	        2=>mt("ios"),
	        3=>mt('all platform')
    	);
    }
    
    public static function parseValidatorError($error='')
	{
		$error_string='';
		if (is_array($error) && count($error)>=1){
			foreach ($error as $val) {
				$error_string.="$val\n";
			}
		}
		return $error_string;		
	}		
	
	public static function generateUniqueToken($length,$unique_text=''){	
		$key = '';
	    $keys = array_merge(range(0, 9), range('a', 'z'));	
	    for ($i = 0; $i < $length; $i++) {
	        $key .= $keys[array_rand($keys)];
	    }	
	    return $key.md5($unique_text);
	}	
	
	public static function getImage($image='', $image_set='', $disabled_default_image=false,$addon_path='')
	{		
		$url='';
		$default="mobile-default-logo.png";
		$path_to_upload=Yii::getPathOfAlias('webroot')."/upload/$addon_path";						
		
		if (empty($image)){
			$image=Yii::app()->functions->getOptionAdmin('mobile_default_image_not_available');
		}					
		
		$default_image = Yii::app()->getBaseUrl(true)."/protected/modules/".APP_FOLDER."/assets/images/$default";	
		if(!empty($image_set)){
			$default_image = Yii::app()->getBaseUrl(true)."/protected/modules/".APP_FOLDER."/assets/images/$image_set";	
		}
		
		if (!empty($image)){			
			if (file_exists($path_to_upload."/$image")){							
				$default=$image;							
				if(empty($addon_path)){
				  $url = Yii::app()->getBaseUrl(true)."/upload/$default";
				} else {
				   $url = Yii::app()->getBaseUrl(true)."/upload/$addon_path/$default";	
				}
			} else $url=$default_image;
		} else {			
			if($disabled_default_image){
				$url='';
			} else $url=$default_image;			
		}
		return $url;
	}
	
	
	public static function getTitlePages()
	{
		$db = new DbExt();
		
		$titles = "page_id,title,icon";
		if(Yii::app()->functions->multipleField()){
			$list = DBTableWrapper::getLangList();
			if(is_array($list) && count((array)$list)>=1){
				foreach ($list as $val) {
					$titles.=",title_$val";
				}
			}
		}
		
		$stmt="
		SELECT $titles FROM {{mobile2_pages}}
		WHERE status = 'publish'
		";			
		if($res = $db->rst($stmt)){			
			return $res;
		}
		return false;
	}
	
	public static function getPageByTitle($title="")
	{
		if(empty($title)){
			return false;
		}
		
		$db = new DbExt();
		$stmt="
		SELECT * FROM
		{{mobile2_pages}}
		WHERE
		title=".FunctionsV3::q($title)."
		LIMIT 0,1
		";
		if($res=$db->rst($stmt)){
			return $res[0];
		}
		return false;
	}
	
	public static function getPageByID($page_id="")
	{
		if(empty($page_id)){
			return false;
		}
		
		$db = new DbExt();
		$stmt="
		SELECT * FROM
		{{mobile2_pages}}
		WHERE
		page_id=".FunctionsV3::q($page_id)."
		LIMIT 0,1
		";
		if($res=$db->rst($stmt)){
			return $res[0];
		}
		return false;
	}	
	
	public static function getMaxPage()
	{
		$db = new DbExt();
		$stmt="
		SELECT max(sequence) as max	 FROM
		{{mobile2_pages}}		
		";
		if($res=$db->rst($stmt)){				
			if($res[0]['max']>=1){
			   return $res[0]['max']+1;
			} else return 1;
		}
		return false;
	}
	
	public static function deletePage($page_id='')
	{
		$db = new DbExt();
		if($page_id>=1){	
			$stmt="DELETE FROM
			{{mobile2_pages}}
			WHERE
			page_id=".FunctionsV3::q($page_id)."
			";	
			$db->qry($stmt);
			return true;
		}
		return false;
	}
	
	public static function prettyBadge($status='')
	{
		$status=strtolower(trim($status));
		if($status=="pending"){
		   return '<span class="badge badge-primary">'.mt($status).'</span>';
		} elseif ( $status=="process" ){
			return '<span class="badge badge-success">'.mt($status).'</span>';
		} elseif ( preg_match("/properly set in/i", $status)){
			return '<span class="badge badge-danger">'.mt($status).'</span>';
		} elseif ( preg_match("/caught/i", $status)){
			return '<span class="badge badge-danger">'.mt($status).'</span>';	
		} else {			
		   return '<span class="badge badge-success">'.mt($status).'</span>';
		}
	}
	
	
	public static function getDeviceByID($id='')
	{
		if(empty($id)){
			return false;
		}
		
		$db = new DbExt();
		$stmt="
		SELECT * FROM
		{{mobile2_device_reg_view}}
		WHERE
		id=".FunctionsV3::q($id)."
		LIMIT 0,1
		";
		if($res=$db->rst($stmt)){
			return $res[0];
		}
		return false;
	}
	
	public static function getDeviceByUIID($device_uiid='')
	{
		if(empty($device_uiid)){
			return false;
		}
		
		$db = new DbExt();
		$stmt="
		SELECT * FROM
		{{mobile2_device_reg}}
		WHERE
		device_uiid=".FunctionsV3::q($device_uiid)."
		LIMIT 0,1
		";		
		if($res=$db->rst($stmt)){
			return $res[0];
		}
		return false;
	}
	
	public static function getAllDeviceByClientID($client_id='', $trigger_id='')
	{
		if(empty($client_id)){
			return false;
		}
		if(empty($trigger_id)){
			return false;
		}
		
		/*AND a.client_id NOT IN (
		  select client_id
		  from {{mobile2_push_logs}}
		  where client_id = a.client_id
		  and device_uiid = a.device_uiid
		  and trigger_id = ".FunctionsV3::q($trigger_id)."
		)	*/	
		
		$db = new DbExt();
		$stmt="
		SELECT 
		a.device_uiid,
		a.device_id,
		a.device_platform			
	    FROM
		{{mobile2_device_reg}} a
		WHERE	
		a.client_id =".FunctionsV3::q($client_id)."		
		AND a.push_enabled='1'		
		AND a.status = 'active'
		
		AND a.client_id NOT IN (
		  select client_id
		  from {{mobile2_push_logs}}
		  where client_id = a.client_id
		  and device_uiid = a.device_uiid
		  and trigger_id = ".FunctionsV3::q($trigger_id)."
		)
		
		";		
		if($res=$db->rst($stmt)){
			return $res;
		}
		return false;
	}
	
	public static function getCustomerByToken($token='', $check_active=true)
    {
    	if(empty($token)){
    		return false;
    	}
    	
    	$and='';
    	if($check_active){
    		$and=" AND status='active' ";
    	}
    	
    	$DbExt=new DbExt;
    	$stmt="SELECT * FROM
    	{{client}}
    	WHERE
    	token=".FunctionsV3::q($token)."
    	$and
    	LIMIT 0,1
    	";
    	if($res=$DbExt->rst($stmt)){    		
    		return $res[0];
    	}
    	return false;
    }    	
            
    public static function loginByEmail($email='', $password='')
    {
    	if(!empty($email) && !empty($password)){
	    	$db = new  DbExt();
	    	$stmt="SELECT * FROM
		    {{client}}
		    WHERE
	    	email_address=".FunctionsV3::q($email)."
	    	AND
	    	password=".FunctionsV3::q(md5($password))."	    		    	
	    	LIMIT 0,1
		    ";		    	
		    if($res = $db->rst($stmt)){
		    	$res = $res[0];
		    	if(empty($res['token'])){
		    		$token = mobileWrapper::generateUniqueToken(15,$res['client_id']);
	    	        $db->updateData("{{client}}",array(
	    	          'token'=>$token,
	    	          'social_strategy'=>"mobileapp2",
	    	          'last_login'=>FunctionsV3::dateNow()
	    	        ),'client_id',$res['client_id']);
		    	}
		    	return $res;
		    }
    	}
	    return false;
    }
    
    public static function loginByMobile($contact_phone='', $password='')
    {
    	if(!empty($contact_phone) && !empty($password)){
    		$contact_phone = str_replace("+","",$contact_phone);
	    	$db = new  DbExt();
	    	$stmt="SELECT * FROM
		    {{client}}
		    WHERE
	    	contact_phone LIKE ".FunctionsV3::q("%$contact_phone")."
	    	AND
	    	password=".FunctionsV3::q(md5($password))."	    		    
	    	LIMIT 0,1
		    ";
		    if($res = $db->rst($stmt)){
		    	$res = $res[0];
		    	if(empty($res['token'])){
		    		$token = mobileWrapper::generateUniqueToken(15,$res['client_id']);
	    	        $db->updateData("{{client}}",array(
	    	          'token'=>$token,
	    	          'social_strategy'=>"mobileapp2",
	    	          'last_login'=>FunctionsV3::dateNow()
	    	        ),'client_id',$res['client_id']);
		    	}
		    	return $res;
		    }
    	}
	    return false;
    }
    
    public static function getAccountByEmail($email_address='')
    {
    	if(!empty($email_address)){
    		$db = new  DbExt();
	    	$stmt="SELECT * FROM
		    {{client}}
		    WHERE
	    	email_address=".FunctionsV3::q($email_address)."	    	
	    	LIMIT 0,1
		    ";
	    	if($res = $db->rst($stmt)){
	    	   $res = $res[0];
	    	   return $res;
	    	}
    	}
    	return false;
    }
    
    public static function getAccountByPhone($contact_phone='')
    {
    	if(!empty($contact_phone)){
    		$db = new  DbExt();
	    	$stmt="SELECT * FROM
		    {{client}}
		    WHERE
	    	contact_phone LIKE ".FunctionsV3::q("%$contact_phone")."	    	
	    	LIMIT 0,1
		    ";
	    	if($res = $db->rst($stmt)){
	    	   $res = $res[0];
	    	   return $res;
	    	}
    	}
    	return false;
    }
    
    public static function merchantStatus($merchant_id='')
    {
    	$is_merchant_open = Yii::app()->functions->isMerchantOpen($merchant_id); 
	    $merchant_preorder= Yii::app()->functions->getOption("merchant_preorder",$merchant_id);
	    
	    $now=date('Y-m-d');
		$is_holiday=false;
	        if ( $m_holiday=Yii::app()->functions->getMerchantHoliday($merchant_id)){  
      	   if (in_array($now,(array)$m_holiday)){
      	   	  $is_merchant_open=false;
      	   }
        }
        
        if ( $is_merchant_open==true){
        	if ( getOption($merchant_id,'merchant_close_store')=="yes"){
        		$is_merchant_open=false;	
        		$merchant_preorder=false;			        		
        	}
        }
        
        if ($is_merchant_open){
        	$tag = "open";
        } else {
        	if ($merchant_preorder){        		
        		$tag = "pre-order";
        	} else {        	
        		$tag = "close";
        	}
        }      
        return $tag;  
    }
    
    public static function getMerchantBackground($merchant_id='',$set_image='')
    {    	
    	$image_url = websiteUrl()."/protected/modules/".APP_FOLDER."/assets/images/default_bg.jpg";
        $merchant_photo_bg = getOption($merchant_id,'merchant_photo_bg');        
    	if(!empty($merchant_photo_bg)){    		    		
	    	if ( file_exists(FunctionsV3::uploadPath()."/$merchant_photo_bg")){
	    		$image_url = websiteUrl()."/upload/$merchant_photo_bg";
	    	}
    	} else {
    		if(!empty($set_image)){
    			$image_url = websiteUrl()."/protected/modules/".APP_FOLDER."/assets/images/$set_image";
    		}
    	}    	
    	return FunctionsV3::prettyUrl($image_url);
    }
    

    public static function getOffersByMerchantNew($merchant_id='')
    {
    	$DbExt=new DbExt; 
    	$offer_list = array(); 
    	$offer = '';
    	
	    $stmt="SELECT * FROM
			{{offers}}
			WHERE
			status in ('publish','published')
			AND
			now() >= valid_from and now() <= valid_to
			AND merchant_id =".FunctionsV3::q($merchant_id)."
			ORDER BY valid_from ASC
		";	    
		if ( $res=$DbExt->rst($stmt)){
			foreach ($res as $val) {
				$applicable_to_list = '';
				if(isset($val['applicable_to'])){
    			   $applicable_to=json_decode($val['applicable_to'],true);	
    			   if(is_array($applicable_to) && count($applicable_to)>=1){
    			   	  foreach ($applicable_to as $applicable_to_val) {    			   	  	 
    			   	  	 $applicable_to_list.=t($applicable_to_val).",";
    			   	  }
    			   	  $applicable_to_list = substr($applicable_to_list,0,-1);
    			   }    			
    			}    		 
    			
    			$percentage=number_format($val['offer_percentage'],0);
    			
    			if (!empty($applicable_to_list)){    				
	    			$offer = self::t("[percent]% Off over [amount] if [transaction]",array(
	    			  '[percent]'=>$percentage,
	    			  '[amount]'=>FunctionsV3::prettyPrice($val['offer_price']),
	    			  '[transaction]'=>$applicable_to_list
	    			));
    			} else {	    			
	    			$offer = self::t("[percent]% Off over [amount]",array(
	    			  '[percent]'=>$percentage,
	    			  '[amount]'=>FunctionsV3::prettyPrice($val['offer_price']),
	    			));
    			}
    			$offer_list[] =array(
    			   'raw'=>number_format($val['offer_percentage'],0)."%".self::t("OFF"),
    			   'full'=>$offer
    			);
			}
			return $offer_list;
		}
		return false;
    }   
    
    public static function getTotalCuisine($cuisine_id='',$search_radius ='', $unit='', 
      $show_only_location='', $lat=0, $lng=0, $data=array() )
	{
		$query_distance='';	$and='';
		if($show_only_location==1){
			
			$distance_exp=3959;
		    if ($unit=="km"){
			    $distance_exp=6371;
		    }				
			$query_distance="
			( $distance_exp * acos( cos( radians($lat) ) * cos( radians( latitude ) ) 
					* cos( radians( lontitude ) - radians($lng) ) 
					+ sin( radians($lat) ) * sin( radians( latitude ) ) ) ) 
					AS distance		
					
			";
		}					
		$db = new DbExt();
		$stmt="
		SELECT count(*) AS total
		FROM
		{{merchant}}
		WHERE
		cuisine LIKE ".FunctionsV3::q('%"'.$cuisine_id.'"%')."
		AND status='active'
		AND is_ready ='2'
		";			
		
		if($show_only_location==1){
			$location_resp = mobileWrapper::searchMode();
			if($location_resp['search_mode']=="location"){
								
				switch ($location_resp['location_mode']) {
					case 1:						
					    $and.=" 
						    AND a.merchant_id IN (
							select merchant_id 
							from
							{{location_rate}}
							where
							city_id=".FunctionsV3::q($data['city_id'])."
							and
							area_id=".FunctionsV3::q($data['area_id'])."						
						   ) 
					    ";
						break;
						
					case 2:
						$and.=" 
						    AND a.merchant_id IN (
							select merchant_id 
							from
							{{location_rate}}
							where
							state_id=".FunctionsV3::q($data['state_id'])."
							and
							city_id=".FunctionsV3::q($data['city_id'])."
						   ) 
					    ";
						break;	
						
					case 3:
						$and.=" 
						    AND a.merchant_id IN (
							select merchant_id 
							from
							{{view_location_rate}}
							where
							city_id=".FunctionsV3::q($data['city_id'])."
							and
							postal_code=".FunctionsV3::q($data['postal_code'])."
						   ) 
					    ";
						break;	
				
					default:
						break;
				}
				
				
				$stmt="
				SELECT SQL_CALC_FOUND_ROWS
				a.cuisine,
				a.status,
				a.is_ready
				FROM {{merchant}} a
				WHERE 1
				$and
				AND a.cuisine LIKE ".FunctionsV3::q('%"'.$cuisine_id.'"%')."
			    AND a.status='active'
			    AND a.is_ready ='2'
				";
			} else {
				$stmt="
				SELECT SQL_CALC_FOUND_ROWS
				a.cuisine,
				a.status,
				a.is_ready,
				$query_distance
	 		    FROM
			    {{merchant}} a
			    HAVING distance < $search_radius
				AND a.cuisine LIKE ".FunctionsV3::q('%"'.$cuisine_id.'"%')."
			    AND a.status='active'
			    AND a.is_ready ='2'
				";
			}
		}
					
		if(isset($_GET['debug'])){
		   dump("<b>SQL count cuisine</b>");
		   dump($stmt);
		}
		if($res = $db->rst($stmt)){
			if($show_only_location==1){
				$total_records=0;
				$stmtc="SELECT FOUND_ROWS() as total_records";
		 		if ($resp=$db->rst($stmtc)){			 			
		 			$total_records=$resp[0]['total_records'];
		 		}		
		 		return $total_records;
			}
			return $res[0]['total'];
		}
		return 0;
	}	
	
	public static function unitPretty($unit='')
	{
		$unit_pretty = $unit;
		switch ($unit) {
			case "mi":
			case "M":
				$unit_pretty = mt("miles");
				break;
		
			case "km":
			case "K":
				$unit_pretty = mt("kilometers");
				break;
								
		}
		return $unit_pretty;
	}
	
	
	public static function getListType()
	{
		$list_type = getOptionA('mobileapp2_merchant_list_type');
		if(empty($list_type)){
			return 1;
		}
		if(!is_numeric($list_type)){
			return 1;
		}
		return $list_type;
	}	
		
    public static function getMenuType()
    {
    	$list_type = getOptionA('mobileapp2_merchant_menu_type');
    	if(empty($list_type)){
			return 2;
		}
		if(!is_numeric($list_type)){
			return 2;
		}
		return $list_type;
    }
	
    public static function paginateLimit()
    {
    	return 10;
    }	
    
    public static function getDistanceResultsType()
    {
    	$distance_results_type = getOptionA('mobileapp2_distance_results');
    	if(empty($distance_results_type)){
    		return 1;
    	}
    	if(!is_numeric($distance_results_type)){
    		return 1;
    	}
    	return $distance_results_type;
    }
    
    public static function locationAccuracyList()
    {
    	return array(
    	  //'REQUEST_PRIORITY_NO_POWER'=>self::t("REQUEST_PRIORITY_NO_POWER"),
    	  'REQUEST_PRIORITY_LOW_POWER'=>self::t("REQUEST_PRIORITY_LOW_POWER"),
    	  'REQUEST_PRIORITY_BALANCED_POWER_ACCURACY'=>self::t("REQUEST_PRIORITY_BALANCED_POWER_ACCURACY"),
    	  'REQUEST_PRIORITY_HIGH_ACCURACY'=>self::t("REQUEST_PRIORITY_HIGH_ACCURACY"),
    	);
    }
    
    public static function RestaurantListType()
    {
    	return array(
    	  1=>self::t("List 1 - logo on left content right"),
    	  2=>self::t("List 2 - logo on top content bottom"),    	  
    	  3=>self::t("List 3 - column"), 
    	);
    }
    
    public static function MenuType()
    {
    	return array(
    	  1=>self::t("Menu 1 - Show all menu in one page"),
    	  2=>self::t("Menu 2 - Classic menu"), 
    	  3=>self::t("Menu 3 - column"),    	  
    	);
    }
	
/*	public static function prettySort($sort_by = '')
	{
		$text = '';
		switch ($sort_by) {
			case "restaurant_name":				
			    $text = self::t("Restaurant name");
				break;
				
			case "ratings":				
			    $text = self::t("Ratings");
				break;	
				
		   case "minimum_order":				
		       $text = self::t("Minimum order");
				break;	
				
		   case "distance":
				$text = self::t("Distance");
				break;
		   case "sequence":
				$text = self::t("sequence");
				break;		
		   case "cuisine_name":
				$text = self::t("Cuisine name");
				break;			
				
		}
		return $text;
	}*/
	
	public static function servicesList()
	{
		return array(
		  'delivery'=>self::t("Delivery"),
		  'pickup'=>self::t("Pickup"),
		  'dinein'=>self::t("Dinein"),
		);
	}		
	
	public static function highlight_word( $content, $word ) {
	    $replace = '<span class="highlight">' . $word . '</span>'; // create replacement
	    $content = str_ireplace( $word, $replace, $content ); // replace content	
	    return $content; // return highlighted data
    }
    
    public static function sortRestaurantList()
    {
    	return array(
    	  'restaurant_name'=>self::t("Restaurant name"),
    	  'ratings'=>self::t("Rating"),
    	  'review_count'=>self::t("Most Reviewed"),
    	  'minimum_order'=>self::t("Minimum order"),
    	  'distance'=>self::t("Distance"),
    	);
    }
    
    public static function validateSortRestoList($key='')
    {
    	$list = self::sortRestaurantList();
    	if(array_key_exists($key,$list)){
    		return array(
    		   'key'=>$key,
    		   'name'=>$list[$key]
    		);
    	} else {
    		return array(
    		  'key'=>'distance',
    		   'name'=>self::t("Distance")
    		);
    	}    	
    }
    
    public static function sortCuisineList()
    {
    	return array(
    	  'cuisine_name'=>self::t("Cuisine name"),
    	  'sequence'=>self::t("Sequence"), 
    	);
    }
    
    public static function prettySortCuisine($key='')
    {    	
    	$list = self::sortCuisineList();
    	if(array_key_exists($key,$list)){
    		return array(
    		   'key'=>$key,
    		   'name'=>$list[$key]
    		);
    	} else {
    		return array(
    		  'key'=>'cuisine_name',
    		   'name'=>self::t("Cuisine name")
    		);
    	}    	
    }
    
    public static function validateSort($sortby='')
    {    	
		$sort_list_valid = array('asc','desc','ASC','DESC');
		if(!in_array($sortby,$sort_list_valid)){
			$sortby="ASC";
		}
		return $sortby;
    }
    
    public static function getMerchantGallery($merchant_id='')
    {    	
    	$data=array();
    	if($merchant_id>0){
	    	$gallery=Yii::app()->functions->getOption("merchant_gallery",$merchant_id);
	        $gallery=!empty($gallery)?json_decode($gallery):false;					
	        if(is_array($gallery) && count($gallery)>=1){
	        	foreach ($gallery as $val) {
	        		if ( file_exists(FunctionsV3::uploadPath()."/$val")){	        			
	        			$data[]=websiteUrl()."/upload/$val";
	        		}
	        	}
	        	if(is_array($data) && count($data)>=1){
	        	   return $data;
	        	}
	        }
    	}
        return 2;
    }
    
    public static function getMerchantBanner($merchant_id='')
    {    	
    	$data=array();
    	if($merchant_id>0){
	    	$gallery=Yii::app()->functions->getOption("merchant_banner",$merchant_id);
	        $gallery=!empty($gallery)?json_decode($gallery):false;					
	        if(is_array($gallery) && count($gallery)>=1){
	        	foreach ($gallery as $val) {
	        		if ( file_exists(FunctionsV3::uploadPath()."/$val")){	        			
	        			$data[]=websiteUrl()."/upload/$val";
	        		}
	        	}
	        	if(is_array($data) && count($data)>=1){
	        	   return $data;
	        	}
	        }
    	}
        return 2;
    }
    
    public static function getRestoTabMenu($merchant_id='', $ratings='')
    {    	
    	$tab_menu = array();
    	$tab_menu['menu']=array(
    	  'page_name'=>"",
    	  'label'=>self::t("Menu")
    	);    	
    	$tab_menu['about']=array(
    	  'page_name'=>"about.html",
    	  'label'=>self::t("About")
    	);
    	
    	if(isset($ratings['votes'])){
	    	$tab_menu['reviews']=array(
	    	  'page_name'=>"reviews.html",
	    	  'label'=>self::t("Reviews ([total])",array(
	    	    '[total]'=>$ratings['votes']
	    	  ))
	    	);
    	} else {
    		$tab_menu['reviews']=array(
	    	  'page_name'=>"reviews.html",
	    	  'label'=>self::t("Reviews")
	    	);
    	}
    	$tab_menu['location']=array(
    	  'page_name'=>"location.html",
    	  'label'=>self::t("Location")
    	);
    	$tab_menu['book_table']=array(
    	  'page_name'=>"book_table.html",
    	  'label'=>self::t("Book Table")
    	);
    	$tab_menu['photo_gallery']=array(
    	  'page_name'=>"photo_gallery.html",
    	  'label'=>self::t("Gallery")
    	);
    	$tab_menu['information']=array(
    	  'page_name'=>"information.html",
    	  'label'=>self::t("Information")
    	);
    	$tab_menu['promos']=array(
    	  'page_name'=>"promos.html",
    	  'label'=>self::t("Promos")
    	);

    	/*REMOVE MENU*/   	
    	    	
    	$merchant_tbl_book_disabled = getOptionA('merchant_tbl_book_disabled');
    	if($merchant_tbl_book_disabled=="2"){
    		unset($tab_menu['book_table']);
    	} else {    	
	    	$merchant_table_booking = getOption($merchant_id,'merchant_table_booking');
	    	if($merchant_table_booking=="yes"){
	    		unset($tab_menu['book_table']);
	    	}
    	}
    	    	
    	$theme_photos_tab = getOptionA('theme_photos_tab');
    	if($theme_photos_tab==2){
    		unset($tab_menu['photo_gallery']);
    	} else {
	    	$gallery_disabled = getOption($merchant_id,'gallery_disabled');
	    	if($gallery_disabled=="yes"){
	    		unset($tab_menu['photo_gallery']);
	    	}
    	}
    	
    	$theme_hours_tab = getOptionA('theme_hours_tab');
    	if($theme_hours_tab==2){
    		unset($tab_menu['about']);
    	}
    	
    	$theme_reviews_tab = getOptionA('theme_reviews_tab');
    	if($theme_reviews_tab==2){
    		unset($tab_menu['reviews']);
    	}
    	    	
    	$theme_map_tab = getOptionA('theme_map_tab');
    	if($theme_map_tab==2){
    		unset($tab_menu['location']);
    	}
    	
    	$theme_info_tab = getOptionA('theme_info_tab');
    	if($theme_info_tab==2){
    		unset($tab_menu['information']);
    	}
    	
    	$theme_promo_tab = getOptionA('theme_promo_tab');
    	if($theme_promo_tab==2){
    		unset($tab_menu['promos']);
    	}
    	
    	
    	
    	return $tab_menu;
    }
            
    public static function getCart($device_uiid='')
    {
    	if(empty($device_uiid)){
    		return false;
    	}
    	
    	$DbExt=new DbExt;
    	$stmt="SELECT * FROM
    	{{mobile2_cart}}
    	WHERE
    	device_uiid=".FunctionsV3::q($device_uiid)."
    	LIMIT 0,1
    	";    	
    	if($res=$DbExt->rst($stmt)){
    		return $res[0];
    	}
    	return false;
    }    
    
    public static function clearCart($device_uiid='')
    {    	
    	if(empty($device_uiid)){
    		return false;
    	}
    	
    	$db=new DbExt;
    	$db->qry("DELETE FROM
    	{{mobile2_cart}}
    	WHERE
    	device_uiid=".FunctionsV3::q($device_uiid)."
    	");
    }
    
     public static function getAddressBookByClient($client_id='')
    {
    	if(empty($client_id)){
    		return false;
    	}
    	
    	$db_ext=new DbExt;    	
    	$stmt="SELECT      	       
    	       concat(street,' ',city,' ',state,' ',zipcode) as address,
    	       id,location_name,country_code,as_default
    	       FROM
    	       {{address_book}}
    	       WHERE
    	       client_id =".FunctionsV3::q($client_id)."
    	       AND street <> ''    	      
    	       ORDER BY street ASC    	       
    	";    	    	
    	if ($res=$db_ext->rst($stmt)){    		
    		return $res;
    	}
    	return false;
    } 	       
    
	public static function getCartEarningPoints($cart=array(), $sub_total=0 , $mtid='')
	{
		/*CHECK IF ADMIN ENABLED THE POINTS SYSTEM*/
		$points_enabled=getOptionA('points_enabled');
		if ($points_enabled!=1){
			return false;
		}
		
		/*CHECK IF MERCHANT HAS DISABLED POINTS SYSTEM*/
		if(isset($cart[0])){
			if(isset($cart[0]['merchant_id'])){				
				$mt_disabled_pts=getOption($mtid,'mt_disabled_pts');
				if($mt_disabled_pts==2){
					return false;
				}
			}		
		}
		
		$points=0;

		if (is_array($cart) && count($cart)>=1){
			$earning_type =  PointsProgram::getBasedEarnings($mtid);
			
			if($earning_type==1){
				foreach ($cart as $val) {
					$temp_price=explode("|",$val['price']);														
					if($val['discount']>=0.01){
						$set_price = ($temp_price[0]-$val['discount'])*$val['qty'];
					} else $set_price = (float)$temp_price[0]*$val['qty'];				
									
					$points+= PointsProgram::getPointsByItem($val['item_id'],$set_price , $mtid);
				}
			} else {								
				$points+=PointsProgram::getTotalEarningPoints($sub_total,$mtid);				
			}
			
			/*CHECK IF SUBTOTAL ORDER IS ABOVE */
			$pts_earn_above_amount=getOptionA('pts_earn_above_amount');
			
			if(!PointsProgram::isMerchantSettingsDisabled()){
				$mt_pts_earn_above_amount=getOption($mtid,'mt_pts_earn_above_amount');
				if($mt_pts_earn_above_amount>0){
					$pts_earn_above_amount = $mt_pts_earn_above_amount;
				}
			}
			
			if(is_numeric($pts_earn_above_amount)){
				if($pts_earn_above_amount>$sub_total){
					$points=0;
				}
			}
						
			if ($points>0){
				$pts_label_earn=getOptionA('pts_label_earn');
				if(empty($pts_label_earn)){
					$pts_label_earn = "This order earned {points}";
				}  				
				return array(
				  'points_earn'=>$points,
				  'pts_label_earn'=>Yii::t("mobile2",$pts_label_earn,array(
				    '{points}'=>$points
				  ))
				);
			}
		}
		return false;
	}	    
	
	public static function pointsTotalExpenses($client_id='')
	{
		$db = new DbExt();
		$stmt="
		SELECT SUM(total_points) as total
		FROM {{points_expenses}}
		WHERE
		status ='active'
		AND
		client_id=".FunctionsV3::q($client_id)."
		";
		if($res=$db->rst($stmt)){
			return $res[0]['total'];
		}
		return 0;
	}
	
	public static function getTotalEarnPoints($client_id='', $merchant_id='')
	{
		$and=" AND (merchant_id=".FunctionsV3::q($merchant_id)." OR trans_type='adjustment' ) ";		
		
		$db=new DbExt();
		$stmt="
		SELECT SUM(total_points_earn) as total_earn,
		(
		  select sum(total_points)
		  from {{points_expenses}}
		  WHERE
		  status ='active'
		  AND
		  client_id=".FunctionsV3::q($client_id)." 
		  $and
		) as  total_points_expenses
		
		FROM
		{{points_earn}}
		WHERE
		status ='active'
		AND
		client_id=".FunctionsV3::q($client_id)."
		$and
		";		
		if ($res=$db->rst($stmt)){
			$res=$res[0];
			return $res['total_earn']-$res['total_points_expenses'];
		}
		return 0;
	}
	
	public static function pointsEarnByMerchant($client_id='')
	{
		
		$stmt="
		SELECT sum(a.total_points_earn) as total_earn,
		(
		  select sum(total_points)
		  from {{points_expenses}}
		  where client_id=".FunctionsV3::q($client_id)."
		  AND a.status IN ('active','adjustment')
		) as total_expenses
		FROM {{points_earn}} a
		WHERE client_id=".FunctionsV3::q($client_id)."
		AND a.status IN ('active','adjustment')
		AND merchant_id>0
		group by merchant_id
		";
		
		$db=new DbExt();
		if($res = $db->rst($stmt)){
			$total_earn=0; $total_expenses=0;
			foreach ($res as $val) {
				$total_earn+=$val['total_earn'];
				$total_expenses+=$val['total_expenses'];
			}
			$total = $total_earn-$total_expenses;
			return $total;
		}
		return 0;
	}

	public static function tipList()
	{		
		return array(
		       ''=> mt("none"),
	    	   '0.1'=>mt("10%"),
	    	   '0.15'=>mt("15%"),
	    	   '0.2'=>mt("20%"),
	    	   '0.25'=>mt("25%")    	   
	    	);	
	}		
	
    public static function checkDeliveryAddress($merchant_id='',$data='')
	{
		if($merchant_info=FunctionsV3::getMerchantById($merchant_id)){
		   $distance_type=FunctionsV3::getMerchantDistanceType($merchant_id); 
		   
		   $complete_address=$data['street']." ".$data['city']." ".$data['state']." ".$data['zipcode'];
    	   if(isset($data['country'])){
    			$complete_address.=" ".$data['country'];
    	   } 
    	   
    	   $lat=0; $lng=0;
    	   
    	   if ( isset($data['address_book_id'])){
    		  if ($address_book=Yii::app()->functions->getAddressBookByID($data['address_book_id'])){
        		$complete_address=$address_book['street'];	    	
    	        $complete_address.=" ".$address_book['city'];
    	        $complete_address.=" ".$address_book['state'];
    	        $complete_address.=" ".$address_book['zipcode'];
        	  }
    	   }
    	   
    	   //dump($complete_address);
    	   
    	   if (isset($data['map_address_toogle'])){    			
    			if ($data['map_address_toogle']==2){
    				$lat=$data['map_address_lat'];
    				$lng=$data['map_address_lng'];
    			} else {
    				if ($lat_res=Yii::app()->functions->geodecodeAddress($complete_address)){
			           $lat=$lat_res['lat'];
					   $lng=$lat_res['long'];
		    	    }
    			}
    		} else {    			
    			if ($lat_res=Yii::app()->functions->geodecodeAddress($complete_address)){
		           $lat=$lat_res['lat'];
				   $lng=$lat_res['long'];
	    	    }
    		}
    		
    		$distance=FunctionsV3::getDistanceBetweenPlot(
				$lat,
				$lng,
				$merchant_info['latitude'],$merchant_info['lontitude'],$distance_type
			);  
			
			$distance_type_raw = $distance_type=="M"?"miles":"kilometers";		
			$merchant_delivery_distance=getOption($merchant_id,'merchant_delivery_miles'); 
			
			if(!empty(FunctionsV3::$distance_type_result)){
             	$distance_type_raw=FunctionsV3::$distance_type_result;
            }
                        
            //dump($distance);dump($distance_type_raw);
            
            if (is_numeric($merchant_delivery_distance)){
            	if ( $distance>$merchant_delivery_distance){
            		if($distance_type_raw=="ft" || $distance_type_raw=="meter" || $distance_type_raw=="mt"){
					   return true;
					} else {
						$error = Yii::t("mobile2",'Sorry but this merchant delivers only with in [distance]',array(
			    		  '[distance]'=>$merchant_delivery_distance." ".t($distance_type_raw)
			    		));
						throw new Exception( $error );
					}		            
            	} else {            		
	    			$delivery_fee=FunctionsV3::getMerchantDeliveryFee(
					              $merchant_id,
					              $merchant_info['delivery_charges'],
					              $distance,
					              $distance_type_raw);
					if($delivery_fee){
						return array(
						  'delivery_fee'=>$delivery_fee,
						  'distance'=>$distance,
						  'distance_unit'=>$distance_type_raw
						);
					}
					return true;
            	}
            } else {
            	// OK DO NOT CHECK DISTAMCE             	
            	$delivery_fee=FunctionsV3::getMerchantDeliveryFee(
				              $merchant_id,
				              $merchant_info['delivery_charges'],
				              $distance,
				              $distance_type_raw);
				if($delivery_fee){
					return array(
					  'delivery_fee'=>$delivery_fee,
					  'distance'=>$distance,
					  'distance_unit'=>$distance_type_raw
					);
				}
            	return true;
            }		   
		} else {
			 throw new Exception( self::t("Merchant not found") );
		}
	}	
	
    public static function updatePoints($order_id='', $order_status='')
	{
		if (FunctionsV3::hasModuleAddon('pointsprogram')){
			if (method_exists("PointsProgram","updateOrderBasedOnStatus")){
				PointsProgram::updateOrderBasedOnStatus($order_status,$order_id);
			}
		}
	}	
	
    public static function getBookAddress($client_id='',$street='', $city='', $state='' )
	{
		if(empty($street)){
			return false;
		}
		if(empty($city)){
			return false;
		}
		if(empty($state)){
			return false;
		}
		
		$db=new DbExt;
		$stmt="SELECT * FROM
		{{address_book}}
		WHERE
		client_id=".FunctionsV3::q($client_id)."
		AND
		street=".FunctionsV3::q($street)."
		AND
		city = ".FunctionsV3::q($city)."
		AND
		state = ".FunctionsV3::q($state)."
		LIMIT 0,1
		";		
		if ($res = $db->rst($stmt)){
			return $res;
		}
		return false;
	}	
	
    public static function savePoints($device_uiid='',$client_id='',$merchant_id='', $order_id='',$order_status='')
    {
    	/*POINTS ADDON*/
		if (FunctionsV3::hasModuleAddon("pointsprogram")){			
			if($res=self::getCart($device_uiid)){
				$points_earn = $res['points_earn'];
				PointsProgram::saveEarnPoints($points_earn,$client_id,$merchant_id,$order_id,'',$order_status);				
				
				if ($res['points_apply']>=0.0001){
					PointsProgram::saveExpensesPoints(
					  $res['points_apply'],
					  $res['points_amount'],
					  $client_id,
					  $merchant_id,
					  $order_id,
					  ''
					);
				}
			}
		}
    }   	
    
    public static function checkDeliveryAddresNew( $merchant_id='', $lat='', $lng='' )
    {
    	if(!is_numeric($merchant_id)){
    		throw new Exception( self::t("invalid merchant id") );
    	}
    	if(!is_numeric($lat)){
    		throw new Exception( self::t("invalid latitude") );
    	}
    	if(!is_numeric($lng)){
    		throw new Exception( self::t("invalid longtitude") );
    	}
    	
    	$distance=0;
    	$distance_results_type = mobileWrapper::getDistanceResultsType();	
    	
    	if($merchant_info=FunctionsV3::getMerchantById($merchant_id)){
    	   $distance_type=FunctionsV3::getMerchantDistanceType($merchant_id); 
    	   $merchant_lat = $merchant_info['latitude'];
    	   $merchant_lng = $merchant_info['lontitude'];
    	       	       	   
    	   if($distance_results_type==1){
    	   	  $distance = self::getLocalDistance($distance_type,$lat,$lng,$merchant_lat,$merchant_lng);    	   	  
    	   } else {    	   
	    	   $distance=FunctionsV3::getDistanceBetweenPlot(
					$lat,
					$lng,
					$merchant_lat,$merchant_lng,$distance_type
			   );      
    	   }	   
    	   
    	   if(isset($_GET['debug'])){
    	      dump("distance=>$distance");
    	   }
		   		   
		   $distance_type_raw = $distance_type=="M"?"miles":"kilometers";		
		   $merchant_delivery_distance=getOption($merchant_id,'merchant_delivery_miles');   
		   
		   if(!empty(FunctionsV3::$distance_type_result)){
              $distance_type_raw=FunctionsV3::$distance_type_result;
           }
           
           /*dump("distance=>$distance");
           dump("merchant_delivery_distance=>$merchant_delivery_distance");*/
           if (is_numeric($merchant_delivery_distance)){
           	   if ( $distance>$merchant_delivery_distance){
           	   	   if($distance_type_raw=="ft" || $distance_type_raw=="meter" || $distance_type_raw=="mt"){
					   return true;
					} else {
						$error = Yii::t("mobile2",'Sorry but this merchant delivers only with in [distance] your current distance is [current_distance]',array(
			    		  '[distance]'=>$merchant_delivery_distance." ".t($distance_type_raw),
			    		  '[current_distance]'=>$distance." ".t($distance_type_raw),
			    		));
						throw new Exception( $error );
					}		
           	   } else {
           	   	   $delivery_fee=FunctionsV3::getMerchantDeliveryFee(
					              $merchant_id,
					              $merchant_info['delivery_charges'],
					              $distance,
					              $distance_type_raw);
					if($delivery_fee){
						return array(
						  'delivery_fee'=>$delivery_fee,
						  'distance'=>$distance,
						  'distance_unit'=>$distance_type_raw
						);
					}
					return true;
           	   }
           } else {
           	   // OK DO NOT CHECK DISTAMCE 
           	   $delivery_fee=FunctionsV3::getMerchantDeliveryFee(
				              $merchant_id,
				              $merchant_info['delivery_charges'],
				              $distance,
				              $distance_type_raw);
				if($delivery_fee){
					return array(
					  'delivery_fee'=>$delivery_fee,
					  'distance'=>$distance,
					  'distance_unit'=>$distance_type_raw
					);
				}
            	return true;
           }
    	   
    	} else throw new Exception( self::t("Merchant not found") );
    }
    
    public static function getLocalDistance($unit='', $lat1='',$lon1='', $lat2='', $lon2='')
    {    	  
    	  $theta = $lon1 - $lon2;
    	  $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
    	 
    	  $dist = acos($dist);
		  $dist = rad2deg($dist);
		  $miles = $dist * 60 * 1.1515;
		  $unit = strtoupper($unit);
		  
		  $resp = 0;
		  
		  if ($unit == "K") {
		      $resp = ($miles * 1.609344);
		  } else if ($unit == "N") {
		      $resp = ($miles * 0.8684);
		  } else {
		      $resp = $miles;
		  }		  
		  
		  if($resp>0){
		  	 $resp = number_format($resp,1);
		  }
		  
		  return $resp;
    }
    
    public static function emptyMessage($title='', $message='', $image=true){
    	$html='';
    	$html.='<div class="no_order_wrap">';
		   $html.='<div class="center"> ';
		   if($image){
		      $html.='<img src="">';
		   }
		    $html.='<h4 class="trn">'.self::t($title).'</h4>';
		    $html.='<p class="small trn">'.self::t($message).'</p>';
		   $html.='</div>';
		 $html.='</div>';
		 return $html;
    }
    
	public static function canReviewOrder($order_status='',$website_review_type='', $review_baseon_status='')
    {       	
    	if(!empty($review_baseon_status)){
		   $review_baseon_status = json_decode($review_baseon_status,true);
		   if (is_array($review_baseon_status) && count($review_baseon_status)>=1){
		   	  if (in_array($order_status,$review_baseon_status)){
		   	  	  return true;
		   	  }
		   }
		} else return true;
    }    
    
    public static function orderDetails($order_id='')
    {
    	$db = new DbExt();
    	$stmt="
    	SELECT 
    	a.order_id,
    	a.merchant_id,
    	a.client_id,
    	a.trans_type,
    	a.status,
    	a.status as status_raw,
    	a.payment_type,
    	a.payment_type as payment_type_raw,
    	b.restaurant_name as merchant_name,
		b.logo,
		c.review,
		c.rating,
		c.as_anonymous
							
		FROM
		{{order}} a
		
		left join {{merchant}} b
        ON
        a.merchant_id = b.merchant_id
        
        left join {{review}} c
        ON
        a.order_id = c.order_id
                
		WHERE a.order_id=".FunctionsV3::q($order_id)."
		LIMIT 0,1
    	";    	
    	if($res = $db->rst($stmt)){
    	   return $res[0];
    	}
    	return false;
    }
	
	   public static function orderDetails_for_driver($order_id='')
    {
    	$db = new DbExt();
    	$stmt="
    	SELECT 
    	a.order_id,
    	a.merchant_id,
    	a.client_id,
    	a.trans_type,
    	a.status,
    	a.status as status_raw,
    	a.payment_type,
    	a.payment_type as payment_type_raw,
    	b.restaurant_name as merchant_name,
		b.logo,
		c.review,
		c.rating,
		c.as_anonymous
							
		FROM
		{{order}} a
		
		left join {{merchant}} b
        ON
        a.merchant_id = b.merchant_id
        
        left join {{review_driver}} c
        ON
        a.order_id = c.order_id
                
		WHERE a.order_id=".FunctionsV3::q($order_id)."
		LIMIT 0,1
    	";    	
    	if($res = $db->rst($stmt)){
    	   return $res[0];
    	}
    	return false;
    }
    
    public static function orderHistory($order_id='')
    {
    	$db_ext=new DbExt;
    	$stmt="SELECT * FROM
    	{{order_history}}
    	WHERE
    	order_id=".q($order_id)."
    	ORDER BY id DESC
    	";
    	if ( $res=$db_ext->rst($stmt)){
    		return $res;
    	}
    	return false;
    }
    
    public static function showTrackOrder($order_id='')
    {
    	if (FunctionsV3::hasModuleAddon("driver")){
    		//$track_status = array('started','inprogress');    	
	    	$track_status = array('started','inprogress','failed','cancelled','declined','successful');    		    
	    	if($res = self::getTaskByOrderId($order_id)){    		
	    		if($res['driver_id']>0){
	    			if(in_array($res['status'],$track_status)){
	    			   return true;
	    			} /*else {
	    				if($res['status']=="successful" && $res['rating']<=0 ){
	    					return true;
	    				}
	    			}*/
	    		}
	    	}
    	}
    	return false;
    }
    
    public static function getTaskByOrderId($order_id='')
    {
    	if (FunctionsV3::hasModuleAddon("driver")){
	    	$db_ext=new DbExt;
	    	$stmt="SELECT * FROM
	    	{{driver_task}}
	    	WHERE
	    	order_id=".q($order_id)."
	    	LIMIT 0,1
	    	";
	    	if ( $res=$db_ext->rst($stmt)){
	    		return $res[0];
	    	}    	
    	}
    	return false;
    }
    
    public static function receiptFormater($label='', $val='')
	{
		return array(
		  'label'=>self::t($label),
		  'value'=>$val
		);
	}
	
	public static function removeFavorite($id='', $client_id='')
	{
		$db = new DbExt();
		$stmt="
		DELETE FROM {{favorites}}
		WHERE 
		id =".FunctionsV3::q($id)."
		AND client_id = ".FunctionsV3::q($client_id)."
		";
		$db->qry($stmt);
		return true;
	}
	
	public static function DeleteAddressBook($id='', $client_id='',$is_location=false)
	{
		$table='address_book';
		if($is_location){
			$table='address_book_location';
		}
		$stmt="DELETE FROM
		{{{$table}}}
		WHERE
		id=".FunctionsV3::q($id)."
		AND client_id = ".FunctionsV3::q($client_id)."
		";		
		$db = new DbExt();
		$db->qry($stmt);
		return true;
	}
	
	public static function UpdateAllAddressBookDefault($client_id=''){
		$stmt="UPDATE
		{{address_book}}
		SET as_default='1'
		WHERE		
		client_id = ".FunctionsV3::q($client_id)."
		";
		$db = new DbExt();
		$db->qry($stmt);
		return true;
	}
	
	public static function UpdateAllAddressBookDefaultLocation($client_id=''){
		$stmt="UPDATE
		{{address_book_location}}
		SET as_default='0'
		WHERE		
		client_id = ".FunctionsV3::q($client_id)."
		";
		$db = new DbExt();
		$db->qry($stmt);
		return true;
	}
	
    public static function getRecentLocation($device_uiid='', $lat='', $lng='')
    {
    	if(empty($device_uiid)){
    	   return false;
    	}    
    	if(empty($lat)){
    	   return false;
    	}    
    	
    	if (FunctionsV3::hasModuleAddon("driver")){
	    	$db=new DbExt;
	    	$stmt="SELECT * FROM
	    	{{mobile2_recent_location}}
	    	WHERE
	    	device_uiid =".FunctionsV3::q($device_uiid)."
	    	AND
	    	latitude =".FunctionsV3::q($lat)."
	    	AND
	    	longitude =".FunctionsV3::q($lng)."
	    	LIMIT 0,1
	    	";	    		    	
	    	if ( $res=$db->rst($stmt)){	 	    		
	    		return $res[0];
	    	}    	
    	}    	
    	return false;
    }    
    
    public static function getFavorites($client_id='', $merchant_id='',$return_data=false)
    {
    	if( !FunctionsV3::checkIfTableExist('favorites')){
			return false;
		}	
    	$db=new DbExt;
    	$stmt="
    	SELECT * FROM {{favorites}}
    	WHERE
    	client_id = ".FunctionsV3::q($client_id)."
    	AND 
    	merchant_id = ".FunctionsV3::q($merchant_id)."
    	LIMIT 0,1
    	";
    	if ($res = $db->rst($stmt)){
    		if($return_data){
    		   return $res[0];
    		} else return true;
    	}
    	return false;
    }
    
    public static function getRecentSearchs($device_uiid='',$search_string='')
    {
    	$db=new DbExt;
    	$stmt="
    	SELECT * FROM {{mobile2_recent_search}}
    	WHERE
    	device_uiid = ".FunctionsV3::q($device_uiid)."
    	AND 
    	search_string = ".FunctionsV3::q($search_string)."
    	LIMIT 0,1
    	";    	
    	if ($res = $db->rst($stmt)){
    		return $res[0];
    	}
    	return false;
    }
    
    public static function showDriverSignup()
    {
    	if (FunctionsV3::hasModuleAddon("driver")){
    		$theme_top_menu = getOptionA('theme_top_menu');
    		$theme_top_menu = !empty($theme_top_menu)?json_decode($theme_top_menu,true):'';
    		if(is_array($theme_top_menu) && count((array)$theme_top_menu)>=1){
    			if(in_array('driver_signup',(array)$theme_top_menu)){
    				return true;
    			}
    		}
    	}
    	return false;
    }
    
    public static function getDataSearchOptions()
    {
    	$search_data = getOptionA('mobile2_search_data');
		if(!empty($search_data)){
			$search_data = json_decode($search_data,true);
			if(is_array($search_data) && count((array)$search_data)>=1){
			    return $search_data;
			}
		}
		return false;
    }
    
    public static function getMerchantServicesList($service=0)
    {
    	$list = array();
    	if(!is_numeric($service)){
    		return false;
    	}
    	switch ($service) {
    		case 1:
    			$list[]=t("Delivery");
    			$list[]=t("Pickup");
    			break;
    		case 2:
    			$list[]=t("Delivery");
    			break;
    		case 3:
    			$list[]=t("Pickup");
    			break;	
    		case 4:
    			$list[]=t("Delivery");
    			$list[]=t("Pickup");
    			$list[]=t("Dinein");
    			break;	
    		case 5:
    			$list[]=t("Delivery");    			
    			$list[]=t("Dinein");
    			break;		
    		case 6:
    			$list[]=t("Pickup");    			
    			$list[]=t("Dinein");
    			break;			
    		case 7:
    			$list[]=t("Dinein");
    			break;				
    	}
    	return $list;
    }
    
    public static function merchantAppSettings($merchant_id='')
    {
    	$settings =  array(
    	   'order_verification'=>getOption($merchant_id,'order_verification'),
		   'enabled_voucher'=>getOption($merchant_id,'merchant_enabled_voucher'),
		   'enabled_tip'=>getOption($merchant_id,'merchant_enabled_tip'),
		   'tip_default'=>getOption($merchant_id,'merchant_tip_default'),
    	);
    	
    	if($settings['order_verification']==2){
    		$sms_balance=Yii::app()->functions->getMerchantSMSCredit($merchant_id);
    		if($sms_balance<=0){
    			$settings['order_verification']='';
    		}
    	}    	
    	return $settings;
    }
    
    public static function validateOrderSMSCode($session='', $code='')
    {
    	if(empty($session)){
    		return false;
    	}
    	if(empty($code)){
    		return false;
    	}
    	$db=new DbExt;
    	$stmt="
    	SELECT * FROM {{order_sms}}
    	WHERE session = ".FunctionsV3::q($session)."
    	AND code=".FunctionsV3::q($code)."
    	LIMIT 0,1    	
    	";
    	if($res = $db->rst($stmt)){
    		return $res[0];
    	}
    	return false;
    }
    
    public static function getCartContent($device_uiid='', $data=array() )
    {
    	if(empty($device_uiid)){
    		return false;
    	}
    	
    	if($res=self::getCart($device_uiid)){
    	   $cart=json_decode($res['cart'],true);
    	   
    	   if($res['tips']>0.0001){
		      $data['cart_tip_percentage']=$res['tips'];
			  $data['tip_enabled']=2;
			  $data['tip_percent']=$res['tips'];
		   }
			
		   $voucher_details = !empty($res['voucher_details'])?json_decode($res['voucher_details'],true):false;	
		   if(is_array($voucher_details) && count($voucher_details)>=1){
		      $data['voucher_name']=$voucher_details['voucher_name'];
			  $data['voucher_amount']=$voucher_details['amount'];
			  $data['voucher_type']=$voucher_details['voucher_type'];
		   }
		   
		   if($res['points_apply']>0.0001){
				$data['points_apply']=$res['points_apply'];
			}
			if($res['points_amount']>0.0001){
				$data['points_amount']=$res['points_amount'];
			}
			
			/*DELIVERY FEE*/
			unset($_SESSION['shipping_fee']);
			if($res['delivery_fee']>0.0001){
				$data['delivery_charge']=$res['delivery_fee'];
			}
								
			$cart_details = $res;
			unset($cart_details['cart']);		
			unset($cart_details['device_id']);
			unset($cart_details['cart_id']);			
			
			Yii::app()->functions->displayOrderHTML( $data,$cart );
			$code = Yii::app()->functions->code;
			$msg  = Yii::app()->functions->msg;
			if ($code==1){
				$details = Yii::app()->functions->details['raw'];
				return $details;
			}		   
    	}
    	return false;    
    }
	
    public static function removeVoucher($device_uiid='')
    {
    	if(empty($device_uiid)){
    		return false;
    	}
    	
    	$DbExt=new DbExt;
    	$params = array(
    	  'date_modified'=>FunctionsV3::dateNow(),
    	  'voucher_details'=>''
    	);
    	$DbExt->updateData("{{mobile2_cart}}",$params,'device_uiid',$device_uiid);
    }
    
    public static function removeTip($device_uiid='')
    {
    	if(empty($device_uiid)){
    		return false;
    	}
    	
    	$DbExt=new DbExt;
    	$params = array(
    	  'date_modified'=>FunctionsV3::dateNow(),
    	  'tips'=>0
    	);
    	$DbExt->updateData("{{mobile2_cart}}",$params,'device_uiid',$device_uiid);
    }
    
    public static function sendNotification($order_id='')
    {
    	$error='';
    	
    	if(!is_numeric($order_id)){
    		throw new Exception( t("invalid order id") );
    	}
    	
    	if (!@class_exists('PrintWrapper')) {
    		throw new Exception( t("missing print wrapper class") );
    	} 
    	
    	try {
    		
    		$print_resp = PrintWrapper::prepareReceipt($order_id);
	    	$print = $print_resp['print'];
	    	$print_data = $print_resp['data'];
	    	$print_additional_details = $print_resp['additional_details'];
	    	$print_raw = $print_resp['raw'];
	    	
	    	$to=isset($print_data['email_address'])?$print_data['email_address']:'';
            $receipt=EmailTPL::salesReceipt($print, $print_resp['raw'] );	 
                                    
            FunctionsV3::notifyCustomer($print_data,$print_additional_details,$receipt, $to);
            FunctionsV3::notifyMerchant($print_data,$print_additional_details,$receipt);
            FunctionsV3::notifyAdmin($print_data,$print_additional_details,$receipt);
            
            FunctionsV3::fastRequest(FunctionsV3::getHostURL().Yii::app()->createUrl("cron/processemail"));
            FunctionsV3::fastRequest(FunctionsV3::getHostURL().Yii::app()->createUrl("cron/processsms"));	
            
            $merchant_id = 0;            
            $merchant_id = $print_data['merchant_id'];            
            
             /*PRINTER ADDON*/
	        if (FunctionsV3::hasModuleAddon("printer")){
	        	Yii::app()->setImport(array('application.modules.printer.components.*'));
	        	$html=getOptionA('printer_receipt_tpl');
				if($print_receipt = ReceiptClass::formatReceipt($html,$print,$print_raw,$print_data)){							
					PrinterClass::printReceipt($order_id,$print_receipt);												
				}
				
				$html = getOption($merchant_id,'mt_printer_receipt_tpl');
				if($print_receipt = ReceiptClass::formatReceipt($html,$print,$print_raw,$print_data)){
			       PrinterClass::printReceiptMerchant($merchant_id,$order_id,$print_receipt);		
				}		
				FunctionsV3::fastRequest(FunctionsV3::getHostURL().Yii::app()->createUrl("printer/cron/processprint"));	
	        }
    		
    	} catch (Exception $e){
	    	$error = $e->getMessage();
	    }	
    }
    
    public static function registeredDevice($data=array(), $status='active', $update_device=true){
    	$db = new DbExt();
    	
    	$client_id = isset($data['client_id'])?$data['client_id']:'';
    	$device_id = isset($data['device_id'])?$data['device_id']:'';
    	$device_platform = isset($data['device_platform'])?$data['device_platform']:'';
    	$device_uiid = isset($data['device_uiid'])?$data['device_uiid']:'';
    	$code_version = isset($data['code_version'])?$data['code_version']:'';    	
    	$device_platform = strtolower($device_platform);
    	
    	$params = array(
    	  'device_id'=>$device_id,
    	  'device_platform'=>$device_platform,
    	  'device_uiid'=>$device_uiid,
    	  'status'=>$status,
    	  'code_version'=>$code_version,
    	  'date_created'=>FunctionsV3::dateNow(),
    	  'ip_address'=>$_SERVER['REMOTE_ADDR']
    	);
    	if($client_id>0){
    		$params['client_id'] = $client_id;
    	}    	
    	
    	if(!$update_device){
    		unset($params['device_id']);
    	}
    	
    	if(!empty($device_uiid)){
    		$stmt="SELECT * FROM
    		{{mobile2_device_reg}}
    		WHERE 
    		device_uiid =".FunctionsV3::q($device_uiid)."     		
    		LIMIT 0,1    		
    		";    		    		
    		if($res = $db->rst($stmt)){
    			$res = $res[0];    			    			
    			unset($params['date_created']);
    			$params['date_modified']=FunctionsV3::dateNow();    			
    			$db->updateData("{{mobile2_device_reg}}",$params,'id',$res['id']);
    		} else {
    			$db->insertData("{{mobile2_device_reg}}",$params);
    		}
    	}    	
    }
        
	public static function SendForgotPassword($to='',$res='')
	{
		$enabled=getOptionA('customer_forgot_password_email');
		if($enabled){
			$lang=Yii::app()->language; 
			$subject=getOptionA("customer_forgot_password_tpl_subject_$lang");
			if(!empty($subject)){
				$subject=FunctionsV3::smarty('firstname',
				isset($res['first_name'])?$res['first_name']:'',$subject);
				
				$subject=FunctionsV3::smarty('lastname',
				isset($res['last_name'])?$res['last_name']:'',$subject);
			}
										
			$tpl=getOptionA("customer_forgot_password_tpl_content_$lang") ;
			if (!empty($tpl)){								
				$tpl=FunctionsV3::smarty('firstname',
				isset($res['first_name'])?$res['first_name']:'',$tpl);
				
				$tpl=FunctionsV3::smarty('lastname',
				isset($res['last_name'])?$res['last_name']:'',$tpl);
				
				$tpl=FunctionsV3::smarty('change_pass_link',
				FunctionsV3::getHostURL().Yii::app()->createUrl('store/forgotpassword',array(
				  'token'=>$res['lost_password_token']
				))
				,$tpl);
				
				$tpl=FunctionsV3::smarty('sitename',getOptionA('website_title'),$tpl);
				$tpl=FunctionsV3::smarty('siteurl',websiteUrl(),$tpl);
			}
			if (!empty($subject) && !empty($tpl)){
				sendEmail($to,'',$subject, $tpl );
			}						
		}					
	}    
	
	public static function checkBlockAccount($email_address='', $contact='')
	{
		if ( FunctionsK::emailBlockedCheck($email_address)){
			return true;
		}
		if ( FunctionsK::mobileBlockedCheck($contact)){
			return true;
		}
		return false;
	}
	
	public static function clearRecentLocation($device_uiid='')
	{
		if(empty($device_uiid)){
			return false;
		}
		
		$db = new DbExt();
		$stmt="DELETE FROM
		{{mobile2_recent_location}}
		WHERE 
		device_uiid =".FunctionsV3::q($device_uiid)."
		";	
		$db->qry($stmt);
		unset($db);
		return true;
	}
	
	public static function clearRecentSearches($device_uiid='')
	{
		if(empty($device_uiid)){
			return false;
		}
		
		$db = new DbExt();
		$stmt="DELETE FROM
		{{mobile2_recent_search}}
		WHERE 
		device_uiid =".FunctionsV3::q($device_uiid)."
		";	
		$db->qry($stmt);
		unset($db);
		return true;
	}
	
	public static function getDriverTask($order_id='')
	{
		
		if($order_id<=0){
			return false;
		}
		if(!is_numeric($order_id)){
			return false;
		}
		
		$db = new DbExt();
		$stmt="
		SELECT a.*,
		b.transport_type_id,b.profile_photo		
		FROM {{driver_task_view}} a	
		left join {{driver}} b
		ON
		a.driver_id = b.driver_id
		
		WHERE order_id=".FunctionsV3::q($order_id)."
		LIMIT 0,1
		";		
		if($res = $db->rst($stmt)){
			return $res[0];
		}
		return false;
	}
	
	public static function getTask($task_id='')
	{
		if($task_id<=0){
			return false;
		}
		if(!is_numeric($task_id)){
			return false;
		}
		
		$db = new DbExt();
		$stmt="
		SELECT * FROM
		{{driver_task}}
		WHERE
		task_id =".FunctionsV3::q($task_id)."
		LIMIT 0,1
		";		
		if($res = $db->rst($stmt)){
			return $res[0];
		}
		return false;
	}	
	
	public static function getTaskFullInformation($task_id='')
	{
		if($task_id<=0){
			return false;
		}
		if(!is_numeric($task_id)){
			return false;
		}
		
		$db = new DbExt();
		$stmt="
		SELECT 
		a.task_id,
		a.order_id,
		a.driver_id,
		a.status,
		a.rating,
		a.rating_comment,		
		a.rating_anonymous,
		concat(b.first_name,' ',b.last_name) as driver_name,
		b.email as driver_email,
		b.phone as driver_phone,
		b.profile_photo as driver_photo, 
		c.client_id,
		d.first_name  as customer_firstname
				
		FROM
		{{driver_task}} a		
		left join {{driver}} b
		ON
		a.driver_id = b.driver_id		
		
		left join {{order}} c
		ON
		a.order_id = c.order_id
		
		left join {{client}} d
		ON
		c.client_id = d.client_id
		
		WHERE
		task_id =".FunctionsV3::q($task_id)."
		LIMIT 0,1
		";				
		if($res = $db->rst($stmt)){
			return $res[0];
		}
		return false;
	}		
	
	public static function DriverInformation($driver_id='')
	{
		if($driver_id<=0){
			return false;
		}
		if(!is_numeric($driver_id)){
			return false;
		}
		
		$db = new DbExt();
		$stmt="
		SELECT 
		a.driver_id,
		a.first_name,
		a.last_name,
		concat(a.first_name,' ',a.last_name) as full_name,
		a.email,
		a.phone,
		a.transport_type_id,
		a.transport_description,
		a.licence_plate,
		a.color,
		a.status,
		a.location_lat,
		a.location_lng,
		a.device_platform,
		a.last_login,
		a.last_online,
		a.last_login,
		a.profile_photo,
		a.team_id,
		b.team_name
		
		FROM {{driver}} a
		left join {{driver_team}} b
		ON
		a.team_id = b.team_id
		
		WHERE a.driver_id=".FunctionsV3::q($driver_id)."
		LIMIT 0,1
		";				
		if($res = $db->rst($stmt)){
			return $res[0];
		}
		return false;
	}
	
	public static function getDriverLocation($driver_id='')
	{
		if($driver_id<=0){
			return false;
		}
		if(!is_numeric($driver_id)){
			return false;
		}
		
		$db = new DbExt();
		$stmt="
		SELECT
		driver_id,
	    location_lat,
		location_lng
		FROM {{driver}}		
		WHERE driver_id=".FunctionsV3::q($driver_id)."
		LIMIT 0,1
		";		
		if($res = $db->rst($stmt)){
			return $res[0];
		}
		return false;
	}
    
	public static function getDriverRatings($driver_id='')
	{
		if($driver_id<=0){
			return false;
		}
		if(!is_numeric($driver_id)){
			return false;
		}
		
		$db = new DbExt();
		$stmt="
		SELECT SUM(rating) as ratings ,COUNT(*) AS count
		FROM
		{{driver_task}}
		WHERE
		driver_id= ".FunctionsV3::q($driver_id)."
		AND
		status in ('successful')
		";		
		if($res = $db->rst($stmt)){			
		   if ( $res[0]['ratings']>=1){
				$ret=array(
				  'ratings'=>number_format($res[0]['ratings']/$res[0]['count'],1),
				  'votes'=>$res[0]['count']
				);
			} else {
				$ret=array(
			     'ratings'=>0,
			     'votes'=>0
			   );
			}
		} else {
			$ret=array(
			  'ratings'=>0,
			  'votes'=>0
			);
		}	
		return $ret;	
	}
	
	public static function taskProgress($status='')
	{
		$base_completion = 25;
		switch (trim(strtolower($status))) {
			case "acknowledged":	
			    $completed = $base_completion;
				break;
			case "started":		    			
			    $completed = $base_completion*2;
				break;	
		    case "inprogress":		    			
		        $completed = $base_completion*3;
				break;
			default:
				$completed=0;  
				break;
		}
		return $completed;
	}
	
	public static function getAppLanguage()
	{
		$translation=array();
		$enabled_lang=FunctionsV3::getEnabledLanguage();		
		if(is_array($enabled_lang) && count($enabled_lang)>=1){			
			$path=Yii::getPathOfAlias('webroot')."/protected/messages";    	
    	    $res=scandir($path);
    	    if(is_array($res) && count($res)>=1){
    	    	foreach ($res as $val) {
    	    		if(in_array($val,$enabled_lang)){
    	    			$lang_path=$path."/$val/mobile2.php";   
    	    			if (file_exists($lang_path)){       	    						
    	    				$temp_lang='';
		    				$temp_lang=require_once $lang_path;		  		    						
		    				if(is_array($temp_lang) && count($temp_lang)>=1){				
			    				foreach ($temp_lang as $key=>$val_lang) {
			    					$translation[$key][$val]=$val_lang;
			    				}
		    				}
    	    			}
    	    		}
    	    	}
    	    }    	     	    
		}
		return $translation;
	}	
	
	public static function cuusineListTranslation()
	{
		$data = array();
		$db = new DbExt();
		$stmt="
		SELECT cuisine_name,cuisine_name_trans
		FROM
		{{cuisine}}
		WHERE status='publish'
		ORDER BY cuisine_name ASC
		";		
		if($res = $db->rst($stmt)){
			foreach ($res as $val) {				
				$json = json_decode($val['cuisine_name_trans'],true);				
				$data[$val['cuisine_name']]=$json;
			}
		}		
		return $data;
	}
	
	public static function cuisineListDict($list=array())
	{
		$data = array();
		if(is_array($list) && count((array)$list)>=1){
			foreach ($list as $val) {
				$json = json_decode($val['cuisine_name_trans'],true);
				$data[$val['cuisine_name']]=$json;
			}
		}
		return $data;
	}
	
	public static function customerPageDict($list=array())
	{
		$data = array(); $lang_list = DBTableWrapper::getLangList();	
		if(is_array($list) && count((array)$list)>=1){
			foreach ($list as $val) {						
				$new_data=array();
				
				if(is_array($lang_list) && count($lang_list)>=1){
					foreach ($lang_list as $lang_val) {
						$new_data[$lang_val] = isset($val["title_$lang_val"])?$val["title_$lang_val"]:'';
					}
				}
				$data[$val['title']]=$new_data;
			}			
		}	
		return $data;			
	}
	
	public static function executeAddons($order_id='')
	{
		/*SEND FAX*/
         if(!$order_info=Yii::app()->functions->getOrderInfo($order_id)){
            return false;
         } 
                  
         Yii::app()->functions->sendFax($order_info['merchant_id'],$order_id);
         
         $client_id = isset($order_info['client_id'])?$order_info['client_id']:'';
         
		 /*POINTS PROGRAM*/ 
		 if (FunctionsV3::hasModuleAddon('pointsprogram')){
			if (method_exists("PointsProgram","updateOrderBasedOnStatus")){								
				PointsProgram::updateOrderBasedOnStatus( $order_info['status'] , $order_id);
			} 
		}
		
		  /*Driver app*/
		 if (FunctionsV3::hasModuleAddon("driver")){
			Yii::app()->setImport(array(			
			  'application.modules.driver.components.*',
			));
			Driver::addToTask($order_id);
		 }
		 		 
	}
	
	public static function OrderTrigger($order_id='',$status='', $remarks='', $trigger_type='order')
	{
		if( !FunctionsV3::checkIfTableExist('mobile2_order_trigger')){
			return false;
		}
		
		$lang=Yii::app()->language; 
		if($order_id>0){
			$db = new DbExt();
			$stmt="SELECT order_id FROM
			{{mobile2_order_trigger}}
			WHERE
			order_id=".FunctionsV3::q($order_id)."
			AND status='pending'			
			LIMIT 0,1
			";
			if(!$res=$db->rst($stmt)){
				$params = array(
				  'order_id'=>$order_id,
				  'order_status'=>$status,
				  'remarks'=>$remarks,
				  'language'=>$lang,
				  'date_created'=>FunctionsV3::dateNow(),
				  'ip_address'=>$_SERVER['REMOTE_ADDR'],
				  'trigger_type'=>$trigger_type
				);
				$db->insertData("{{mobile2_order_trigger}}",$params);		
				FunctionsV3::fastRequest(FunctionsV3::getHostURL().Yii::app()->createUrl("mobileappv2/cron/triggerorder"));	
			}
		}
	}
	
	public static function timePastByTransaction($transaction_type='')
	{
		$error = '';
		switch ($transaction_type)
		{
			case "delivery":
			case "pickup":
			case "dinein":
				$error = mt("Sorry but you have selected [transaction_type] time that already past",array(
				  '[transaction_type]'=>mt($transaction_type)
				));
				break;
							
			default:		
			    $error = mt("Sorry but you have selected time that already past");
			    break;	
		}
		
		return $error;
	}
	
	public static function getReviewReplied($review_id='', $merchant_id='')
	{	
		if($merchant_id>0){			
		} else $merchant_id=-1;
				
		$data = array();
		$db = new DbExt();
		$stmt="
	   	   SELECT 
	   	   a.merchant_id,
	   	   a.review,
	   	   a.parent_id,
	   	   a.reply_from,
	   	   a.date_created,
	   	   ( 
	   	     select logo from {{merchant}}
	   	     where merchant_id=".FunctionsV3::q($merchant_id)."
	   	     limit 0,1
	   	   ) as logo
	   	   	   	   
	   	   FROM
	   	   {{review}} a
	   	   
	   	   WHERE
	   	   a.parent_id=".FunctionsV3::q($review_id)."
	   	   AND 
	   	   a.status = 'publish'
	   	   ORDER BY a.id ASC
	   	   LIMIT 0,10
	   	 ";   	  
		 if($res = $db->rst($stmt)){
		 	foreach ($res as $val) {		 		
		 		$val['logo']=mobileWrapper::getImage($val['logo']);	 		
		 		$pretyy_date=PrettyDateTime::parse(new DateTime($val['date_created']));
		        $pretyy_date=Yii::app()->functions->translateDate($pretyy_date);
		        $val['date_posted']=$pretyy_date;
		        $val['customer_name'] = mobileWrapper::t("Replied By [merchant_name]",array(
					  '[merchant_name]'=>$val['reply_from']
					));
					
				unset($val['merchant_id']);
		 		unset($val['reply_from']);
		 		unset($val['date_created']);
		 		$data[]=$val;
		 	}
		 }		 
		 return $data;
	}
	
	public static function getTaskViewByOrderID($order_id='')
	{
		if( !FunctionsV3::checkIfTableExist('driver_task')){
			return false;
		}	
		$db = new DbExt();
		$stmt="
		SELECT * FROM
		{{driver_task_view}}
		WHERE
		order_id=".FunctionsV3::q($order_id)."		
		LIMIT 0,1
		";
		if($res=$db->rst($stmt)){
		   return $res[0];
		}	
		return false;
	}
	
	public static function getOrderTabsStatus($tab='')
	{
		$status = ''; $and='';
		switch ($tab) {
			case "processing":		
			    $status=getOptionA('mobileapp2_order_processing');
				break;
		
			case "completed":				
			    $status=getOptionA('mobileapp2_order_completed'); 
				break;
				
			case "cancelled":				
			    $status=getOptionA('mobileapp2_order_cancelled'); 
				break;
						
			default:
				break;
		}	
		
		if(!empty($status)){
			$status = json_decode($status,true);			
			if(is_array($status) && count((array)$status)>=1){
				foreach ($status as $val) {
					$and.= FunctionsV3::q($val)."," ;
				}
				$and = substr($and,0,-1);
				$and = "AND a.status IN ($and)";
			}
		}
		return $and;
	}
	
	public static function GetBookingDetails($booking_id='',$client_id='')
	{		
		$db = new DbExt();
		$stmt="
		SELECT * FROM
		{{bookingtable}}
		WHERE
		client_id=".FunctionsV3::q($client_id)."
		AND
		booking_id=".FunctionsV3::q($booking_id)."		
		LIMIT 0,1
		";
		if($res=$db->rst($stmt)){
		   return $res[0];
		}	
		return false;
	}
	
	public static function getStartupBanner()
	{
		$banners = array();
		$startup_banner = getOptionA('mobileapp2_startup_banner');
		if(!empty($startup_banner)){
			$banner = json_decode($startup_banner,true);
			if(is_array($banner) && count((array)$banner)>=1){
				foreach ($banner as $val) {
					$banners[]=self::getImage($val);
				}
			}
		}			
		return $banners;
	}
	
	public static function mobileCodeList()
	{
		$mobile_countrycode = require_once 'MobileCountryCode.php';
		$data = array();
		$data[] = self::t("Please select...");
		
		foreach ($mobile_countrycode as $key=>$val) {						
			$data[$val['code']]= self::t("[name] +[code]",array(
			  '[name]'=>$val['name'],
			  '[code]'=>$val['code'],
			));
		}
		
		return $data;
		
	}
	
	public static function trackingTheme()
	{
		return array(
		  1 => self::t("Theme 1"),
		  2 => self::t("Theme 2"),
		);
	}
	
	public static function cartTheme()
	{
		return array(
		  1 => self::t("Theme 1"),
		  2 => self::t("Theme 2"),
		);
	}
	
	public static function getHomeBannerByID($banner_id='')
	{
		$db = new DbExt();
		$stmt="
		SELECT * FROM
		{{mobile2_homebanner}}
		WHERE
		banner_id=".FunctionsV3::q($banner_id)."		
		LIMIT 0,1
		";
		if($res=$db->rst($stmt)){
		   return $res[0];
		}	
		return false;
	}
	
	public static function getHomeBanner()
	{
		$data = array();
		$db = new DbExt();
		$stmt="
		SELECT banner_name FROM
		{{mobile2_homebanner}}
		WHERE
		status IN ('publish','published')
		ORDER BY sequence,banner_id ASC
		";
		if($res=$db->rst($stmt)){
		   foreach ($res as $val) {
		   	   $data[]=mobileWrapper::getImage($val['banner_name']);
		   }
		   return $data;
		}	
		return false;
	}
	
	public static function getAddressBookDefault($client_id='')
	{
		if($client_id>0){
			$db=new DbExt;    	
	    	$stmt="SELECT a.*,
	               b.contact_phone   	       
	    	       FROM
	    	       {{address_book}} a
	    	       
	    	       left join {{client}} b
                   ON
                   a.client_id=b.client_id
	    	       
	    	       WHERE
	    	       a.client_id= ".FunctionsV3::q($client_id)."
	    	       AND
	    	       a.as_default ='2'
	    	       LIMIT 0,1
	    	";    	    	 
	    	if ($res=$db->rst($stmt)){    		
	    		unset($db);
	    		return $res[0];
	    	}
	    	unset($db);
		}
		return false;	
	}
	
	public static function updateCartAddress($data=array(), $device_uiid='')
	{				
		if(empty($device_uiid)){
			return false;
		}
		if(!is_array($data)){
			return false;
		}
		
		$params = array(
		  'street'=>isset($data['street'])?$data['street']:'',
		  'city'=>isset($data['city'])?$data['city']:'',
		  'state'=>isset($data['state'])?$data['state']:'',
		  'zipcode'=>isset($data['zipcode'])?$data['zipcode']:'',
		  'location_name'=>isset($data['location_name'])?$data['location_name']:'',
		  'delivery_lat'=>isset($data['latitude'])?$data['latitude']:'',
		  'delivery_long'=>isset($data['longitude'])?$data['longitude']:'',
		  'contact_phone'=>isset($data['contact_phone'])?$data['contact_phone']:'',
		);
		$db=new DbExt; 
		$db->updateData("{{mobile2_cart}}",$params,'device_uiid',$device_uiid);
		unset($db);
	}
	
	public static function setAutoAddress($merchant_id='',$client_id='', $current_lat=0, $current_lng=0 , $device_uiid='' )
	{		
		if($merchant_id<=0){
			throw new Exception( mt("invalid merchant id") );
		}
		
		$address_use = array();
		if($client_id>0){
			$address_use = mobileWrapper::getAddressBookDefault($client_id);			
		} else {			
			if ($res_recent = mobileWrapper::getRecentLocation($device_uiid,$current_lat,$current_lng)){
				if(empty($res_recent['street'])){
				    if($resp_lat_address = FunctionsV3::latToAdress($current_lat,$current_lng)){
					    $res_recent['street']=$resp_lat_address['address'];
					    $res_recent['city']=$resp_lat_address['city'];
					    $res_recent['state']=$resp_lat_address['state'];
					    $res_recent['zipcode']=$resp_lat_address['zip'];				    
				    }
				}				
				if(!empty($res_recent['street'])){
				    $address_use = $res_recent;
				}
			}
		}
		
		if(is_array($address_use) && count($address_use)>=1){
			
			if(empty($address_use['latitude'])){
				throw new Exception( mt("invalid latitude") );		
			}
			if(empty($address_use['longitude'])){
				throw new Exception( mt("invalid longitude") );		
			}
			if(empty($address_use['street'])){
				throw new Exception( mt("invalid street") );		
			}
			
			//dump($address_use);
			$lat = $address_use['latitude']; $lng = $address_use['longitude'];			
			$resp = mobileWrapper::checkDeliveryAddresNew($merchant_id,$lat, $lng);
			
			if(is_array($resp) && count((array)$resp)>=1){
				//dump($resp);
				$params = array(
				  'street'=>isset($address_use['street'])?$address_use['street']:'',
				  'city'=>isset($address_use['city'])?$address_use['city']:'',
				  'state'=>isset($address_use['state'])?$address_use['state']:'',
				  'zipcode'=>isset($address_use['zipcode'])?$address_use['zipcode']:'',				  
				  'location_name'=>isset($address_use['location_name'])?$address_use['location_name']:'',
				  'contact_phone'=>isset($address_use['contact_phone'])?$address_use['contact_phone']:'',
				  'country_code'=>isset($address_use['country_code'])?$address_use['country_code']:'',
				  'delivery_lat'=>$lat,
				  'delivery_long'=>$lng,				  
				);
				
				$min_fees=0;
			    $params['delivery_fee']=0;
			    $params['min_delivery_order']=0;
			    
			    if(isset($resp['delivery_fee'])){
					$params['delivery_fee']=$resp['delivery_fee'];								                    
				}
				if($resp['distance']>0.001){
				   /*GET MINIMUM ORDER TABLE*/
				   $merchant_minimum_order = getOption($merchant_id,'merchant_minimum_order');
				   $min_fees=FunctionsV3::getMinOrderByTableRates(
					   $merchant_id,
					   $resp['distance'],
					   $resp['distance_unit'],
					   $merchant_minimum_order
					);					
					$params['min_delivery_order'] = $min_fees;
				}
				if(!is_numeric($params['min_delivery_order'])){
				    $params['min_delivery_order']=0;
			    }	
			    
			    $params['distance'] = $resp['distance'];
			    $params['distance_unit'] = $resp['distance_unit'];			    
			    			    							    			    			    
				return $params;
				
			} else throw new Exception( $resp );		
		} else throw new Exception( mt("address invalid") );		
	}
	
	public static function searchMode()
	{
		$search_mode = getOptionA('home_search_mode');
		$location_mode = getOptionA('admin_zipcode_searchtype');
		if(empty($search_mode)){
		   $search_mode = 'address';	
		} elseif ($search_mode=="postcode"){
			$search_mode='location';
		}
		return array(
		  'search_mode'=>$search_mode,
		  'location_mode'=>$location_mode,
		);
	}
	
	public static function isLocation()
	{
		$mode = self::searchMode();
		if($mode=="location"){
			return true;
		}
		return false;
	}
	
    public static function getVoucherMerchant($client_id='',$voucher_code='',$merchant_id='')
    {
    	$db_ext=new DbExt;    	
    	$stmt="
    	SELECT a.*,
    	(
    	select count(*) from
    	{{order}}
    	where
    	voucher_code=".FunctionsV3::q($voucher_code)."
    	and
    	client_id=".FunctionsV3::q($client_id)."  	
    	LIMIT 0,1
    	) as found,
    	
    	(
    	select count(*) from
    	{{order}}
    	where
    	voucher_code=".FunctionsV3::q($voucher_code)."    	
    	LIMIT 0,1
    	) as number_used    
    	
    	FROM
    	{{voucher_new}} a
    	WHERE
    	voucher_name=".FunctionsV3::q($voucher_code)."
    	AND
    	merchant_id=".FunctionsV3::q($merchant_id)."
    	AND status IN ('publish','published')
    	LIMIT 0,1
    	";    	    	
    	if ($res=$db_ext->rst($stmt)){    		    		
    		return $res[0];
    	}
    	return false;
    } 
    
    public static function getVoucherAdmin($client_id='', $voucher_code='')
    {
    	$db_ext=new DbExt;    	
    	$stmt="
    	SELECT a.*,
    	(
    	select count(*) from
    	{{order}}
    	where
    	voucher_code=".FunctionsV3::q($voucher_code)."
    	and
    	client_id=".FunctionsV3::q($client_id)."  	
    	LIMIT 0,1
    	) as found,
    	
    	(
    	select count(*) from
    	{{order}}
    	where
    	voucher_code=".FunctionsV3::q($voucher_code)."    	
    	LIMIT 0,1
    	) as number_used    	
    	
    	FROM
    	{{voucher_new}} a
    	WHERE
    	voucher_name=".FunctionsV3::q($voucher_code)."
    	AND
    	voucher_owner='admin'
    	AND status IN ('publish','published')
    	LIMIT 0,1
    	";    	
    	if ($res=$db_ext->rst($stmt)){    		    		
    		return $res[0];
    	}
    	return false;
    }     	
    
    public static function standardUnit($unit_type='')
    {
    	$type='';
    	switch ($unit_type) {
        	case "mi":
        		$type="M";
        		break;        
        	case "km":	
        	    $type="K";
        	    break;
        	default:
        		$type="M";
        		break;
        }
        return $type;
    }
    
    public static function clearCartByCustomerID($client_id='')
    {
    	$db=new DbExt();
    	$stmt="
    	DELETE FROM {{mobile2_cart}}
    	WHERE device_uiid IN (
    	 select device_uiid from {{mobile2_device_reg}}
    	 where client_id =".FunctionsV3::q($client_id)."
    	)
    	";     	
    	$db->qry($stmt);
    	unset($db);
    }
    
    public static function preCheckout($merchant_id='',$date_now='', $delivery_date='', $delivery_time="")
    {
    	$continue = false; $code = 2; $message='';
    	$merchant_close_msg = getOption($merchant_id,'merchant_close_msg');
    	$is_merchant_open = Yii::app()->functions->isMerchantOpen($merchant_id);
    	$merchant_preorder= Yii::app()->functions->getOption("merchant_preorder",$merchant_id);
    	/*dump("is_merchant_open=>$is_merchant_open");
    	dump("merchant_preorder=>$merchant_preorder");*/
    	
    	if(!$is_merchant_open){
    		if($merchant_preorder==1){
    			$continue = true;
    		} else $message = empty($merchant_close_msg)?"Merchant is close":$merchant_close_msg;
    	} else $continue = true;
    	
    	if($continue){
    		if (!yii::app()->functions->validateSellLimit($merchant_id) ){
    			$message = t("This merchant has reach the maximum sells per month");
    			$continue = false;
    		}
    	}
    	
    	if($continue){
    		if ( $res_holiday =  Yii::app()->functions->getMerchantHoliday($merchant_id)){
	    		if (in_array($delivery_date,$res_holiday)){
	    		   $message =Yii::t("mobile2","were close on [date]",array(
				   	  	   '[date]'=>FunctionsV3::prettyDate($delivery_date)
				   	));
				   	
				   	$close_msg=getOption($merchant_id,'merchant_close_msg_holiday');
				   	if(!empty($close_msg)){
		   	  	 	  $message = Yii::t("mobile2",$close_msg,array(
		   	  	 	   '[date]'=>FunctionsV3::prettyDate($delivery_date)
		   	  	 	  ));
		   	  	    }	
	    			$continue = false;
	    		}
	    	}
    	}
    	
    	$future_order = false;
    	
    	if($continue){
    		if($date_now!=$delivery_date){     
    			$future_order = true; 			
    			if(empty($delivery_time)){
    				$continue = false;			
    				$message = mt("For furure order delivery time is required");
    			}
    		}
    	}
    	
    	if($continue){
    		$full_delivery = "$delivery_date $delivery_time";    	
    	    $delivery_day = strtolower(date("D",strtotime($full_delivery)));
    	    
    	    $delivery_time_formated = '';
	    	if(!empty($delivery_time)){
	    		$delivery_time_formated=date('h:i A',strtotime($delivery_time));
	    	} else $delivery_time_formated = date('h:i A');
	    	
	    	if ( !Yii::app()->functions->isMerchantOpenTimes($merchant_id,$delivery_day,$delivery_time_formated)){
	    		
	    		if(empty($delivery_time)){	    	    			
	    			$full_delivery = "$delivery_date $delivery_time_formated";  
	    		}	    	
	    			    		
	    		$date_close=date("F,d l Y h:ia",strtotime($full_delivery));
	    		$message = Yii::t("mobile2","Sorry but we are closed on [date_close]. Please check merchant opening hours.",array(
	    		  '[date_close]'=>$date_close
	    		));
	    		$continue = false;
	    	}    	 	    	
    	}
    	
    	if($continue){
    		$code = 1;
    		$message="OK";
    	}
    	
    	return array(
    	  'code'=>$code,
    	  'message'=>$message,
    	  'future_order'=>$future_order
    	);
    }
			
} /*end class*/