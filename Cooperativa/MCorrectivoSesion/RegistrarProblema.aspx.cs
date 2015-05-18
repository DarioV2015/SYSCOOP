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

public partial class MCorrectivoSesion_RegistrarProblema : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            txtNombre.Focus();

            if(Session["nombreProblema"] != null && Session["descripcionProblema"] != null)
            {
                txtNombre.Text = Session["nombreProblema"].ToString();
                txtDescripcion.Text = Session["descripcionProblema"].ToString();
            }
        }
    }
    public string nombreProblema
    {
        get
        {
            return txtNombre.Text;
        }
    }
    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        if (txtNombre.Text != " " && txtDescripcion.Text != null)
            ModalPopupConfirmacion.Show();
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Show();
    }
    protected void btnNuevaSolucion_Click(object sender, EventArgs e)
    {
        Session["nombreProblema"] = txtNombre.Text;
        Session["descripcionProblema"] = txtDescripcion.Text;
    }
    protected void btnAceptarRegistrar_Click(object sender, EventArgs e)
    {
        Problema p;
        Solucion s;
        List<Solucion> listaSoluciones = new List<Solucion>(); ;

        try
        {
            p = new Problema();
            p.NroProblema = Datos.getProbYSol().obtenerUltimoNroProblema();
            p.Nombre = txtNombre.Text;
            p.Descripcion = txtDescripcion.Text;

            foreach (GridViewRow row in gvSoluciones.Rows)
            {
                CheckBox chkbox1 = (CheckBox)row.FindControl("chkSolucion");

                if (chkbox1.Checked)
                {
                    int nroSolucion = Convert.ToInt32(gvSoluciones.Rows[row.RowIndex].Cells[3].Text);

                    s = new Solucion();

                    s.NroSolucion = nroSolucion;
                    s.Nombre = gvSoluciones.Rows[row.RowIndex].Cells[1].Text;
                    s.Descripcion = gvSoluciones.Rows[row.RowIndex].Cells[2].Text;

                    listaSoluciones.Add(s);

                    int filasProblema = Datos.getProbYSol().crearProblema(p);
                }
            }

            foreach (Solucion sol in listaSoluciones)
            {
                int ProbYSol = Datos.getProbYSol().crearProbYSoluc(p.NroProblema, sol.NroSolucion);
            }

            Datos.commit();
        }
        catch (Exception err)
        {
            Console.WriteLine(err.ToString());
            Datos.rollback();
        }
        
        ModalPopupConfirmacion.Hide();
        ModalPopupExito.Show();
    }
    protected void btnCancelarRegistrar_Click(object sender, EventArgs e)
    {
        ModalPopupConfirmacion.Hide();
    }
    protected void btnAceptarCancelacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }
    protected void btnCancelarCancelacion_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Hide();
        txtNombre.Focus();
    }
    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        int resultado = Convert.ToInt32(Session["vieneDeRegistrarResultado"]);
        if(resultado == 1) //entonces viene de Registrar Resultado de Mantenimiento Correctivo
            Response.Redirect("/Cooperativa/MCorrectivoSesion/RegistrarResultadoMantenimientoCorrectivo.aspx", true);
        else
            Response.Redirect("/Cooperativa/Default.aspx", true);
    }
    protected void gvSoluciones_RowDataBound(object sender, GridViewRowEventArgs e)
    {          
        e.Row.Cells[3].Visible = false;
    }
}
