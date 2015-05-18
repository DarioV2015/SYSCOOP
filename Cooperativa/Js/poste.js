function cargarPostes() {
    var geocoder = new google.maps.Geocoder();
    var addresses = [];
    
/*     var southWest = new google.maps.LatLng(-34.14436073676822, -63.40183402543943);
  var northEast = new google.maps.LatLng(-34.10882363507934, -63.37157599515376);*/
  
  var southWest = new google.maps.LatLng(-34.1292651, -63.39009140000002); //zona 3
  var northEast = new google.maps.LatLng(-34.12045463920787, -63.40172145828865); //zona 3
  
    
    //for (var i=0;i<positions.length;i++){ 

    //for (i = -34.11008695414083,j = -63.39488377150275; i > -34.1108392,j > -63.391270399999996;i-=0.00075224585917,j-=0.003613371502754) {
   // for (i = -34.11008695414083; i > -34.139581139759144;i+=0.0011332241) {
  //  for (i = -34.139581139759144; i < -34.11008695414083;i+=0.0011332241) {
  //  console.log('lat '+i);
  //     for (j = -63.39488377150275; j < -63.37275490000002;j+=0.003613371502754) {
     //  console.log(' long '+j);
  var lngSpan = northEast.lng() - southWest.lng();
  var latSpan = northEast.lat() - southWest.lat();

  for (var i = 0; i < 1000; i++) {
    var pos = new google.maps.LatLng(
        southWest.lat() + latSpan * Math.random(),
        southWest.lng() + lngSpan * Math.random());   
     try{
   //  var pos = new google.maps.LatLng(i, j);
    geocoder.geocode( {
        'latLng' : pos
    },
    function (results, status) {
        if (status == 'OK' && results.length > 0) {
            //alert('Direccion: "+results[0].formatted_address); 
            addresses = results[0].formatted_address
        
        if(addresses.indexOf(",") > -1)
        {
        var callenro = addresses.split(",");
        var calle = callenro[0].substring(0, callenro[0].lastIndexOf(" "));
        var nros = callenro[0].substring(callenro[0].lastIndexOf(" ")).split("-");
        var nro = nros[0];
        var idzona = isInZona( results[0].geometry.location);
        PageMethods.agregarMarcador(results[0].geometry.location.lat(), results[0].geometry.location.lng(), calle, nro,idzona);
        }
     }
    });
    
    }
    catch(err)
    {
    console.log(err);
    }
 //   }
    }
}

/*
function cargarPostes()
{
  // Add 5 markers to the map at random locations
  var southWest = new google.maps.LatLng(-34.14436073676822, -63.40183402543943);
  var northEast = new google.maps.LatLng(-34.10882363507934, -63.37157599515376);

  var bounds = new google.maps.LatLngBounds(southWest, northEast);
  //mapa.fitBounds(bounds);

  var lngSpan = northEast.lng() - southWest.lng();
  var latSpan = northEast.lat() - southWest.lat();

  for (var i = 0; i < 1000; i++) {
    var position = new google.maps.LatLng(
        southWest.lat() + latSpan * Math.random(),
        southWest.lng() + lngSpan * Math.random());
    var marker = new google.maps.Marker({
      position: position,
      map: mapa
    });

    marker.setTitle((i + 1).toString());
    //attachSecretMessage(marker, i);
  }
}*/

function isInZona(position)
{
  



for(var i =1; i<=6; i++){
   var zonas = new Array();
switch (i.toString())
      {
      
        case "1":
        zonas.push(new google.maps.LatLng('-34.1087566708847', '-63.401763586877394'));//
    zonas.push(new google.maps.LatLng('-34.10889880203222', '-63.38403954970698'));//
    zonas.push(new google.maps.LatLng('-34.1229962', '-63.38820390000001'));//
    zonas.push(new google.maps.LatLng('-34.12045463920787', '-63.40172145828865'));//-34.12695599543159
    //zonas.push(new google.maps.LatLng('-34.1087566708847', '-63.401763586877394'));
    
        break;   
         case "2":
        zonas.push(new google.maps.LatLng('-34.10889880203222', '-63.38403954970698'));//
    zonas.push(new google.maps.LatLng('-34.10882363507934', '-63.37157599515376'));//
    zonas.push(new google.maps.LatLng('-34.126330115760496', '-63.37169362584234'));//
    zonas.push(new google.maps.LatLng('-34.1229962', '-63.38820390000001'));//
  //  zonas.push(new google.maps.LatLng('-34.10889880203222', '-63.38403954970698'));//
    
        break;   
         case "3":
        zonas.push(new google.maps.LatLng('-34.12045463920787', '-63.40172145828865'));//
    zonas.push(new google.maps.LatLng('-34.1229962', '-63.38820390000001'));//
    zonas.push(new google.maps.LatLng('-34.1292651', '-63.39009140000002'));//
    zonas.push(new google.maps.LatLng('-34.12695599543159', '-63.40185020432136'));//
  //  zonas.push(new google.maps.LatLng('-34.12045463920787', '-63.40172145828865'));//
    
        break;   
         case "4":
        zonas.push(new google.maps.LatLng('-34.1229962', '-63.38820390000001'));//
    zonas.push(new google.maps.LatLng('-34.126330115760496', '-63.37169362584234'));//
    zonas.push(new google.maps.LatLng('-34.1326474313753', '-63.371675917321795'));
    zonas.push(new google.maps.LatLng('-34.1292727', '-63.39008660000002'));//
  //  zonas.push(new google.maps.LatLng('-34.1229962', '-63.38820390000001'));//
    
        break;   
         case "5":
        zonas.push(new google.maps.LatLng('-34.12695599543159', '-63.40185020432136'));//
    zonas.push(new google.maps.LatLng('-34.1292651', '-63.39009140000002'));//
    zonas.push(new google.maps.LatLng('-34.145710404492945', '-63.39333678728025'));//
    zonas.push(new google.maps.LatLng('-34.14436073676822', '-63.40183402543943'));//
  //  zonas.push(new google.maps.LatLng('-34.12695599543159', '-63.40185020432136'));//
    
        break;   
         case "6":
        zonas.push(new google.maps.LatLng('-34.1292651', '-63.39009140000002'));//
    zonas.push(new google.maps.LatLng('-34.1326474313753', '-63.371675917321795'));//

    zonas.push(new google.maps.LatLng('-34.14891012923296', '-63.37169042788082'));//
       zonas.push(new google.maps.LatLng('-34.145710404492945', '-63.39333678728025'));//
  //  zonas.push(new google.maps.LatLng('-34.1292651', '-63.39009140000002'));//
    
        break;   
         
  }
  
  var bermudaTriangle = new google.maps.Polygon({
    paths: zonas
  });
  
   if (google.maps.geometry.poly.containsLocation(new google.maps.LatLng(position.lat(), position.lng()), bermudaTriangle)) {
     return i;
    } 
  
  }
  
}