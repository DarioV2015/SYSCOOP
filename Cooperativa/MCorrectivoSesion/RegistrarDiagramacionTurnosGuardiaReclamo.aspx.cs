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

public partial class MCorrectivoSesion_RegistrarDiagramacionTurnosGuardiaReclamo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       /* List<HistorialGrupoGR> listado;
        listado = Datos.getHistorial().getHistorial();
        if (listado.Count > 0)
        {
            this.GVHistorial.DataSource = listado;
            this.GVHistorial.DataBind();
        }*/

    }


    protected void BTNFechaIncio_Click(object sender, EventArgs e)
    {
        this.CalendarFechaInicio.Visible = true;

    }
    protected void CalendarFechaInicio_SelectionChanged(object sender, EventArgs e)
    {
        this.txtFechaInicio.Text = Convert.ToString(this.CalendarFechaInicio.SelectedDate.Date);
        this.CalendarFechaInicio.Visible = false;
    }
    protected void BTNFechaFin_Click(object sender, EventArgs e)
    {
        this.CalendarFechaFin.Visible = true;
    }
    protected void CalendarFechaFin_SelectionChanged(object sender, EventArgs e)
    {
        this.txtFechaFin.Text = Convert.ToString(this.CalendarFechaFin.SelectedDate.Date);
        this.CalendarFechaFin.Visible = false;
        int fila = Datos.getGrupoGuardiaReclamo().existeEmpleadosParaGrupo(Convert.ToDateTime(this.txtFechaFin.Text), Convert.ToDateTime(this.txtFechaFin.Text));
        if (fila == 0)
        {
            this.lblMensajeEmpleadoDisponibles.Text = "No Existem empleados disponibles para el período inidicado";
        }
        else
        {
            this.lblMensajeEmpleadoDisponibles.Text = "";
        }
    }
    protected void BTNGuardar_Click(object sender, EventArgs e)
    {
     ModalPopupConfirmacion.Show(); 
           
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<HistorialGrupoGR> listado;
        listado = Datos.getHistorial().getHistorialXfecha(Convert.ToInt32(this.ddlMes.SelectedValue), Convert.ToInt32(this.DropDownList2.SelectedValue));
        if (listado.Count > 0)
        {
            this.lblHistorial.Text = "";
        }
        else
        {
            this.lblHistorial.Text = "No Existen diagramaciones para el mes y año seleccionado";

        }
    }
    protected void DDLGrupo_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<HistorialGrupoGR> listado;
        listado = Datos.getHistorial().getHistorialXGrupo(Convert.ToInt32(this.DDLGrupo.SelectedValue));
        if (listado.Count > 0)
        {
            this.lblHistorial.Text = "";
        }
        else
        {
            this.lblHistorial.Text = "No Existen diagramaciones para grupo GR seleccionado";

        }
      }
      protected void ddlMes_SelectedIndexChanged(object sender, EventArgs e)
      {
          List<HistorialGrupoGR> listado;
          listado = Datos.getHistorial().getHistorialXfecha(Convert.ToInt32(this.ddlMes.SelectedValue), Convert.ToInt32(this.DropDownList2.SelectedValue));
          if (listado.Count > 0)
          {
              this.lblHistorial.Text = "";
          }
          else
          {
              this.lblHistorial.Text = "No Existen diagramaciones para el mes y año seleccionado";

          }
      }
      protected void DDLTurnoHistorial_SelectedIndexChanged(object sender, EventArgs e)
      {
          List<HistorialGrupoGR> listado;
          listado = Datos.getHistorial().getHistorialXTurno(Convert.ToInt32(this.DDLTurnoHistorial.SelectedValue));
          if (listado.Count > 0)
          {
              this.lblHistorial.Text = "";
          }
          else
          {
              this.lblHistorial.Text = "No Existen diagramaciones para el turno seleccionado";

          }
    }
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        this.ddlMes.Enabled = true;
        this.DropDownList2.Enabled = true;
        this.DDLTurnoHistorial.Enabled = false;
        this.DDLGrupo.Enabled = false;
        this.GVHistorial.Visible = true;
        this.GVHistorialXGrupo.Visible = false;
        this.GVHistorialXTurno.Visible = false;
        List<HistorialGrupoGR> listado;
        listado = Datos.getHistorial().getHistorialXfecha(Convert.ToInt32(this.ddlMes.SelectedValue), Convert.ToInt32(this.DropDownList2.SelectedValue));
        if (listado.Count > 0)
        {
            this.lblHistorial.Text = "";
        }
        else
        {
            this.lblHistorial.Text = "No Existen diagramaciones para el mes y año seleccionado";

        }

        
    }
    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
        this.ddlMes.Enabled = false;
        this.DDLTurnoHistorial.Enabled = false;
        this.DDLGrupo.Enabled = true;
        this.GVHistorial.Visible = false;
        this.GVHistorialXGrupo.Visible = true;
        this.GVHistorialXTurno.Visible = false;
        List<HistorialGrupoGR> listado;
        listado = Datos.getHistorial().getHistorialXGrupo(Convert.ToInt32(this.DDLGrupo.SelectedValue));
        if (listado.Count > 0)
        {
            this.lblHistorial.Text = "";
        }
        else
        {
            this.lblHistorial.Text = "No Existen diagramaciones para grupo GR seleccionado";

        }
    }
    protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
    {
        this.ddlMes.Enabled = false;
        this.DDLTurnoHistorial.Enabled = true;
        this.DDLGrupo.Enabled = false;
        this.GVHistorial.Visible = false;
        this.GVHistorialXGrupo.Visible = false;
        this.GVHistorialXTurno.Visible = true;
        List<HistorialGrupoGR> listado;
        listado = Datos.getHistorial().getHistorialXTurno(Convert.ToInt32(this.DDLTurnoHistorial.SelectedValue));
        if (listado.Count > 0)
        {
            this.lblHistorial.Text = "";
        }
        else
        {
            this.lblHistorial.Text = "No Existen diagramaciones para el turno seleccionado";

        }
    }

    protected void BTNCanelar_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Show();
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
    protected void btnAceptarRegistrar_Click(object sender, EventArgs e)
    {
        DateTime fechaInicio = DateTime.Parse(this.txtFechaInicio.Text);
        DateTime fechaFin = DateTime.Parse(this.txtFechaFin.Text);
        int idTurno = Convert.ToInt32(this.DDLTurno.SelectedValue);

        int[] v = new int[2];
        int j = 0;

        for (int i = 0; i < this.GVEmpleados.Rows.Count; i++)
        {
            if (j > 2)
                break;

            v[j] = Convert.ToInt32(GVEmpleados.Rows[i].Cells[1].Text);
            j++;
            CheckBox CheckBox1 = GVEmpleados.Rows[i].Cells[0].Controls[1] as CheckBox;
            if (CheckBox1.Checked == true)
            {
                v[j] = Convert.ToInt32(GVEmpleados.Rows[i].Cells[1].Text);
                j++;
            }
        }
        int lejago1 = v[0];
        int lejago2 = v[1];

        int idGrupoExiste = Datos.getGrupoGuardiaReclamo().buscarIdGrupoXEmpleados(v[0], v[1]);
        if (idGrupoExiste != 0)
        {
            int historial = Datos.getGrupoGuardiaReclamo().crearHistorialGrupo(idGrupoExiste, fechaInicio, fechaFin, idTurno);
        }
        else 
        {
            int idgrupoNuevo = Datos.getGrupoGuardiaReclamo().obtenerUltimoNroGrupoGR();
            int filaGrupo = Datos.getGrupoGuardiaReclamo().crearGrupoGR(idgrupoNuevo);
            int turnoxgrupo = Datos.getGrupoGuardiaReclamo().crearGrupoXTurno(idgrupoNuevo, idTurno);
            int filaEmpleado1 = Datos.getGrupoGuardiaReclamo().crearEmpleadoXGrupo(idgrupoNuevo, v[0]);
            int filaEmpleado2 = Datos.getGrupoGuardiaReclamo().crearEmpleadoXGrupo(idgrupoNuevo, v[1]);
            int historial = Datos.getGrupoGuardiaReclamo().crearHistorialGrupo(idgrupoNuevo, fechaInicio, fechaFin, idTurno);
        }

        Datos.commit();

        ModalPopupConfirmacion.Hide();
        ModalPopupExito.Show();
    }
    protected void btnCancelarRegistrar_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }




}
