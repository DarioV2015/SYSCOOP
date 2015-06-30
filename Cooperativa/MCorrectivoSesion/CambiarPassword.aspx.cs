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
        if (!Page.IsPostBack)
            txtAnterior.Focus();
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        DatosUsuario usr = (DatosUsuario)Session["datosUsuario"];
        if (!usr.Password.Equals(args.Value))
        {
            args.IsValid = false;
        }
    }
    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        Session["passwordAnterior"] = txtAnterior.Text;
        Session["passwordNueva"] = txtNueva.Text;
        Session["passwordRepetida"] = txtRepetir.Text;

        //no es correcta la contraseña anterior
        DatosUsuario usr = (DatosUsuario)Session["datosUsuario"];
        if (Datos.recuperarPassword(Convert.ToInt32(usr.IdUsuario)).ToUpper() != Session["passwordAnterior"].ToString().ToUpper())
            ModalPopupPasswordEquivocada.Show();
        else
        {
            //no coinciden la contraseña nueva con  su repetición
            if (Session["passwordRepetida"].ToString().ToUpper() != Session["passwordNueva"].ToString().ToUpper())
                ModalPopupNoCoinciden.Show();
            else
            {
                ModalPopupConfirmacion.Show();
            }
        }
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Show();
    }
    protected void btnAceptarRegistrar_Click(object sender, EventArgs e)
    {
        DatosUsuario usr = (DatosUsuario)Session["datosUsuario"];
        int exito = Seguridad.cambiarContraseña(usr.IdUsuario, Session["passwordNueva"].ToString());
        if (exito > 0)
        {
            FormsAuthentication.SignOut();

            ModalPopupConfirmacion.Hide();
            ModalPopupExito.Show();
        }
        else
        {

        }
    }
    protected void btnCancelarRegistrar_Click(object sender, EventArgs e)
    {
        ModalPopupConfirmacion.Hide();
    }
    protected void btnAceptarCancelacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Medidor/Login.aspx", true);
    }
    protected void btnCancelarCancelacion_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Hide();
        txtAnterior.Focus();
    }
    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Medidor/Login.aspx", true);
    }
    protected void btnAceptarNoCoinciden_Click(object sender, EventArgs e)
    {
        ModalPopupNoCoinciden.Hide();
        txtAnterior.Text = "";
        txtNueva.Text = "";
        txtRepetir.Text = "";
        txtAnterior.Focus();
    }
    protected void btnAceptarNoCorrecta_Click(object sender, EventArgs e)
    {
        ModalPopupPasswordEquivocada.Hide();
        txtAnterior.Text = "";
        txtNueva.Text = "";
        txtRepetir.Text = "";
        txtAnterior.Focus();
    }
}
