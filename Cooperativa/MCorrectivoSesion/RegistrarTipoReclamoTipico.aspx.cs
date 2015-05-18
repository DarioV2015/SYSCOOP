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

public partial class MCorrectivoSesion_RegistrarTipoReclamoTipico : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            txtNombre.Focus();
        }
    }
    protected void btnRegistrarReclamo_Click(object sender, EventArgs e)
    {
        if(txtNombre.Text != " " && txtDescripcion.Text != " " && comboPrioridad.SelectedIndex != 0)
            ModalPopupRegistrar.Show();
    }
    protected void btnAceptarRegistrar_Click(object sender, EventArgs e)
    {
        try
        {
            TipoReclamoTipico tr = new TipoReclamoTipico();

            tr.IdTipoReclamo = Datos.getTipoReclamo().obtenerUltimoNroArtefacto();
            tr.Descripcion = txtDescripcion.Text;
            tr.Prioridad = Convert.ToInt32(comboPrioridad.SelectedItem.Value);
            tr.TiempoResolucion = 0; //por defecto
            tr.Nombre = txtNombre.Text;

            int resultado = Datos.getTipoReclamo().crearTipoReclamo(tr);

            Datos.commit();

        }
        catch (Exception err)
        {
            Console.WriteLine(err.ToString());
            Datos.rollback();
        }

        ModalPopupRegistrar.Hide();
        ModalPopupExito.Show();
    }
    protected void btnCancelarRegistrar_Click(object sender, EventArgs e)
    {
        ModalPopupRegistrar.Hide(); 
    }
    protected void btnCancelarReclamo_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Show();
    }
    protected void btnAceptarCancelacion_Click(object sender, EventArgs e)
    {
        //me fijo si viene de RegistrarReclamo o no
        if (Convert.ToInt32(Session["haciaTipoReclamoTipico"]) == 0) //NO viene de RegistrarReclamo
            Response.Redirect("/Cooperativa/Default.aspx", true);
        else
        {
            Session["haciaRegistrarReclamo"] = 1;
            Response.Redirect("/Cooperativa/MCorrectivoSesion/RegistrarReclamo.aspx", true);
        }
    }
    protected void btnCancelarCancelacion_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Hide();
        txtNombre.Focus();
    }
    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        //me fijo si viene de RegistrarReclamo o no
        if (Convert.ToInt32(Session["haciaTipoReclamoTipico"]) == 0) //NO viene de RegistrarReclamo
            Response.Redirect("/Cooperativa/Default.aspx", true);
        else
        {
            Session["haciaRegistrarReclamo"] = 1;
            Response.Redirect("/Cooperativa/MCorrectivoSesion/RegistrarReclamo.aspx", true);
        }
    }

}
