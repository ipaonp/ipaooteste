var map;
var map_marker = [];
var map_bounds = [];
var infoWindow;

initGeolocate = function(id){
	
	dump('initGeolocate=>'+ map_provider);
	
	switch(map_provider){
		case "google.maps":
		  loader(1);
		  GMaps.geolocate({
		  	  success: function(position) {
		  	  	  your_lat = position.coords.latitude;
	  	          your_lng = position.coords.longitude;
	  	          
	  	          dump("your_lat=>"+your_lat);
	  	          dump("your_lng=>"+your_lng);
	  	          
	  	          setDataLatLng( your_lat,  your_lng ) ;
	  	          initMap(id, your_lat, your_lng);
	  	          
		  	   },
			   error: function(error) {
			     notify( t('Geolocation failed:') + error.message, 'danger');
			   },
			   not_supported: function() {			     
			     notify( t('Your browser does not support geolocation') + error.message, 'danger');
			   },
			   always: function() {	    
			     loader(2);
			   }
		  });
		break;
		
		case "mapbox":
		  setTimeout(function() {	
		     initMap(id, '40.775', '-73.972');
		     
		     loader(1);
		 	 map.locate({setView: true, maxZoom: 15});
		 	 map.on('locationfound', function(e){
		 	 	dump("location found");
		 	 	dump(e);
		 	 	loader(2);
		 	 	setDataLatLng( e.latitude,  e.longitude ) ;
		 	 	map_addMarker(1, e.latitude,e.longitude);
		 	 	
		 	 });
		 	 map.on('locationerror', function(e){
		 	 	loader(2);
		 	 	 notify(e.message, 'danger');
		 	 });
		     
		  }, 500);		  		  		  		
		 
		break;
	}
	
};

initSetMap = function(id, lat, lng){
	switch(map_provider){
		case "google.maps":
		  setDataLatLng( lat,  lng ) ;	
		  setTimeout(function() {	  
	  	     initMap(id, lat, lng);
	  	   }, 500);	       
		break;
		
	    case "mapbox":
	       setTimeout(function() {
	       	  initMap(id, lat, lng);
	       	  
	       	  setDataLatLng( lat , lng ) ;
		 	  map_addMarker(1, lat , lng );
	       }, 500);	       
		break;
	}	
};

initMap = function(id, lat, lng){
	dump("map id=>"+ id);
	
	switch(map_provider){
		case "google.maps":
		
		 options = {
		   div: id ,
 		   lat: lat,
		   lng: lng,		   
		 };
		 
		 dump(options);
		 
		 var latlng = new google.maps.LatLng( lat , lng );
	     map_bounds.push(latlng);
		 map = new GMaps(options);	
		 
		 setTimeout(function() {	
		     map_addMarker(1, lat, lng);		
		 }, 100); 
		 
		break;
		
		case "mapbox":
				   
		   id = id.replace("#", "");
		   		   
		   map = L.map(id,{ 
			   scrollWheelZoom:true,
			   zoomControl:true,
		    }).setView([ lat , lng ], 5 );  
		    
		    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token='+map_token, {		    
		    	attribution: 'Mapbox',
			    maxZoom: 18 ,
			    id: 'mapbox.streets',		    
			}).addTo(map);
		   
		break;
	}
	
};


map_addMarker = function(index, lat, lng){
	
	switch(map_provider){
		case "google.maps":
		
		var options = {
	       lat: lat,
		   lng: lng,
		   draggable: true,
		   dragend: function(e) {
		   	  dump("DRAG END");
		   	  dump(e.latLng.lat());
		   	  dump(e.latLng.lng());		
		   	  setDataLatLng( e.latLng.lat() ,  e.latLng.lng() ) ;
		   }
	    };
	    
	    var latlng = new google.maps.LatLng( lat , lng );
	    map_bounds.push(latlng);
	    
	    if(!empty(map_marker[index])){			
	    	dump('move');
	    	map_moveMarker( index, lat, lng );
	    } else {			    	
	    	dump('add');
	        map_marker[index] = map.addMarker( options );
	    }
			    
		map_setCenter(lat, lng);
		
		break;
		
	    case "mapbox":
	      options = {};
	      options.draggable = true;
	      
	      if(!empty(map_marker[index])){	
		  	 dump('move');
		  	 map_moveMarker( index, lat, lng );
		  } else {
		  	 dump('add');
		  	 map_marker[index] = L.marker([ lat , lng ], options ).addTo(map);  
		  }	  	
		  
		  map_marker[index].on('dragend', function (e) {
		  	 new_lat = map_marker[index].getLatLng().lat;
	  	 	 new_lng = map_marker[index].getLatLng().lng;
	  	 	 dump("new_lat : "+ new_lat);
             dump("new_lng : "+ new_lng);
             setDataLatLng( new_lat ,  new_lng ) ;
		  });
		  
		  map_setCenter(lat, lng);
	      
		break;
	}	
			
};

map_moveMarker = function(index, lat , lng){
		
	switch(map_provider){
		case "google.maps":
		  map_marker[index].setPosition( new google.maps.LatLng( lat , lng ) );
		break;
		
	    case "mapbox":
	      map_marker[index].setLatLng([lat, lng]).update(); 
		break;
	}				
};

map_setCenter = function(lat, lng){
	
	switch(map_provider){
		case "google.maps":
		   map.setCenter(lat, lng);	
		   map.setZoom(15);
		break;
		
	    case "mapbox":
	       map.setView([lat, lng], 13);
		break;
	}	
};

setDataLatLng = function(lat , lng ){
	$("#mobile2_default_lat").val( lat );
    $("#mobile2_default_lng").val( lng );
};