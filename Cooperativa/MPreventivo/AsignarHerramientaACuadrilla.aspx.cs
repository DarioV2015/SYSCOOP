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

public partial class MPreventivo_AsignarHerramientaACuadrilla : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<Cuadrilla> lista = new List<Cuadrilla>();
        lista = Datos.getCuadrillas().getCuadrillas(Convert.ToInt32(ddlMes.SelectedValue), Convert.ToInt32(ddlAño.SelectedValue));
        if (lista.Count > 0)
        {
            ListView1.Visible = true;
            lblMensajeCuadrilla1.Text = "";
            ddlCuadrilla.DataSource = lista;
            ddlCuadrilla.DataTextField = "IdCuadrilla";
            ddlCuadrilla.DataValueField = "IdCuadrilla";
            ddlCuadrilla.DataBind();
        }
        else
        {
            ListView1.Visible = false;
            lblMensajeCuadrilla1.Text = "No se han encontrado CUADRILLAS DISPONIBLES";
            ddlCuadrilla.DataSource = lista;
            ddlCuadrilla.DataTextField = "IdCuadrilla";
            ddlCuadrilla.DataValueField = "IdCuadrilla";
            ddlCuadrilla.DataBind();
        }

         
       
    }
    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        //this.btnRegistrar.Enabled = true;
        int var = 0;
        List<Herramienta> listado;
        if (ViewState["listaHerramienmtas"] == null)
            listado = new List<Herramienta>();
        else
        {
            listado = (List<Herramienta>)ViewState["listaHerramienmtas"];
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

            ViewState["listaHerramienmtas"] = listado;

            if (listado.Count > 0)
            {
                this.gvHerramientas.DataSource = listado;
                this.gvHerramientas.DataBind();
            }
        }


    }

    protected void gvHerramienta_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRow")
        {
            int nroHerramienta = Convert.ToInt32(e.CommandArgument);

            List<Herramienta> listado;
            listado = (List<Herramienta>)ViewState["listaHerramienmtas"];

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

    protected void gvHerramientasAsignadas_RowCommand(object sender, GridViewCommandEventArgs e)
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
        
        if (e.CommandName == "DeleteRow")
        {
            int nroHerramienta = Convert.ToInt32(e.CommandArgument);

            List<Herramienta> listado;
            listado = (List<Herramienta>)ViewState["lista"];

            foreach (Herramienta her in listado)
            {
                if (her.NroHerramienta == nroHerramienta)
                {
                    if (DateTime.Now.Month == mes && DateTime.Now.Year == año)
                    {
                        { fechaFin = DateTime.Now; }
                        listado.Remove(her);

                        int herra = Datos.getCuadrillas().actualizarFechFinHistorialHerramienta(nroHerramienta, Convert.ToInt32(ddlCuadrilla.SelectedValue), Convert.ToInt32(ddlMes.SelectedValue), Convert.ToInt32(ddlAño.SelectedValue));
                        int actualizar = Datos.getCuadrillas().actualizarFechFinHerramienta(nroHerramienta, Convert.ToInt32(ddlCuadrilla.SelectedValue), fechaFin);
                        if (herra > 0 && actualizar >0)
                        { Datos.commit(); }
                        break;
                    }
                    else
                    {
                        listado.Remove(her);

                        int herra = Datos.getCuadrillas().eliminarHistorialHerramienta(nroHerramienta, Convert.ToInt32(ddlCuadrilla.SelectedValue), Convert.ToInt32(ddlMes.SelectedValue), Convert.ToInt32(ddlAño.SelectedValue));
                        int eliminar = Datos.getCuadrillas().eliminarHerramientaXCuadrilla(nroHerramienta, Convert.ToInt32(ddlCuadrilla.SelectedValue), fechaInicio);
                        if (herra > 0 && eliminar>0)
                        { Datos.commit(); }
                        break;
                    }
                    
                }
            }
            

            this.gvHerramientasAsignadas.DataSource = listado;
            this.gvHerramientasAsignadas.DataBind();
        }

    }

    protected void btnAsignar_Click(object sender, EventArgs e)
    {
        ModalPopupConfirmacion.Show();   
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
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
        
        int idherramienta;
        foreach (GridViewRow row in this.gvHerramientas.Rows)
        {
            idherramienta = Convert.ToInt32(row.Cells[0].Text);
            int herra = Datos.getCuadrillas().insertarHerramientaXCuadrilla(idherramienta, Convert.ToInt32(ddlCuadrilla.SelectedValue));
            //int estadoHerra = Datos.getCuadrillas().actualizarEstadoHerramientaAAsignada(idherramienta);
            if(DateTime.Now.Month == mes && DateTime.Now.Year == año)
            {fechaInicio=DateTime.Now;}
            int insertarHistorial = Datos.getHerramienta().crearHistorialHerramientaCuadrilla(idherramienta, fechaInicio, fechaFin, "Ninguna", Convert.ToInt32(ddlCuadrilla.SelectedValue),2);
            if (herra > 0 && insertarHistorial > 0)
            {
                Datos.commit();
            }
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
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }


    protected void ddlMes_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<Cuadrilla> lista = new List<Cuadrilla>();
        lista = Datos.getCuadrillas().getCuadrillas(Convert.ToInt32(ddlMes.SelectedValue), Convert.ToInt32(ddlAño.SelectedValue));

        if (lista.Count > 0)
        {
            ListView1.Visible = true;
            lblMensajeCuadrilla1.Text = "";
            ddlCuadrilla.DataSource = lista;
            ddlCuadrilla.DataTextField = "IdCuadrilla";
            ddlCuadrilla.DataValueField = "IdCuadrilla";
            ddlCuadrilla.DataBind();
            ddlTipoHerramienta.Enabled = true;
            ddlHerramienta.Enabled = true;
            btnAgregar.Enabled = true;
            this.btnAsignar.Enabled = true;
            List<Herramienta> listaHerramienta = new List<Herramienta>();
            listaHerramienta = Datos.getCuadrillas().getHerramientaXCuadrilla(Convert.ToInt32(ddlCuadrilla.SelectedValue), Convert.ToInt32(ddlMes.SelectedValue), Convert.ToInt32(ddlAño.SelectedValue));
            if (listaHerramienta.Count > 0)
            {
                ViewState["lista"] = listaHerramienta;
                gvHerramientasAsignadas.DataSource = listaHerramienta;
                gvHerramientasAsignadas.DataBind();
                LblMensaje.Text = "";
            }
            else
            {
                ListView1.Visible = false;
                lblMensajeCuadrilla1.Text = "No se han encontrado CUADRILLAS DISPONIBLES";
                ddlCuadrilla.DataSource = lista;
                ddlCuadrilla.DataTextField = "IdCuadrilla";
                ddlCuadrilla.DataValueField = "IdCuadrilla";
                ddlCuadrilla.DataBind();
                LblMensaje.Text = "La Cuadrilla no tiene Herramientas asignadas actualmente";
            }


        }


    }
    protected void ddlAño_SelectedIndexChanged(object sender, EventArgs e)
    {

        List<Cuadrilla> lista = new List<Cuadrilla>();
        lista = Datos.getCuadrillas().getCuadrillas(Convert.ToInt32(ddlMes.SelectedValue), Convert.ToInt32(ddlAño.SelectedValue));

        if (lista.Count > 0)
        {
            ListView1.Visible = true;
            lblMensajeCuadrilla1.Text = "";
            ddlCuadrilla.DataSource = lista;
            ddlCuadrilla.DataTextField = "IdCuadrilla";
            ddlCuadrilla.DataValueField = "IdCuadrilla";
            ddlCuadrilla.DataBind();
            ddlTipoHerramienta.Enabled = true;
            ddlHerramienta.Enabled = true;
            btnAgregar.Enabled = true;
            this.btnAsignar.Enabled = true;
            List<Herramienta> listaHerramienta = new List<Herramienta>();
            listaHerramienta = Datos.getCuadrillas().getHerramientaXCuadrilla(Convert.ToInt32(ddlCuadrilla.SelectedValue), Convert.ToInt32(ddlMes.SelectedValue), Convert.ToInt32(ddlAño.SelectedValue));
            if (listaHerramienta.Count > 0)
            {
                ViewState["lista"] = listaHerramienta;
                gvHerramientasAsignadas.DataSource = listaHerramienta;
                gvHerramientasAsignadas.DataBind();
                LblMensaje.Text = "";
            }
            else
            {
                ListView1.Visible = false;
                lblMensajeCuadrilla1.Text = "No se han encontrado CUADRILLAS DISPONIBLES";
                ddlCuadrilla.DataSource = lista;
                ddlCuadrilla.DataTextField = "IdCuadrilla";
                ddlCuadrilla.DataValueField = "IdCuadrilla";
                ddlCuadrilla.DataBind();
                LblMensaje.Text = "La Cuadrilla no tiene Herramientas asignadas actualmente";
            }


        }

    }
    protected void gvHerramientasAsignadas_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void ddlTipoHerramienta_SelectedIndexChanged(object sender, EventArgs e)
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
        List<Herramienta> lista = new List<Herramienta>();
        lista = Datos.getHerramienta().getHERRAMIENTA(Convert.ToInt32(ddlMes.SelectedValue), Convert.ToInt32(ddlAño.SelectedValue), Convert.ToInt32(ddlTipoHerramienta.SelectedValue), fechaInicio);
        ddlHerramienta.DataSource = lista;
        ddlHerramienta.DataTextField = "Descripcion";
        ddlHerramienta.DataValueField = "NroHerramienta";
        ddlHerramienta.DataBind();
    }
}
