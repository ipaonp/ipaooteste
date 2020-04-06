<?php
class UpdateController extends CController
{
	
	public function beforeAction($action)
	{
		if(!Yii::app()->functions->isAdminLogin()){	
            Yii::app()->end();
		}		
		return true;
	}
	
	public function actionIndex()
	{					
		$DbExt = new DbExt();
		
		$table_prefix=Yii::app()->db->tablePrefix;								
		$date_default = "datetime NOT NULL DEFAULT CURRENT_TIMESTAMP";
		
		echo mt("Updating database...");
		
		if($res=$DbExt->rst("SELECT VERSION() as mysql_version")){
			$res=$res[0];			
			$mysql_version = (float)$res['mysql_version'];
			dump("MYSQL VERSION=>$mysql_version");
			if($mysql_version<=5.5){				
				$date_default="datetime NOT NULL DEFAULT '0000-00-00 00:00:00'";
			}
		}		

		/*INSET DEFAULT DATA*/	
		if(!FunctionsV3::checkIfTableExist('mobile2_device_reg')):
		    DBTableWrapper::defaultData();
		endif;
						
		/*NEW TABLE*/
		$stmt[]="		
		CREATE TABLE IF NOT EXISTS ".$table_prefix."mobile2_device_reg (
		  `id` int(14) NOT NULL,
		  `client_id` int(14) NOT NULL DEFAULT '0',
		  `device_uiid` varchar(255) NOT NULL DEFAULT '',
		  `device_id` text,
		  `device_platform` varchar(50) NOT NULL DEFAULT '',
		  `push_enabled` int(1) NOT NULL DEFAULT '1',
		  `status` varchar(100) NOT NULL DEFAULT 'active',
		  `code_version` varchar(14) NOT NULL DEFAULT '',
		  `date_created` $date_default,
		  `date_modified` $date_default,
		  `ip_address` varchar(50) NOT NULL DEFAULT ''
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		
		ALTER TABLE ".$table_prefix."mobile2_device_reg
		  ADD PRIMARY KEY (`id`),
		  ADD KEY `client_id` (`client_id`),
		  ADD KEY `device_uiid` (`device_uiid`),
		  ADD KEY `device_platform` (`device_platform`),
		  ADD KEY `status` (`status`);
		  
		ALTER TABLE ".$table_prefix."mobile2_device_reg ADD FULLTEXT KEY `device_id` (`device_id`);
				
        ALTER TABLE ".$table_prefix."mobile2_device_reg
        MODIFY `id` int(14) NOT NULL AUTO_INCREMENT;
		";			
		
	    $stmt[]="		
		CREATE TABLE IF NOT EXISTS ".$table_prefix."mobile2_broadcast (
		`broadcast_id` int(14) NOT NULL,
		`push_title` varchar(255) NOT NULL DEFAULT '',
		`push_message` varchar(255) NOT NULL DEFAULT '',
		`device_platform` varchar(100) NOT NULL DEFAULT '',
		`status` varchar(100) NOT NULL DEFAULT 'pending',
		`date_created` $date_default,
		`date_modified` $date_default,
		`ip_address` varchar(50) NOT NULL DEFAULT ''
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		
		ALTER TABLE ".$table_prefix."mobile2_broadcast
		ADD PRIMARY KEY (`broadcast_id`);
				
		ALTER TABLE ".$table_prefix."mobile2_broadcast
		MODIFY `broadcast_id` int(14) NOT NULL AUTO_INCREMENT;
		";	    	    
	    
	    $stmt[]="	    
		CREATE TABLE IF NOT EXISTS ".$table_prefix."mobile2_recent_search (
		  `id` int(11) NOT NULL,
		  `device_uiid` varchar(255) NOT NULL DEFAULT '',
		  `search_string` varchar(255) NOT NULL DEFAULT '',
		  `date_created` $date_default,
		  `ip_address` varchar(50) NOT NULL DEFAULT ''
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		
		ALTER TABLE ".$table_prefix."mobile2_recent_search
        ADD PRIMARY KEY (`id`);
        
        ALTER TABLE ".$table_prefix."mobile2_recent_search
        MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
	    ";			    
	    
	    $stmt[]="	    
		CREATE TABLE IF NOT EXISTS ".$table_prefix."mobile2_pages (
		  `page_id` int(11) NOT NULL,
		  `title` varchar(255) NOT NULL DEFAULT '',
		  `content` text,
		  `icon` varchar(100) DEFAULT '',
		  `use_html` varchar(1) NOT NULL DEFAULT '',
		  `sequence` int(14) NOT NULL DEFAULT '0',
		  `status` varchar(100) NOT NULL DEFAULT 'pending',
		  `date_created` $date_default,
		  `date_modified` $date_default,
		  `ip_address` varchar(50) NOT NULL DEFAULT ''		  
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		
		ALTER TABLE ".$table_prefix."mobile2_pages
        ADD PRIMARY KEY (`page_id`);
        
        ALTER TABLE ".$table_prefix."mobile2_pages
        MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT;
	    ";	    
	    
	    $stmt[]="	    
		CREATE TABLE IF NOT EXISTS ".$table_prefix."mobile2_push_logs (
		  `id` int(11) NOT NULL,
		  `broadcast_id` int(14) NOT NULL DEFAULT '0',
		  `trigger_id` int(14) NOT NULL DEFAULT '0',
		  `push_type` varchar(100) NOT NULL DEFAULT 'order',
		  `client_id` int(14) DEFAULT '0',
		  `client_name` varchar(255) NOT NULL DEFAULT '',
		  `device_platform` varchar(100) NOT NULL DEFAULT '',
		  `device_id` text,
		  `device_uiid` varchar(255) NOT NULL DEFAULT '',
		  `push_title` varchar(255) NOT NULL DEFAULT '',
		  `push_message` varchar(255) NOT NULL DEFAULT '',
		  `status` varchar(100) NOT NULL DEFAULT 'pending',
		  `json_response` text,
		  `date_created` $date_default,
		  `date_process` $date_default,
		  `ip_address` varchar(50) NOT NULL DEFAULT ''
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		
		ALTER TABLE ".$table_prefix."mobile2_push_logs
        ADD PRIMARY KEY (`id`);
        
        ALTER TABLE ".$table_prefix."mobile2_push_logs
        MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
	    ";	    
	    
	    $stmt[]="	    
		CREATE TABLE IF NOT EXISTS ".$table_prefix."mobile2_cart (
		  `cart_id` int(14) NOT NULL,
		  `merchant_id` int(14) NOT NULL DEFAULT '0',
		  `device_uiid` varchar(255) DEFAULT '',
		  `device_platform` varchar(50) NOT NULL DEFAULT '',
		  `cart` text,
		  `cart_count` int(14) NOT NULL DEFAULT '0',
		  `voucher_details` text,
		  `street` varchar(255) NOT NULL DEFAULT '',
		  `city` varchar(255) NOT NULL DEFAULT '',
		  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
		  `zipcode` varchar(100) NOT NULL DEFAULT '',
		  `delivery_instruction` varchar(255) NOT NULL DEFAULT '',
		  `location_name` varchar(255) NOT NULL DEFAULT '',
		  `contact_phone` varchar(50) NOT NULL DEFAULT '',
		  `date_modified` $date_default,
		  `tips` float(14,4) NOT NULL DEFAULT '0.0000',
		  `points_earn` int(14) NOT NULL DEFAULT '0',
		  `points_apply` int(14) NOT NULL DEFAULT '0',
		  `points_amount` float(14,4) NOT NULL DEFAULT '0.0000',
		  `country_code` varchar(2) NOT NULL DEFAULT '',
		  `delivery_fee` float(14,4) NOT NULL DEFAULT '0.0000',
		  `min_delivery_order` float(14,4) NOT NULL DEFAULT '0.0000',
		  `delivery_lat` varchar(50) NOT NULL DEFAULT '',
		  `delivery_long` varchar(50) NOT NULL DEFAULT '',
		  `save_address` int(1) NOT NULL DEFAULT '0'
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		
		ALTER TABLE ".$table_prefix."mobile2_cart
		ADD PRIMARY KEY (`cart_id`),
		ADD KEY `device_platform` (`device_platform`),
		ADD KEY `device_uiid` (`device_uiid`);
		
		ALTER TABLE ".$table_prefix."mobile2_cart
		MODIFY `cart_id` int(14) NOT NULL AUTO_INCREMENT;
	    ";	    
	    
	    $stmt[]="	    
		CREATE TABLE IF NOT EXISTS ".$table_prefix."mobile2_recent_location (
		  `id` int(14) NOT NULL,
		  `device_uiid` varchar(255) DEFAULT '',
		  `search_address` text,
		  `street` varchar(255) NOT NULL DEFAULT '',
		  `city` varchar(255) NOT NULL DEFAULT '',
		  `state` varchar(255) NOT NULL DEFAULT '',
		  `zipcode` varchar(255) NOT NULL DEFAULT '',
		  `location_name` varchar(255) NOT NULL DEFAULT '',
		  `latitude` varchar(100) NOT NULL DEFAULT '',
		  `longitude` varchar(100) NOT NULL DEFAULT '',
		  `date_created` $date_default,
		  `ip_address` varchar(50) NOT NULL DEFAULT ''
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		
		ALTER TABLE ".$table_prefix."mobile2_recent_location
		ADD PRIMARY KEY (`id`),
		ADD KEY `device_uiid` (`device_uiid`);
		
		ALTER TABLE ".$table_prefix."mobile2_recent_location ADD FULLTEXT KEY `search_address` (`search_address`);
				
		ALTER TABLE ".$table_prefix."mobile2_recent_location
		MODIFY `id` int(14) NOT NULL AUTO_INCREMENT;
	    ";
	    
	    $stmt[]="	    
		CREATE TABLE IF NOT EXISTS ".$table_prefix."mobile2_order_trigger (
		  `trigger_id` int(14) NOT NULL,
		  `trigger_type` varchar(100) NOT NULL DEFAULT 'order',
		  `order_id` int(14) NOT NULL DEFAULT '0',
		  `order_status` varchar(255) NOT NULL,
		  `remarks` text,
		  `language` varchar(10) NOT NULL DEFAULT 'en',
		  `status` varchar(100) NOT NULL DEFAULT 'pending',
		  `date_created` $date_default,
		  `date_process` $date_default,
		  `ip_address` varchar(50) NOT NULL DEFAULT ''
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		
		ALTER TABLE ".$table_prefix."mobile2_order_trigger
        ADD PRIMARY KEY (`trigger_id`);
        
        ALTER TABLE ".$table_prefix."mobile2_order_trigger
        MODIFY `trigger_id` int(14) NOT NULL AUTO_INCREMENT;
	    ";
	    
	   
	    /*1.3*/
	    $stmt[] = "
	    CREATE TABLE IF NOT EXISTS ".$table_prefix."mobile2_homebanner (
		  `banner_id` int(14) NOT NULL,
		  `title` varchar(255) NOT NULL DEFAULT '',
		  `banner_name` varchar(255) NOT NULL DEFAULT '',
		  `sequence` int(14) NOT NULL DEFAULT '0',
		  `status` varchar(100) NOT NULL DEFAULT 'pending',
		  `date_created` $date_default,
		  `date_modified` $date_default,
		  `ip_address` varchar(50) NOT NULL DEFAULT ''
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		
		ALTER TABLE ".$table_prefix."mobile2_homebanner
        ADD PRIMARY KEY (`banner_id`);
        
        ALTER TABLE ".$table_prefix."mobile2_homebanner
        MODIFY `banner_id` int(14) NOT NULL AUTO_INCREMENT;
	    ";
	    
	    
	    /*EXECUTE SQL*/
		$this->executeStatement($stmt);			   
	    
	    /*NEW FIELDS*/	    
		$new_field=array( 		  
		   'verify_code_requested'=>$date_default,
		   'single_app_merchant_id'=>"int(14) NOT NULL DEFAULT '0'",
		   'social_id'=>"varchar(20) NOT NULL DEFAULT ''",
		);
		$this->alterTable('client',$new_field);
				
		$new_field=array( 		  
		   'status'=>"varchar(100) NOT NULL DEFAULT 'publish'",
		   'featured_image'=>"varchar(255) NOT NULL DEFAULT ''",		   
		);
		$this->alterTable('cuisine',$new_field);
				
		$new_field=array( 		  
		   'latitude'=>"varchar(100) NOT NULL DEFAULT ''",
		   'longitude'=>"varchar(100) NOT NULL DEFAULT ''",
		);
		$this->alterTable('address_book',$new_field);
			
		$new_field=array( 		  
		   'as_anonymous'=>"varchar(1) NOT NULL DEFAULT '0'",		   
		);
		$this->alterTable('review',$new_field);
		
		$new_field=array( 		  
		   'cancel_reason'=>"text",		   
		);
		$this->alterTable('order',$new_field);
		
		$new_field=array( 		  
		   'is_read'=>"int(1) NOT NULL DEFAULT '0'",
		   'date_modified'=>"$date_default",
		);
		$this->alterTable('mobile2_push_logs',$new_field);
						
		if(FunctionsV3::checkIfTableExist('driver_task')):
			$new_field=array( 		  
			   'rating'=>"int(14) NOT NULL DEFAULT '0'",
			   'rating_comment'=>"text",
			   'rating_anonymous'=>"int(1) NOT NULL DEFAULT '0'",
			);
			$this->alterTable('driver_task',$new_field);
		endif;
		
		/*1.3*/
		$new_field=array( 		  
		   'distance'=>"varchar(15) NOT NULL DEFAULT ''",
		   'distance_unit'=>"varchar(15) NOT NULL DEFAULT ''",
		   'state_id'=>"int(14) NOT NULL DEFAULT '0'",
		   'city_id'=>"int(14) NOT NULL DEFAULT '0'",
		   'area_id'=>"int(14) NOT NULL DEFAULT '0'"
		);
		$this->alterTable('mobile2_cart',$new_field);
		
		$new_field=array( 		  
		   'latitude'=>"varchar(100) NOT NULL DEFAULT ''",
		   'longitude'=>"varchar(100) NOT NULL DEFAULT ''"		   	 
		);
		$this->alterTable('address_book_location',$new_field);
		
		/*END NEW FIELDS*/
				
		
		if(Yii::app()->functions->multipleField()){ 
			DBTableWrapper::alterTablePages();
		}		
						
	    /*VIEW TABLES*/	    
	    $stmt=array();
	    
	    $stmt[]="	    
		CREATE OR REPLACE VIEW ".$table_prefix."mobile2_device_reg_view as
		SELECT 
		a.*,
		CONCAT(b.first_name,' ',b.last_name) as full_name,
		b.last_login
		FROM
		".$table_prefix."mobile2_device_reg a
		LEFT JOIN ".$table_prefix."client b
		On
		a.client_id = b.client_id
	    ";	    
	    	    
	    if(FunctionsV3::checkIfTableExist('driver_task')):
	    $stmt[]="
		  Create OR replace view ".$table_prefix."driver_task_view as
			SELECT a.*,
			concat(b.first_name,' ',b.last_name) as driver_name,
			b.device_id,
			b.phone as driver_phone,
			b.email as driver_email,
			b.device_platform,
			b.enabled_push,
			b.location_lat as driver_lat,
			b.location_lng as driver_lng,
			b.profile_photo as driver_photo,
			c.merchant_id,
			d.restaurant_name as merchant_name,
			concat(d.street,' ',d.city,' ',d.state,' ',d.post_code) as merchant_address,
			e.team_name,
			f.sub_total,
			f.total_w_tax,
			f.delivery_charge,
			f.payment_type,
			f.status as order_status		
				
			FROM
			".$table_prefix."driver_task a
					
			LEFT JOIN ".$table_prefix."driver b
			ON
			b.driver_id=a.driver_id
			
			left join ".$table_prefix."order c
			ON 
			c.order_id=a.order_id
			
			left join ".$table_prefix."merchant d
			ON 
			d.merchant_id=c.merchant_id
			
			left join ".$table_prefix."driver_team e
			ON 
			e.team_id=a.team_id
			
			left join ".$table_prefix."order f
			ON 
			f.order_id=a.order_id			
		";		
	    endif;
	    
	    if(FunctionsV3::checkIfTableExist('review')):
	    $stmt[]="
		create OR REPLACE VIEW ".$table_prefix."view_ratings as
		select 
		merchant_id,
		SUM(rating)/COUNT(*) AS ratings,
		COUNT(*) AS review_count
		from
		".$table_prefix."review
		where
		status in ('publish','published')
		group by merchant_id
		";
	    endif;
	    
	    if(FunctionsV3::checkIfTableExist('merchant')):
	    $stmt[]="
		create OR REPLACE VIEW ".$table_prefix."view_merchant as
		select a.*,
		f.ratings,
		f.review_count
		
		from ".$table_prefix."merchant a
		
		left join ".$table_prefix."view_ratings f
		ON 
		a.merchant_id = f.merchant_id 		
		";	    	   
	    endif;
	    
	    /*EXECUTE SQL*/
		$this->executeStatement($stmt);
		
		?>
		<br/>
		<a href="<?php echo Yii::app()->createUrl("mobileappv2/")?>">
		 <?php echo mt("Update done click here to go back")?>
		</a>
		<?php
	    
	}
		
	public function addIndex($table='',$index_name='')
	{
		
		$DbExt = new DbExt();		
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
		} else echo "$index_name index exist<br>";
	}
	
	public function alterTable($table='',$new_field='')
	{		
		$DbExt = new DbExt();
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
	
	public function executeStatement($stmt=array())
	{
		$DbExt = new DbExt();
		if(is_array($stmt) && count($stmt)>=1){
			foreach ($stmt as $val) {				
				$DbExt->qry($val);
			}
		}
	}
		
}
/*end class*/