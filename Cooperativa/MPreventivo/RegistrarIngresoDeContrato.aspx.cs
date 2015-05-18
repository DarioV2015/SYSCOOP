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

public partial class MPreventivo_RegistrarIngresoDeContrato : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {



    }
    protected void txtFechaInicio_Changed(object sender, EventArgs e)
    {

    }
    protected void txtFechaFin_Changed(object sender, EventArgs e)
    {

    }

    protected void rdbXNroContrato_CheckedChanged(object sender, EventArgs e)
    {
        ViewState["tipoContrato"] = "";
        ddlNroContrato.Visible = true;
        ddlProveedor.Visible = false;
        PanelFecha.Visible = false;
        gvContratos.Visible = false;
        gvDatalleContratoHERRAMIENTAS.Visible = false;
        gvDetalleContratoINSUMO.Visible = false;
        gvResumenHerramientas.Visible = false;
        gvResumenInsumos.Visible = false;
        BtnDetalle.Visible = false;
        btnIngresar.Visible = false; 
        
    }
    protected void rdbFecha_CheckedChanged(object sender, EventArgs e)
    {
        ViewState["tipoContrato"] = "";
        PanelFecha.Visible = true;
        ddlProveedor.Visible = false;
        ddlNroContrato.Visible = false;
        gvContratos.Visible = false;
        gvDatalleContratoHERRAMIENTAS.Visible = false;
        gvDetalleContratoINSUMO.Visible = false;
        gvResumenHerramientas.Visible = false;
        gvResumenInsumos.Visible = false;
        BtnDetalle.Visible = false;
        btnIngresar.Visible = false;
    }
    protected void rdbProveedor_CheckedChanged(object sender, EventArgs e)
    {
        ViewState["tipoContrato"] = "";
        ddlProveedor.Visible = true;
        PanelFecha.Visible = false;
        ddlNroContrato.Visible = false;
        gvContratos.Visible = false;
        gvDatalleContratoHERRAMIENTAS.Visible = false;
        gvDetalleContratoINSUMO.Visible = false;
        gvResumenHerramientas.Visible = false;
        gvResumenInsumos.Visible = false;
        BtnDetalle.Visible = false;
        btnIngresar.Visible = false;
    }
    protected void ddlNroContrato_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvContratos.Visible = true;
        lblNroContrato.Text = ddlNroContrato.SelectedValue;
        List<Contrato> listado = new List<Contrato>();
        
        listado = Datos.getContratos().buscarContratoXNro(Convert.ToInt32(ddlNroContrato.SelectedValue));

        if (listado.Count > 0)
        {
            this.gvContratos.DataSource = listado;
            this.gvContratos.DataBind();
        }            
    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        BtnDetalle.Visible = false;
        gvContratos.Visible = true;
        List<Contrato> listado = new List<Contrato>();
       
        if (txtFechaFin.Text == "")
        {

            listado = Datos.getContratos().buscarContratoXFechaInicio(Convert.ToDateTime(txtFechaInicio.Text));
           
            if (listado.Count > 0)
            {
                this.gvContratos.DataSource = listado;
                this.gvContratos.DataBind();
            }
        }
        else
        {
            listado = Datos.getContratos().buscarContratoXFechaInicioYFin(Convert.ToDateTime(txtFechaInicio.Text), Convert.ToDateTime(txtFechaFin.Text));
           
            if (listado.Count > 0)
            {
                this.gvContratos.DataSource = listado;
                this.gvContratos.DataBind();
            }
 
        }
    }
    protected void ddlProveedor_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvContratos.Visible = true;
        BtnDetalle.Visible = false;
        List<Contrato> listado = new List<Contrato>();
        

        listado = Datos.getContratos().buscarContratoXProveedor(Convert.ToInt32(ddlProveedor.SelectedValue));

        if (listado.Count > 0)
        {
            this.gvContratos.DataSource = listado;
            this.gvContratos.DataBind();
        }      

    }

    protected void gvContratos_rdbSeleccionar_CheckedChanged(object sender, EventArgs e)
    {
        int nroContrato;
        String razonSocial;
        DateTime fechaPedido;
        String tipoContrato;
        

        foreach (GridViewRow row in this.gvContratos.Rows)
        {
            RadioButton gvContratos_rdbSeleccionar = (RadioButton)row.FindControl("gvContratos_rdbSeleccionar");
            if (gvContratos_rdbSeleccionar.Checked)
            {
                nroContrato = Convert.ToInt32(row.Cells[1].Text);
                razonSocial = Convert.ToString(row.Cells[2].Text);
                fechaPedido = Convert.ToDateTime(row.Cells[3].Text);
                tipoContrato = Convert.ToString(row.Cells[4].Text);
                Session["NroContrato"]=nroContrato;
                ViewState["proveedor"]=razonSocial;
                ViewState["FechaPedido"]=fechaPedido;
                ViewState["tipoContrato"] = tipoContrato;
                lblNroContrato.Text = Convert.ToString(nroContrato);
                BtnDetalle.Visible = true;

            }
        }
        
        
    }
    
    protected void BtnDetalle_Click(object sender, EventArgs e)
    {
        BtnDetalle.Visible = true;
        
       
        int estadoContrato=Datos.getContratos().getEsdtadoContrato(Convert.ToInt32(Session["NroContrato"]));
        String tipoContrato = Convert.ToString(ViewState["tipoContrato"]);
        if (tipoContrato == "Insumos")
        {
            gvDetalleContratoINSUMO.Visible = true;
            gvDatalleContratoHERRAMIENTAS.Visible = false;
            gvDetalleContratoMedidor.Visible = false;
            if (estadoContrato == 1)
            {
                List<DetalleContrato> lista = new List<DetalleContrato>();
                lista = Datos.getContratos().traerDetallePedidoInsumo(Convert.ToInt32(Session["NroContrato"]));
                gvDetalleContratoINSUMO.DataSource = lista;
                gvDetalleContratoINSUMO.DataBind();
            }
            else
            {
                List<DetalleContrato> lista = new List<DetalleContrato>();
                lista = Datos.getContratos().traerDetallePedidoInsumoPARCIAL(Convert.ToInt32(Session["NroContrato"]));
                gvDetalleContratoINSUMO.DataSource = lista;
                gvDetalleContratoINSUMO.DataBind();
 
            }
        }
        else if (tipoContrato == "Herramientas")
        {
            gvDatalleContratoHERRAMIENTAS.Visible = true;
            gvDetalleContratoINSUMO.Visible = false;
            gvDetalleContratoMedidor.Visible = false;
            if (estadoContrato == 1)
            {
                List<DetalleContrato> lista = new List<DetalleContrato>();
                lista = Datos.getContratos().traerDetallePedidoHerramienta(Convert.ToInt32(Session["NroContrato"]));
                gvDatalleContratoHERRAMIENTAS.DataSource = lista;
                gvDatalleContratoHERRAMIENTAS.DataBind();
            }
            else
            {
                List<DetalleContrato> lista = new List<DetalleContrato>();
                lista = Datos.getContratos().traerDetallePedidoHerramientaPARCIAL(Convert.ToInt32(Session["NroContrato"]));
                gvDatalleContratoHERRAMIENTAS.DataSource = lista;
                gvDatalleContratoHERRAMIENTAS.DataBind();
 
            }
        }
        else if (tipoContrato == "Medidores")
        {
            gvDetalleContratoMedidor.Visible = true;
            gvDatalleContratoHERRAMIENTAS.Visible = false;
            gvDetalleContratoINSUMO.Visible = false;
            if (estadoContrato == 1)
            {
                List<DetalleContrato> lista = new List<DetalleContrato>();
                lista = Datos.getContratos().traerDetallePedidoMedidor(Convert.ToInt32(Session["NroContrato"]));
                gvDetalleContratoMedidor.DataSource = lista;
                gvDetalleContratoMedidor.DataBind();
            }
            else
            {
                List<DetalleContrato> lista = new List<DetalleContrato>();
                lista = Datos.getContratos().traerDetallePedidoHerramientaPARCIAL(Convert.ToInt32(Session["NroContrato"]));
                gvDatalleContratoHERRAMIENTAS.DataSource = lista;
                gvDatalleContratoHERRAMIENTAS.DataBind();

            }
        }
        btnIngresar.Visible = true;
    }
     protected void CheckTotalInsumo_CheckedChanged(object sender, EventArgs e)
     {
        
         foreach (GridViewRow row in this.gvDetalleContratoINSUMO.Rows)
         {
             CheckBox CheckTotalInsumo = (CheckBox)row.FindControl("CheckTotalInsumo");
             TextBox CantParcial = (TextBox)row.FindControl("txtCantidadIngresada");
             if (CheckTotalInsumo.Checked)
             {
                 CantParcial.BackColor = Color.White;
                 CantParcial.Enabled = false;
                 lblMensaje.Text = "";
                 CantParcial.Text = "";

             }
             else 
             {
                 CantParcial.Enabled = true;

             }
         }

     }
     protected void btnIngresar_Click(object sender, EventArgs e)
     {
        
         
         String tipoCon=Convert.ToString(ViewState["tipoContrato"]);
         int detalle;
         int idInsumo;
         int idHerramienta;
         String nombreInsumo;
         String nombreHerramienta;
         float cantidad;
         float cantIngresada;
         float cantRestante;
         int bandera2 = 0;   
         

         DetalleContrato dc;
         List<DetalleContrato> listado = new List<DetalleContrato>();

         if (tipoCon == "Insumos")
         {
             gvResumenHerramientas.Visible = false;
             gvResumenInsumos.Visible = true;
             foreach (GridViewRow row in this.gvDetalleContratoINSUMO.Rows)
             {

                 CheckBox CheckTotalInsumo = (CheckBox)row.FindControl("CheckTotalInsumo");
                 TextBox cantidadIngresada = (TextBox)row.FindControl("txtCantidadIngresada");
                 TextBox lote = (TextBox)row.FindControl("txtNroLoteInsumo");
                 if (bandera2 == 0)
                 {


                     if (CheckTotalInsumo.Checked)
                     {
                         bandera2 = 0;
                         cantidadIngresada.BackColor = Color.White;
                         dc = new DetalleContrato();
                         detalle = Convert.ToInt32(row.Cells[0].Text);
                         idInsumo = Convert.ToInt32(row.Cells[1].Text);
                         nombreInsumo = Convert.ToString(row.Cells[2].Text);
                         cantidad = Convert.ToSingle(row.Cells[3].Text);
                         lblMensaje.Text = "";
                         dc.NroDetalle = detalle;
                         dc.NroInsumo = idInsumo;
                         dc.Cantidad = cantidad;
                         dc.CantidadIngresada = cantidad;
                         dc.CantidadRestante = 0;
                         dc.DescripInsumo = nombreInsumo;
                         listado.Add(dc);
                         Session["ListadoInsumos"] = listado;
                         gvResumenInsumos.DataSource = listado;
                         gvResumenInsumos.DataBind();
                         btnRegistrar.Enabled = true;

                     }
                     else
                     {
                         if (cantidadIngresada.Text == "")
                         {
                             cantidadIngresada.BackColor = Color.Thistle;
                             lblMensaje.Text = "Debe ingresar un cantidad o el total del detalle";
                         }
                         else
                         {
                             dc = new DetalleContrato();
                             detalle = Convert.ToInt32(row.Cells[0].Text);
                             idInsumo = Convert.ToInt32(row.Cells[1].Text);
                             nombreInsumo = Convert.ToString(row.Cells[2].Text);
                             cantidad = Convert.ToSingle(row.Cells[3].Text);
                             cantIngresada = Convert.ToSingle(cantidadIngresada.Text);
                             cantRestante = cantidad - cantIngresada;
                             lblMensaje.Text = "";
                             cantidadIngresada.BackColor = Color.White;
                             if (cantIngresada > cantidad)
                             {
                                 lblMensaje.Text = "La cantidad ingresada debe ser menor o igual a la cantidad pedida";
                                 cantidadIngresada.BackColor = Color.Thistle;
                                 bandera2 = 1;
                             }
                             else
                             {
                                 bandera2 = 0;
                                 lblMensaje.Text = "";
                                 cantidadIngresada.BackColor = Color.White;
                                 dc.NroDetalle = detalle;
                                 dc.NroInsumo = idInsumo;
                                 dc.Cantidad = cantidad;
                                 dc.CantidadIngresada = cantIngresada;
                                 dc.CantidadRestante = cantRestante;
                                 dc.DescripInsumo = nombreInsumo;
                                 listado.Add(dc);
                                 Session["ListadoInsumos"] = listado;
                                 gvResumenInsumos.DataSource = listado;
                                 gvResumenInsumos.DataBind();
                                 btnRegistrar.Enabled = true;
                             }

                         }

                     }

                 }
                 else
                 { break; }
             }

         }
         else if (tipoCon == "Herramientas")
         {
             gvResumenHerramientas.Visible = true;
             gvResumenInsumos.Visible = false;
             foreach (GridViewRow row in this.gvDatalleContratoHERRAMIENTAS.Rows)
             {
                 CheckBox CheckTotalHerramientas = (CheckBox)row.FindControl("CheckTotalHerramientas");
                 TextBox CantIngresadaHerram = (TextBox)row.FindControl("txtCantIngresadaHerram");
                 if (bandera2 == 0)
                 {
                     if (CheckTotalHerramientas.Checked)
                     {
                         bandera2 = 0;
                         lblMensaje.Text = "";
                         CantIngresadaHerram.BackColor = Color.White;
                         dc = new DetalleContrato();
                         detalle = Convert.ToInt32(row.Cells[0].Text);
                         idHerramienta = Convert.ToInt32(row.Cells[1].Text);
                         nombreHerramienta = Convert.ToString(row.Cells[2].Text);
                         cantidad = Convert.ToSingle(row.Cells[3].Text);
                         dc.NroDetalle = detalle;
                         dc.NroHerramienta = idHerramienta;
                         dc.Cantidad = cantidad;
                         dc.CantidadIngresada = cantidad;
                         dc.CantidadRestante = 0;
                         dc.DescripHerramienta = nombreHerramienta;
                         listado.Add(dc);
                         Session["ListadoHerramientas"] = listado;
                         gvResumenHerramientas.DataSource = listado;
                         gvResumenHerramientas.DataBind();
                         btnRegistrar.Enabled = true;

                     }
                     else
                     {
                         if (CantIngresadaHerram.Text == "")
                         {
                             CantIngresadaHerram.BackColor = Color.Thistle;
                             lblMensaje.Text = "Debe ingresar un cantidad o el total del detalle";
                             break;
                         }


                         else
                         {
                             dc = new DetalleContrato();
                             detalle = Convert.ToInt32(row.Cells[0].Text);
                             idHerramienta = Convert.ToInt32(row.Cells[1].Text);
                             nombreHerramienta = Convert.ToString(row.Cells[2].Text);
                             cantidad = Convert.ToSingle(row.Cells[3].Text);
                             cantIngresada = Convert.ToSingle(CantIngresadaHerram.Text);
                             cantRestante = cantidad - cantIngresada;
                             lblMensaje.Text = "";
                             CantIngresadaHerram.BackColor = Color.White;
                             if (cantIngresada > cantidad)
                             {
                                 CantIngresadaHerram.BackColor = Color.Thistle;
                                 lblMensaje.Text = "La cantidad ingresada debe ser menor o igual a la cantidad pedida";
                                 bandera2 = 1;
                             }
                             else
                             {
                                 bandera2 = 0;
                                 lblMensaje.Text = "";
                                 CantIngresadaHerram.BackColor = Color.White;
                                 dc.NroDetalle = detalle;
                                 dc.NroHerramienta = idHerramienta;
                                 dc.Cantidad = cantidad;
                                 dc.CantidadIngresada = cantIngresada;
                                 dc.CantidadRestante = cantRestante;
                                 dc.DescripHerramienta = nombreHerramienta;
                                 listado.Add(dc);
                                 Session["ListadoHerramientas"] = listado;
                                 gvResumenHerramientas.DataSource = listado;
                                 gvResumenHerramientas.DataBind();
                                 btnRegistrar.Enabled = true;
                             }




                         }


                     }
                 }
                 else
                    {break;}

             }
            
         }
         else if (tipoCon == "Medidores")
         {
             gvResumenMedidores.Visible = true;
             gvResumenInsumos.Visible = false;
             gvResumenHerramientas.Visible = false;
             foreach (GridViewRow row in this.gvDetalleContratoMedidor.Rows)
             {
                 CheckBox CheckTotalMedidores = (CheckBox)row.FindControl("CheckTotalMedidores");
                 TextBox CantIngresadaMedidores = (TextBox)row.FindControl("txtCantIngresadaMedidores");
                 if (bandera2 == 0)
                 {
                     if (CheckTotalMedidores.Checked)
                     {
                         bandera2 = 0;
                         lblMensaje.Text = "";
                         CantIngresadaMedidores.BackColor = Color.White;
                         dc = new DetalleContrato();
                         detalle = Convert.ToInt32(row.Cells[0].Text);
                        // idHerramienta = Convert.ToInt32(row.Cells[1].Text);
                         nombreHerramienta = Convert.ToString(row.Cells[1].Text);
                         cantidad = Convert.ToSingle(row.Cells[2].Text);
                         dc.NroDetalle = detalle;
                         //dc.NroHerramienta = idHerramienta;
                         dc.Cantidad = cantidad;
                         dc.CantidadIngresada = cantidad;
                         dc.CantidadRestante = 0;
                         dc.DescripHerramienta = nombreHerramienta;
                         listado.Add(dc);
                         Session["ListadoMedidores"] = listado;
                         gvResumenMedidores.DataSource = listado;
                         gvResumenMedidores.DataBind();
                         btnRegistrar.Enabled = true;

                     }
                     else
                     {
                         if (CantIngresadaMedidores.Text == "")
                         {
                             CantIngresadaMedidores.BackColor = Color.Thistle;
                             lblMensaje.Text = "Debe ingresar un cantidad o el total del detalle";
                             break;
                         }


                         else
                         {
                             dc = new DetalleContrato();
                             detalle = Convert.ToInt32(row.Cells[0].Text);
                             //idHerramienta = Convert.ToInt32(row.Cells[1].Text);
                             nombreHerramienta = Convert.ToString(row.Cells[1].Text);
                             cantidad = Convert.ToSingle(row.Cells[2].Text);
                             cantIngresada = Convert.ToSingle(CantIngresadaMedidores.Text);
                             cantRestante = cantidad - cantIngresada;
                             lblMensaje.Text = "";
                             CantIngresadaMedidores.BackColor = Color.White;
                             if (cantIngresada > cantidad)
                             {
                                 CantIngresadaMedidores.BackColor = Color.Thistle;
                                 lblMensaje.Text = "La cantidad ingresada debe ser menor o igual a la cantidad pedida";
                                 bandera2 = 1;
                             }
                             else
                             {
                                 bandera2 = 0;
                                 lblMensaje.Text = "";
                                 CantIngresadaMedidores.BackColor = Color.White;
                                 dc.NroDetalle = detalle;
                               //  dc.NroHerramienta = idHerramienta;
                                 dc.Cantidad = cantidad;
                                 dc.CantidadIngresada = cantIngresada;
                                 dc.CantidadRestante = cantRestante;
                                 dc.DescripHerramienta = nombreHerramienta;
                                 listado.Add(dc);
                                 Session["ListadoMedidores"] = listado;
                                 gvResumenMedidores.DataSource = listado;
                                 gvResumenMedidores.DataBind();
                                 btnRegistrar.Enabled = true;
                             }




                         }


                     }
                 }
                 else
                 { break; }

             }

         }
     }

     protected void CheckTotalHerramientas_CheckedChanged(object sender, EventArgs e)
     {

         foreach (GridViewRow row in this.gvDatalleContratoHERRAMIENTAS.Rows)
         {
             CheckBox CheckTotalHerramientas = (CheckBox)row.FindControl("CheckTotalHerramientas");
             TextBox CantParcial = (TextBox)row.FindControl("txtCantIngresadaHerram");
             if (CheckTotalHerramientas.Checked)
             {
                 CantParcial.BackColor = Color.White;
                 CantParcial.Enabled = false;
                 lblMensaje.Text = "";
                 CantParcial.Text = "";

             }
             else
             {
                 CantParcial.Enabled = true;

             }
         }

     }

     protected void CheckTotalMedidores_CheckedChanged(object sender, EventArgs e)
     {

         foreach (GridViewRow row in this.gvDetalleContratoMedidor.Rows)
         {
             CheckBox CheckTotalMedidores = (CheckBox)row.FindControl("CheckTotalMedidores");
             TextBox CantParcial = (TextBox)row.FindControl("txtCantIngresadaMedidores");
             if (CheckTotalMedidores.Checked)
             {
                 CantParcial.BackColor = Color.White;
                 CantParcial.Enabled = false;
                 lblMensaje.Text = "";
                 CantParcial.Text = "";

             }
             else
             {
                 CantParcial.Enabled = true;

             }
         }

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
        
        int nroContrato=Convert.ToInt32(Session["NroContrato"]);
        int detalle;
        int idInsumo;
        int idHerramienta;
        String nombreInsumo;
        String nombreHerramienta;
        float cantidad;
        float cantIngresada;
        float cantRestante;
        int nroLote;
        float controlHerramienta = 0;
        float controlInsumo = 0;
        int estado=0;
        int estadocontrato;
        String tipoCon=Convert.ToString(ViewState["tipoContrato"]);

        if (tipoCon == "Insumos")
        {
            foreach (GridViewRow row in this.gvResumenInsumos.Rows)
            {
                detalle = Convert.ToInt32(row.Cells[0].Text);
                idInsumo = Convert.ToInt32(row.Cells[1].Text);
                nombreInsumo = Convert.ToString(row.Cells[2].Text);
                //nroLote = Convert.ToInt32(row.Cells[3].Text);
                cantidad = Convert.ToSingle(row.Cells[3].Text);
                cantIngresada = Convert.ToSingle(row.Cells[4].Text);
                cantRestante = Convert.ToSingle(row.Cells[5].Text);
                controlInsumo += cantRestante;

                if (cantRestante == 0)
                {
                    estado = Datos.getContratos().actualizarEstadoDetalleCOMPLETADO(nroContrato, detalle);
                }
                else
                {
                    estado = Datos.getContratos().actualizarEstadoDetallePARCIAL(nroContrato, detalle, cantRestante);
                }

 
            }
            if (controlInsumo > 0)
            {
                //el contrato todavia no se puede finalizar
                estadocontrato = Datos.getContratos().actualizarEstadoContratoPARCIAL(nroContrato);
            }
            else
            {
                //actualizar estado de contrato a finalizado
                estadocontrato = Datos.getContratos().actualizarEstadoContratoCOMPLETADO(nroContrato);

            }

            if (estado > 0 && estadocontrato > 0)
            {
                Datos.commit();
                Session["Bandera"] = "0";
                Response.Redirect("/Cooperativa/MPreventivo/RegistrarIngresoInsumos.aspx", true);

            }
            
 
        }
        else if (tipoCon == "Herramientas")
        {
            foreach (GridViewRow row in this.gvResumenHerramientas.Rows)
            {
                detalle = Convert.ToInt32(row.Cells[0].Text);
                idHerramienta = Convert.ToInt32(row.Cells[1].Text);
                nombreHerramienta = Convert.ToString(row.Cells[2].Text);
                cantidad = Convert.ToSingle(row.Cells[3].Text);
                cantIngresada = Convert.ToSingle(row.Cells[4].Text);
                cantRestante = Convert.ToSingle(row.Cells[5].Text);
                controlHerramienta += cantRestante;

                if (cantRestante == 0)
                {
                    estado = Datos.getContratos().actualizarEstadoDetalleCOMPLETADO(nroContrato, detalle);
                }
                else
                {
                    estado = Datos.getContratos().actualizarEstadoDetallePARCIAL(nroContrato, detalle, cantRestante);
                }


 
            }
            if (controlHerramienta > 0)
            {
                //el contrato todavia no se puede finalizar
                estadocontrato = Datos.getContratos().actualizarEstadoContratoPARCIAL(nroContrato);
            }
            else
            {
                //actualizar estado de contrato a finalizado
                estadocontrato = Datos.getContratos().actualizarEstadoContratoCOMPLETADO(nroContrato);

            }

            if (estado > 0 && estadocontrato > 0)
            {
                Datos.commit();
                Session["Bandera"] = "0";
                Response.Redirect("/Cooperativa/MPreventivo/RegistrarIngresoHerramientas.aspx", true);
 
            }
            
 
        }
        else if (tipoCon == "Medidores")
        {
            foreach (GridViewRow row in this.gvResumenMedidores.Rows)
            {
                detalle = Convert.ToInt32(row.Cells[0].Text);
                //idHerramienta = Convert.ToInt32(row.Cells[1].Text);
                nombreHerramienta = Convert.ToString(row.Cells[1].Text);
                cantidad = Convert.ToSingle(row.Cells[2].Text);
                cantIngresada = Convert.ToSingle(row.Cells[3].Text);
                cantRestante = Convert.ToSingle(row.Cells[4].Text);
                controlHerramienta += cantRestante;

                if (cantRestante == 0)
                {
                    estado = Datos.getContratos().actualizarEstadoDetalleCOMPLETADO(nroContrato, detalle);
                }
                else
                {
                    estado = Datos.getContratos().actualizarEstadoDetallePARCIAL(nroContrato, detalle, cantRestante);
                }



            }
            if (controlHerramienta > 0)
            {
                //el contrato todavia no se puede finalizar
                estadocontrato = Datos.getContratos().actualizarEstadoContratoPARCIAL(nroContrato);
            }
            else
            {
                //actualizar estado de contrato a finalizado
                estadocontrato = Datos.getContratos().actualizarEstadoContratoCOMPLETADO(nroContrato);

            }

            if (estado > 0 && estadocontrato > 0)
            {
                Datos.commit();
                Session["Bandera"] = "0";
                Response.Redirect("/Cooperativa/Medidor/RegistrarMedidor.aspx", true);

            }


        }


     }
     protected void btnCancelarRegistrar_Click(object sender, EventArgs e)
     {
         ModalPopupConfirmacion.Hide();
     }
     protected void btnAceptarCancelacion_Click(object sender, EventArgs e)
     {
         Datos.rollback();
         Response.Redirect("/Cooperativa/Default.aspx", true);
     }
     protected void btnCancelarCancelacion_Click(object sender, EventArgs e)
     {
         ModalPopupCancelarRegistrar.Hide();
     }
     protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
     {

     }

}





