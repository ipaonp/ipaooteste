
<?php if ( Yii::app()->functions->hasMerchantAccess("DashBoard")):?>


 <button type="button" class="btn  " data-toggle="modal" data-target="#broadcastNewModal" >
	 <?php echo Yii::t('default',"Send notification to all customers")?>
	 <ion-icon name="add"></ion-icon> 
	 </button>
<form id="frm_table_list" method="POST" class="report uk-form uk-form-horizontal merchant-dashboard" >
<h3><?php echo Yii::t("default","New Order List For Today")?> 
<?php 
/*$date= date('F d, Y');
$date=Yii::app()->functions->translateDate($date);
echo $date;*/
echo FormatDateTime(date('c'),false);
?>
</h3>

<input type="hidden" name="action" id="action" value="recentOrder">
<input type="hidden" name="tbl" id="tbl" value="item">
<table id="table_list" class="uk-table uk-table-hover uk-table-striped uk-table-condensed">
  <!--<caption>Merchant List</caption>-->
   <thead>
        <tr> 
            <th width="2%"><?php echo Yii::t('default',"Ref#")?></th>
            <th width="6%"><?php echo Yii::t('default',"Name")?></th>
            <th width="6%"><?php echo Yii::t('default',"Contact#")?></th>
            <th width="3%"><?php echo Yii::t('default',"Item")?></th>            
            <th width="3%"><?php echo Yii::t('default',"TransType")?></th>
            <th width="3%"><?php echo Yii::t('default',"Payment Type")?></th>
            <th width="3%"><?php echo Yii::t('default',"Total")?></th>
            <th width="3%"><?php echo Yii::t('default',"Tax")?></th>
            <th width="3%"><?php echo Yii::t('default',"Total W/Tax")?></th>
            <th width="3%"><?php echo Yii::t('default',"Status")?></th>
            <th width="3%"><?php echo Yii::t('default',"Platform")?></th>
            <th width="3%"><?php echo Yii::t('default',"Date")?></th>
            <th width="3%"></th>
        </tr>
    </thead>
    <tbody>    
    </tbody>
</table>
<div class="clear"></div>
</form>

<?php if($cancel_order_enabled==1):?>
<hr style="margin-top:20px;margin-bottom:20px;"></hr>

<div class="request_cancel_order_wrap">
<h3><?php echo t("New request cancel order")?></h3>
<form id="frm_table_list2" method="POST" class="report uk-form uk-form-horizontal merchant-dashboard" >
<input type="hidden" name="action" id="action" value="requestCancelOrderList">
<input type="hidden" name="tbl" id="tbl" value="item">
<table id="table_list2" class="uk-table uk-table-hover uk-table-striped uk-table-condensed">  
   <thead>
        <tr> 
            <th width="2%"><?php echo Yii::t('default',"Ref#")?></th>
            <th width="6%"><?php echo Yii::t('default',"Name")?></th>
            <th width="6%"><?php echo Yii::t('default',"Contact#")?></th>
            <th width="3%"><?php echo Yii::t('default',"Item")?></th>            
            <th width="3%"><?php echo Yii::t('default',"TransType")?></th>
            <th width="3%"><?php echo Yii::t('default',"Payment Type")?></th>
            <th width="3%"><?php echo Yii::t('default',"Total")?></th>
            <th width="3%"><?php echo Yii::t('default',"Tax")?></th>
            <th width="3%"><?php echo Yii::t('default',"Total W/Tax")?></th>
            <th width="3%"><?php echo Yii::t('default',"Status")?></th>
            <th width="3%"><?php echo Yii::t('default',"Platform")?></th>
            <th width="3%"><?php echo Yii::t('default',"Date")?></th>
            <th width="3%"></th>
        </tr>
    </thead>
    <tbody>    
    </tbody>
</table>
</form>
</div>
<?php endif;?>

<hr style="margin-top:20px;margin-bottom:40px;"></hr>


<div id="total_sales_chart" class="chart"></div>
<div id="total_sales_chart_by_item" class="chart"></div>

<?php else :?>
<h2><?php echo Yii::t("default","Welcome")?></h2>
<?php endif; ?>


<div class="modal fade" id="broadcastNewModal" tabindex="-1" role="dialog" aria-labelledby="broadcastNewModal" aria-hidden="true">
 <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header"> <h5 class="modal-title" ><?php echo Yii::t("default","send push")?></h5></div>
        
        <!--<form id="frm" method="post" onsubmit="return false;" data-action="save_broadcast">-->
        
        <?php echo CHtml::beginForm('','post'); 
		?> 
		
        <div class="modal-body">
        
	    
	<!--	<div class="form-group">
		<label><?php echo Yii::t("default","Push Title")?></label>
		<?php 
		echo CHtml::textField('push_title','',array('class'=>"form-control",'required'=>true ));
		?>
		</div> -->
		
		<div class="form-group">
		<label><?php echo Yii::t("default","Push Message")?></label>
		<?php 
		echo CHtml::textArea('push_message','',array('class'=>"form-control",'maxlength'=>"255",'required'=>true));
		?>
		</div> 
		
		<div class="form-group">
		<label><?php echo Yii::t("default","Select Customers")?></label>
		<select class="form-control valid" required="required" name="select_customers" id="select_customers" aria-invalid="false">
<!--<option value="1">all Customers</option>-->
<option value="2"><?php echo Yii::t("default","Your Customers");?></option>
</select>
		</div> 
        
        </div> <!--modal body-->
        
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">
           <?php echo Yii::t("default","Close")?>
          </button>
          <button type="submit" class="btn "><?php echo Yii::t("default","Send")?></button>
       </div>
       
      <!--</form>-->
      <?php echo CHtml::endForm() ; ?>
        
      </div><!-- content-->
 </div>
 
</div>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
      .modal-backdrop{
		  display:none
	  }
  </style>
  <script>
      /*MYCALL*/
	  	$("#frm").validate({
   	    submitHandler: function(form) {
   	    	 action = $("#frm").data("action");
   	    	 processAjax( action , $("#frm").serialize() );
		}
   	});
processAjax = function(action , data ){
	
	ajax_request = $.ajax({
	  url: ajaxurl+"/"+action,
	  method: "POST",
	  data: data ,
	  dataType: "json",
	  timeout: 20000,
	  crossDomain: true,
	  beforeSend: function( xhr ) {   
	  	 loader(1);        
         if(ajax_request != null) {	
         	dump("request aborted");     
         	ajax_request.abort();
            clearTimeout(timer);
         } else {         	
         	timer = setTimeout(function() {				
				ajax_request.abort();
				showToast( t('Request taking lot of time. Please try again') );
	        }, 20000); 
         }
      }
    });
    
    ajax_request.done(function( data ) {     	        
    	dump('done');
    	if (data.code==1){
    		switch (action){
    			case "save_broadcast":
    			  $('#broadcastNewModal').modal('hide')
    			  data_tables.ajax.reload();
    			  notify(data.msg);    			  
    			break;
    			
    			case "save_page":
    			  $('#pageNewModal').modal('hide')
    			  data_tables.ajax.reload();
    			  notify(data.msg);  
    			break;
    			
    			case "delete_page":
    			case "delete_home_banner":
    			  data_tables.ajax.reload();
    			break;
    			
    			case "get_page":
    			  datas = data.details.data;    			  
    			  $("#page_id").val(datas.page_id);
    			  $("#title").val(datas.title);
    			  $("#content").val(datas.content);
    			  $("#icon").val(datas.icon);
    			  $("#sequence").val(datas.sequence);
    			  $("#status").val(datas.status);
    			      			 
    			  if(datas.use_html==1){      			  	
    			  	$("#use_html").prop( "checked", true );
    			  } else {
    			  	 $("#use_html").prop( "checked", false );
    			  }   			  
    			  
    			  lang_list = data.details.lang;  
    			  if(lang_list.length>0){
    			  	 $.each(lang_list, function(key, val){
    			  	 	 field_name1 = "title_"+val;
    			  	 	 field_name2 = "content_"+val;     			  	 	 
    			  	 	 $("#"+ field_name1 ).val( datas[field_name1] );
    			  	 	 $("#"+ field_name2 ).val( datas[field_name2] );
    			  	 });
    			  }
    			  
    			  
    			break;
    			
    			case "send_push":
    			  $('#sendPushModal').modal('hide'); 
    			  notify(data.msg);
    			break;
    			
    			case "save_home_banner":
    			  if(!empty(data.details)){
    			  	  notify(data.msg);    			  	  
    			  	  setTimeout(function(){    			
    			  	  	window.location.href=data.details;
   		              }, 500);
    			  } else {
    			  	  notify(data.msg);
    			  }
    			break;
    			
    			default:
    			  notify(data.msg);
    			break;
    		}
    	} else {
    		//FAILED CONDITION
    		switch (action) {
    			case "get_device":
    			   $('#sendPushModal').modal('hide'); 
    			break;
    			
    			default:
    			notify(data.msg,'danger');
    			break;
    		}    		
    	}
    });
    
     /*ALWAYS*/
    ajax_request.always(function() {
    	loader(2);
        dump("ajax always");
        ajax_request=null;  
        clearTimeout(timer);
    });
    
    /*FAIL*/
    ajax_request.fail(function( jqXHR, textStatus ) {    	
    	clearTimeout(timer);
        notify( t("Failed") + ": " + textStatus );        
    }); 
	
};
/*END processAjax*/
  </script>