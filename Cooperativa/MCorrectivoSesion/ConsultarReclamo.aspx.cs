﻿using System;
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

public partial class MCorrectivoSesion_ConsultarReclamo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DatosUsuario usr = (DatosUsuario)Session["datosUsuario"];
            if (usr != null && usr.Rol.ToUpper().Equals("SOCIO"))
            {
                sdsReclamos1.SelectParameters["socio"].DefaultValue = usr.NroSocio;

                panelBusqueda.Visible = false;
                panelReclamoSocio.Visible = true;
                panelDetalleTiempos.Visible = true;

                int nroReclamo = 0;
                float tiempoResolucion = 0;

                foreach (GridViewRow row in grillaReclamoSocio.Rows)
                {
                    nroReclamo = Convert.ToInt32(grillaReclamoSocio.Rows[row.RowIndex].Cells[0].Text);
                    tiempoResolucion = Convert.ToSingle(grillaReclamoSocio.Rows[row.RowIndex].Cells[16].Text);

                    break;
                }

                OrdenTrabajoCorrectivo otc = Datos.getOTC().buscarOTC(nroReclamo);

                DateTime horaInicioOTC = Convert.ToDateTime(otc.HoraInicio);

                DateTime horaActual = DateTime.Now;

                TimeSpan dif = horaActual - horaInicioOTC;

                float resultado = tiempoResolucion - dif.Minutes;

                DateTime horaF = Convert.ToDateTime(horaActual.AddMinutes(resultado));

                lblTiempo.Text = tiempoResolucion.ToString() + " minutos";
                lblHoraInicioOTC.Text = horaInicioOTC.ToString("HH:mm") + " hs.";
                lblHoraActual.Text = horaActual.ToString("HH:mm") + " hs.";
                lblDuracionEstimada.Text = resultado.ToString() + " minutos";
                lblHoraFinEstimada.Text = horaF.ToString("HH:mm") + " hs.";
            }
            else
            {
                panelBusqueda.Visible = true;
                panelReclamoSocio.Visible = false;

                rdb24Horas.Checked = false;
                rdbOtr.Checked = false;
                lblNroReclamo.Visible = false;
                txtNroReclamo.Visible = false;
                txtNroReclamo.Text = "";
                lblMensaje.Text = "";
                btnBuscar.Enabled = false;
            }
        }

    }
   protected void rdb24Horas_CheckedChanged(object sender, EventArgs e)
   {
       rdbOtr.Checked = false;
       panelReclamos.Visible = false;
       txtNroReclamo.Text = "";
       lblNroReclamo.Visible = false;
       txtNroReclamo.Visible = false;
       btnBuscar.Enabled = true;

       panelDetalleTiempos.Visible = false;
   }
   protected void rdbOtr_CheckedChanged(object sender, EventArgs e)
   {
       rdb24Horas.Checked = false;
       panelReclamos.Visible = false;
       lblNroReclamo.Visible = true;
       txtNroReclamo.Visible = true;
       btnBuscar.Enabled = true;
       txtNroReclamo.Focus();

       panelDetalleTiempos.Visible = false;
   }
   protected void btnBuscar_Click1(object sender, EventArgs e)
   {
       btnBuscar.Enabled = false;

       lblTiempo.Text = "";
       lblHoraInicioOTC.Text = "";
       lblDuracionEstimada.Text = "";
       lblHoraFinEstimada.Text = "";

       if (rdb24Horas.Checked)
       {
           sdsReclamos.SelectParameters["hoy"].DefaultValue = "S";
           sdsReclamos.SelectParameters["reclamo"].DefaultValue = "1";
       }
       else
       {
           sdsReclamos.SelectParameters["hoy"].DefaultValue = "N";
           sdsReclamos.SelectParameters["reclamo"].DefaultValue = txtNroReclamo.Text;
       }

       panelReclamos.Visible = true;
       //sdsReclamos.Select(DataSourceSelectArguments.Empty);
       ////gvMaestro.DataSource = sdsReclamos;
       //gvMaestro.DataBind();

       if (gvMaestro.Rows.Count <= 0)
       {
           panelDetalleTiempos.Visible = false;
           panelMensaje.Visible = true;
           lblMensaje.Text = "No existen Reclamos pendientes ni asignados a una OTC.";
           
       }
       else
       {
           panelDetalleTiempos.Visible = true;
           panelMensaje.Visible = false;

           int nroReclamo = 0;
           float tiempoResolucion = 0;

           if (txtNroReclamo.Text != "") //busca por número
           {
               nroReclamo = Convert.ToInt32(txtNroReclamo.Text);
           }
           else
           {
               foreach (GridViewRow row in gvMaestro.Rows)
               {
                   nroReclamo = Convert.ToInt32(gvMaestro.Rows[row.RowIndex].Cells[0].Text);
                   tiempoResolucion = Convert.ToSingle(gvMaestro.Rows[row.RowIndex].Cells[16].Text);

                   break;
               }
           }

           foreach (GridViewRow row in gvMaestro.Rows)
           {
               tiempoResolucion = Convert.ToSingle(gvMaestro.Rows[row.RowIndex].Cells[16].Text);

               break;
           }

           OrdenTrabajoCorrectivo otc = Datos.getOTC().buscarOTC(nroReclamo);

           DateTime horaInicioOTC = Convert.ToDateTime(otc.HoraInicio);
           
           DateTime horaActual = DateTime.Now;

           TimeSpan dif = horaActual - horaInicioOTC;

           float resultado = tiempoResolucion - dif.Minutes;

           DateTime horaF = Convert.ToDateTime(horaActual.AddMinutes(resultado));

           panelDetalleTiempos.Visible = true;

           if (Convert.ToSingle(tiempoResolucion) == 0)
           {
               lblDuracionEstimada.Text = " - ";
               lblHoraFinEstimada.Text = " - ";
           }
           else
           {
               lblDuracionEstimada.Text = resultado.ToString() + " minutos";
               lblHoraFinEstimada.Text = horaF.ToString("HH:mm") + " hs.";
           }

           lblTiempo.Text = tiempoResolucion.ToString() + " minutos";
           lblHoraInicioOTC.Text = horaInicioOTC.ToString("HH:mm") + " hs.";
           lblHoraActual.Text = horaActual.ToString("HH:mm") + " hs.";
       }
   }
   protected void btnVolver_Click1(object sender, EventArgs e)
   {
       DatosUsuario usr = (DatosUsuario)Session["datosUsuario"];

       string rolUsuario = usr.Rol;

       if (rolUsuario.ToUpper().Equals("GUARDIA"))
           Response.Redirect("/Cooperativa/InicioGuardiaReclamo.aspx", true);

       if (rolUsuario.ToUpper().Equals("SOCIO"))
           Response.Redirect("/Cooperativa/Default.aspx", true);

       if (rolUsuario.ToUpper().Equals("JEFEREDES"))
           Response.Redirect("/Cooperativa/InicioJefes.aspx", true);

       if (rolUsuario.ToUpper().Equals("ADMINISTRATIVO"))
           Response.Redirect("/Cooperativa/InicioAdministrativo.aspx", true);
   }
   protected void gvMaestro_RowDataBound(object sender, GridViewRowEventArgs e)
   {
       e.Row.Cells[4].Visible = false;
       e.Row.Cells[5].Visible = false;
       e.Row.Cells[11].Visible = false;
       e.Row.Cells[13].Visible = false;
       e.Row.Cells[15].Visible = false;
       e.Row.Cells[16].Visible = false;
   }
}
