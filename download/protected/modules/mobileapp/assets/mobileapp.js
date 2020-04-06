jQuery.fn.exists = function(){return this.length>0;}

var data_table;

function dump(data)
{
	console.debug(data);
}

jQuery(document).ready(function() {	

	$('.numeric_only').keyup(function () {     
      this.value = this.value.replace(/[^0-9\.]/g,'');
    });	
	
	if( $(".chosen").exists() ) {
       $(".chosen").chosen({
       	  allow_single_deselect:true,
       	  width: '100%'
       });     
    } 
    
   if ( $("#upload-file").exists()) {
	   var uploader = new ss.SimpleUpload({
	       button: 'upload-file', // HTML element used as upload button
	       url: ajaxurl+"/upload", // URL of server-side upload handler
	       name: 'uploadfile', // Parameter name of the uploaded file
	       responseType: 'json',
	       allowedExtensions: ['png', 'jpeg','jpg'],
		   maxSize: 11024, // kilobytes
		   onExtError: function(filename,extension ){
			   nAlert("Invalid File extennsion","warning");
		   },
		   onSizeError: function (filename,fileSize){ 
			   nAlert("Invalid File size","warning");  
		   },       
		   onSubmit: function(filename, extension) {      	            
		   	  busy(true);
		   },	
		   onComplete: function(filename, response) {	   	  
		   	  dump(response);
		   	  busy(false);
		   	  if (response.code==1){	   	  	 	   	  	 
		   	  	 nAlert(response.msg,"success");
		   	  	 $("#mobile_default_image_not_available").val(filename);
		   	  	 $(".my-thumb").attr("src",response.details);
		   	  } else {
		   	  	 nAlert(response.msg,"warning");	   	  	 
		   	  }
		   }
	    });    
   }
   
   if ( $("#table_list").exists() ) {
       initTable();
   }
           	
});/* end docu*/

function busy(e)
{
    if (e) {
        $('body').css('cursor', 'wait');	
    } else $('body').css('cursor', 'auto');        
    
    if (e) {
    	$("body").before("<div class=\"preloader\"></div>");
    } else $(".preloader").remove();
    
}

function initTable()
{		
	var params=$("#frm_table").serialize();	
	
	data_table = $('#table_list').dataTable({		
		   "iDisplayLength": 20,
	       "bProcessing": true, 	       
	       "bServerSide": true,
	       //"sAjaxSource": ajaxurl+"/"+ $("#action").val()+"/?currentController=admin",	       
	       "sAjaxSource": ajaxurl+"/"+ $("#action").val()+"/?currentController=admin&"+params,	       
	       "aaSorting": [[ 0, "DESC" ]],	       
           "sPaginationType": "full_numbers",   
           //"bFilter":false,            
           "bLengthChange": false,
	       "oLanguage":{	       	 
	       	 //"sProcessing": "<p>Processing.. <i class=\"fa fa-spinner fa-spin\"></i></p>"
	       	   "sEmptyTable":    js_translation.tablet_1,
			    "sInfo":           js_translation.tablet_2,
			    "sInfoEmpty":      js_translation.tablet_3,
			    "sInfoFiltered":   js_translation.tablet_4,
			    "sInfoPostFix":    "",
			    "sInfoThousands":  ",",
			    "sLengthMenu":     js_translation.tablet_5,
			    "sLoadingRecords": js_translation.tablet_6,
			    "sProcessing":     js_translation.tablet_7,
			    "sSearch":         js_translation.tablet_8,
			    "sZeroRecords":    js_translation.tablet_9,
			    "oPaginate": {
			        "sFirst":    js_translation.tablet_10,
			        "sLast":     js_translation.tablet_11,
			        "sNext":     js_translation.tablet_12,
			        "sPrevious": js_translation.tablet_13
			    },
			    "oAria": {
			        "sSortAscending":  js_translation.tablet_14,
			        "sSortDescending": js_translation.tablet_15
			    }
	       },	       
	       "fnInitComplete": function(oSettings, json) {	       	  		      
		   }		
	});
	   		
}

function nAlert(msg,alert_type)
{
	var n = noty({
		 text: msg,
		 type        : alert_type ,		 
		 theme       : 'relax',
		 layout      : 'topCenter',		 
		 timeout:2000,
		 animation: {
	        open: 'animated fadeInDown', // Animate.css class names
	        close: 'animated fadeOut', // Animate.css class names	        
	    }
	});
	
}

jQuery(document).ready(function() {	
	
   if ( $("#upload-file").exists()) {
	   var uploader = new ss.SimpleUpload({
	       button: 'upload-certificate-dev', // HTML element used as upload button
	       url: ajaxurl+"/uploadCertificate", // URL of server-side upload handler
	       name: 'uploadfile', // Parameter name of the uploaded file
	       responseType: 'json',
	       allowedExtensions: ['pem'],
		   maxSize: 11024, // kilobytes
		   onExtError: function(filename,extension ){
			   nAlert("Invalid File extennsion","warning");
		   },
		   onSizeError: function (filename,fileSize){ 
			   nAlert("Invalid File size","warning");  
		   },       
		   onSubmit: function(filename, extension) {      	            
		   	  busy(true);
		   },	
		   onComplete: function(filename, response) {	   	  
		   	  dump(response);
		   	  busy(false);
		   	  if (response.code==1){	   	  	 	   	  	 
		   	  	 nAlert(response.msg,"success");
		   	  	 $("#ios_push_dev_cer").val(filename);		   	  	 
		   	  } else {
		   	  	 nAlert(response.msg,"warning");	   	  	 
		   	  }
		   }
	    });    
   }	
   
   if ( $("#upload-certificate-prod").exists()) {
	   var uploader = new ss.SimpleUpload({
	       button: 'upload-certificate-prod', // HTML element used as upload button
	       url: ajaxurl+"/uploadCertificate", // URL of server-side upload handler
	       name: 'uploadfile', // Parameter name of the uploaded file
	       responseType: 'json',
	       allowedExtensions: ['pem'],
		   maxSize: 11024, // kilobytes
		   onExtError: function(filename,extension ){
			   nAlert("Invalid File extennsion","warning");
		   },
		   onSizeError: function (filename,fileSize){ 
			   nAlert("Invalid File size","warning");  
		   },       
		   onSubmit: function(filename, extension) {      	            
		   	  busy(true);
		   },	
		   onComplete: function(filename, response) {	   	  
		   	  dump(response);
		   	  busy(false);
		   	  if (response.code==1){	   	  	 	   	  	 
		   	  	 nAlert(response.msg,"success");
		   	  	 $("#ios_push_prod_cer").val(filename);		   	  	 
		   	  } else {
		   	  	 nAlert(response.msg,"warning");	   	  	 
		   	  }
		   }
	    });    
   }	
   
   
   $('.nav-tabs a').click(function (e) {
	  e.preventDefault()
	  $(this).tab('show')
   });
   
   if ( $("#translation-save-wrap").exists() ){
       $("#translation-save-wrap").sticky({topSpacing:0});
   }
      
   $('.export-language').click(function (e) {   	   
   	   dump(ajaxurl);
   	   openExportWindow(100,100,ajaxurl+"/exportlang");
   });
   
   if ( $("#import-language").exists()) {
	   var uploader = new ss.SimpleUpload({
	       button: 'import-language', // HTML element used as upload button
	       url: ajaxurl+"/importLang", // URL of server-side upload handler
	       name: 'uploadfile', // Parameter name of the uploaded file
	       responseType: 'json',
	       allowedExtensions: ['json'],
		   maxSize: 11024, // kilobytes
		   onExtError: function(filename,extension ){
			   nAlert("Invalid File extennsion","warning");
		   },
		   onSizeError: function (filename,fileSize){ 
			   nAlert("Invalid File size","warning");  
		   },       
		   onSubmit: function(filename, extension) {      	            
		   	  busy(true);
		   },	
		   onComplete: function(filename, response) {	   	  
		   	  dump(response);	
		   	  busy(false);
		   	  if (response.code==1){	   	  	 	   	  	 
		   	  	 nAlert(response.msg,"success");
		   	  	 window.location.refresh();   	  	 
		   	  } else {
		   	  	 nAlert(response.msg,"warning");	   	  	 
		   	  }	   	  
		   }
	    });    
   }	   
	
}); /*end doc*/

function openExportWindow(h, w, url) {
  leftOffset = (screen.width/2) - w/2;
  topOffset = (screen.height/2) - h/2;
  window.open(url, this.target, 'left=' + leftOffset + ',top=' + topOffset + ',width=' + w + ',height=' + h + ',resizable,scrollbars=yes');
}

function empty(data)
{
	if (typeof data === "undefined" || data==null || data=="" ) { 
		return true;
	}
	return false;
}


jQuery(document).ready(function() {
		
    $( document ).on( "click", ".delete-pages", function() {		    	
    	var a = confirm( js_translation.are_you_sure );
    	if(a){	    	
    		
    		params =  "page_id=" + $(this).data('id');
    		params+= addValidationRequest();
    		
			$.ajax({    
		    type: "POST",
		    url: ajaxurl+"/deletePages",
		    data: params ,
		    dataType: 'json',       
		    success: function(data){ 
		    	data_table.fnReloadAjax(); 
		    }, 
		    error: function(){	 		    	
		    }		
		    });   
    	}	  		
	});
	
	
	if ( $("#upload-push-icon").exists()) {
	   var uploader = new ss.SimpleUpload({
	       button: 'upload-push-icon', // HTML element used as upload button
	       url: ajaxurl+"/upload", // URL of server-side upload handler
	       name: 'uploadfile', // Parameter name of the uploaded file
	       responseType: 'json',
	       allowedExtensions: ['png', 'jpeg','jpg'],
		   maxSize: 11024, // kilobytes
		   onExtError: function(filename,extension ){
			   nAlert("Invalid File extennsion","warning");
		   },
		   onSizeError: function (filename,fileSize){ 
			   nAlert("Invalid File size","warning");  
		   },       
		   onSubmit: function(filename, extension) {      	            
		   	  busy(true);
		   },	
		   onComplete: function(filename, response) {	   	  
		   	  dump(response);
		   	  busy(false);
		   	  if (response.code==1){	   	  	 	   	  	 
		   	  	 nAlert(response.msg,"success");
		   	  	 $("#upload_push_icon").val(filename);
		   	  	 $(".upload_push_icon").attr("src",response.details);
		   	  	 $(".upload_push_icon").removeClass("hide")
		   	  } else {
		   	  	 nAlert(response.msg,"warning");	   	  	 
		   	  }
		   }
	    });    
   }
   
   if ( $("#upload-push-picture").exists()) {
	   var uploader = new ss.SimpleUpload({
	       button: 'upload-push-picture', // HTML element used as upload button
	       url: ajaxurl+"/upload", // URL of server-side upload handler
	       name: 'uploadfile', // Parameter name of the uploaded file
	       responseType: 'json',
	       allowedExtensions: ['png', 'jpeg','jpg'],
		   maxSize: 11024, // kilobytes
		   onExtError: function(filename,extension ){
			   nAlert("Invalid File extennsion","warning");
		   },
		   onSizeError: function (filename,fileSize){ 
			   nAlert("Invalid File size","warning");  
		   },       
		   onSubmit: function(filename, extension) {      	            
		   	  busy(true);
		   },	
		   onComplete: function(filename, response) {	   	  
		   	  dump(response);
		   	  busy(false);
		   	  if (response.code==1){	   	  	 	   	  	 
		   	  	 nAlert(response.msg,"success");
		   	  	 $("#upload_push_picture").val(filename);
		   	  	 $(".upload_push_picture").attr("src",response.details);
		   	  	 $(".upload_push_picture").removeClass("hide")
		   	  } else {
		   	  	 nAlert(response.msg,"warning");	   	  	 
		   	  }
		   }
	    });    
   }
		
});/* end ready*/


/*2.6*/
jQuery(document).ready(function() {
	
	$( document ).on( "click", ".remove_icon", function() {
		var a = confirm(js_translation.are_you_sure);
		if(a){
			$(this).hide();
			$("#upload_push_icon").val('');
			$(".upload_push_icon").hide();
		}
	});
		
	$( document ).on( "click", ".remove_push_pic", function() {
		var a = confirm(js_translation.are_you_sure);
		if(a){
			$(this).hide();
			$("#upload_push_picture").val('');
			$(".upload_push_picture").hide();
		}
	});
	
});/* end ready*/


function showPreloader(busy)
{
	if(busy){
	   $(".main-preloader").show(); 
	} else {
	   $(".main-preloader").hide(); 
	}
}

/*cygnuspay*/

jQuery(document).ready(function() {
	
	if( $(".format_card_number").exists() ){
		onload = function() {
		  document.getElementById('billing-cc-number').oninput = function() {
		    this.value = CreditCardFormat(this.value)
		  }
		}
	}
	
	if( $("#frm_webview").exists() ){
		$("#frm_webview").validate({
		  submitHandler: function(form) {
		  	cc_expiration = $.trim($(".cc_expiration").val());
		  	cc_expiration = cc_expiration.replace(/\s/g, '');
		  	$(".cc_expiration").val( cc_expiration );		  	
		    showPreloader(true);
		    form.submit();
		  }
		});
	}
	
	if ( $(".cc_expiration").exists() ){
		$('input.cc_expiration').formance('format_credit_card_expiry');
	}
	
});


function CreditCardFormat(value) {
  var v = value.replace(/\s+/g, '').replace(/[^0-9]/gi, '')
  var matches = v.match(/\d{4,16}/g);
  var match = matches && matches[0] || ''
  var parts = []
  for (i=0, len=match.length; i<len; i+=4) {
    parts.push(match.substring(i, i+4))
  }
  if (parts.length) {
    return parts.join(' ')
  } else {
    return value
  }
}


function addValidationRequest()
{
	var params='';		
	params+="&YII_CSRF_TOKEN="+YII_CSRF_TOKEN;
	return params;
}


jQuery(document).ready(function() {	
	$( document ).on( "click", ".paynow_stripe", function() {			
		showPreloader(true);			
		stripe.redirectToCheckout({		  
		  sessionId: stripe_session,
		}).then(function (result) {
			showPreloader(true);		    
		    nAlert(result.error.message,"warning");	   	  	 
		});		
	});
});