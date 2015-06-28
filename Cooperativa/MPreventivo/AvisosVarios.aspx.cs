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

public partial class MPreventivo_AvisosVarios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {          
            List<Insumo> listaInsumosPorVencer = (List<Insumo>)Datos.getAvisos().traerInsumosVencidos();

            if (listaInsumosPorVencer.Count == 0)  //no hay insumos por vencer
                panelVencimientoInsumos.Visible = false;
            else
            {
                panelVencimientoInsumos.Visible = true;

                grillaVencimientoInsumos.DataSource = listaInsumosPorVencer;
                grillaVencimientoInsumos.DataBind();
            }

            List<Insumo> listaInsumosSinStock = (List<Insumo>)Datos.getAvisos().traerInsumosFaltaStock();

            if (listaInsumosSinStock.Count == 0)
                panelFaltaStock.Visible = false;
            else
            {
                panelFaltaStock.Visible = false;

                grillaInsumosSinStock.DataSource = listaInsumosSinStock;
                grillaInsumosSinStock.DataBind();
            }

            List<Herramienta> listaHerramientasPorVencer = (List<Herramienta>)Datos.getAvisos().traerHerramientasVencidas();

            if (listaHerramientasPorVencer.Count == 0)
                panelVencimientoHerramientas.Visible = false;
            else
            {
                panelVencimientoHerramientas.Visible = true;

                grillaVencimientoHerramientas.DataSource = listaHerramientasPorVencer;
                grillaVencimientoHerramientas.DataBind();
            }

            List<Medidor> listaStockMedidores = (List<Medidor>)Datos.getAvisos().traerStockMedidores();

            if (listaStockMedidores.Count > 10 || listaStockMedidores.Count == 0) //hay más de 10 medidores en Stock
                panelSinMedidores.Visible = false;
            else
            {
                panelSinMedidores.Visible = true;

                grillaSinMedidores.DataSource = listaStockMedidores;
                grillaSinMedidores.DataBind();
            }
        }
    }
    protected void grillaInsumos_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //0:diferenciaMeses, 1: idinsumo, 2: nombre, 3: cantidad, 4: unidadMedida, 5: vencimiento, 6: btnOcultar

        e.Row.Cells[0].Visible = false;
        e.Row.Cells[1].Visible = false;
        e.Row.Cells[4].Visible = false;
        e.Row.Cells[5].Visible = false;
    }
    protected void grillaVencimientoInsumos_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //0:idinsumo, 1: nombre, 2: especificacion, 3: cantidad, 4: unidad, 5: tipoinsumo, 6:tipoinsumo, 7:fechaVencimiento

        e.Row.Cells[0].Visible = false; 
        e.Row.Cells[2].Visible = false; 
        e.Row.Cells[3].Visible = false;
        e.Row.Cells[4].Visible = false;
        e.Row.Cells[5].Visible = false; 
        e.Row.Cells[6].Visible = false;

        foreach (GridViewRow row in grillaVencimientoInsumos.Rows)
        {
            DateTime fechaVencimiento = Convert.ToDateTime(grillaVencimientoInsumos.Rows[row.RowIndex].Cells[7].Text);
            grillaVencimientoInsumos.Rows[row.RowIndex].Cells[7].Text = fechaVencimiento.ToString("dd/MM/yyyy");
        }
    }
    protected void grillaInsumosSinStock_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //0:idinsumo, 1: nombre, 2: especificacion, 3: cantidad, 4: unidad, 5: tipoinsumo, 6:tipoinsumo, 7:fechaVencimiento

        e.Row.Cells[0].Visible = false;
        e.Row.Cells[2].Visible = false;
        e.Row.Cells[5].Visible = false;
        e.Row.Cells[6].Visible = false;
        e.Row.Cells[7].Visible = false;
    }
    protected void grillaInsumosSinStock2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //0:idinsumo, 1: nombre, 2: cantidad, 3: unidad, 4: btnOcultar

        e.Row.Cells[0].Visible = false;
        e.Row.Cells[3].Visible = false;
    }
    protected void grillaVencimientoHerramientas_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //0:nroHerramienta, 1:Herramienta, 2:FechaIngreso, 3: FechaVencimiento, 4:FechaBaja,
        //5: NroLote, 6: nroTipoHerramienta, 7: descripcionTipo, 8: especificacionTecnica, 9:idEstado

        e.Row.Cells[0].Visible = false;
        e.Row.Cells[2].Visible = false;
        e.Row.Cells[4].Visible = false;
        e.Row.Cells[5].Visible = false;
        e.Row.Cells[6].Visible = false;
        e.Row.Cells[7].Visible = false;
        e.Row.Cells[8].Visible = false;
        e.Row.Cells[9].Visible = false;

        foreach (GridViewRow row in grillaVencimientoHerramientas.Rows)
        {
            DateTime fechaVencimiento = Convert.ToDateTime(grillaVencimientoHerramientas.Rows[row.RowIndex].Cells[3].Text);
            grillaVencimientoHerramientas.Rows[row.RowIndex].Cells[3].Text = fechaVencimiento.ToString("dd/MM/yyyy");
        }
    }
    protected void grillaVencimientoHerramientas2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //0:column1, 1:nroHerramienta, 2:Herramienta, 3:fechaVencimiento, 4:cantidad, 5:btnOcultar

        e.Row.Cells[0].Visible = false;
        e.Row.Cells[1].Visible = false;
        e.Row.Cells[3].Visible = false;
    }
    protected void grillaMedidores_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //0: idtipomedidor, 1: descripcion, 2: txtCantidad, 3: ocultar

        e.Row.Cells[0].Visible = false;
    }

    //VENCIMIENTO DE INSUMOS
    protected void grillaInsumos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "OcultarFila")
        {
            int nroInsumo = Convert.ToInt32(e.CommandArgument);
            
            foreach (GridViewRow row in grillaInsumos.Rows)
            {
                //si el nroInsumo es igual al de la fila seleccionada
                if (Convert.ToInt32(grillaInsumos.Rows[row.RowIndex].Cells[1].Text) == Convert.ToInt32(nroInsumo))
                    grillaInsumos.Rows[row.RowIndex].Visible = false;
            }

            int filasInvisibles = 0;

            foreach (GridViewRow rowis in grillaInsumos.Rows)
            {
                if (rowis.Visible == false)
                    filasInvisibles++;
            }

            if (filasInvisibles == grillaInsumos.Rows.Count)   //significa que no hay ninguna fila visible
            {
                ModalPopupInsumos.Hide();
                grillaInsumos.DataBind();
            }
        }

        foreach (GridViewRow row in grillaInsumos.Rows)
        {
            if (row.Visible == true)
            {
                TextBox cantidad = (TextBox)row.FindControl("txtCantidad");
                cantidad.Focus();
                break;
            }
        }
    }
    protected void btnGenerarPedidoInsumos_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in grillaInsumos.Rows)
        {
            TextBox cantidad = (TextBox)row.FindControl("txtCantidad");
            cantidad.Focus();
            break;
        }

        ModalPopupInsumos.Show();
    }
    protected void btnAceptarPedidoInsumos_Click(object sender, EventArgs e) //popupInsumos
    {
        ModalPopupInsumos.Hide();
        ModalPopupRegistrarInsumos.Show();
    }
    protected void btnCancelarPedidoInsumos_Click(object sender, EventArgs e)   //popupInsumos
    {
        ModalPopupInsumos.Hide();
        grillaInsumos.DataBind();
    }
    protected void btnAceptarRegistrarInsumos_Click(object sender, EventArgs e)
    {
        DatosUsuario datos = (DatosUsuario)Session["datosUsuario"];
        int nroUsuario = Convert.ToInt32(datos.IdUsuario);

        try
        {
            PedidoInsumo pi = new PedidoInsumo();

            pi.NroPedido = Convert.ToInt32(Datos.getAvisos().obtenerUltimoPedidoInsumos());
            pi.Fecha = Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy"));
            pi.Hora = Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss"));
            pi.NroUsuario = nroUsuario;
            pi.Estado = 1; // Generado el Pedido
            pi.TipoPedido = 1; // por Vencimiento

            int nroDETALLE;
            int nroDetalle = Convert.ToInt32(Datos.getAvisos().obtenerUltimoDetallePedidoInsumos());

            if (ViewState["nroDETALLE"] == null)
                nroDETALLE = nroDetalle++;
            else
                nroDETALLE = ((int)(ViewState["nroDETALLE"]));

            List<DetallePedidoInsumo> listaDetallePedido = new List<DetallePedidoInsumo>();

            foreach (GridViewRow row in grillaInsumos.Rows)
            {
                //0:diferenciaMeses, 1: idinsumo, 2: nombre, 3: cantidad, 4: unidadMedida, 5: vencimiento, 6: btnOcultar
                if (row.Visible == true)
                {
                    TextBox cantidad = (TextBox)row.FindControl("txtCantidad");

                    DetallePedidoInsumo dpi = new DetallePedidoInsumo();

                    dpi.NroDetalle = nroDETALLE++;
                    dpi.NroPedido = pi.NroPedido;
                    dpi.NroInsumo = Convert.ToInt32(grillaInsumos.Rows[row.RowIndex].Cells[1].Text);
                    dpi.Cantidad = Convert.ToSingle(cantidad.Text);

                    listaDetallePedido.Add(dpi);
                }
            }

            pi.DetalleInsumos = listaDetallePedido;

            //guardo el PedidoInsumos

            int filasPedido = Convert.ToInt32(Datos.getAvisos().crearPedidoInsumo(pi));

            //guardo el DetallePedidoInsumos

            int filasDetallePedido = Convert.ToInt32(Datos.getAvisos().crearDetallePedidoInsumos(listaDetallePedido));

            Datos.commit();

        }
        catch (Exception err)
        {
            Console.WriteLine(err.ToString());
            Datos.rollback();
        }

        ModalPopupRegistrarInsumos.Hide();
        ModalPopupExitoInsumos.Show();
    }
    protected void btnCancelarRegistrarInsumos_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrarInsumos.Show();
    }
    protected void btnAceptarCancelacionInsumos_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/MPreventivo/AvisosVarios.aspx", true);
    }
    protected void btnCancelarCancelacionInsumos_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrarInsumos.Hide();
    }
    protected void btnAceptarConfirmacionInsumos_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/MPreventivo/InicioJefes.aspx", true);
    }


    //SIN STOCK INSUMOS
    protected void grillaInsumosSinStock2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "OcultarFila")
        {
            int nroInsumo = Convert.ToInt32(e.CommandArgument);

            foreach (GridViewRow row in grillaInsumosSinStock2.Rows)
            {
                //si el nroInsumo es igual al de la fila seleccionada
                if (Convert.ToInt32(grillaInsumosSinStock2.Rows[row.RowIndex].Cells[0].Text) == Convert.ToInt32(nroInsumo))
                    grillaInsumosSinStock2.Rows[row.RowIndex].Visible = false;
            }

            int filasInvisibles = 0;

            foreach (GridViewRow rowis in grillaInsumosSinStock2.Rows)
            {
                if (rowis.Visible == false)
                    filasInvisibles++;
            }

            if (filasInvisibles == grillaInsumosSinStock2.Rows.Count)   //significa que no hay ninguna fila visible
            {
                ModalPopupInsSinStock.Hide();
                grillaInsumosSinStock2.DataBind();
            }
        }

        foreach (GridViewRow row in grillaInsumosSinStock2.Rows)
        {
            if (row.Visible == true)
            {
                TextBox cantidad = (TextBox)row.FindControl("txtCantidadFaltante");
                cantidad.Focus();
                break;
            }
        }
    }
    protected void btnGenerarPedidoInsumosStock_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in grillaInsumosSinStock2.Rows)
        {
            TextBox cantidad = (TextBox)row.FindControl("txtCantidadFaltante");
            cantidad.Focus();
            break;
        }
        
        ModalPopupInsSinStock.Show();
    }
    protected void btnAceptarPedidoInsumosF_Click(object sender, EventArgs e) //popupInsumos
    {
        ModalPopupInsSinStock.Hide();
        ModalPopupRegistrarInsumosF.Show();
    }
    protected void btnCancelarPedidoInsumosF_Click(object sender, EventArgs e)   //popupInsumos
    {
        ModalPopupInsSinStock.Hide();
        grillaInsumosSinStock2.DataBind();
    }
    protected void btnAceptarRegistrarInsumosF_Click(object sender, EventArgs e)
    {
        DatosUsuario datos = (DatosUsuario)Session["datosUsuario"];
        int nroUsuario = Convert.ToInt32(datos.IdUsuario);

        try
        {
            PedidoInsumo pi = new PedidoInsumo();

            pi.NroPedido = Convert.ToInt32(Datos.getAvisos().obtenerUltimoPedidoInsumos());
            pi.Fecha = Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy"));
            pi.Hora = Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss"));
            pi.NroUsuario = nroUsuario;
            pi.Estado = 1; // Generado el Pedido
            pi.TipoPedido = 2; // por Falta de Stock

            int nroDETALLE;
            int nroDetalle = Convert.ToInt32(Datos.getAvisos().obtenerUltimoDetallePedidoInsumos());

            if (ViewState["nroDETALLE"] == null)
                nroDETALLE = nroDetalle++;
            else
                nroDETALLE = ((int)(ViewState["nroDETALLE"]));

            List<DetallePedidoInsumo> listaDetallePedido = new List<DetallePedidoInsumo>();

            foreach (GridViewRow row in grillaInsumosSinStock2.Rows)
            {
                //0:idinsumo, 1: nombre, 2: cantidad, 3: unidad, 4: btnOcultar
                if (row.Visible == true)
                {
                    TextBox cantidad = (TextBox)row.FindControl("txtCantidadFaltante");

                    DetallePedidoInsumo dpi = new DetallePedidoInsumo();

                    dpi.NroDetalle = nroDETALLE++;
                    dpi.NroPedido = pi.NroPedido;
                    dpi.NroInsumo = Convert.ToInt32(grillaInsumosSinStock2.Rows[row.RowIndex].Cells[0].Text);
                    dpi.Cantidad = Convert.ToSingle(cantidad.Text);

                    listaDetallePedido.Add(dpi);
                }
            }

            pi.DetalleInsumos = listaDetallePedido;

            //guardo el PedidoInsumos

            int filasPedido = Convert.ToInt32(Datos.getAvisos().crearPedidoInsumo(pi));

            //guardo el DetallePedidoInsumos

            int filasDetallePedido = Convert.ToInt32(Datos.getAvisos().crearDetallePedidoInsumos(listaDetallePedido));

            Datos.commit();

        }
        catch (Exception err)
        {
            Console.WriteLine(err.ToString());
            Datos.rollback();
        }

        ModalPopupRegistrarInsumosF.Hide();
        ModalPopupExitoInsumosF.Show();
    }
    protected void btnCancelarRegistrarInsumosF_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrarInsumosF.Show();
    }
    protected void btnAceptarCancelacionInsumosF_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/MPreventivo/AvisosVarios.aspx", true);
    }
    protected void btnCancelarCancelacionInsumosF_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrarInsumosF.Hide();
    }
    protected void btnAceptarConfirmacionInsumosF_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/MPreventivo/InicioJefes.aspx", true);
    }

    //VENCIMIENTO HERRAMIENTAS
    protected void grillaVencimientoHerramientas2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "OcultarFila")
        {
            int nroHerramienta = Convert.ToInt32(e.CommandArgument);

            foreach (GridViewRow row in grillaVencimientoHerramientas2.Rows)
            {
                //si el nroHerramienta es igual al de la fila seleccionada
                if (Convert.ToInt32(grillaVencimientoHerramientas2.Rows[row.RowIndex].Cells[1].Text) == Convert.ToInt32(nroHerramienta))
                    grillaVencimientoHerramientas2.Rows[row.RowIndex].Visible = false;
            }

            int filasInvisibles = 0;

            foreach (GridViewRow rowis in grillaVencimientoHerramientas2.Rows)
            {
                if (rowis.Visible == false)
                    filasInvisibles++;
            }

            if (filasInvisibles == grillaVencimientoHerramientas2.Rows.Count)   //significa que no hay ninguna fila visible
            {
                ModalPopupHerramientas.Hide();
                grillaVencimientoHerramientas2.DataBind();
            }
        }

        foreach (GridViewRow row in grillaVencimientoHerramientas2.Rows)
        {
            if (row.Visible == true)
            {
                TextBox cantidad = (TextBox)row.FindControl("txtCantidadHerramienta");
                cantidad.Focus();
                break;
            }
        }
    }
    protected void btnGenerarPedidoHerramientas_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in grillaVencimientoHerramientas2.Rows)
        {
            TextBox cantidad = (TextBox)row.FindControl("txtCantidadHerramienta");
            cantidad.Focus();
            break;
        }

        ModalPopupHerramientas.Show();
    }
    protected void btnAceptarPedidoHerramientas_Click(object sender, EventArgs e) //popupInsumos
    {
        ModalPopupHerramientas.Hide();
        ModalPopupRegistrarHerramientas.Show();
    }
    protected void btnCancelarPedidoHerramientas_Click(object sender, EventArgs e)   //popupInsumos
    {
        ModalPopupHerramientas.Hide();
        grillaVencimientoHerramientas2.DataBind();
    }
    protected void btnAceptarRegistrarHerramientas_Click(object sender, EventArgs e)
    {
        DatosUsuario datos = (DatosUsuario)Session["datosUsuario"];
        int nroUsuario = Convert.ToInt32(datos.IdUsuario);

        try
        {
            PedidoHerramienta ph = new PedidoHerramienta();

            ph.NroPedido = Convert.ToInt32(Datos.getAvisos().obtenerUltimoPedidoHerramientas());
            ph.Fecha = Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy"));
            ph.Hora = Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss"));
            ph.NroUsuario = nroUsuario;
            ph.Estado = 1; // Generado el Pedido
            ph.TipoPedido = 1; // por Vencimiento

            int nroDETALLE;
            int nroDetalle = Convert.ToInt32(Datos.getAvisos().obtenerUltimoDetallePedidoHerramientas());

            if (ViewState["nroDETALLE"] == null)
                nroDETALLE = nroDetalle++;
            else
                nroDETALLE = ((int)(ViewState["nroDETALLE"]));

            List<DetallePedidoHerramienta> listaDetallePedido = new List<DetallePedidoHerramienta>();

            foreach (GridViewRow row in grillaVencimientoHerramientas2.Rows)
            {
                //0:column1, 1:nroHerramienta, 2:Herramienta, 3:fechaVencimiento, 4:cantidad, 5:btnOcultar
                if (row.Visible == true)
                {
                    TextBox cantidad = (TextBox)row.FindControl("txtCantidadHerramienta");

                    DetallePedidoHerramienta dph = new DetallePedidoHerramienta();

                    dph.NroDetalle = nroDETALLE++;
                    dph.NroPedido = ph.NroPedido;
                    dph.NroHerramienta = Convert.ToInt32(grillaVencimientoHerramientas2.Rows[row.RowIndex].Cells[1].Text);
                    dph.Cantidad = Convert.ToSingle(cantidad.Text);

                    listaDetallePedido.Add(dph);
                }
            }

            ph.DetalleHerramientas = listaDetallePedido;

            //guardo el PedidoHerramienta

            int filasPedido = Convert.ToInt32(Datos.getAvisos().crearPedidoHerramienta(ph));

            //guardo el DetallePedidoHerramienta

            int filasDetallePedido = Convert.ToInt32(Datos.getAvisos().crearDetallePedidoHerramientas(listaDetallePedido));

            Datos.commit();

        }
        catch (Exception err)
        {
            Console.WriteLine(err.ToString());
            Datos.rollback();
        }

        ModalPopupRegistrarHerramientas.Hide();
        ModalPopupExitoHerramientas.Show();
    }
    protected void btnCancelarRegistrarHerramientas_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrarHerramientas.Show();
    }
    protected void btnAceptarCancelacionHerramientas_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/MPreventivo/AvisosVarios.aspx", true);
    }
    protected void btnCancelarCancelacionHerramientas_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrarHerramientas.Hide();
    }
    protected void btnAceptarConfirmacionHerramientas_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/MPreventivo/InicioJefes.aspx", true);
    }
    
    //SIN MEDIDORES
    protected void grillaMedidores_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "OcultarFila")
        {
            int nroTipoMedidor = Convert.ToInt32(e.CommandArgument);

            foreach (GridViewRow row in grillaMedidores.Rows)
            {
                //si el nroMedidor es igual al de la fila seleccionada
                if (Convert.ToInt32(grillaMedidores.Rows[row.RowIndex].Cells[0].Text) == Convert.ToInt32(nroTipoMedidor))
                    grillaMedidores.Rows[row.RowIndex].Visible = false;
            }

            int filasInvisibles = 0;

            foreach (GridViewRow rowis in grillaMedidores.Rows)
            {
                if (rowis.Visible == false)
                    filasInvisibles++;
            }

            if (filasInvisibles == grillaMedidores.Rows.Count)   //significa que no hay ninguna fila visible
            {
                ModalPopupMedidores.Hide();
                grillaMedidores.DataBind();
            }
        }

        foreach (GridViewRow row in grillaMedidores.Rows)
        {
            if (row.Visible == true)
            {
                TextBox cantidad = (TextBox)row.FindControl("txtCantidadMedidor");
                cantidad.Focus();
                break;
            }
        }
    }
    protected void btnGenerarPedidoMedidores_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in grillaMedidores.Rows)
        {
            TextBox cantidad = (TextBox)row.FindControl("txtCantidadMedidor");
            cantidad.Focus();
            break;
        }

        ModalPopupMedidores.Show();
    }
    protected void btnAceptarPedidoMedidores_Click(object sender, EventArgs e) //popupInsumos
    {
        ModalPopupMedidores.Hide();
        ModalPopupRegistrarMedidores.Show();
    }
    protected void btnCancelarPedidoMedidores_Click(object sender, EventArgs e)   //popupInsumos
    {
        ModalPopupMedidores.Hide();
        grillaMedidores.DataBind();
    }
    protected void btnAceptarRegistrarMedidores_Click(object sender, EventArgs e)
    {
        DatosUsuario datos = (DatosUsuario)Session["datosUsuario"];
        int nroUsuario = Convert.ToInt32(datos.IdUsuario);

        try
        {
            PedidoMedidor pm = new PedidoMedidor();

            pm.NroPedido = Convert.ToInt32(Datos.getAvisos().obtenerUltimoPedidoMedidores());
            pm.Fecha = Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy"));
            pm.Hora = Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss"));
            pm.NroUsuario = nroUsuario;
            pm.EstadoPedido = 1; // Generado el Pedido
          
            int nroDETALLE;
            int nroDetalle = Convert.ToInt32(Datos.getAvisos().obtenerUltimoDetallePedidoMedidores());

            if (ViewState["nroDETALLE"] == null)
                nroDETALLE = nroDetalle++;
            else
                nroDETALLE = ((int)(ViewState["nroDETALLE"]));

            List<DetallePedidoMedidor> listaDetalleMedidor = new List<DetallePedidoMedidor>();

            foreach (GridViewRow row in grillaMedidores.Rows)
            {
                //0: idtipomedidor, 1: descripcion, 2: txtCantidad, 3: ocultar

                if (row.Visible == true)
                {
                    TextBox cantidad = (TextBox)row.FindControl("txtCantidadMedidor");

                    DetallePedidoMedidor dpm = new DetallePedidoMedidor();

                    dpm.NroDetalle = nroDETALLE++;
                    dpm.NroPedido = pm.NroPedido;
                    dpm.TipoMedidor = Convert.ToInt32(grillaMedidores.Rows[row.RowIndex].Cells[0].Text);
                    dpm.Cantidad = Convert.ToInt32(cantidad.Text);

                    listaDetalleMedidor.Add(dpm);
                }
            }

            pm.DetalleMedidores = listaDetalleMedidor;

            //guardo el PedidoMedidor

            int filasPedido = Convert.ToInt32(Datos.getAvisos().crearPedidoMedidores(pm));

            //guardo el DetallePedidoMedidor

            int filasDetallePedido = Convert.ToInt32(Datos.getAvisos().crearDetallePedidoMedidores(listaDetalleMedidor));

            Datos.commit();

        }
        catch (Exception err)
        {
            Console.WriteLine(err.ToString());
            Datos.rollback();
        }

        ModalPopupRegistrarMedidores.Hide();
        ModalPopupExitoMedidores.Show();
    }
    protected void btnCancelarRegistrarMedidores_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrarMedidores.Show();
    }
    protected void btnAceptarCancelacionMedidores_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/MPreventivo/AvisosVarios.aspx", true);
    }
    protected void btnCancelarCancelacionMedidores_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrarMedidores.Hide();
    }
    protected void btnAceptarConfirmacionMedidores_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/MPreventivo/InicioJefes.aspx", true);
    }
}
