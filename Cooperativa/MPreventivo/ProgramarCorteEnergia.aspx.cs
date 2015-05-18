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

public partial class MPreventivo_ProgramarCorteEnergia : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            List<Zona> listaZonas = Datos.getZonas().listasZonas();
            ddlZonas.DataSource = listaZonas;
            ddlZonas.DataBind();

            ddlZonas.Items.Insert(0, new ListItem(string.Empty, "Seleccionar"));

            for (int i = 23; i >= 0; i--)
            {
                ddlHorasInicio.Items.Insert(0, new ListItem(Convert.ToString(i), Convert.ToString(i)));
                ddlHorasFin.Items.Insert(0, new ListItem(Convert.ToString(i), Convert.ToString(i)));
            }


            //for (int i = 59; i >= 0; i--)
            //{
            //    ddlMinutosInicio.Items.Insert(0, new ListItem(Convert.ToString(i), Convert.ToString(i)));
            //    ddlMinutosFin.Items.Insert(0, new ListItem(Convert.ToString(i), Convert.ToString(i)));
            //}

            string str = "<script>loadMap();</script>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);
        }
    }
    protected void ddlZonas_SelectedIndexChanged(object sender, EventArgs e)
    {
       gvSubestaciones.DataSource = Datos.getSubestaciones().buscarSubestacionesZona(ddlZonas.SelectedValue);
       gvSubestaciones.DataBind();
       UpdatePanelSubestaciones.Visible = true;
    }
    protected void gvSubestaciones_rdbSeleccionar_CheckedChanged(object sender, EventArgs e)
    {

        //UpdatePanelMYS.Visible = true;
        //UpdatePanelMYS.Update();
        List<Linea> lineas = new List<Linea>();
        List<Medidor> medidores = new List<Medidor>();
        foreach (GridViewRow row in this.gvSubestaciones.Rows)
        {
            RadioButton gv_rdbSeleccionar = (RadioButton)row.FindControl("gvSubestaciones_rdbSeleccionar");
            if (gv_rdbSeleccionar.Checked)
            {
                lineas =  Datos.getLineas().buscarLineasSubestacion(row.Cells[1].Text);
                ViewState["subestacion"] = row.Cells[1].Text;
                foreach(Linea l in lineas)
                {
                    List<Medidor>  medAux = Datos.getMedidores().buscarMedidoresLinea(l.Idlinea);
                    foreach (Medidor m in medAux)
                    {
                        m.Socio = Datos.getSocios().traerDatosSocio(m.Idsocio);
                        medidores.Add(m);
                    }
                }
                
            }

        }

        gvSocios.DataSource = medidores;
        gvSocios.DataBind();
        panelMedidoresYSocios.Visible = true;
    }

    protected void DisabledDays_AtRender(object sender, DayRenderEventArgs e)
    {
        //if (e.Day.Date.DayOfWeek == DayOfWeek.Saturday || e.Day.Date.DayOfWeek == DayOfWeek.Sunday)
        List<CorteProgramado> cortes = Datos.getCortes().buscarCortesProgramados();

        foreach (CorteProgramado c in cortes)
        {

            if (e.Day.Date == c.Fechainicio)
            {
                e.Day.IsSelectable = false;
                e.Cell.ForeColor = System.Drawing.Color.Red;
            }
        }
    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            DateTime fi = Convert.ToDateTime(txtFechaInicio.Text);
            DateTime fechainicio = new DateTime(fi.Year,
                fi.Month,
                fi.Day,
                Convert.ToInt32(ddlHorasInicio.SelectedValue),
                0, 0);
            //Convert.ToInt32(ddlMinutosInicio.SelectedValue), 0);
            DateTime ff = Convert.ToDateTime(txtFechaFin.Text);
            DateTime fechafin = new DateTime(ff.Year,
                ff.Month,
                ff.Day,
                Convert.ToInt32(ddlHorasFin.SelectedValue), 0, 0);
            //   Convert.ToInt32(ddlMinutosFin.SelectedValue), 0);

            CorteProgramado corte = new CorteProgramado();
            corte.Fechainicio = fechainicio;
            corte.Fechafin = fechafin;
            corte.Idzona = Convert.ToInt32(ViewState["subestacion"].ToString());
            corte.Motivo = txtMotivo.Text;
            corte.Idcorte = Datos.getCortes().obtenerUltimoNroCorte();

            if (Datos.getCortes().insertarCorteProgramado(corte) > 0)
            {
                Datos.commit();
                ModalPopupExito.Show();
            }
            else
            {
            }
        }

    }
    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("../InicioJefes.aspx");
    }

   

    /*  <asp:Calendar ID="CalendarFechaIncio" runat="server" BackColor="White" BorderColor="#3366CC"
                    BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana"
                    Font-Size="8pt" ForeColor="#003399" Height="150px" OnDayRender="DisabledDays_AtRender"
                    Width="180px">
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True"
                        Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                </asp:Calendar>
     * 
     * <asp:Calendar ID="CalendarFechaFin" runat="server" BackColor="White" BorderColor="#3366CC"
                    BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana"
                    Font-Size="8pt" ForeColor="#003399" Height="150px" Width="180px">
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True"
                        Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                </asp:Calendar>
     * */
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Convert.ToDateTime(args.Value) < DateTime.Now.Date)
            {
                args.IsValid = false;
            }
    }
    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {

        if ( Convert.ToDateTime(args.Value) < DateTime.Now.Date)
            {
                args.IsValid = false;
            }
        
    }
    protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Convert.ToDateTime(args.Value) < Convert.ToDateTime(txtFechaInicio.Text))
        {
            args.IsValid = false;
        }
    }
}
