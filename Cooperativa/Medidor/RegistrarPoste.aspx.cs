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
using System.Web.Services;
using Microsoft.Ajax.Utilities;
using System.Data.OleDb;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.Collections.Generic;


public partial class Medidor_RegistrarPoste : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            btnBuscarDir.Attributes.Add("onclick", "return buscarDirCalleNro();");
            btnAceptar.Attributes.Add("onclick", "return guardarMarcador(postes);");
           
        }
        else 
        {
 
        }

        string str = "<script>loadMap(); buscarPostes(); buscarSubestaciones(); </script>";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);
        gvMarcadores.DataSource = Datos.getPostes().buscarPostes();
        gvMarcadores.DataBind();
        
    }

    [WebMethod(EnableSession = true)]
    public void setMarcador(String lat, String lon)
    {
        Marcador m = new Marcador();
        m.Latitud = lat;
        m.Longitud = lon;
        m.Domicilio.NombreCalle = Convert.ToString(HttpContext.Current.Session["calle"]);
        m.Domicilio.NroCalle = Convert.ToSingle(HttpContext.Current.Session["nro"]);
        int insertado = Datos.getPostes().insertarPoste(m);
        if (insertado > 0)
        {
            Datos.commit();
        }
        else 
        {
            Datos.rollback();
        }

        Context.Response.StatusCode = 307;
        Context.Response.AddHeader("Location", "/Medidor/RegistrarPoste.aspx");
        //Response.Redirect("/Cooperativa/Default.aspx", false);
        //Marcador marcador = (Marcador) m;
        //p.Nombre = "RAUL SUAREZ";
        //var result = new JsonResult();
        //var products = JsonConvert.SerializeObject(p).ToString();
        //result.Data = products;
    }
    protected void txtCalle_TextChanged(object sender, EventArgs e)
    {
        Session["calle"] = ((TextBox)sender).Text;
    }
    protected void txtNro_TextChanged(object sender, EventArgs e)
    {
        Session["nro"] = ((TextBox)sender).Text;
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Datos.rollback();
        Response.Redirect("/Cooperativa/Default.aspx", false);
    }

    [WebMethod]
    public static Object[] getPostes()
    {
        List<Marcador> postes = Datos.getPostes().buscarPostes();
        return postes.ToArray();
    }


    [WebMethod(EnableSession = true)]
    public static void agregarMarcador(String lat, String lon, String calle, String nro,String idzona)
    {
     /*   List<Marcador> postes;
        if (HttpContext.Current.Session["postes"] == null)
        {
            postes = new List<Marcador>();
        }
        else {
            postes = (List<Marcador>)HttpContext.Current.Session["postes"];
        }
        
        
        Marcador m = new Marcador();
        m.Latitud = lat;
        m.Longitud = lon;
        m.Domicilio.NombreCalle = calle;//Convert.ToString(HttpContext.Current.Session["calle"]);
        m.Domicilio.NroCalle = Convert.ToSingle(nro);//Convert.ToSingle(HttpContext.Current.Session["nro"]);
        postes.Add(m);

        HttpContext.Current.Session["postes"] = postes;
        */

        Marcador m = new Marcador();
        m.Latitud = lat;
        m.Longitud = lon;
        m.Idzona = idzona;
        m.Domicilio.NombreCalle = calle;//Convert.ToString(HttpContext.Current.Session["calle"]);
        m.Domicilio.NroCalle = Convert.ToSingle(nro);//Convert.ToSingle(HttpContext.Current.Session["nro"]);
        int insertado = Datos.getPostes().insertarPoste(m);
        if (insertado > 0)
        {

        }

        //Marcador marc = (Marcador)HttpContext.Current.Session["marc"];
        //marc.cargarTabla(postes);

        
        //"document.getElementById('<%= savebtn.ClientID %>').click()";

       // gvMarcadores.DataSource = postes;
       // gvMarcadores.DataBind();

        /*int insertado = Datos.getPostes().insertarPoste(m);
        if (insertado > 0)
        {
            Datos.commit();
        }
        else
        {
            Datos.rollback();
        }

        Context.Response.StatusCode = 307;
        Context.Response.AddHeader("Location", "/Medidor/RegistrarPoste.aspx");*/
        //Response.Redirect("/Cooperativa/Default.aspx", false);
        //Marcador marcador = (Marcador) m;
        //p.Nombre = "RAUL SUAREZ";
        //var result = new JsonResult();
        //var products = JsonConvert.SerializeObject(p).ToString();
        //result.Data = products;
    }


    protected void comandosGVPostes(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRow")
        {
            e.CommandArgument.ToString();
            int rowIndex = ((GridViewRow)((Button)e.CommandSource).NamingContainer).RowIndex;
            String idPoste = gvMarcadores.Rows[rowIndex].Cells[0].Text;
            Datos.getPostes().eliminarPoste(idPoste);
            gvMarcadores.DataSource = Datos.getPostes().buscarPostes();
            gvMarcadores.DataBind();
            //upTabla.Update();
            //gvMarcadores.Rows.Remove(gvMarcadores.Rows[rowIndex]);5
            //gvMarcadores.DeleteRow(rowIndex);

           // int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
           // gvMedidores.EditIndex = rowIndex;

        }

        //gvMarcadores.DataBind();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        gvMarcadores.DataSource = Datos.getPostes().buscarPostes();
        gvMarcadores.DataBind();
        //upTabla.Update();
        //upTabla.Update(); //UpdateMode="Conditional"
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


    [WebMethod(EnableSession = true)]
    public static void moverMarcador(String lat, String lon, String id,String calle, String nro)
    {
        Marcador m = new Marcador();
        m.Latitud = lat;
        m.Longitud = lon;
        m.Calle = calle;
        m.Nro = nro;
        m.Id = id;
        int insertado = Datos.getPostes().updateUbicacionPoste(m);
        if (insertado > 0)
        {
        //    Datos.commit();
        }
        else
        {
          //  Datos.rollback();
        }
    }

    [WebMethod(EnableSession = true)]
    public static Object eliminarMarcador(String id)
    {
        int eliminado = Datos.getPostes().eliminarPoste(id);
        return eliminado;
            }

    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        mpeConfirmacion.Show();
    }

    protected void btnAceptarAdvertencia_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Hide();
    }

    [WebMethod]
    public static Object[] getSubestaciones()
    {
        List<Marcador> subs = Datos.getSubestaciones().buscarSubestaciones();
        return subs.ToArray();
    }

    protected void gvMarcadores_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvMarcadores.PageIndex = e.NewPageIndex;
    }

}
