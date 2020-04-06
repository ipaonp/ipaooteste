<?php
class DatatablesWrapper
{

	public static function q($data)
	{
		return Yii::app()->db->quoteValue($data);
	}
	
	public static function format($cols=array(), $data=array())
	{
		//dump($cols);
		//dump($data);
		$resp = array();
		$resp['where']='';
		$resp['order']='';
		$resp['limit']='';
		
		$order=''; $where =''; $limit='';
		
		if(is_array($data) && count($data)>=1){
			
			if(isset($data['order'])){
				if(is_array($data['order']) && count($data['order'])>=1){
					foreach ($data['order'] as $val) {
						//dump($val);
						if(array_key_exists($val['column'], (array) $cols)){
							$order = "ORDER BY ".$cols[ $val['column'] ] ." ".$val["dir"]; 
						}
					}
				}
				if(!empty($order)){
					$resp['order']=$order;
				}
			}			
			
			if(isset($data['start']) && isset($data['length'])){
				$limit= "LIMIT ".$data['start'].",".$data['length'];
				$resp['limit']=$limit;
			} else $resp['limit']="LIMIT 0,10";
			
			
			$search_qry = '';
			if(isset($data['search'])){
				if(is_array($data['search']) && count($data['search'])>=1){
					$search_string = trim($data['search']['value']);
					if(!empty($search_string)){
						$search_qry="AND ";
						if(is_array($data['columns']) && count($data['columns'])>=1){
							$search_qry.=" (";
							foreach ($data['columns'] as $val) {
								//dump($val);
								if($val['searchable']=="true" || $val['searchable']==true ){								
									if(array_key_exists($val['data'],$cols)){
										$search_qry.= $cols[$val['data']]."  LIKE ".self::q("%".$search_string."%")." OR\n";
									}								
								}
							}
							if(!empty($search_qry)){
								$search_qry = substr($search_qry,0,-4);
							}
							$search_qry.=" )";
						}
					}
				}
				$resp['where']=$search_qry;
			}
					
		}
				
		return $resp;
	}
	
} /*end class*/