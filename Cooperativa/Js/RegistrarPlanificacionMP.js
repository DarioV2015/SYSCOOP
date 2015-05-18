var zona;
var elementos = [];
var lineasMant = [];
function ubicarZona(cn, cs, ce, co)
{
   // -34.1334628, -63.39132710000001
    //-34.1255544, -63.375620000000026
    
    /* var figura = new google.maps.LatLngBounds(
      new google.maps.LatLng(-34.1334628, -63.39132710000001),
      new google.maps.LatLng(-34.1255544, -63.375620000000026));
*/

loadMap();

var rectangulo = buscarCoordenadasZona(cn, cs, ce, co);

 
}

function buscarCoordenadasZona(cn, cs, ce, co)
{

    buscarInterseccion(co,cn);
    buscarInterseccion(co,cs);
    buscarInterseccion(cs,ce);
    buscarInterseccion(cn,ce);
}

function buscarInterseccion(c1,c2)
{
    geocoder.geocode( { 'address': c1 +' y ' +c2+ ', laboulaye, cordoba, argentina'}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) 
    {
        
        //return results[0].geometry.location;
        zona.push(new google.maps.LatLng(results[0].geometry.location.lat(), results[0].geometry.location.lng()));
        if(zona.length === 4)
        {
            zona.push(zona[0]);
            dibujarPoligono(zona);
        }
    } 
    });
}

function dibujarPoligono(array)
{
 // Construct the polygon.
  bermudaTriangle = new google.maps.Polygon({
    paths: array,
    strokeColor: '#FF0000',
    strokeOpacity: 0.8,
    strokeWeight: 2,
    fillColor: '#FF0000',
    fillOpacity: 0.35
  });

  bermudaTriangle.setMap(mapa);
}


function dibujarZona(idzona)
{
loadMap();

 zona = new Array();

switch (idzona)
      {
        case "1":
        zona.push(new google.maps.LatLng('-34.1087566708847', '-63.401763586877394'));//
    zona.push(new google.maps.LatLng('-34.10889880203222', '-63.38403954970698'));//
    zona.push(new google.maps.LatLng('-34.1229962', '-63.38820390000001'));//
    zona.push(new google.maps.LatLng('-34.12045463920787', '-63.40172145828865'));//-34.12695599543159
    zona.push(new google.maps.LatLng('-34.1087566708847', '-63.401763586877394'));
    dibujarPoligono(zona);         
        break;   
         case "2":
        zona.push(new google.maps.LatLng('-34.10889880203222', '-63.38403954970698'));//
    zona.push(new google.maps.LatLng('-34.10882363507934', '-63.37157599515376'));//
    zona.push(new google.maps.LatLng('-34.126330115760496', '-63.37169362584234'));//
    zona.push(new google.maps.LatLng('-34.1229962', '-63.38820390000001'));//
    zona.push(new google.maps.LatLng('-34.10889880203222', '-63.38403954970698'));//
    dibujarPoligono(zona);         
        break;   
         case "3":
        zona.push(new google.maps.LatLng('-34.12045463920787', '-63.40172145828865'));//
    zona.push(new google.maps.LatLng('-34.1229962', '-63.38820390000001'));//
    zona.push(new google.maps.LatLng('-34.1292651', '-63.39009140000002'));//
    zona.push(new google.maps.LatLng('-34.12695599543159', '-63.40185020432136'));//
    zona.push(new google.maps.LatLng('-34.12045463920787', '-63.40172145828865'));//
    dibujarPoligono(zona);         
        break;   
         case "4":
        zona.push(new google.maps.LatLng('-34.1229962', '-63.38820390000001'));//
    zona.push(new google.maps.LatLng('-34.126330115760496', '-63.37169362584234'));//
    zona.push(new google.maps.LatLng('-34.1326474313753', '-63.371675917321795'));
    zona.push(new google.maps.LatLng('-34.1292727', '-63.39008660000002'));//
    zona.push(new google.maps.LatLng('-34.1229962', '-63.38820390000001'));//
    dibujarPoligono(zona);         
        break;   
         case "5":
        zona.push(new google.maps.LatLng('-34.12695599543159', '-63.40185020432136'));//
    zona.push(new google.maps.LatLng('-34.1292651', '-63.39009140000002'));//
    zona.push(new google.maps.LatLng('-34.145710404492945', '-63.39333678728025'));//
    zona.push(new google.maps.LatLng('-34.14436073676822', '-63.40183402543943'));//
    zona.push(new google.maps.LatLng('-34.12695599543159', '-63.40185020432136'));//
    dibujarPoligono(zona);         
        break;   
         case "6":
        zona.push(new google.maps.LatLng('-34.1292651', '-63.39009140000002'));//
    zona.push(new google.maps.LatLng('-34.1326474313753', '-63.371675917321795'));//

    zona.push(new google.maps.LatLng('-34.14891012923296', '-63.37169042788082'));//
       zona.push(new google.maps.LatLng('-34.145710404492945', '-63.39333678728025'));//
    zona.push(new google.maps.LatLng('-34.1292651', '-63.39009140000002'));//
    dibujarPoligono(zona);         
        break;   
         
  }
    PageMethods.buscarZona(idzona,succesBuscarZonas);
}

function fnsuccesscallbackCargarElementos(data) {

    for (i = 0;i < data.length;i++) {
        var marker;
        var opciones = {
            draggable : false, crossOnDrag : true, icon : data[i]['Imagen'], position : new google.maps.LatLng(data[i]['Latitud'], data[i]['Longitud']), title : data[i]['Id'], map : mapa
        };

        marker = new google.maps.Marker(opciones);

        //google.maps.event.addListener(marker, 'click', agregarLinea);

        elementos.push(marker);
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
        path : flightPlanCoordinates, icons : [{icon : null, offset : '100%'}], map : mapa
    });
    
    lineasMant.push(line);

    //animateCircle(line);

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

function succesBuscarZonas(data)
{
data = data.unique();
  for (var i = 0, l = data.length;i < l;i++) {
        PageMethods.getElementosByLinea(data[i]["Idlinea"],fnsuccesscallbackLineas);
        PageMethods.getElementosByLinea(data[i]["Idlinea"],fnsuccesscallbackCargarElementos);
}
}

Array.prototype.unique=function(a){
  return function(){return this.filter(a)}}(function(a,b,c){return c.indexOf(a,b+1)<0
});