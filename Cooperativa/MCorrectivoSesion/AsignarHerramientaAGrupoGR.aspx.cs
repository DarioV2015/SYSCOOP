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

public partial class MCorrectivoSesion_AsignarHerramientaAGrupoGR : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GrupoGuardiaReclamo gr = Datos.getGrupoGuardiaReclamo().existenGruposGR();
        if (Convert.ToInt32(gr.IdGrupo) == 0)
        {
            lblMensajeGruposDisponibles.Text = "No existen grupos disponibles para asignarles herramientas";
            this.DDLGrupo.Enabled = false;
            this.txtFechaInicio.Visible = false;
            this.BTNFechaInicio.Visible = false;
            this.txtFechaFin.Visible = false;
            this.BTNFechaFin.Visible = false;
            this.DDLTipoHerramienta.Visible = false;
            this.txtObservacion.Visible = false;
            this.DDLHerramienta.Visible = false;
            this.BTNAgregar.Visible = false;
            this.Label5.Visible = false;
            this.Label6.Visible = false;
            this.Label7.Visible = false;
            this.Label8.Visible = false;
            this.Label9.Visible = false;
            this.LabelObserv.Visible = false;
            
        }
        else
        {
            lblMensajeGruposDisponibles.Text = "";
            this.DDLGrupo.Enabled = true;
            this.txtFechaInicio.Visible = true;
            this.BTNFechaInicio.Visible = true;
            this.txtFechaFin.Visible = true;
            this.BTNFechaFin.Visible = true;
            this.DDLTipoHerramienta.Visible = true;
            this.txtObservacion.Visible = true;
            this.DDLHerramienta.Visible = true;
            this.BTNAgregar.Visible = true;
            this.Label5.Visible = true;
            this.Label6.Visible = true;
            this.Label7.Visible = true;
            this.Label8.Visible = true;
            this.Label9.Visible = true;
            this.LabelObserv.Visible = true;
        }

    }
    protected void GVHistorialGR_rdbSeleccionar_CheckedChanged(object sender, EventArgs e)
    {
        DateTime fechaIni;
        DateTime fechaFin;

        foreach (GridViewRow row in this.GVHistorialGR.Rows)
        {
            RadioButton GVHistorialGR_rdbSeleccionar = (RadioButton)row.FindControl("GVHistorialGR_rdbSeleccionar");
            if (GVHistorialGR_rdbSeleccionar.Checked)
            {

                fechaIni = Convert.ToDateTime(row.Cells[1].Text);
                fechaFin = Convert.ToDateTime(row.Cells[2].Text);
                ViewState["fechaInicio"] = fechaIni;
                ViewState["fechaFin"] = fechaFin;

            }

        }
    }

    protected void BTNAgregar_Click(object sender, EventArgs e)
    {

        this.BTNAsignar.Enabled = true;
            
            List<Herramienta> listado;
                if (ViewState["lista"] == null)
                    listado = new List<Herramienta>();
                else
                {
                    listado = (List<Herramienta>)ViewState["lista"];

                }

                Herramienta h = new Herramienta();

                h.NroHerramienta = Convert.ToInt32(this.DDLHerramienta.SelectedValue);
                h.Descripcion = this.DDLHerramienta.SelectedItem.ToString();

                listado.Add(h);

                ViewState["lista"] = listado;

                if (listado.Count > 0)
                {
                    this.GVHerramientasSeleccionadas.DataSource = listado;
                    this.GVHerramientasSeleccionadas.DataBind();
                }

                this.BTNAsignar.Enabled = true;
                this.BTNCancelar.Enabled = true;   
            
        
        

    }

    protected void txtFechaInicio_Leave(object sender, System.EventArgs e)
    {
        // Reset the colors and selection of the TextBox after focus is lost.
       if(Convert.ToDateTime(ViewState["fechaInicio"]) > Convert.ToDateTime(this.txtFechaInicio.Text))
       { this.LBLMensajeFechaInicio.Text = "La Fecha debe ser Mayor o Igual a la fecha Inicio"; }
    }




    protected void BTNFechaInicio_Click(object sender, EventArgs e)
    {
        this.CalendarFechaIncio.Visible = true;
    }
    protected void BTNFechaFin_Click(object sender, EventArgs e)
    {
        this.CalendarFechaFin.Visible = true;
        this.DDLHerramienta.Enabled = true;
        this.BTNAgregar.Enabled = true;

    }
    protected void CalendarFechaIncio_SelectionChanged(object sender, EventArgs e)
    {
        if (this.CalendarFechaIncio.SelectedDate.Date < Convert.ToDateTime(ViewState["fechaInicio"]))
        { 
            this.LBLMensajeFechaInicio.Text = "La fecha debe ser mayor a " + Convert.ToDateTime(ViewState["fechaInicio"]).ToString("dd/MM/yyyy");
            this.txtFechaInicio.Text = "";
                 
        }
        else
        {
            if (this.CalendarFechaIncio.SelectedDate.Date > Convert.ToDateTime(ViewState["fechaFin"]))
            {
                this.LBLMensajeFechaInicio.Text = "La fecha debe ser menos a la fecha fin " + Convert.ToDateTime(ViewState["fechaFin"]).ToString("dd/MM/yyyy");
                this.txtFechaInicio.Text = "";
            }
            else
            {
                this.txtFechaInicio.Text = Convert.ToString(this.CalendarFechaIncio.SelectedDate.Date.ToString("dd/MM/yyyy"));
                this.LBLMensajeFechaInicio.Text = "";
                this.CalendarFechaIncio.Visible=false;
                this.txtFechaFin.Enabled = true;
                this.BTNFechaFin.Enabled = true;
            }

        }
        
    }
    protected void CalendarFechaFin_SelectionChanged(object sender, EventArgs e)
    {
        if (this.CalendarFechaFin.SelectedDate.Date > Convert.ToDateTime(ViewState["fechaFin"]))
        {
            this.LBLMensajeFechaFin.Text = "La fecha debe ser menor a " + Convert.ToDateTime(ViewState["fechaFin"]).ToString("dd/MM/yyyy");
            this.txtFechaFin.Text = "";
        }
        else
        {
            if (this.CalendarFechaFin.SelectedDate.Date < Convert.ToDateTime(ViewState["fechaInicio"]))
            {
                this.LBLMensajeFechaFin.Text = "La fecha debe ser mayor a la fecha de inicio " +Convert.ToDateTime(ViewState["fechaInicio"]).ToString("dd/MM/yyyy");
                this.txtFechaFin.Text = "";
            }
            else
            {
                if (this.CalendarFechaFin.SelectedDate.Date < Convert.ToDateTime(this.txtFechaInicio.Text))
                {
                    this.LBLMensajeFechaFin.Text = "La fecha debe esta comprendida entre " + Convert.ToDateTime(this.txtFechaInicio.Text).ToString("dd/MM/yyyy") + " y " + Convert.ToDateTime(ViewState["fechaFin"]).ToString("dd/MM/yyyy");
                    this.txtFechaFin.Text = "";
                }
                else
                {
                    this.txtFechaFin.Text = Convert.ToString(this.CalendarFechaFin.SelectedDate.Date.ToString("dd/MM/yyyy"));
                        this.LBLMensajeFechaFin.Text = "";
                        this.CalendarFechaFin.Visible = false;
                }

               
            }

        }

    }
    protected void BTNAsignar_Click(object sender, EventArgs e)
    {
        ModalPopupConfirmacion.Show();
    }
    protected void BTNCancelar_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Show();
    }
    protected void btnAceptarRegistrar_Click(object sender, EventArgs e)
    {
         for (int i = 0; i < this.GVHerramientasSeleccionadas.Rows.Count; i++)
        {
            int idHerramienta = Convert.ToInt32(this.GVHerramientasSeleccionadas.Rows[i].Cells[0].Text);
            DateTime fechaInicio = Convert.ToDateTime(this.txtFechaInicio.Text);
            DateTime fechaFin = Convert.ToDateTime(this.txtFechaFin.Text);
            String observacion = this.txtObservacion.Text;
            int idGrupo = Convert.ToInt32(this.DDLGrupo.SelectedValue);
            int fila = Datos.getHerramienta().crearHistorialHerramienta(idHerramienta, fechaInicio, fechaFin, observacion, idGrupo);
             if (fila != 0)
            {
            Datos.commit();
            }
            
        }
        
      
       /*DateTime fechaInicio = Convert.ToDateTime(this.txtFechaInicio.Text);
        DateTime fechaFin = Convert.ToDateTime(this.txtFechaFin.Text);
        String observacion = this.txtObservacion.Text;
        int idGrupo = Convert.ToInt32(this.DDLGrupo.SelectedValue);

        int fila = Datos.getHerramienta().crearHistorialHerramienta(idHerramienta, fechaInicio, fechaFin, observacion, idGrupo);*/
        
       
            ModalPopupConfirmacion.Hide();
            ModalPopupExito.Show();
        
        
        
        
    }
    protected void btnCancelarRegistrar_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Hide();      
    }
    protected void btnAceptarCancelacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }
    protected void btnCancelarCancelacion_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Hide();
    }
    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }




    protected void DDLGrupo_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.CalendarFechaFin.Visible = false;
        this.CalendarFechaIncio.Visible = false;
        this.txtFechaFin.Text = "";
        this.txtFechaInicio.Text = "";
        this.txtObservacion.Text = "";
        List<Herramienta> listado = new List<Herramienta>();
        this.GVHerramientasSeleccionadas.DataSource = listado;
        this.GVHerramientasSeleccionadas.DataBind();

        int valor = Datos.getHistorial().buscarDiagramacionGrupoDisponible(Convert.ToInt32(this.DDLGrupo.SelectedValue));
        if (valor == 0)
        {
            this.lblMensajeGruposDisponibles.Text = "No existe diagramación actual para el grupo GR seleccionado";
            this.BTNFechaInicio.Enabled = false;
            this.BTNFechaFin.Enabled = false;
            this.txtFechaFin.Enabled = false;
            this.txtFechaInicio.Enabled = false;
            this.DDLHerramienta.Enabled = false;
            this.DDLTipoHerramienta.Enabled = false;
            this.BTNAgregar.Enabled = false;
            this.BTNAsignar.Enabled = false;
            
            this.txtObservacion.Enabled = false;
            
        }

        else 
        { 
            this.lblMensajeGruposDisponibles.Text = "";
            this.BTNFechaInicio.Enabled = true;
            this.BTNFechaFin.Enabled = true;
            this.txtFechaFin.Enabled = true;
            this.txtFechaInicio.Enabled = true;
            this.DDLTipoHerramienta.Enabled = true;
            this.DDLHerramienta.Enabled = true;
            this.txtObservacion.Enabled = true;
            

        }
    }
    protected void GVHerramientasSeleccionadas_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void DDLHerramienta_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void DDLTipoHerramienta_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
