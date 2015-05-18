using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.Web.Services;
using System.Collections.Generic;

public partial class Medidor_RegistrarLinea : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string str = "<script> loadMap(); "+
          // " google.maps.event.addListener(mapa, 'click', agregarLinea); "+
        " cargarPostes(); cargarSubestaciones(); cargarLineas(); </script>";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);
        btnAceptar.Attributes.Add("onclick", "return guardarLineas();");

        gvMarcadores.DataSource = Datos.getSubestaciones().buscarSubestaciones();
        gvMarcadores.DataBind();
    }

    [WebMethod]
    public static Object[] getPostes()
    {
        List<Marcador> postes = Datos.getPostes().buscarPostes();
        return postes.ToArray();
    }

    [WebMethod]
    public static Object[] getSubestaciones()
    {
        List<Marcador> subestaciones = Datos.getSubestaciones().buscarSubestaciones();
        return subestaciones.ToArray();
    }

    [WebMethod]
    public static void guardarLineas(String[] p)
    {
       String sqlMaxLinea = "select max(idlinea) from linea";
       int maxLinea = Datos.obtenerMayor(sqlMaxLinea);

       String sqlMaxTramoLinea = "select max(idtramolinea) from tramolinea";
       int maxTramo = Datos.obtenerMayor(sqlMaxTramoLinea);
       String sqlInsertTramoLinea;
      

     /*  if (p.Length > 0)
       {
           Subestacion s =Datos.getSubestaciones().buscarSubestacionesId(p[1]);
          idSubes = Convert.s.Idsubestacion
       }*/

       for (int i = 1; i < p.Length && p.Length > 1; i++)
       {
         
           if (p.Length-1 == i)
           {
               sqlInsertTramoLinea = "insert into tramolinea (idtramolinea,idposteinicio,idpostefin) " +
              " values (" + (maxTramo) + "," + p[i - 1] + "," + p[i] + ")";
           }
           else 
           {
               sqlInsertTramoLinea = "insert into tramolinea (idtramolinea,idposteinicio,idpostefin) " +
             " values (" + (maxTramo) + "," + p[i] + "," + p[i + 1] + ")";
           }

           int tram = Datos.ejecutarComando(sqlInsertTramoLinea);
           Archivo a = new Archivo();
           a.guardarLinea(sqlInsertTramoLinea);
           String sqlInsertLinea = "insert into linea (idlinea, idtramolinea, idsubestacion,idtipolinea,descripcion) values (" + maxLinea + "," + maxTramo + "," + p[0] + ", 1, 'Linea " + maxLinea + "')";
           a.guardarLinea(sqlInsertLinea);
           int lin = Datos.ejecutarComando(sqlInsertLinea);

           maxTramo++;
       }

           //Datos.commit();

    }

    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        mpeConfirmacion.Show();
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Datos.rollback();
        Response.Redirect("/Cooperativa/Default.aspx", false);
    }

    protected void btnAceptarGuardar_Click(object sender, EventArgs e)
    {
        Datos.commit();
        Response.Redirect("/Cooperativa/Default.aspx", false);
    }

    protected void btnCancelarGuardar_Click(object sender, EventArgs e)
    {
        mpeConfirmacion.Hide();
    }

    [WebMethod]
    public static Object[] buscarTodasLineas()
    {
        Object [] arr = Datos.getLineas().obtenerTodasLasLineas().ToArray();
        return arr;
    }

    [WebMethod(EnableSession = true)]
    public static Object[] getLinea(String linea)
    {
        Marcador[] lineas = Datos.getLineas().buscarElementosByLinea(linea).ToArray();
        return lineas;
    }
}
