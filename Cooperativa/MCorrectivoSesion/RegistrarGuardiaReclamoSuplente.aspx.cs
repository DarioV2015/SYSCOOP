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

public partial class MCorrectivoSesion_RegistrarGuardiaReclamoSuplente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (gvEmpleados.Rows.Count == 0)
        {
            btnRegistrar.Visible = false;
            btnCancelar.Visible = false;
            ModalPopupMsjEmpleados.Show();
        
        }

    }



    protected void gvEmpleados_rdbSeleccionar_CheckedChanged(object sender, EventArgs e)
    {
        int idEmpleado;


        foreach (GridViewRow row in gvEmpleados.Rows)
        {
            RadioButton gvEmpleados_rdbSeleccionar = (RadioButton)row.FindControl("gvEmpleados_rdbSeleccionar");
            if (gvEmpleados_rdbSeleccionar.Checked)
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

    protected void btnAceptarConfirmar_Click(object sender, EventArgs e)
    {

        try
        {
            Datos.getEmpleados().cambiarCategoriaGRS(Convert.ToInt32(ViewState["idEmpleado"]));
            Datos.commit();

            ModalPopupRegistrar.Hide();
            ModalPopupExito.Show();
        }

        catch (Exception err)
        {
            Console.WriteLine(err.ToString());
            Datos.rollback();
        }
    
    }
    protected void btnCancelarConfirmar_Click(object sender, EventArgs e)
    {
        ModalPopupRegistrar.Hide();
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        ModalPopupCancelar.Show();

    }

    protected void btnAceptarMsjEmpleados_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/default.aspx", true);    
    }


    protected void btnAceptarCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/default.aspx", true);
    }

    protected void btnCancelarCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/MCorrectivoSesion/RegistrarGuardiaReclamoSuplente.aspx", true);
    }


    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/MCorrectivoSesion/RegistrarGuardiaReclamoSuplente.aspx", true);
    }

}
