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

public partial class MCorrectivoSesion_RegistrarResultadoMantenimientoCorrectivo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblNoSeleccionadoProblema.Visible = false;

            int nroTipoReclamo = 0;
            int nroZona = 0;

            DatosUsuario datos = (DatosUsuario)Session["datosUsuario"];
            int nroGrupo = Convert.ToInt32(datos.NroGuardia);
            ViewState["grupo"] = Convert.ToInt32(nroGrupo);
            int nroUsuario = Convert.ToInt32(datos.IdUsuario);
            ViewState["nroUsuario"] = nroUsuario;

            OrdenTrabajoCorrectivo otc1 = Datos.getOTC().verSIOTCaFinalizar(nroGrupo);
            int nroOTC = Convert.ToInt32(otc1.NroOTC);
            ViewState["nroOTC"] = nroOTC;

            if (nroOTC != 0)  //hay OTC asignadas al Grupo
            {
                lblNOHayOTC.Visible = false;
                panelDetalleOTC.Visible = true;
                panelDetalle.Visible = true;
                panelVolver.Visible = false;
                panelRegistrar.Visible = true;
         
                OrdenTrabajoCorrectivo otc = Datos.getOTC().traerOTCaFinalizar(Convert.ToInt32(ViewState["grupo"]), nroOTC); //***

                DateTime fecha = Convert.ToDateTime(otc.FechaInicio); //la uso al final
                ViewState["fecha"] = fecha;

                lblFechaCreacion.Text = otc.FechaInicio.ToString("dd/MM/yyyy");
                lblHoraCreacion.Text = otc.HoraInicio.ToString("HH:mm");
                lblCalle.Text = otc.NombreCalle;
                lblNroCalle.Text = otc.NroCalle.ToString();
                lblPiso.Text = otc.Piso.ToString();
                lblDpto.Text = otc.Dpto;
                lblZona.Text = otc.Zona;

                sdsReclamos.SelectParameters["nroOrden"].DefaultValue = Convert.ToInt32(ViewState["nroOTC"]).ToString();

                foreach (GridViewRow row in grillaReclamos.Rows)
                {
                    nroTipoReclamo = Convert.ToInt32(grillaReclamos.Rows[row.RowIndex].Cells[6].Text);
                    nroZona = Convert.ToInt32(grillaReclamos.Rows[row.RowIndex].Cells[12].Text);
                    ViewState["nroTipoReclamo"] = Convert.ToInt32(nroTipoReclamo);
                }

                sdsProblemas.SelectParameters["tiporeclamo"].DefaultValue = nroTipoReclamo.ToString();
                sdsProblemas.SelectParameters["zona"].DefaultValue = nroZona.ToString();

                if (gvProblemas.Rows.Count <= 0) //significa que no encontró problemas y soluciones para ese tipo, entonces muestro todos los problemas
                {
                    //Table tableProblemas = (Table) Page.FindControl("tablaProblemas");

                    gvProblemas.Visible = false;
                    gvProblemasTodos.Visible = true;
                }
                else
                {
                    gvProblemas.Visible = true;
                    gvProblemasTodos.Visible = false;
                }

                foreach (GridViewRow row in gvProblemas.Rows)
                {
                    RadioButton rdbProblema = (RadioButton)row.FindControl("gvProblemas_rdbSeleccionado");
                    if (!rdbProblema.Checked)
                    {
                        lblNoSeleccionadoProblema.Visible = true;
                        lblNoSeleccionadoProblema.Text = "No ha seleccionado ningún problema";
                        //nroProblema = Convert.ToInt32(row.Cells[2].Text);
                    }
                }

                foreach (GridViewRow row in gvProblemasTodos.Rows)
                {
                    RadioButton rdbProblema = (RadioButton)row.FindControl("gvProblemasTodos_rdbSeleccionado");
                    if (!rdbProblema.Checked)
                    {
                        lblNoSeleccionadoProblema.Visible = true;
                        lblNoSeleccionadoProblema.Text = "No ha seleccionado ningún problema";
                        //nroProblema = Convert.ToInt32(row.Cells[2].Text);
                    }
                }
            }
            else
            {
                panelDetalleOTC.Visible = false;
                panelDetalle.Visible = false;
                lblNOHayOTC.Visible = true;
                lblNOHayOTC.Text = "No hay ninguna OTC para finalizar";
            }
            
            
            if (ViewState["TiempoResolucion"] != null && ViewState["TiempoTipoReclamo"] != null)
            {
                lblTiempoResolucion.Text = ViewState["TiempoResolucion"].ToString();
                lblTiempoTipoReclamo.Text = ViewState["TiempoTipoReclamo"].ToString();
            }
        
        }

        grillaDetalleOTC.Visible = false;
    }
    protected void gvProblemas_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[2].Visible = false;
    }
    protected void gvProblemasTodos_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[2].Visible = false;
    }
    protected void grillaSoluciones_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[2].Visible = false;
    }
    protected void grillaSolucionesTodas_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[2].Visible = false;
    }
    protected void rdbProblema_CheckedChanged(object sender, EventArgs e)
    {
        int nroProblema;
        string nombreProblema;
        lblNoSeleccionadoProblema.Visible = false;

        foreach (GridViewRow row in gvProblemas.Rows)
        {
            RadioButton rdbProblema = (RadioButton)row.FindControl("gvProblemas_rdbSeleccionado");
            if (rdbProblema.Checked)
            {
                nroProblema = Convert.ToInt32(row.Cells[2].Text);
                ViewState["nroProblema"] = nroProblema;
                nombreProblema = row.Cells[1].Text;
                ViewState["nombreProblema"] = nombreProblema;
                sdsSoluciones.SelectParameters["problema"].DefaultValue = nroProblema.ToString();
            }
        }

        if (grillaSoluciones.Rows.Count <= 0) // si no hay soluciones para ese problema, muestro todas las soluciones
        {
            grillaSoluciones.Visible = false;
            grillaSolucionesTodas.Visible = true;
            lblNoSolucionesEspecificas.Visible = true;
            lblNoSolucionesEspecificas.Text = "No hay soluciones específicas para el Problema: " + ViewState["nombreProblema"] + ".";
        }
        else
        {
            grillaSoluciones.Visible = true;
            grillaSolucionesTodas.Visible = false;
            lblNoSolucionesEspecificas.Visible = false;
        }
    }
    protected void rdbProblemaTodos_CheckedChanged(object sender, EventArgs e)
    {
        int nroProblema;
        string nombreProblema;
        lblNoSeleccionadoProblema.Visible = false;

        foreach (GridViewRow row in gvProblemasTodos.Rows)
        {
            RadioButton rdbProblema = (RadioButton)row.FindControl("gvProblemasTodos_rdbSeleccionado");
            if (rdbProblema.Checked)
            {
                nroProblema = Convert.ToInt32(row.Cells[2].Text);
                ViewState["nroProblema"] = nroProblema;
                nombreProblema = row.Cells[1].Text;
                ViewState["nombreProblema"] = nombreProblema;
                sdsSoluciones.SelectParameters["problema"].DefaultValue = nroProblema.ToString();
            }
        }


        if (grillaSoluciones.Rows.Count <= 0) // si no hay soluciones para ese problema, muestro todas las soluciones
        {
            grillaSoluciones.Visible = false;
            grillaSolucionesTodas.Visible = true;
            lblNoSolucionesEspecificas.Visible = true;
            lblNoSolucionesEspecificas.Text = "No hay soluciones específicas para el Problema: " + ViewState["nombreProblema"] + ".";
        }
        else
        {
            grillaSoluciones.Visible = true;
            grillaSolucionesTodas.Visible = false;
            lblNoSolucionesEspecificas.Visible = false;
        }
    }
    protected void chkSolucion_CheckedChanged(object sender, EventArgs e)
    {
        foreach(GridViewRow row in grillaSoluciones.Rows)
        {
            CheckBox checkSolucion = (CheckBox)row.FindControl("chkSolucion");

            if (checkSolucion.Checked)
            {
                btnCargarPYS.Enabled = true;
                break;
            }
            else
                btnCargarPYS.Enabled = false;
        }
    }
    protected void chkSolucionTodas_CheckedChanged(object sender, EventArgs e)
    {
        foreach(GridViewRow row in grillaSolucionesTodas.Rows)
        {
            CheckBox checkSolucion = (CheckBox)row.FindControl("chkSolucionTodas");

            if (checkSolucion.Checked)
            {
                btnCargarPYS.Enabled = true;
                break;
            }
            else
                btnCargarPYS.Enabled = false;
        }
    }
    protected void chkInsumo_CheckedChanged(object sender, EventArgs e)
    {
        ModalPopupInsumos.Show();

        TextBox cantidad = null;
        CheckBox chkAll = null;


        foreach (GridViewRow row in grillaInsumos.Rows)
        {
            chkAll = (CheckBox)row.FindControl("chkInsumo");

            if (row.RowType == DataControlRowType.DataRow)
            {
                bool isChecked = row.Cells[0].Controls.OfType<CheckBox>().FirstOrDefault().Checked;
                for (int i = 1; i < row.Cells.Count; i++)
                {
                    if (isChecked)
                    {
                        cantidad = (TextBox)row.Cells[4].FindControl("txtCantidad");
                        cantidad.Visible = true;
                        cantidad.Focus();
                        cantidad.ReadOnly = false;
                    }
                    else
                    {
                        cantidad = (TextBox)row.Cells[4].FindControl("txtCantidad");
                        cantidad.Visible = false;
                    }
                 
                }
            }
        }
    }
    protected void btnCargarInsumos_Click(object sender, EventArgs e)
    {
        int nroDETALLE;
        int nroDETALLEINSUMO;
        int nroOTC = Convert.ToInt32(ViewState["nroOTC"]);

        List<DetalleOTC> listaDetalleOTC;

        if (ViewState["listadoDetalleOTC"] == null)
        {
            listaDetalleOTC = new List<DetalleOTC>();
        }
        else
        {
            listaDetalleOTC = (List<DetalleOTC>)ViewState["listadoDetalleOTC"];
        }

        int det = Convert.ToInt32(Datos.getOTC().obtenerUltimoDetalleOTC());

        if (ViewState["nroDETALLE"] == null)
            nroDETALLE = det++;
        else
            nroDETALLE = ((int)(ViewState["nroDETALLE"]));


        ViewState["nroDETALLE"] = nroDETALLE;

        List<DetalleInsumo> listaDetalleInsumo = new List<DetalleInsumo>();

        int nroDetalleInsumo = Convert.ToInt32(Datos.getOTC().obtenerUltimoDetalleInsumo());

        if (ViewState["nroDETALLEINSUMO"] == null)
            nroDETALLEINSUMO = nroDetalleInsumo++;
        else
            nroDETALLEINSUMO = ((int)(ViewState["nroDETALLEINSUMO"]));

        ViewState["nroDETALLEINSUMO"] = nroDETALLEINSUMO;

        //1º verifico si el stock ingresado es correcto
       
        List<DetalleInsumo> detalleInsumoLista =  new List<DetalleInsumo>();

        foreach (GridViewRow rowi in grillaInsumos.Rows)
        {
            CheckBox chkInsumo = (CheckBox)rowi.FindControl("chkInsumo");
            TextBox canti = (TextBox)rowi.FindControl("txtCantidad");
            DetalleInsumo di;

            if (chkInsumo.Checked)
            {
                di = new DetalleInsumo();

                di.NroDetalleOTC = nroDETALLE++;
                //ViewState["numeroDetalleOTC"] = di.NroDetalleOTC;  //se lo paso luego al Detalle de la OTC

                di.NroDetalleInsumo = nroDETALLEINSUMO++;
                di.NroInsumo = Convert.ToInt32(grillaInsumos.Rows[rowi.RowIndex].Cells[1].Text);
                di.Insumo = grillaInsumos.Rows[rowi.RowIndex].Cells[2].Text;
                di.Cantidad = Convert.ToSingle(canti.Text);
                di.UnidadMedida = grillaInsumos.Rows[rowi.RowIndex].Cells[4].Text;
                di.NroOTC = nroOTC;
                di.TipoInsumo = Convert.ToInt32(grillaInsumos.Rows[rowi.RowIndex].Cells[5].Text);
                di.Especificacion = Convert.ToSingle(grillaInsumos.Rows[rowi.RowIndex].Cells[6].Text);

                detalleInsumoLista.Add(di);         
            }
        }

        float cantidadUsada = 0;
        float cantidadTotal = 0;
        bool noStock = false;

        foreach (DetalleInsumo d in detalleInsumoLista)
        {
            float stockActual = Convert.ToSingle(Datos.getOTC().devolverStockInsumo(d.NroInsumo));

            if (d.TipoInsumo == 1) // tipo cuantificable
            {
                if (d.Cantidad <= stockActual)
                    lblNoStockCuantificable.Visible = false;
                else
                {
                    lblNoStockCuantificable.Visible = true;
                    lblNoStockCuantificable.Text = "El stock disponible de " + d.Insumo + " es de " + stockActual;
                    noStock = true;
                }
            }
            else //tipo 2, cantidad acumulable (rollos)
            {
                cantidadUsada += d.Cantidad;

                int especificacion =  Convert.ToInt32(Datos.getOTC().devolverEspecificacion(d.NroInsumo));

                cantidadTotal = Convert.ToSingle(Datos.getOTC().verificarSuperaEspecificacion(cantidadUsada, d.NroInsumo));
                
                //cantidad + sobrante (si hubiera de antes)
                float cantidad = cantidadTotal / especificacion;

                //me fijo si la cantidad + la sobrante supera el stock disponible
                
                if (cantidad <= stockActual)
                    lblNoStockNoCuantificable.Visible = false;
                else
                {
                    float cantidad1 = (especificacion * stockActual);
                    lblNoStockNoCuantificable.Visible = true;
                    lblNoStockNoCuantificable.Text = "El stock disponible de " + d.Insumo + " es de " + cantidad1 + " " + d.UnidadMedida;
                    noStock = true;
                }
             }
        }

        if (noStock)
        {
            ModalPopupInsumos.Show();
            return;
        }

        DetalleOTC detalle;

        //recorro los insumos para cargarlos al Detalle de Insumo de la OTC
        foreach (GridViewRow rowi in grillaInsumos.Rows)
        {
            CheckBox checkInsumo = (CheckBox)rowi.FindControl("chkInsumo");
            TextBox cantidad = (TextBox)rowi.FindControl("txtCantidad");
            DetalleInsumo di;
            
            //int nroDetalleDeOrden = Convert.ToInt32(ViewState["nroDETALLE"]);
            //int nroDetalleDeInsumo = Convert.ToInt32(ViewState["nroDETALLEINSUMO"]);

            //int det = Convert.ToInt32(Datos.getOTC().obtenerUltimoDetalleOTC());

            if (checkInsumo.Checked)
            {
                di = new DetalleInsumo();
                detalle = new DetalleOTC();

                di.NroDetalleOTC = nroDETALLE++;
                //ViewState["numeroDetalleOTC"] = di.NroDetalleOTC;  //se lo paso luego al Detalle de la OTC

                di.NroDetalleInsumo = nroDETALLEINSUMO++;
                di.NroInsumo = Convert.ToInt32(grillaInsumos.Rows[rowi.RowIndex].Cells[1].Text);
                di.Insumo = grillaInsumos.Rows[rowi.RowIndex].Cells[2].Text;
                di.Cantidad = Convert.ToSingle(cantidad.Text);
                di.UnidadMedida = grillaInsumos.Rows[rowi.RowIndex].Cells[4].Text;
                di.NroOTC = nroOTC;
                di.TipoInsumo = Convert.ToInt32(grillaInsumos.Rows[rowi.RowIndex].Cells[5].Text);
                di.Especificacion = Convert.ToSingle(grillaInsumos.Rows[rowi.RowIndex].Cells[6].Text);

                listaDetalleInsumo.Add(di);         
            }
        }


        grillaInsumosFinal.DataSource = listaDetalleInsumo;
        grillaInsumosFinal.DataBind();
        grillaInsumosFinal.Visible = true;

        ViewState["listadoDetalleInsumos"] = listaDetalleInsumo;
        //ViewState["listadoSoluciones"] = listaSoluciones;

        //recorro los Insumos para agregarlos al Detalle de la OTC

        // 0: check - 1: idinsumo - 2: nombre - 3: cantidad - 4: unidadMedida
        List<Insumo> listaInsumos = new List<Insumo>();

        foreach (GridViewRow r in grillaInsumos.Rows)
        {
            CheckBox checkInsumo = (CheckBox)r.FindControl("chkInsumo");
            TextBox cantidad = (TextBox)r.FindControl("txtCantidad");

            if (checkInsumo.Checked)
            {
                Insumo insu = new Insumo();

                insu.NroInsumo = Convert.ToInt32(grillaInsumos.Rows[r.RowIndex].Cells[1].Text);
                insu.Nombre = grillaInsumos.Rows[r.RowIndex].Cells[2].Text;
                insu.Cantidad = Convert.ToInt32(cantidad.Text);
                insu.UnidadMedida = grillaInsumos.Rows[r.RowIndex].Cells[4].Text;
                insu.IdTipoInsumo = Convert.ToInt32(grillaInsumos.Rows[r.RowIndex].Cells[5].Text);
                insu.Especificacion = Convert.ToSingle(grillaInsumos.Rows[r.RowIndex].Cells[6].Text);
                
                listaInsumos.Add(insu);
            }
        }

        ViewState["listadoInsumos"] = listaInsumos;


        //detalleOTC: nroDetalle, nroOTC, nroProblema, nroSolucion, nroHerramienta,
        //nombreHerramienta, nroTipoHerramienta, descripcionTipoHerramienta, listaInsumos, listaSoluciones


        List<PYS> problemasYSoluciones = (List<PYS>)ViewState["listadoProblemasYSoluciones"];

        listaDetalleOTC = new List<DetalleOTC>();

        int nroDetOTC = Convert.ToInt32(Datos.getOTC().obtenerUltimoDetalleOTC());

        foreach (PYS p in problemasYSoluciones)
        {
            detalle = new DetalleOTC();

            detalle.NroDetalle = nroDetOTC++;

            detalle.NroOTC = nroOTC;

            //detalle.ListaProbYSol = (List<PYS>)ViewState["listadoProblemasYSoluciones"];

            detalle.NroProblema = Convert.ToInt32(p.NroProblema);
            detalle.NroSolucion = Convert.ToInt32(p.NroSolucion);

            // detalle.ListaInsumos = (List<Insumo>)ViewState["listadoInsumos"];

            listaDetalleOTC.Add(detalle);

        }

        grillaDetalleOTC.DataSource = listaDetalleOTC;
        grillaDetalleOTC.DataBind();
        //grillaDetalleOTC.Visible = true;

        ViewState["listadoDetalleOTC"] = listaDetalleOTC;

        //limpio la selección de Insumos
        //foreach (GridViewRow row in grillaInsumos.Rows)
        //{
        //    CheckBox chekInsumo = (CheckBox)row.FindControl("chkInsumo");
        //    TextBox cantidad = (TextBox)row.FindControl("txtCantidad");

        //    if (chekInsumo.Checked)
        //    {
        //        chekInsumo.Checked = false;
        //        cantidad.Text = " ";
        //        cantidad.Visible = false;
        //    }
        //}

        

    }
    protected void btnCargarHerramientas_Click(object sender, EventArgs e)
    {
        int nroOTC = Convert.ToInt32(ViewState["nroOTC"]);
        
        List<HerramientaPorOTC> listadoHerramientas = new List<HerramientaPorOTC>();
        int nroDetalle = Convert.ToInt32(Datos.getOTC().obtenerUltimoDetalleHerrXOTC());
        CheckBox checkHerramienta = null;

        foreach(GridViewRow row in grillaHerramientas.Rows)
        {
            checkHerramienta = (CheckBox)row.FindControl("chkHerramienta");

            if (checkHerramienta.Checked)
            {
                HerramientaPorOTC h = new HerramientaPorOTC();

                h.NroDetalleHerramienta = nroDetalle++;
                h.NroOTC = nroOTC;
                h.NroHerramienta = Convert.ToInt32(grillaHerramientas.Rows[row.RowIndex].Cells[1].Text);
                h.Nombre = grillaHerramientas.Rows[row.RowIndex].Cells[2].Text;
                h.TipoHerramienta = grillaHerramientas.Rows[row.RowIndex].Cells[3].Text;

               
                listadoHerramientas.Add(h);
            }
        }

        grillaHerramientasFinal.DataSource = listadoHerramientas;
        grillaHerramientasFinal.DataBind();
        grillaInsumosFinal.Visible = true;

        ViewState["listadoHerramientas"] = listadoHerramientas;

        //limpio la selección de Herramientas

        //foreach (GridViewRow row in grillaHerramientas.Rows)
        //{
        //    CheckBox chekHerramienta = (CheckBox)row.FindControl("chkHerramienta");

        //    if (chekHerramienta.Checked)
        //    {
        //        chekHerramienta.Checked = false;
        //    }
        //}
    }
    protected void btnNuevoProblema_Click(object sender, EventArgs e)
    {
        int resultado = 1;
        Session["vieneDeRegistrarResultado"] = resultado;
        Response.Redirect("/Cooperativa/MCorrectivoSesion/RegistrarProblema.aspx", true);
    }
    protected void imHerramienta_Click(object sender, EventArgs e)
    {
        ModalPopupHerramientas.Show();
    }
    protected void imInsumo_Click(object sender, EventArgs e)
    {
        btnRegistrarResultado.Enabled = true;

        int nroSolucion;

        foreach (GridViewRow row in grillaSoluciones.Rows)
        {
            CheckBox checkSolucion = (CheckBox)row.FindControl("chkSolucion");

            if (checkSolucion.Checked)
            {
                nroSolucion = Convert.ToInt32(row.Cells[2].Text);
                ViewState["solucion"] = nroSolucion;

                ModalPopupInsumos.Show();
            }
        }
    }
    protected void gvPYSOTC_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        // /*   gvPYSOTC 

        //0 nroProblema
        //1 nombreProblema
   
        //2 nroSolucion
        //3 nombreSolucion --
     
        //4 botonEliminar--*/

        e.Row.Cells[0].Visible = false;
        e.Row.Cells[1].Visible = false;
        e.Row.Cells[2].Visible = false;

        //if (e.Row.RowType == DataControlRowType.Header)
        //{
        //    e.Row.Cells[5].Text = "Soluciones";
        //}
    }
    protected void grillaInsumosFinal_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        /* 0 nroDetalleInsumo
         * 1 nroDetalleOTC
         * 2 nroOTC
         * 3 nroInsumo
         * 4 insumo--
         * 5 cantidad--
         * 6 unidadMedidad--
         * 7 tipoInsumo
         * 8 especificación
         * 9 botonEliminar-- */


        e.Row.Cells[0].Visible = false;
        e.Row.Cells[1].Visible = false;
        e.Row.Cells[2].Visible = false;
        e.Row.Cells[3].Visible = false;
        e.Row.Cells[6].Visible = false;
        e.Row.Cells[7].Visible = false;
        e.Row.Cells[8].Visible = false;
    }
    protected void grillaHerramientasFinal_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        /* 0 nroDetalleHerramienta
         * 1 nroOTC
         * 2 nroHerramienta
         * 3 nombre--
         * 4 tipoHerramienta--*/

        e.Row.Cells[0].Visible = false;
        e.Row.Cells[1].Visible = false;
        e.Row.Cells[2].Visible = false;


        //if (e.Row.RowType == DataControlRowType.Header)
        //{
        //    e.Row.Cells[3].Text = "Herramienta";
        //    e.Row.Cells[4].Text = "Tipo";
        //}
    }
    protected void btnRegistrarResultado_Click(object sender, EventArgs e)
    {
        ModalPopupRegistrar.Show();        
    }
    protected void btnCancelarResultado_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Show();
    }
    protected void btnAceptarRegistrar_Click(object sender, EventArgs e)
    {
        int nroOTC = Convert.ToInt32(ViewState["nroOTC"]);

        /*busco la OTC para cambiarle
        * fechaFin - estadoOT - horaFin - idUsuario - tiempoResolucion*/

        DateTime fechaFinDate = Convert.ToDateTime(DateTime.Now.ToString());
        int estado = 3; // finalizada
        DateTime horaFin = Convert.ToDateTime(DateTime.Now.ToString());
        DateTime fechaInicio = Convert.ToDateTime(ViewState["fecha"]);

        try
        {
            //finalizo el Reclamo, estado 3 Finalizado
            int reclamo = Datos.getOTC().actualizarReclamoAFinalizado(nroOTC);

            //me fijo si el GGR tiene alguna otra OTC Pendiente 

            int nroOTCPendiente = Datos.getGrupoGuardiaReclamo().verificarOTCPendienteGrupo(Convert.ToInt32(ViewState["grupo"]));

            if (nroOTCPendiente != 0)
            {
                lblOTCPendiente.Text = "Nueva OTC asignada Nº: " + nroOTCPendiente;
                //seteo el estado de la OTC como "En Curso"
                Datos.getOTC().actualizarEstadoOTC(Convert.ToInt32(nroOTCPendiente), 1);
            }
            else //pongo al GGR en estado 1, Disponible
            {
                lblOTCPendiente.Text = "";
                int grupo = Datos.getOTC().liberarGrupoGR(Convert.ToInt32(ViewState["grupo"]));
            }
            
            //calculo el tiempo de Resolución de la OTC, todo en MINUTOS!!!

            float duracionEnMinutos = Convert.ToSingle(Datos.getOTC().calcularTiempoResolucion(nroOTC, fechaFinDate));

            float div = duracionEnMinutos / 60; //duracion en horas 
            
            int HORAS = Convert.ToInt32(Math.Floor(div));
            float c = div - HORAS; //obtengo la parte decimal para pasarla a minutos
            int MINUTOS = Convert.ToInt32(Math.Floor(c * 60));

            int DIAS;

            string tiempoResolucion;


            if (div > 24)
            {
                float fl = div / 24;
                DIAS = Convert.ToInt32(Math.Floor(fl));
                float residuoDias = fl - DIAS; // obtengo la parte decimal para pasarla a horas
                float hoo = residuoDias * 24;
                int hor = Convert.ToInt32(Math.Floor(residuoDias * 24)); //horas
                float decim = hoo - hor; //obtengo la parte decimal para pasarl a minutos
                int min = Convert.ToInt32(Math.Floor(decim * 60)); //minutos

                tiempoResolucion = "El Tiempo de Resolución de la OTC fue de " + DIAS.ToString() + " día/s " + hor.ToString() + " hora/s " + min.ToString() + " minuto/s";
            }
            else
            {
                if (HORAS >= 1)
                     tiempoResolucion = "El Tiempo de Resolución de la OTC fue de " + HORAS.ToString() + " hora/s " + MINUTOS.ToString() + " minuto/s";
                else
                     tiempoResolucion = "El Tiempo de Resolución de la OTC fue de " + MINUTOS.ToString() + " minuto/s";
            }

            ViewState["TiempoResolucion"] = tiempoResolucion.ToString();

            int nroUsuario = Convert.ToInt32(ViewState["nroUsuario"]);

            //finalizo la OTC, estado 3 Finalizada
            int orden = Datos.getOTC().actualizarOTC(nroOTC, fechaFinDate, estado, horaFin, nroUsuario, duracionEnMinutos);

            //calculo el tiempo promedio de los Tiempos de resolucion

            int cantidadTiempo = Convert.ToInt32(Datos.getOTC().cantidadTiempos(Convert.ToInt32(ViewState["nroTipoReclamo"])));

            int cantidadTiempos = cantidadTiempo + 1;

            float tiemposResolucionn = (float)Datos.getOTC().traerTiemposResolucion(Convert.ToInt32(ViewState["nroTipoReclamo"]));

            float tiemposResolucion = tiemposResolucionn + MINUTOS;  //sumo el de la ultima OTC

            float promedioTiempos = (float)tiemposResolucion / cantidadTiempos;  //tiempo en minutos

            float TIEMPO = Convert.ToSingle(Math.Round(promedioTiempos, 2));

            float div1 = TIEMPO / 60; //duracion en horas 

            //seteo el tiempo de resolución del Tipo de Reclamo Típico

            int tiempoPromedio = Convert.ToInt32(Datos.getOTC().setearTiempoResolucion(Convert.ToInt32(ViewState["nroTipoReclamo"]), TIEMPO));
            
            //lo muestro en pantalla
            int HORAS1 = Convert.ToInt32(Math.Floor(div));
            float c1 = div1 - HORAS1; //obtengo la parte decimal para pasarla a minutos
            int MINUTOS1 = Convert.ToInt32(Math.Floor(c1 * 60));

            int DIAS1;

            string tiempoTipoReclamo;

            if (div1 > 24)
            {
                float fl1 = div1 / 24;
                DIAS1 = Convert.ToInt32(Math.Floor(fl1));
                float residuoDias1 = fl1 - DIAS1; // obtengo la parte decimal para pasarla a horas
                float hoo1 = residuoDias1 * 24;
                int hor1 = Convert.ToInt32(Math.Floor(residuoDias1 * 24)); //horas
                float decim1 = hoo1 - hor1; //obtengo la parte decimal para pasarl a minutos
                int min1 = Convert.ToInt32(Math.Floor(decim1 * 60)); //minutos

                tiempoTipoReclamo = "El promedio de Tiempo de Resolución del Tipo de Reclamo es ahora de " + DIAS1.ToString() + " día/s " + hor1.ToString() + " hora/s " + min1.ToString() + " minuto/s";
            }
            else
            {
                if (HORAS1 >= 1)
                    tiempoTipoReclamo = "El promedio de Tiempo de Resolución del Tipo de Reclamo es ahora de " + HORAS1.ToString() + " hora/s " + MINUTOS1.ToString() + " minuto/s";
                else
                    tiempoTipoReclamo = "El promedio de Tiempo de Resolución del Tipo de Reclamo es ahora de " + MINUTOS1.ToString() + " minuto/s";
            }

            ViewState["TiempoTipoReclamo"] = tiempoTipoReclamo.ToString();
            //creo los detalles

            List<DetalleOTC> listaDetalleOrden = (List<DetalleOTC>)ViewState["listadoDetalleOTC"];
            List<HerramientaPorOTC> listaHerramientas = (List<HerramientaPorOTC>)ViewState["listadoHerramientas"];
            List<DetalleInsumo> listaDetalleInsumos = (List<DetalleInsumo>)ViewState["listadoDetalleInsumos"];

            int detallesOrden = Convert.ToInt32(Datos.getOTC().crearDetalleOTC(listaDetalleOrden));
            
            if(listaHerramientas != null && listaHerramientas.Count !=0)
                Convert.ToInt32(Datos.getOTC().crearDetalleHerrXOTC(listaHerramientas));

            //seteo el stock de los insumos, hay que verificar que la cantidad esté disponible

            float cantidadUsada = 0;
            InsumoSobrante insS;
            List<InsumoSobrante> listaInsumosSobrante = new List<InsumoSobrante>();
            int filasStockNoC = 0;
            int filasStockC = 0;
            int filasSobrante = 0;
            float cantidadTotal = 0;

            foreach (DetalleInsumo d in listaDetalleInsumos)
            {
                if (d.TipoInsumo == 1) //se puede descontar en cantidades (tipo cuantificable)
                {
                    filasStockC = Convert.ToInt32(Datos.getOTC().setearStockCantidad(d.Cantidad, d.NroInsumo));
                }
                else //tipo 2, cantidad acumulable (rollos)
                {
                    cantidadUsada += d.Cantidad;

                    int especificacion =  Convert.ToInt32(Datos.getOTC().devolverEspecificacion(d.NroInsumo));

                    cantidadTotal = Convert.ToSingle(Datos.getOTC().verificarSuperaEspecificacion(cantidadUsada, d.NroInsumo));
                    
                    //cantidad + sobrante (si hubiera de antes)
                    float cantidad = cantidadTotal / especificacion;

                    //me fijo si la cantidad + la sobrante supera la especificación
                    if (cantidad >= 1) // 1 rollo o más
                    {
                        int cantidadEntera = Convert.ToInt32(Math.Floor(cantidad));
                        float cantidadDecimal = cantidad - cantidadEntera; //obtengo la parte decimal 
                        float sobrante = cantidadDecimal * especificacion;

                        if (sobrante != 0)
                        {
                            if (Datos.getOTC().haySobrante(d.NroInsumo))
                            {
                                filasSobrante = Convert.ToInt32(Datos.getOTC().actualizarSobrante(sobrante, d.NroInsumo));
                                filasStockNoC = Convert.ToInt32(Datos.getOTC().setearStockNoCuantificable(cantidadEntera, d.NroInsumo));
                            }
                            else  // si no hay sobrante, creo una fila para el Insumo
                            {
                                insS = new InsumoSobrante();

                                insS.NroInsumo = Convert.ToInt32(d.NroInsumo);
                                insS.CantidadSobrante = Convert.ToSingle(sobrante);
                                insS.NroGrupo = Convert.ToInt32(ViewState["grupo"]);

                                listaInsumosSobrante.Add(insS);

                                Convert.ToInt32(Datos.getOTC().crearInsumSobrante(listaInsumosSobrante));

                                filasStockNoC = Convert.ToInt32(Datos.getOTC().setearStockNoCuantificable(cantidadEntera, d.NroInsumo));
                                //en la tabla StockInsumo
                            }
                        }
                        else //no hay sobrante, es decir, se pidió la cantidad justa a la especificación
                        {
                            if (Datos.getOTC().haySobrante(d.NroInsumo))
                            {
                                int filaEliminada = Convert.ToInt32(Datos.getOTC().eliminarInsumoSobrante(d.NroInsumo));
                                filasStockNoC = Convert.ToInt32(Datos.getOTC().setearStockNoCuantificable(cantidadEntera, d.NroInsumo));
                            }
                            else  // si no hay sobrante, elimino la fila de InsumoSobrante
                            {
                                filasStockNoC = Convert.ToInt32(Datos.getOTC().setearStockNoCuantificable(cantidadEntera, d.NroInsumo));
                            }
                        }
                    }
                    else  //si la cantidad NO alcanza la especificación...
                    {
                        if (Datos.getOTC().haySobrante(d.NroInsumo)) //actualizo el sobrante si ya había
                        {
                            filasSobrante = Convert.ToInt32(Datos.getOTC().actualizarSobrante(cantidadTotal, d.NroInsumo));
                        }
                        else //creo una nueva fila de Sobrante
                        {
                            insS = new InsumoSobrante();

                            insS.NroInsumo = Convert.ToInt32(d.NroInsumo);
                            insS.CantidadSobrante = Convert.ToSingle(cantidadTotal);
                            insS.NroGrupo = Convert.ToInt32(ViewState["grupo"]);

                            listaInsumosSobrante.Add(insS);

                            filasStockNoC = Convert.ToInt32(Datos.getOTC().crearInsumSobrante(listaInsumosSobrante));
                        }
                    }
                }

            }

            int detallesInsumos = Convert.ToInt32(Datos.getOTC().crearDetalleInsumo(listaDetalleInsumos));
            
            Datos.commit();
        }
        catch (Exception err)
        {
            Console.WriteLine(err.ToString());
            Datos.rollback();
        }

        lblTiempoResolucion.Text = ViewState["TiempoResolucion"].ToString();
        lblTiempoTipoReclamo.Text = ViewState["TiempoTipoReclamo"].ToString();

        ModalPopupRegistrar.Hide();
        ModalPopupExito.Show();

    }
    protected void btnCancelarRegistrar_Click(object sender, EventArgs e)
    {
        ModalPopupRegistrar.Hide();
    }

    protected void btnAceptarCancelacion_Click(object sender, EventArgs e)
    {
        try { }
        catch (Exception err)
        {
            Console.WriteLine(err.ToString());
            Datos.rollback();
        }
        Response.Redirect("/Cooperativa/InicioGuardiaReclamo.aspx", true);
    }
    protected void btnCancelarCancelacion_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Hide();
        //txtNombre.Focus();
    }
    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/InicioGuardiaReclamo.aspx", true);
    }

    protected void grillaInsumos_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[1].Visible = false; //idinsumo
        e.Row.Cells[5].Visible = false; //tipoinsumo
        e.Row.Cells[6].Visible = false; //especificacion
    }
    protected void grillaHerramientas_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //e.Row.Cells[1].Visible = false; //idherramienta


   


    }
    protected void gvPYSOTC_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRow")
        {
            int nroSolucion = Convert.ToInt32(e.CommandArgument);

            List<PYS> listaPYS = (List<PYS>) ViewState["listadoProblemasYSoluciones"];
            
            foreach(PYS pys in listaPYS)
            {
                if (pys.NroSolucion == nroSolucion)
                {
                    listaPYS.Remove(pys);
                    break;
                }
            }
           
            gvPYSOTC.DataSource = listaPYS;
            gvPYSOTC.DataBind();
        }         
    }
    protected void grillaInsumosFinal_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRow")
        {
            int nroInsumo = Convert.ToInt32(e.CommandArgument);

            //List<Insumo> listaInsumos = (List<Insumo>)ViewState["listadoDeInsumos"];
            List<DetalleInsumo> listaInsumos = (List<DetalleInsumo>)ViewState["listadoDetalleInsumos"];
            foreach (DetalleInsumo ins in listaInsumos)
            {
                if (ins.NroInsumo == nroInsumo)
                {
                    listaInsumos.Remove(ins);
                    break;
                }
            }

            grillaInsumosFinal.DataSource = listaInsumos;
            grillaInsumosFinal.DataBind();
        }
    }
    protected void grillaHerramientasFinal_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRow")
        {
            int nroHerramienta = Convert.ToInt32(e.CommandArgument);

            List<HerramientaPorOTC> listaHerramientas = (List<HerramientaPorOTC>)ViewState["listadoHerramientas"];

            foreach (HerramientaPorOTC h in listaHerramientas)
            {
                if (h.NroHerramienta == nroHerramienta)
                {
                    listaHerramientas.Remove(h);
                    break;
                }
            }

            grillaHerramientasFinal.DataSource = listaHerramientas;
            grillaHerramientasFinal.DataBind();
        }
    }
    protected void btnCerrarInsumos_Click(object sender, EventArgs e)
    {
        ModalPopupInsumos.Hide();
    }
    protected void btnCerrarHerramientas_Click(object sender, EventArgs e)
    {
        ModalPopupHerramientas.Hide();
    }
    protected void btnVolver_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/InicioGuardiaReclamo.aspx", true);
    }
    protected void btnCargarPYS_Click(object sender, EventArgs e)
    {
        panelProblemasSoluciones.Visible = true;

        List<PYS> listaPYS = new List<PYS>();
        PYS probYsol;

        foreach (GridViewRow row in grillaSoluciones.Rows)
        {
            CheckBox checkSolucion = (CheckBox)row.FindControl("chkSolucion");

            if (checkSolucion.Checked)
            {
                probYsol = new PYS();

                probYsol.NroProblema = Convert.ToInt32(ViewState["nroProblema"]);
                probYsol.NombreProblema = ViewState["nombreProblema"].ToString();
                probYsol.NroSolucion = Convert.ToInt32(grillaSoluciones.Rows[row.RowIndex].Cells[2].Text);
                probYsol.NombreSolucion = grillaSoluciones.Rows[row.RowIndex].Cells[1].Text;

                listaPYS.Add(probYsol);
            }
        }

        gvPYSOTC.DataSource = listaPYS;
        gvPYSOTC.DataBind();

        ViewState["listadoProblemasYSoluciones"] = listaPYS;
        //panelDetalle2.Visible = true;


        string nombreProblema = "Problema: " + ViewState["nombreProblema"].ToString();
        lblProblemaFinal.Text = nombreProblema;

    }

}
