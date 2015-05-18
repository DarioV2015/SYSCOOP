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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DatosUsuario usr = (DatosUsuario)Session["datosUsuario"];
        if (usr != null)
        {
            lblUsuario.Text = usr.Usuario;
            lblRol.Text = usr.Rol;
        }
    }
}
