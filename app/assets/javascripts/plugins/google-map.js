function initialize() {
	var styles = [
	  {
	    stylers: [
	      { hue: "#ff004c" },
	      { saturation: -10 },
	      { weight: 1.8 },
	      { lightness: 30 },
	      { gamma: 0.84 }
	    ]
	  },{
	    featureType: "all",
	    elementType: "geometry",
	  },{
	    featureType: "road",
	    elementType: "labels",
	  }
	];
    var styledMap = new google.maps.StyledMapType(styles, {name: "Styled Map"});
    
    var w = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);
    var isDraggable = w > 640 ? true : false;
    var xCordinate, zoomZoom = null;
    if (w > 640){
        xCordinate = 22.710022;
        zoomZoom = 15;
    } else {
        xCordinate = 22.710022;
        zoomZoom = 15;
    }

    var mapOptions = {
        zoom: zoomZoom,
        center: new google.maps.LatLng(48.463401, xCordinate),
        panControl:false,
        zoomControl:false,
        mapTypeControl:false,
        scaleControl:false,
        streetViewControl:false,
        overviewMapControl:false,
        rotateControl:true,
        // draggable: isDraggable,
        draggable: true,
        scrollwheel: true,
        mapTypeControlOptions:{
            mapTypeIds: [google.maps.MapTypeId.ROADMAP, "map_style"]
        }
    };
    var map = new google.maps.Map(document.getElementById('googleMap'),
        mapOptions);
    var image = '/assets/icons/gps-pin.svg'
    var marker = new google.maps.Marker({
        map: map,
        draggable: false,
        position: new google.maps.LatLng(48.466401, 22.710022),
        icon: image
    }); 
    map.mapTypes.set('map_style', styledMap);
    map.setMapTypeId('map_style');
}
google.maps.event.addDomListener(window, 'resize', initialize);
google.maps.event.addDomListener(window, 'load', initialize)