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

public partial class MPreventivo_RegistrarContrato : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int nroContrato = Datos.getContratos().obtenerUltimoIdContrato();
        Session["nroContrato"] = nroContrato;
        lblNroContrato.Text = Convert.ToString(Session["nroContrato"]);

        if (Session["RegistrarContratoInsumo"] == "1")
        {
            ddlProveedor.SelectedValue=Convert.ToString(Session["comboProveedor"]);
            txtFecha.Text=Convert.ToString(Session["fechaPedido"]);
            rdbInsumo.Checked =true;
            PanelInsumo.Visible = true;
            List<Insumo> listado = (List<Insumo>)Session["listaI"];
            gvInsumo.DataSource = listado;
            gvInsumo.DataBind();
            Session["RegistrarContratoInsumo"] = "0";
                
           
        }

       if (Session["RegistrarContratoHerramienta"] == "1")
       {
            ddlProveedor.SelectedValue = Convert.ToString(Session["comboProveedor"]);
            txtFecha.Text = Convert.ToString(Session["fechaPedido"]); 
            rdbHerramienta.Checked=true;
            PanelHerramienta.Visible = true;
            List<Herramienta> listado = (List<Herramienta>)Session["lista"];
            gvHerramientas.DataSource = listado;
            gvHerramientas.DataBind();
            Session["RegistrarContratoHerramienta"] = "0";
       }
    }      
    

    protected void text_Changed(object sender, EventArgs e)
    {
        /*if (Convert.ToDateTime(this.DateTextBox.Text) < DateTime.Now)
        {
            this.lblMensajeFecha.Text = "La fecha de inicio no puede ser INFERIOR al día de hoy";
        }
        else
        {
            if (Convert.ToDateTime(this.DateTextBox.Text) < Convert.ToDateTime(ViewState["fechaInicio"]))
            {
                this.lblMensajeFecha.Text = "La fecha de inicio no puede ser INFERIOR al la fecha inicio de la diagramación del grupo GR";
            }
            else
            {
                this.lblMensajeFecha.Text = "";

            }
        }*/
    }
    protected void rdbInsumo_CheckedChanged(object sender, EventArgs e)
    {
        PanelInsumo.Visible = true;
        PanelHerramienta.Visible = false;
        PanelMedidor.Visible = false;
    }
    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        //this.btnRegistrar.Enabled = true;
        int var = 0;      
        List<Insumo> listado;
        if (Session["listaI"] == null)
            listado = new List<Insumo>();
        else
        {
            listado = (List<Insumo>)Session["listaI"];
            foreach (Insumo insu in listado)
            {
                if (insu.NroInsumo == Convert.ToInt32(ddlInsumos.SelectedValue))
                {
                    /*this.lblMensaje.Text = "El insumo seleccionado ya fuer agregado";
                    var = 1;
                    break;*/
                }
            }

        }

        if (var == 0)
        {
             //this.lblMensaje.Text = "";
            
            Insumo ins = new Insumo();

             ins = Datos.getInsumo().traerInsumo(Convert.ToInt32(this.ddlInsumos.SelectedValue));

             listado.Add(ins);

             Session["listaI"] = listado;

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
            listado = (List<Insumo>)Session["listaI"];

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

    protected void gvHerramientas_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRow")
        {
            int nroHerramienta = Convert.ToInt32(e.CommandArgument);

            List<Herramienta> listado;
            listado = (List<Herramienta>)Session["lista"];

            foreach (Herramienta her in listado)
            {
                if (her.NroHerramienta == nroHerramienta)
                {
                    listado.Remove(her);
                    break;
                }
            }

            gvHerramientas.DataSource = listado;
            gvHerramientas.DataBind();
        }

    }


    protected void btnAgregarHerramienta_Click(object sender, EventArgs e)
    {
        //this.btnRegistrar.Enabled = true;
        int var = 0;      
        List<Herramienta> listado;
        if (Session["lista"] == null)
            listado = new List<Herramienta>();
        else
        {
            listado = (List<Herramienta>)Session["lista"];
            foreach (Herramienta her in listado)
            {
                if (her.NroHerramienta == Convert.ToInt32(ddlHerranmienta.SelectedValue))
                {
                    /*this.lblMensaje.Text = "El insumo seleccionado ya fuer agregado";
                    var = 1;
                    break;*/
                }
            }

        }

        if (var == 0)
        {
             //this.lblMensaje.Text = "";
             Herramienta her = new Herramienta();

             her = Datos.getHerramienta().traerHerramientaSinLote(Convert.ToInt32(this.ddlHerranmienta.SelectedValue));

             listado.Add(her);

             Session["lista"] = listado;

             if (listado.Count > 0)
                {
                    gvHerramientas.DataSource = listado;
                    gvHerramientas.DataBind();
                }            
        }
        
       
    }
    protected void gvMedidor_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRow")
        {
            int idTipoMedidor = Convert.ToInt32(e.CommandArgument);

            List<TipoMedidor> listado;
            listado = (List<TipoMedidor>)Session["listaM"];

            foreach (TipoMedidor tipo in listado)
            {
                if (tipo.IdTipoMedidor == idTipoMedidor)
                {
                    listado.Remove(tipo);
                    break;
                }
            }

            gvMedidor.DataSource = listado;
            gvMedidor.DataBind();
        }

    }
    protected void rdbHerramienta_CheckedChanged(object sender, EventArgs e)
    {
        PanelInsumo.Visible = false;
        PanelHerramienta.Visible = true;
        PanelMedidor.Visible = false;
    }
    protected void btnNuevo_Click(object sender, EventArgs e)
    {
        int idProveedor = Convert.ToInt32(ddlProveedor.SelectedValue);
        Session["comboProveedor"] = idProveedor;
        DateTime fechaPedido = Convert.ToDateTime(txtFecha.Text);
        Session["fechaPedido"] = fechaPedido;
             
        Session["RegistrarContratoInsumo"] = "1";
        Response.Redirect("/Cooperativa/MPreventivo/RegistrarInsumo.aspx", true);
    

    }
    protected void btnNuevaHerramienta_Click(object sender, EventArgs e)
    {
        //Falta hacer la pagina de registrar herramientas
        int idProveedor = Convert.ToInt32(ddlProveedor.SelectedValue);
        Session["comboProveedor"] = idProveedor;
        DateTime fechaPedido = Convert.ToDateTime(txtFecha.Text);
        Session["fechaPedido"] = fechaPedido;
        Session["RegistrarContratoHerramienta"] = "1";
        Response.Redirect("/Cooperativa/MPreventivo/RegistrarHerramienta.aspx", true);

    }
    protected void rdbMedidor_CheckedChanged(object sender, EventArgs e)
    {
        PanelInsumo.Visible = false;
        PanelHerramienta.Visible = false;
        PanelMedidor.Visible = true;
    }
    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        ModalPopupConfirmacion.Show();
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Show();
    }
    protected void btnAceptarRegistrar_Click(object sender, EventArgs e)
    {
        ModalPopupConfirmacion.Hide();
        int idContrato = Datos.getContratos().obtenerUltimoIdContrato();
        int idProveedor = Convert.ToInt32(ddlProveedor.SelectedValue);
        DateTime fechaPedido = Convert.ToDateTime(txtFecha.Text);
        int idUltimoItem = Datos.getContratos().obtenerUltimoItemContrato();
        String tipo;
        int filaContrato;
        int filaItem=0;
        int i = 0;
        
             if (rdbInsumo.Checked)
             {
                 tipo="Insumos";
                 filaContrato = Datos.getContratos().insertarCONTRATO(idContrato, fechaPedido, idProveedor, tipo);
                 if (gvInsumo.Rows.Count > 0)
                    {
                        for (i = 0; i < gvInsumo.Rows.Count; i++)
                        {
                            int nroInsumo = Convert.ToInt32(gvInsumo.Rows[i].Cells[1].Text);
                            TextBox tex = gvInsumo.Rows[i].FindControl("txtCantidad") as TextBox;
                            int cantidad = Convert.ToInt32(tex.Text);
                            int item = idUltimoItem + i;
                            filaItem += Datos.getContratos().insertarItemDettaleInsumo(idContrato, item, nroInsumo, cantidad);
                            
                        }
                        

                    }
                     
             }
             if (rdbHerramienta.Checked)
             {
                 tipo="Herramientas";
                 filaContrato = Datos.getContratos().insertarCONTRATO(idContrato, fechaPedido, idProveedor, tipo);
                 if (gvHerramientas.Rows.Count > 0)
                 {
                     for (i = 0; i < gvHerramientas.Rows.Count; i++)
                     {
                         int nroHerramienta = Convert.ToInt32(gvHerramientas.Rows[i].Cells[1].Text);
                         TextBox tex = gvHerramientas.Rows[i].FindControl("txtCantidadHerramienta") as TextBox;
                         int cantidad = Convert.ToInt32(tex.Text);
                         int item = idUltimoItem + i;
                         filaItem += Datos.getContratos().insertarItemDettaleHerramienta(idContrato, item, nroHerramienta, cantidad);
                     }

                 }
                 
 
             }
             if (rdbMedidor.Checked)
             {
                 if (gvMedidor.Rows.Count > 0)
                 {
                     tipo="Medidores";
                     filaContrato = Datos.getContratos().insertarCONTRATO(idContrato, fechaPedido, idProveedor, tipo);
                     for (i = 0; i < gvMedidor.Rows.Count; i++)
                     {
                         int idTipoMedidor = Convert.ToInt32(gvMedidor.Rows[i].Cells[1].Text);
                         TextBox tex = gvMedidor.Rows[i].FindControl("txtCantidadMedidores") as TextBox;
                         int cantidad = Convert.ToInt32(tex.Text);
                         int item = idUltimoItem + i;
                         filaItem += Datos.getContratos().insertarItemDettaleMedidor(idContrato, item, idTipoMedidor, cantidad);

                     }
 
                 }
             }
        
             if (filaItem == i)
             {
                 Datos.commit();
                 ModalPopupExito.Show();
             }
       
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

    }
    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }
    protected void btnAgregarMedidor_Click1(object sender, EventArgs e)
    {
        //this.btnRegistrar.Enabled = true;
        int var = 0;
        List<TipoMedidor> listado;
        if (Session["listaM"] == null)
            listado = new List<TipoMedidor>();
        else
        {
            listado = (List<TipoMedidor>)Session["listaM"];
            foreach (TipoMedidor ti in listado)
            {
                if (ti.IdTipoMedidor == Convert.ToInt32(this.ddlTipoMedidor.SelectedValue))
                {
                    /*this.lblMensaje.Text = "El insumo seleccionado ya fuer agregado";
                    var = 1;
                    break;*/
                }
            }

        }

        if (var == 0)
        {
            //this.lblMensaje.Text = "";
            TipoMedidor ti = new TipoMedidor();

            ti = Datos.getTipoMedidor().traerTipoMedidor(Convert.ToInt32(this.ddlTipoMedidor.SelectedValue));

            listado.Add(ti);

            Session["listaM"] = listado;

            if (listado.Count > 0)
            {
                this.gvMedidor.DataSource = listado;
                this.gvMedidor.DataBind();
                
            }
        }


    }
}
