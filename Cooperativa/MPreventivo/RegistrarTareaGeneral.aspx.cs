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

public partial class MPreventivo_RegistrarTareaGeneral : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int tareaNro = Datos.getTarea().obtenerUltimoIdTarea();
        lblNroTarea.Text = Convert.ToString(tareaNro);
        

        if ((string)Session["ClickBoton"] == "SI")
        {
            ViewState["TareaNro"] = tareaNro;
            txtNombre.Text = Convert.ToString(Session["NombreTarea"]);
            this.txtDescripcion.Text = Convert.ToString(Session["descripcion"]);
            if ((string)Session["radioAño"] != "")
            {
                this.rdbAño.Checked = true;
                this.lblCantAños.Visible = true;
                this.ddlCantAño.Visible = true;
                this.ddlCantAño.SelectedValue = Convert.ToString(Session["ComboAño"]);

            }
            if ((string)Session["radioMes"] != "")
            {
                this.rdbMensual.Checked = true;
                this.lblCantMeses.Visible = true;
                this.ddlCantMeses.Visible = true;
                this.ddlCantMeses.SelectedValue = Convert.ToString(Session["ComboMes"]);
            }
            if ((string)Session["radioSemana"] != "")
            {
                this.rdbSemanal.Checked = true;
                this.lblCantSemanas.Visible = true;
                this.ddlCantSemanas.Visible = true;
                this.ddlCantSemanas.SelectedValue = Convert.ToString(Session["ComboSemana"]);
            }
            if ((string)Session["radioDia"] != "")
            {
                this.rdbDiario.Checked = true;
                this.lblCantDias.Visible = true;
                this.ddlCantDias.Visible = true;
                ddlCantDias.SelectedValue = Convert.ToString(Session["ComboDia"]);

            }
        }

    }
    protected void btnNuevaActividad_Click(object sender, EventArgs e)
    {
        Session["ClickBoton"] = "SI";
        String nombre = txtNombre.Text;
        Session["NombreTarea"] = nombre;
        String descripcion = this.txtDescripcion.Text;
        Session["descripcion"] = descripcion;
        if (this.rdbAño.Checked)
        { Session["ComboAño"] = Convert.ToInt32(ddlCantAño.SelectedValue); }
        if (this.rdbMensual.Checked)
        { Session["ComboMes"] = Convert.ToInt32(this.ddlCantMeses.SelectedValue); }
        if (this.rdbSemanal.Checked)
        { Session["ComboSemana"] = Convert.ToInt32(this.ddlCantSemanas.SelectedValue); }
        if (this.rdbDiario.Checked)
        { Session["ComboDia"] = Convert.ToInt32(this.ddlCantDias.SelectedValue); }


        Response.Redirect("/Cooperativa/MPreventivo/RegistrarActividad.aspx", true);
    }
    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        lblMensaje.Text = "Holaaa";
        ModalPopupConfirmacion.Show();
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        UpdatePanel2.Update();
        ModalPopupCancelarRegistrar.Show();
    }
    protected void rdbAño_CheckedChanged(object sender, EventArgs e)
    {
        UpdatePanel1.Update();
        this.lblCantAños.Visible = true;
        this.ddlCantAño.Visible = true;
        this.lblCantMeses.Visible = false;
        this.ddlCantMeses.Visible = false;
        this.lblCantSemanas.Visible = false;
        this.ddlCantSemanas.Visible = false;
        this.lblCantDias.Visible = false;
        this.ddlCantDias.Visible = false;
        Session["radioAño"] = "Año";
        Session["radioMes"] = "";
        Session["radioSemana"] = "";
        Session["radioDia"] = "";
    }
    protected void rdbMensual_CheckedChanged(object sender, EventArgs e)
    {
        UpdatePanel1.Update();
        this.lblCantAños.Visible = false;
        this.ddlCantAño.Visible = false;
        this.lblCantMeses.Visible = true;
        this.ddlCantMeses.Visible = true;
        this.lblCantSemanas.Visible = false;
        this.ddlCantSemanas.Visible = false;
        this.lblCantDias.Visible = false;
        this.ddlCantDias.Visible = false;
        Session["radioMes"] = "Mes";
        Session["radioAño"] = "";
        Session["radioSemana"] = "";
        Session["radioDia"] = "";
    }
    protected void rdbSemanal_CheckedChanged(object sender, EventArgs e)
    {
        UpdatePanel1.Update();
        this.lblCantAños.Visible = false;
        this.ddlCantAño.Visible = false;
        this.lblCantMeses.Visible = false;
        this.ddlCantMeses.Visible = false;
        this.lblCantSemanas.Visible = true;
        this.ddlCantSemanas.Visible = true;
        this.lblCantDias.Visible = false;
        this.ddlCantDias.Visible = false;
        Session["radioSemana"] = "Semana";
        Session["radioAño"] = "";
        Session["radioMes"] = "";
        Session["radioDia"] = "";
    }
    protected void rdbDiario_CheckedChanged1(object sender, EventArgs e)
    {
        UpdatePanel1.Update();
        this.lblCantAños.Visible = false;
        this.ddlCantAño.Visible = false;
        this.lblCantMeses.Visible = false;
        this.ddlCantMeses.Visible = false;
        this.lblCantSemanas.Visible = false;
        this.ddlCantSemanas.Visible = false;
        this.lblCantDias.Visible = true;
        this.ddlCantDias.Visible = true;
        Session["radioDia"] = "Dia";
        Session["radioAño"] = "";
        Session["radioMes"] = "";
        Session["radioSemana"] = "";
    }
    protected void gvActividades_rdbSeleccionar_CheckedChanged(object sender, EventArgs e)
    {
        int idActividad;

        foreach (GridViewRow row in this.gvActividades.Rows)
        {
            RadioButton gvActividades_rdbSeleccionar = (RadioButton)row.FindControl("gvActividades_rdbSeleccionar");
            if (gvActividades_rdbSeleccionar.Checked)
            {

                idActividad = Convert.ToInt32(row.Cells[1].Text);

                ViewState["idActividad"] = idActividad;

                //gvActividades.Rows[gvActividades.SelectedIndex].BackColor = System.Drawing.Color.Red;
            }

        }
    }
    protected void btnAceptarRegistrar_Click(object sender, EventArgs e)
    {
        int dias = 0;
        int fila1 = 0;
        int nroTarea = Datos.getTarea().obtenerUltimoIdTarea();
        if (this.rdbAño.Checked)
        { dias = Convert.ToInt32(ddlCantAño.SelectedValue) * 365; }
        if (this.rdbMensual.Checked)
        { dias = Convert.ToInt32(this.ddlCantMeses.SelectedValue) * 30; }
        if (this.rdbSemanal.Checked)
        { dias = Convert.ToInt32(this.ddlCantSemanas.SelectedValue) * 7; }
        if (this.rdbDiario.Checked)
        { dias = Convert.ToInt32(this.ddlCantDias.SelectedValue); }

        if (gvActividades.Rows.Count > 0)
        {
            this.lblMensaje.Text = "";
            int fila = Datos.getTarea().insertarTarea(nroTarea, this.txtNombre.Text, this.txtDescripcion.Text, dias);
            if (fila > 0)
            {
                foreach (GridViewRow row in this.gvActividades.Rows)
                {
                    RadioButton gvActividades_rdbSeleccionar = (RadioButton)row.FindControl("gvActividades_rdbSeleccionar");
                    if (gvActividades_rdbSeleccionar.Checked)
                    {
                        int nroActividad = Convert.ToInt32(row.Cells[1].Text);
                        fila1 = Datos.getTarea().insertarActividadXTarea(nroTarea, nroActividad);
                    }


                }
                if (fila1 > 0)
                { Datos.commit();
                Session["ClickBoton"] = "";
                Session["NombreTarea"] = "";
                Session["descripcion"] = "";
                Session["ComboAño"] = "";
                Session["ComboMes"] = "";
                Session["ComboSemana"] = "";
                Session["ComboDia"] = "";
                Session["radioDia"] = "";
                Session["radioAño"] = "";
                Session["radioMes"] = "";
                Session["radioSemana"] = "";

                ModalPopupConfirmacion.Hide();
                ModalPopupExito.Show();

                }
            }
            else
            { this.lblMensaje.Text = "No se ha seleccionado ninguna ACTIVIDAD"; }

        }
        ModalPopupConfirmacion.Hide();
    }
    protected void btnCancelarRegistrar_Click(object sender, EventArgs e)
    {
        ModalPopupConfirmacion.Hide();
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
        ModalPopupExito.Hide();
        Response.Redirect("/Cooperativa/Default.aspx", true);

    }

   



}
