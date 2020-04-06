<?php
class LocationWrapper
{
	
	public static function GetCountryDefault()
	{
		$country_id=getOptionA('location_default_country');		
   	    if(empty($country_id)){
   	    	if($res=FunctionsV3::getCountryByCode()){   	    	
   	    		$country_id=$res['country_id'];
   	    	}
   	    }
   	    return $country_id;
	}
	
	public static function GetSateDefault($country_id="")
	{
		 if(!empty($country_id)){
		 	$state_ids='';
   	    	if ($res=FunctionsV3::locationStateList($country_id)){
   	    		foreach ($res as $val) {
   	    			$state_ids.="'$val[state_id]',";
   	    		}
   	    		$state_ids=substr($state_ids,0,-1);
   	    	}
   	    	return $state_ids;
   	    }
   	    return false;
	}	
	
	public static function GetStateList($page=0, $page_limit=10, $search_string='')
	{
		$db = new DbExt();
		$country_id = LocationWrapper::GetCountryDefault();
		
		$and='';
		if(!empty($search_string)){
   	    	$and.=" AND a.name LIKE ".FunctionsV3::q("%$search_string%")." ";
   	    }
		
		if($country_id>0){
			$stmt="
			SELECT SQL_CALC_FOUND_ROWS
			a.state_id,
			a.name as state,
			a.name as state_raw,
			a.country_id,
			b.country_name
			FROM {{location_states}} a
			
			LEFT JOIN {{location_countries}} b
			ON
			a.country_id = b.country_id
			
			WHERE a.country_id=".FunctionsV3::q($country_id)."
			$and
			ORDER BY a.sequence,a.name ASC
			LIMIT $page,$page_limit
			";			
			if(isset($_GET['debug'])){
   	           dump($stmt);
   	       }
			if($res=$db->rst($stmt)){
				$total_records=0;
				$stmtc="SELECT FOUND_ROWS() as total_records";
				if ($resp=$db->rst($stmtc)){			 			
					$total_records=$resp[0]['total_records'];
				}					
				$paginate_total = ceil( $total_records / $page_limit );
					
				foreach ($res as $val) {														
				    $val['state'] = mobileWrapper::highlight_word( clearString($val['state_raw']) ,$search_string);
				    $data[] = $val;
				}
				
				return array(
				  'paginate_total'=>$paginate_total,
				  'list'=>$data
				);
			}
		}
		return false;
	}
	
	public static function GetLocationCity($page=0, $page_limit=10, $search_string='', $state_id=0)
	{
		$db = new DbExt();
		$data = array();

		if($state_id<=0){
			$country_id = LocationWrapper::GetCountryDefault();
			if($country_id>0){
			   $state_id =  LocationWrapper::GetSateDefault($country_id);
			}		
		} 
		
		
		$and="";
   	    if(!empty($state_id)){
   	    	$and.=" AND a.state_id IN ($state_id) ";
   	    }
   	    
   	    if(!empty($search_string)){
   	    	$and.=" AND a.name LIKE ".FunctionsV3::q("%$search_string%")." ";
   	    }
   	    
   	    $db=new DbExt; 
   	    $stmt="
   	    SELECT SQL_CALC_FOUND_ROWS 
   	    a.city_id,
   	    a.name,
   	    a.postal_code,
   	    a.state_id,    	    
   	    b.name as state_name,
   	    c.country_id, 
   	    c.country_name
   	    FROM
   	    {{location_cities}} a
   	    
   	    LEFT JOIN {{location_states}} b
   	    ON
   	    a.state_id = b.state_id
   	    
   	    LEFT JOIN {{location_countries}} c
   	    ON
   	    b.country_id = c.country_id
   	    
   	    WHERE 1
   	    $and
   	    ORDER BY a.sequence,a.name ASC
   	    LIMIT $page,$page_limit
   	    ";   	    
   	    if(isset($_GET['debug'])){
   	     dump($stmt);
   	    }
   	    if($res = $db->rst($stmt)){
   	    	$total_records=0;
			$stmtc="SELECT FOUND_ROWS() as total_records";
			if ($resp=$db->rst($stmtc)){			 			
				$total_records=$resp[0]['total_records'];
			}					
			$paginate_total = ceil( $total_records / $page_limit );
			
			$data = array();
			foreach ($res as $key=>$val) {
				$val['name'] = clearString($val['name']);
				$val['state_name'] = clearString($val['state_name']);
				$val['city_name'] = mobileWrapper::highlight_word( clearString($val['name']) ,$search_string);
				$data[] = $val;
			}
									
			return array(
			  'paginate_total'=>$paginate_total,
			  'list'=>$data
			);
   	    }
   	    return false;
	}
	
	public static function GetAreaList($city_id='',$page=0, $page_limit=10, $search_string='')
	{
		if($city_id<=0 || empty($city_id) || !is_numeric($city_id)){
			return false;
		}
		
		$db = new DbExt();
		$data = array(); $and='';
		if(!empty($search_string)){
   	    	$and.=" AND a.name LIKE ".FunctionsV3::q("%$search_string%")." ";
   	    }
		
		$stmt="
		SELECT SQL_CALC_FOUND_ROWS 
		a.*,
		b.name as city_name
		FROM
		{{location_area}} a
		left join {{location_cities}} b
		ON
		a.city_id = b.city_id
		
		WHERE 1
		AND a.city_id =".FunctionsV3::q($city_id)."
		$and
		ORDER BY a.sequence,a.name ASC
		LIMIT $page,$page_limit
		";		
		//dump($stmt);		
		if($res = $db->rst($stmt)){			
   	    	$total_records=0;
			$stmtc="SELECT FOUND_ROWS() as total_records";
			if ($resp=$db->rst($stmtc)){			 			
				$total_records=$resp[0]['total_records'];
			}					
			$paginate_total = ceil( $total_records / $page_limit );
			
			$data = array();
			foreach ($res as $key=>$val) {
				$val['name'] = clearString($val['name']);
				$val['city_name'] = clearString($val['city_name']);
				$val['area_name'] = mobileWrapper::highlight_word( clearString($val['name']) ,$search_string);
				$data[] = $val;
			}								
			return array(
			  'paginate_total'=>$paginate_total,
			  'list'=>$data
			);
   	    }
   	    return false;		
	}
	
	public static function getCountryID($state_id='', $all=false)
	{
		if($state_id<=0){
			return false;
		}
		$db = new DbExt();
		$stmt="
		SELECT * FROM
		{{location_states}}
		WHERE
		state_id=".FunctionsV3::q($state_id)."
		LIMIT 0,1
		";
		if($res=$db->rst($stmt)){
			if($all){
				return $res;
			} else {
				return $res[0]['country_id'];
			}
		}
		return false;
	}
	
	public static function isAddressBookExist($client_id='',$state_id='', $city_id='', $area_id='',$id=0)
	{
		if($client_id<=0){
			return false;
		}
		$db = new DbExt();
		$and='';
		
		if($id>0){
			$and=" AND id <> ".FunctionsV3::q($id)." ";
		}		
		$stmt="
		SELECT * FROM
		{{address_book_location}}
		WHERE
		client_id=".FunctionsV3::q($client_id)."
		AND
		state_id= ".FunctionsV3::q($state_id)."
		AND
		city_id= ".FunctionsV3::q($city_id)."
		AND
		area_id= ".FunctionsV3::q($area_id)."
		$and
		LIMIT 0,1
		";
		//dump($stmt);
		if($res = $db->rst($stmt)){
			return $res;
		}
		return false;
	}
	
	public static function getAddressBookByID($id='',$client_id='')
	{
		if($id<=0){
			return false;
		}
		if(!is_numeric($id)){
			return false;
		}
		if($client_id<=0){
			return false;
		}
		if(!is_numeric($client_id)){
			return false;
		}
		$db = new DbExt();
				
		$stmt="
		SELECT SQL_CALC_FOUND_ROWS 
		a.id,
		a.street,
		a.country_id,
		a.location_name,		
		a.state_id,
		a.city_id,
		a.area_id,
		a.as_default,
		a.latitude as lat,	
		a.longitude as lng,
		d.name as area_name,
		c.name as city_name,
		b.name as state_name
		FROM
		{{address_book_location}} a

		LEFT JOIN {{location_states}} b
		ON 
		a.state_id = b.state_id
		
		LEFT JOIN {{location_cities}} c
		ON 
		a.city_id = c.city_id
		
		LEFT JOIN {{location_area}} d
		ON 
		a.area_id = d.area_id
		    
		WHERE a.client_id=".FunctionsV3::q($client_id)."
				
		AND id=".FunctionsV3::q($id)."
		
		LIMIT 0,1
		";			
		//dump($stmt);
		if($res = $db->rst($stmt)){
			return $res[0];
		}
		return false;
	}

	public static function hasAddress($client_id='')
	{
		if($client_id>0){
			$db = new DbExt();
			$stmt="
			SELECT * FROM
			{{address_book_location}}
			WHERE
			client_id=".FunctionsV3::q($client_id)."
			LIMIT 0,1
			";		
			if($res = $db->rst($stmt)){
				return $res[0];
			}
		}
		return false;
	}
	
	public static function customerDefaultAddress($client_id='')
	{
		if($client_id>0){
			$db = new DbExt();
				$stmt="
			SELECT SQL_CALC_FOUND_ROWS 
			a.id,
			a.street,
			a.country_id,
			a.location_name,		
			a.state_id,
			a.city_id,
			a.area_id,
			a.as_default,
			a.latitude as lat,	
			a.longitude as lng,
			d.name as area_name,
			c.name as city_name,
			b.name as state_name,
			e.contact_phone
			FROM
			{{address_book_location}} a
	
			LEFT JOIN {{location_states}} b
			ON 
			a.state_id = b.state_id
			
			LEFT JOIN {{location_cities}} c
			ON 
			a.city_id = c.city_id
			
			LEFT JOIN {{location_area}} d
			ON 
			a.area_id = d.area_id
			
			LEFT JOIN {{client}} e
			ON 
			a.client_id = e.client_id
			    
			WHERE a.client_id=".FunctionsV3::q($client_id)."	
			AND as_default='1'				
			
			LIMIT 0,1
			";			
			if($res = $db->rst($stmt)){
				return $res[0];
			}
		}
		return false;
	}
	
	public static function getDeliveryFee($merchant_id='',$fee=0,$state_id='', $city_id='',$area_id='')
	{
		if($merchant_id<=0){
			return false;
		}
		
		$db = new DbExt();
		$stmt="
		SELECT a.fee
		FROM {{view_location_rate}} a
		WHERE
		merchant_id = ".FunctionsV3::q($merchant_id)."
		AND
		state_id =".FunctionsV3::q($state_id)."
		AND
		city_id =".FunctionsV3::q($city_id)."
		AND
		area_id =".FunctionsV3::q($area_id)."
		";						
		if(isset($_GET['debug'])){
			dump($stmt);
		}
		if($res = $db->rst($stmt)){			
		   $res = $res[0];
		   if($res['fee']>0.0001){
		     $fee = $res['fee'];
		   } 
		   return $fee;
		}
		return false;		
	}
	
	public static function getAddressBook($client_id='')
	{
		if($client_id>0){
			$db = new DbExt();
			$stmt="
			SELECT SQL_CALC_FOUND_ROWS 
			a.id,
			a.as_default,
			a.date_created,
			concat(a.street,' ',d.name,' ',c.name,' ',b.name) as address			
			FROM
			{{address_book_location}} a
	
			LEFT JOIN {{location_states}} b
			ON 
			a.state_id = b.state_id
			
			LEFT JOIN {{location_cities}} c
			ON 
			a.city_id = c.city_id
			
			LEFT JOIN {{location_area}} d
			ON 
			a.area_id = d.area_id
			    
			WHERE a.client_id=".FunctionsV3::q($client_id)."
					
			AND a.street <> ''    	      
			
			ORDER BY a.id DESC
			";			
			if($res = $db->rst($stmt)){
				return $res;
			}
		}
		return false;			
	}
	
	public static function autoSetDeliveryFee($location_mode='', $client_id='', $cart_id='', $data=array())
	{		
		if($location_mode>0){
		   switch ($location_mode) {
		   	case 1:
		   	case 2:
		   	case 3:
		   		$merchant_id = isset($data['merchant_id'])?$data['merchant_id']:'';
		   		$delivery_fee = getOption($merchant_id,'merchant_delivery_charges');
		   		
		   		if($resp = self::customerDefaultAddress($client_id)){		   		   		   		   		   			
		   		   $resp_delivery = LocationWrapper::getDeliveryFee(
					 $merchant_id,
					 $delivery_fee,
					 isset($resp['state_id'])?$resp['state_id']:'',
					 isset($resp['city_id'])?$resp['city_id']:'',
					 isset($resp['area_id'])?$resp['area_id']:''
					);
					if($resp_delivery){						
						$params = array(
						  'state_id'=>$resp['state_id'],
						  'city_id'=>$resp['city_id'],
						  'area_id'=>$resp['area_id'],
						  'street'=>$resp['street'],
						  'city'=>$resp['city_name'],
						  'state'=>$resp['state_name'],
						  'zipcode'=>$resp['area_name'],
						  'delivery_fee'=>$resp_delivery,
						  'delivery_lat'=>$resp['lat'],
						  'delivery_long'=>$resp['lng'],
						  'contact_phone'=>$resp['contact_phone']
						);						
						$db = new DbExt();
			   	        $db->updateData("{{mobile2_cart}}",$params,'cart_id',$cart_id);
			   	        unset($db);
			   	        return $params;
					}
		   		}
		   		break;
		   
		   	default:
		   		break;
		   }		   
		}
		return false;
	}	
	
	public static function GetPostalCodeList($page=0, $page_limit=10, $search_string='')
	{
		$db = new DbExt();
		$country_id = LocationWrapper::GetCountryDefault();
		
		$and='';
		if(!empty($search_string)){
   	    	$and.=" AND a.postal_code LIKE ".FunctionsV3::q("%$search_string%")." ";
   	    }
		
		if($country_id>0){			
			$stmt="
			SELECT SQL_CALC_FOUND_ROWS
			a.city_id,			
			a.name as city_name,
			a.postal_code,
			a.postal_code as postal_code_raw,
			a.state_id,
			b.name as state_name,
			b.country_id
			
			FROM  {{location_cities}} a
			LEFT JOIN {{location_states}} b
			ON
			a.state_id = b.state_id
			
			WHERE b.country_id = ".FunctionsV3::q($country_id)."
			AND postal_code !=''
			$and
			
			GROUP BY postal_code
			LIMIT $page,$page_limit
			";			
			if(isset($_GET['debug'])){
   	           dump($stmt);
   	       }
			if($res=$db->rst($stmt)){
				$total_records=0;
				$stmtc="SELECT FOUND_ROWS() as total_records";
				if ($resp=$db->rst($stmtc)){			 			
					$total_records=$resp[0]['total_records'];
				}					
				$paginate_total = ceil( $total_records / $page_limit );
					
				foreach ($res as $val) {														
				    $val['postal_code'] = mobileWrapper::highlight_word( clearString($val['postal_code_raw']) ,$search_string);
				    $data[] = $val;
				}
				
				return array(
				  'paginate_total'=>$paginate_total,
				  'list'=>$data
				);
			}
		}
		return false;
	}
	
}
/*end class*/