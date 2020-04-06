<?php
class ApiController extends CController
{	
	public $data;
	public $code=2;
	public $msg='';
	public $details='';
	
	public function __construct()
	{
		$this->data=$_GET;
		
		$website_timezone=Yii::app()->functions->getOptionAdmin("website_timezone");		 
	    if (!empty($website_timezone)){
	 	   Yii::app()->timeZone=$website_timezone;
	    }		 
	    	   
	    FunctionsV3::handleLanguage();
	    $lang=Yii::app()->language;	    	   
	    if(isset($_GET['debug'])){
	       //dump($lang);
	    }
	}
	
	public function beforeAction($action)
	{				
		/*check if there is api has key*/		
		
		/*$action=Yii::app()->controller->action->id;				
		if(isset($this->data['api_key'])){
			if(!empty($this->data['api_key'])){			   
			   $continue=true;
			   if($action=="getLanguageSettings" || $action=="registerMobile"){
			   	  $continue=false;
			   }
			   if($continue){
			   	   $key=getOptionA('merchant_app_hash_key');
				   if(trim($key)!=trim($this->data['api_key'])){
				   	 $this->msg=$this->t("api hash key is not valid");
			         $this->output();
			         Yii::app()->end();
				   }
			   }			
			}
		}*/
		
		$action=Yii::app()->controller->action->id;	
		$key=getOptionA('merchant_app_hash_key');		
		if(!empty($key)){
		   $continue=true;
		   if($action=="getLanguageSettings" || $action=="registerMobile"){
		   	  $continue=false;
		   }
		   if($continue){
		   	  $this->data['api_key']=isset($this->data['api_key'])?$this->data['api_key']:'';
		   	  if(trim($key)!=trim($this->data['api_key'])){
		   	  	 $this->msg=$this->t("api hash key is not valid");
			     $this->output();
			     Yii::app()->end();
		   	  }
		   }
		}
		return true;
	}	
	
	public function actionIndex(){
		//throw new CHttpException(404,'The specified url cannot be found.');
	}		
	
	private function q($data='')
	{
		return Yii::app()->db->quoteValue($data);
	}
	
	private function t($message='')
	{
		//return Yii::t("default",$message);		
		return Yii::t("merchantapp-backend",$message);
	}
		
    private function output()
    {
    	
       if (!isset($this->data['debug'])){    		
       	  header('Access-Control-Allow-Origin: *');
          header('Content-type: application/javascript;charset=utf-8');
       } 
       
	   $resp=array(
	     'code'=>$this->code,
	     'msg'=>$this->msg,
	     'details'=>$this->details,
	     'request'=>json_encode($this->data)		  
	   );		   
	   if (isset($this->data['debug'])){
	   	   dump($resp);
	   }
	   
	   if (!isset($_GET['callback'])){
  	   	   $_GET['callback']='';
	   }    
	   
	   if (isset($_GET['json']) && $_GET['json']==TRUE){
	   	   echo CJSON::encode($resp);
	   } else echo $_GET['callback'] . '('.CJSON::encode($resp).')';		    	   	   	  
	   Yii::app()->end();
    }	
    
    public function actionLogin()
    {
        $Validator=new Validator;
		$req=array(
		  'username'=>$this->t("username is required"),
		  'password'=>$this->t("password is required"),
		  'merchant_device_id'=>$this->t("Device id is required"),
		  'device_platform'=>$this->t("Device Platform is required"),
		);
		$Validator->required($req,$this->data);
		if ($Validator->validate()){
			if ( $res=merchantApp::login($this->data['username'],md5($this->data['password']))){				
								
				//dump($res);
				
				$params=array(
				  'merchant_id'=>$res['merchant_id'],
				  'merchant_user_id'=>isset($res['merchant_user_id'])?$res['merchant_user_id']:0,
				  'user_type'=>$res['user_type'],
				  'device_platform'=>$this->data['device_platform'],
				  'device_id'=>$this->data['merchant_device_id'],
				  'enabled_push'=>1,
				  'date_created'=>FunctionsV3::dateNow(),
				  'ip_address'=>$_SERVER['REMOTE_ADDR'],						  
				);						
				
				if ($res['status']=="active" || $res['status']=="expired"){
					
					$DbExt=new DbExt;
					
					if ( $resp=merchantApp::getMerchantDeviceInfoByType($res['user_type'] , 
					     $res['merchant_id'],
					     $params['merchant_user_id']
					      )){	
												
						if ($res['user_type']=="admin"){
							$sql_delete = "DELETE FROM
							{{mobile_device_merchant}}
							WHERE
							user_type=".self::q($res['user_type'])."
							AND
							merchant_id=".self::q($res['merchant_id'])."
							";
						} else {
							$sql_delete = "DELETE FROM
							{{mobile_device_merchant}}
							WHERE
							user_type=".self::q($res['user_type'])."
							AND
							merchant_id=".self::q($res['merchant_id'])."
							AND 
							merchant_user_id =".self::q($params['merchant_user_id'])."
							";
						}						
						
						if (count($resp)>=2){
							$DbExt->qry($sql_delete);							
							if(!$DbExt->insertData("{{mobile_device_merchant}}",$params)){
								$this->msg=$this->t("Failed cannot insert records");
								$this->output();
							}
						
						} else {
							
							$record_id=$resp[0]['id'];							
							unset($params['enabled_push']);
							unset($params['date_created']);		
							$params['date_modified']=FunctionsV3::dateNow();
																				
							if(!$DbExt->updateData("{{mobile_device_merchant}}",$params,'id',$record_id)){
								$this->msg=$this->t("Failed cannot update records");
								$this->output();
							}
						}																		
												
					} else {						
						if(!$DbExt->insertData("{{mobile_device_merchant}}",$params)){
							$this->msg=$this->t("Failed cannot insert records");
							$this->output();
						}
					}
					
					$this->msg=$this->t("Successul");
					$this->code=1;
					$this->details=array(
					  'token'=>$res['token'],
					  'info'=>array(
					    'username'=>$res['username'],
					    'restaurant_name'=>isset($res['restaurant_name'])?$res['restaurant_name']:'',					    
					    'contact_email'=>$res['contact_email'],
					    'user_type'=>$res['user_type'],
					    'merchant_id'=>$res['merchant_id'],
					    'merchant_user_id'=>$params['merchant_user_id']
					  )
					);
				} else $this->msg=$this->t("Login Failed. You account status is")." ".$res['status'];
			} else $this->msg=$this->t("either username or password is invalid");
		} else $this->msg=merchantApp::parseValidatorError($Validator->getError());	    	
		$this->output();
    }
    
    public function actionGetTodaysOrder()
    {    	
    	
    	$Validator=new Validator;
		$req=array(
		  'token'=>$this->t("token is required"),
		  'mtid'=>$this->t("merchant id is required"),
		  'user_type'=>$this->t("user type is required"),
		);
		$Validator->required($req,$this->data);
		if ($Validator->validate()){
			if ( $res=merchantApp::validateToken($this->data['mtid'],
			    $this->data['token'],$this->data['user_type'])){
			    				    			   
			    /*SET MERCHANT TIMEZONE*/
			    merchantApp::setMerchantTimeZone($this->data['mtid']);		
			    	
			    $DbExt=new DbExt;	
				$stmt="
				SELECT a.*,
				(
				select concat(first_name,' ',last_name)
				from 
				{{client}}
				where
				client_id=a.client_id
				limit 0,1				
				) as customer_name
				
				FROM
				{{order}} a
				WHERE
				merchant_id=".$this->q($res['merchant_id'])."				
				AND
				date_created LIKE '".date("Y-m-d")."%'						
				AND 
				status NOT IN ('initial_order')					
				AND 
				request_cancel='2'
				ORDER BY date_created DESC
				LIMIT 0,100
				";				
				if ( $res=$DbExt->rst($stmt)){					
					$this->code=1; $this->msg="OK";					
					foreach ($res as $val) {							
						$data[]=array(						  
						  'order_id'=>$val['order_id'],
						  'viewed'=>$val['viewed'],
						  'status_raw'=>strtolower($val['status']),
						  'status'=>merchantApp::t($val['status']),			
						  'trans_type_raw'=>$val['trans_type'],			  
						  'trans_type'=>merchantApp::t($val['trans_type']),						  
						  'total_w_tax'=>$val['total_w_tax'],						  
						  'total_w_tax_prety'=>merchantApp::prettyPrice($val['total_w_tax']),
						  'transaction_date'=>Yii::app()->functions->FormatDateTime($val['date_created'],true),
						  'transaction_time'=>Yii::app()->functions->timeFormat($val['date_created'],true),
						  'delivery_time'=>Yii::app()->functions->timeFormat($val['delivery_time'],true),
						  'delivery_asap_raw'=>$val['delivery_asap'],
						  'delivery_asap'=>$val['delivery_asap']==1?merchantApp::t("ASAP"):'',
						  'delivery_date'=>Yii::app()->functions->FormatDateTime($val['delivery_date'],false),
						  'customer_name'=>!empty($val['customer_name'])?$val['customer_name']:$this->t('No name')
						);
					}					
					
					$unopen_count = 0;
					$unopen_resp = merchantApp::getUnOpenOrder($this->data['mtid']);					
					if($unopen_resp){						
						$unopen_count = $unopen_resp['total_unopen'];
					}
										
					
					$this->code=1;
					$this->msg="OK";
					$this->details=array(
					  'data'=>$data,
					  'total_order'=>count($data),
					  'unopen_count'=>$unopen_count
					);
				} else $this->msg=$this->t("no current orders");
			} else {
				$this->code=3;
				$this->msg=$this->t("you session has expired or someone login with your account");
			}
		} else $this->msg=merchantApp::parseValidatorError($Validator->getError());	    	
		$this->output();    	    
    }
    
    public function actionGetPendingOrders()
    {    	    
    	$Validator=new Validator;
		$req=array(
		  'token'=>$this->t("token is required"),
		  'mtid'=>$this->t("merchant id is required"),
		  'user_type'=>$this->t("user type is required"),
		);
		$Validator->required($req,$this->data);
		if ($Validator->validate()){
			if ( $res=merchantApp::validateToken($this->data['mtid'],
			    $this->data['token'],$this->data['user_type'])){
			    	
			    $_in="'pending'";
			    $pending_tabs=getOptionA('merchant_app_pending_tabs');
				if(!empty($pending_tabs)){
				   $pending_tabs=json_decode($pending_tabs,true);
				   if(is_array($pending_tabs) && count($pending_tabs)>=1){
				   	  $_in='';
				   	  foreach ($pending_tabs as $key=>$val) {
				   	      $_in.="'$val',";
				   	  }
				   	  $_in=substr($_in,0,-1);
				   }
				}		
								
			    $DbExt=new DbExt;	
				$stmt="
				SELECT a.*,				
				(
				select concat(first_name,' ',last_name)
				from 
				{{client}}
				where
				client_id=a.client_id
				limit 0,1				
				) as customer_name

				FROM
				{{order}} a
				WHERE
				merchant_id=".$this->q($res['merchant_id'])."
				AND
				status IN ($_in)			
				AND request_cancel='2'				
				ORDER BY date_created DESC
				LIMIT 0,100
				";
				if(isset($_GET['debug'])){
					dump($stmt);
				}
				if ( $res=$DbExt->rst($stmt)){					
					$this->code=1; $this->msg="OK";					
					foreach ($res as $val) {						
						$data[]=array(
						  'order_id'=>$val['order_id'],
						  'viewed'=>$val['viewed'],
						  'status'=>t($val['status']),
						  'status_raw'=>strtolower($val['status']),
						  'trans_type'=>t($val['trans_type']),
						  'trans_type_raw'=>$val['trans_type'],
						  'total_w_tax'=>$val['total_w_tax'],						  
						  'total_w_tax_prety'=>merchantApp::prettyPrice($val['total_w_tax']),
						  'transaction_date'=>Yii::app()->functions->FormatDateTime($val['date_created'],true),
						  'transaction_time'=>Yii::app()->functions->timeFormat($val['date_created'],true),
						  'delivery_time'=>Yii::app()->functions->timeFormat($val['delivery_time'],true),
						  'delivery_asap'=>$val['delivery_asap']==1?merchantApp::t("ASAP"):'',
						  'delivery_asap_raw'=>$val['delivery_asap'],
						  'delivery_date'=>Yii::app()->functions->FormatDateTime($val['delivery_date'],false),
						  'customer_name'=>!empty($val['customer_name'])?$val['customer_name']:$this->t('No name')
						);
					}					
					$this->code=1;
					$this->msg="OK";
					$this->details=$data;
				} else $this->msg=$this->t("no pending orders");
			} else {
				$this->code=3;
				$this->msg=$this->t("you session has expired or someone login with your account");
			}
		} else $this->msg=merchantApp::parseValidatorError($Validator->getError());	    	
		$this->output();    	    
    }    
    
    public function actionGetAllOrders()
    {
    	$Validator=new Validator;
		$req=array(
		  'token'=>$this->t("token is required"),
		  'mtid'=>$this->t("merchant id is required"),
		  'user_type'=>$this->t("user type is required"),
		);
		$Validator->required($req,$this->data);
		if ($Validator->validate()){
			if ( $res=merchantApp::validateToken($this->data['mtid'],
			    $this->data['token'],$this->data['user_type'])){
			    	
			    $DbExt=new DbExt;
				$stmt="
				SELECT a.*,

				(
				select concat(first_name,' ',last_name)
				from 
				{{client}}
				where
				client_id=a.client_id
				limit 0,1				
				) as customer_name
				
				FROM
				{{order}} a
				WHERE
				merchant_id=".$this->q($res['merchant_id'])."	
				AND status NOT IN ('initial_order')			
				ORDER BY date_created DESC
				LIMIT 0,100
				";			
				if ( $res=$DbExt->rst($stmt)){					
					$this->code=1; $this->msg="OK";					
					foreach ($res as $val) {						
						$data[]=array(
						  'order_id'=>$val['order_id'],
						  'viewed'=>$val['viewed'],
						  'status'=>merchantApp::t($val['status']),
						  'status_raw'=>strtolower($val['status']),
						  'trans_type'=>merchantApp::t($val['trans_type']),
						  'trans_type_raw'=>$val['trans_type'],
						  'total_w_tax'=>$val['total_w_tax'],						  
						  'total_w_tax_prety'=>merchantApp::prettyPrice($val['total_w_tax']),
						  'transaction_date'=>Yii::app()->functions->FormatDateTime($val['date_created'],true),
						  'transaction_time'=>Yii::app()->functions->timeFormat($val['date_created'],true),
						  'delivery_time'=>Yii::app()->functions->timeFormat($val['delivery_time'],true),
						  'delivery_asap'=>$val['delivery_asap']==1?merchantApp::t("ASAP"):'',
						  'delivery_asap_raw'=>$val['delivery_asap'],
						  'delivery_date'=>Yii::app()->functions->FormatDateTime($val['delivery_date'],false),
						  'customer_name'=>!empty($val['customer_name'])?$val['customer_name']:$this->t('No name')
						);
					}					
					$this->code=1;
					$this->msg="OK";
					$this->details=$data;
				} else $this->msg=$this->t("no orders found");
			} else {
				$this->code=3;
				$this->msg=$this->t("you session has expired or someone login with your account");
			}
		} else $this->msg=merchantApp::parseValidatorError($Validator->getError());	    	
		$this->output();    	    
    }
    
    public function actionOrderdDetails()
    {        
    	    	    	
        $Validator=new Validator;
		$req=array(
		  'token'=>$this->t("token is required"),
		  'mtid'=>$this->t("merchant id is required"),
		  'user_type'=>$this->t("user type is required"),
		  'order_id'=>$this->t("order id is required")
		);
		$Validator->required($req,$this->data);
		if ($Validator->validate()){
			if ( $res=merchantApp::validateToken($this->data['mtid'],
			    $this->data['token'],$this->data['user_type'])){
			    	
			    if ( $data=Yii::app()->functions->getOrder2($this->data['order_id'])){
			    	//dump($data);
			    	$json_details=!empty($data['json_details'])?json_decode($data['json_details'],true):false;
			    	
			    	Yii::app()->functions->displayOrderHTML(
			    	array(
			    	   'order_id'=>$data['order_id'],
					   'merchant_id'=>$data['merchant_id'],
					   'delivery_type'=>$data['trans_type'],
					   'delivery_charge'=>$data['delivery_charge'],
					   'packaging'=>$data['packaging'],
					   'cart_tip_value'=>$data['cart_tip_value'],
					   'cart_tip_percentage'=>$data['cart_tip_percentage']/100,
					   'card_fee'=>$data['card_fee'],
					   'tax'=>$data['tax'],
					   'points_discount'=>isset($data['points_discount'])?$data['points_discount']:'' /*POINTS PROGRAM*/,
					   'voucher_amount'=>$data['voucher_amount'],
					   'voucher_type'=>$data['voucher_type']
					  ),
					  $json_details,true,$data['order_id']);
					  
					  if ( Yii::app()->functions->code==1){					  	  
					  	  $data_raw=Yii::app()->functions->details['raw'];						 
					  	  //dump($data_raw);
					  	  
					  	  $data_raw['html']=Yii::app()->functions->details['html'];
					  	  
					  	 
					  	  $sub_total=$data_raw['total']['subtotal'];
					  	  
						  $data_raw['total']['subtotal']=merchantApp::prettyPrice($data_raw['total']['subtotal']);
						  $data_raw['total']['subtotal1']=$data['sub_total'];
						  $data_raw['total']['subtotal2']=merchantApp::prettyPrice($data['sub_total']);
						  
						  $data_raw['total']['taxable_total']=merchantApp::prettyPrice($data['taxable_total']);
						  $data_raw['total']['delivery_charges']=merchantApp::prettyPrice($data_raw['total']['delivery_charges']);
						  
						  $data_raw['total']['total']=merchantApp::prettyPrice($data['total_w_tax']);
						  						  
						  $data_raw['total']['tax_amt']=$data_raw['total']['tax_amt']."%";
						  $data_raw['total']['merchant_packaging_charge']=merchantApp::prettyPrice($data_raw['total']['merchant_packaging_charge']);
						  						 						  
						  if ($data['order_change']>0){
						     $data_raw['total']['order_change']= merchantApp::prettyPrice($data['order_change']);
						  }
						  
						  //dump($data);
						  if ($data['voucher_amount']>0){
						  	  if ( $data['voucher_type']=="percentage"){
						  	  	  $data_raw['total']['voucher_percentage']=number_format($data['voucher_amount'],0)."%";
						  	  	  $data['voucher_amount']=$sub_total * ($data['voucher_amount']/100);
						  	  }						  	  
						      $data_raw['total']['voucher_amount']=$data['voucher_amount'];
						      $data_raw['total']['voucher_amount1']=merchantApp::prettyPrice($data['voucher_amount']);
						      												      
						      $data_raw['total']['voucher_type']=$data['voucher_type'];						      
						  }
						  
						  if ($data['discounted_amount']>0){
						  	 $data_raw['total']['discounted_amount']=$data['discounted_amount'];
						  	 $data_raw['total']['discounted_amount1']=merchantApp::prettyPrice($data['discounted_amount']);
						  	 $data_raw['total']['discount_percentage']=number_format($data['discount_percentage'],0)."%";
						  	 $data_raw['total']['subtotal']=merchantApp::prettyPrice($data['sub_total']+$data['voucher_amount']);						  	 
						  }		
						  
						  /*less points_discount*/						  
						  if (isset($data['points_discount'])){						  	 
						  	 if ( $data['points_discount']>0){						  	 	
						  	 	$data_raw['total']['points_discount']=$data['points_discount'];
						  	 	$data_raw['total']['points_discount1']=merchantApp::prettyPrice($data['points_discount']);						  	 	
						  	 	$data_raw['total']['subtotal']=merchantApp::prettyPrice($data['sub_total']);
						  	 }						  
						  }			
						  						  
						  /*tips*/						  
						  if ( $data['cart_tip_value']>0){						  	  
						  	  $data_raw['total']['cart_tip_value']=$data['cart_tip_value'];
						  	  $data_raw['total']['cart_tip_value']=merchantApp::prettyPrice($data['cart_tip_value']);
						  	  $data_raw['total']['cart_tip_percentage']=number_format($data['cart_tip_percentage'],0)."%";
						  }					  
						  
						  $pos = Yii::app()->functions->getOptionAdmin('admin_currency_position'); 
						  $data_raw['currency_position']=$pos;					  
						  
						  $delivery_date=$data['delivery_date'];
						  						  						  
						  $data_raw['transaction_date']	= Yii::app()->functions->FormatDateTime($data['date_created']);						          
						  $data_raw['delivery_date'] = Yii::app()->functions->FormatDateTime($delivery_date,false);
						  //$data_raw['delivery_time'] = $data['delivery_time'];
						  
						  $data_raw['delivery_time'] = Yii::app()->functions->timeFormat($data['delivery_time'],true);
						  $data_raw['delivery_asap_raw'] = $data['delivery_asap'];
						  $data_raw['delivery_asap'] = $data['delivery_asap']==1?t("Yes"):"";
						  
						  $data_raw['status_raw']=strtolower($data['status']);
						  $data_raw['status']= $this->t($data['status']);		
						  				  
						  $data_raw['trans_type_raw']=$data['trans_type'];
						  $data_raw['trans_type']=t($data['trans_type']);				
						  
						  $data_raw['payment_type_raw']=strtoupper($data['payment_type']);		  
						  $data_raw['payment_type']=strtoupper(t($data['payment_type']));
						  $data_raw['viewed']=$data['viewed'];
						  $data_raw['order_id']=$data['order_id'];
						  $data_raw['payment_provider_name']=$data['payment_provider_name'];
						  
						  $data_raw['delivery_instruction']=$data['delivery_instruction'];
						  
						  $data_raw['dinein_number_of_guest']=$data['dinein_number_of_guest'];
						  $data_raw['dinein_special_instruction']=$data['dinein_special_instruction'];
						  $data_raw['dinein_table_number']=$data['dinein_table_number'];						  
						  
						  
						  $data_raw['client_info']=array(
						    'full_name'=>$data['full_name'],
						    'email_address'=>$data['email_address'],
						    'address'=>$data['client_full_address'],
						    'location_name'=>$data['location_name1'],
						    'contact_phone'=>$data['contact_phone']
						  );			
						  						  
						  if ( $data['trans_type']=="delivery"){		
						  	  if (!empty($data['contact_phone1'])){
						  	  	  $data_raw['client_info']['contact_phone']=$data['contact_phone1'];
						  	  }						  	  
						  }
						  
						  if ( $data['trans_type']=="delivery"){
						  	  if($delivery_info=merchantApp::getDeliveryAddressByOrderID($this->data['order_id'])){
						  	  	 if(isset($delivery_info['google_lat'])){
						  	  	 	if(!empty($delivery_info['google_lat'])){						  	  	 		
						  	  	 		$data_raw['client_info']['delivery_lat']=$delivery_info['google_lat'];
						  	  	 		$data_raw['client_info']['delivery_lng']=$delivery_info['google_lng'];
						  	  	 		//$data_raw['client_info']['address']=$delivery_info['formatted_address'];
						  	  	 	} else {
						  	  	 		$res_lat=Yii::app()->functions->geodecodeAddress($data['client_full_address']);
						  	  	 		if ($res_lat){
						  	  	 			$data_raw['client_info']['delivery_lat']=$res_lat['lat'];
						  	  	 		    $data_raw['client_info']['delivery_lng']=$res_lat['long']; 
						  	  	 		} else {
						  	  	 			$data_raw['client_info']['delivery_lat']=0;
						  	  	 		    $data_raw['client_info']['delivery_lng']=0;
						  	  	 		}
						  	  	 	}
						  	  	 }
						  	  }
						  }
						  
						  if (FunctionsV3::hasModuleAddon("driver")){						  	
						  	  if($data_raw['trans_type_raw']=="delivery"){
						  	  	 if ( $task_info=merchantApp::getTaskInfoByOrderID($data['order_id'])){
						  	  	 	//dump($task_info);
						  	  	 	
						  	  	 	$data_raw['driver_app']=1;
				  	  	 			$data_raw['driver_id']=$task_info['driver_id'];
				  	  	 			$data_raw['task_id']=$task_info['task_id'];
				  	  	 			$data_raw['task_status']=$task_info['status'];
				  	  	 			
				  	  	 			$data_raw['icon_location']=websiteUrl()."/protected/modules/merchantapp/assets/images/racing-flag.png";
                                    $data_raw['icon_driver']=websiteUrl()."/protected/modules/merchantapp/assets/images/car.png";
                                    $data_raw['icon_dropoff']=websiteUrl()."/protected/modules/merchantapp/assets/images/restaurant-pin-32.png";
                                    
                                    $data_raw['driver_profilepic']=websiteUrl()."/protected/modules/merchantapp/assets/images/user.png";
				  	  	 			
				  	  	 			$driver_infos='';
				  	  	 			$driver_info=Driver::driverInfo($task_info['driver_id']);
				  	  	 			if($driver_info){
				  	  	 								  	  	 				
				  	  	 				if($profile_pic = merchantApp::getDriverProfilePic($driver_info['profile_photo'])){
				  	  	 					$data_raw['driver_profilepic']=$profile_pic;
				  	  	 				}
				  	  	 				
				  	  	 				unset($driver_info['username']);
				  	  	 				unset($driver_info['password']);
				  	  	 				unset($driver_info['forgot_pass_code']);
				  	  	 				unset($driver_info['token']);
				  	  	 				unset($driver_info['date_created']); unset($driver_info['date_modified']);
				  	  	 				$driver_infos=$driver_info;
				  	  	 				
				  	  	 				if (method_exists("FunctionsV3","latToAdress")){
				  	  	 					$driver_address=FunctionsV3::latToAdress(
					  	  	 				  $driver_info['location_lat'] , $driver_info['location_lng']
					  	  	 				);
				  	  	 				} else {
					  	  	 				$driver_address=merchantApp::latToAdress(
					  	  	 				  $driver_info['location_lat'] , $driver_info['location_lng']
					  	  	 				);
				  	  	 				}				  	  	 				
				  	  	 				if($driver_address){
				  	  	 					$driver_infos['formatted_address']=$driver_address['formatted_address'];
				  	  	 				} else $driver_infos['formatted_address']='';
				  	  	 			}						  	  	 
						  	  	 			
						  	  	 	switch ($task_info['status']) {							  	  	 		
						  	  	 		case "successful":
						  	  	 			break;
						  	  	 	
						  	  	 		default:
						  	  	 			$data_raw['task_info']=$task_info;							  	  	 		
						  	  	 			$data_raw['driver_info']=$driver_infos;
						  	  	 									  	  	 			
						  	  	 			/*$task_distance_resp = merchantApp::getTaskDistance(
											  isset($driver_infos['location_lat'])?$driver_infos['location_lat']:'',
											  isset($driver_infos['location_lng'])?$driver_infos['location_lng']:'',
											  isset($task_info['task_lat'])?$task_info['task_lat']:'',
											  isset($task_info['task_lng'])?$task_info['task_lng']:'',
											  isset($task_info['transport_type_id'])?$task_info['transport_type_id']:''
											);*/
						  	  	 			$task_distance_resp='';
											
											if($task_distance_resp){
											   $data_raw['time_left']=$task_distance_resp;
											} else $data_raw['time_left']=merchantApp::t("N/A");
											
						  	  	 			
						  	  	 			break;
						  	  	 	}
						  	  	 }						         
						  	  }
						  } else $data_raw['driver_app']=2;
						  						  						  
						  if ($data_raw['payment_type']=="OCR" || $data_raw['payment_type']=="ocr"){
						  	 $_cc_info=Yii::app()->functions->getCreditCardInfo($data['cc_id']);
						  	 $data_raw['credit_card_number']=Yii::app()->functions->maskCardnumber(
						  	    $_cc_info['credit_card_number']
						  	 );						  
						  	 
						  	 $data_raw['cvv'] = $_cc_info['cvv'];
						  	 $data_raw['expiry_date'] = $_cc_info['expiration_month']."/".$_cc_info['expiration_yr'];
						  	 
						  } else $data_raw['credit_card_number']='';
						  
						  $this->code=1;
						  $this->msg="OK";				  
						  $this->details=$data_raw;
						  
						  // update the order id to viewed						  
						  $params=array(
						    'viewed'=>2,
						    'merchantapp_viewed'=>1,
						  );
						  $DbExt=new DbExt;
						  $DbExt->updateData("{{order}}",$params,'order_id',$this->data['order_id']);
						  
					  } else $this->msg=$this->t("order details not available");
			    } else $this->msg=$this->t("order details not available");
			} else {
				$this->code=3;
				$this->msg=$this->t("you session has expired or someone login with your account");
			}
		} else $this->msg=merchantApp::parseValidatorError($Validator->getError());	    	
		$this->output();    	    	
    }
    
    public function actionAcceptOrdes()
    {
    	
    	$Validator=new Validator;
		$req=array(
		  'token'=>$this->t("token is required"),
		  'mtid'=>$this->t("merchant id is required"),
		  'user_type'=>$this->t("user type is required"),
		  'order_id'=>$this->t("order id is required")
		);
		$Validator->required($req,$this->data);
		if ($Validator->validate()){
			if ( $res=merchantApp::validateToken($this->data['mtid'],
			    $this->data['token'],$this->data['user_type'])){
			    				    
			    $merchant_id=$res['merchant_id'];
			    $order_id=$this->data['order_id'];			    
			    
			    if ( Yii::app()->functions->isMerchantCommission($merchant_id)){  
	    	    	if ( FunctionsK::validateChangeOrder($order_id)){
	    	    		$this->msg=merchantApp::t("Sorry but you cannot change the order status of this order it has reference already on the withdrawals that you made");
	    	    		$this->output();	    	    		
	    	    	}    	    
    	        }	        
    	        
    	        /*check if merchant can change the status*/
	    	    $can_edit=Yii::app()->functions->getOptionAdmin('merchant_days_can_edit_status');	    	    
	    	    if (is_numeric($can_edit) && !empty($can_edit)){
	    	    	
		    	    $date_now=date('Y-m-d');
		    	    $base_option=getOptionA('merchant_days_can_edit_status_basedon');	
		    	    
		    	    $resp=Yii::app()->functions->getOrderInfo($order_id);	    	   
		    	    
		    	    if ( $base_option==2){	    					
						$date_created=date("Y-m-d",
						strtotime($resp['delivery_date']." ".$resp['delivery_time']));		
					} else $date_created=date("Y-m-d",strtotime($resp['date_created']));
					    			
					
					$date_interval=Yii::app()->functions->dateDifference($date_created,$date_now);					
	    			if (is_array($date_interval) && count($date_interval)>=1){		    				
	    				if ( $date_interval['days']>$can_edit){
	    					$this->msg=merchantApp::t("Sorry but you cannot change the order status anymore. Order is lock by the website admin");
	    					$this->details=json_encode($date_interval);
	    					$this->output();
	    				}		    			
	    			}	    		
	    	    }
    	        
	    	    
	    	    $order_status='accepted';
	    	    $accept_order_status = getOptionA('merchant_app_accept_order_status');
	    	    if(!empty($accept_order_status)){
	    	    	$order_status = $accept_order_status;
	    	    }
	    	    	    	    
    	        if ( $resp=Yii::app()->functions->verifyOrderIdByOwner($order_id,$merchant_id) ){     	        	
    	        	$params=array( 
    	        	  'status'=>$order_status,
    	        	  'date_modified'=>FunctionsV3::dateNow(),
    	        	  'viewed'=>2
    	        	);    	        	
    	        	
    	        	$DbExt=new DbExt;
    	        	if ($DbExt->updateData('{{order}}',$params,'order_id',$order_id)){
    	        		$this->code=1;
    	        		$this->msg=merchantApp::t("Order ID").":$order_id ".merchantApp::t("has been accepted");
    	        		$this->details=array(
    	        		 'order_id'=>$order_id
    	        		);
    	        		
    	        		/*Now we insert the order history*/	    		
	    				$params_history=array(
	    				  'order_id'=>$order_id,
	    				  'status'=>$order_status,
	    				  'remarks'=>isset($this->data['remarks'])?$this->data['remarks']:'',
	    				  'date_created'=>FunctionsV3::dateNow(),
	    				  'ip_address'=>$_SERVER['REMOTE_ADDR']
	    				);	    				
	    				$DbExt->insertData("{{order_history}}",$params_history);
	    				
	    				
	    				/*UPDATE REVIEWS BASED ON STATUS*/
						if (method_exists('FunctionsV3','updateReviews')){
							FunctionsV3::updateReviews($order_id , $order_status);
						}
	    				
	    				/*SEND NOTIFICATIONS TO CUSTOMER*/	    				
	    				FunctionsV3::notifyCustomerOrderStatusChange(
	    				  $order_id,
	    				  $order_status,
	    				  isset($this->data['remarks'])?$this->data['remarks']:''
	    				);	    				
	    					    				
	    				/*UPDATE POINTS BASED ON ORDER STATUS*/
						if (FunctionsV3::hasModuleAddon("pointsprogram")){
							if (method_exists('PointsProgram','updateOrderBasedOnStatus')){
							   PointsProgram::updateOrderBasedOnStatus($order_status,$order_id);
							}
							if (method_exists('PointsProgram','udapteReviews')){
							   PointsProgram::udapteReviews($order_id,$order_status);
							}
						}			
	    				
	    				/*Driver app*/
						if (FunctionsV3::hasModuleAddon("driver")){
						   Yii::app()->setImport(array(			
							  'application.modules.driver.components.*',
						   ));
						   Driver::addToTask($order_id);						   
						}						
    	        		
    	        	} else $this->msg = merchantApp::t("ERROR: cannot update order.");    	        	
    	        } else $this->msg=$this->t("This Order does not belong to you");
    	            	        	    
			} else {
				$this->code=3;
				$this->msg=$this->t("you session has expired or someone login with your account");
			}  	
		} else $this->msg=merchantApp::parseValidatorError($Validator->getError());	    	
		$this->output();    	    	
    }
    
    public function actionDeclineOrders()
    {
    	
    	$Validator=new Validator;
		$req=array(
		  'token'=>$this->t("token is required"),
		  'mtid'=>$this->t("merchant id is required"),
		  'user_type'=>$this->t("user type is required"),
		  'order_id'=>$this->t("order id is required")
		);
		$Validator->required($req,$this->data);
		if ($Validator->validate()){
			if ( $res=merchantApp::validateToken($this->data['mtid'],
			    $this->data['token'],$this->data['user_type'])){
			    				    
			    $merchant_id=$res['merchant_id'];
			    $order_id=$this->data['order_id'];		 

			    if ( Yii::app()->functions->isMerchantCommission($merchant_id)){  
	    	    	if ( FunctionsK::validateChangeOrder($order_id)){
	    	    		$this->msg = merchantApp::t("Sorry but you cannot change the order status of this order it has reference already on the withdrawals that you made");
	    	    		$this->output();	    	    		
	    	    	}    	    
    	        }	        
    	        
    	        /*check if merchant can change the status*/
	    	    $can_edit=Yii::app()->functions->getOptionAdmin('merchant_days_can_edit_status');	    	    
	    	    if (is_numeric($can_edit) && !empty($can_edit)){
	    	    	
		    	    $date_now=date('Y-m-d');
		    	    $base_option=getOptionA('merchant_days_can_edit_status_basedon');	
		    	    
		    	    $resp=Yii::app()->functions->getOrderInfo($order_id);
		    	    
		    	    if ( $base_option==2){	    					
						$date_created=date("Y-m-d",
						strtotime($resp['delivery_date']." ".$resp['delivery_time']));		
					} else $date_created=date("Y-m-d",strtotime($resp['date_created']));
					    			
					$date_interval=Yii::app()->functions->dateDifference($date_created,$date_now);					
	    			if (is_array($date_interval) && count($date_interval)>=1){		    				
	    				if ( $date_interval['days']>$can_edit){
	    					$this->msg = merchantApp::t("Sorry but you cannot change the order status anymore. Order is lock by the website admin");
	    					$this->details=json_encode($date_interval);
	    					$this->output();
	    				}		    			
	    			}	    		
	    	    }			   
			    
			    $order_status='decline';			    
			    $app_decline_order_status = getOptionA('merchant_app_decline_order_status');
			    if(!empty($app_decline_order_status)){
			    	$order_status=$app_decline_order_status;
			    }			    
			    
			    if ( $resp=Yii::app()->functions->verifyOrderIdByOwner($order_id,$merchant_id) ){     	        	
    	        	$params=array( 
    	        	  'status'=>$order_status,
    	        	  'date_modified'=>FunctionsV3::dateNow(),
    	        	  'viewed'=>2
    	        	);    	    
    	        
    	        	$DbExt=new DbExt;
    	        	if ($DbExt->updateData('{{order}}',$params,'order_id',$order_id)){
    	        		$this->code=1;
    	        		//$this->msg=t("order has been declined");
    	        		$this->msg = merchantApp::t("Order ID").":$order_id ". merchantApp::t("has been declined");
    	        		$this->details=array(
    	        		 'order_id'=>$order_id
    	        		);
    	        		
    	        		/*Now we insert the order history*/	    		
	    				$params_history=array(
	    				  'order_id'=>$order_id,
	    				  'status'=>$order_status,
	    				  'remarks'=>isset($this->data['remarks'])?$this->data['remarks']:'',
	    				  'date_created'=>FunctionsV3::dateNow(),
	    				  'ip_address'=>$_SERVER['REMOTE_ADDR']
	    				);	    				
	    				$DbExt->insertData("{{order_history}}",$params_history);
	    				
	    				/*UPDATE REVIEWS BASED ON STATUS*/
						if (method_exists('FunctionsV3','updateReviews')){
							FunctionsV3::updateReviews($order_id , $order_status);
						}
		    				
	    				/*SEND NOTIFICATIONS TO CUSTOMER*/	    				
	    				FunctionsV3::notifyCustomerOrderStatusChange(
	    				  $order_id,
	    				  $order_status,
	    				  isset($this->data['remarks'])?$this->data['remarks']:''
	    				);
	    					    					    				
	    				/*UPDATE POINTS BASED ON ORDER STATUS*/
						if (FunctionsV3::hasModuleAddon("pointsprogram")){
							if (method_exists('PointsProgram','updateOrderBasedOnStatus')){
							   PointsProgram::updateOrderBasedOnStatus($order_status,$order_id);
							}
							if (method_exists('PointsProgram','udapteReviews')){
							   PointsProgram::udapteReviews($order_id,$order_status);
							}
						}			
	    				
    	        	} else $this->msg = merchantApp::t("ERROR: cannot update order.");    	        	
    	        	
			    } else $this->msg=$this->t("This Order does not belong to you");
			    
			} else {
				$this->code=3;
				$this->msg=$this->t("you session has expired or someone login with your account");
			}  	
		} else $this->msg=merchantApp::parseValidatorError($Validator->getError());	    	
		$this->output();   
    }
    
    public function actionChangeOrderStatus()
    {
    	$Validator=new Validator;
		$req=array(
		  'token'=>$this->t("token is required"),
		  'mtid'=>$this->t("merchant id is required"),
		  'user_type'=>$this->t("user type is required"),
		  'order_id'=>$this->t("order id is required"),
		  'status'=>$this->t("order status is required")
		);
		$Validator->required($req,$this->data);
		if ($Validator->validate()){
			if ( $res=merchantApp::validateToken($this->data['mtid'],
			    $this->data['token'],$this->data['user_type'])){
			    				    
			    $merchant_id=$res['merchant_id'];
			    $order_id=$this->data['order_id'];		 

			    if ( Yii::app()->functions->isMerchantCommission($merchant_id)){  
	    	    	if ( FunctionsK::validateChangeOrder($order_id)){
	    	    		$this->msg = merchantApp::t("Sorry but you cannot change the order status of this order it has reference already on the withdrawals that you made");
	    	    		$this->output();	    	    		
	    	    	}    	    
    	        }
    	            	        
    	        /*check if merchant can change the status*/
	    	    $can_edit=Yii::app()->functions->getOptionAdmin('merchant_days_can_edit_status');	    	    
	    	    if (is_numeric($can_edit) && !empty($can_edit)){
	    	    	
		    	    $date_now=date('Y-m-d');
		    	    $base_option=getOptionA('merchant_days_can_edit_status_basedon');	
		    	    
		    	    $resp=Yii::app()->functions->getOrderInfo($order_id);
		    	    
		    	    if ( $base_option==2){	    					
						$date_created=date("Y-m-d",
						strtotime($resp['delivery_date']." ".$resp['delivery_time']));		
					} else $date_created=date("Y-m-d",strtotime($resp['date_created']));
					    			
					$date_interval=Yii::app()->functions->dateDifference($date_created,$date_now);					
	    			if (is_array($date_interval) && count($date_interval)>=1){		    				
	    				if ( $date_interval['days']>$can_edit){
	    					$this->msg = merchantApp::t("Sorry but you cannot change the order status anymore. Order is lock by the website admin");
	    					$this->details=json_encode($date_interval);
	    					$this->output();
	    				}		    			
	    			}	    		
	    	    }			   
			    
			    $order_status=$this->data['status'];
			    
			    if ( $resp=Yii::app()->functions->verifyOrderIdByOwner($order_id,$merchant_id) ){     	        	
    	        	$params=array( 
    	        	  'status'=>$order_status,
    	        	  'date_modified'=>FunctionsV3::dateNow(),
    	        	  'viewed'=>2
    	        	);    	    
    	        
    	        	$DbExt=new DbExt;
    	        	if ($DbExt->updateData('{{order}}',$params,'order_id',$order_id)){
    	        		$this->code=1;
    	        		$this->msg = merchantApp::t("order status successfully changed");
    	        		
    	        		/*Now we insert the order history*/	    		
	    				$params_history=array(
	    				  'order_id'=>$order_id,
	    				  'status'=>$order_status,
	    				  'remarks'=>isset($this->data['remarks'])?$this->data['remarks']:'',
	    				  'date_created'=>FunctionsV3::dateNow(),
	    				  'ip_address'=>$_SERVER['REMOTE_ADDR']
	    				);	    				
	    				$DbExt->insertData("{{order_history}}",$params_history);
	    				
	    				/*UPDATE REVIEWS BASED ON STATUS*/
						if (method_exists('FunctionsV3','updateReviews')){
							FunctionsV3::updateReviews($order_id , $order_status);
						}
	    				
	    				/*SEND NOTIFICATIONS TO CUSTOMER*/	    				
	    				FunctionsV3::notifyCustomerOrderStatusChange(
	    				  $order_id,
	    				  $order_status,
	    				  isset($this->data['remarks'])?$this->data['remarks']:''
	    				);
	    				
	    				/*UPDATE POINTS BASED ON ORDER STATUS*/
						if (FunctionsV3::hasModuleAddon("pointsprogram")){
							if (method_exists('PointsProgram','updateOrderBasedOnStatus')){
							   PointsProgram::updateOrderBasedOnStatus($order_status,$order_id);
							}
							if (method_exists('PointsProgram','udapteReviews')){
							   PointsProgram::udapteReviews($order_id,$order_status);
							}
						}					
	    				
	    				/*Driver app*/
						if (FunctionsV3::hasModuleAddon("driver")){
						   Yii::app()->setImport(array(			
							  'application.modules.driver.components.*',
						   ));
						   $_POST['status']=$order_status;
						   Driver::addToTask($order_id);						   						   						   						  
						}		
    	        		
    	        	} else $this->msg = merchantApp::t("ERROR: cannot update order.");    	        	
    	        	
			    } else $this->msg=$this->t("This Order does not belong to you");			    
			} else {
				$this->code=3;
				$this->msg=$this->t("you session has expired or someone login with your account");
			}  	
		} else $this->msg=merchantApp::parseValidatorError($Validator->getError());	    	
		$this->output();   
    }
    
    public function actionForgotPassword()
    {
    	
    	if (isset($this->data['email_address'])){
    		if (empty($this->data['email_address'])){
    			$this->msg = merchantApp::t("email address is required");
    			$this->output();
    		}
    		
    		if ($res=merchantApp::getUserByEmail($this->data['email_address'])){
    		   
    		   $tbl="merchant";
    		   if ( $res['user_type']=="user"){
    		   	   $tbl="merchant_user";
    		   }    		
    		   $params=array('lost_password_code'=> yii::app()->functions->generateCode());	 
    		   
    		   $DbExt=new DbExt;
    		   if ( $DbExt->updateData("{{{$tbl}}}",$params,'merchant_id',$res['merchant_id'])){
    		   	   $this->code=1;
    		   	   $this->msg = merchantApp::t("We have sent verification code in your email.");
    		   	       		   	   
    		   	   $tpl=EmailTPL::merchantForgotPass($res[0],$params['lost_password_code']);
    			   $sender=Yii::app()->functions->getOptionAdmin('website_contact_email');
	               $to=$res['contact_email'];	               
	               if (!sendEmail($to,$sender, merchantApp::t("Merchant Forgot Password"),$tpl)){		    	
	                	$email_stats="failed";
	                } else $email_stats="ok mail";
	                
	                $this->details=array(
	                  'email_stats'=>$email_stats,
	                  'user_type'=>$res['user_type'],
	                  'email_address'=>$this->data['email_address']
	                );
	                
    		   } else $this->msg = merchantApp::t("ERROR: Cannot update");
    		   
    		} else $this->msg = merchantApp::t("sorry but the email address you supplied does not exist in our records");
    		
    	} else $this->msg = merchantApp::t("email address is required");
    	$this->output();   
    }
    
    public function actionChangePasswordWithCode()
    {        
    	
    	
        $Validator=new Validator;
		$req=array(
		  'code'=>$this->t("code is required"),
		  'newpass'=>$this->t("new passwords is required"),		  
		  'user_type'=>t("user type is missing"),
		  'email_address'=>$this->t("email address is required")
		);
		$Validator->required($req,$this->data);
		if ($Validator->validate()){
			
			if ( $res=merchantApp::getMerchantByCode($this->data['code'],$this->data['email_address'],
			$this->data['user_type'])){
								
				$params=array(
				  'password'=>md5($this->data['newpass']),
	    		  'date_modified'=>FunctionsV3::dateNow(),
	    	      'ip_address'=>$_SERVER['REMOTE_ADDR']
				);			
								
				$DbExt=new DbExt;
				if ( $this->data['user_type']=="admin"){
					// update merchant table
					if ($DbExt->updateData("{{merchant}}",$params,'merchant_id',$res['merchant_id'])){
						$this->msg = merchantApp::t("You have successfully change your password");
	    				$this->code=1;
					} else $this->msg = merchantApp::t("ERROR: cannot update records.");
				} else {
					// update merchant user table merchant_user_id
					if ($DbExt->updateData("{{merchant_user}}",$params,'merchant_user_id',$res['merchant_user_id'])){
						$this->msg = merchantApp::t("You have successfully change your password");
	    				$this->code=1;
					} else $this->msg = merchantApp::t("ERROR: cannot update records.");
				}				
			} else $this->msg=t("verification code is invalid");
			
		} else $this->msg=merchantApp::parseValidatorError($Validator->getError());	    	
		$this->output(); 
    }
    
    public function actionRegisterMobile()
    {    	
    	$DbExt=new DbExt;
		$params['device_id']=isset($this->data['registrationId'])?$this->data['registrationId']:'';
		$params['device_platform']=isset($this->data['device_platform'])?$this->data['device_platform']:'';
		$params['ip_address']=$_SERVER['REMOTE_ADDR'];
				
		$user_type='admin';
		if (!empty($this->data['token'])){
			if ( $info=merchantApp::getUserByToken($this->data['token'])){				
				$user_type=$info['user_type'];
				$params['merchant_id']=$info['merchant_id'];
				$params['user_type']=$user_type;
				if ($user_type=="user"){
				   	$params['merchant_user_id']=$info['merchant_user_id'];
				} else $params['merchant_user_id']=0;
			}
		}					
		if ( $res=merchantApp::getDeviceInfo($this->data['registrationId'])){
			$params['date_modified']=FunctionsV3::dateNow();				
			$DbExt->updateData('{{mobile_device_merchant}}',$params,'id',$res['id']);
			$this->code=1;
			$this->msg="Updated";
		} else {
			$params['date_created']=FunctionsV3::dateNow();
			$DbExt->insertData('{{mobile_device_merchant}}',$params);
			$this->code=1;
			$this->msg="OK";
		}
		$this->output(); 
    }
    
    public function actionStatusList()
    {    	        	
    	if ( $res=merchantApp::validateToken($this->data['mtid'],
			    $this->data['token'],$this->data['user_type'])){
			    				    				 
			 if (!$order_info = Yii::app()->functions->getOrder($this->data['order_id'])){
			 	$this->msg  = merchantApp::t("order records not found");
			 	$this->output(); 
			 }			    
			 
			 if ( $res=merchantApp::orderStatusList($this->data['mtid']) ) {  				 	
			 	$this->details=array(
			 	  'status'=>$order_info['status'],
			 	  'status_list'=>$res
			 	);
			 	$this->code=1;
			 	$this->msg="OK";
			 } else $this->msg = merchantApp::t("Status list not available");
        } else {
		    $this->code=3;
		    $this->msg=$this->t("you session has expired or someone login with your account");
		}    
		$this->output(); 
    }
    
	public function actionGetLanguageSelection()
	{
		if($list=FunctionsV3::getEnabledLanguage()){		   
		   if(is_array($list) && count($list)>=1){
			   $this->code=1;
			   $this->msg="OK";
			   $this->details=$list;
		   } else $this->msg=merchantApp::t("no language available");
		} else  $this->msg=merchantApp::t("no language available");
		
		$this->output();
	}    
	
	public function actionSaveSettings()
	{		
		
		$Validator=new Validator;		
		$req=array(
		  'token'=>$this->t("token is required"),
		  'mtid'=>$this->t("merchant id is required"),
		  'user_type'=>$this->t("user type is required"),
		  'merchant_device_id'=>t("mobile device id is empty please restart the app")
		);
		$Validator->required($req,$this->data);
		if ($Validator->validate()){
			if ( $res=merchantApp::validateToken($this->data['mtid'],
			    $this->data['token'],$this->data['user_type'])){
			    	
			    
			    $params=array(
			      'merchant_id'=>$this->data['mtid'],
				  'enabled_push'=>isset($this->data['enabled_push'])?1:2,
				  'date_modified'=>FunctionsV3::dateNow(),
				  'ip_address'=>$_SERVER['REMOTE_ADDR'],			  
				);		
								
				$DbExt=new DbExt;
				//if ( $resp=merchantApp::getDeviceInfo($this->data['merchant_device_id'])){					
				if ( $resp=merchantApp::getDeviceInfoByUserType($this->data['merchant_device_id'],
				$this->data['user_type'],$this->data['mtid']
				)){		
					//dump($resp);			
					if ( $DbExt->updateData('{{mobile_device_merchant}}',$params,'id',$resp['id'])){
						$this->msg=$this->t("Setting saved");
						$this->code=1;
						
						$details = array(
						  'enabled_push'=>$params['enabled_push']
						);
						
						$this->details = $details;
						
						//dump($this->data);
						
						$merchant_id=$this->data['mtid'];
						if (isset($this->data['food_option_not_available'])){
							Yii::app()->functions->updateOption("food_option_not_available",1,$merchant_id);  
						}
						if (isset($this->data['food_option_not_available_disabled'])){
							Yii::app()->functions->updateOption("food_option_not_available",2,$merchant_id);  
						}
						if(!isset($this->data['food_option_not_available']) && !isset($this->data['food_option_not_available_disabled'])){
							Yii::app()->functions->updateOption("food_option_not_available","",$merchant_id);  
						}
						
						Yii::app()->functions->updateOption("merchant_close_store",
						isset($this->data['merchant_close_store'])?"yes":""
						,$merchant_id);  
						
						Yii::app()->functions->updateOption("merchant_show_time",
						isset($this->data['merchant_show_time'])?"yes":""
						,$merchant_id);  
						
						Yii::app()->functions->updateOption("merchant_disabled_ordering",
						isset($this->data['merchant_disabled_ordering'])?"yes":""
						,$merchant_id);  
						
						Yii::app()->functions->updateOption("merchant_enabled_voucher",
						isset($this->data['merchant_enabled_voucher'])?"yes":""
						,$merchant_id);  
						
						Yii::app()->functions->updateOption("merchant_required_delivery_time",
						isset($this->data['merchant_required_delivery_time'])?"yes":""
						,$merchant_id);  
						
						Yii::app()->functions->updateOption("merchant_enabled_tip",
						isset($this->data['merchant_enabled_tip'])?"2":""
						,$merchant_id);  
						
						Yii::app()->functions->updateOption("merchant_table_booking",
						isset($this->data['merchant_table_booking'])?"yes":""
						,$merchant_id);  
						
						
						Yii::app()->functions->updateOption("accept_booking_sameday",
						isset($this->data['accept_booking_sameday'])?"2":""
						,$merchant_id);  
												
					} else $this->msg=$this->t("ERROR: Cannot update");
				} else $this->msg=$this->t("Device id not found please restart the app");
								
			} else {
				$this->code=3;
				$this->msg=$this->t("you session has expired or someone login with your account");
			}
		} else $this->msg=merchantApp::parseValidatorError($Validator->getError());	    	
		$this->output();
	}
    
	public function actionGetSettings()
	{		
		if (isset($this->data['device_id'])){
			//if ( $resp=merchantApp::getDeviceInfo($this->data['device_id'])){					
			if ( $resp=merchantApp::getDeviceInfoByUserType($this->data['device_id'],
			$this->data['user_type'], $this->data['mtid'] )){					
				$this->code=1;
				$this->msg="OK";
				$resp['food_option_not_available']=getOption($resp['merchant_id'],'food_option_not_available');
				$resp['merchant_close_store']=getOption($resp['merchant_id'],'merchant_close_store');
				$resp['merchant_show_time']=getOption($resp['merchant_id'],'merchant_show_time');
				$resp['merchant_disabled_ordering']=getOption($resp['merchant_id'],'merchant_disabled_ordering');
				$resp['merchant_enabled_voucher']=getOption($resp['merchant_id'],'merchant_enabled_voucher');
				$resp['merchant_required_delivery_time']=getOption($resp['merchant_id'],'merchant_required_delivery_time');
				$resp['merchant_enabled_tip']=getOption($resp['merchant_id'],'merchant_enabled_tip');
				
				$resp['merchant_table_booking']=getOption($resp['merchant_id'],'merchant_table_booking');
				$resp['accept_booking_sameday']=getOption($resp['merchant_id'],'accept_booking_sameday');
				
				$this->details=$resp;
			} else {
				$this->code = 3;
				$this->msg=$this->t("Device id not found please relogin again");
			}
		} else $this->msg=$this->t("Device id not found please restart the app");
		$this->output();
	}
	
	public function actiongeoDecodeAddress()
	{
	
		if (isset($this->data['address'])){
			if ($res=Yii::app()->functions->geodecodeAddress($this->data['address'])){
				$this->code=1;
				$this->msg="OK";
				$res['address']=$this->data['address'];
				$this->details=$res;
			} else $this->msg = merchantApp::t("Error: cannot view location");
		} else $this->msg=$this->t("address is required");
		$this->output();
	}
	
	public function actionOrderHistory()
	{
		if (!isset($this->data['order_id'])){
			$this->msg=$this->t("order is missing");
			$this->output();
		}	
		
		if ( $res=merchantApp::validateToken($this->data['mtid'],
			    $this->data['token'],$this->data['user_type'])){			    	
			 
			 if ( $res=merchantApp::getOrderHistory($this->data['order_id'])){
			 	  $data='';
			 	  foreach ($res as $val) {
			 	  	
			 	  	 $remarks = $val['remarks'];
			         if(!empty($val['remarks2']) && !empty($val['remarks_args']) ){
		           	    $remarks_args = json_decode($val['remarks_args'],true);
		           	    if(is_array($remarks_args) && count($remarks_args)>=1){
		           	       $remarks = Yii::t("driver",$val['remarks2'],$remarks_args);            	   
		           	    }
			        }
			 	  	
			 	  	$data[]=array(
			 	  	  'id'=>$val['id'],
			 	  	  'status'=> merchantApp::t($val['status']),
			 	  	  'status_raw'=>strtolower($val['status']),
			 	  	  'remarks'=>$remarks,
			 	  	  'date_created'=>Yii::app()->functions->FormatDateTime($val['date_created'],true),
			 	  	  'ip_address'=>$val['ip_address']
			 	  	);
			 	  }
			 	  $this->code=1;
			 	  $this->msg="OK";
			 	  $this->details=array(
			 	    'order_id'=>$this->data['order_id'],
			 	    'data'=>$data
			 	  );
			 } else {
			 	$this->msg=$this->t("No history found");			    	
			 	$this->details=$this->data['order_id'];
			 }
         } else {
				$this->code=3;
				$this->msg=$this->t("you session has expired or someone login with your account");
				$this->details=$this->data['order_id'];
		}
		$this->output();
	}
	
	public function actionsaveProfile()
	{
		
		$Validator=new Validator;		
		$req=array(
		  'token'=>$this->t("token is required"),
		  'mtid'=>$this->t("merchant id is required"),
		  'user_type'=>$this->t("user type is required"),
		  'password'=>$this->t("password is required"),
		  'cpassword'=>$this->t("confirm password is required")
		);
		
		if (isset($this->data['password']) && isset($this->data['cpassword'])){
			if ( $this->data['password']!=$this->data['cpassword']){
				$Validator->msg[]=$this->t("Confirm password does not match");
			}
		}
		
		$Validator->required($req,$this->data);
		if ($Validator->validate()){
			if ( $res=merchantApp::validateToken($this->data['mtid'],
			    $this->data['token'],$this->data['user_type'])){
					    
			    $params=array(
			      'password'=>md5($this->data['password']),
			      'date_modified'=>FunctionsV3::dateNow(),
			      'ip_address'=>$_SERVER['REMOTE_ADDR']
			    );			    
			    
			    $DbExt=new DbExt;	
			    switch ($res['user_type']) {
			    	case "user":
			    		if ( $DbExt->updateData('{{merchant_user}}',$params,'merchant_user_id',$res['merchant_user_id'])){
			    			$this->code=1;
			    			$this->msg=$this->t("Profile saved");
			    		} else $this->msg=$this->t("ERROR: Cannot update profile");
			    		break;
			    			    	
			    	default:
			    		if ( $DbExt->updateData('{{merchant}}',$params,'merchant_id',$res['merchant_id'])){
			    			$this->code=1;
			    			$this->msg=$this->t("Profile saved");
			    		} else $this->msg=$this->t("ERROR: Cannot update profile");
			    		break;
			    }
			} else {
				$this->code=3;
				$this->msg=$this->t("you session has expired or someone login with your account");
			}
		} else $this->msg=merchantApp::parseValidatorError($Validator->getError());	    	
		$this->output();	    	
	}
	
	public function actionGetProfile()
	{
		
		$Validator=new Validator;		
		$req=array(
		  'token'=>$this->t("token is required"),
		  'mtid'=>$this->t("merchant id is required"),
		  'user_type'=>$this->t("user type is required"),		  
		);
						
		$Validator->required($req,$this->data);
		if ($Validator->validate()){
			if ( $res=merchantApp::validateToken($this->data['mtid'],
			    $this->data['token'],$this->data['user_type'])){			    			    
			    $this->code=1;
			    $this->msg="OK";
			    $this->details=$res;			    	
	    } else {
				$this->code=3;
				$this->msg=$this->t("you session has expired or someone login with your account");
			}
		} else $this->msg=merchantApp::parseValidatorError($Validator->getError());	    	
		$this->output();	 
	}
	
	public function actionGetLanguageSettings()
	{
		$is_login = false;
		if (isset($this->data['user_type'])){			
			if ( $res=merchantApp::validateToken($this->data['mtid'],$this->data['token'],$this->data['user_type'])){
				$res['merchant_user_id']=isset($res['merchant_user_id'])?$res['merchant_user_id']:'';
				if ( merchantApp::getMerchantDeviceInfoByType($res['user_type'],$res['merchant_id'],$res['merchant_user_id'])){
					$is_login = true;
				}				
			}
		}
		
		$lang=merchantApp::getAppLanguage();	
		
		$default_lang=Yii::app()->language;		
		
		$merchant_app_force_lang=getOptionA('merchant_app_force_lang');
		if(is_numeric($merchant_app_force_lang)){
			$merchant_app_force_lang='';
		}
		
		if($default_lang=="null" || is_null($default_lang)){
			$default_lang='en';
		}		
				
		$app_decline_order_status = getOptionA('merchant_app_decline_order_status');		
		if(empty($app_decline_order_status)){
			$app_decline_order_status = 'decline';
		}
		$this->details=array(
		  'default_lang'=>$default_lang,
		  'app_force_lang'=>$merchant_app_force_lang,
		  'is_login'=>$is_login,
		  'app_enabled_alert'=>getOptionA('merchant_app_enabled_alert'),
		  'app_alert_interval'=>getOptionA('merchant_app_alert_interval'),
		  'app_cancel_order_alert'=>getOptionA('merchant_app_cancel_order_alert'),
		  'app_cancel_order_alert_interval'=>getOptionA('merchant_app_cancel_order_alert_interval'),
		  'app_decline_order_status'=>$app_decline_order_status,
		  'app_keep_awake'=>getOptionA('merchant_app_keep_awake'),
		  'map_provider'=>getOptionA('map_provider'),
		  'mapbox_token'=>getOptionA('mapbox_access_token'),
		  'translation'=>$lang
		);
		
		$this->msg="OK";		
		$this->code=1;
		$this->output();		
	}
	
	public function actiongetNotification()
	{
		
	    $Validator=new Validator;		
		$req=array(
		  'token'=>$this->t("token is required"),
		  'mtid'=>$this->t("merchant id is required"),
		  'user_type'=>$this->t("user type is required"),		  
		);
						
		$Validator->required($req,$this->data);
		if ($Validator->validate()){
			if ( $res=merchantApp::validateToken($this->data['mtid'],
			    $this->data['token'],$this->data['user_type'])){			    			    
			   
			   if ( $resp=merchantApp::getMerchantNotification($res['merchant_id'],
			       $res['user_type'], isset($res['merchant_user_id'])?$res['merchant_user_id']:'' )){
			   		
			       	$data='';
			       	foreach ($resp as $val) {			       		
			       		$val['date_created']=Yii::app()->functions->FormatDateTime($val['date_created'],true);
			       		$data[]=$val;
			       	}
			       	
			       	$this->code=1;
			       	$this->msg="OK";
			       	$this->details=$data;
			       	
			    } else $this->msg=$this->t("no notifications");
			   
             } else {
				$this->code=3;
				$this->msg=$this->t("you session has expired or someone login with your account");
			}
		} else $this->msg=merchantApp::parseValidatorError($Validator->getError());	    	
		$this->output();	 			    	
	}
	
	public function actionsearchOrder()
	{
		$Validator=new Validator;		
		$req=array(
		  'token'=>$this->t("token is required"),
		  'mtid'=>$this->t("merchant id is required"),
		  'user_type'=>$this->t("user type is required"),		  
		);
						
		$Validator->required($req,$this->data);
		if ($Validator->validate()){
			if ( $res=merchantApp::validateToken($this->data['mtid'],
			    $this->data['token'],$this->data['user_type'])){			    			    
			   			    
			    if ( $resp=merchantApp::searchOrderByMerchantId(
			    $this->data['order_id_customername'] , $this->data['mtid'])){
			    	 
			    	$this->code=1; $this->msg="OK";					
					foreach ($resp as $val) {												
						//dump($val);
						$data[]=array(
						  'order_id'=>$val['order_id'],
						  'customer_name'=>isset($val['customer_name'])?$val['customer_name']:'',
						  'viewed'=>$val['viewed'],
						  'status'=> merchantApp::t($val['status']),
						  'status_raw'=>strtolower($val['status']),
						  'trans_type'=> merchantApp::t($val['trans_type']),
						  'trans_type_raw'=>$val['trans_type'],
						  'total_w_tax'=>$val['total_w_tax'],						  
						  'total_w_tax_prety'=>merchantApp::prettyPrice($val['total_w_tax']),
						  'transaction_date'=>Yii::app()->functions->FormatDateTime($val['date_created'],true),
						  'transaction_time'=>Yii::app()->functions->timeFormat($val['date_created'],true),
						  'delivery_time'=>Yii::app()->functions->timeFormat($val['delivery_time'],true),
						  'delivery_asap'=>$val['delivery_asap']==1?t("ASAP"):'',
						  'delivery_date'=>Yii::app()->functions->FormatDateTime($val['delivery_date'] ." ". $val['delivery_time'] ,true)
						);
					}					
					$this->code=1;
					$this->msg=$this->t("Search Results") ." (".count($data).") ".$this->t("Found records");
					$this->details=$data;
			    	 
			    } else $this->msg=$this->t("no results");
			   
             } else {
				$this->code=3;
				$this->msg=$this->t("you session has expired or someone login with your account");
			}
		} else $this->msg=merchantApp::parseValidatorError($Validator->getError());	    	
		$this->output();	 			 
	}
	
	public function actionPendingBooking()
	{
		
		$Validator=new Validator;		
		$req=array(
		  'token'=>$this->t("token is required"),
		  'mtid'=>$this->t("merchant id is required"),
		  'user_type'=>$this->t("user type is required"),		  
		);
						
		$Validator->required($req,$this->data);
		if ($Validator->validate()){
			if ( $res=merchantApp::validateToken($this->data['mtid'],
			    $this->data['token'],$this->data['user_type'])){			    			    
 			    	
			    if ( $res=merchantApp::getPendingTables($this->data['mtid'])){
			    	$this->code=1;
			    	$this->msg="OK";
			    	$data=array();
			    	foreach ($res as $val) {			    		
			    		$val['status_raw']=strtolower($val['status']);
			    		$val['status']=$this->t($val['status']);
			    		$val['date_of_booking']=Yii::app()->functions->FormatDateTime($val['date_booking'].
			    		" ".$val['booking_time'],true);
			    		$data[]=$val;
			    	}
			    	$this->details=$data;
			    } else $this->msg=$this->t("no pending booking");
			    
		     } else {
				$this->code=3;
				$this->msg=$this->t("you session has expired or someone login with your account");
			}
		} else $this->msg=merchantApp::parseValidatorError($Validator->getError());	    	
		$this->output();	 			 	    	
	}
	
	public function actionAllBooking()
	{
		
		$Validator=new Validator;		
		$req=array(
		  'token'=>$this->t("token is required"),
		  'mtid'=>$this->t("merchant id is required"),
		  'user_type'=>$this->t("user type is required"),		  
		);
						
		$Validator->required($req,$this->data);
		if ($Validator->validate()){
			if ( $res=merchantApp::validateToken($this->data['mtid'],
			    $this->data['token'],$this->data['user_type'])){			    			    
 			    	
			    if ( $res=merchantApp::getAllBooking($this->data['mtid'])){
			    	$this->code=1;
			    	$this->msg="OK";
			    	$data=array();
			    	foreach ($res as $val) {			    		
			    		$val['status_raw']=strtolower($val['status']);
			    		$val['status']=$this->t($val['status']);
			    		$val['date_of_booking']=Yii::app()->functions->FormatDateTime($val['date_booking'].
			    		" ".$val['booking_time'],true);
			    		$data[]=$val;
			    	}
			    	$this->details=$data;
			    } else $this->msg=$this->t("no current booking");
			    
		     } else {
				$this->code=3;
				$this->msg=$this->t("you session has expired or someone login with your account");
			}
		} else $this->msg=merchantApp::parseValidatorError($Validator->getError());	    	
		$this->output();	 			 	    	
	}	
	
	public function actionGetBookingDetails()
	{
		
		$Validator=new Validator;		
		$req=array(
		  'token'=>$this->t("token is required"),
		  'mtid'=>$this->t("merchant id is required"),
		  'user_type'=>$this->t("user type is required"),		  
		);
						
		$Validator->required($req,$this->data);
		if ($Validator->validate()){
			if ( $res=merchantApp::validateToken($this->data['mtid'],
			    $this->data['token'],$this->data['user_type'])){			    			    
			    				    	
			    if ( $res=merchantApp::getBookingDetails($this->data['mtid'],$this->data['booking_id'])){
			    	$res['status_raw']=strtolower($res['status']);
			    	$res['date_of_booking']=Yii::app()->functions->FormatDateTime($res['date_booking'].
			    		" ".$res['booking_time'],true);
			    		
			    	$res['transaction_date']=  Yii::app()->functions->FormatDateTime($res['date_created'],true);
			    	$res['date_booking']=  Yii::app()->functions->FormatDateTime($res['date_booking'],false);
			    		
			    	
			    	$res['status'] = merchantApp::t($res['status']);
			    	
			    	$this->code=1;
			    	$this->msg="OK";
			    	$this->details=array( 
			    	  'booking_id'=>$this->data['booking_id'],			    	  
			    	  'data'=>$res
			    	);
			    	
			    	$params=array(
			    	  'viewed'=>2
			    	);
			    	$DbExt=new DbExt; 
			    	$DbExt->updateData('{{bookingtable}}',$params,'booking_id',$this->data['booking_id']);
			    	
			    } else $this->msg=$this->t("booking details not available");
			    
		} else {
				$this->code=3;
				$this->msg=$this->t("you session has expired or someone login with your account");
			}
		} else $this->msg=merchantApp::parseValidatorError($Validator->getError());	    	
		$this->output(); 			    	
	}
	
	public function actionBookingChangeStats()
	{		
		/*$this->code=1;
		$this->msg="ok";
		$this->output(); 		
		Yii::app()->end();*/
		
		$Validator=new Validator;		
		$req=array(
		  'token'=>$this->t("token is required"),
		  'mtid'=>$this->t("merchant id is required"),
		  'user_type'=>$this->t("user type is required"),		  
		);
						
		$Validator->required($req,$this->data);
		if ($Validator->validate()){
			if ( $res=merchantApp::validateToken($this->data['mtid'],
			    $this->data['token'],$this->data['user_type'])){			    			    
			    				 
			   if ( $res=merchantApp::getBookingDetails($this->data['mtid'],$this->data['booking_id'])){   	
				   			   	
				   $params=array(
				     'status'=>$this->data['status'],
				     'date_modified'=>FunctionsV3::dateNow(),
				     'ip_address'=>$_SERVER['REMOTE_ADDR']
				   );
				   
				   /*dump($this->data);			
				   dump($res);
				   die();*/
				   				   
				   $DbExt=new DbExt; 
			       if ($DbExt->updateData('{{bookingtable}}',$params,'booking_id',$this->data['booking_id'])){
			       	   $this->code=1;
			       	   $this->msg= $this->t("Booking id #").$this->data['booking_id'].
			       	   " ".$this->t($this->data['status']);
			       	   			       	   
			       	   switch ($this->data['status']) {
			       	   	case "approved":
			       	   		$subject=getOptionA('tpl_booking_approved_title');
			       	   		$content=getOptionA('tpl_booking_approved_content');
			       	   					       	   		
			       	   		break;
			       	   
			       	   	default:
			       	   		$subject=getOptionA('tpl_booking_denied_title');
			       	   		$content=getOptionA('tpl_booking_denied_content');
			       	   		break;
			       	   }
			       	   			    
			       	   
			       	   $res['remarks'] =$this->data['remarks'];
			       	   $res['status']  = $this->data['status'];
			       	   
			       	   /*NOTIFY CUSTOMER*/
			       	   FunctionsV3::updateBookingNotify($res);
			       	   
			       	   /*POINTS PROGRAM*/		    		
			    	   if (FunctionsV3::hasModuleAddon("pointsprogram")){		    			
			    		   PointsProgram::updateBookTable($this->data['booking_id'],$this->data['status']);
			    	   }
			       	   			       	   			       	   			       	   			       	   			       	  
			       } else $this->msg  = merchantApp::t("ERROR: Cannot update");
			    	
			   } else $this->msg=$this->t("booking details not available");
			    
		} else {
				$this->code=3;
				$this->msg=$this->t("you session has expired or someone login with your account");
			}
		} else $this->msg=merchantApp::parseValidatorError($Validator->getError());	    	
		$this->output(); 			    	
	}
	
	public function actionloadTeamList()
	{
		if($res=merchantApp::getTeamByMerchantID($this->data['mtid'])){		   
		   $this->msg="OK"; $this->code=1;
		   $this->details=$res;
		} else $this->msg=$this->t("You dont have current team");
		$this->output();
	}
	
	public function actionDriverList()
	{		
		if (FunctionsV3::hasModuleAddon("driver")){
			Yii::app()->setImport(array(			
			  'application.modules.driver.components.*',
		   ));
		   if ( $res = Driver::getDriverByTeam($this->data['team_id'])){		   	  
		   	  $this->code=1;
		   	  $this->msg="OK";
		   	  $this->details=$res;
		   } else $this->msg=$this->t("Team selected has no driver");
		} else $this->msg=$this->t("Missing addon driver app");
		$this->output();
	}
	
	public function actionAssignTask()
	{
		$Validator=new Validator;
		$req=array(
		  'driver_id'=>$this->t("Please select a driver"),
		  'team_id'=>$this->t("Please select a team")		  
		);
		$Validator->required($req,$this->data);
		if ($Validator->validate()){
		
			$DbExt=new DbExt; 
			$assigned_task='assigned';
			$params=array(
			  'team_id'=>$this->data['team_id'],
			  'driver_id'=>$this->data['driver_id'],
			  'status'=>$assigned_task,
			  'date_modified'=>FunctionsV3::dateNow(),
			  'ip_address'=>$_SERVER['REMOTE_ADDR']
			);			
			if ( $DbExt->updateData("{{driver_task}}",$params,'task_id',$this->data['task_id'])){
				
				$this->code=1;
				$this->msg=merchantApp::t("Successfully Assigned");
				$this->details='';
				
				
				$DbExt->updateData("{{order}}",array(
				  'status'=>$assigned_task
				  ),'order_id',$this->data['order_id']);
				
				/*add to history*/
				if ( $res=Driver::getTaskId($this->data['task_id'])){					
					$status_pretty = Driver::prettyStatus($res['status'],$assigned_task);
					
					$remarks_args=array(
					  '{from}'=>$res['status'],
					  '{to}'=>$assigned_task
					);
					$params_history=array(
					  'order_id'=>$res['order_id'],
					  'remarks'=>$status_pretty,
					  'status'=>$assigned_task,
					  'date_created'=>FunctionsV3::dateNow(),
					  'ip_address'=>$_SERVER['REMOTE_ADDR'],
					  'task_id'=>$this->data['task_id'],
					  'remarks2'=>"Status updated from {from} to {to}",
					  'remarks_args'=>json_encode($remarks_args)
					);							
					$DbExt->insertData('{{order_history}}',$params_history);
				}				
				
				/*send notification to driver*/
		        Driver::sendDriverNotification('ASSIGN_TASK',$res=Driver::getTaskId($this->data['task_id']));		        
		        if($res['order_id']>0){
			         if (FunctionsV3::hasModuleAddon("mobileapp")){
			         	
						/** Mobile save logs for push notification */						
						/*Yii::app()->setImport(array(			
						  'application.modules.mobileapp.components.*',
						));
						AddonMobileApp::savedOrderPushNotification(array(
						  'order_id'=>$res['order_id'],
						  'status'=>$res['status'],
						));*/
					 }
		        }
				
			} else $this->msg=Merchant::t("failed cannot update record");
			
		} else $this->msg=merchantApp::parseValidatorError($Validator->getError());	  
		$this->output();
	}
	
	public function actionPendingBookingTab()
	{
		$this->actionPendingBooking();
	}
	
	public function actionprint()
	{		
		$order_id = isset($this->data['order_id'])?$this->data['order_id']:'';
		$_GET['backend']=true; $print = array();
		if ( $data=Yii::app()->functions->getOrder2($order_id)){
			$merchant_id=$data['merchant_id'];
			$json_details=!empty($data['json_details'])?json_decode($data['json_details'],true):false;				
			if ( $json_details !=false){
				Yii::app()->functions->displayOrderHTML(array(
			   'order_id'=>$order_id,
			   'merchant_id'=>$data['merchant_id'],
			   'delivery_type'=>$data['trans_type'],
			   'delivery_charge'=>$data['delivery_charge'],
			   'packaging'=>$data['packaging'],
			   'cart_tip_value'=>$data['cart_tip_value'],
			   'cart_tip_percentage'=>$data['cart_tip_percentage']/100,
			   'card_fee'=>$data['card_fee'],
			   'tax'=>$data['tax'],
			   'points_discount'=>isset($data['points_discount'])?$data['points_discount']:'' /*POINTS PROGRAM*/,
			   'voucher_amount'=>$data['voucher_amount'],
			   'voucher_type'=>$data['voucher_type']
			  ),$json_details,true,$order_id);
			}
			
			$print[]=array( 'label'=> t("Customer Name"), 'value'=>$data['full_name'] );
			$print[]=array( 'label'=> t("Merchant Name"), 'value'=>$data['merchant_name']);
			if (isset($data['abn']) && !empty($data['abn'])){
				$print[]=array(
				 'label'=>Yii::t("default","ABN"),
				 'value'=>$data['abn']
				);
			}
			$print[]=array('label'=>Yii::t("default","Telephone"),'value'=>$data['merchant_contact_phone']);
			
			$merchant_info=Yii::app()->functions->getMerchant(isset($merchant_id)?$merchant_id:'');
			$full_merchant_address=$merchant_info['street']." ".$merchant_info['city']. " ".$merchant_info['state'].
			" ".$merchant_info['post_code'];
		
			$print[]=array('label'=>Yii::t("default","Address"),'value'=>$full_merchant_address);
			
			$print[]=array('label'=>Yii::t("default","TRN Type"),'value'=>t($data['trans_type']));
			
			$print[]=array(
			 'label'=>Yii::t("default","Payment Type"),
			 'value'=>FunctionsV3::prettyPaymentType('payment_order',$data['payment_type'],$order_id,$data['trans_type'])
			);	       
		   
			if ( $data['payment_provider_name']){
				$print[]=array('label'=>Yii::t("default","Card#"),'value'=>strtoupper($data['payment_provider_name']));
			}
			
			if ( $data['payment_type'] =="pyp"){
				$paypal_info=Yii::app()->functions->getPaypalOrderPayment($order_id);
				$print[]=array(
				   'label'=>Yii::t("default","Paypal Transaction ID"),
				   'value'=>isset($paypal_info['TRANSACTIONID'])?$paypal_info['TRANSACTIONID']:''
				);
			}
						
			$print[]=array(
			 'label'=>Yii::t("default","Reference #"),
			 'value'=>Yii::app()->functions->formatOrderNumber($data['order_id'])
			);
			
			if ( !empty($data['payment_reference'])){
				$print[]=array(
				  'label'=>Yii::t("default","Payment Ref"),
				  'value'=>isset($data['payment_reference'])?$data['payment_reference']:Yii::app()->functions->formatOrderNumber($data['order_id'])
				);
			}
			
			if ( $data['payment_type']=="ccr" || $data['payment_type']=="ocr"){
				$print[]=array(
				  'label'=>Yii::t("default","Card #"),
				  'value'=>Yii::app()->functions->maskCardnumber($data['credit_card_number'])
				);
			}
			
			$trn_date=date('M d,Y G:i:s',strtotime($data['date_created']));
			$print[]=array(
			  'label'=>Yii::t("default","TRN Date"),
			  'value'=>$trn_date
			);
						
			/*dump($data);
			dump($print);
			die();*/
			
			switch ($data['trans_type']) {
				case "delivery":	        		
					$print[]=array(
					 'label'=>Yii::t("default","Delivery Date"),
					 'value'=>Yii::app()->functions->translateDate($data['delivery_date'])
					);
					
					if(!empty($data['delivery_time'])){
					   $print[]=array(
						 'label'=>Yii::t("default","Delivery Time"),
						 'value'=>Yii::app()->functions->timeFormat($data['delivery_time'],true)
					   );
					}
					
					if(!empty($data['delivery_asap'])){
						$delivery_asap=$data['delivery_asap']==1?t("Yes"):'';
						$print[]=array(
						 'label'=>Yii::t("default","Deliver ASAP"),
						 'value'=>$delivery_asap
						);
					}
					
					if (!empty($data['client_full_address'])){		         	
					   $delivery_address=$data['client_full_address'];
					} else $delivery_address=$data['full_address'];		
										
					$print[]=array(
					  'label'=>Yii::t("default","Deliver to"),
					  'value'=>$delivery_address
					);
					
					$print[]=array(
					  'label'=>Yii::t("default","Delivery Instruction"),
					  'value'=>$data['delivery_instruction']
					);         
					
					$print[]=array(
					  'label'=>Yii::t("default","Location Name"),
					  'value'=>$data['location_name']
					);
			   
					$print[]=array(
					  'label'=>Yii::t("default","Contact Number"),
					  'value'=>$data['contact_phone']
					);
					
					if ($data['order_change']>=0.1){
						$print[]=array(
						  'label'=>Yii::t("default","Change"),
						  'value'=>normalPrettyPrice($data['order_change'])
						);
					}
				
					break;
				
				case "pickup":		
				case "dinein":		
				
					$label_date=t("Pickup Date");
					$label_time=t("Pickup Time");
					if ($data['trans_type']=="dinein"){
						$label_date=t("Dine in Date");
						$label_time=t("Dine in Time");
					}   
					
					if (isset($data['contact_phone1'])){
						if (!empty($data['contact_phone1'])){
							$data['contact_phone']=$data['contact_phone1'];
						}
					}
				
					$print[]=array(
					  'label'=>Yii::t("default","Contact Number"),
					  'value'=>$data['contact_phone']
					);
					
					$print[]=array(
					 'label'=>$label_date,
					 'value'=>Yii::app()->functions->translateDate($data['delivery_date'])
					);
					
					if(!empty($data['delivery_time'])){
					   $print[]=array(
						 'label'=>$label_time,
						 'value'=>Yii::app()->functions->timeFormat($data['delivery_time'],true)
					   );
					}
					
					if ($data['order_change']>=0.1){
						$print[]=array(
						  'label'=>Yii::t("default","Change"),
						  'value'=>normalPrettyPrice($data['order_change'])
						);
					}
					
					if ($data['trans_type']=="dinein"){
						$print[]=array(
						  'label'=>t("Number of guest"),
						  'value'=>$data['dinein_number_of_guest']
						);
						$print[]=array(
						  'label'=>t("Special instructions"),
						  'value'=>$data['dinein_special_instruction']
						);
					}
				
				   break;
			
				default:
					break;
			}
			
			/*PRINTER ADDON*/
			if (FunctionsV3::hasModuleAddon("printer")){
				Yii::app()->setImport(array('application.modules.printer.components.*'));
								
				$html = getOption($merchant_id,'mt_printer_receipt_tpl');
				if($print_receipt = ReceiptClass::formatReceipt($html,$print,Yii::app()->functions->details['raw'],$data)){
				   PrinterClass::printReceiptMerchant($merchant_id,$data['order_id'],$print_receipt,true);
				}		
				FunctionsV3::fastRequest(FunctionsV3::getHostURL().Yii::app()->createUrl("printer/cron/processprint"));	
				
				$this->msg = 1;
				$this->msg = merchantApp::t("Print request has been sent");
				$this->details='';
				
			} else $this->msg = merchantApp::t("Printer addon not available");
	
		} else $this->msg = merchantApp::t("Order not found");
		$this->output();
	}
	
	
	public function actiongetCountUnOpenOrder()
	{		
		$mtid=isset($this->data['mtid'])?$this->data['mtid']:'';
		
		if($mtid<=0){
			$this->msg = $this->t("Invalid merchant id");
			$this->output();
		}				
		if ( $res=merchantApp::validateToken($this->data['mtid'],$this->data['token'],$this->data['user_type'])){
			
			if ( $resp = merchantApp::getUnOpenOrder($mtid)){			
				$this->code = 1;
				$this->msg = Yii::t("merchantapp-backend","[total] New Order has been placed.",array(
				  '[total]'=>$resp['total_unopen']
				));

				$sub_message = Yii::t("merchantapp-backend","Order id #[order_id]",array(
				  '[order_id]'=>$resp['order_id']
				));
											
				$this->details = array(
				  'total_unopen'=>$resp['total_unopen'],
				  'total_order'=>$resp['total_order'],
				  'sub_message'=>$sub_message
				);
			} else $this->msg="no results";
		
		} else {
			$this->code = 3;
			$this->msg=$this->t("you session has expired or someone login with your account");
		}
		
		$this->output();
	}
	
	public function actiontrackDriver()
	{		
		if ($res=merchantApp::validateToken($this->data['mtid'],
		    $this->data['token'],$this->data['user_type'])){
		    if (FunctionsV3::hasModuleAddon("driver")){
		    	$driver_id = isset($this->data['driver_id'])?$this->data['driver_id']:'';
		    	if($driver_id>0){
		    	  if ( $data = Driver::driverInfo($driver_id)){
		    	  	  $this->code = 1;
		    	  	  $this->msg="OK";
		    	  	  $this->details = array(
		    	  	      'driver_id'=>$data['driver_id'],
		    	  	      'device_platform'=>$data['device_platform'],
		    	  	      'location_lat'=>$data['location_lat'],
		    	  	      'location_lng'=>$data['location_lng'],
		    	  	  );
		    	  } else $this->msg = $this->t("No record found");
		    	} else $this->msg = $this->t("Invalid driver id");
		    } else $this->msg = $this->t("No driver app addon found");
		 } else {
			$this->code=3;
			$this->msg=$this->t("you session has expired or someone login with your account");
	    }			
		$this->output();
	}
	
	public function actionreRegisterDevice()
	{
		
		$new_device_id = isset($this->data['new_device_id'])?$this->data['new_device_id']:'';
		if(empty($new_device_id)){
			$this->msg = $this->t("New device id is empty");
			$this->output();
		}
		
		$mtid = isset($this->data['mtid'])?$this->data['mtid']:'';
		$token= isset($this->data['token'])?$this->data['token']:'';
		$user_type= isset($this->data['user_type'])?$this->data['user_type']:'';
		
		if($mtid<=0){
			$this->msg = $this->t("Invalid merchant id");
			$this->output();
		}
		
		$db=new DbExt();		
		if ($res=merchantApp::validateToken($mtid,$token,$user_type)){	
		    
		    $merchant_user_id = isset($res['merchant_user_id'])?$res['merchant_user_id']:'';
		    		  
		    if ( $resp=merchantApp::getMerchantDeviceInfoByType($res['user_type'] ,$res['merchant_id'], $merchant_user_id)){
			 	$resp=$resp[0];			    
			    /*UPDDATE DEVICE ID*/
			    $id = $resp['id'];
			    $params = array(
			      'device_id'=>trim($new_device_id),
			      'date_modified'=>FunctionsV3::dateNow(),
			      'ip_address'=>$_SERVER['REMOTE_ADDR']
			    );					    			       
			    if ($db->updateData("{{mobile_device_merchant}}",$params,'id',$id)){
			    	$this->code = 1;
			    	$this->msg ="UPDATE OK";
			    	$this->details = $new_device_id;
			    } else $this->msg = Merchant::t("failed cannot update record");
		   } else {
		   	  /*INSERT TO DEVICE TABLE*/
		   	  $params=array(
				  'merchant_id'=>$res['merchant_id'],
				  'merchant_user_id'=>isset($res['merchant_user_id'])?$res['merchant_user_id']:0,
				  'user_type'=>$res['user_type'],
				  'device_platform'=>$this->data['device_platform'],
				  'device_id'=>trim($new_device_id),
				  'enabled_push'=>1,
				  'date_created'=>FunctionsV3::dateNow(),
				  'ip_address'=>$_SERVER['REMOTE_ADDR'],						  
			   );					   
			   if($db->insertData("{{mobile_device_merchant}}",$params)){
			     	$this->code = 1;
			    	$this->msg ="ADD OK";
			    	$this->details = $new_device_id;
			   } else $this->msg = $this->t("Failed cannot insert records");
		   }
		    	
		} else $this->t("you session has expired or someone login with your account");
		$this->output();
	}
	
	public function actionloadCancelOrder()
	{
		$Validator=new Validator;
		$req=array(
		  'token'=>$this->t("token is required"),
		  'mtid'=>$this->t("merchant id is required"),
		  'user_type'=>$this->t("user type is required"),
		);
		$Validator->required($req,$this->data);
		if ($Validator->validate()){
			if ( $res=merchantApp::validateToken($this->data['mtid'],
			    $this->data['token'],$this->data['user_type'])){
			    	
			    			    			    
			    $DbExt=new DbExt;	
				$stmt="
				SELECT a.*,
				(
				select concat(first_name,' ',last_name)
				from 
				{{client}}
				where
				client_id=a.client_id
				limit 0,1				
				) as customer_name
				
				FROM
				{{order}} a
				WHERE
				merchant_id=".$this->q($res['merchant_id'])."

				AND status NOT in ('".initialStatus()."')
				AND request_cancel='1'		        
		        AND request_cancel_status='pending'			
				
				ORDER BY date_created DESC
				LIMIT 0,100
				";				
				//dump($stmt);
				if ( $res=$DbExt->rst($stmt)){					
					$this->code=1; $this->msg="OK";					
					foreach ($res as $val) {							
						$data[]=array(						  
						  'cancel_order'=>1,
						  'order_id'=>$val['order_id'],
						  'viewed'=>$val['viewed'],
						  'status_raw'=>strtolower($val['status']),
						  'status'=>merchantApp::t($val['status']),			
						  'trans_type_raw'=>$val['trans_type'],			  
						  'trans_type'=>merchantApp::t($val['trans_type']),						  
						  'total_w_tax'=>$val['total_w_tax'],						  
						  'total_w_tax_prety'=>merchantApp::prettyPrice($val['total_w_tax']),
						  'transaction_date'=>Yii::app()->functions->FormatDateTime($val['date_created'],true),
						  'transaction_time'=>Yii::app()->functions->timeFormat($val['date_created'],true),
						  'delivery_time'=>Yii::app()->functions->timeFormat($val['delivery_time'],true),
						  'delivery_asap'=>$val['delivery_asap']==1?merchantApp::t("ASAP"):'',
						  'delivery_date'=>Yii::app()->functions->FormatDateTime($val['delivery_date'],false),
						  'customer_name'=>!empty($val['customer_name'])?$val['customer_name']:$this->t('No name')
						);
					}									
					
					$this->code=1;
					$this->msg="OK";
					$this->details=array(
					  'data'=>$data,
					  'total_order'=>count($data),					  
					);
				} else $this->msg=$this->t("no current orders");
			} else {
				$this->code=3;
				$this->msg=$this->t("you session has expired or someone login with your account");
			}
		} else $this->msg=merchantApp::parseValidatorError($Validator->getError());	    			
		$this->output();
	}
	
	public function actionapprovedOrder()
	{
		$order_id = isset($this->data['order_id'])?$this->data['order_id']:'';
		$mtid = isset($this->data['mtid'])?$this->data['mtid']:'';
		$token= isset($this->data['token'])?$this->data['token']:'';
		$user_type= isset($this->data['user_type'])?$this->data['user_type']:'';
		
		if($mtid<=0){
			$this->msg = $this->t("Invalid merchant id");
			$this->output();
		}
		if($order_id<=0){
			$this->msg = $this->t("Invalid order id");
			$this->output();
		}
		
		$db=new DbExt();		
		if ($data=merchantApp::validateToken($mtid,$token,$user_type)){	
			if ( $res = Yii::app()->functions->getOrder($order_id)){
				
				$default_cancel_status = 'cancelled';
				$website_review_approved_status  = getOptionA('website_review_approved_status');
				if(!empty($website_review_approved_status)){
					$default_cancel_status=$website_review_approved_status;
				}
				
				$params = array(
				  'request_cancel'=>2,
				  'status'=>$default_cancel_status,
				  'request_cancel_status'=>'approved',
				  'date_modified'=>FunctionsV3::dateNow(),
				  'ip_address'=>$_SERVER['REMOTE_ADDR']
				);
								
											
				$db=new DbExt();
				if ( $db->updateData("{{order}}",$params,'order_id',$order_id)){
					
					$this->code =1;
					$this->msg = "OK";
					$this->details='';
					
				    /*UPDATE REVIEWS BASED ON STATUS*/
					if (method_exists('FunctionsV3','updateReviews')){
						FunctionsV3::updateReviews($order_id , $default_cancel_status );
					}
					
					FunctionsV3::notifyCustomerCancelOrder($res, t($params['request_cancel_status']) );
					
					/*UPDATE POINTS BASED ON ORDER STATUS*/    				
    				if (FunctionsV3::hasModuleAddon("pointsprogram")){
						if (method_exists('PointsProgram','updateOrderBasedOnStatus')){
						   PointsProgram::updateOrderBasedOnStatus($default_cancel_status,$order_id);
						}
						if (method_exists('PointsProgram','udapteReviews')){
						   PointsProgram::udapteReviews($order_id,$default_cancel_status);
						}
					}			    				    				
					
				} else $this->msg = t("ERROR: cannot update order.");
				
			} else $this->msg = $this->t("order records not found");
		} else  {
			$this->code =3;
			$this->msg = $this->t("you session has expired or someone login with your account");
		}
		$this->output();
	}
	
	public function actiondeclineOrder()
	{
		$order_id = isset($this->data['order_id'])?$this->data['order_id']:'';
		$mtid = isset($this->data['mtid'])?$this->data['mtid']:'';
		$token= isset($this->data['token'])?$this->data['token']:'';
		$user_type= isset($this->data['user_type'])?$this->data['user_type']:'';
		
		if($mtid<=0){
			$this->msg = $this->t("Invalid merchant id");
			$this->output();
		}
		if($order_id<=0){
			$this->msg = $this->t("Invalid order id");
			$this->output();
		}
		
		$db=new DbExt();		
		if ($data=merchantApp::validateToken($mtid,$token,$user_type)){	
			if ( $res = Yii::app()->functions->getOrder($order_id)){
				
				$params = array(
				  'request_cancel'=>2,				  
				  'request_cancel_status'=>'decline',
				  'date_modified'=>FunctionsV3::dateNow(),
				  'ip_address'=>$_SERVER['REMOTE_ADDR']
				);		
								
				$db=new DbExt();
				if ( $db->updateData("{{order}}",$params,'order_id',$order_id)){
					
					$this->code =1;
					$this->msg = "OK";
					$this->details='';
					
					FunctionsV3::notifyCustomerCancelOrder($res, t($params['request_cancel_status']) );
					
				} else $this->msg = t("ERROR: cannot update order.");
				
			} else $this->msg = $this->t("order records not found");
		} else  {
			$this->code = 3;
			$this->msg = $this->t("you session has expired or someone login with your account");
		}
		$this->output();
	}
	
	public function actiongetCancelOrder()
	{		
		$mtid = isset($this->data['mtid'])?$this->data['mtid']:'';
		$token= isset($this->data['token'])?$this->data['token']:'';
		$user_type= isset($this->data['user_type'])?$this->data['user_type']:'';
		
		if($mtid<=0){
			$this->msg = $this->t("Invalid merchant id");
			$this->output();
		}
				
		if ($data=merchantApp::validateToken($mtid,$token,$user_type)){	
			
			if (method_exists("FunctionsV3","getNewCancelOrder")){
			    $new_order_count = FunctionsV3::getNewCancelOrder($mtid);
			} else {
				$new_order_count = merchantApp::getNewCancelOrder($mtid);
			}
			if ($new_order_count){
				$this->code = 1;
				$this->msg = Yii::t("merchantapp-backend","You have [count] new cancel order request",array(
				 '[count]'=>$new_order_count
				));
				$details = array(
				  'count'=>$new_order_count
				);
				$this->details = $details;
			} else $this->msg = t("no results");
		} else $this->msg = $this->t("you session has expired or someone login with your account");
		
		$this->output();
	}
	
	public function actionsetAppStatus()
	{		
		$mtid = isset($this->data['mtid'])?$this->data['mtid']:'';
		$token= isset($this->data['token'])?$this->data['token']:'';
		$user_type= isset($this->data['user_type'])?$this->data['user_type']:'';
		
		if($mtid<=0){
			$this->msg = $this->t("Invalid merchant id");
			$this->output();
		}
		
		if ($data=merchantApp::validateToken($mtid,$token,$user_type)){			
			$db = new DbExt();
			if($data['user_type']=="admin"){
				$stmt="UPDATE {{mobile_device_merchant}}
				SET app_status=".FunctionsV3::q($this->data['app_status'])."
				WHERE
				merchant_id=".FunctionsV3::q($data['merchant_id'])."				
				AND
				user_type='admin'				
				";								
			} else {
				$stmt="UPDATE {{mobile_device_merchant}}
				SET app_status=".FunctionsV3::q($this->data['app_status'])."
				WHERE
				merchant_id=".FunctionsV3::q($data['merchant_id'])."
				AND
				merchant_user_id=".FunctionsV3::q($data['merchant_user_id'])."	
				AND
				user_type='user'		
				";								
			}
			$db->qry($stmt);
			$this->code = 1;
			$this->msg = "OK";
		} else $this->msg = $this->t("you session has expired or someone login with your account");
		
		$this->output();
	}
	
	public function actionclearNotification()
	{
	
		$mtid = isset($this->data['mtid'])?$this->data['mtid']:'';
		$token= isset($this->data['token'])?$this->data['token']:'';
		$user_type= isset($this->data['user_type'])?$this->data['user_type']:'';
		
		if($mtid<=0){
			$this->msg = $this->t("Invalid merchant id");
			$this->output();
		}
		if ($data=merchantApp::validateToken($mtid,$token,$user_type)){					
			$user_id = isset($data['merchant_user_id'])?$data['merchant_user_id']:'';
			if (merchantApp::clearNotification($data['user_type'], $data['merchant_id'] , $user_id )){
				$this->code = 1;
				$this->msg = "OK";
			} else $this->msg = $this->t("Failed cannot update records");
		} else $this->msg = $this->t("you session has expired or someone login with your account");
		
		$this->output();	
	}
	
} /*end class*/