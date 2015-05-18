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
using CrystalDecisions.Shared;
using CrystalDecisions;
using CrystalDecisions.CrystalReports.Engine;
using System.Data.SqlClient;
using System.Collections.Generic;

public partial class Reportes_ReportesReclamos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            List<Zona> listaZonas = Datos.getZonas().listasZonas();
            ddlZona.DataSource = listaZonas;
            ddlZona.DataBind();

            ddlZona.Items.Insert(0, new ListItem("Seleccionar...", "0"));

            List<Zona> listaZonasPre = Datos.getZonas().listasZonas();
            ddlZonaPreventivo.DataSource = listaZonasPre;
            ddlZonaPreventivo.DataBind();

            ddlZonaPreventivo.Items.Insert(0, new ListItem("Seleccionar...", "0"));


            List<TipoReclamoTipico> listaTipoReclamo = Datos.getTipoReclamo().listasTipoReclamo();
            ddlTipoReclamo.DataSource = listaTipoReclamo;
            ddlTipoReclamo.DataBind();

            ddlTipoReclamo.Items.Insert(0, new ListItem("Seleccionar...", "0"));

            ddlZona1.DataSource = listaZonas;
            ddlZona1.DataBind();
            ddlZona1.Items.Insert(0, new ListItem("Seleccionar...", "0"));

            ddlZonaConsumo.DataSource = listaZonas;
            ddlZonaConsumo.DataBind();
            ddlZonaConsumo.Items.Insert(0, new ListItem("Seleccionar...", "0"));



        }
        
        /*ddlZonaPreventivo.DataSource = listaZona;
        ddlZonaPreventivo.DataTextField = "Descripcion";
        ddlZonaPreventivo.DataValueField = "IdZona";
        ddlZonaPreventivo.Items.Insert(0, new ListItem("Seleccionar...", string.Empty));
        ddlZonaPreventivo.DataBind();*/
    }
    protected void btnVerReporte_Click(object sender, EventArgs e)
    {
        if (rdReporteReclamos.Checked)
        {

            CrystalReportViewer1.Visible = true;
            string idSocio = this.txtNroSocio.Text;
           

            ReportDocument crystalReport = new ReportDocument();

            crystalReport.Load(Server.MapPath("~/Reportes/CrystalReport4.rpt"));
            
            String Query;

            Query = "SELECT DISTINCT R.IDRECLAMO , R.DESCRIPCION as 'RECLAMOS', R.FECHA, MONTH(R.FECHA) AS 'MES', " +
           " R.IDORDENTRABAJOCORRECTIVO, R.IDSOCIO, P.APELLIDO, P.NOMBRE as 'NOMBREPERSONA', S.CUIT," +
           " Z.DESCRIPCION as 'ZONAS', C.NOMBRE as 'CALLES', D.NROCALLE " +
        " FROM RECLAMO R, PERSONA P, ORDENTRABAJOCORRECTIVO OTC, SOCIO S, EMPRESA E, ZONA Z, DOMICILIO D, CALLE C " +
        " WHERE (R.IDORDENTRABAJOCORRECTIVO = OTC.IDORDENTRABAJO OR R.IDORDENTRABAJOCORRECTIVO IS NULL) " +
        " AND (R.IDSOCIO = S.IDSOCIO) " +
        " AND (R.NRODOCUMENTO = P.NRODOCUMENTO OR S.NRODOCUMENTO = P.NRODOCUMENTO ) " +
        " AND (R.IDTIPODOCUMENTO = P.TIPODOCUMENTO OR S.IDTIPODOCUMENTO = P.TIPODOCUMENTO) " +
        " AND (R.IDDOMICILIO = D.IDDOMICILIO) " +
        " AND (D.IDZONA = Z.IDZONA) " +
        " AND (D.IDCALLE = C.IDCALLE) ";

            if (Convert.ToInt32(ddlZona.SelectedValue) > 0)//ahi va el parametro metido por txt desp...
            {
                int zona = Convert.ToInt32(ddlZona.SelectedValue);
                Query += " AND (Z.IDZONA= " + zona + ")";
            }
            
            if (idSocio != "")
            {
                int socios = Convert.ToInt32(idSocio);
                Query += " AND (R.IDSOCIO= " + socios + ")";
            }
          
            if (Convert.ToInt32(ddlTipoReclamo.SelectedValue) > 0)
            {
                int idTipoReclamo = Convert.ToInt32(this.ddlTipoReclamo.SelectedValue);
                Query += " AND (R.IDTIPORECLAMO= " + idTipoReclamo + ")";
               
            }

            

            DataSetReclamo2 dsCustomers = GetData(Query);

            crystalReport.SetDataSource(dsCustomers);
            CrystalReportViewer1.ReportSource = crystalReport;
            CrystalReportViewer1.RefreshReport();
        }
        if (rbReportePreventivo.Checked)
        {

                CrystalReportViewer1.Visible = true;
                
                ReportDocument crystalReport2 = new ReportDocument();

                crystalReport2.Load(Server.MapPath("~/Reportes/CrystalReportPREVENTIVO.rpt"));

                String Query1;

                Query1 = "SELECT OTP.IDORDENTRABAJOP, OTP.FECHAINICIO, OTP.FECHAFIN, OTP.DESCRIPCION AS 'OTP', TG.NOMBRE AS 'TAREAGENERAL', TG.DESCRIPCION AS 'DESCRIPTAREA', Z.DESCRIPCION AS 'ZONA' " +
                        "FROM ORDENTRABAJOPREVENTIVO OTP, TAREAPLANIFICADA TP, TAREAGENERAL TG, ZONA Z " +
                        "WHERE OTP.IDTAREAPLANIFICADA = TP.IDTAREAPLANIFICADA " +
                        "AND TP.IDTAREAGENERAL = TG.IDTAREAGENERAL " +
                        "AND (TP.IDZONA = Z.IDZONA) " ;

                if (Convert.ToInt32(ddlZonaPreventivo.SelectedValue) > 0)//ahi va el parametro metido por txt desp...
                {
                    int zona = Convert.ToInt32(this.ddlZonaPreventivo.SelectedValue);
                    Query1 += " AND (Z.IDZONA= " + zona + ")";
                }

                DataSetPREVENTIVO dsCustomers1 = GetDataPreventivo(Query1);
         

                crystalReport2.SetDataSource(dsCustomers1);
                CrystalReportViewer1.ReportSource = crystalReport2;
                CrystalReportViewer1.RefreshReport();
        }
        if (rdReporteConsumo.Checked) 
        {

            CrystalReportViewer1.Visible = true;

            ReportDocument crystalReport3 = new ReportDocument();

            crystalReport3.Load(Server.MapPath("~/Reportes/CrystalReportCONSUMO.rpt"));

            String Query1;

            Query1 = "SELECT CO.FECHAMEDICION, CO.LECTURACONSUMO, CO.MEDIDOR, M.IDSOCIO, P.APELLIDO, P.NOMBRE, CA.NOMBRE AS 'CALLE', D.NROCALLE, CO.CONSUMO, Z.DESCRIPCION AS 'ZONAS' " +
                        "FROM CONSUMO CO, SOCIO S, MEDIDOR M, PERSONA P, DOMICILIO D, CALLE CA, ZONA Z "+
                        "WHERE CO.MEDIDOR=M.IDMEDIDOR "+
                        "AND M.IDSOCIO = S.IDSOCIO "+
                        "AND S.IDTIPODOCUMENTO = P.TIPODOCUMENTO "+
                        "AND S.NRODOCUMENTO = P.NRODOCUMENTO "+
                        "AND M.IDDOMICILIO=D.IDDOMICILIO "+
                        "AND D.IDZONA = Z.IDZONA "+
                        "AND D.IDCALLE = CA.IDCALLE "+
                        "AND M.IDESTADOMEDIDOR = 3";
                        
                        
                  
            if (txtNroSocioConsumo.Text !="")
            {
                int nroSocio = Convert.ToInt32(txtNroSocioConsumo.Text);
                Query1 += " AND (M.IDSOCIO = " + nroSocio + ")";
            }
            if(Convert.ToInt16(ddlMes.SelectedValue)>0)
            {
                int mes = Convert.ToInt16(ddlMes.SelectedValue);
                Query1 += " AND (MONTH(CO.FECHAMEDICION)= "+mes+")";
            }
            if(Convert.ToInt16(ddlAño.SelectedValue)>0)
            {
                int año = Convert.ToInt16(ddlAño.SelectedValue);
                Query1 += " AND (YEAR(CO.FECHAMEDICION)= "+año+")";
            }
            if (Convert.ToInt16(ddlZonaConsumo.SelectedValue) > 0)
            {
                int zona = Convert.ToInt16(ddlZonaConsumo.SelectedValue);
                Query1 += " AND (D.IDZONA = " + zona + ")";
            }

            DataSetCONSUMO dsCustomers1 = GetDataConsumo(Query1);


            crystalReport3.SetDataSource(dsCustomers1);
            CrystalReportViewer1.ReportSource = crystalReport3;
            CrystalReportViewer1.RefreshReport();
               
        }
        if (rdReporteRYP.Checked)
        {
            CrystalReportViewer1.Visible = true;

            ReportDocument ReporteReclamos = new ReportDocument();
            ReportDocument ReportePreventivo = new ReportDocument();

            ReporteReclamos.Load(Server.MapPath("~/Reportes/ReporteReclamosYPreventivo.rpt"));
           
            String QueryReclamo;
            String QueryPrevenitivo;

            QueryReclamo = "SELECT DISTINCT R.IDRECLAMO , R.DESCRIPCION as 'RECLAMOS', R.FECHA, "+
                        "R.IDORDENTRABAJOCORRECTIVO, R.IDSOCIO, P.APELLIDO, P.NOMBRE as 'NOMBREPERSONA', S.CUIT,  "+
                        "Z.DESCRIPCION as 'ZONAS', C.NOMBRE as 'CALLES', D.NROCALLE  "+
                        "FROM RECLAMO R, PERSONA P, ORDENTRABAJOCORRECTIVO OTC, SOCIO S, EMPRESA E, ZONA Z, DOMICILIO D, CALLE C  "+
                        "WHERE (R.IDORDENTRABAJOCORRECTIVO = OTC.IDORDENTRABAJO OR R.IDORDENTRABAJOCORRECTIVO IS NULL)  "+
                        "AND (R.IDSOCIO = S.IDSOCIO)  "+
                        "AND (R.NRODOCUMENTO = P.NRODOCUMENTO OR S.NRODOCUMENTO = P.NRODOCUMENTO )  "+
                        "AND (R.IDTIPODOCUMENTO = P.TIPODOCUMENTO OR S.IDTIPODOCUMENTO = P.TIPODOCUMENTO)  "+
                        "AND (R.IDDOMICILIO = D.IDDOMICILIO)  "+
                        "AND (D.IDZONA = Z.IDZONA) "+
                        "AND (D.IDCALLE = C.IDCALLE)";
                        
                       
            QueryPrevenitivo = "SELECT OTP.IDORDENTRABAJOP, OTP.FECHAINICIO, OTP.FECHAFIN, OTP.DESCRIPCION AS 'OTP', TG.NOMBRE AS 'TAREAGENERAL', TG.DESCRIPCION AS 'DESCRIPTAREA', Z.DESCRIPCION AS 'ZONA' " +
                        "FROM ORDENTRABAJOPREVENTIVO OTP, TAREAPLANIFICADA TP, TAREAGENERAL TG, ZONA Z " +
                        "WHERE OTP.IDTAREAPLANIFICADA = TP.IDTAREAPLANIFICADA  " +
                        "AND TP.IDTAREAGENERAL = TG.IDTAREAGENERAL  " +
                        "AND (TP.IDZONA = Z.IDZONA) ";
                       



            if (Convert.ToInt32(ddlZona1.SelectedValue) > 0)
            {
                int zona = Convert.ToInt32(ddlZona1.SelectedValue);
                QueryReclamo += " AND (Z.IDZONA= " + zona + ")";
                QueryPrevenitivo += " AND (TP.IDZONA= " + zona + ")";
            }
            if (Convert.ToInt16(ddlMes1.SelectedValue) > 0)
            {
                int mes = Convert.ToInt16(ddlMes1.SelectedValue);
                QueryReclamo += " AND (MONTH(R.FECHA) = " + mes + ")";
                QueryPrevenitivo += " AND (MONTH(OTP.FECHAINICIO)= " + mes + ")";
            }
            if (Convert.ToInt16(ddlAño1.SelectedValue) > 0)
            {
                int año = Convert.ToInt16(ddlAño1.SelectedValue);
                QueryReclamo += " AND (YEAR(R.FECHA)= " + año + ")";
                QueryPrevenitivo += " AND (YEAR(OTP.FECHAINICIO)= " + año + ")";
            }

            DataSetReclamo2 dsCustomersReclamo = GetData(QueryReclamo);
            ReporteReclamos.SetDataSource(dsCustomersReclamo);
            DataSetPREVENTIVO dsCustomersPreventivo = GetDataPreventivo(QueryPrevenitivo);
            ReporteReclamos.Subreports["SubReportePreventivo.rpt"].SetDataSource(dsCustomersPreventivo);
            CrystalReportViewer1.ReportSource = ReporteReclamos;

            CrystalReportViewer1.RefreshReport();

          }
   
        
    }



    private DataSetReclamo2 GetData(string query)
    {
        string conString = ConfigurationManager.ConnectionStrings["LOCAL"].ConnectionString;
        SqlCommand cmd = new SqlCommand(query);
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;

                sda.SelectCommand = cmd;
                using (DataSetReclamo2 dsCustomers = new DataSetReclamo2())
                {
                    sda.Fill(dsCustomers, "DataTableRECLAMOSSS");
                    return dsCustomers;
                }
            }
        }
    }

    private DataSetPREVENTIVO GetDataPreventivo(string query)
    {
        string conString = ConfigurationManager.ConnectionStrings["LOCAL"].ConnectionString;
        SqlCommand cmd = new SqlCommand(query);
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;

                sda.SelectCommand = cmd;
                using (DataSetPREVENTIVO dsCustomers = new DataSetPREVENTIVO())
                {
                    sda.Fill(dsCustomers, "DataTablePREVENTIVO");
                    return dsCustomers;
                }
            }
        }
    }

    private DataSetCONSUMO GetDataConsumo(string query)
    {
        string conString = ConfigurationManager.ConnectionStrings["LOCAL"].ConnectionString;
        SqlCommand cmd = new SqlCommand(query);
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;

                sda.SelectCommand = cmd;
                using (DataSetCONSUMO dsCustomers = new DataSetCONSUMO())
                {
                    sda.Fill(dsCustomers, "DataTableCONSUMOS");
                    return dsCustomers;
                }
            }
        }
    }
    /*private DataSetRECLAMOSYMANTENIMIENTO GetDataReclamosYPreventivo(string queryReclamo, string queryPreventivo)
    {
        string conString = ConfigurationManager.ConnectionStrings["LOCAL"].ConnectionString;
        
        SqlCommand cmdReclamo = new SqlCommand(queryReclamo);
        SqlCommand cmdPreventivo = new SqlCommand(queryPreventivo);

        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlDataAdapter sda1 = new SqlDataAdapter())
            {
                cmdReclamo.Connection = con;

                sda1.SelectCommand = cmdReclamo;
                using (DataSetRECLAMOSYMANTENIMIENTO dsCustomers = new DataSetRECLAMOSYMANTENIMIENTO())
                {
                    sda1.Fill(dsCustomers, "RECLAMOS");
                    return dsCustomers;
                }
            }
            using (SqlDataAdapter sda2 = new SqlDataAdapter())
            {
                cmdPreventivo.Connection = con;

                sda2.SelectCommand = cmdReclamo;
                using (DataSetRECLAMOSYMANTENIMIENTO dsCustomers = new DataSetRECLAMOSYMANTENIMIENTO())
                {
                    sda2.Fill(dsCustomers, "PREVENTIVO");
                    return dsCustomers;
                }
            }
        }
    }*/
    protected void rdReporteReclamos_CheckedChanged(object sender, EventArgs e)
    {
        this.btnVerReporte.Visible = true;
        this.PanelReclamos.Visible = true;
        this.PanelConsumo.Visible = false;
        this.PanelPreventivo.Visible = false;
        this.PanelRYM.Visible = false;
        CrystalReportViewer1.Visible = false;
        
    }
    protected void rbReportePreventivo_CheckedChanged(object sender, EventArgs e)
    {
        this.btnVerReporte.Visible = true;
        this.PanelReclamos.Visible = false;
        this.PanelConsumo.Visible = false;
        this.PanelPreventivo.Visible = true;
        this.PanelRYM.Visible = false;
        CrystalReportViewer1.Visible = false;
    }
    protected void rdReporteConsumo_CheckedChanged(object sender, EventArgs e)
    {
        this.btnVerReporte.Visible = true;
        this.PanelReclamos.Visible = false;
        this.PanelConsumo.Visible = true;
        this.PanelPreventivo.Visible = false;
        this.PanelRYM.Visible = false;
        CrystalReportViewer1.Visible = false;
    }
    protected void rdReporteRYP_CheckedChanged(object sender, EventArgs e)
    {
        this.btnVerReporte.Visible = true;
        this.PanelReclamos.Visible = false;
        this.PanelConsumo.Visible = false;
        this.PanelPreventivo.Visible = false;
        this.PanelRYM.Visible = true;
        CrystalReportViewer1.Visible = false;
    }
    protected void ddlZona_SelectedIndexChanged(object sender, EventArgs e)
    {
        CrystalReportViewer1.Visible = false;
    }
    protected void ddlTipoReclamo_SelectedIndexChanged(object sender, EventArgs e)
    {
        CrystalReportViewer1.Visible = false;
    }
    protected void ddlZonaPreventivo_SelectedIndexChanged(object sender, EventArgs e)
    {
        CrystalReportViewer1.Visible = false;
    }
    protected void ddlMes_SelectedIndexChanged(object sender, EventArgs e)
    {
        CrystalReportViewer1.Visible = false;
    }
    protected void ddlAño_SelectedIndexChanged(object sender, EventArgs e)
    {
        CrystalReportViewer1.Visible = false;
    }

}