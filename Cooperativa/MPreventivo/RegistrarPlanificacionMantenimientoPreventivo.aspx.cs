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
using System.Web.Services;

public partial class MPreventivo_RegistrarPlanificacionMantenimientoPreventivo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            List<Zona> listaZonas = Datos.getZonas().listasZonas();
            ddlZonas.DataSource = listaZonas;
            ddlZonas.DataBind();

            ddlZonas.Items.Insert(0, new ListItem("Seleccionar", "Seleccionar"));

            List<Tarea> listaTarea = Datos.getTarea().buscarTareas();
            gvTareas.DataSource = listaTarea;
            gvTareas.DataBind();

            List<Prioridad> listaPrioridad = Datos.getTareasPlanificadas().buscarPrioridades();
            ddlPrioridad.DataSource = listaPrioridad;
            ddlPrioridad.DataBind();
            ddlPrioridad.Items.Insert(0, new ListItem("Seleccionar", "Seleccionar"));

           /* string str = "<script>loadMap();</script>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);*/
        }
        else 
        {
           /* string str = "<script> " +
            " ubicarZona('" + txtCalleNorte.Text + "' , '" +
             txtCalleSur.Text + "' , '" + txtCalleEste.Text + "' , '" + txtCalleOeste.Text + "'); " +
            " </script>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);*/


          
        }


        dibujarZona();
    }

    protected void ddlZonas_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<Zona> listaZonas = Datos.getZonas().listasZonas();

        foreach(Zona z in listaZonas)
        {
            if (z.Descripcion.Equals(this.ddlZonas.SelectedItem.ToString()))
            {
                this.txtCalleNorte.Text = z.CalleNorte;
                this.txtCalleSur.Text = z.CalleSur;
                this.txtCalleOeste.Text = z.CalleOeste;
                this.txtCalleEste.Text = z.CalleEste;
               // Datos.getSubestaciones().buscarSubestacionesZona(this.ddlZonas.SelectedItem.ToString());
                dibujarZona();
                break;
            }
        }

    /*    string str = "<script> "+
            " ubicarZona('" + txtCalleNorte.Text + "' , '" +
             txtCalleSur.Text + "' , '" + txtCalleEste.Text + "' , '" + txtCalleOeste.Text + "'); " +
            " </script>";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);*/

        
    }
    protected void gvTareas_rdbSeleccionado_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow row in this.gvTareas.Rows)
        {
            RadioButton gv_rdbSeleccionar = (RadioButton)row.FindControl("gvTareas_rdbSeleccionar");
            if (gv_rdbSeleccionar.Checked)
            {
                TareaPlanificada tp = Datos.getTareasPlanificadas().buscarTareaPlanificada(this.ddlZonas.SelectedValue.ToString(), row.Cells[4].Text);
                ViewState["periodicidad"] = row.Cells[3].Text;
                ViewState["idTarea"] = row.Cells[4].Text;
                if (tp != null)
                {
                    ViewState["tareaplanificada"] = tp;

                    gvActividades.DataSource = tp.Actividades;
                    gvActividades.DataBind();
                    break;
                }
            }
        }
   /*     string str = "<script> " +
            " ubicarZona('" + txtCalleNorte.Text + "' , '" +
             txtCalleSur.Text + "' , '" + txtCalleEste.Text + "' , '" + txtCalleOeste.Text + "'); " +
            " </script>";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);*/

    }

    protected void gvActividades_rdbSeleccionado_CheckedChanged(object sender, EventArgs e)
    {
        TareaPlanificada tp = (TareaPlanificada)ViewState["tareaplanificada"];

        List<Actividad> actividades = tp.Actividades;


          foreach (GridViewRow row in gvActividades.Rows)
            {
                RadioButton rdbActividad = (RadioButton)row.FindControl("gvActividades_rdbSeleccionado");
                if (rdbActividad.Checked)
                {
                     Label lblid = (Label)row.FindControl("lblActSel");
                     //ViewState["idTarea"] = lblid.Text;
                     ViewState["duracion"] = row.Cells[4].Text;
                    foreach (Actividad a in actividades)
                    {
                        if (a.IdActividad.ToString().Equals(lblid.Text))
                        {
                            List<Insumo> insumos = a.Insumos;
                            gvInsumos.DataSource = insumos;
                            gvInsumos.DataBind();
                            PanelTitulo.Visible = true;
                        }
                    }
                }
            }

         /* string str = "<script> " +
            " ubicarZona('" + txtCalleNorte.Text + "' , '" +
             txtCalleSur.Text + "' , '" + txtCalleEste.Text + "' , '" + txtCalleOeste.Text + "'); " +
            " </script>";
          Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);*/

        
    }

    protected void DisabledDays_AtRender(object sender, DayRenderEventArgs e)
    {
        //if (e.Day.Date.DayOfWeek == DayOfWeek.Saturday || e.Day.Date.DayOfWeek == DayOfWeek.Sunday)
        if (!this.ddlZonas.SelectedValue.Equals("0"))
        {
            List<TareaPlanificada> tareas = Datos.getTareasPlanificadas().buscarTareasEntreMes(this.ddlZonas.SelectedValue.ToString());

            foreach (TareaPlanificada t in tareas)
            {

                if (e.Day.Date == t.Fechainicio)
                {
                    e.Day.IsSelectable = false;
                    e.Cell.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
    protected void CalendarFechaIncio_SelectionChanged(object sender, EventArgs e)
    {
     /*   string str = "<script> " +
             " ubicarZona('" + txtCalleNorte.Text + "' , '" +
              txtCalleSur.Text + "' , '" + txtCalleEste.Text + "' , '" + txtCalleOeste.Text + "'); " +
             " </script>";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);*/

        //CalendarFechaIncio.SelectedDate.Date;
    }
    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
      DateTime fecha = Convert.ToDateTime(txtFechaInicio.Text);
      TareaPlanificada t = new TareaPlanificada();
      t.Fechainicio = fecha;
      t.Idzona = this.ddlZonas.SelectedValue;
      t.Idtareageneral = ViewState["idTarea"].ToString();
      t.Idtareaplanificada = Convert.ToString(Datos.getTareasPlanificadas().obtenerUltimoNroTareaPlanificada());
      t.Fechafin = fecha.AddDays(Convert.ToDouble(ViewState["duracion"].ToString()));
      t.FechaCreacion = DateTime.Now;
      t.Idprioridad = ddlPrioridad.SelectedValue;
      t.Tiempoestimado = 
      t.Idestado = "1";
      t.Asunto = txtDescripcion.Text;
      if (Datos.getTareasPlanificadas().insertarTareaPlanificada(t) > 0)
      {
          Datos.commit();
         // lblMensaje.Text = "Exito!";
          ModalPopupExito.Show();
      }
      else 
      {
          //lblMensaje.Text = "Ha Ocurrido un Error!";
          ModalPopupExito.Show();
      }

    /*  string str = "<script> " +
            " ubicarZona('" + txtCalleNorte.Text + "' , '" +
             txtCalleSur.Text + "' , '" + txtCalleEste.Text + "' , '" + txtCalleOeste.Text + "'); " +
            " </script>";
      Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);*/
    }

    /*
     * <asp:Calendar ID="CalendarFechaIncio" runat="server" BackColor="White" BorderColor="#3366CC"
                    BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana"
                    Font-Size="8pt" ForeColor="#003399" Height="150px" OnDayRender="DisabledDays_AtRender"
                    Width="180px" OnSelectionChanged="CalendarFechaIncio_SelectionChanged">
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True"
                        Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                </asp:Calendar>*/
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Datos.rollback();
        Response.Redirect("/Cooperativa/InicioJefes.aspx", true);
    }
    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/InicioJefes.aspx", true);
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        List<TareaPlanificada> tareas = Datos.getTareasPlanificadas().buscarTareasEntreMes(this.ddlZonas.SelectedValue.ToString());

        foreach (TareaPlanificada t in tareas)
        {
            //args.IsValid = (args.Value.Length >= 8);
            if (Convert.ToDateTime(args.Value) == t.Fechainicio || Convert.ToDateTime(args.Value) < DateTime.Now.Date)
            {
                args.IsValid = false;
            }
        }
    /*    string str = "<script> " +
            " ubicarZona('" + txtCalleNorte.Text + "' , '" +
             txtCalleSur.Text + "' , '" + txtCalleEste.Text + "' , '" + txtCalleOeste.Text + "'); " +
            " </script>";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);*/
    }

    [WebMethod]
    public static Object[] getElementosByLinea(String idlinea)
    {

        return Datos.getLineas().buscarElementosByLinea(idlinea).ToArray();
    }
    [WebMethod]
    public static Object[] buscarZona(String idzona)
{
     List<Subestacion> subs = Datos.getSubestaciones().buscarSubestacionesZona(idzona);
            List<Linea> idlineas = new List<Linea>();
            foreach(Subestacion s in subs)
            {
               List<Linea> lineas = Datos.getLineas().buscarLineasSubestacion(Convert.ToString(s.Idsubestacion));
                foreach(Linea l in lineas)
                {
                    idlineas.Add(l);
                }
            }
            return idlineas.ToArray();
}

    private void dibujarZona()
    {
        string str = "<script>  dibujar(); </script>";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);
    }
}
