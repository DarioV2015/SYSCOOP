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

public partial class Inicio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DatosUsuario datos = (DatosUsuario)Session["datosUsuario"];
        if (datos != null)
        {
            //lblTareasPendientes.Text = "RESÚMEN DE TAREAS PENDIENTES";

            //me fijo si hay OTC Asignadas a cualquier Grupo

            List<OrdenTrabajoCorrectivo> otc = Datos.getOTC().buscarOTCAsignadas();

            if (otc.Count > 0)
            {
                gvOTCEnCurso.Visible = true;
                gvOTCEnCurso.DataSource = otc;
                gvOTCEnCurso.DataBind();

                lblNoHayOTC.Visible = false;
            }
            else
            {
                gvOTCEnCurso.Visible = false;
                gvOTCEnCurso.DataSource = otc;
                gvOTCEnCurso.DataBind();

                lblNoHayOTC.Visible = true;
            }

            //me fijo si hay Órdenes de Instalación para cualquier Grupo

            List<OrdenInstalacionMedidor> oim = Datos.getOrdenInstalacion().buscarOrdenesInstalacion();

            if (oim.Count > 0)
            {
                GvOIPendientes.Visible = true;
                GvOIPendientes.DataSource = oim;
                GvOIPendientes.DataBind();

                lblNoHayOrdenesInstalacion.Visible = false;
            }
            else
            {
                GvOIPendientes.Visible = false;
                GvOIPendientes.DataSource = oim;
                GvOIPendientes.DataBind();

                lblNoHayOrdenesInstalacion.Visible = true;
            }

            //me fijo si hay Pedidos de Instalación Pendientes

            List<PedidoInstalacion> pi = Datos.getOrdenInstalacion().buscarPedidosPendientes();

            if (pi.Count > 0)
            {
                grillaPedidosPendientes.Visible = true;
                grillaPedidosPendientes.DataSource = pi;
                grillaPedidosPendientes.DataBind();

                lblNoHayPedidosPendientes.Visible = false;
            }
            else
            {
                grillaPedidosPendientes.Visible = false;
                grillaPedidosPendientes.DataSource = pi;
                grillaPedidosPendientes.DataBind();

                lblNoHayPedidosPendientes.Visible = true;
            }
        }   
    }
    protected void VerEmpleados_click (object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }

    protected void btnAceptarRegistrar_Click(object sender, EventArgs e)
    {
        ModalPopupExtender1.Hide();
    }

   
}
