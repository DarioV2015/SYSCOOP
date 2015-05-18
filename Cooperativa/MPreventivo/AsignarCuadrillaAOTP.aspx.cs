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

public partial class MPreventivo_AsignarCuadrillaAOTP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //los parámetros vienen del CU GenerarOTP

            string descripcion = Request.Params["descripcion"];//"Repación de tendido";
            DateTime fechaInicio = Convert.ToDateTime(Request.Params["fechainicio"].ToString());//Convert.ToDateTime("16/09/2014");
            DateTime fechaFin = Convert.ToDateTime(Request.Params["fechafin"].ToString());//Convert.ToDateTime("20/09/2014");

            ViewState["fechaInicio"] = fechaInicio;
            ViewState["fechaFin"] = fechaFin;

            lblDescripcionOTP.Text = descripcion;
            lblFechaInicio.Text = fechaInicio.ToString("dd/MM/yyyy");
            lblFechaFin.Text = fechaFin.ToString("dd/MM/yyyy");

            List<HistorialCuadrilla> listadoCuadrillas = (List<HistorialCuadrilla>)Datos.getOTP().traerCuadrillasDisponibles(fechaInicio, fechaFin);

            if (listadoCuadrillas.Count == 0)
            {
                lblNoCuadrillas.Visible = true;
                lblNoCuadrillas.Text = "No hay Cuadrillas disponibles entre el " + fechaInicio.ToString("dd/MM/yyy") + " y el " + fechaFin.ToString("dd/MM/yyy") + ".";
            }
            else
            {
                lblNoCuadrillas.Visible = false;

                gvCuadrillasDisponibles.DataSource = listadoCuadrillas;
                gvCuadrillasDisponibles.DataBind();
            }

        }
    }
    protected void gvCuadrillasDisponibles_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //0: radio, 1:nroCuadrilla, 2:fechaInicio, 3:fechaFin, 4:idEstado

        e.Row.Cells[4].Visible = false;

        foreach (GridViewRow row in gvCuadrillasDisponibles.Rows)
        {
            DateTime fechaInicio = Convert.ToDateTime(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[2].Text);
            gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[2].Text = fechaInicio.ToString("dd/MM/yyyy");

            DateTime fechaFin = Convert.ToDateTime(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[3].Text);
            gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[3].Text = fechaFin.ToString("dd/MM/yyyy");
        }
    }
    protected void grillaHistorialNuevo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //0:nroCuadrilla, 1:fechaInicio, 2:fechaFin, 3:idEstado

        e.Row.Cells[3].Visible = false;

        foreach (GridViewRow row in grillaHistorialNuevo.Rows)
        {
            DateTime fechaInicio = Convert.ToDateTime(grillaHistorialNuevo.Rows[row.RowIndex].Cells[1].Text);
            grillaHistorialNuevo.Rows[row.RowIndex].Cells[1].Text = fechaInicio.ToString("dd/MM/yyyy");

            DateTime fechaFin = Convert.ToDateTime(grillaHistorialNuevo.Rows[row.RowIndex].Cells[2].Text);
            grillaHistorialNuevo.Rows[row.RowIndex].Cells[2].Text = fechaFin.ToString("dd/MM/yyyy");
        }
    }
    protected void grillaHistorialActualizado_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //0:nroCuadrilla, 1:fechaInicio, 2:fechaFin, 3:idEstado

        e.Row.Cells[3].Visible = false;

        foreach (GridViewRow row in grillaHistorialActualizado.Rows)
        {
            DateTime fechaInicio = Convert.ToDateTime(grillaHistorialActualizado.Rows[row.RowIndex].Cells[1].Text);
            grillaHistorialActualizado.Rows[row.RowIndex].Cells[1].Text = fechaInicio.ToString("dd/MM/yyyy");

            DateTime fechaFin = Convert.ToDateTime(grillaHistorialActualizado.Rows[row.RowIndex].Cells[2].Text);
            grillaHistorialActualizado.Rows[row.RowIndex].Cells[2].Text = fechaFin.ToString("dd/MM/yyyy");
        }
    }
    protected void rdbCuadrilla_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvCuadrillasDisponibles.Rows)
        {
            RadioButton rdbCuadrilla = (RadioButton)row.FindControl("gvCuadrillasDisponibles_rdbCuadrilla");
            if (rdbCuadrilla.Checked)
            {
                sdsDetalleCuadrilla.SelectParameters["nroCuadrilla"].DefaultValue = gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[1].Text;
                ViewState["nroCuadrilla"] = gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[1].Text;
            }

        }

        DateTime fechaInicio = Convert.ToDateTime(ViewState["fechaInicio"]); //de la OTP
        DateTime fechaFin = Convert.ToDateTime(ViewState["fechaFin"]);

        List<HistorialCuadrilla> hcActualizado = new List<HistorialCuadrilla>();
        List<HistorialCuadrilla> hcNuevo = new List<HistorialCuadrilla>();

        HistorialCuadrilla hc;
        HistorialCuadrilla hcAActualizar;
        HistorialCuadrilla hc1;
        HistorialCuadrilla hcN;


        foreach (GridViewRow row in gvCuadrillasDisponibles.Rows)
        {
            RadioButton rdbCuadrilla = (RadioButton)row.FindControl("gvCuadrillasDisponibles_rdbCuadrilla");
            if (rdbCuadrilla.Checked)
            {
                //0: radio, 1:nroCuadrilla, 2:fechaInicio, 3:fechaFin, 4:idEstado

                if ((Convert.ToDateTime(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[2].Text)) == fechaInicio && (Convert.ToDateTime(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[3].Text) != fechaFin))
                {
                    //1er caso: fechainicio son iguales pero fechafin distintas
                    // creo un Historial Nuevo 

                    hc = new HistorialCuadrilla();

                    hc.FechaInicio = fechaInicio;  //fecha de la OTP
                    hc.NroCuadrilla = Convert.ToInt32(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[1].Text);
                    hc.FechaFin = fechaFin;
                    hc.IdEstado = 2; //Asignada a esa Cuadrilla

                    int filasHC = Convert.ToInt32(Datos.getOTP().crearHistorialCuadrilla(hc));

                    hcNuevo.Add(hc);

                    //actualizo el Historial anterior de la Cuadrilla

                    //busco la HCuadrilla a actualizar

                    hcAActualizar = new HistorialCuadrilla();

                    hcAActualizar.FechaInicio = Convert.ToDateTime(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[2].Text);
                    hcAActualizar.NroCuadrilla = Convert.ToInt32(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[1].Text);
                    hcAActualizar.FechaFin = Convert.ToDateTime(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[3].Text);
                    hcAActualizar.IdEstado = Convert.ToInt32(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[4].Text);

                    //nuevos valores para la HCuadrilla
                    hc1 = new HistorialCuadrilla();

                    //fecha de inicio al dia siguiente de la fechaFin del Historial Nuevo
                    hc1.FechaInicio = fechaFin.AddDays(1);
                    hc1.NroCuadrilla = Convert.ToInt32(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[1].Text);
                    //fechaFin la de la Cuadrilla
                    hc1.FechaFin = Convert.ToDateTime(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[3].Text);
                    hc1.IdEstado = 1; //Disponible en el tiempo que no abarca la OTP

                    int hcActualizadas = Convert.ToInt32(Datos.getOTP().setearHistorialCuadrilla(hcAActualizar, hc1));

                    hcActualizado.Add(hc1);
                }

                if ((Convert.ToDateTime(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[2].Text)) != fechaInicio && (Convert.ToDateTime(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[3].Text) == fechaFin))
                {
                    //2do caso: fechainicio distintas iguales pero fechafin son iguales
                    // creo un Historial Nuevo

                    hc = new HistorialCuadrilla();

                    hc.FechaInicio = fechaInicio;  //fecha de la OTP
                    hc.NroCuadrilla = Convert.ToInt32(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[1].Text);
                    hc.FechaFin = fechaFin; //cualquiera, es la misma
                    hc.IdEstado = 2; //Asignada a esa Cuadrilla

                    int filasHC = Convert.ToInt32(Datos.getOTP().crearHistorialCuadrilla(hc));

                    hcNuevo.Add(hc);

                    //actualizo el Historial anterior de la Cuadrilla

                    //busco la HCuadrilla a actualizar

                    hcAActualizar = new HistorialCuadrilla();

                    hcAActualizar.FechaInicio = Convert.ToDateTime(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[2].Text);
                    hcAActualizar.NroCuadrilla = Convert.ToInt32(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[1].Text);
                    hcAActualizar.FechaFin = Convert.ToDateTime(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[3].Text);
                    hcAActualizar.IdEstado = Convert.ToInt32(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[4].Text);

                    //nuevos valores para la HCuadrilla
                    hc1 = new HistorialCuadrilla();

                    //fecha de inicio es la del Historial
                    hc1.FechaInicio = Convert.ToDateTime(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[2].Text);
                    hc1.NroCuadrilla = Convert.ToInt32(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[1].Text);
                    //fechaFin es la fechaInicio de la OTP - 1
                    hc1.FechaFin = fechaInicio.AddDays(-1);
                    hc1.IdEstado = 1; //Disponible en el tiempo que no abarca la OTP

                    int hcActualizadas = Convert.ToInt32(Datos.getOTP().setearHistorialCuadrilla(hcAActualizar, hc1));

                    hcActualizado.Add(hc1);

                }

                if ((Convert.ToDateTime(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[2].Text)) == fechaInicio && (Convert.ToDateTime(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[3].Text) == fechaFin))
                {
                    //3er caso: las fechas de inicio y fin son iguales
                    // NO creo un Historial Nuevo, solo seteo el estado 

                    //busco la HCuadrilla a actualizar

                    hcAActualizar = new HistorialCuadrilla();

                    hcAActualizar.FechaInicio = Convert.ToDateTime(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[2].Text);
                    hcAActualizar.NroCuadrilla = Convert.ToInt32(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[1].Text);
                    hcAActualizar.FechaFin = Convert.ToDateTime(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[3].Text);
                    hcAActualizar.IdEstado = Convert.ToInt32(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[4].Text);

                    int hcActualizadas = Convert.ToInt32(Datos.getOTP().setearEstadoHistorialCuadrilla(hcAActualizar));
                }

                if ((Convert.ToDateTime(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[2].Text)) != fechaInicio && (Convert.ToDateTime(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[3].Text) != fechaFin))
                {
                    //4to caso: ambas fechas son distintas
                    // creo el 1er Historial Nuevo

                    hc = new HistorialCuadrilla();

                    hc.FechaInicio = fechaInicio;  //fecha de la OTP
                    hc.NroCuadrilla = Convert.ToInt32(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[1].Text);
                    hc.FechaFin = fechaFin; //fecha de la OTP
                    hc.IdEstado = 2; //Asignada a esa Cuadrilla

                    int filasHC = Convert.ToInt32(Datos.getOTP().crearHistorialCuadrilla(hc));

                    hcNuevo.Add(hc);

                    //creo el 2do Historial Nuevo

                    hcN = new HistorialCuadrilla();

                    hcN.FechaInicio = fechaFin.AddDays(1);  //fechaFin de OTP + 1
                    hcN.NroCuadrilla = Convert.ToInt32(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[1].Text);
                    hcN.FechaFin = Convert.ToDateTime(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[3].Text); ; //fechaFin HCuadrilla
                    hcN.IdEstado = 2; //Asignada a esa Cuadrilla

                    int filasHC2 = Convert.ToInt32(Datos.getOTP().crearHistorialCuadrilla(hcN));

                    hcNuevo.Add(hcN);

                    //actualizo el Historial anterior de la Cuadrilla

                    //busco la HCuadrilla a actualizar

                    hcAActualizar = new HistorialCuadrilla();

                    hcAActualizar.FechaInicio = Convert.ToDateTime(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[2].Text);
                    hcAActualizar.NroCuadrilla = Convert.ToInt32(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[1].Text);
                    hcAActualizar.FechaFin = Convert.ToDateTime(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[3].Text);
                    hcAActualizar.IdEstado = Convert.ToInt32(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[4].Text);

                    //nuevos valores para la HCuadrilla
                    hc1 = new HistorialCuadrilla();

                    //fecha de inicio es la del Historial
                    hc1.FechaInicio = Convert.ToDateTime(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[2].Text);
                    hc1.NroCuadrilla = Convert.ToInt32(gvCuadrillasDisponibles.Rows[row.RowIndex].Cells[1].Text);
                    //fechaFin es la fechaInicio de la OTP - 1
                    hc1.FechaFin = fechaInicio.AddDays(-1);
                    hc1.IdEstado = 1; //Disponible en el tiempo que no abarca la OTP

                    int hcActualizadas = Convert.ToInt32(Datos.getOTP().setearHistorialCuadrilla(hcAActualizar, hc1));

                    hcActualizado.Add(hc1);

                }
            }
        }

        
        if (hcNuevo.Count != 0)
        {
            grillaHistorialNuevo.DataSource = hcNuevo;
            grillaHistorialNuevo.DataBind();
        }

        if (hcActualizado.Count != 0)
        {
            grillaHistorialActualizado.DataSource = hcActualizado;
            grillaHistorialActualizado.DataBind();
        }

        panelHistoriales.Visible = true;
    }
    protected void btnAsignarCuadrilla_Click(object sender, EventArgs e)
    {
        ModalPopUpAsignar.Show();
    }
    protected void btnCancelarAsignarCuadrilla_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarAsignar.Show();
    }
    protected void btnAceptarAsignacion_Click(object sender, EventArgs e)  //popUpConfirmacion
    {
        Response.Redirect("/Cooperativa/MPreventivo/GenerarOTP.aspx?nrocuadrilla=" + ViewState["nroCuadrilla"]);

        ModalPopUpAsignar.Hide();
        ModalPopupExito.Show();
    }
    protected void btnCancelarAsignacion_Click(object sender, EventArgs e)
    {
        ModalPopUpAsignar.Hide();
    }
    protected void btnAceptarCancelacion_Click(object sender, EventArgs e)  //popUpCancelar
    {
        Response.Redirect("/Cooperativa/MPreventivo/GenerarOTP.aspx", true);
    }
    protected void btnCancelarCancelacion_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarAsignar.Hide();
    }
    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e) //popUpExito
    {
        Response.Redirect("/Cooperativa/MPreventivo/GenerarOTP.aspx", true);
    }
}
