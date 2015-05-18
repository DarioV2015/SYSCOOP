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


public partial class MPreventivo_RegistrarActividad : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)(Session["NombreTarea"])!= "")
        {
            string nombreTarea = (string)(Session["NombreTarea"]);
            this.lblTarea.Text = nombreTarea;
        }
    }
    protected void btnModificarDuracion_Click(object sender, EventArgs e)
    {
        this.FormViewDutración.Visible = false;
        this.PanelDuracion.Visible = true;
    }
   
    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        this.btnRegistrar.Enabled = true;
        int var = 0;      
        List<Insumo> listado;
        if (ViewState["lista"] == null)
            listado = new List<Insumo>();
        else
        {
            listado = (List<Insumo>)ViewState["lista"];
            foreach (Insumo insu in listado)
            {
                if (insu.NroInsumo == Convert.ToInt32(ddlInsumos.SelectedValue))
                {
                    this.lblMensaje.Text = "El insumo seleccionado ya fuer agregado";
                    var = 1;
                    break;
                }
            }

        }

        if (var == 0)
        {
             this.lblMensaje.Text = "";
             Insumo ins = new Insumo();

             ins = Datos.getInsumo().traerInsumo(Convert.ToInt32(this.ddlInsumos.SelectedValue));

             listado.Add(ins);

             ViewState["lista"] = listado;

             if (listado.Count > 0)
                {
                    gvInsumo.DataSource = listado;
                    gvInsumo.DataBind();
                }            
        }
        
       
    }
          
        
        
    
   
    protected void gvInsumo_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRow")
        {
            int nroInsumo = Convert.ToInt32(e.CommandArgument);

            List<Insumo> listado;
            listado = (List<Insumo>)ViewState["lista"];

            foreach (Insumo ins in listado)
            {
                if (ins.NroInsumo == nroInsumo)
                {
                    listado.Remove(ins);
                    break;
                }
            }

            gvInsumo.DataSource = listado;
            gvInsumo.DataBind();
        }

    }




    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        if (gvInsumo.Rows.Count > 0)
        { ModalPopupConfirmacion.Show(); }
        else
        { ModalPopupInsumo.Show(); }
        
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Show();
    }
    protected void btnAceptarRegistrar_Click(object sender, EventArgs e)
    {
        int fila = 0;
        int fila1 = 0;
        int idActividad = Datos.getActividades().obtenerUltimoIdActividad();

        Session["idActividad"] = idActividad;

        String nombre = TextBox1.Text;
        String descrip;
        int duracion;
        if (TextBox2.Text == "")
        {
            descrip = "Sin descripción";
        }
        else
        {
            descrip = TextBox2.Text;
        }
        if (PanelDuracion.Visible == true)
        {
            duracion = Convert.ToInt32(txtDuracion.Text);
        }
        else
        {
            duracion = Datos.getActividades().getDuracionComplejidad(Convert.ToInt32(ddlComplejidad.SelectedValue));
        }

        fila = Datos.getActividades().insertarActividad(idActividad, nombre, descrip, Convert.ToInt32(ddlComplejidad.SelectedValue),duracion);
        
        if(fila > 0)
        {
            if (gvInsumo.Rows.Count > 0)
            {
                for (int i = 0; i < gvInsumo.Rows.Count; i++)
                {
                    int nroInsumo = Convert.ToInt32(gvInsumo.Rows[i].Cells[0].Text);
                    fila1 = Datos.getActividades().insertarInsumoXActividad(idActividad, nroInsumo);

                }
                if (fila1 > 0)
                { Datos.commit(); }
            }
            else
            { Datos.commit(); }

        }
        
        
        ModalPopupConfirmacion.Hide();
        ModalPopupExito.Show();
    }
    protected void btnCancelarRegistrar_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Hide();  
    }
    protected void btnAceptarCancelacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }
    protected void btnCancelarCancelacion_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Hide();
    }
    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/MPreventivo/RegistrarTareaGeneral.aspx", true);
    }
    protected void btnAceptarSinInsumo_Click(object sender, EventArgs e)
    {
        ModalPopupInsumo.Hide();
        ModalPopupConfirmacion.Show();
    }
    protected void btnCancelarSinInsumo_Click(object sender, EventArgs e)
    {
        ModalPopupInsumo.Hide();
    }
}
