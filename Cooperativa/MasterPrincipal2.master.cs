using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Collections.Generic;

public partial class MasterPrincipal2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //ImageButton1.ImageUrl = "~/Imagenes/add.png";
        lblFecha.Text = DateTime.Now.ToString("D");
        DatosUsuario usr =(DatosUsuario)Session["datosUsuario"];
       
        if (usr != null)
        {
            if (usr.Rol.Equals("Socio"))
            {
                AccordionSocio.Visible = true;
                AccordionAdministrativo.Visible = false;
                AccordionCapataz.Visible = false;
                AccordionGuardia.Visible = false;
                AccordionJefes.Visible = false;
              
            }
            else if (usr.Rol.Equals("Guardia"))
            {
                AccordionSocio.Visible = false;
                AccordionAdministrativo.Visible = false;
                AccordionCapataz.Visible = false;
                AccordionGuardia.Visible =  true;
                AccordionJefes.Visible = false;
               
            }
            else if (usr.Rol.Equals("Capataz") )
            {
                AccordionSocio.Visible = false;
                AccordionAdministrativo.Visible = false;
                AccordionCapataz.Visible = true;
                AccordionGuardia.Visible = false;
                AccordionJefes.Visible = false;
            }
            else if (usr.Rol.Equals("JefeRedes") || usr.Rol.Equals("JefeDistribucion"))
            {
                AccordionSocio.Visible = false;
                AccordionAdministrativo.Visible = false;
                AccordionCapataz.Visible = false;
                AccordionGuardia.Visible = false;
                AccordionJefes.Visible = true;
            }
            else if (usr.Rol.Equals("Administrativo"))
            {
                AccordionSocio.Visible = false;
                AccordionAdministrativo.Visible = true;
                AccordionCapataz.Visible = false;
                AccordionGuardia.Visible = false;
                AccordionJefes.Visible = false;
            }

            lblUsuario.Text = usr.Usuario.ToUpper() + " - " + usr.Rol.ToString();

            if (!usr.Rol.Equals("Socio"))
            {
                List<Insumo> listaInsumosPorVencer = (List<Insumo>)Datos.getAvisos().traerInsumosVencidos();

                if (listaInsumosPorVencer.Count == 0)  //no hay insumos por vencer
                    imagenAvisos.Visible = false;
                else
                    imagenAvisos.Visible = true;

                List<Insumo> listaInsumosSinStock = (List<Insumo>)Datos.getAvisos().traerInsumosFaltaStock();

                if (listaInsumosSinStock.Count == 0)
                    imagenAvisos.Visible = false;
                else
                    imagenAvisos.Visible = true;

                List<Herramienta> listaHerramientasPorVencer = (List<Herramienta>)Datos.getAvisos().traerHerramientasVencidas();

                if (listaHerramientasPorVencer.Count == 0)
                    imagenAvisos.Visible = false;
                else
                    imagenAvisos.Visible = true;

                List<Medidor> listaStockMedidores = (List<Medidor>)Datos.getAvisos().traerStockMedidores();

                if (listaStockMedidores.Count > 10)
                    imagenAvisos.Visible = false;
                else
                    imagenAvisos.Visible = true;
            }
            else
            {
                imagenAvisos.Visible = false;
            }
        }
        else {
            lblUsuario.Text = "";
            AccordionSocio.Visible = false;
            AccordionAdministrativo.Visible = false;
            AccordionCapataz.Visible = false;
            AccordionGuardia.Visible = false;
            AccordionJefes.Visible = false;
          
        }
    }

    protected void lnkCerrarSession_Click(object sender, EventArgs e)
    {
        Session["datosUsuario"] = null;
        FormsAuthentication.SignOut();
        Response.Redirect("/Cooperativa/Medidor/Login.aspx", true);
    }
    protected void imagenAvisos_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("/Cooperativa/MPreventivo/AvisosVarios.aspx", true);
    }
}
