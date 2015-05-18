var mapa;
var poly;
var opcionesMapa;
var drawingManager;
var selectedShape;
var shapeList = new Array();
var actionBtn;
var errorBtn;
var cargaBtn;
var idx = 0;
var ejecutar = true;
var topeFormas = 3;

var polyOptions = {
    fillColor : '#88001B', fillOpacity : 0.4, strokeColor : '#ffffff', strokeWeight : 2, clickable : true, editable : true, draggable : true
};

var jsArray = [{'tipo' : 'marker', 'coordenadas' : [{'lat' :  - 31.25, 'lng' :  - 64.2}], 'superficie' : null
},
{
    'tipo' : 'polygon', 'coordenadas' : [{'lat' :  - 33.2546, 'lng' :  - 61.2015},{'lat' :  - 33.4126, 'lng' :  - 62.3114},{'lat' :  - 32.9241, 'lng' :  - 62.4501}], 'superficie' : null
},
{
    'tipo' : 'circle', 'coordenadas' : [{'lat' :  - 34.45, 'lng' :  - 63.2226}], 'superficie' : 153600000.0}];
            

function loadMap(evt) {

    var mapOptions = {
        zoom : 15, mapTypeId : google.maps.MapTypeId.ROADMAP, minZoom : 7
    };
    
    mapa = new google.maps.Map(document.getElementById('divMap'), mapOptions);
    this.setInitialLocation();
    geocoder = new google.maps.Geocoder();
    
    poly = new google.maps.Polyline(polyOptions);
    poly.setMap(mapa);
    
   /* controlDibujo();
    controlEventos();
    var cargo = this.cargarShapes();
    if (cargo)
        this.centrarMapaEnFigura(shapeList[0].id);
    else 
        this.setInitialLocation();*/
}

function cargarFunction(evt) {
    var source = evt.getSource();
    jsArray = source.getProperty("coordenadasArray");
    this.cargarShapes();
    evt.cancel();
}

// Array Remove - By John Resig (MIT Licensed)  
Array.prototype.remove = function (from, to) {
    var rest = this.slice((to || from) + 1 || this.length);
    this.length = from < 0 ? this.length + from : from;
    return this.push.apply(this, rest);
};

function setInitialLocation() {
    if (true) {
        mapa.setCenter(this.getDefaultLocation());
        return;
    }
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            if (position.coords.latitude == null || position.coords.longitude == null)
                mapa.setCenter(this.getDefaultLocation());
            else 
                mapa.setCenter(new google.maps.LatLng(position.coords.latitude, position.coords.longitude));
        },
        function (error) {
            mapa.setCenter(this.getDefaultLocation());
        });
    }
    else {
        mapa.setCenter(this.getDefaultLocation());
    }
}

function getDefaultLocation() {
    return new google.maps.LatLng( 	-34.12818300782329,  	-63.39045739208814);//La segunda - casa central
    //return new google.maps.LatLng( - 31.416285,  - 64.191295);//cordoba
}

function controlDibujo() {
    if (drawingManager == null)
        drawingManager = new google.maps.drawing.DrawingManager( {
            drawingMode : null, drawingControl : true, drawingControlOptions :  {
                position : google.maps.ControlPosition.TOP_CENTER, drawingModes : [google.maps.drawing.OverlayType.MARKER, google.maps.drawing.OverlayType.POLYGON, google.maps.drawing.OverlayType.RECTANGLE, google.maps.drawing.OverlayType.CIRCLE]
            },
            markerOptions : markerOptions, polygonOptions : polyOptions, rectangleOptions : polyOptions, circleOptions : polyOptions
        });
    drawingManager.setMap(mapa);
}

function setTopeFormas(tope) {
    if (tope == null)
        return;
    else 
        topeFormas = tipo;
}

function buscarDireccion(evt) {
    var source = evt.getSource();
    //var component = source.getProperty("clientId");
    var localidad = AdfPage.PAGE.findComponent("r1:0:localidad").getValue();
    var campo = AdfPage.PAGE.findComponent("r1:0:campo").getValue();
    var km = AdfPage.PAGE.findComponent("r1:0:km").getValue();
    var direccion = AdfPage.PAGE.findComponent("r1:0:direccion").getValue();
    if (campo != null)
        localidad = campo + ', ' + localidad;
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode( {
        address : localidad
    },
    function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            var lugar = results[0].geometry.location;
            mapa.setCenter(calcularCentro(lugar, km, direccion));
        }
    });
    evt.cancel();
}

function calcularCentro(punto, km, direccion) {
    if (km == null || km <= 0 || direccion == null)
        return punto;
    var inclinacion;
    var radio = 6378.29;
    if (direccion == 'N') {
        inclinacion = 0;
    }
    if (direccion == 'NE') {
        inclinacion = (1 / 4) * Math.PI;
    }
    if (direccion == 'E') {
        inclinacion = (1 / 2) * Math.PI;
    }
    if (direccion == 'SE') {
        inclinacion = (3 / 4) * Math.PI;
    }
    if (direccion == 'S') {
        inclinacion = Math.PI;
    }
    if (direccion == 'SO') {
        inclinacion = (5 / 4) * Math.PI;
    }
    if (direccion == 'O') {
        inclinacion = (3 / 2) * Math.PI;
    }
    if (direccion == 'NO') {
        inclinacion = (7 / 4) * Math.PI;
    }
    var distAng = km / radio;
    var lat = toRadians(punto.lat()) + distAng * Math.cos(inclinacion);
    var dLat = lat - toRadians(punto.lat());
    var dPhi = Math.log(Math.tan(lat / 2 + Math.PI / 4) / Math.tan(toRadians(punto.lat()) / 2 + Math.PI / 4));
    var q = (Math.abs(dLat) > 1e-10) ? dLat / dPhi : Math.cos(toRadians(punto.lat()));
    var dLon = distAng * Math.sin(inclinacion) / q;
    if (Math.abs(lat) > Math.PI / 2)
        lat = lat > 0 ? Math.PI - lat :  - (Math.PI - lat);
    var lng = (toRadians(punto.lng()) + dLon + Math.PI) % (2 * Math.PI) - Math.PI;
    var nuevoPunto = new google.maps.LatLng(toDegrees(lat), toDegrees(lng));
    return nuevoPunto;
}

function toRadians(degrees) {
    return degrees * (Math.PI / 180);
}

function toDegrees(radians) {
    return radians * (180 / Math.PI);
}

function clearListSelection() {
    for (var i = 0;i < shapeList.length;i++) {
        if (shapeList[i] != null && shapeList[i].shape.type != google.maps.drawing.OverlayType.MARKER) {
            shapeList[i].shape.setEditable(false);
        }
    }
}

function setShapeSelection(shapeEx) {
    for (var i = 0;i < shapeList.length;i++) {
        if (shapeList[i] != null && shapeEx.id == shapeList[i].id) {
            shapeList[i] = shapeEx;
            if (shapeList[i].shape.type != google.maps.drawing.OverlayType.MARKER)
                shapeList[i].shape.setEditable(true);
            selectedShape = shapeList[i];
        }
    }
}

function deleteSelectedShape() {
    for (var i = 0;i < shapeList.length;i++) {
        if (shapeList[i] != null && selectedShape.id == shapeList[i].id) {
            shapeList[i].shape.setMap(null);
            shapeList[i] = null;
        }
    }
}

function getDatosShape(shape) {
    var datosShape = {
        coordenadas : null, superficie : null, perimetro : null, ubicacion : null
    };
    if (shape == null) {
        return null;
    }
    else {
        var path = this.obtenerShapePath(shape);
        datosShape.coordenadas = this.obtenerCoordenadasShape(path);
        datosShape.superficie = this.obtenerAreaShape(shape, path);
        datosShape.perimetro = this.obtenerPerimetroShape(shape, path);
        datosShape.tipo = shape.type;
    }
    updateDatosUbicacion(datosShape.coordenadas, retornoUbicacion);
    return datosShape;
}

function obtenerShapePath(shape) {
    var path;
    if (shape.type == google.maps.drawing.OverlayType.POLYGON) {
        path = shape.getPath();
    }
    else if (shape.type == google.maps.drawing.OverlayType.MARKER) {
        path = new google.maps.MVCArray([shape.getPosition()]);
    }
    else if (shape.type == google.maps.drawing.OverlayType.CIRCLE) {
        path = new google.maps.MVCArray([shape.getCenter()]);
    }
    else {
        var so = shape.getBounds().getSouthWest();
        var ne = shape.getBounds().getNorthEast();
        var se = new google.maps.LatLng(so.lat(), ne.lng());
        var no = new google.maps.LatLng(ne.lat(), so.lng());
        path = new google.maps.MVCArray([ne, no, so, se]);
    }
    return path;
}

function obtenerCoordenadasShape(path) {
    var coords = [];
    for (i = 0;i < path.getLength();i++) {
        var pos = {
            lat : path.getAt(i).lat(), lng : path.getAt(i).lng()
        };
        coords[i] = pos;
    }
    return coords;
}

function obtenerAreaShape(shape, path) {
    var area = null;
    if (shape.type == google.maps.drawing.OverlayType.MARKER) {
        area = null;
    }
    else if (shape.type == google.maps.drawing.OverlayType.CIRCLE) {
        area = Math.pow(shape.getRadius(), 2) * Math.PI;
    }
    else {
        area = google.maps.geometry.spherical.computeArea(path.getArray());
    }
    return area;
}

function obtenerPerimetroShape(shape, path) {
    var perimetro = null;
    if (shape.type == google.maps.drawing.OverlayType.MARKER) {
        perimetro = null;
    }
    else if (shape.type == google.maps.drawing.OverlayType.CIRCLE) {
        perimetro = 2 * shape.getRadius() * Math.PI;
    }
    else {
        perimetro = google.maps.geometry.spherical.computeLength(path.getArray());
    }
    return perimetro;
}

function updateDatosUbicacion(coordenadas, retornoUbicacion) {
    if (coordenadas == null)
        return null;
    puntoCtral = obtenerPuntoCentral(coordenadas);
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode( {
        latLng : puntoCtral
    },
    function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            var result = results[0];
            var ubicacion = {
                calle : null, numero : null, codigoPostal : null, localidad : null, departamento : null, provincia : null, pais : null
            };
            for (var i = 0;i < result.address_components.length;i++) {
                var ac = result.address_components[i];
                if (ac.types.indexOf('street_number') >= 0) {
                    ubicacion.numero = ac.long_name;
                }
                if (ac.types.indexOf('route') >= 0) {
                    ubicacion.calle = ac.long_name;
                }
                if (ac.types.indexOf('postal_code') >= 0) {
                    ubicacion.codigoPostal = ac.long_name;
                }
                if (ac.types.indexOf('locality') >= 0) {
                    ubicacion.localidad = ac.long_name;
                }
                if (ac.types.indexOf('administrative_area_level_2') >= 0) {
                    ubicacion.departamento = ac.long_name;
                }
                if (ac.types.indexOf('administrative_area_level_1') >= 0) {
                    ubicacion.provincia = ac.long_name;
                }
                if (ac.types.indexOf('country') >= 0) {
                    ubicacion.pais = ac.long_name;
                }
            }
            retornoUbicacion(ubicacion);
        }
    });
}

function retornoUbicacion(ubicacion) {
    selectedShape.datos.ubicacion = ubicacion;
    debug();
}

function obtenerPuntoCentral(coordenadas) {
    if (coordenadas == null)
        return null;
    var bounds = new google.maps.LatLngBounds();
    for (var i = 0;i < coordenadas.length;i++) {
        bounds.extend(new google.maps.LatLng(coordenadas[i].lat, coordenadas[i].lng));
    }
    return bounds.getCenter();
}

function debug() {
    /*
                  var comp = AdfPage.PAGE.findComponentByAbsoluteId('r1:0:otDatos');
                  var descripcion = 'Total Formas = ' + shapeList.length + '; ';
                  for (var i = 0;i < shapeList.length;i++) {
                      if (shapeList[i] != null) {
                          var ids = shapeList[i].id;
                          var puntos = shapeList[i].datos == null ? '' : shapeList[i].datos.coordenadas.length;
                          var areax = shapeList[i].datos == null ? '' : shapeList[i].datos.superficie;
                          var peri = shapeList[i].datos == null ? '' : shapeList[i].datos.perimetro;
                          var depto = (shapeList[i].datos == null || shapeList[i].datos.ubicacion == null) ? '' : shapeList[i].datos.ubicacion.departamento;
                          descripcion = descripcion + ' **' + ids + '** puntos = ' + puntos + ' area = ' + areax + ' peri = ' + peri + ' ubic = ' + depto + '; ';
                      }
                  }
                  comp.setValue(descripcion);
                  AdfPage.PAGE.addPartialTargets(comp);
                  */
    AdfActionEvent.queue(actionBtn, true);
}

function getId() {
    var id = Math.floor(idx);
    idx = idx + 1;
    return id;
}

function controlEventos() {
    google.maps.event.addListener(drawingManager, 'overlaycomplete', function (e) {
        try {
            drawingManager.setDrawingMode(null);
            var shape = e.overlay;
            shape.type = e.type;
            /*
            if (ejecutar == true) {
                ejecutar = false;
            }
            else {
                ejecutar = true;
                return;
            }
            */
            if (getShapeList().length >= topeFormas) {
                shape.setMap(null);
                alert('No esta permitido mas de una figura');
                return;
            }
            addShape(shape);
            debug();
            activarDrawingManager();
        }
        catch (error) {
            alert(errorDetail(error));
        }
    });
    // Clear the current selection when the drawing mode is changed, or when the map is clicked.
    google.maps.event.addListener(drawingManager, 'drawingmode_changed', clearListSelection);
    google.maps.event.addListener(mapa, 'click', clearListSelection);
    //google.maps.event.addDomListener(actionBtn, 'click', deleteSelectedShape);
}

function addShapeListeners(shapeEx) {
    google.maps.event.addListener(shapeEx.shape, 'click', function () {
        clearListSelection();
        setShapeSelection(shapeEx);
        debug();
    });
    google.maps.event.addListener(shapeEx.shape, 'dragend', function () {
        setShapeSelection(shapeEx);
        selectedShape.datos = getDatosShape(selectedShape.shape);
        debug();
    });
    google.maps.event.addDomListener(window, 'keypress', function (event) {
        if (event.keyCode == 46) {
            activarDrawingManager();
            deleteSelectedShape();
            debug();
        }
    });
    if (shapeEx.shape.type == google.maps.drawing.OverlayType.POLYGON) {
        google.maps.event.addListener(shapeEx.shape.getPath(), 'insert_at', function () {
            selectedShape.datos = getDatosShape(selectedShape.shape);
            debug();
        });
        google.maps.event.addListener(shapeEx.shape.getPath(), 'remove_at', function () {
            selectedShape.datos = getDatosShape(selectedShape.shape);
            debug();
        });

        google.maps.event.addListener(shapeEx.shape.getPath(), 'set_at', function () {
            selectedShape.datos = getDatosShape(selectedShape.shape);
            debug();
        });
    }
    if (shapeEx.shape.type == google.maps.drawing.OverlayType.CIRCLE) {
        google.maps.event.addListener(shapeEx.shape, 'radius_changed', function () {
            selectedShape.datos = getDatosShape(selectedShape.shape);
            debug();
        });
        google.maps.event.addListener(shapeEx.shape, 'center_changed', function () {
            selectedShape.datos = getDatosShape(selectedShape.shape);
            debug();
        });
    }
    if (shapeEx.shape.type == google.maps.drawing.OverlayType.RECTANGLE) {
        google.maps.event.addListener(shapeEx.shape, 'bounds_changed', function () {
            selectedShape.datos = getDatosShape(selectedShape.shape);
            debug();
        });
    }
}

function getShapeList() {
    var j = 0;
    var formas = [];
    for (var i = 0;i < shapeList.length;i++) {
        if (shapeList[i] != null) {
            var id = shapeList[i].id;
            var datos = shapeList[i].datos;
            var forma = {
                id : id, datos : datos
            };
            formas[j] = forma;
            j = j + 1;
        }
    }
    return formas;
}

function actionEventFire(evt) {
    var source = evt.getSource();
    var formas = getShapeList();
    AdfCustomEvent.queue(source, "googleMapsListener", 
    {
        formas : formas
    },
false);
    evt.cancel();
}

function setJavaArray(javaArray) {
    alert(javaArray);
    jsArray = javaArray;
}

function addShape(shape) {
    var shapeEx = {
        id : null, shape : null, datos : null, tipo : null
    };
    var id = getId();
    shapeEx.id = id;
    shapeEx.shape = shape;
    shapeEx.datos = getDatosShape(shape);
    addShapeListeners(shapeEx);
    shapeList[id] = shapeEx;
    setShapeSelection(shapeEx);
}

function cargarShapes() {
    if (jsArray == null)
        return false;
    try {
        for (var i = 0;i < jsArray.length;i++) {
            var dato = jsArray[i];
            var shape = null;
            if (dato.tipo == null) {
                if (dato.coordenadas.length > 1) {
                    shape = this.crearPoligono(dato.coordenadas);
                }
                else if (dato.superficie != null && dato.superficie > 0) {
                    shape = this.crearCirculo(dato.coordenadas, dato.superficie);
                }
                else {
                    shape = this.crearMarcador(dato.coordenadas);
                }
            }
            else {
                if (dato.tipo == google.maps.drawing.OverlayType.MARKER) {
                    shape = this.crearMarcador(dato.coordenadas);
                }
                else if (dato.tipo == google.maps.drawing.OverlayType.CIRCLE) {
                    if (dato.superficie != null && dato.superficie > 0)
                        shape = this.crearCirculo(dato.coordenadas, dato.superficie);
                    else 
                        shape = this.crearMarcador(dato.coordenadas);
                }
                else {
                    shape = this.crearPoligono(dato.coordenadas);
                }
            }
            shape.setMap(mapa);
            addShape(shape);
        }
        clearListSelection();
        activarDrawingManager();
        debug();
    }
    catch (error) {
        alert(this.errorDetail(error));
    }
    return true;
}

function activarDrawingManager() {
    if (getShapeList().length < topeFormas) {
        drawingManager.setMap(mapa);
    }
    else {
        drawingManager.setMap(null);
    }
}

function errorDetail(error) {
    if (error != null)
        return 'Error : ' + error.message + ' - Line : ' + error.lineNumber + '\n' + error.stack;
    else 
        return 'ERROR: NO error detail found!!!';
}

function centrarMapaEnFigura(id) {
    for (var i = 0;i < shapeList.length;i++) {
        if (shapeList[i].id == id) {
            var shape = shapeList[i].shape;
            var ptoCtral = this.obtenerPuntoCentral(this.obtenerCoordenadasShape(this.obtenerShapePath(shape)))
            mapa.setCenter(ptoCtral);
        }
    }
}

function crearPoligono(coordenadas) {
    var path = [];
    for (i = 0;i < coordenadas.length;i++) {
        path.push(new google.maps.LatLng(coordenadas[i].lat, coordenadas[i].lng));
    }
    var options = polyOptions;
    options.paths = path;
    var shape = new google.maps.Polygon(options);
    shape.type = google.maps.drawing.OverlayType.POLYGON;
    return shape;
}

function crearCirculo(coordenadas, superficie) {
    var center = new google.maps.LatLng(coordenadas[0].lat, coordenadas[0].lng);
    var radius = Math.sqrt(superficie / Math.PI);
    var options = polyOptions;
    options.center = center;
    options.radius = radius;
    var shape = new google.maps.Circle(options);
    shape.type = google.maps.drawing.OverlayType.CIRCLE;
    return shape;
}



//google.maps.event.addDomListener(window, 'keypress', deleteShape);
//google.maps.event.addDomListener(window, 'load', initialize);
