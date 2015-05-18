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

public partial class MPreventivo_RegistrarHerramienta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblNroHerramienta.Text = Convert.ToString(Datos.getHerramienta().obtenerUltimoNroHerramienta());
    }
    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        ModalPopupConfirmacion.Show();
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Show();
    }
    protected void btnAceptarRegistrar_Click(object sender, EventArgs e)
    {
        ModalPopupConfirmacion.Hide();
        String esp1 = txtDurabilidad.Text;
        String esp2 = txtSeguridad.Text;
        String esp3 = txtNormas.Text;
        String esp4 = txtOtras.Text;
        String cadena = "";

        if (esp1 != "")
        { cadena = "Durabilidad: " + esp1 + " - "; }
        if (esp2 != "")
        { cadena += "Seguuridad: " + esp2 + " - "; }
        if (esp3 != "")
        { cadena += "Normas: " + esp3 + " - "; }
        if (esp4 != "")
        { cadena += "Otros: " + esp4 + " - "; }

        String nombre = txtNombre.Text;

        int tipo = Convert.ToInt32(this.ddlTipoHerramienta.SelectedValue);
        int idHerramienta = Datos.getHerramienta().obtenerUltimoNroHerramienta();
        int fila = 0;

        fila = Datos.getHerramienta().crearHerramienta(idHerramienta, tipo, nombre, cadena);
        if (fila > 0)
        {
            Datos.commit();
            ModalPopupExito.Show();
        }


    }
    protected void btnCancelarRegistrar_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Hide();
    }
    protected void btnAceptarCancelacion_Click(object sender, EventArgs e)
    {
        if (Session["RegistrarContratoHerramienta"] == "1")
        {
            Response.Redirect("/Cooperativa/MPreventivo/RegistrarContrato.aspx", true);
        }
        else
        {
            Response.Redirect("/Cooperativa/Default.aspx", true);
        }
    }
    protected void btnCancelarCancelacion_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Hide();
    }
    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        if (Session["RegistrarContratoHerramienta"] == "1")
        {
            Response.Redirect("/Cooperativa/MPreventivo/RegistrarContrato.aspx", true);
        }
        else
        {
            Response.Redirect("/Cooperativa/Default.aspx", true);
        }
    }

}
