var mapbox;
var mapbox_marker = [];
var mapbox_bounds = [];

mapbox_PlotMap = function(div, lat , lng){
	
	if (mapbox != undefined) {		
		mapbox.remove();
	}	
	
	mapbox = L.map(div,{ 
		scrollWheelZoom:true,
		zoomControl:true,
	 }).setView([lat,lng], 5 );
	
	L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token='+mapbox_token, {		    
	    maxZoom: 18,
	    id: 'mapbox.streets',		    
	}).addTo(mapbox);
	
};

mapbox_plotTaskMap = function(data, auto_fit){
	dump("mapbox_plotTaskMap");
	if ( data.length >0) {
		$.each( data , function( index, val ) {
			dump(val);
			
			lat = val.lat;
			lng = val.lng;
			
			if (!empty(val.lat)){
				
				if ( map_hide_pickup==1){
			 	 	  if ( val.trans_type_raw=="pickup"){
			 	 	  	   return;
			 	 	  }
			 	}
			 	 
			 	if ( map_hide_delivery_task==1){
			 	 	  if ( val.trans_type_raw=="delivery"){
			 	 	  	   return;
			 	 	  }
			 	}
			 	
			 	if ( map_hide_successful_task==1){
			 	 	  if ( val.status_raw=="successful"){
			 	 	  	   return;
			 	 	  }
			 	} 
			 	
			 	info_html='';
			 	
			 	if ( val.map_type=="restaurant"){
			 		 info_html+="<div class=\"map-info-window\">";
				 	    info_html+="<h4>"+ jslang.task_id + ": " + val.task_id+"</h4>";
				 	    info_html+="<h5>"+ jslang.name + ": " + val.customer_name+"</h5>";
				 	    info_html+="<p>"+val.address+"</p>";		 	    
				 	    info_html+="<p class=\"inline green-button small rounded\">"+val.trans_type+"</p>";
				 	    info_html+="<p class=\"inline orange-button-small rounded\">"+val.status+"</p>";		 	    
				 	    info_html+="<a href=\"javascript:;\"  class=\"top10 task-details\" data-id=\""+val.task_id+"\"  >"+jslang.details+"</a>";
				 	 info_html+="</div>";
			 	} else {
			 		info_html+=val.first_name+" ";
		  	 	    info_html+=val.last_name;
		  	 	    if(val.is_online==1){
		  	 	       info_html+='<p class="text-primary">'+jslang.online+'</p>';
		  	 	    } else {
		  	 	       info_html+='<p class="text-danger">'+jslang.offline+'</p>';
		  	 	    }
		  	 	    if ( !empty(val.lat) && !empty(val.lng)){
			  	 	    dump('get lat as address');		  	 	    
		  	 	    }
			 	}
			 	
			 	latlng = [lat,lng];
		        mapbox_bounds.push( latlng );
		        
		        icon = mapbox_getIcon( val.map_type, val.trans_type, val.status_raw );
		        		        
		        mapbox_marker[index] = L.marker([lat,lng], { icon : icon } ).addTo(mapbox);
		        mapbox_marker[index].bindPopup(info_html);
		        
			}
		}); /*end each*/
		
						
		if(empty(auto_fit)){
		   mapbox.fitBounds(mapbox_bounds, {padding: [30, 30]}); 
		}
		
	} else {
		dump('no task to map');		
	}
};


mapbox_getIcon = function(map_type, trans_type , status_raw){
	
	var marker_icon;
	
	if ( map_type=="restaurant"){
		if ( trans_type=="delivery"){				   	 	
	   	 	switch (status_raw)
	   	 	{
	   	 		case "successful":
	   	 		marker_icon=delivery_icon_successful;
	   	 		break;
	   	 		
	   	 		case "declined":
	   	 		case "failed":
	   	 		case "cancelled":
	   	 		marker_icon=delivery_icon_failed;
	   	 		break;
	   	 		
	   	 		default:
	   	 		marker_icon=map_marker_delivery;
	   	 		break;
	   	 	}
	   	 } else {				   	 	
	   	 	switch (status_raw)
	   	 	{
	   	 		case "successful":
	   	 		marker_icon=pickup_icon_ok;
	   	 		break;
	   	 		
	   	 		case "declined":
	   	 		case "failed":
	   	 		case "cancelled":
	   	 		marker_icon=delivery_icon_failed;
	   	 		break;
	   	 		
	   	 		default:
	   	 		marker_icon=map_pickup_icon;
	   	 		break;
	   	 	}
	   	 }
	} else {
		marker_icon = driver_icon;
	}
	
	return default_icon = L.icon({
		    iconUrl: marker_icon,	    	   
		});;
};

mapbox_setMapCenter = function(lat, lng){
	mapbox.setView(new L.LatLng(lat, lng), 15);
};



/*TASK MAP*/

var mapbox_map_d;
var mapbox_marker_d = [];
var mapbox_bounds_d = [];

var mapbox_map_p;
var mapbox_marker_p = [];
var mapbox_bounds_p = [];

mapbox_PlotMapDelivery = function(div, lat , lng){
	
	if (mapbox_map_d != undefined) {		
		mapbox_map_d.remove();
	}	
	
	mapbox_map_d = L.map(div,{ 
		scrollWheelZoom:true,
		zoomControl:true,
	 }).setView([lat,lng], 5 );
	
	L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token='+mapbox_token, {		    
	    maxZoom: 18,
	    id: 'mapbox.streets',		    
	}).addTo(mapbox_map_d);	
};

mapbox_PlotMapPickup = function(div, lat , lng){
	
	if (mapbox_map_p != undefined) {		
		mapbox_map_p.remove();
	}	
	
	mapbox_map_p = L.map(div,{ 
		scrollWheelZoom:true,
		zoomControl:true,
	 }).setView([lat,lng], 5 );
	
	L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token='+mapbox_token, {		    
	    maxZoom: 18,
	    id: 'mapbox.streets',		    
	}).addTo(mapbox_map_p);	
};


mapbox_setMapCenterDelivery = function(lat, lng){
	mapbox_map_d.setView(new L.LatLng(lat, lng), 15);
};

mapbox_setMapCenterPickup = function(lat, lng){
	mapbox_map_p.setView(new L.LatLng(lat, lng), 15);
};


mapbox_initGeocoderDelivery = function(div){
	
	mapbox_marker_d = '';
	
	data = $("#"+div).html();	
	if(empty(data)){
		var geocoder = new MapboxGeocoder({
		    accessToken: mapbox_token ,
		    country: default_country ,
		    flyTo : false
	    });		    
	    document.getElementById(div).appendChild(geocoder.onAdd(mapbox_map_d));	   
	    
	    $("#"+div +" input").attr("name","delivery_address");
	    $("#"+div +" input").attr("id","delivery_address");
	    $("#"+div +" input").attr("placeholder", jslang.delivery_address );	
	    $("#"+div +" input").attr("autocomplete","off");
	    $("#"+div +" input").attr("required","required");
	    
	    geocoder.on('result', function(ev) {
             dump("ev.result.geometry");             
             resp_geocoder = ev.result.geometry;                                   
             lat = resp_geocoder.coordinates[1];
             lng = resp_geocoder.coordinates[0];
             
             if(empty(mapbox_marker_d)){             	
                mapbox_marker_d = L.marker([ lat , lng ], { draggable : true } ).addTo(mapbox_map_d);  
             } else {             	 
             	var newLatLng = new L.LatLng(lat, lng);
             	mapbox_marker_d.setLatLng(newLatLng); 
             }
             
             mapbox_setMapCenterDelivery(lat , lng);
             
             $("#task_lat").val( lat );
             $("#task_lng").val( lng );
             
             mapbox_marker_d.on('dragend', function (e) {	
             	var latlng = e.target.getLatLng();
             	dump(latlng.lat);
             	dump(latlng.lng);
			    $("#task_lat").val( latlng.lat );
                $("#task_lng").val( latlng.lng );
			});
		             
        });
	    
	}
};

mapbox_plotMarkerDelivery = function(lat, lng){
	
	if(empty(lat) || empty(lng)){
		return;
	}
	if(empty(mapbox_marker_d)){             	
        mapbox_marker_d = L.marker([ lat , lng ], { draggable : true } ).addTo(mapbox_map_d);  
     } else {             	 
     	var newLatLng = new L.LatLng(lat, lng);
     	mapbox_marker_d.setLatLng(newLatLng); 
     }	
     mapbox_setMapCenterDelivery(lat , lng);
     
     mapbox_marker_d.on('dragend', function (e) {           			    
	    var latlng = e.target.getLatLng();
     	dump(latlng.lat);
     	dump(latlng.lng);
	    $("#task_lat").val( latlng.lat );
        $("#task_lng").val( latlng.lng );
	 });
};

mapbox_initGeocoderPickup = function(div){
		
	dump('mapbox_initGeocoderPickup');
	mapbox_marker_p = '';
	
	data = $("#"+div).html();	
	if(empty(data)){		
		var geocoder_p = new MapboxGeocoder({
		    accessToken: mapbox_token ,
		    country: default_country ,
		    flyTo : false
	    });		    
	    document.getElementById(div).appendChild(geocoder_p.onAdd(mapbox_map_p));	   
	    
	    $("#"+div +" input").attr("name","drop_address");
	    $("#"+div +" input").attr("id","drop_address");
	    $("#"+div +" input").attr("placeholder", jslang.pickup_address );	
	    $("#"+div +" input").attr("autocomplete","off");
	    //$("#"+div +" input").attr("required","required");
	    
	    geocoder_p.on('result', function(ev) {
             dump("ev.result.geometry");             
             resp_geocoder = ev.result.geometry;                                   
             lat = resp_geocoder.coordinates[1];
             lng = resp_geocoder.coordinates[0];
             
             if(empty(mapbox_marker_p)){             	
                mapbox_marker_p = L.marker([ lat , lng ], { draggable : true } ).addTo(mapbox_map_p);  
             } else {             	 
             	var newLatLng = new L.LatLng(lat, lng);
             	mapbox_marker_p.setLatLng(newLatLng); 
             }
             
             mapbox_setMapCenterPickup(lat , lng);
             
             $("#dropoff_lat").val( lat );
             $("#dropoff_lng").val( lng );
             
             mapbox_marker_p.on('dragend', function (e) {           			    
			    var latlng = e.target.getLatLng();
             	dump(latlng.lat);
             	dump(latlng.lng);
			    $("#dropoff_lat").val( latlng.lat );
                $("#dropoff_lng").val( latlng.lng );
			});
		             
        });
	    
	}
};

mapbox_plotMarkerPickup = function(lat, lng){
	
	if(empty(lat) || empty(lng)){
		return;
	}
	if(empty(mapbox_marker_p)){             	
        mapbox_marker_p = L.marker([ lat , lng ], { draggable : true } ).addTo(mapbox_map_p);  
     } else {             	 
     	var newLatLng = new L.LatLng(lat, lng);
     	mapbox_marker_p.setLatLng(newLatLng); 
     }	
     mapbox_setMapCenterPickup(lat , lng);
     
     mapbox_marker_p.on('dragend', function (e) {           			    
	    var latlng = e.target.getLatLng();
     	dump(latlng.lat);
     	dump(latlng.lng);
	    $("#dropoff_lat").val( latlng.lat );
        $("#dropoff_lng").val( latlng.lng );
	 });
};

$(document).ready(function(){
	
	if ( $("#mapbox_main_map_geocoder").exists() ){
		mapbox_initMainMapGeocoder();
	}
	
	if ( $(".mapbox_track_map").exists() ){
		mapbox_initTrackMap();
	}
	
});/* end ready*/


mapbox_initMainMapGeocoder = function(){
	
	var geocoder_main_map = new MapboxGeocoder({
	    accessToken: mapbox_token ,
	    country: default_country ,
	    flyTo : false
    });		    
    document.getElementById("mapbox_main_map_geocoder").appendChild(geocoder_main_map.onAdd(mapbox));	
    
    div = 'mapbox_main_map_geocoder';
        
    $("#"+div +" input").attr("name","main_map_geocoder");
    $("#"+div +" input").attr("id","main_map_geocoder");
    $("#"+div +" input").attr("placeholder", jslang.search_map );	
    $("#"+div +" input").attr("autocomplete","off");
    
     geocoder_main_map.on('result', function(ev) {
         dump("ev.result.geometry");             
         resp_geocoder = ev.result.geometry;                                   
         lat = resp_geocoder.coordinates[1];
         lng = resp_geocoder.coordinates[0];         
         mapbox_setMapCenter(lat,lng);
	});
	
};

var map_direction;
var map_direction_bounds=[];


mapbox_showDirection = function(driver_lat , driver_lng, task_lat, task_lng){
	$("#direction_output").html('');		
	$("#map-direction").html('');
	
	$(".task-details-tabs").hide();
    $(".map-direction").show(); 
    
    if(!empty(driver_lat) && !empty(driver_lng) && !empty(task_lat) && !empty(task_lng) ){
    	
    	if(!empty(map_direction)){       		
    		map_direction.remove();
    	}
	
    	map_direction = L.map("map-direction",{ 
		    scrollWheelZoom:false,
			zoomControl:true,
		 }).setView([driver_lat,driver_lng], 5 );
		
		L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token='+mapbox_token, {		    
		    maxZoom: 18,
		    id: 'mapbox.streets',		    
		}).addTo(map_direction);
		
		map_direction_bounds = [];
	
		var origin = L.latLng({
			lat: driver_lat,
			lng: driver_lng
		});
		
		latlng = [driver_lat,driver_lng];
	    map_direction_bounds.push( latlng ); 
	    	    
	    
	    var destination_location = L.latLng({
			lat:  task_lat,
			lng:  task_lng
		});
		
		latlng = [task_lat,task_lng];
	    map_direction_bounds.push( latlng );
	    
	    var control = L.Routing.control({	
			waypoints: [
			    origin,
			    destination_location
			],
		    router: L.Routing.mapbox(mapbox_token)	    
	   });
    	
	   var routeBlock = control.onAdd(map_direction);    
	   document.getElementById('direction_output').appendChild(routeBlock);	   
	   
	   map_direction.fitBounds(map_direction_bounds, {padding: [30, 30]}); 
	   
    } else {
    	toastMessage( jslang.missing_coordinates ,'' );   
    }
};

mapbox_initTrackMap = function(){
	
	mapbox = L.map("mapbox_track_map",{ 
		scrollWheelZoom:false,
		zoomControl:true,
	 }).setView([default_location_lat,default_location_lng], 5 );
	
	L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token='+mapbox_token, {		    
	    maxZoom: 18,
	    id: 'mapbox.streets',		    
	}).addTo(mapbox);
	
};

mapbox_plotTrackMap = function(data){
	
	var total= parseInt(data.length);
	if (total<=0){
		return;
	}
	
	dump("total="+total);	
	
	$(".track-details-wrap").html('');
	
	driver_icons = L.icon({
		iconUrl: driver_icon
	});
	
	var x = 0;
	track_interval=setInterval(function(){
		
		var current_data = data[x];
		dump(current_data);
		
		if(empty(current_data)){
			clearInterval(track_interval);	 		
			track_interval_counter=0;
			$(".track_replay").css({
				"display":"block"
			});			
			return;
		}
		
		$(".track-details-wrap").append('<p>'+ jslang.lat+":"+ current_data.latitude + " , " + jslang.lng +":"+ current_data.longitude + '</p>');
		
		if(empty(mapbox_marker)){  
		   mapbox_marker = L.marker([ current_data.latitude , current_data.longitude ], { icon : driver_icons } ).addTo(mapbox); 		   
		} else {
		   var newLatLng = new L.LatLng(current_data.latitude, current_data.longitude);
     	   mapbox_marker.setLatLng(newLatLng); 
		}
		
		latlng = [current_data.latitude,current_data.longitude];
		mapbox_bounds.push( latlng );
		
		mapbox.fitBounds(mapbox_bounds, {padding: [30, 30]}); 
		
		x++;
	}, 1000);	
};

var mapbox_history;

mapbox_plotMapHistory = function(lat , lng){
	
	if (mapbox_history != undefined) {		
		mapbox_history.remove();
	}	
	
	mapbox_history_bounds=[];
	
	mapbox_history = L.map("map-location",{ 
		scrollWheelZoom:true,
		zoomControl:true,
	 }).setView([lat,lng], 5 );
	
	L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token='+mapbox_token, {		    
	    maxZoom: 18,
	    id: 'mapbox.streets',		    
	}).addTo(mapbox_history);
	
	mapbox_history_marker = L.marker([ lat , lng ], { draggable : false } ).addTo(mapbox_history);

	latlng = [lat,lng];
    mapbox_history_bounds.push( latlng );
    mapbox_history.fitBounds(mapbox_history_bounds, {padding: [30, 30]}); 
	
};