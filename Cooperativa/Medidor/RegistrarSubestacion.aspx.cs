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
using System.Collections.Generic;

public partial class Medidor_RegistrarSubestacion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnBuscarDir.Attributes.Add("onclick", "return buscarDirCalleNro();");
        btnAceptar.Attributes.Add("onclick", "return guardarMarcador(subestaciones);");

        string str = "<script>loadMap(); buscarSubestaciones();</script>";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);

        gvMarcadores.DataSource = Datos.getSubestaciones().buscarSubestaciones();
        gvMarcadores.DataBind();
        //OnRowCommand="comandosGVSubestacion"
    }

    [WebMethod(EnableSession = true)]
    public static void agregarMarcador(String lat, String lon, String calle, String nro)
    {
        Marcador m = new Marcador();
        m.Latitud = lat;
        m.Longitud = lon;
        m.Domicilio.NombreCalle = Convert.ToString(HttpContext.Current.Session["calle"]);
        m.Domicilio.NroCalle = Convert.ToSingle(HttpContext.Current.Session["nro"]);
        int insertado = Datos.getSubestaciones().insertarSubestacion(m);
        if (insertado > 0)
        {

        }

    }

    protected void txtCalle_TextChanged(object sender, EventArgs e)
    {
        Session["calle"] = ((TextBox)sender).Text;
    }
    protected void txtNro_TextChanged(object sender, EventArgs e)
    {
        Session["nro"] = ((TextBox)sender).Text;
    }

    protected void salir()
    {
        Response.Redirect("/Cooperativa/Default.aspx", false);
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Default.aspx", false);
    }

    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        Datos.commit();
        Response.Redirect("/Cooperativa/Default.aspx", false);
    }

    [WebMethod]
    public static Object[] getSubestaciones()
    {
        List<Marcador> subs = Datos.getSubestaciones().buscarSubestaciones();
        return subs.ToArray();
    }
}
