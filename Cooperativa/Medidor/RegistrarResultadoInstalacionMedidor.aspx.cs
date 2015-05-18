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

public partial class Medidor_RegistrarResultadoInstalacionMedidor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            txtApellido.Enabled = false;
            txtCalle.Enabled = false;
            txtDepto.Enabled = false;
            txtFechaAlta.Enabled = false;
            txtNombre.Enabled = false;
            txtNroCalle.Enabled = false;
            txtNroMedidor.Enabled = false;
            txtNroSocio.Enabled = false;
            txtPiso.Enabled = false;
            txtTipoMedidor.Enabled = false;

          

           
            int nroOIM = Convert.ToInt32(Session["nroOIM"]);

            //gvOrdenInstalacion.DataBind();

            if (nroOIM != 0) //significa que viene de Registrar un Nuevo Tipo de Resultado IM
            {
                foreach (GridViewRow rows in gvOrdenInstalacion.Rows)
                {
                    RadioButton ordenSeleccionada1 = (RadioButton)rows.FindControl("gvOrdenInstalacion_rdbSeleccionado");

                    //recupero la orden seleccionada y muestro el detalle;

                    if (Convert.ToInt32(gvOrdenInstalacion.Rows[rows.RowIndex].Cells[1].Text) == nroOIM)
                        ordenSeleccionada1.Checked = true;

                    foreach (GridViewRow row in gvOrdenInstalacion.Rows)
                    {
                        RadioButton ordenSeleccionada = (RadioButton)row.FindControl("gvOrdenInstalacion_rdbSeleccionado");
                        if (ordenSeleccionada.Checked)
                        {
                            //0:radio, 1:idordeninstalacion, 2:idpedidoinstalacion, 3:fechapedido
                            //4: idgrupogr, 5:descripcion
                 
                            panelDetalleOIM.Visible = true;
                            panelResultadoInstalacion.Visible = true;

                            int idOrden = int.Parse(gvOrdenInstalacion.Rows[row.RowIndex].Cells[1].Text);
                            Session["nroOIM"] = idOrden;

                            ViewState["nroPedidoIM"] = int.Parse(gvOrdenInstalacion.Rows[row.RowIndex].Cells[2].Text);
                            ViewState["nroGrupoGR"] = int.Parse(gvOrdenInstalacion.Rows[row.RowIndex].Cells[4].Text);

                            PedidoInstalacion pedido = Datos.getPedidosInstalacion().getPedidoInstalacion(int.Parse(gvOrdenInstalacion.Rows[row.RowIndex].Cells[2].Text));
                            txtNroMedidor.Text = Convert.ToString(pedido.NroMedidor);
                            ViewState["nroMedidor"] = pedido.NroMedidor;

                            Medidor m = Datos.getMedidores().traerMedidorOIM(Convert.ToInt32(gvOrdenInstalacion.Rows[row.RowIndex].Cells[1].Text));

                            txtNroMedidor.Text = m.NroMedidor;
                            txtNroFabr.Text = m.NroFabricacion;
                            txtNroLote.Text = m.NroLote;
                            txtFechaAlta.Text = m.FechaAlta.ToString("dd/MM/yyyy");
                            txtTipoMedidor.Text = m.TipoMedidor;

                            txtNroSocio.Text = Convert.ToString(pedido.NroSocio);
                            ViewState["nroSocio"] = pedido.NroSocio;

                            Socio socio = Datos.getSocios().traerDatosSocio(pedido.NroSocio);
                            txtApellido.Text = socio.Apellido;
                            txtNombre.Text = socio.Nombre;

                            Domicilio domi = Datos.getDomicilios().getDomicilio2(pedido.IdDomicilio);

                            ViewState["nroDomicilio"] = pedido.IdDomicilio;
                            txtCalle.Text = domi.NombreCalle;
                            txtNroCalle.Text = domi.NroCalle.ToString();
                            txtPiso.Text = domi.Piso.ToString();
                            txtDepto.Text = domi.Dpto;
                            txtZona.Text = domi.Zona;
                            ViewState["nroZona"] = domi.IdZona;
                        }
                    }

                }
            }

        

            //SDSOrdenInst.Select(DataSourceSelectArguments.Empty);
            //gvOrdenInstalacion.DataSource = SDSOrdenInst;
            //gvOrdenInstalacion.DataBind();

        }

        //DatosUsuario datos = (DatosUsuario)Session["datosUsuario"];
        //int nro = Convert.ToInt32(datos.NroGuardia);
        //SDSOrdenInst.SelectParameters["numgrupo"].DefaultValue = nro.ToString();
    }
    protected void rdbOrdenInstalacion_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvOrdenInstalacion.Rows)
        {
            RadioButton ordenSeleccionada = (RadioButton)row.FindControl("gvOrdenInstalacion_rdbSeleccionado");
            if (ordenSeleccionada.Checked)
            {
                //0:radio, 1:idordeninstalacion, 2:idpedidoinstalacion, 3:fechapedido
                //4: idgrupogr, 5:descripcion
        
                panelDetalleOIM.Visible = true;
                panelResultadoInstalacion.Visible = true;
                panelBotones.Visible = true;

                int idOrden = int.Parse(gvOrdenInstalacion.Rows[row.RowIndex].Cells[1].Text);
                Session["nroOIM"] = idOrden;

                ViewState["nroPedidoIM"] = int.Parse(gvOrdenInstalacion.Rows[row.RowIndex].Cells[2].Text);
                ViewState["nroGrupoGR"] = int.Parse(gvOrdenInstalacion.Rows[row.RowIndex].Cells[4].Text);

                PedidoInstalacion pedido = Datos.getPedidosInstalacion().getPedidoInstalacion(int.Parse(gvOrdenInstalacion.Rows[row.RowIndex].Cells[2].Text));
                txtNroMedidor.Text = Convert.ToString(pedido.NroMedidor);
                ViewState["nroMedidor"] = pedido.NroMedidor;

                Medidor m = Datos.getMedidores().traerMedidorOIM(Convert.ToInt32(gvOrdenInstalacion.Rows[row.RowIndex].Cells[1].Text));

                txtNroMedidor.Text = m.NroMedidor;
                txtNroFabr.Text = m.NroFabricacion;
                txtNroLote.Text = m.NroLote;
                txtFechaAlta.Text = m.FechaAlta.ToString("dd/MM/yyyy");
                txtTipoMedidor.Text = m.TipoMedidor;

                txtNroSocio.Text = Convert.ToString(pedido.NroSocio);
                ViewState["nroSocio"] = pedido.NroSocio;

                Socio socio = Datos.getSocios().traerDatosSocio(pedido.NroSocio);
                txtApellido.Text = socio.Apellido;
                txtNombre.Text = socio.Nombre;

                Domicilio domi = Datos.getDomicilios().getDomicilio2(pedido.IdDomicilio);

                ViewState["nroDomicilio"] = pedido.IdDomicilio;
                txtCalle.Text = domi.NombreCalle;
                txtNroCalle.Text = domi.NroCalle.ToString();
                txtPiso.Text = domi.Piso.ToString();
                txtDepto.Text = domi.Dpto;
                txtZona.Text = domi.Zona;
                ViewState["nroZona"] = domi.IdZona;
            }
        }
    }
    protected void comboResultadoInstalacion_SelectedIndexChanged(object sender, EventArgs e)
    {
        TipoResultadoIM t = Datos.getPedidosInstalacion().traerTipoResultadoIM(Convert.ToInt32(ddlResultadoInst.SelectedItem.Value));

        lblDescripcion.Visible = true;
        lblDescripcionResultado.Visible = true;

        lblDescripcionResultado.Text = t.Descripcion;
    }
    protected void btnNuevoTipoResultado_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Medidor/RegistrarTipoResutladoInstalacionMedidor.aspx", false);
    }
    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        ModalPopupRegistrarResultado.Show();
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrarResultado.Show();
    }
    protected void btnAceptarRegistrarResultado_Click(object sender, EventArgs e)
    {
        try
        {
            //Estado de OIM... 1:Generada, 2:Finalizada
            //Cierro la OIM y le actualizo el Resultado definido

            int tipoResultado = Int32.Parse(ddlResultadoInst.SelectedItem.Value);

            int orden = Datos.getOrdenInstalacion().actualizarOrden(2, tipoResultado, Convert.ToInt32(Session["nroOIM"]));

            //Estado de Pedido de Instalación Medidor... 1:Pendiente, 2:Asignado, 3:Finalizado, 4:Cancelado, 5:En Curso
            //Cierro el PIM 

            int estadoPIM = Datos.getPedidosInstalacion().actualizarEstadoPedido(3, Convert.ToInt32(ViewState["nroPedidoIM"]));

            //Estados del Medidor... 1:Disponible, 2:Asignado, 3:Activo
            //actualizo en Medidor el IdSocio, IdDomicilio, IdZona e IdEstadoMedidor

            //FALTA IDLINEA, IDPRIORIDAD, IDCATEGORIA 
            int actualizarMedidor = Datos.getMedidores().actualizarMedidores(Convert.ToInt32(ViewState["nroMedidor"]), Convert.ToInt32(ViewState["nroDomicilio"]), Convert.ToInt32(ViewState["nroSocio"]), 3, Convert.ToInt32(ViewState["nroZona"]));

            //Estados del GGR... 1:Disponible, 2:Fuera de Turno, 3:En Turno, 4:Ocupado, 5:Eliminado
            //Libero el GGR

            Datos.getGrupoGuardiaReclamo().actualizarEstadoGGR(Convert.ToInt32(ViewState["nroGrupoGR"]), 1);

            Datos.commit();

        }
        catch (Exception err)
        {
            Console.WriteLine(err.ToString());
            Datos.rollback();
        }

        ModalPopupRegistrarResultado.Hide();
        ModalPopupExitoResultado.Show();
    }
    protected void btnCancelarRegistrarResultado_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrarResultado.Show();
    }
    protected void btnAceptarCancelacionResultado_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/InicioGuardiaReclamo.aspx", true);
    }
    protected void btnCancelarCancelacionResultado_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrarResultado.Hide();
    }
    protected void btnAceptarConfirmacionResultado_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/InicioGuardiaReclamo.aspx", true);
    }
    protected void gvOrdenInstalacion_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[4].Visible = false;
    }
}
