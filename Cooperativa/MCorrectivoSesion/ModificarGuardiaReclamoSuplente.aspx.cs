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

public partial class MCorrectivoSesion_ModificarGuardiaReclamoSuplente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void GVGuardiaSuplente_rdbSeleccionar_CheckedChanged(object sender, EventArgs e)
    {
        int idEmpleado;
        
        foreach (GridViewRow row in GVGuardiaSuplente.Rows)
        {
            RadioButton GVGuardiaSuplente_rdbSeleccionar = (RadioButton)row.FindControl("GVGuardiaSuplente_rdbSeleccionar");
            if (GVGuardiaSuplente_rdbSeleccionar.Checked)
            {

                idEmpleado = Convert.ToInt32(row.Cells[1].Text);
                ViewState["idEmpleado"] = idEmpleado;

            }

        }
    }
    protected void BTNAsignar_Click(object sender, EventArgs e)
    {
        ModalPopupConfirmacion.Show();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //Boton principal CANCELAR
        ModalPopupCancelarRegistrar.Show();
    }
    protected void btnAceptarRegistrar_Click(object sender, EventArgs e)
        {
        DateTime fechaInicio;
        DateTime fechaFin;
        switch (Convert.ToInt32(this.DDLMes.SelectedValue))
        {
            case 1:
                { 
                  fechaInicio = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue),1, 1, 0,0,0);
                  fechaFin = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 1, 31, 0, 0, 0);
                  ViewState["Inicio"] = fechaInicio;
                  ViewState["Fin"] = fechaFin;
                  break;
                }
            case 2:
                {
                    fechaInicio = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 2, 1, 0, 0, 0);
                    fechaFin = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 2, 28, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 3:
                {
                    fechaInicio = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 3, 1, 0, 0, 0);
                    fechaFin = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 3, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 4:
                {
                    fechaInicio = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 4, 1, 0, 0, 0);
                    fechaFin = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 4, 30, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 5:
                {
                    fechaInicio = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 5, 1, 0, 0, 0);
                    fechaFin = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 5, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 6:
                {
                    fechaInicio = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 6, 1, 0, 0, 0);
                    fechaFin = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 6, 30, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 7:
                {
                    fechaInicio = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 7, 1, 0, 0, 0);
                    fechaFin = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 7, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 8:
                {
                    fechaInicio = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 8, 1, 0, 0, 0);
                    fechaFin = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 8, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 9:
                {
                    fechaInicio = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 9, 1, 0, 0, 0);
                    fechaFin = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 9, 30, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 10:
                {
                    fechaInicio = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 10, 1, 0, 0, 0);
                    fechaFin = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 10, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 11:
                {
                    fechaInicio = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 11, 1, 0, 0, 0);
                    fechaFin = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 11, 30, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 12:
                {
                    fechaInicio = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 12, 1, 0, 0, 0);
                    fechaFin = new DateTime(Convert.ToInt32(this.DDLAño.SelectedValue), 12, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
        }
        int idEmpleado;
        foreach (GridViewRow row in GVGuardiaSuplente.Rows)
        {
            RadioButton GVGuardiaSuplente_rdbSeleccionar = (RadioButton)row.FindControl("GVGuardiaSuplente_rdbSeleccionar");
            if (GVGuardiaSuplente_rdbSeleccionar.Checked)
            {

                idEmpleado = Convert.ToInt32(row.Cells[1].Text);
                ViewState["idEmpleado"] = idEmpleado;

            }

        }

        int fila = Datos.getGrupoGuardiaReclamo().crearHistorialEmpleadoGRSuplente(Convert.ToInt32(ViewState["idEmpleado"]), Convert.ToDateTime(ViewState["Inicio"]), Convert.ToDateTime(ViewState["Fin"]));
        ModalPopupConfirmacion.Hide();
        ModalPopupExito.Show();
    }
     protected void btnCancelarRegistrar_Click(object sender, EventArgs e)
    {
         //cANCELAR DEL BOTON PRINCIPAL GUARDAR
        ModalPopupConfirmacion.Hide();
    }
    protected void btnAceptarCancelacion_Click(object sender, EventArgs e)
    {
        //ACEPTAR DEL BOTON PRINCIPAL CANCELAR
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }
     protected void btnCancelarCancelacion_Click(object sender, EventArgs e)
    {
         //CANCELAR DEL CANCELAR
        ModalPopupCancelarRegistrar.Hide();
    }
     protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
         //EXITO
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }









     protected void DDLMes_SelectedIndexChanged(object sender, EventArgs e)
     {   
         GVGuardiaSuplente.Visible = false;
         if (this.DDLMes.SelectedValue == "Seleccionar")
         {
             this.lblMensajeMes.Text = "Debe seleccionar un mes";
             this.DDLAño.Enabled = false;
             this.DDLAño.SelectedValue = "Seleccionar";

             
         }
         else
         {
             this.lblMensajeMes.Text = "";
             this.DDLAño.Enabled = true;
         }
         

     }
     protected void DDLAño_SelectedIndexChanged(object sender, EventArgs e)
     {
         this.GVGuardiaSuplente.Visible = false;
         if (this.DDLAño.SelectedValue == "Seleccionar")
         {

             this.lblMesnajeAño.Text = "Debe seleccionar un año";
             this.DDLAño.Enabled = true;
         }
         else
         {
             this.lblMesnajeAño.Text = "";
             this.DDLAño.Enabled = true;

             int fila = Datos.getGrupoGuardiaReclamo().existeEmpleadosParaGrupo(Convert.ToInt32(this.DDLMes.SelectedValue), Convert.ToInt32(this.DDLAño.SelectedValue));
             if (fila == 0)
             {
                 this.lblMensaje.Text = "No existen empleados disponibles para el mes y año seleccionado";
                 this.GVGuardiaSuplente.Visible = false;

             }
             else
             {
                 this.lblMensaje.Text = "";
                 this.GVGuardiaSuplente.Visible = true;
                 this.BTNAsignar.Enabled = true;
             }
         }
     }
}
