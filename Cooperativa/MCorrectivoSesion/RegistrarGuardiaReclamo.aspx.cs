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

public partial class MCorrectivoSesion_RegistrarGrupoGuardiaReclamo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {



    }
    protected void gvEmpleado_rdbSeleccionar_CheckedChanged(object sender, EventArgs e)
    {
        int idEmpleado;
        

        foreach (GridViewRow row in gvEmpleado.Rows)
        {
            RadioButton gvEmpleado_rdbSeleccionar = (RadioButton)row.FindControl("gvEmpleado_rdbSeleccionar");
            if (gvEmpleado_rdbSeleccionar.Checked)
            {

                idEmpleado = Convert.ToInt32(row.Cells[1].Text);
                ViewState["idEmpleado"] = idEmpleado;
               
            }

        }

    }
  
    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
      
       ModalPopupRegistrar.Show();

        
          
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Show();

    }

    protected void btnCancelarConfirmar_Click(object sender, EventArgs e)
    {
        ModalPopupRegistrar.Hide();
    }
    protected void btnAceptarCancelacion_Click(object sender, EventArgs e)
    {

        Response.Redirect("/Cooperativa/default.aspx", true);
       
    }
    protected void btnCancelarCancelacion_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Hide();
   
    }
    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/MCorrectivoSesion/RegistrarGuardiaReclamo.aspx", true);
    }

    protected void btnAceptarConfirmacionCuadrilla_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/MCorrectivoSesion/RegistrarGuardiaReclamo.aspx", true);
    }

    protected void btnAceptarConfirmar_Click(object sender, EventArgs e)
    {
        try
        {
            int idCargo = Datos.getEmpleados().obtenerCargo((Convert.ToInt32(ViewState["idEmpleado"])));

            if (idCargo == null || idCargo == 2)
            {
                Datos.getEmpleados().cambiarCategoria(Convert.ToInt32(ViewState["idEmpleado"]));
                Datos.commit();

                ModalPopupRegistrar.Hide();
                ModalPopupExito.Show();

            }
            else
            {
                if (idCargo == 3)
                {
                    int nroCuadrilla = Datos.getEmpleados().buscarCuadrilla((Convert.ToInt32(ViewState["idEmpleado"])));
                    ViewState["nroCuadrilla"] = nroCuadrilla;

                    Datos.getEmpleados().quitarOficialdeCuadrilla((Convert.ToInt32(ViewState["idEmpleado"])));
                    Datos.getEmpleados().cambiarCategoria((Convert.ToInt32(ViewState["idEmpleado"])));
                    Datos.commit();

                    ModalPopupRegistrar.Hide();
                    ModalPopupCuadrilla.Show();
                    
                }
            
            
            }

        }
        catch (Exception err)
        {
            Console.WriteLine(err.ToString());
            Datos.rollback();
        }

   
    }
}
