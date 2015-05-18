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

public partial class MPreventivo_RegistrarIngresoInsumos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*List<PedidoInsumo> listaPedido = new List<PedidoInsumo>();
        PedidoInsumo pedido = new PedidoInsumo();
        pedido=Datos*/
       
        int bandera = Convert.ToInt32(Session["Bandera"]);
        if (bandera == 0)
        { 
            float cant;
            String nombreInsumo;
            int idInsumo;
            lblNroContrato.Text = Convert.ToString(Session["NroContrato"]);


            List<DetalleContrato> listado = new List<DetalleContrato>();
            listado = (List<DetalleContrato>)Session["ListadoInsumos"];

            int cantIngresada = Convert.ToInt32(Session["cantIngresadaInsumos"]);

            DataTable dt = new DataTable();
            dt.Columns.Add("NroInsumo", typeof(Int32));
            dt.Columns.Add("DescripInsumo", typeof(string));
            dt.Columns.Add("CantidadIngresada", typeof(float));


            foreach (DetalleContrato detalle in listado)
            {
                nombreInsumo = Convert.ToString(detalle.DescripInsumo);
                idInsumo = Convert.ToInt32(detalle.NroInsumo);
                cant = Convert.ToSingle(detalle.CantidadIngresada);
                
                    dt.Rows.Add(idInsumo, nombreInsumo, cant);
               
            }
            gvDetalle.DataSource = dt;
            gvDetalle.DataBind();
            Session["Bandera"] = "1";
        }
    }

    protected void gvDetalle_rdbSeleccionar_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow row in this.gvDetalle.Rows)
        {
            RadioButton gvDetalle_rdbSeleccionar = (RadioButton)row.FindControl("gvDetalle_rdbSeleccionar");
            if (gvDetalle_rdbSeleccionar.Checked)
            {
                int codInsumo = Convert.ToInt32(row.Cells[1].Text);
                ViewState["CodInsumo"] = codInsumo;
                String descripcion = Convert.ToString(row.Cells[2].Text);
                ViewState["Descrip"] = descripcion;
                float cantIngresada = Convert.ToSingle(row.Cells[3].Text);
                ViewState["CantidadIngresada"] = cantIngresada;
                txtCantIngresada.Text = Convert.ToString(cantIngresada);
            }

        }
    }

    
    protected void txtFechaVenc_Changed(object sender, EventArgs e)
    {

    }
    protected void btnNroLote_Click(object sender, EventArgs e)
    {
        Session["Bandera"] = "1";

        float cant=Convert.ToInt32(txtCantIngresada.Text);
        float cantAIngresar=Convert.ToInt32(txtCantAIngresar.Text);
        DataTable dt = new DataTable();
        dt.Columns.Add("NroInsumo", typeof(Int32));
        dt.Columns.Add("DescripInsumo", typeof(string));
        dt.Columns.Add("CantidadIngresada", typeof(float));
        dt.Columns.Add("Nrolote", typeof(Int32));
        dt.Columns.Add("fechaVenc", typeof(DateTime));
        List<DetallePedidoInsumo> listado = new List<DetallePedidoInsumo>();

        if (cantAIngresar <= cant)
        {
            float cantRestante = cant - cantAIngresar;
            txtCantIngresada.Text = Convert.ToString(cantRestante);
            
            lblMensaje.Text = "";
            txtCantAIngresar.BackColor = Color.White;
            if (gvIngreso.Rows.Count > 0)
            {
                foreach (GridViewRow row in this.gvIngreso.Rows)
                {
                    DetallePedidoInsumo dpi = new DetallePedidoInsumo();
                    dpi.NroInsumo = Convert.ToInt32(row.Cells[0].Text);
                    dpi.DescripInsumo = Convert.ToString(row.Cells[1].Text);
                    dpi.CantidadIngresada = Convert.ToSingle(row.Cells[2].Text);
                    dpi.NroLote = Convert.ToInt32(row.Cells[3].Text);
                    dpi.FechaVenc = Convert.ToDateTime(row.Cells[4].Text);

                    listado.Add(dpi);
                    ViewState["ListadoInsumos"] = listado;

                }
            }

            int codInsum = Convert.ToInt32(ViewState["CodInsumo"]);
            String descripcion = Convert.ToString(ViewState["Descrip"]);
            float cantIngresada = Convert.ToSingle(txtCantAIngresar.Text);
            int nroLote = Convert.ToInt32(txtNroLote.Text);
            DateTime fecha = Convert.ToDateTime(txtFechaVenc.Text);
            DetallePedidoInsumo dpi1 = new DetallePedidoInsumo();
            dpi1.NroInsumo = codInsum;
            dpi1.DescripInsumo = descripcion;
            dpi1.CantidadIngresada = cantIngresada;
            dpi1.NroLote = nroLote;
            dpi1.FechaVenc = fecha;
            listado.Add(dpi1);
            gvIngreso.DataSource = listado;
            gvIngreso.DataBind();
            txtCantAIngresar.Text = "";
            txtNroLote.Text = "";
            txtFechaVenc.Text = "";



        }
        else 
        {
            lblMensaje.Text = "La Cantidad a ingresar debe ser MENOS o IGUAL a la cantidad a REGISTAR";
            txtCantAIngresar.BackColor = Color.Salmon;
        }
            
        }
           
    
 
    protected void btnAceptarRegistrar_Click(object sender, EventArgs e)
    {
        float cantExistente;
        int nroInsumo;
        int nroLote;
        float cantActual;
        DateTime fechaVen;
        int actualizar = 0;
        int crear = 0;

        foreach (GridViewRow row in this.gvIngreso.Rows)
        {
            nroInsumo = Convert.ToInt32(row.Cells[0].Text);
            nroLote = Convert.ToInt32(row.Cells[3].Text);
            fechaVen = Convert.ToDateTime(row.Cells[4].Text);
            cantActual = Convert.ToSingle(row.Cells[2].Text);
            StockInsumo s = Datos.getInsumo().traerStockInsumo(nroLote, nroInsumo);
            if (s.Cantidad > 0)
            {
                cantExistente = s.Cantidad;
                cantExistente = cantExistente + cantActual;
                actualizar = Datos.getInsumo().actualizarStockInsumo(nroInsumo, nroLote, cantActual);
            }
            else
            {
                crear = Datos.getInsumo().crearStockInsumo(nroInsumo, nroLote, cantActual, fechaVen);

            }
            
        }

        if(crear > 0 || actualizar > 0)
        {
            Datos.commit();
            ModalPopupExito.Show();

         }
    }

    

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        int cant = Convert.ToInt32(txtCantIngresada.Text);
        if (cant > 0)
        {
            lblMensaje.Text = "Existen " + cant + " productos no ingresados. Complete el ingreso para continuar";
        }
        else
        {
            lblMensaje.Text = "";
            ModalPopupConfirmacion.Show();

        }
        
    }



    protected void checkSeleccionTodo_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow row in this.gvDetalle.Rows)
        {
            CheckBox CheckInsumo = (CheckBox)row.FindControl("CheckInsumo");
            if (CheckInsumo.Checked)
            { CheckInsumo.Checked = false; }
            else
            { CheckInsumo.Checked = true; }


        }
    }





    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }
    protected void btnCancelarRegistrar_Click(object sender, EventArgs e)
    {

    }
    protected void btnVerDetalle_Click(object sender, EventArgs e)
    {
        int nroPedido = Convert.ToInt32(ViewState["NroPedido"]);         
            
        List<DetallePedidoInsumo> detalle = new List<DetallePedidoInsumo>();
        detalle = Datos.getInsumo().mostrarDetalleInsumo(nroPedido);
        if (detalle.Count > 0)
        {
            gvDetallePedido.DataSource = detalle;
            gvDetallePedido.DataBind();
        }
    }
    protected void CheckPedidoInsumo_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow row in this.gvDetallePedido.Rows)
        {
            CheckBox CheckPedidoInsumo = (CheckBox)row.FindControl("CheckPedidoInsumo");
            TextBox cant = (TextBox)row.FindControl("txtCantIngresada");
            
            if (CheckPedidoInsumo.Checked)
            {
                cant.BackColor = Color.Thistle;
                

            }
        }

    }

    protected void gvPedidosInternosInsumos_rdbSeleccionar_CheckedChanged(object sender, EventArgs e)
    {
        int nroPedido;

        foreach (GridViewRow row in this.gvPedidosInternosInsumos.Rows)
        {
            RadioButton gvPedidosInternosInsumos_rdbSeleccionar = (RadioButton)row.FindControl("gvPedidosInternosInsumos_rdbSeleccionar");
            if (gvPedidosInternosInsumos_rdbSeleccionar.Checked)
            {
                nroPedido = Convert.ToInt32(row.Cells[1].Text);
                ViewState["NroPedido"] = nroPedido;
            }
        }
    }

}

    
