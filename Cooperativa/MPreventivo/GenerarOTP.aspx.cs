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
using System.Collections.Generic;
using System.Data.SqlClient;

public partial class MPreventivo_GenerarOTP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           

            List<OrdenTrabajoPreventivo> listOtp = Datos.getOTP().buscarOTPPendientes();
            if (listOtp.Count > 0)
            {
                lblNoExiste.Text = "";
                gvTareasPlanificadas.DataSource = listOtp;
                gvTareasPlanificadas.DataBind();
            }
            else
            {
                lblNoExiste.Text = "No hay Tareas Pendientes";
            }

            if (Request.Params["nrocuadrilla"] != null && Session["idotp"] != null)
            {
                foreach (GridViewRow row in gvTareasPlanificadas.Rows)
                {
                    Label idtarea = (Label)row.FindControl("lblIdTareaPlanificada");
                    if (idtarea.Text == Session["idotp"].ToString())
                    {
                        RadioButton rdbSeleccionado = (RadioButton)row.FindControl("gvTareasPlanificadas_rdbSeleccionado");
                        rdbSeleccionado.Checked = true;
                        sdsDetalleCuadrilla.SelectParameters["nroCuadrilla"].DefaultValue = Request.Params["nrocuadrilla"].ToString();
                        ViewState["idtareaplanificada"] = ((Label)row.FindControl("lblIdTareaPlanificada")).Text;
                        ViewState["fechainicio"] = ((Label)row.FindControl("lblFechaInicio")).Text;
                        ViewState["fechafin"] = ((Label)row.FindControl("lblFechaFin")).Text;
                        ViewState["duracion"] = ((Label)row.FindControl("lblDuracion")).Text;
                        sdsDetalleCuadrilla.Select(DataSourceSelectArguments.Empty);
                    }
                }
            }
        }
    }
    protected void btnAsignarCuadrilla_Click(object sender, EventArgs e)
    {
        String descripcion=null;
        String fechaInicio = null;
        String fechaFin = null;

        foreach (GridViewRow row in gvTareasPlanificadas.Rows)
        {
            RadioButton rdbSeleccionado = (RadioButton)row.FindControl("gvTareasPlanificadas_rdbSeleccionado");
            if (rdbSeleccionado.Checked)
            {
                Label asunto = (Label)row.FindControl("lblAsunto");
                descripcion = asunto.Text;
                Label inicio = (Label)row.FindControl("lblFechaInicio");
                fechaInicio = inicio.Text;
                Label fin = (Label)row.FindControl("lblFechaFin");
                fechaFin = fin.Text;
                Session["idotp"] = ((Label)row.FindControl("lblIdTareaPlanificada")).Text; 
                break;
            }
        }

        Response.Redirect("/Cooperativa/MPreventivo/AsignarCuadrillaAOTP.aspx?descripcion="+descripcion+"&fechainicio="+fechaInicio+"&fechafin="+fechaFin);
    }
    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        OrdenTrabajoPreventivo otp = new OrdenTrabajoPreventivo();
        try
        {
            
            otp.IdOTP = Datos.getOTP().obtenerUltimoNroOTP();
            otp.IdTareaPlanificada = Convert.ToInt32(ViewState["idtareaplanificada"].ToString());
            otp.IdCuadrilla = Convert.ToInt32(Request.Params["nrocuadrilla"].ToString());
            otp.IdEstado = 1;
            otp.Idtipo = 1;
            otp.FechaInicio = Convert.ToDateTime(ViewState["fechainicio"].ToString());
            otp.FechaFin = Convert.ToDateTime(ViewState["fechafin"].ToString());
            otp.Duracion = ViewState["duracion"].ToString();
            otp.Asunto = "Finalizado Con exito";
        }
        catch 
        {
            lblMensaje.Text = "Faltan datos por completar.";
            Label6.Text = "Ha Ocurrido un error";
        }

        if (Datos.getOTP().insertarOrdenTrabajoPreventivo(otp) > 0)
        {
            Datos.getTareasPlanificadas().actualizarTarea(otp.IdTareaPlanificada.ToString());
            Datos.commit();
            lblMensaje.Text = "";
            Label6.Text = "Se ha generado la Orden de Trabajo";
        }

        ModalPopupExito.Show();

    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Datos.rollback();
        Response.Redirect("/Cooperativa/InicioJefes.aspx", true);
    }
    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/InicioJefes.aspx", true);
    }
}
