var polyOptions = {
    strokeColor : '#000000', strokeOpacity : 1.0, strokeWeight : 3
};

var lineas = [];
var polylineas = [];
var lineasRut = [];

function isPosteInLocation(lt, ln) {
    for (var i = 0, l = postes.length;i < l;i++) {
        if (postes[i].position.lat() === lt && postes[i].position.lng() === ln) {
            return postes[i].title;
        }
    }
    return null;
}

function isSubestacionInLocation(lt, ln) {
    for (var i = 0, l = subestaciones.length;i < l;i++) {
        if (subestaciones[i].position.lat() === lt && subestaciones[i].position.lng() === ln) {
            return subestaciones[i].title;
        }
    }
    return null;
}

function fnsuccesscallbackCargarPostes(data) {

    for (i = 0;i < data.length;i++) {
        var marker;
        var opciones = {
            draggable : false, crossOnDrag : true, icon : data[i]['Imagen'], position : new google.maps.LatLng(data[i]['Latitud'], data[i]['Longitud']), title : data[i]['Id'], map : mapa
        };

        marker = new google.maps.Marker(opciones);
                 
        google.maps.event.addListener(marker, 'click', agregarLinea);

        postes.push(marker);
    }

}

function cargarPostes() {
    PageMethods.getPostes(fnsuccesscallbackCargarPostes);
}

function cargarLineas() {
    PageMethods.buscarTodasLineas(fnsuccesscallbackCargarLineas);
}

function cargarSubestaciones() {
dibujarTodasZona();
    PageMethods.getSubestaciones(fnsuccesscallbackCargarSubestaciones);
}

function fnsuccesscallbackCargarSubestaciones(data) {

    for (i = 0;i < data.length;i++) {
        var marker;
        var opciones = {
            draggable : false, crossOnDrag : true, icon : data[i]['Imagen'], position : new google.maps.LatLng(data[i]['Latitud'], data[i]['Longitud']), title : data[i]['Id'], map : mapa
        };

        marker = new google.maps.Marker(opciones);

        google.maps.event.addListener(marker, 'click', agregarLinea);

        subestaciones.push(marker);
    }

}

function agregarLinea(event) {
    polylineas = poly.getPath();

    // Because path is an MVCArray, we can simply append a new coordinate
    // and it will automatically appear.


    if (lineas.length == 0 && isSubestacionInLocation(event.latLng.lat(), event.latLng.lng()) != null) {
        lineas.push(isSubestacionInLocation(event.latLng.lat(), event.latLng.lng()));
            polylineas.push(event.latLng);
    }
    else if(lineas.length > 0 && isSubestacionInLocation(event.latLng.lat(), event.latLng.lng()) != null)
    {
        alert('Solo puede haber una subestacion por Linea.');
    }
    else if (lineas.length > 0 && isPosteInLocation(event.latLng.lat(), event.latLng.lng()) != null) {
        if(isInLinea(isPosteInLocation(event.latLng.lat(), event.latLng.lng())) == 0)
        {
            lineas.push(isPosteInLocation(event.latLng.lat(), event.latLng.lng()));
                polylineas.push(event.latLng);
        }
        else
        {
            alert('Un poste no puede volver a ingresarse.');
        }
    }
    

}

function guardarLineas() {
    PageMethods.guardarLineas(lineas);
}

function buscarLineas() {
    PageMethods.getLineas(fnsuccesscallbackLineas);
}

function fnsuccesscallbackCargarLineas(data)
{
     for (i = 0;i < data.length;i++) {
       PageMethods.getLinea(data[i]['Idlinea'],fnsuccesscallbackLineas);
    }
}

function fnsuccesscallbackLineas(data) {
    var flightPlanCoordinates = [];

    var lineSymbol = {
        path : //'M 9.65,0.99 C 9.65,0.99 20.00,0.00 20.00,0.00 20.00,0.00 16.00,8.00 16.00,8.00 16.00,8.00 20.00,8.00 20.00,8.00 20.00,8.00 12.00,21.00 12.00,21.00 12.00,21.00 19.00,22.00 19.00,22.00 13.55,22.98 7.90,24.17 3.00,21.00 3.00,21.00 9.00,21.00 9.00,21.00 9.00,21.00 10.00,13.00 10.00,13.00 10.00,13.00 5.00,13.00 5.00,13.00 5.00,13.00 9.65,0.99 9.65,0.99 Z',
        google.maps.SymbolPath.CIRCLE,
        scale : 8, strokeColor : 'Green'
    };

    for (i = 0;i < data.length;i++) {
        flightPlanCoordinates[i] = new google.maps.LatLng(data[i]['Latitud'], data[i]['Longitud']);
    }

    var flightPath = new google.maps.Polyline( {
        path : flightPlanCoordinates, geodesic : true, strokeColor : '#FF0000', strokeOpacity : 1.0, strokeWeight : 2
    });

    // Define the symbol, using one of the predefined paths ('CIRCLE')
    // supplied by the Google Maps JavaScript API.

    // Create the polyline and add the symbol to it via the 'icons' property.
    line = new google.maps.Polyline( {
        path : flightPlanCoordinates, icons : [{icon : lineSymbol, offset : '100%'}], map : mapa
    });

    lineasRut.push(line);
    
    animateCircle(line);

    //    flightPath.setMap(mapa);
}

function animateCircle(line) {
    var count = 0;
    window.setInterval(function () {
        count = (count + 1) % 200;

        var icons = line.get('icons');
        icons[0].offset = (count / 2) + '%';
        line.set('icons', icons);
    },
20);
}


function fnsuccesscallbackCargarElementos(data) {

    for (i = 0;i < data.length;i++) {
        var marker;
        var opciones = {
            draggable : false, crossOnDrag : true, icon : data[i]['Imagen'], position : new google.maps.LatLng(data[i]['Latitud'], data[i]['Longitud']), title : data[i]['Id'], map : mapa
        };

        marker = new google.maps.Marker(opciones);

        //google.maps.event.addListener(marker, 'click', agregarLinea);

        postes.push(marker);
    }

}

function isInLinea(p1)
{
     for (i = 0;i < lineas.length;i++) {
        if(lineas[i] == p1)
        {
            return 1;
        }
     }
     return 0;
}