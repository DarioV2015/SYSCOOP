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

public partial class MPreventivo_RegistrarResultadoOTP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!Page.IsPostBack)
        {
            DatosUsuario datos = (DatosUsuario)Session["datosUsuario"];
            if (datos != null)
            {
                gvOTP.DataSource = Datos.getOTP().buscarOrdenPendientePorUsuario(Convert.ToInt32(datos.NroCuadrilla));
                gvOTP.DataBind();

                if (gvOTP.Rows.Count == 0)
                {
                    lblTrabajo.Visible = false;
                    txtDescripcion.Visible = false;
                    btnRegistrar.Visible = false;
                    btnCancelar.Visible = false;
                    lblNoExiste.Visible = true;
                }
                else
                { lblNoExiste.Visible = false; }
            }
        }

        
    }


    protected void gvOTP_rdbSeleccionar_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow row in this.gvOTP.Rows)
        {
            RadioButton gv_rdbSeleccionar = (RadioButton)row.FindControl("gvOTP_rdbSeleccionar");
            if (gv_rdbSeleccionar.Checked)
            {
                ViewState["idorden"] = row.Cells[1].Text;
                Label lblTarea = (Label)row.FindControl("lblIdTareaPlanificada");
                ViewState["idtarea"] = lblTarea.Text;
                sdsTareas.SelectParameters["tareaplanificada"].DefaultValue = lblTarea.Text;

            }

        }
    }
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow row in this.gvOTP.Rows)
        {
            RadioButton gv_rdbSeleccionar = (RadioButton)row.FindControl("gvOTP_rdbSeleccionar");
            if (gv_rdbSeleccionar.Checked)
            {
                ViewState["idorden"] = row.Cells[1].Text;
                Label lblTarea = (Label)row.FindControl("lblIdTareaPlanificada");
                ViewState["idtarea"] = lblTarea.Text;
                sdsTareas.SelectParameters["tareaplanificada"].DefaultValue = lblTarea.Text;

            }

        }
    }
    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        OrdenTrabajoPreventivo otp = new OrdenTrabajoPreventivo();
        DatosUsuario datos = (DatosUsuario)Session["datosUsuario"];
        otp.IdOTP = Convert.ToInt32(ViewState["idorden"].ToString());
        otp.IdTareaPlanificada =  Convert.ToInt32(ViewState["idtarea"].ToString());
        otp.IdCuadrilla = Convert.ToInt32(datos.NroCuadrilla);
        otp.Asunto = txtDescripcion.Text;

        if (Datos.getOTP().finalizarOTP(otp) > 0)
        {
            Datos.commit();
            ModalPopupExito.Show();
        }
        
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Datos.rollback();
        Response.Redirect("/Cooperativa/InicioCapataz.aspx", true);
    }
    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/InicioCapataz.aspx", true);
    }
}
