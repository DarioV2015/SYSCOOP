var markerOptions = {
    draggable : true, crossOnDrag : true, icon : '../Imagenes/lsg-punto-mapa-base-2_32px.png'
};

var medidores = [];
var postes = [];
var subestaciones = [];
var newpostes = [];

function crearMarcador(coordenadas) {
    var pos = new google.maps.LatLng(coordenadas[0].lat, coordenadas[0].lng);
    var options = markerOptions;
    options.position = pos;
    var shape = new google.maps.Marker(options);
    shape.type = google.maps.drawing.OverlayType.MARKER;
    return shape;
}

function agregarMarcador(event, markadores) {
    google.maps.event.addListener(mapa, 'click', function (event) {
        placeMarker(event.latLng, markadores);
    });

}

function placeMarker(location, markadores) {
    var marker;
    var opciones = {
        draggable : true, crossOnDrag : true, icon : '../Imagenes/lsg-punto-mapa-base-2_32px.png', position : location, 
        //title: '<%= Session["maximo"] %>',
        map : mapa
    };

    if (marker) {
        marker.setPosition(location);
    }
    else {
        marker = new google.maps.Marker(opciones);
    }
    markadores.push(marker);
    borrarEvento('click');

    var calle = document.getElementById('ctl00_ContentPlaceHolder1_txtCalle').value.trim();
    var nro = document.getElementById('ctl00_ContentPlaceHolder1_txtNro').value.trim();

    //PageMethods.agregarMarcador(location.lat(), location.lng(),calle,nro);
    var idzona =  isInZona(location);
    
    PageMethods.agregarMarcador(location.lat(), location.lng(), calle, nro,idzona, refrescarPagina);

    google.maps.event.addListener(marker, 'dragend', function (event) {
        moverMarcador(event, markadores);
    });
    //sendData();
}

function moverMarcador(location, markadores) {
    markadores[0].location = location;
    var direccion = getAddresses(location);
    //  var callenro = direccion.split(",");
    //  var calle = callenro[0].substring(0,callenro[0].lastIndexOf(" "));
    //  var nros = callenro[0].substring(callenro[0].lastIndexOf(" ")).split("-");
    //  var nro = nros[0];
    //alert(location);
}

function placeMarkerWithLocation(id, location, imagen, markadores) {
    var marker;
    var opciones = {
        draggable : false, crossOnDrag : true, icon : imagen, position : location, title : id, map : mapa
    };

    if (marker) {
        marker.setPosition(location);
    }
    else {
        marker = new google.maps.Marker(opciones);
    }
    markadores.push(marker);
}

function eliminarMarcadores(markadores) {
    limpiarMarcadores(markadores);
    markadores = [];
}

function eliminarMedidores() {
    eliminarMarcadores(medidores);
}

function eliminarPostes() {
    eliminarMarcadores(postes);
}

function eliminarSubestaciones() {
    eliminarMarcadores(subestaciones);
}

function limpiarMarcadores(markadores) {
    cargarMarcadores(markadores, null);
}

function cargarMarcadores(markadores, mapa) {
    for (var i = 0;i < markadores.length;i++) {
        markadores[i].setMap(mapa);
    }
}

function guardarMarcador(markadores) {
    var marcador = markadores[0];
    PageMethods.setMarcador(marcador.position.lat(), marcador.position.lng());
    marcador.draggable = false;
}

function refrescarPagina() {
    ctl00_ContentPlaceHolder1_btnRefresco.click();
}

function eliminarMarcador(id) {
    PageMethods.eliminarMarcador(id);  
    buscarPostes();
    refrescarPagina();
}