 function mostrar(idComponente) {

$("#"+idComponente).show("fast");
  }
        
function esconder(idComponente)
{
$("#"+idComponente).hide("30");
}
function menu(event)
{
 var lnk=event.getSource().getClientId();
 var nombre=lnk.substring(4,5);
 var idComponente='pglink'+nombre;
 if(nombre==1)
 {
  esconder('pglink2');
  esconder('pglink3');
  esconder('pglink4');
  mostrar(idComponente);
 }
  if(nombre==2)
 {
  esconder('pglink1');
  esconder('pglink3');
  esconder('pglink4');
  mostrar(idComponente);
 }
  if(nombre==3)
 {
  esconder('pglink1');
  esconder('pglink2');
  esconder('pglink4');
  mostrar(idComponente);
 }
  if(nombre==4)
 {
  esconder('pglink1');
  esconder('pglink2');
  esconder('pglink3');
  mostrar(idComponente);
 }
 /*
 if($("#"+idComponente).is (':visible'))
{
esconder(idComponente);
}
else {mostrar(idComponente);}
*/
}

function mostrarFrame()
{
  $("#panelMenu").hide();
  $("#panelURL").show();
  //setTimeout("prueba()", 5000);
}

function mostrarMenu()
{
  $("#panelMenu").show("fast");
  $("#panelURL").hide();
}
