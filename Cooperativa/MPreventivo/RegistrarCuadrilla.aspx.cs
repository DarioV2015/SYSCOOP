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

public partial class MPreventivo_RegistrarCuadrilla : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }

    protected void btnReemplazar_Click(object sender, EventArgs e)
    {
        DateTime fechaInicio = DateTime.Now;
        DateTime fechaFin = DateTime.Now;
        int mes = Convert.ToInt32(this.ddlMes.SelectedValue);
        int año = Convert.ToInt32(this.ddlAño.SelectedValue);
        switch (mes)
        {
            case 1:
                {
                    fechaInicio = new DateTime(año, 1, 1);
                    fechaFin = new DateTime(año, 1, 31);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 2:
                {
                    fechaInicio = new DateTime(año, 2, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 2, 28, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 3:
                {
                    fechaInicio = new DateTime(año, 3, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 3, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 4:
                {
                    fechaInicio = new DateTime(año, 4, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 4, 30, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 5:
                {
                    fechaInicio = new DateTime(año, 5, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 5, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 6:
                {
                    fechaInicio = new DateTime(año, 6, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 6, 30, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 7:
                {
                    fechaInicio = new DateTime(año, 7, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 7, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 8:
                {
                    fechaInicio = new DateTime(año, 8, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 8, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 9:
                {
                    fechaInicio = new DateTime(año, 9, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 9, 30, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 10:
                {
                    fechaInicio = new DateTime(año, 10, 1);
                    fechaFin = new DateTime(año, 10, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 11:
                {
                    fechaInicio = new DateTime(año, 11, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 11, 30, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 12:
                {
                    fechaInicio = new DateTime(año, 12, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 12, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
        }


        int idCuadrillaAReemplazar = Datos.getCuadrillas().buscaridCuadrilla(Convert.ToInt32(ddlCuadrilla.SelectedValue));
        ViewState["IdCuadrilla"] = idCuadrillaAReemplazar;
        if (idCuadrillaAReemplazar > 0)
        {
            //La cuadrilla seleccionada tiene alguna OTC planificada con fecha superiori a hoy
            ModalPopupCuadrillaNOReemplazable.Show();
        }
        else
        {
            ViewState["botonReemplazar"] = "1";
            ViewState["botonNuevo"] = "0";
            ViewState["botonEliminar"] = "0";
            FormViewVehiculoAsignado.Visible = false;

            //Cambiar a la cuadrilla el estado de baja


            int idCuadrilla = Convert.ToInt32(ddlCuadrilla.SelectedValue);
            Session["IdCuadrillaRemplazada"] = idCuadrilla; 
            if (año == DateTime.Now.Year)
            {
                if (mes == DateTime.Now.Month)
                {
                    fechaInicio = DateTime.Now;
                    lblFechaCuadrillaReemplazada.Text = "La nueva Cuadrilla reemplazará a la anterior en el período " + DateTime.Now.Day + "/" + DateTime.Now.Month + "/" + DateTime.Now.Year + " - " + fechaFin.Day + "/" + fechaFin.Month + "/" + fechaFin.Year;

                }
            }
            ViewState["fechaInicio"] = fechaInicio;
            int historialCuadrilla = Datos.getCuadrillas().actualizarEstadoCuadrillABaja2(idCuadrilla, fechaInicio);
            int bajaCuadrilla = Datos.getCuadrillas().actualizarSOLOEstadoCuadrillABaja(idCuadrilla);
            foreach (GridViewRow row in this.gvHerramientasAsignadas.Rows)
            {
                int idHerramienta = Convert.ToInt32(row.Cells[0].Text);
                int historialHerramienta = Datos.getHerramienta().actualizarEstadoHISTORIALHerramienta(idHerramienta, fechaFin, fechaInicio, 3);
                int herramientaxcuadrilla = Datos.getCuadrillas().actualizarHerramientaXCuadrilla(idCuadrilla, idHerramienta, fechaFin);

            }
            Vehiculo v = new Vehiculo();
            v = Datos.getVehiculos().traerVehiculo(idCuadrilla);
            int historialVehiculo = Datos.getVehiculos().actualizarEstadoHISTORIALVehiculo(v.IdVehiculo, fechaFin, fechaInicio, 3);
            
            
            Datos.commit();
           

           
            //Combo CAPATAZ
            List<Empleado> capataz = new List<Empleado>();
            capataz = Datos.getCuadrillas().llenarComboCapataz(Convert.ToInt32(ddlMes.SelectedValue), Convert.ToInt32(ddlAño.SelectedValue));
            ddlLegajoCapataz.DataTextField = "IdEmpleado";
            ddlLegajoCapataz.DataValueField = "IdEmpleado";
            ddlLegajoCapataz.DataSource = capataz;
            ddlLegajoCapataz.DataBind();

            //Combo OFICIAL
            List<Empleado> oficial = new List<Empleado>();
            oficial = Datos.getCuadrillas().llenarComboOficial(Convert.ToInt32(ddlMes.SelectedValue), Convert.ToInt32(ddlAño.SelectedValue));
            ddlLegajoOficial.DataTextField = "IdEmpleado";
            ddlLegajoOficial.DataValueField = "IdEmpleado";
            ddlLegajoOficial.DataSource = oficial;
            ddlLegajoOficial.DataBind();

            //Combo MEDIO OFICIAL
            List<Empleado> medioOficial = new List<Empleado>();
            medioOficial = Datos.getCuadrillas().llenarComboMedioOficial(Convert.ToInt32(ddlMes.SelectedValue), Convert.ToInt32(ddlAño.SelectedValue));
            ddlLegajoMedioOf.DataTextField = "IdEmpleado";
            ddlLegajoMedioOf.DataValueField = "IdEmpleado";
            ddlLegajoMedioOf.DataSource = medioOficial;
            ddlLegajoMedioOf.DataBind();

            //Combo AYUDANTE
            List<Empleado> ayudante = new List<Empleado>();
            ayudante = Datos.getCuadrillas().llenarComboAyudante(Convert.ToInt32(ddlMes.SelectedValue), Convert.ToInt32(ddlAño.SelectedValue));
            ddlLegajoAyudante.DataSource = ayudante;
            ddlLegajoAyudante.DataTextField = "IdEmpleado";
            ddlLegajoAyudante.DataValueField = "IdEmpleado";
            ddlLegajoAyudante.DataBind();

            this.gvVehículo.Visible = true;
            this.gvHerramientas.Visible = true;
            this.gvHerramientasAsignadas.Visible = false;
            this.lblTipoHerramienta.Visible = true;
            this.lblHerramienta.Visible = true;
            this.ddlTipoHerramienta.Visible = true;
            this.ddlHerramienta.Visible = true;
            this.gvHerramientas.Enabled = true;
            this.ddlTipoHerramienta.Enabled = true;
            this.btnAgregar.Visible = true;
 

            //int idCuadrilla = Convert.ToInt32(this.ddlCuadrilla.SelectedValue);
            Empleado c = Datos.getEmpleados().getEmpleado(Convert.ToInt32(ddlLegajoCapataz.SelectedValue));
            //ddlLegajoCapataz.SelectedValue = Convert.ToString(c.IdEmpleado);
            txtApellidoCapataz.Text = c.ApellidoEmpleado;
            txtNombreCapataz.Text = c.NombreEmpleado;
            ddlLegajoCapataz.Enabled = true;

            Empleado o = Datos.getEmpleados().getEmpleado(Convert.ToInt32(ddlLegajoOficial.SelectedValue));
            //ddlLegajoOficial.SelectedValue = Convert.ToString(o.IdEmpleado);
            txtApellidoOficial.Text = o.ApellidoEmpleado;
            txtNombreOficial.Text = o.NombreEmpleado;
            ddlLegajoOficial.Enabled = true;

            Empleado mo = Datos.getEmpleados().getEmpleado(Convert.ToInt32(ddlLegajoMedioOf.SelectedValue));
            //ddlLegajoMedioOf.SelectedValue = Convert.ToString(mo.IdEmpleado);
            txtApellidoMedioOf.Text = mo.ApellidoEmpleado;
            txtNombreMedioOf.Text = mo.NombreEmpleado;
            ddlLegajoMedioOf.Enabled = true;

            Empleado a = Datos.getEmpleados().getEmpleado(Convert.ToInt32(ddlLegajoAyudante.SelectedValue));
            //ddlLegajoAyudante.SelectedValue = Convert.ToString(a.IdEmpleado);
            txtApellidoAyudante.Text = a.ApellidoEmpleado;
            txtNombreAyudante.Text = a.NombreEmpleado;
            ddlLegajoAyudante.Enabled = true;

        }
        /*else
        {
            lblMensajeNoPuedeReemplazar.Text = "No se puede reemplazar el historial de una cuadrilla que esta DE BAJA";
        }
    }
    else
    {
        lblMensajeNoPuedeReemplazar.Text = "No se puede reemplazar el historial de una cuadrilla que esta DE BAJA";
    }*/
    }
           
    

    
 
            

    protected void ddlCuadrilla_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gvVehículo_rdbSeleccionar_CheckedChanged(object sender, EventArgs e)
    {
       int idVehiculo;
       
        foreach (GridViewRow row in this.gvVehículo.Rows)
        {
            RadioButton gvVehículo_rdbSeleccionar = (RadioButton)row.FindControl("gvVehículo_rdbSeleccionar");
            if (gvVehículo_rdbSeleccionar.Checked)
            {

                idVehiculo = Convert.ToInt32(row.Cells[1].Text);

                ViewState["idVehiculo"] = idVehiculo;
               

            }

        }
    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        //this.btnRegistrar.Enabled = true;
        int var = 0;      
        List<Herramienta> listado;
        if (ViewState["lista"] == null)
            listado = new List<Herramienta>();
        else
        {
            listado = (List<Herramienta>)ViewState["lista"];
            foreach (Herramienta her in listado)
            {
                if (her.NroHerramienta == Convert.ToInt32(this.ddlHerramienta.SelectedValue))
                {
                    //this.lblMensaje.Text = "El insumo seleccionado ya fuer agregado";
                    var = 1;
                    break;
                }
            }

        }

        if (var == 0)
        {
             //this.lblMensaje.Text = "";
             Herramienta her = new Herramienta();

             her = Datos.getHerramienta().traerHerramienta(Convert.ToInt32(this.ddlHerramienta.SelectedValue));

             listado.Add(her);

             ViewState["lista"] = listado;

             if (listado.Count > 0)
                {
                    this.gvHerramientas.DataSource = listado;
                    this.gvHerramientas.DataBind();
                }            
        }
        
       
    }
    protected void  gvHerramienta_RowCommand(object sender, GridViewCommandEventArgs e)
{
        if (e.CommandName == "DeleteRow")
        {
            int nroHerramienta = Convert.ToInt32(e.CommandArgument);

            List<Herramienta> listado;
            listado = (List<Herramienta>)ViewState["lista"];

            foreach (Herramienta her in listado)
            {
                if (her.NroHerramienta == nroHerramienta)
                {
                    listado.Remove(her);
                    break;
                }
            }

            this.gvHerramientas.DataSource = listado;
            this.gvHerramientas.DataBind();
        }

}
    protected void BTNGuardar_Click(object sender, EventArgs e)
    {
        ModalPopupConfirmacion.Show();
    }
    protected void BTNCanelar_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Show();
    }
    protected void btnAceptarRegistrar_Click(object sender, EventArgs e)
    {
        DateTime fechaInicio = DateTime.Now;
        DateTime fechaFin = DateTime.Now;
        int mes = Convert.ToInt32(this.ddlMes.SelectedValue);
        int año = Convert.ToInt32(this.ddlAño.SelectedValue);
        switch (mes)
        {
            case 1:
                {
                    fechaInicio = new DateTime(año, 1, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 1, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 2:
                {
                    fechaInicio = new DateTime(año, 2, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 2, 28, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 3:
                {
                    fechaInicio = new DateTime(año, 3, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 3, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 4:
                {
                    fechaInicio = new DateTime(año, 4, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 4, 30, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 5:
                {
                    fechaInicio = new DateTime(año, 5, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 5, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 6:
                {
                    fechaInicio = new DateTime(año, 6, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 6, 30, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 7:
                {
                    fechaInicio = new DateTime(año, 7, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 7, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 8:
                {
                    fechaInicio = new DateTime(año, 8, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 8, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 9:
                {
                    fechaInicio = new DateTime(año, 9, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 9, 30, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 10:
                {
                    fechaInicio = new DateTime(año, 10, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 10, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 11:
                {
                    fechaInicio = new DateTime(año, 11, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 11, 30, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 12:
                {
                    fechaInicio = new DateTime(año, 12, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 12, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
        }       
        
        
        //REEMPLAZAR o NUEVA
        int reemplazar= Convert.ToInt32(ViewState["botonReemplazar"]);
        int nueva = Convert.ToInt32(ViewState["botonNuevo"]);
        int eliminar=Convert.ToInt32(ViewState["botonEliminar"]);
        
        int historialHerr = 0;
        int idherramienta=0;
        int herXCuadrilla=0;
        int idVehiculo=0;
        int historialVehi=0;
        if (nueva == 1 || reemplazar==1)
        {
            if (año == DateTime.Now.Year)
            {
                if (mes == DateTime.Now.Month)
                { fechaInicio = DateTime.Now; }
            }
        
            
            //crear cuadrilla
            int ultimoIdCuadrilla = Datos.getCuadrillas().obtenerUltimoNroCuadrilla();
            int crear = Datos.getCuadrillas().crearCuadrilla(ultimoIdCuadrilla);
            int historialCuadrilla = Datos.getCuadrillas().crearHistorialCuadrilla(ultimoIdCuadrilla, fechaInicio, fechaFin, 1);
            int isertarCapataz = Datos.getCuadrillas().insertarEmpleadoXCuadrilla(Convert.ToInt32(ddlLegajoCapataz.SelectedValue), ultimoIdCuadrilla);
            int isertarOficial = Datos.getCuadrillas().insertarEmpleadoXCuadrilla(Convert.ToInt32(ddlLegajoOficial.SelectedValue), ultimoIdCuadrilla);
            int isertarMedioO = Datos.getCuadrillas().insertarEmpleadoXCuadrilla(Convert.ToInt32(ddlLegajoMedioOf.SelectedValue), ultimoIdCuadrilla);
            int isertarAyudante = Datos.getCuadrillas().insertarEmpleadoXCuadrilla(Convert.ToInt32(ddlLegajoAyudante.SelectedValue), ultimoIdCuadrilla);

            //crear historial herramienta

            foreach (GridViewRow row in this.gvHerramientas.Rows)
            {
                idherramienta= Convert.ToInt32(row.Cells[0].Text);
                historialHerr = Datos.getHerramienta().crearHistorialHerramientaCuadrilla(idherramienta, fechaInicio, fechaFin, "Ninguna", ultimoIdCuadrilla, 2);
                herXCuadrilla = Datos.getCuadrillas().insertarHerramientaXCuadrilla(idherramienta, ultimoIdCuadrilla);
            }
             
            //crear historial vehiculo

            foreach (GridViewRow row in this.gvVehículo.Rows)
            {
                RadioButton rdbSeleccionar = (RadioButton)row.FindControl("gvVehículo_rdbSeleccionar");

                if (rdbSeleccionar.Checked)
                {
                    idVehiculo = Convert.ToInt32(row.Cells[1].Text);
                    historialVehi = Datos.getVehiculos().crearHistorialVehiculoCuadrilla(idVehiculo, fechaInicio, fechaFin, ultimoIdCuadrilla, 2);
                }

            }
           
        }        
        //ELIMINAR
        if (eliminar==1)
        {
            int idCuadrilla = Convert.ToInt32(ddlCuadrilla.SelectedValue);
            if (año == DateTime.Now.Year)
            {
                if (mes == DateTime.Now.Month)
                { 
                    fechaInicio = DateTime.Now;
 
                }
            }
            int historialCuadrilla=Datos.getCuadrillas().actualizarEstadoCuadrillABaja2(idCuadrilla,fechaInicio);
            int bajaCuadrilla = Datos.getCuadrillas().actualizarSOLOEstadoCuadrillABaja(idCuadrilla);

            foreach (GridViewRow row in this.gvHerramientasAsignadas.Rows)
            {
                int idHerramienta=Convert.ToInt32(row.Cells[0].Text);
                int historialHerramienta= Datos.getHerramienta().actualizarEstadoHISTORIALHerramienta(idHerramienta,fechaFin,fechaInicio,3);
                int herramientaxcuadrilla = Datos.getCuadrillas().actualizarHerramientaXCuadrilla(idCuadrilla, idherramienta, fechaFin);

            }
            Vehiculo v = new Vehiculo();
            v = Datos.getVehiculos().traerVehiculo(idCuadrilla);
            int historialVehiculo = Datos.getVehiculos().actualizarEstadoHISTORIALVehiculo(v.IdVehiculo, fechaFin, fechaInicio, 3);
 
            
            
             
        }

        Datos.commit();
        ModalPopupExito.Show();

    }

     protected void btnCancelarRegistrar_Click(object sender, EventArgs e)
    {
        ModalPopupConfirmacion.Hide();
    }
    protected void btnAceptarCancelacion_Click(object sender, EventArgs e)
    {
        int reemplazar = Convert.ToInt32(ViewState["botonReemplazar"]);
        if (reemplazar==1)
        {
            int idCuadrilla = Convert.ToInt32(Session["IdCuadrillaRemplazada"]);
            DateTime fechaInicio = Convert.ToDateTime(ViewState["fechaInicio"]);
            int estadoCuadrilla = Datos.getCuadrillas().actualizarSOLOEstadoCuadrillAALTA(idCuadrilla);
            int historialCuadrilla = Datos.getCuadrillas().actualizarEstadoCuadrillaALTA(idCuadrilla, fechaInicio);
            int HistorialHerramienta = Datos.getCuadrillas().actualizarEstadoHistorialHerramientaASIGNADA(fechaInicio, 3, idCuadrilla);
            int historialVehiculo = Datos.getCuadrillas().actualizarEstadoHistorialVehiculo(fechaInicio, idCuadrilla);

            if (historialCuadrilla > 0 && HistorialHerramienta > 0 && historialVehiculo > 0)
            {
                Datos.commit();
            } 
 
        }        
        
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }
    protected void btnCancelarCancelacion_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Hide();
    }
    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        //EXITO
        Response.Redirect("/Cooperativa/Default.aspx", true);

    }
    protected void btnAceptarCuadrillaNoReemplazable_Click(object sender, EventArgs e)
    {
        ModalPopupCuadrillaNOReemplazable.Hide();
        txtApellidoOficial.Text = "";
        txtNombreOficial.Text = "";
        ddlLegajoOficial.Enabled = true;
        
        txtApellidoMedioOf.Text = "";
        txtNombreMedioOf.Text = "";
        ddlLegajoMedioOf.Enabled = true;
        
        txtApellidoAyudante.Text = "";
        txtNombreAyudante.Text = "";
        ddlLegajoAyudante.Enabled = true;
                

    }
    protected void btnCancelarCuadrillaNoReemplazable_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }
    protected void btnNuevaCuadrilla_Click(object sender, EventArgs e)
    {
        //Nueva Cuadrilla
        //Combo CAPATAZ
        List<Empleado> capataz = new List<Empleado>();
        capataz = Datos.getCuadrillas().llenarComboCapataz(Convert.ToInt32(ddlMes.SelectedValue), Convert.ToInt32(ddlAño.SelectedValue));
        if (capataz.Count > 0)
        {
            lblMensajeCapataz.Text = "";
            ddlLegajoCapataz.DataTextField = "IdEmpleado";
            ddlLegajoCapataz.DataValueField = "IdEmpleado";
            ddlLegajoCapataz.DataSource = capataz;
            ddlLegajoCapataz.DataBind();
            Empleado capataz1 = Datos.getEmpleados().getCapatazXLegajo(Convert.ToInt32(ddlLegajoCapataz.SelectedValue));
            this.txtApellidoCapataz.Text = capataz1.ApellidoEmpleado;
            this.txtNombreCapataz.Text = capataz1.NombreEmpleado;
        }
        else 
        { 
            //No hay CAPATAZ
            lblMensajeCapataz.Text = "No hay empleados con el cargo CAPATAZ disponibles";
        
        }

        
        //Combo OFICIAL
        List<Empleado> oficial = new List<Empleado>();
        oficial = Datos.getCuadrillas().llenarComboOficial(Convert.ToInt32(ddlMes.SelectedValue), Convert.ToInt32(ddlAño.SelectedValue));

        if (oficial.Count > 0)
        {
            lblMensajeOficial.Text = "";
            ddlLegajoOficial.DataTextField = "IdEmpleado";
            ddlLegajoOficial.DataValueField = "IdEmpleado";
            ddlLegajoOficial.DataSource = oficial;
            ddlLegajoOficial.DataBind();
            Empleado oficial1 = Datos.getEmpleados().getOficialXLegajo(Convert.ToInt32(ddlLegajoOficial.SelectedValue));
            this.txtApellidoOficial.Text = oficial1.ApellidoEmpleado;
            this.txtNombreOficial.Text = oficial1.NombreEmpleado;
        }
        else
        {
            lblMensajeOficial.Text = "No hay empleados con el cargo OFICIAL disponibles";
        }


        //Combo MEDIO OFICIAL
        List<Empleado> medioOficial = new List<Empleado>();
        medioOficial = Datos.getCuadrillas().llenarComboMedioOficial(Convert.ToInt32(ddlMes.SelectedValue), Convert.ToInt32(ddlAño.SelectedValue));
        if (medioOficial.Count > 0)
        {
            lblMensajeMedioO.Text = "";
            ddlLegajoMedioOf.DataTextField = "IdEmpleado";
            ddlLegajoMedioOf.DataValueField = "IdEmpleado";
            ddlLegajoMedioOf.DataSource = medioOficial;
            ddlLegajoMedioOf.DataBind();
            Empleado medio = Datos.getEmpleados().getMedioOficialXLegajo(Convert.ToInt32(this.ddlLegajoMedioOf.SelectedValue));
            this.txtApellidoMedioOf.Text = medio.ApellidoEmpleado;
            this.txtNombreMedioOf.Text = medio.NombreEmpleado;
        }
        else
        {
            lblMensajeMedioO.Text = "No hay empleados con el cargo MEDIO OFICIAL disponibles";
        }


        //Combo AYUDANTE
        List<Empleado> ayudante = new List<Empleado>();
        ayudante = Datos.getCuadrillas().llenarComboAyudante(Convert.ToInt32(ddlMes.SelectedValue), Convert.ToInt32(ddlAño.SelectedValue));
        if (ayudante.Count > 0)
        {
            lblMensajeAyudante.Text = "";
            ddlLegajoAyudante.DataTextField = "IdEmpleado";
            ddlLegajoAyudante.DataValueField = "IdEmpleado";
            ddlLegajoAyudante.DataSource = ayudante;
            ddlLegajoAyudante.DataBind();
            Empleado ayudante1 = Datos.getEmpleados().getAyudanteXLegajo(Convert.ToInt32(this.ddlLegajoAyudante.SelectedValue));
            this.txtApellidoAyudante.Text = ayudante1.ApellidoEmpleado;
            this.txtNombreAyudante.Text = ayudante1.NombreEmpleado;
        }
        else
        {
            lblMensajeAyudante.Text = "No hay empleados con el cargo AYUDANTE disponibles";
        }

           
        
        ViewState["botonReemplazar"] = "0";
        ViewState["botonNuevo"] = "1";
        ViewState["botonEliminar"] = "0";
        ddlLegajoCapataz.Enabled = true;
        ddlLegajoOficial.Enabled = true;
        ddlLegajoMedioOf.Enabled = true;
        ddlLegajoAyudante.Enabled = true;
        gvVehículo.Visible = true;
        gvVehículo.Enabled = true;
        ddlTipoHerramienta.Enabled = true;

        this.FormViewVehiculoAsignado.Visible = false;
        this.gvVehículo.Visible = true;
        this.gvHerramientas.Visible = true;
        this.gvHerramientasAsignadas.Visible = false;
        this.lblTipoHerramienta.Visible = true;
        this.lblHerramienta.Visible = true;
        this.ddlTipoHerramienta.Visible = true;
        this.ddlHerramienta.Visible = true;
        this.btnAgregar.Visible = true;
    }
    protected void btnDarBaja_Click(object sender, EventArgs e)
    {
        //Cambiar el estado a la cuadrilla selecciona, dar de BAJA

        int idCuadrillaAReemplazar = Datos.getCuadrillas().buscaridCuadrilla(Convert.ToInt32(ddlCuadrilla.SelectedValue));
        if (idCuadrillaAReemplazar > 0)
        {
            //La cuadrilla seleccionada tiene alguna OTC planificada con fecha superiori a hoy
            ModalPopupCuadrillaNOReemplazable.Show();
        }
        else
        {
            ViewState["botonReemplazar"] = "0";
            ViewState["botonNuevo"] = "0";
            ViewState["botonEliminar"] = "1";
            ddlHerramienta.Enabled = true;
            btnAgregar.Enabled = true;
            DateTime fechaInicio = DateTime.Now;
            DateTime fechaFin;
            int mes = Convert.ToInt32(this.ddlMes.SelectedValue);
            int año = Convert.ToInt32(this.ddlAño.SelectedValue);
            switch (mes)
            {
                case 1:
                    {
                        fechaInicio = new DateTime(año, 1, 1, 0, 0, 0);
                        fechaFin = new DateTime(año, 1, 31, 0, 0, 0);
                        ViewState["Inicio"] = fechaInicio;
                        ViewState["Fin"] = fechaFin;
                        break;
                    }
                case 2:
                    {
                        fechaInicio = new DateTime(año, 2, 1, 0, 0, 0);
                        fechaFin = new DateTime(año, 2, 28, 0, 0, 0);
                        ViewState["Inicio"] = fechaInicio;
                        ViewState["Fin"] = fechaFin;
                        break;
                    }
                case 3:
                    {
                        fechaInicio = new DateTime(año, 3, 1, 0, 0, 0);
                        fechaFin = new DateTime(año, 3, 31, 0, 0, 0);
                        ViewState["Inicio"] = fechaInicio;
                        ViewState["Fin"] = fechaFin;
                        break;
                    }
                case 4:
                    {
                        fechaInicio = new DateTime(año, 4, 1, 0, 0, 0);
                        fechaFin = new DateTime(año, 4, 30, 0, 0, 0);
                        ViewState["Inicio"] = fechaInicio;
                        ViewState["Fin"] = fechaFin;
                        break;
                    }
                case 5:
                    {
                        fechaInicio = new DateTime(año, 5, 1, 0, 0, 0);
                        fechaFin = new DateTime(año, 5, 31, 0, 0, 0);
                        ViewState["Inicio"] = fechaInicio;
                        ViewState["Fin"] = fechaFin;
                        break;
                    }
                case 6:
                    {
                        fechaInicio = new DateTime(año, 6, 1, 0, 0, 0);
                        fechaFin = new DateTime(año, 6, 30, 0, 0, 0);
                        ViewState["Inicio"] = fechaInicio;
                        ViewState["Fin"] = fechaFin;
                        break;
                    }
                case 7:
                    {
                        fechaInicio = new DateTime(año, 7, 1, 0, 0, 0);
                        fechaFin = new DateTime(año, 7, 31, 0, 0, 0);
                        ViewState["Inicio"] = fechaInicio;
                        ViewState["Fin"] = fechaFin;
                        break;
                    }
                case 8:
                    {
                        fechaInicio = new DateTime(año, 8, 1, 0, 0, 0);
                        fechaFin = new DateTime(año, 8, 31, 0, 0, 0);
                        ViewState["Inicio"] = fechaInicio;
                        ViewState["Fin"] = fechaFin;
                        break;
                    }
                case 9:
                    {
                        fechaInicio = new DateTime(año, 9, 1, 0, 0, 0);
                        fechaFin = new DateTime(año, 9, 30, 0, 0, 0);
                        ViewState["Inicio"] = fechaInicio;
                        ViewState["Fin"] = fechaFin;
                        break;
                    }
                case 10:
                    {
                        fechaInicio = new DateTime(año, 10, 1, 0, 0, 0);
                        fechaFin = new DateTime(año, 10, 31, 0, 0, 0);
                        ViewState["Inicio"] = fechaInicio;
                        ViewState["Fin"] = fechaFin;
                        break;
                    }
                case 11:
                    {
                        fechaInicio = new DateTime(año, 11, 1, 0, 0, 0);
                        fechaFin = new DateTime(año, 11, 30, 0, 0, 0);
                        ViewState["Inicio"] = fechaInicio;
                        ViewState["Fin"] = fechaFin;
                        break;
                    }
                case 12:
                    {
                        fechaInicio = new DateTime(año, 12, 1, 0, 0, 0);
                        fechaFin = new DateTime(año, 12, 31, 0, 0, 0);
                        ViewState["Inicio"] = fechaInicio;
                        ViewState["Fin"] = fechaFin;
                        break;
                    }
            }
            
            this.FormViewVehiculoAsignado.Visible = true;
            this.gvVehículo.Visible = false;
            this.gvHerramientas.Visible = false;
            this.gvHerramientasAsignadas.Visible = true;
            this.lblTipoHerramienta.Visible = false;
            this.lblHerramienta.Visible = false;
            this.ddlTipoHerramienta.Visible = false;
            this.ddlHerramienta.Visible = false;
            this.btnAgregar.Visible = false;
        } 
      
    }

    protected void ddlTipoHerramienta_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlHerramienta.Enabled = true;
        btnAgregar.Enabled = true;
        DateTime fechaInicio=DateTime.Now;
        DateTime fechaFin;
        int mes = Convert.ToInt32(this.ddlMes.SelectedValue);
        int año = Convert.ToInt32(this.ddlAño.SelectedValue);
        switch (mes)
        {
            case 1:
                {
                    fechaInicio = new DateTime(año, 1, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 1, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 2:
                {
                    fechaInicio = new DateTime(año, 2, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 2, 28, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 3:
                {
                    fechaInicio = new DateTime(año, 3, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 3, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 4:
                {
                    fechaInicio = new DateTime(año, 4, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 4, 30, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 5:
                {
                    fechaInicio = new DateTime(año, 5, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 5, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 6:
                {
                    fechaInicio = new DateTime(año, 6, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 6, 30, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 7:
                {
                    fechaInicio = new DateTime(año, 7, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 7, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 8:
                {
                    fechaInicio = new DateTime(año, 8, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 8, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 9:
                {
                    fechaInicio = new DateTime(año, 9, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 9, 30, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 10:
                {
                    fechaInicio = new DateTime(año, 10, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 10, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 11:
                {
                    fechaInicio = new DateTime(año, 11, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 11, 30, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
            case 12:
                {
                    fechaInicio = new DateTime(año, 12, 1, 0, 0, 0);
                    fechaFin = new DateTime(año, 12, 31, 0, 0, 0);
                    ViewState["Inicio"] = fechaInicio;
                    ViewState["Fin"] = fechaFin;
                    break;
                }
        }
        
        List<Herramienta> lista = new List<Herramienta>();
        lista = Datos.getHerramienta().getHERRAMIENTA(mes, año, Convert.ToInt32(ddlTipoHerramienta.SelectedValue), fechaInicio);
        ddlHerramienta.DataSource = lista;
        ddlHerramienta.DataTextField = "Descripcion";
        ddlHerramienta.DataValueField = "NroHerramienta";
        ddlHerramienta.DataBind();

    }
    protected void ddlLegajoCapataz_SelectedIndexChanged(object sender, EventArgs e)
    {
        Empleado capataz = Datos.getEmpleados().getCapatazXLegajo(Convert.ToInt32(ddlLegajoCapataz.SelectedValue));
        this.txtApellidoCapataz.Text = capataz.ApellidoEmpleado;
        this.txtNombreCapataz.Text = capataz.NombreEmpleado;
    }
    protected void ddlLegajoOficial_SelectedIndexChanged(object sender, EventArgs e)
    {
        Empleado oficial = Datos.getEmpleados().getOficialXLegajo(Convert.ToInt32(ddlLegajoOficial.SelectedValue));
        this.txtApellidoOficial.Text = oficial.ApellidoEmpleado;
        this.txtNombreOficial.Text = oficial.NombreEmpleado;
    }
    protected void ddlLegajoMedioOf_SelectedIndexChanged(object sender, EventArgs e)
    {
        Empleado medio = Datos.getEmpleados().getMedioOficialXLegajo(Convert.ToInt32(this.ddlLegajoMedioOf.SelectedValue));
        this.txtApellidoMedioOf.Text = medio.ApellidoEmpleado;
        this.txtApellidoMedioOf.Text = medio.NombreEmpleado;

    }
    protected void ddlLegajoAyudante_SelectedIndexChanged(object sender, EventArgs e)
    {
        Empleado ayudante = Datos.getEmpleados().getAyudanteXLegajo(Convert.ToInt32(this.ddlLegajoAyudante.SelectedValue));
        this.txtApellidoAyudante.Text = ayudante.ApellidoEmpleado;
        this.txtNombreAyudante.Text = ayudante.NombreEmpleado;
    }
    
    protected void ddlMes_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<Cuadrilla> lista = new List<Cuadrilla>();
        lista = Datos.getCuadrillas().getCuadrillas(Convert.ToInt32(ddlMes.SelectedValue), Convert.ToInt32(ddlAño.SelectedValue));
        if (lista.Count > 0)
        {
            ListViewCuadrilla.Visible = true;
            lblMensajeCuadrilla.Text = "";
            ddlCuadrilla.DataSource = lista;
            ddlCuadrilla.DataTextField = "IdCuadrilla";
            ddlCuadrilla.DataValueField = "IdCuadrilla";
            ddlCuadrilla.DataBind();
        }
        else
        { 
            ListViewCuadrilla.Visible = false;
            lblMensajeCuadrilla.Text = "No se han encontrado CUADRILLAS DISPONIBLES";
            ddlCuadrilla.DataSource = lista;
            ddlCuadrilla.DataTextField = "IdCuadrilla";
            ddlCuadrilla.DataValueField = "IdCuadrilla";
            ddlCuadrilla.DataBind();
        }

    }
    protected void ddlAño_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<Cuadrilla> lista = new List<Cuadrilla>();
        lista = Datos.getCuadrillas().getCuadrillas(Convert.ToInt32(ddlMes.SelectedValue), Convert.ToInt32(ddlAño.SelectedValue));
        if (lista.Count > 0)
        {
            ListViewCuadrilla.Visible = true;
            lblMensajeCuadrilla.Text = "";
            ddlCuadrilla.DataSource = lista;
            ddlCuadrilla.DataTextField = "IdCuadrilla";
            ddlCuadrilla.DataValueField = "IdCuadrilla";
            ddlCuadrilla.DataBind();
        }
        else
        { 
            ListViewCuadrilla.Visible = false;
            lblMensajeCuadrilla.Text = "No se han encontrado CUADRILLAS DISPONIBLES";
            ddlCuadrilla.DataSource = lista;
            ddlCuadrilla.DataTextField = "IdCuadrilla";
            ddlCuadrilla.DataValueField = "IdCuadrilla";
            ddlCuadrilla.DataBind();
        }
    }
}

