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


public partial class MCorrectivoSesion_ConsultarOTC : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //el Grupo Guardia Reclamo está seteado (ver 3 asteriscos)
            DatosUsuario datos = (DatosUsuario)Session["datosUsuario"];
            lblGrupo.Text += " " + datos.NroGuardia;//***
            
            if (Datos.getOTC().verSIOTC(Convert.ToInt32(datos.NroGuardia)))
            {
                panelOTCAsignada.Visible = true;
                panelReclamos.Visible = true;
                PanelNoHayOTC.Visible = false;
                lblNoHayOTC.Visible = false;

                OrdenTrabajoCorrectivo otc = Datos.getOTC().traerOTCEnCurso(Convert.ToInt32(datos.NroGuardia));//***

                lblNroOTC.Text = otc.NroOTC.ToString();
                lblFechaInicio.Text = otc.FechaInicio.ToString("dd/MM/yyyy");
                lblHoraInicio.Text = otc.HoraInicio.ToString("HH:mm") + " hs.";
                lblPrioridad.Text = otc.Prioridad.ToString();
                lblTipoReclamo.Text = otc.TipoReclamo;
                lblCalle.Text = otc.NombreCalle;
                lblNroCalle.Text = otc.NroCalle.ToString();
                lblPiso.Text = otc.Piso.ToString();
                lblDpto.Text = otc.Dpto;
                lblZona.Text = otc.Zona;

                lblReclamosAsociados.Text += " a la OTC Nº " + otc.NroOTC.ToString();

                sdsProbYSoluciones.SelectParameters["tiporeclamo"].DefaultValue = otc.NroTipoReclamo.ToString();
                sdsProbYSoluciones.SelectParameters["zona"].DefaultValue = otc.NroZona.ToString();

                btnVolver.Visible = true;
                btnVolver2.Visible = false;
            }
            else
            {
                panelOTCAsignada.Visible = false;
                PanelNoHayOTC.Visible = true;
                lblNoHayOTC.Text = "No hay ninguna OTC asignada para el Grupo Nº " + datos.NroGuardia;//***

                btnVolver.Visible = false;
                btnVolver2.Visible = true;
            }
        }
    }
    protected void btnVolver_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/InicioGuardiaReclamo.aspx", true);
    }
    protected void btnVolver2_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/InicioGuardiaReclamo.aspx", true);
    }
}
