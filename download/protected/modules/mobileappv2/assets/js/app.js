var translator;
var data_tables;
var ajax_request;
var timer;

jQuery.fn.exists = function(){return this.length>0;}


dump = function(data) {
	console.debug(data);
};

$( document ).on( "keyup", ".numeric_only", function() {
  this.value = this.value.replace(/[^0-9\.]/g,'');
});	 

loader = function(is_loading){
	if(is_loading==1){		
		$(".content_wrap").loading({
			message : translator.get("loading"),
			zIndex: 999999999,
		});
	} else {
		$(".content_wrap").loading('stop');
	}
};

empty = function(data){	
	if (typeof data === "undefined" || data==null || data=="" || data=="null" || data=="undefined" ) {	
		return true;
	}
	return false;
};

t = function(words){
	return translator.get(words);
};

notify = function(message, alert_type ){
	
	if(empty(alert_type)){
		alert_type='success';
	}
	
	notify_icon = '';
	
	switch(alert_type)
	{
		case "success":
		notify_icon = 'fa fa-check-circle';
		break;
		
		case "danger":
		notify_icon = 'fa fa-bell-o';
		break;
	}
	
	$.notify({
		//icon: 'fa fa-check-circle',
		icon: notify_icon ,
		message: message,		
	},{
		type: alert_type ,		
		placement: {
		  from: "top",
		  align: "center"
	    },
	    animate:{
			enter: "animated fadeInUp",
			exit: "animated fadeOutDown"
		},
		delay : 1000*notify_delay,
		showProgressbar : true,		
		z_index: 9999999,
	});
};

jQuery(document).ready(function() {

	
	//$('#myTab li:nth-child(5) a').tab('show') 
	
	translator = $('body').translate({lang: lang , t: dict}); 	
	
	$('.menu_nav a').webuiPopover({
		trigger:'hover',
		placement:'right'
	});	
	
	$( document ).on( "click", ".show_password", function() {
		togle = $(this).data("togle");
		if(togle==1){
			$(this).text( translator.get("hide") );
			$(".show_password_field").attr("type","text");
			$(this).data("togle",2);			
		} else {
			$(this).text( translator.get("show") );
			$(".show_password_field").attr("type","password");
			$(this).data("togle",1);
		}
	});
	
	if( $("#uploadpushicon").exists() ){
		init_upload('uploadpushicon','android_push_icon');
		init_upload('uploadpushpicture','android_push_picture');
	}
	
	$( document ).on( "click", ".remove_picture", function() {
		ans = confirm( t("Are you sure?") );
		if(ans){
			id  = $(this).data('id');			
			fieldname  = $(this).data('fieldname');			
			$(".preview_"+ id).remove();
			$("#"+fieldname).val('');
		}
	});	
		
	$( document ).on( "click", ".copy_text", function() {
		$(this).focus();
		$(this).select();
		document.execCommand('copy');
		notify( t("copy to clipboard") );			
	});
	
	if ( $(".data_tables").exists() ){
		init_table( $(".data_tables").data("action_name") );
	}
	
	/*$( document ).on( "click", ".broadcast_new", function() {
		dump('broadcast_new');
	});*/
		
	$("#frm").validate({
   	    submitHandler: function(form) {
   	    	 action = $("#frm").data("action");
   	    	 processAjax( action , $("#frm").serialize() );
		}
   	});
   	
   	$('#broadcastNewModal,#pageNewModal,#sendPushModal').on('show.bs.modal', function (e) {
   		dump('show.bs.modal');
   		
   		if (current_page=="page_list"){
   		   $("#page_id").val('');
   		} else if ( current_page=="device_list" ){
   		   $("#id").val('');
   		}
   		
   		clear_forms("#frm");
   		var validator = $( "#frm" ).validate();
        validator.resetForm();        
   	});
   	$('#broadcastNewModal').on('shown.bs.modal', function (e) {
   		$("#push_title").focus();
   	});
   	   	   
   	$( document ).on( "click", ".delete_page", function() {
   		page_id = $(this).data("page_id");
   		ans = confirm( t("Are you sure?") );
   		if(ans){
   			processAjax("delete_page","page_id="+ page_id + addCSRF() );
   		}
   	});
   	   	
   	$( document ).on( "click", ".edit_page", function() {
   		page_id = $(this).data("page_id");   		
   		$('#pageNewModal').modal('show');   		
   		setTimeout(function(){ 
   			processAjax('get_page', "page_id="+ page_id + addCSRF() );
   		}, 100);
   	});
   	   	
   	$( document ).on( "click", ".send_push", function() {
   		id = $(this).data("id");   		
   		$('#sendPushModal').modal('show');   		
   		setTimeout(function(){ 
   			$("#id").val( id );
   		}, 100);
   	});   	   	
	
}); /*end docu*/

clear_forms = function(ele) {	
    $(ele).find(':input').each(function() {						    	
        switch(this.type) {
            case 'password':
            /*case 'select-multiple':
            case 'select-one':*/
            case 'text':
            case 'textarea':
                $(this).val('');
                break;
            case 'checkbox':
            case 'radio':
                this.checked = false;            
            
        }
   });
   
   $(".preview").remove();
}
	
init_upload = function(id,field_name){
				
	uploader = new ss.SimpleUpload({
		 button: id ,
		 url: ajaxurl + "/uploadFile/?id="+id +"&field_name="+field_name ,
		 //progressUrl: 'uploadProgress.php',
		 name: 'uploadfile',			 	
		 responseType: 'json',			 
		 allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],			 
		 maxSize: image_limit_size,
		 onExtError: function(filename,extension ){
		 	loader(2);
		    notify(  translator.get("invalid_file_extension") ,'danger');
	     },
	     onSizeError: function (filename,fileSize){ 
	     	loader(2);
		    notify(  translator.get("invalid_file_size") ,'danger');
	     },    
		 onSubmit: function(filename, extension) {				 	
		 	//this.setProgressBar(sau_progress);	
		 	loader(1);
		 },
		 onComplete: function(filename, response) {			 	 
		 	 loader(2);
		 	 $(".preview_"+id).remove();
		 	 
		 	 if(response.code==1){		 	 	
		 	 	$("#"+field_name).val( response.details.file_name );
		 	 	parent = $("#"+id).parent();		 	 	
		 	 	parent.after( response.details.html_preview );
		 	 } else {
		 	 	notify(response.msg,'danger');
		 	 }
		 }
	});
};

init_table = function(action_name){
	$.fn.dataTable.ext.errMode = 'none';
	
	extra_data = {};
	
	if(current_page=="broadcast_details"){
		extra_data = {
			'broadcast_id' : $("#broadcast_id").val()
		};
	}
	
	data_tables = $('.data_tables').on('preXhr.dt', function ( e, settings, data ) {
        dump('loading');        
        $(".refresh_datatables").html( t("Loading...") + '&nbsp;<ion-icon name="refresh"></ion-icon>' );
     }).on('xhr.dt', function ( e, settings, json, xhr ) {
     	dump('done');     	
     	$(".refresh_datatables").html( t("Refresh") + '&nbsp;<ion-icon name="refresh"></ion-icon>' );
     	$(".dataTables_processing").hide();
     }).on( 'error.dt', function ( e, settings, techNote, message ) {
     	notify( t(error_ajax_message) + ": " + message,'danger' );
     }).DataTable( {
     	"aaSorting": [[ 0, "DESC" ]],	
        "processing": true,
        "serverSide": true,
        "pageLength": page_length,
        //"ajax": ajaxurl+"/"+action_name,        
         "ajax": {
		    "url": ajaxurl+"/"+action_name,
		    "data": extra_data
		},
        language: {
	        url: ajaxurl+"/datable_localize"
	    }
     });
};


/*MYCALL*/
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

clearField = function(id){
	$("#"+id).val('');
};

addCSRF = function(){
	return "&YII_CSRF_TOKEN="+ YII_CSRF_TOKEN;
};

jQuery(document).ready(function() {
		
	$( document ).on( "click", ".paynow_stripe", function() {			
		loader(true);					
		stripe.redirectToCheckout({		  
		  sessionId: stripe_session,
		}).then(function (result) {
			loader(true);		    
		    notify(result.error.message,"danger");	   	  	 
		});		
	});
	

	$( document ).on( "click", ".refresh_datatables", function() {			
		$('.data_tables').DataTable().ajax.reload();
	});		
	
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		element = e.target;		
		if( element.id=="nav-map"){
			if(empty(map)){
			   if( $("#mobile2_default_lat").val() !="" ) {		   	  
			   	  initSetMap( '#map_wrapper' , mobile2_default_lat , mobile2_default_lng);
			   } else {		   	  
			      initGeolocate('#map_wrapper');
			   }
			}
		}
	});
	
	if( $('.chosen').exists() ) {     
       $(".chosen").chosen({
       	  allow_single_deselect:true,
       	  no_results_text: t("No results match"),
          placeholder_text_single: t("Select Some Options"), 
          placeholder_text_multiple: t("Select Some Options")
       }); 	
    } 
    
    if( $("#multi_upload").exists() ){
    	init_multi_upload('multi_upload','mobileapp2_startup_banner');
    }
        
    $( document ).on( "click", ".multi_remove_picture", function() {
    	ans = confirm( t("Are you sure?") );
    	if(ans){
			parent = $(this).parent().parent();
			parent.remove();
		}
    });	
    
    if( $("#upload_banner").exists() ){
    	init_upload('upload_banner','home_banner');
    }
    
    $( document ).on( "click", ".delete_home_banner", function() {
   		banner_id = $(this).data("banner_id");
   		ans = confirm( t("Are you sure?") );
   		if(ans){
   			processAjax("delete_home_banner","banner_id="+ banner_id + addCSRF() );
   		}
   	});
		
});
/*end docu*/

init_multi_upload = function(id,field_name){
	
	uploader = new ss.SimpleUpload({
		 button: id ,
		 url: ajaxurl + "/uploadFile/?id="+id +"&field_name="+field_name ,		 
		 name: 'uploadfile',			 	
		 multipleSelect: true, 	
		 multipart: true,
         multiple: true,
		 responseType: 'json',			 
		 allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],			 
		 maxSize: image_limit_size,
		 onExtError: function(filename,extension ){
		 	loader(2);
		    notify(  translator.get("invalid_file_extension") ,'danger');
	     },
	     onSizeError: function (filename,fileSize){ 
	     	loader(2);
		    notify(  translator.get("invalid_file_size") ,'danger');
	     },    
		 onSubmit: function(filename, extension) {				 	
		 	//this.setProgressBar(sau_progress);	
		 	loader(1);
		 },
		 onComplete: function(filename, response) {			 	 
		 	 loader(2);
		 	 //$(".preview_"+id).remove();
		 	 
		 	 if(response.code==1){		 	 	
		 	 	//alert(response.details.file_name);		 	 	
		 	 	parent = $("#"+id).parent();		 	 			 	 			 	 	
		 	 	parent.after( response.details.html_preview );
		 	 } else {
		 	 	notify(response.msg,'danger');
		 	 }
		 }
	});
	
};
	

/*1.4*/

jQuery(document).ready(function() {

   if( $('#sortable1').exists() ) {  
     $( "#sortable1" ).sortable();    
   }
   
});
/*end docu*/   