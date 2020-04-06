<?php
class UpdateController extends CController
{
	public function beforeAction($action)
	{
		if(!Yii::app()->functions->isAdminLogin() ){			
            Yii::app()->end();
		}		
		return true;
	}
	
	public function actionIndex()
	{
		$prefix=Yii::app()->db->tablePrefix;		
		$table_prefix=$prefix;
		
		$DbExt=new DbExt;
		
		$date_default = "datetime NOT NULL DEFAULT CURRENT_TIMESTAMP";
		if($res=$DbExt->rst("SELECT VERSION() as mysql_version")){
			$res=$res[0];			
			$mysql_version = (float)$res['mysql_version'];
			dump("MYSQL VERSION=>$mysql_version");
			if($mysql_version<=5.5){				
				$date_default="datetime NOT NULL DEFAULT '0000-00-00 00:00:00'";
			}
		}
				
		
		echo "Updating order table<br/>";
		$new_field=array( 
		   'request_from'=>"varchar(10) NOT NULL DEFAULT 'web'",
            'mobile_cart_details'=>"text"
		);
		$this->alterTable('order',$new_field);		
		
		$stmt="
		CREATE TABLE IF NOT EXISTS ".$table_prefix."mobile_registered (
		  `id` int(14) NOT NULL AUTO_INCREMENT,
		  `client_id` int(14) NOT NULL DEFAULT '0',
		  `device_platform` varchar(255) NOT NULL DEFAULT '',
		  `device_id` text,
		  `enabled_push` int(1) NOT NULL DEFAULT '1',
		  `country_code_set` varchar(3) NOT NULL DEFAULT '',
		  `date_created` $date_default,
		  `date_modified` $date_default,
		  `ip_address` varchar(50) NOT NULL DEFAULT '',
		  `status` varchar(255) NOT NULL DEFAULT 'active',
		  PRIMARY KEY (`id`),
		  KEY `client_id` (`client_id`),
          KEY `enabled_push` (`enabled_push`),
          KEY `device_platform` (`device_platform`)
		) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
		";		
		echo "Creating Table mobile_registered..<br/>";	
		$DbExt->qry($stmt);
		echo "(Done)<br/>";    
		
		$stmt="
		CREATE TABLE IF NOT EXISTS ".$table_prefix."mobile_push_logs (
		  `id` int(14) NOT NULL AUTO_INCREMENT,
		  `client_id` int(14) NOT NULL DEFAULT '0',
		  `client_name` varchar(255) NOT NULL DEFAULT '',
		  `device_platform` varchar(100) NOT NULL DEFAULT '',
		  `device_id` text ,
		  `push_title` varchar(255) NOT NULL DEFAULT '',
		  `push_message` varchar(255) NOT NULL DEFAULT '',
		  `push_type` varchar(100) NOT NULL DEFAULT 'order',
		  `status` varchar(255) NOT NULL DEFAULT 'pending',
		  `json_response` text,
		  `date_created` $date_default,
		  `date_process` $date_default,
		  `ip_address` varchar(50) NOT NULL DEFAULT '',
		  `broadcast_id` int(14) NOT NULL DEFAULT '0',
		  PRIMARY KEY (`id`),
		  KEY `device_platform` (`device_platform`),
          KEY `push_type` (`push_type`),
          KEY `status` (`status`)
		) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
		";		
		echo "Creating Table mobile_push_logs..<br/>";	
		$DbExt->qry($stmt);		
		echo "(Done)<br/>";      
				
		$stmt="		
		CREATE TABLE IF NOT EXISTS ".$table_prefix."mobile_temp_email (
		  `id` int(14) NOT NULL AUTO_INCREMENT,
		  `order_id` int(14) NOT NULL DEFAULT '0',
		  `client_email` varchar(255) NOT NULL DEFAULT '',
		  `receipt_sender` varchar(255) NOT NULL DEFAULT '',
		  `receipt_subject` varchar(255) NOT NULL DEFAULT '',
		  `tpl` text,
		  `email_type` varchar(100) NOT NULL DEFAULT 'client',
		  `merchant_id` int(14) NOT NULL DEFAULT '0',
		  `client_id` int(14) NOT NULL DEFAULT '0',
		  `client_name` varchar(255) NOT NULL DEFAULT '',
		  `gateway` varchar(255) NOT NULL DEFAULT '',
		  `status` varchar(100) NOT NULL DEFAULT 'pending',
		  UNIQUE KEY `id` (`id`),
		  KEY `order_id` (`order_id`),
		  KEY `status` (`status`)
		) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
		";
		echo "Creating Table mobile_temp_email..<br/>";	
		$DbExt->qry($stmt);		
		echo "(Done)<br/>";
							
		$stmt="				
		CREATE TABLE IF NOT EXISTS ".$table_prefix."mobile_broadcast (
		  `broadcast_id` int(14) NOT NULL AUTO_INCREMENT,
		  `push_title` varchar(255) NOT NULL DEFAULT '',
		  `push_message` varchar(255) NOT NULL DEFAULT '',
		  `device_platform` int(14) NOT NULL DEFAULT '1',
		  `status` varchar(255) NOT NULL DEFAULT 'pending',
		  `date_created` $date_default,
		  `ip_address` varchar(50) NOT NULL DEFAULT '',
		  PRIMARY KEY (`broadcast_id`)
		) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
		";
		echo "Creating Table mobile_broadcast..<br/>";	
		$DbExt->qry($stmt);		
		echo "(Done)<br/>";
			
		echo "Updating table mobile_push_logs<br/>";
		$new_field=array( 
		   'broadcast_id'=>"int(14) NOT NULL DEFAULT '0'"
		);
		$this->alterTable('mobile_push_logs',$new_field);	
		
		echo "Updating table mobile_registered<br/>";
		$new_field=array( 
		   'status'=>"varchar(255) NOT NULL DEFAULT 'active'"
		);
		$this->alterTable('mobile_registered',$new_field);		
				
		$stmt="				
		CREATE TABLE IF NOT EXISTS ".$table_prefix."mobile_cart (
		  `device_id` varchar(255) NOT NULL DEFAULT '',
          `cart` text,
          KEY `device_id` (`device_id`)
		) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
		";
		echo "Creating Table mobile_cart..<br/>";	
		$DbExt->qry($stmt);		
		echo "(Done)<br/>";
				
		echo "Updating table order_delivery_address<br/>";
		$new_field=array( 
		   'formatted_address'=>"text",
		   'google_lat'=>"varchar(50) NOT NULL DEFAULT ''",
		   'google_lng'=>"varchar(50) NOT NULL DEFAULT ''",
		);
		$this->alterTable('order_delivery_address',$new_field);		
								
		$stmt="
		CREATE TABLE IF NOT EXISTS ".$table_prefix."receive_post (
			  `id` int(14) NOT NULL,
			  `payment_type` varchar(20) NOT NULL DEFAULT '',
			  `receive_post` text,
			  `receive_get` text,
			  `status` text,
			  `date_created` $date_default,
			  `ip_address` varchar(50) NOT NULL
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;

		ALTER TABLE ".$table_prefix."receive_post
	    ADD PRIMARY KEY (`id`);
	
	    ALTER TABLE ".$table_prefix."receive_post
	    MODIFY `id` int(14) NOT NULL AUTO_INCREMENT;
		";
		
		echo "Creating Table receive_post..<br/>";	
		$DbExt->qry($stmt);		
		echo "(Done)<br/>";
		
		$DbExt->qry(
		"ALTER TABLE ".$table_prefix."receive_post CHANGE `payment_type` `payment_type` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''"
		); 
		
		echo "Updating table receive_post<br/>";
		$new_field=array( 
		   'receive_get'=>"text",		   
		);
		$this->alterTable('receive_post',$new_field);		
					
	    $stmt="			
		CREATE TABLE IF NOT EXISTS ".$table_prefix."mobile_pages (
		  `page_id` int(14) NOT NULL AUTO_INCREMENT,
		  `title` varchar(255) NOT NULL DEFAULT '',
		  `content` text ,
		  `icon` varchar(100) NOT NULL DEFAULT '',
		  `sequence` int(14) NOT NULL DEFAULT '0',
		  `use_html` int(1) NOT NULL DEFAULT '1',
		  `status` varchar(255) NOT NULL DEFAULT 'pending',
		  `date_created` $date_default,
		  `date_modified` $date_default,
		  `ip_address` varchar(50) NOT NULL DEFAULT '',
		   PRIMARY KEY (`page_id`)	  
		) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
		";				
	    //dump($stmt);		
		echo "Creating Table mobile_pages..<br/>";
		$DbExt->qry($stmt);		
		echo "(Done)<br/>";
		
		$this->addIndex('mobile_pages','status');
		$this->addIndex('mobile_pages','sequence');
		
		/*UPDATE PAGES WITH LANGUAGE FILE FIELD*/
		$enabled_multiple_translation = getOptionA('enabled_multiple_translation');
		if ($enabled_multiple_translation==2){
			DBTableManager::alterTablePages();
		}
				
		echo "Updating table offers<br/>";		
		$new_field=array( 		  
		   'applicable_to'=>"varchar(100) NOT NULL DEFAULT 'all'",		  
		);
		$this->alterTable('offers',$new_field);
		
		
		/*2.6*/
		echo "Updating table mobile_registered<br/>";		
		$new_field=array( 		  
		   'app_version'=>"float(14,2) NOT NULL DEFAULT '2.50'",
		);
		$this->alterTable('mobile_registered',$new_field);		
		
		/*VIEW TABLE*/		
		$stmt="
		CREATE OR REPLACE VIEW ".$table_prefix."mobile_registered_view as
		select a.*,
		concat(b.first_name,' ',b.last_name) as client_name
		FROM
		".$table_prefix."mobile_registered a
		left join ".$table_prefix."client b
		ON
		a.client_id=b.client_id		
		";
		echo "Creating View mobile_registered_view..<br/>";	
		$DbExt->qry($stmt);		
		echo "(Done)<br/>";     
		
		echo "(FINISH)<br/>";    
		
	} /*end index*/
	
	public function addIndex($table='',$index_name='')
	{
		$DbExt=new DbExt;
		$prefix=Yii::app()->db->tablePrefix;		
		
		$table=$prefix.$table;
		
		$stmt="
		SHOW INDEX FROM $table
		";		
		$found=false;
		if ( $res=$DbExt->rst($stmt)){
			foreach ($res as $val) {				
				if ( $val['Key_name']==$index_name){
					$found=true;
					break;
				}
			}
		} 
		
		if ($found==false){
			echo "create index<br>";
			$stmt_index="ALTER TABLE $table ADD INDEX ( $index_name ) ";
			dump($stmt_index);
			$DbExt->qry($stmt_index);
			echo "Creating Index $index_name on $table <br/>";		
            echo "(Done)<br/>";		
		} else echo 'index exist<br>';
	}
	
	public function alterTable($table='',$new_field='')
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
					echo "Creating field $key_new <br/>";
					$stmt_alter="ALTER TABLE ".$prefix."$table ADD $key_new ".$new_field[$key_new];
					dump($stmt_alter);
				    if ($DbExt->qry($stmt_alter)){
					   echo "(Done)<br/>";
				   } else echo "(Failed)<br/>";
				} else echo "Field $key_new already exist<br/>";
			}
		}
	}	
	
} /*end class*/