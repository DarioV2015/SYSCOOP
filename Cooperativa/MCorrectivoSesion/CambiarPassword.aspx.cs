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

public partial class MCorrectivoSesion_CambiarPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        DatosUsuario usr = (DatosUsuario)Session["datosUsuario"];
        int exito = Seguridad.cambiarContraseña(usr.IdUsuario, txtNueva.Text);
        if (exito > 0)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("/Cooperativa/Medidor/Login.aspx", true);
        }
        else 
        {
 
        }
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        DatosUsuario usr = (DatosUsuario)Session["datosUsuario"];
        if (!usr.Password.Equals(args.Value))
        {
            args.IsValid = false;
        }
    }
}
