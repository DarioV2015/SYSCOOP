var geocoder;

function borrarEvento(evento) {
    google.maps.event.clearListeners(mapa, evento);
}

function obtenerLocalizacionDeDireccion(direccion, markadores) {
    geocoder.geocode( {
        'address' : direccion + ', laboulaye, cordoba, argentina'
    },
    function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            placeMarker(results[0].geometry.location, markadores);
            mapa.setCenter(results[0].geometry.location)
        }
        else {
            alert('No se encontro la direccion solicitada');
        }

    });
}

function fnsuccesscallbackMedidores(data) {
    for (i = 0;i < data.length;i++) {
        //alert(data[i]['IdMedidor']);
        placeMarkerWithLocation(data[i]['Id'], new google.maps.LatLng(data[i]['Latitud'], data[i]['Longitud']), data[i]['Imagen'], medidores);
    }
}

function fnsuccesscallbackPostes(data) {
    for (i = 0;i < data.length;i++) {
        //alert(data[i]['IdMedidor']);
        placeMarkerWithLocation(data[i]['Id'], new google.maps.LatLng(data[i]['Latitud'], data[i]['Longitud']), data[i]['Imagen'], postes);
    }
}

function buscarMedidores() {
    PageMethods.getMedidores(fnsuccesscallbackMedidores);
}

function buscarPostes() {
    PageMethods.getPostes(fnsuccesscallbackPostes);
}

function buscarSubestaciones() {
    PageMethods.getSubestaciones(fnsuccesscallbackSubestaciones);
}

function fnsuccesscallbackSubestaciones(data) {
    for (i = 0;i < data.length;i++) {
        //alert(data[i]['IdMedidor']);
        placeMarkerWithLocation(data[i]['Id'], new google.maps.LatLng(data[i]['Latitud'], data[i]['Longitud']), data[i]['Imagen'], subestaciones);
    }
}

function getAddresses(event) {
    var geocoder = new google.maps.Geocoder();
    var addresses;//= []; 
    //for (var i=0;i<positions.length;i++){ 
    geocoder.geocode( {
        'latLng' : event.latLng
    },
    function (results, status) {
        if (status == 'OK' && results.length > 0) {
            //alert('Direccion: "+results[0].formatted_address); 
            addresses = results[0].formatted_address
        }
        var callenro = addresses.split(",");
        var calle = callenro[0].substring(0, callenro[0].lastIndexOf(" "));
        var nros = callenro[0].substring(callenro[0].lastIndexOf(" ")).split("-");
        var nro = nros[0];
        document.getElementById('ctl00_ContentPlaceHolder1_txtCalle').value = calle.trim();
        document.getElementById('ctl00_ContentPlaceHolder1_txtNro').value = nro.trim();
    })
    //} 
    //alert('justo antes del return'); 
    return addresses;
}

function setDragOn(markadores, id) {
    marcador = markadores[id];
    marcador.draggable = true;
    marcador.setPosition(marcador.position);
    google.maps.event.addListener(marcador, 'dragend', function (event) {
        buscarCalleyNro(marcador, marcador.title);
    });
    //direccion = buscarCalleyNro(marcador.position);
    //PageMethods.moverMarcador(marcador.position.lat().toString(), marcador.position.lng().toString(), marcador.title,direccion[0],direccion[1],borrarEventoMarcador(marcador));});

}

function borrarEventoMarcador(marcador) {
    google.maps.event.clearListeners(marcador, 'dragend');
}

function buscarCalleyNro(marcador) {
    var geocoder = new google.maps.Geocoder();
    var addresses = [];
    //for (var i=0;i<positions.length;i++){ 
    geocoder.geocode( {
        'latLng' : marcador.position
    },
    function (results, status) {
        if (status == 'OK' && results.length > 0) {
            //alert('Direccion: "+results[0].formatted_address); 
            addresses = results[0].formatted_address
        }
        var callenro = addresses.split(",");
        var calle = callenro[0].substring(0, callenro[0].lastIndexOf(" "));
        var nros = callenro[0].substring(callenro[0].lastIndexOf(" ")).split("-");
        var nro = nros[0];
        PageMethods.moverMarcador(marcador.position.lat().toString(), marcador.position.lng().toString(), marcador.title, calle, nro, borrarEventoMarcador(marcador));
        // addresses.push(calle);
        // addresses.push(nro);
        // document.getElementById('ctl00_ContentPlaceHolder1_txtCalle').value = calle.trim();
        //document.getElementById('ctl00_ContentPlaceHolder1_txtNro').value = nro.trim();
    });
    //} 
    //alert('justo antes del return'); 
    return addresses;
}

function eliminarMarcador(id) {
    PageMethods.eliminarMarcador(id, callbackMostarMensaje);

}

function callbackMostarMensaje(data) {
    if (data <= 0) {
        $find("mpeAdv").show();
    }
}

var rad = function(x) {
  return x * Math.PI / 180;
};

var getDistance = function(p1, p2) {
  var R = 6378137; // Earth’s mean radius in meter
  var dLat = rad(p2.lat() - p1.lat());
  var dLong = rad(p2.lng() - p1.lng());
  var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos(rad(p1.lat())) * Math.cos(rad(p2.lat())) *
    Math.sin(dLong / 2) * Math.sin(dLong / 2);
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  var d = R * c;
  return d; // returns the distance in meter
};




function dibujarTodasZona()
{

 zona = new Array();
for (i=1; i<=6;i++)
{
switch (i.toString())
      {
        case "1":
        zona.push(new google.maps.LatLng('-34.1087566708847', '-63.401763586877394'));//
    zona.push(new google.maps.LatLng('-34.10889880203222', '-63.38403954970698'));//
    zona.push(new google.maps.LatLng('-34.1229962', '-63.38820390000001'));//
    zona.push(new google.maps.LatLng('-34.12045463920787', '-63.40172145828865'));//-34.12695599543159
    zona.push(new google.maps.LatLng('-34.1087566708847', '-63.401763586877394'));
    dibujarPoligonos(zona);         
        break;   
         case "2":
        zona.push(new google.maps.LatLng('-34.10889880203222', '-63.38403954970698'));//
    zona.push(new google.maps.LatLng('-34.10882363507934', '-63.37157599515376'));//
    zona.push(new google.maps.LatLng('-34.126330115760496', '-63.37169362584234'));//
    zona.push(new google.maps.LatLng('-34.1229962', '-63.38820390000001'));//
    zona.push(new google.maps.LatLng('-34.10889880203222', '-63.38403954970698'));//
    dibujarPoligonos(zona);         
        break;   
         case "3":
        zona.push(new google.maps.LatLng('-34.12045463920787', '-63.40172145828865'));//
    zona.push(new google.maps.LatLng('-34.1229962', '-63.38820390000001'));//
    zona.push(new google.maps.LatLng('-34.1292651', '-63.39009140000002'));//
    zona.push(new google.maps.LatLng('-34.12695599543159', '-63.40185020432136'));//
    zona.push(new google.maps.LatLng('-34.12045463920787', '-63.40172145828865'));//
    dibujarPoligonos(zona);         
        break;   
         case "4":
        zona.push(new google.maps.LatLng('-34.1229962', '-63.38820390000001'));//
    zona.push(new google.maps.LatLng('-34.126330115760496', '-63.37169362584234'));//
    zona.push(new google.maps.LatLng('-34.1326474313753', '-63.371675917321795'));
    zona.push(new google.maps.LatLng('-34.1292727', '-63.39008660000002'));//
    zona.push(new google.maps.LatLng('-34.1229962', '-63.38820390000001'));//
    dibujarPoligonos(zona);         
        break;   
         case "5":
        zona.push(new google.maps.LatLng('-34.12695599543159', '-63.40185020432136'));//
    zona.push(new google.maps.LatLng('-34.1292651', '-63.39009140000002'));//
    zona.push(new google.maps.LatLng('-34.145710404492945', '-63.39333678728025'));//
    zona.push(new google.maps.LatLng('-34.14436073676822', '-63.40183402543943'));//
    zona.push(new google.maps.LatLng('-34.12695599543159', '-63.40185020432136'));//
    dibujarPoligonos(zona);         
        break;   
         case "6":
        zona.push(new google.maps.LatLng('-34.1292651', '-63.39009140000002'));//
    zona.push(new google.maps.LatLng('-34.1326474313753', '-63.371675917321795'));//

    zona.push(new google.maps.LatLng('-34.14891012923296', '-63.37169042788082'));//
       zona.push(new google.maps.LatLng('-34.145710404492945', '-63.39333678728025'));//
    zona.push(new google.maps.LatLng('-34.1292651', '-63.39009140000002'));//
    dibujarPoligonos(zona);         
        break;   
         
  }
}
}

function dibujarPoligonos(array)
{
 // Construct the polygon.
var  bermudaTriangle = new google.maps.Polygon({
    paths: array,
    strokeColor: '#FF0000',
    strokeOpacity: 0.8,
    strokeWeight: 2,
    fillColor: '#FF0000',
    fillOpacity: 0.35
  });

  bermudaTriangle.setMap(mapa);
}