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

public partial class InicioGuardiaReclamo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
            DatosUsuario datos = (DatosUsuario)Session["datosUsuario"];
            if (datos != null)
            {
                lblTareasPendientes.Text = "TAREAS PENDIENTES ASIGNADAS AL GRUPO Nº " + Datos.getOrdenInstalacion().traerGrupoDelEmpleado(Convert.ToInt32(datos.IdUsuario)).ToString();

                //me fijo si hay OTC Asignadas al Grupo

                List<OrdenTrabajoCorrectivo> otc = Datos.getOTC().buscarOTCAsignadas(Convert.ToInt32(Datos.getOrdenInstalacion().traerGrupoDelEmpleado(Convert.ToInt32(datos.IdUsuario)).ToString()));

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
                
                //me fijo si hay Órdenes de Instalación

                List<OrdenInstalacionMedidor> oim = Datos.getOrdenInstalacion().buscarOrdenesInstalacion(Convert.ToInt32(Datos.getOrdenInstalacion().traerGrupoDelEmpleado(Convert.ToInt32(datos.IdUsuario)).ToString()));

                if(oim.Count > 0)
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
            

        }
    }




}
