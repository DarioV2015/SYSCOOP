var marker;
function verificarDomicilio(calle,numero,piso,depto,idcalle)
{
geocoder.geocode( { 'address': calle+' '+numero +', laboulaye, cordoba, argentina'}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) 
    {
        ubicarMedidor(results[0].geometry.location,idcalle, numero, piso, depto); 
        mapa.setCenter(results[0].geometry.location)
    } 
    else
    {
        alert('No se encontro la direccion solicitada');
    }
    
     });
}


function ubicarMedidor(location,idcalle, numero, piso, depto) {
var opciones = {
    draggable : true, 
    crossOnDrag : true, 
    icon : '../Imagenes/lsg-punto-mapa-base-2_32px.png',
    position: location,
    //title: '<%= Session["maximo"] %>',
    map: mapa
};

    marker = new google.maps.Marker(opciones);
    
    PageMethods.buscarTodosPostes(lineaCercana);
    //PageMethods.setMedidor(idcalle,numero, piso, depto, location.lat().toString(), location.lng().toString());
  
}

function lineaCercana(data)
{
   
 var distancia = 100000;
 var linea;
 var zona;
 for (i = 0;i < data.length;i++) {
       
      var d = getDistance(new google.maps.LatLng(data[i]['Latitud'], data[i]['Longitud']),marker.position);
      
      if(d < distancia)
      {
        discancia = d;
        linea = data[i]['IdLinea'];
        zona = data[i]['Idzona'];
      }
}

PageMethods.getElementosByLinea(linea,fnsuccesscallbackLineas);

PageMethods.getElementosByLinea(linea,fnsuccesscallbackCargarElementos);

}