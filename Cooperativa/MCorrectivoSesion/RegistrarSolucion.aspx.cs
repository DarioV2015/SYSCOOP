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

public partial class MCorrectivoSesion_RegistrarSolucion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string problema;

        if (Page.PreviousPage != null && !Page.IsPostBack)
        {
            txtNombreSolucion.Focus();
            problema = PreviousPage.nombreProblema;
            lblNombreProblema.Text = problema;
        }
    }
    protected void btnRegistrarSolucion_Click(object sender, EventArgs e)
    {
        if (txtNombreSolucion.Text != " " && txtDescripcionSolucion.Text != " ")
            ModalPopupRegistrar.Show();
    }
    protected void btnCancelarSolucion_Click(object sender, EventArgs e)
    {
        //TextBox txt = (TextBox) PreviousPage.FindControl("txtNombre");
       // string valor = txt.ToString();
        ModalPopupCancelarRegistrar.Show();
    }
    protected void btnAceptarConfirmar_Click(object sender, EventArgs e)
    {
        List<Herramienta> listaHerramientas = new List<Herramienta>();
        try
        {
            Solucion s = new Solucion();

            s.NroSolucion = Datos.getProbYSol().obtenerUltimoNroSolucion();
            s.Nombre = txtNombreSolucion.Text;
            s.Descripcion = txtDescripcionSolucion.Text;

            foreach (GridViewRow row in gvHerramientas.Rows)
            {
                CheckBox chkbox1 = (CheckBox)row.FindControl("chkHerramienta");

                if (chkbox1.Checked)
                {
                    int nroHerramienta = Convert.ToInt32(gvHerramientas.Rows[row.RowIndex].Cells[3].Text);

                    Herramienta h = new Herramienta();

                    h.NroHerramienta = nroHerramienta;
                    h.Descripcion = gvHerramientas.Rows[row.RowIndex].Cells[1].Text;
                    
                    listaHerramientas.Add(h);
                                        
                    int filasSoluciones = Datos.getProbYSol().crearSolucion(s);
                }
            }

            foreach(Herramienta her in listaHerramientas)
            {
                int HerrXSol = Datos.getProbYSol().crearHerramientasXSoluc(her.NroHerramienta, s.NroSolucion);
            }

            Datos.commit();
        }
        catch (Exception err)
        {
            Console.WriteLine(err.ToString());
            Datos.rollback();
        }

        ModalPopupRegistrar.Hide();
        ModalPopupExito.Show();
    }
    protected void btnCancelarConfirmar_Click(object sender, EventArgs e)
    {
        ModalPopupRegistrar.Hide();
    }
    protected void btnAceptarCancelacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/MCorrectivoSesion/RegistrarProblema.aspx", true);
    }
    protected void btnCancelarCancelacion_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Hide();
        txtNombreSolucion.Focus();
    }
    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/MCorrectivoSesion/RegistrarProblema.aspx", true);
    }
    protected void gvHerramientas_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[3].Visible = false;
    }
}
