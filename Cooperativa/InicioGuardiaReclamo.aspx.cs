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
                //si hay OTC las muestro
                
                List<OrdenTrabajoCorrectivo> otc = new List<OrdenTrabajoCorrectivo>();

                otc.Add(Datos.getOTC().traerOTCEnCurso((Convert.ToInt32(datos.NroGuardia))));

            
                OrdenInstalacionMedidor o = Datos.getOTC().traerOrdenInstalacion((Convert.ToInt32(datos.NroGuardia)));

                List<OrdenInstalacionMedidor> oim = new List<OrdenInstalacionMedidor>();
                oim.Add(Datos.getOTC().traerOrdenInstalacion((Convert.ToInt32(datos.NroGuardia))));

                if(o != null)
                {
                    GvOIPendientes.Visible = true;
                    GvOIPendientes.DataSource = oim;
                    GvOIPendientes.DataBind();

                    lblNoHayOrdenesInstalacion.Visible= false;
                }
                else
                {
                    lblNoHayOrdenesInstalacion.Visible= true;
                    GvOIPendientes.Visible = false;
                }
            //        gvOTCEnCurso.DataSource = otc;
            //        gvOTCEnCurso.DataBind();
                
        

            //    foreach (GridViewRow rows in gvOTCEnCurso.Rows)      
            //    {
            //        int nroOTC = Convert.ToInt32(gvOTCEnCurso.Rows[rows.RowIndex].Cells[0].Text);
                    
            //        if(nroOTC != 0)
            //        {
            //            gvOTCEnCurso.DataSource = otc;
            //            gvOTCEnCurso.DataBind();

            //            lblNoHayOTC.Visible = false;

            //            break;
            //        }
            //        else
            //        {
            //            lblNoHayOTC.Visible = true;
            //        }
            //    }

            //    lblNoHayOTC.Visible = true;

            //    //si hay Órdenes de Instalación Pendientes las muestro
                
            //    List<OrdenInstalacionMedidor> oim = new List<OrdenInstalacionMedidor>();

            //    oim.Add(Datos.getOTC().traerOrdenInstalacion((Convert.ToInt32(datos.NroGuardia))));

            //    //GvOIPendientes.DataSource = oim;
            //    //GvOIPendientes.DataBind();

            //    foreach (GridViewRow rows in GvOIPendientes.Rows)      
            //    {
            //        int nroOrden = Convert.ToInt32(GvOIPendientes.Rows[rows.RowIndex].Cells[0].Text);
                    
            //        if(nroOrden != 0)
            //        {
            //            GvOIPendientes.DataSource = oim;
            //            GvOIPendientes.DataBind();

            //            lblNoHayOrdenesInstalacion.Visible = false;

            //            break;
            //        }
            //        else
            //        {
            //            lblNoHayOrdenesInstalacion.Visible = true;
            //        }
            //    }

            //    lblNoHayOrdenesInstalacion.Visible = true;
            
            //}

        }
    }




}
