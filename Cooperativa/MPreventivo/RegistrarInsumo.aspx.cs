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

public partial class MPreventivo_RegistrarInsumo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblNroInsumo.Text = Convert.ToString(Datos.getInsumo().obtenerUltimoNroInsumo());
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

        String esp1 = txtTemperatura.Text;
        String esp2 = txtAmperaje.Text;
        String esp3 = txtCondClima.Text;
        String esp4 = txtModoInst.Text;
        String esp5 = txtOtro.Text;


        String cadena = "";

        if (esp1 != "")
        { cadena = "Temperatura: " + esp1 + " - "; }
        if (esp2 != "")
        { cadena += "Amperaje: " + esp2 + " - "; }
        if (esp3 != "")
        { cadena += "Condiciones Climáticas: " + esp3 + " - "; }
        if (esp4 != "")
        { cadena += "Modo Inst.: " + esp4 + " - "; }
        if (esp5 != "")
        { cadena += "Otros: " + esp5 + " - "; }

        
        String nombre = txtNombre.Text;
        
        int tipo = Convert.ToInt32(ddlTipoInsumo.SelectedValue);
        int idInsumo = Datos.getInsumo().obtenerUltimoNroInsumo();
        int fila = 0;
        
        if (txtUnidadMedida.Text == "")
        {
            int especificacion = Convert.ToInt32(txtEspecificacion.Text);  
            fila = Datos.getInsumo().crearInsumoConEspecificacion(idInsumo, tipo, nombre, especificacion, cadena);
        }
        if (txtEspecificacion.Text == "")
        {
            String unidad = txtUnidadMedida.Text;
            fila = Datos.getInsumo().crearInsumoConUnidadMedida(idInsumo, tipo, nombre, unidad, cadena);
        }
        
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
        if (Session["RegistrarContratoInsumo"] == "1")
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
        if (Session["RegistrarContratoInsumo"] == "1")
        {
            Response.Redirect("/Cooperativa/MPreventivo/RegistrarContrato.aspx", true);
        }
        else
        {
            Response.Redirect("/Cooperativa/Default.aspx", true); 
        }
        
        
    }
    protected void txtUnidadMedida_TextChanged(object sender, EventArgs e)
    {
        txtEspecificacion.Enabled = false;
    }
    protected void txtEspecificacion_TextChanged(object sender, EventArgs e)
    {
        txtUnidadMedida.Enabled = false;
    }
}
