<?php
class DBTableWrapper
{
	public function __construct()
	{		
	}	
	
	public static function getLangList()
	{
		$lang=array();
		if ($res=FunctionsV3::getLanguageList(false)){
			foreach ($res as $val) {
				$val=str_replace(" ","_",$val);
				$lang[]=$val;
			}				
		}
		return $lang;
	}
	
	public static function alterTablePages()
	{
		if ($res=FunctionsV3::getLanguageList(false)){
			foreach ($res as $val) {		
				$val=str_replace(" ","_",$val);
				$new_field=array(
				  "title_$val"=>"varchar(255) NOT NULL DEFAULT ''",
				  "content_$val"=>"text",
				);
				self::alterTable("mobile2_pages",$new_field);
			}			
		}
	}
	
	public static function alterTable($table='',$new_field='')
	{
		$DbExt=new DbExt;
		$prefix=Yii::app()->db->tablePrefix;		
		$existing_field=array();
		if ( $res = Yii::app()->functions->checkTableStructure($table)){
			foreach ($res as $val) {								
				$existing_field[$val['Field']]=$val['Field'];
			}			
			foreach ($new_field as $key_new=>$val_new) {				
				if (!in_array($key_new,$existing_field)){
					//echo "Creating field $key_new <br/>";
					$stmt_alter="ALTER TABLE ".$prefix."$table ADD $key_new ".$new_field[$key_new];
					//dump($stmt_alter);
				    if ($DbExt->qry($stmt_alter)){
					   //echo "(Done)<br/>";
				   } //else echo "(Failed)<br/>";
				} //else echo "Field $key_new already exist<br/>";
			}
		}
	}	
	
	public static function defaultData()
	{
		$DbExt=new DbExt;			
		$data[] = array(		  
		  'option_name'=>'mobile2_home_cuisine',
		  'option_value'=>1
		);
		$data[] = array(		  
		  'option_name'=>'mobile2_home_all_restaurant',
		  'option_value'=>1
		);
		$data[] = array(		  
		  'option_name'=>'mobileapp2_merchant_list_type',
		  'option_value'=>1
		);
		$data[] = array(		  
		  'option_name'=>'mobileapp2_merchant_menu_type',
		  'option_value'=>3
		);
		$data[] = array(		  
		  'option_name'=>'mobileapp2_distance_results',
		  'option_value'=>1
		);
		$data[] = array(		  
		  'option_name'=>'mobile2_search_data',
		  'option_value'=>'{\"1\":\"open_tag\",\"2\":\"review\",\"3\":\"cuisine\",\"5\":\"minimum_order\",\"6\":\"distace\",\"8\":\"delivery_fee\"}'
		);		
		$data[] = array(		  
		  'option_name'=>'mobileapp2_order_processing',
		  'option_value'=>'[\"pending\",\"paid\",\"accepted\",\"acknowledged\",\"started\",\"inprogress\"]'
		);
		$data[] = array(		  
		  'option_name'=>'mobileapp2_order_completed',
		  'option_value'=>'[\"delivered\",\"successful\"]'
		);
		$data[] = array(		  
		  'option_name'=>'mobileapp2_order_cancelled',
		  'option_value'=>'[\"cancelled\",\"decline\",\"failed\"]'
		);
		
		foreach ($data as $params) {
			$DbExt->insertData("{{option}}",$params);
		}
		unset($DbExt);
	}
	
} /*end class*/