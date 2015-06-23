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




public partial class Medidor_GenerarOrdenInstalacionMedidor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //me fijo si hay Pedidos de Instalación Pendientes

            List<PedidoInstalacion> pi = Datos.getPedidosInstalacion().buscarPedidosPendientes();

            if (pi.Count > 0)
            {
                gvPedidosInstalacion.Visible = true;
                gvPedidosInstalacion.DataSource = pi;
                gvPedidosInstalacion.DataBind();

                lblNoHayPedidos.Visible = false;

                btnGenerar.Enabled = true;
            }
            else
            {
                gvPedidosInstalacion.Visible = false;
                gvPedidosInstalacion.DataSource = pi;
                gvPedidosInstalacion.DataBind();

                lblNoHayPedidos.Visible = true;

                btnGenerar.Enabled = false;
            }
        }
    }
    protected void rdbPedido_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvPedidosInstalacion.Rows)
        {
            RadioButton pedidoSeleccionado = (RadioButton)row.FindControl("gvPedidosInstalacion_rdbSeleccionado");
            if (pedidoSeleccionado.Checked)
            {
                //tabconteiner1.Visible = true;
                //tabPanel1.Visible = true;
                panelDetalleInstalacion.Visible = true;
                panelOrdenInstalacion.Visible = true;
               

                int idPedido = int.Parse(this.gvPedidosInstalacion.Rows[row.RowIndex].Cells[1].Text);
                ViewState["nroPedido"] = idPedido;

                PedidoInstalacion pedido = Datos.getPedidosInstalacion().getPedidoInstalacion(idPedido);

                this.txtNroSocio.Text = Convert.ToString(pedido.NroSocio);
                
                Socio socio = Datos.getSocios().traerDatosSocio(pedido.NroSocio);
                
                this.txtApellidoSocio.Text = socio.Apellido;
                this.txtNombreSocio.Text = socio.Nombre;

                Domicilio domi = Datos.getPedidosInstalacion().traerDomicilioPedido(idPedido);

                txtCalleInst.Text = domi.NombreCalle;
                txtNroCalleInst.Text = Convert.ToString(domi.NroCalle);
                txtPisoInst.Text = Convert.ToString(domi.Piso);
                txtDeptoInst.Text = domi.Dpto;
                lblZona.Text = domi.Zona;

                Medidor m = Datos.getPedidosInstalacion().traerDatosMedidor(idPedido);

                txtNroMedidor.Text = m.NroMedidor.ToString();
                lblNroFabricacion.Text = m.NroFabricacion;
                txtTipoMedidor.Text = m.TipoMedidor;
            }
        }
    }
    protected void rdbTurno_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvTurno.Rows)
        {
            RadioButton turnoSeleccionado = (RadioButton)row.FindControl("gvTurno_rdbSeleccionado");
            if (turnoSeleccionado.Checked)
            {
                DateTime fechaPedido = Convert.ToDateTime(txtDate.Text);
                int nroGrupo = Datos.getPedidosInstalacion().traerGruposDisponibles(fechaPedido, Convert.ToInt32(gvTurno.Rows[row.RowIndex].Cells[1].Text));

                if (nroGrupo != 0)
                {
                    lblNoGrupoDisponible.Visible = false;
                    grillaGrupoGR.Visible = true;
                    lblGrupo.Visible = true;
                    lblNroGrupoGR.Visible = true;
                    lblNroGrupoGR.Text = nroGrupo.ToString();

                    List<Empleado> listaEmpleados = Datos.getPedidosInstalacion().traerEmpleadosGrupo(Convert.ToInt32(nroGrupo));

                    grillaGrupoGR.DataSource = listaEmpleados;
                    grillaGrupoGR.DataBind();
                }
                else
                {
                    grillaGrupoGR.Visible = false;
                    lblNoGrupoDisponible.Visible = true;
                    lblGrupo.Visible = false;
                    lblNroGrupoGR.Visible = false;
                    lblNroGrupoGR.Text = " ";
                    
                }
                
            }
        }
    }
    protected void txtDate_TextChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow rows in gvTurno.Rows)
        {
            RadioButton turnoSeleccionado1 = (RadioButton)rows.FindControl("gvTurno_rdbSeleccionado");
            if (turnoSeleccionado1.Checked)
            {
                turnoSeleccionado1.Checked = false;
            }
        }
    }
    protected void grillaGrupoGR_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //0:idempleado, 1:fechaalta, 2:fechabaja, 3:idcargo, 4:idtipodocumento, 5:nrodocumento
        //6: idusuario, 7: estado1, 8: apellido, 9: nombre

        e.Row.Cells[0].Visible = false;
        e.Row.Cells[1].Visible = false;
        e.Row.Cells[2].Visible = false;
        e.Row.Cells[3].Visible = false;
        e.Row.Cells[4].Visible = false;
        e.Row.Cells[5].Visible = false;
        e.Row.Cells[6].Visible = false;
        e.Row.Cells[7].Visible = false;
    }
    protected void btnGenerar_Click(object sender, EventArgs e)
    {
        ModalPopupConfirmacion.Show();
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Show();
    }
    protected void btnAceptarRegistrarOrden_Click(object sender, EventArgs e)
    {
        try
        {
            int ultimoNroOrden = Datos.getOrdenInstalacion().obtenerUltimoNroOrden();

            //pongo el Pedido "En Curso" porque tiene Orden de Instalación asociada
            Datos.getPedidosInstalacion().actualizarEstadoPedido(5, Convert.ToInt32(ViewState["nroPedido"]));

            //estados Pedido  1:pendiente (no tiene medidor), 2: asignado (con medidor), 
            //3:finalizado, 4:cancelado, 5: encurso (tiene ordeninstalacion)

            OrdenInstalacionMedidor oi = new OrdenInstalacionMedidor();

            //estados de OrdenInstalacion   1:generada, 2:finalizada
            oi.NroOrden = ultimoNroOrden;
            oi.IdGrupo = Int16.Parse(lblNroGrupoGR.Text);
            oi.IdEstado = 1;
            oi.NroPedido = Convert.ToInt32(ViewState["nroPedido"]);
            oi.FechaInst = Convert.ToDateTime(this.txtDate.Text);

            bool resultado = Datos.getOrdenInstalacion().crearOrdenInstalacion(oi);

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
    protected void btnCancelarRegistrarOrden_Click(object sender, EventArgs e)
    {
        ModalPopupConfirmacion.Hide();
    }
    protected void btnAceptarCancelacionOrden_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/InicioAdministrativo.aspx", true);
    }
    protected void btnCancelarCancelacionOrden_Click(object sender, EventArgs e)
    {
        ModalPopupConfirmacion.Hide();
    }
    protected void btnAceptarConfirmacionOrden_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/InicioAdministrativo.aspx", true);
    }
}
