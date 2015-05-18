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


public partial class MCorrectivoSesion_ModificarGrupoGuardiaReclamo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void GridView1_rdbSeleccionar_CheckedChanged(object sender, EventArgs e)
    {
        DateTime fechaIni;
        DateTime fechaFin;

        foreach (GridViewRow row in this.GridView1.Rows)
        {
            RadioButton GridView1_rdbSeleccionar = (RadioButton)row.FindControl("GridView1_rdbSeleccionar");
            if (GridView1_rdbSeleccionar.Checked)
            {

                fechaIni = Convert.ToDateTime(row.Cells[1].Text);
                fechaFin = Convert.ToDateTime(row.Cells[2].Text);
                ViewState["fechaInicio"] = fechaIni;
                ViewState["fechaFin"] = fechaFin;

            }

        }
        this.Label3.Visible = true;
       List<Empleado> listado;
        listado = Datos.getGrupoGuardiaReclamo().getEmpleadoXGrupo(Convert.ToInt32(this.ddlGrupo.SelectedValue));
        if (listado.Count > 0)
        {
            this.gvEmpleadosGrupo.DataSource = listado;
            this.gvEmpleadosGrupo.DataBind();
            this.LblMensajeGrupoGR.Text = "";
        }
        else 
        {
            this.LblMensajeGrupoGR.Text = "No existen empleados para el grupo seleccionado";
        }
            
         
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    { }

   
    protected void gvGuardiasSuplentes_rdbSeleccionar_CheckedChanged(object sender, EventArgs e)
    {
        int legajo;
        DateTime fechaInicioGRS;
        DateTime fechaFinGRS;
        String apellidoSuplente;

        foreach (GridViewRow row in this.gvGuardiasSuplentes.Rows)
        {
            RadioButton gvGuardiasSuplentes_rdbSeleccionar = (RadioButton)row.FindControl("gvGuardiasSuplentes_rdbSeleccionar");
            if (gvGuardiasSuplentes_rdbSeleccionar.Checked)
            {

                legajo = Convert.ToInt32(row.Cells[1].Text);
                apellidoSuplente = row.Cells[2].Text;
                fechaInicioGRS = Convert.ToDateTime(row.Cells[4].Text);
                fechaFinGRS = Convert.ToDateTime(row.Cells[5].Text);

                ViewState["legajoSuplente"] = legajo;
                ViewState["fechaInicioGRS"] = fechaInicioGRS;
                ViewState["fechaFinGRS"] = fechaFinGRS;
                ViewState["apellidoSuplente"] = apellidoSuplente;

            }
        }
    }
    protected void gvEmpleadosGrupo_rdbSeleccionar_CheckedChanged(object sender, EventArgs e)
    {
        int legajo;
        String apellido;

        foreach (GridViewRow row in this.gvEmpleadosGrupo.Rows)
        {
            RadioButton gvEmpleadosGrupo_rdbSeleccionar = (RadioButton)row.FindControl("gvEmpleadosGrupo_rdbSeleccionar");
            if (gvEmpleadosGrupo_rdbSeleccionar.Checked)
            {
                legajo = Convert.ToInt32(row.Cells[1].Text);
                apellido = row.Cells[2].Text;
                
                ViewState["legajoEmpleado"] = legajo;
                ViewState["apellidoEmpleado"] = apellido;
 
            }
        }
        this.lblGuardiaReclamoSumplentesDisponibles.Visible=true;
        List<HistorialEmpleado> listado;
        listado = Datos.getHistorial().getHistorialGRSuplente(Convert.ToDateTime(ViewState["fechaInicio"]), Convert.ToDateTime(ViewState["fechaFin"]));
        if (listado.Count > 0)
        {
            this.gvGuardiasSuplentes.DataSource = listado;
            this.gvGuardiasSuplentes.DataBind();
            this.lblMensajeGRSuplente.Text = "";
            this.gvGuardiasSuplentes.Visible = true;
            this.UpdatePanelCalendarios.Visible = true;
        }
        else
        {
            this.lblMensajeGRSuplente.Text = "No Existen empleados GR Suplentes para la fecha indicada";
            this.gvGuardiasSuplentes.Visible = false;
            this.UpdatePanelCalendarios.Visible = false;
        }
    }
    
    protected void btnVerEmpleadosGrupo_Click(object sender, EventArgs e)
    {
        //buscar  los empleados del historial grupo
 
    }
    protected void text_Changed(object sender, EventArgs e)
    {
        if (Convert.ToDateTime(this.DateTextBox.Text) < DateTime.Now)
        {
            this.lblMensajeFecha.Text = "La fecha de inicio no puede ser INFERIOR al día de hoy";
        }
        else
        {
            if (Convert.ToDateTime(this.DateTextBox.Text) < Convert.ToDateTime(ViewState["fechaInicio"]))
            {
                this.lblMensajeFecha.Text = "La fecha de inicio no puede ser INFERIOR al la fecha inicio de la diagramación del grupo GR";
            }
            else
            {
                this.lblMensajeFecha.Text = "";
  
            }
        }

    }
    protected void textFin_Changed(object sender, EventArgs e)
    {
        if (Convert.ToDateTime(this.DateTextBoxFin.Text) < Convert.ToDateTime(this.DateTextBox.Text))
        {
            this.lblMensajeFecha.Text = "La Fecha Fin NO puede ser INFERIOR a la fecha inicio";
        }
        else
        {
            if (Convert.ToDateTime(this.DateTextBoxFin.Text) > Convert.ToDateTime(ViewState["fechaFin"]))
            {
                this.lblMensajeFecha.Text = "La fecha fin no puede ser SUPERIOR a la  fin de la diagramación del grupo GR";
            }
            else
            {
                if (Convert.ToDateTime(this.DateTextBoxFin.Text) > Convert.ToDateTime(ViewState["fechaFinGRS"]))
                {
                    this.lblMensajeFecha.Text = "La fecha fin es SUPERIOR a la fecha fin de la diagramacion del GR Suplente";
                }
                else
                {
                    this.lblMensajeFecha.Text = "";
                   
                }

            }

        }
    }
    protected void btnAgregarDiag_Click(object sender, EventArgs e)
    {
        List<ModificacionGrupoGR> listado = new List<ModificacionGrupoGR>();
        
        if (this.gvModificaciones.Rows.Count > 0)
        {
            for (int i = 0; i < this.gvModificaciones.Rows.Count; i++)
            {
                
               listado.Add(new ModificacionGrupoGR() { FechaInicio = Convert.ToDateTime(gvModificaciones.Rows[i].Cells[0].Text), FechaFin = Convert.ToDateTime(gvModificaciones.Rows[i].Cells[1].Text), LegajoTitular = Convert.ToInt32(gvModificaciones.Rows[i].Cells[2].Text), ApellidoTitular = Convert.ToString(gvModificaciones.Rows[i].Cells[3].Text), LegajoSuplente = Convert.ToInt32(gvModificaciones.Rows[i].Cells[4].Text), ApellidoSuplente = Convert.ToString(gvModificaciones.Rows[i].Cells[5].Text) });
     
            }

        }
            ModificacionGrupoGR m1 = new ModificacionGrupoGR();
            m1.FechaInicio = Convert.ToDateTime(Convert.ToDateTime(this.DateTextBox.Text).ToString("dd/MM/yyyy"));
            m1.FechaFin = Convert.ToDateTime(this.DateTextBoxFin.Text);
            m1.LegajoTitular = Convert.ToInt32(ViewState["legajoEmpleado"]);
            m1.ApellidoTitular = Convert.ToString(ViewState["apellidoEmpleado"]);
            m1.LegajoSuplente = Convert.ToInt32(ViewState["legajoSuplente"]);
            m1.ApellidoSuplente = Convert.ToString(ViewState["apellidoSuplente"]);

            listado.Add(m1);
    
        this.gvModificaciones.DataSource = listado;
        this.gvModificaciones.DataBind();

       
    }
}
