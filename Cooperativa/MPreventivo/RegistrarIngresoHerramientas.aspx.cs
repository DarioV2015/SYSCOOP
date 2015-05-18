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
using System.Drawing;

public partial class MPreventivo_RegistrarIngresoHerramientas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int bandera = Convert.ToInt32(Session["Bandera"]);
        if (bandera == 0)
        {
            int cant;
            String nombreHerramienta;
            int idHerramienta;
            lblNroContrato.Text = Convert.ToString(Session["NroContrato"]);


            List<DetalleContrato> listado = new List<DetalleContrato>();
            listado = (List<DetalleContrato>)Session["ListadoHerramientas"];

            DataTable dt = new DataTable();
            dt.Columns.Add("NroHerramienta", typeof(Int32));
            dt.Columns.Add("DescripHerramienta", typeof(string));


            foreach (DetalleContrato detalle in listado)
            {
                nombreHerramienta = Convert.ToString(detalle.DescripHerramienta);
                idHerramienta = Convert.ToInt32(detalle.NroHerramienta);
                cant = Convert.ToInt32(detalle.CantidadIngresada);
                for (int i = 0; i < cant; i++)
                {
                    dt.Rows.Add(idHerramienta, nombreHerramienta);
                }



            }
            gvDetalle.DataSource = dt;
            gvDetalle.DataBind();
            Session["Bandera"] = "1";

        }
        

       
    }




    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in this.gvDetalle.Rows)
        {
            CheckBox CheckHerramienta = (CheckBox)row.FindControl("CheckHerramienta");
            TextBox venc = (TextBox)row.FindControl("txtFechaVen");
            TextBox lote = (TextBox)row.FindControl("txtNroLote");
            if (lote.Text == "")
            {
                lote.BackColor = Color.Thistle;

                if (venc.Text == "")
                { venc.BackColor = Color.Thistle; }
                else
                { venc.BackColor = Color.White; }

            }
            else
            {
                lote.BackColor = Color.White;

                if (venc.Text == "")
                { venc.BackColor = Color.Thistle; }
                else
                {
                    venc.BackColor = Color.White;
                    ModalPopupConfirmacion.Show();
                }
            }

        }

    }
    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }

    protected void btnAceptarRegistrar_Click(object sender, EventArgs e)
    {
        int nroHerramienta;
        int tipo;
        int nroLote;
        int nuevoId = 0; 
        int crear = 0;
        Herramienta h;
        String descripcion;
        String especificTecnica;
       

        foreach (GridViewRow row in this.gvDetalle.Rows)
        {
            nroHerramienta = Convert.ToInt32(row.Cells[1].Text);
            TextBox venc = (TextBox)row.FindControl("txtFechaVen");
            TextBox lote = (TextBox)row.FindControl("txtNroLote");
            DateTime fechaVenc = Convert.ToDateTime(venc.Text);
            nroLote = Convert.ToInt32(lote.Text);
            nuevoId = Datos.getHerramienta().obtenerUltimoNroHerramienta();

            
            h = Datos.getHerramienta().traerHerramientaCompleta(nroHerramienta);
            descripcion=Convert.ToString(h.Descripcion);
            especificTecnica=Convert.ToString(h.EspecificacionTecnica);
            tipo = Convert.ToInt32(h.NroTipoHerramienta);

            crear += Datos.getHerramienta().crearIngresoHerramienta(nuevoId, descripcion, tipo, fechaVenc, nroLote, especificTecnica);
            
        }
        if (crear > 0)
        {
            Datos.commit();
            ModalPopupExito.Show();
        }
       

        





    }
    protected void btnCancelarRegistrar_Click(object sender, EventArgs e)
    {

    }
    protected void checkSeleccionTodo_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow row in this.gvDetalle.Rows)
        {
            CheckBox CheckHerramienta = (CheckBox)row.FindControl("CheckHerramienta");
            if (CheckHerramienta.Checked)
            { CheckHerramienta.Checked = false; }
            else
            { CheckHerramienta.Checked = true; }


        }
    }
    protected void CheckHerramienta_CheckedChanged(object sender, EventArgs e)
    {
       
    }


   
    protected void btnNroLote_Click(object sender, EventArgs e)
    {
        Session["Bandera"] = "1";

        CheckBox CheckHerramienta;
        String lote;
        foreach (GridViewRow row in this.gvDetalle.Rows)
        {
            lote = txtNroLote.Text;
            CheckHerramienta = (CheckBox)row.FindControl("CheckHerramienta");

            if (CheckHerramienta.Checked)
            {
                ((TextBox)row.FindControl("txtNroLote")).Text = lote;
                ((TextBox)row.FindControl("txtNroLote")).BackColor = Color.White;

            }

        }
    }
    protected void btnFechaVenc_Click(object sender, EventArgs e)
    {
        Session["Bandera"] = "1";

        foreach (GridViewRow row in this.gvDetalle.Rows)
        {
            String fecha = txtFechaVenc.Text;
            CheckBox CheckHerramienta = (CheckBox)row.FindControl("CheckHerramienta");

            if (CheckHerramienta.Checked)
            {
                ((TextBox)row.FindControl("txtFechaVen")).Text = fecha;
                ((TextBox)row.FindControl("txtFechaVen")).BackColor = Color.White;

            }

        }

    }
    protected void txtFechaVenc_Changed(object sender, EventArgs e)
    {

    }
}
