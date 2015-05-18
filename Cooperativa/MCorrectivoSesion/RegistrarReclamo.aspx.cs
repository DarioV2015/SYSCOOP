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

public partial class MCorrectivoSesion_RegistrarReclamo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Convert.ToInt32(Session["haciaRegistrarReclamo"]) == 1) //viene de Registrar Tipo Reclamo Típico
            {
                tabconteiner1.ActiveTabIndex = 2;

                if (Convert.ToInt32(Session["seleccionoSocio"]) == 1) //si seleccionó Socio
                {
                    rdbSocio.Checked = true;

                    rdbNroSocio.Visible = true;
                    rdbDocumento.Visible = true;
                    rdbCUIT.Visible = true;
                    rdbNoSocio.Checked = false;

                    PanelSocioEmpresa.Visible = false;
                    PanelSocioParticular.Visible = false;

                    if (Convert.ToInt32(Session["seleccionoNroSocio"]) == 1)
                    {
                        rdbNroSocio.Checked = true;
                        txtNroSocio.Text = Session["nroSocio"].ToString();

                        lblNroSocio.Visible = true;
                        txtNroSocio.Visible = true;
                        lblTipoDocumento.Visible = false;
                        comboTipoDocumento.Visible = false;
                        lblNroDocumento.Visible = false;
                        txtNroDocumento.Visible = false;
                        lblCUIT.Visible = false;
                        txtNroCUIT.Visible = false;

                        SDSMedidoresSocio.SelectParameters["IDSOCIO"].DefaultValue = Session["nroSocio"].ToString();

                        foreach (GridViewRow rows in gvMedidores.Rows)
                        {
                            RadioButton medidorS = (RadioButton)rows.FindControl("gvMedidores_rdbSeleccionado");

                            if (Convert.ToInt32(Session["idMedidorSeleccionado"]) == Convert.ToInt32(gvMedidores.Rows[rows.RowIndex].Cells[1].Text))
                                medidorS.Checked = true;
                        }

                        PanelMedidores.Visible = true;
                        panelNuevaDir.Visible = true;
                        panelDetalleReclamo.Visible = true;
                    }

                    if (Convert.ToInt32(Session["seleccionoNroDocumento"]) == 1)
                    {
                        comboTipoDocumento.SelectedIndex = Convert.ToInt32(Session["selecciontipoDocumento"]);
                        txtNroDocumento.Text = Session["nroDocumento"].ToString();
                        rdbNroSocio.Checked = false;
                        rdbDocumento.Checked = true;
                        rdbCUIT.Checked = false;

                        lblNroSocio.Visible = false;
                        txtNroSocio.Visible = false;
                        lblTipoDocumento.Visible = true;
                        comboTipoDocumento.Visible = true;
                        lblNroDocumento.Visible = true;
                        txtNroDocumento.Visible = false;
                        lblCUIT.Visible = false;
                        txtNroCUIT.Visible = false;
                    }
                    if (Convert.ToInt32(Session["seleccionoNroCuit"]) == 1)
                    {
                        txtNroCUIT.Text = Session["nroCuit"].ToString();
                        rdbNroSocio.Checked = false;
                        rdbDocumento.Checked = false;
                        rdbCUIT.Checked = true;

                        lblNroSocio.Visible = false;
                        txtNroSocio.Visible = false;
                        lblTipoDocumento.Visible = false;
                        comboTipoDocumento.Visible = false;
                        lblNroDocumento.Visible = false;
                        txtNroDocumento.Visible = false;
                        lblCUIT.Visible = true;
                        txtNroCUIT.Visible = true;
                    }

                    if (Convert.ToInt32(Session["socioParticularEncontrado"]) == 1)
                    {
                        PanelSocioParticular.Visible = true;

                        txtNroSocioP.Text = Session["nroSocioP"].ToString();
                        txtApellidoSocioP.Text = Session["apellidoSocioP"].ToString();
                        txtNombreSocioP.Text = Session["nombreSocioP"].ToString();
                        txtTipoDocP.Text = Session["tipoDocP"].ToString();
                        txtNroDocSocioP.Text = Session["nroDocP"].ToString();
                        txtCalleSocioP.Text = Session["calleP"].ToString();
                        txtNroCalleSocioP.Text = Session["nroCalleP"].ToString();
                        txtPisoSocioP.Text = Session["pisoP"].ToString();
                        txtDptoSocioP.Text = Session["dptoP"].ToString();
                        txtZonaSocioP.Text = Session["zonaP"].ToString();
                    }
                }

                if (Convert.ToInt32(Session["seleccionoNoSocio"]) == 1) //si seleccionó No Socio
                {
                    rdbNoSocio.Checked = true;

                    rdbNroSocio.Visible = false;
                    rdbDocumento.Visible = false;
                    rdbCUIT.Visible = false;

                    rdbNroSocio.Checked = false;
                    rdbDocumento.Checked = false;
                    rdbCUIT.Checked = false;
                    rdbSocio.Checked = false;

                    lblNroSocio.Visible = false;
                    txtNroSocio.Visible = false;
                    lblTipoDocumento.Visible = false;
                    comboTipoDocumento.Visible = false;
                    lblNroDocumento.Visible = false;
                    txtNroDocumento.Visible = false;
                    lblCUIT.Visible = false;
                    txtNroCUIT.Visible = false;

                    PanelSocioEmpresa.Visible = false;
                    PanelSocioParticular.Visible = false;
                    PanelMedidores.Visible = false;
                    PanelNoSocio.Visible = true;
                    panelNuevaDir.Visible = false;
                    panelNuevaDireccion.Visible = true;
                    panelDetalleReclamo.Visible = true;
                }

            }
            else
            {

                tabconteiner1.ActiveTabIndex = 0;

                limpiarCampos(this.Controls);

                rdbNroSocio.Visible = false;
                rdbDocumento.Visible = false;
                rdbCUIT.Visible = false;
                lblNroSocio.Visible = false;
                txtNroSocio.Visible = false;
                lblTipoDocumento.Visible = false;
                comboTipoDocumento.Visible = false;
                lblNroDocumento.Visible = false;
                txtNroDocumento.Visible = false;
                lblCUIT.Visible = false;
                txtNroCUIT.Visible = false;
            }
        }

        if (Convert.ToInt32(Session["cambioReclamo"]) == 1)
        {
            PanelMedidores.Visible = true;
            panelNuevaDir.Visible = true;
            panelDetalleReclamo.Visible = true;

            txtReclamo.Text = Session["reclamo"].ToString();
        }

        limpiarCampos(this.Controls);
    }
    public void limpiarCampos(ControlCollection controles)
    {
        foreach (Control control in controles)
        {
            if (control is TextBox)
                ((TextBox)control).Text = string.Empty;
            else if (control is DropDownList)
                ((DropDownList)control).ClearSelection();
            //else if (control is RadioButtonList)
            //    ((RadioButtonList)control).ClearSelection();
            //else if (control is CheckBoxList)
            //    ((CheckBoxList)control).ClearSelection();
            else if (control is RadioButton)
                ((RadioButton)control).Checked = false;
            else if (control is CheckBox)
                ((CheckBox)control).Checked = false;
            //else if (control.HasControls())
            //    //Esta linea detécta un Control que contenga otros Controles
            //    //Así ningún control se quedará sin ser limpiado.
            //    CleanControl(control.Controls);
        }
    }
    protected void rdbSocio_CheckedChanged(object sender, EventArgs e)
    {
        //panelPorSocio.Visible = true;

        Session["seleccionoSocio"] = 1;

        rdbNroSocio.Visible = true;
        rdbDocumento.Visible = true;
        rdbCUIT.Visible = true;
        rdbNoSocio.Checked = false;

        rdbNoSocio.Checked = false;
        rdbNroSocio.Checked = false;
        rdbDocumento.Checked = false;
        rdbCUIT.Checked = false;

        lblNroSocio.Visible = false;
        txtNroSocio.Visible = false;
        lblTipoDocumento.Visible = false;
        comboTipoDocumento.Visible = false;
        lblNroDocumento.Visible = false;
        txtNroDocumento.Visible = false;
        lblCUIT.Visible = false;
        txtNroCUIT.Visible = false;

        PanelSocioEmpresa.Visible = false;
        PanelSocioParticular.Visible = false;
        PanelMedidores.Visible = false;
        PanelNoSocio.Visible = false;
        panelNuevaDir.Visible = false;
        panelNuevaDireccion.Visible = false;
        panelDetalleReclamo.Visible =false;

        btnBuscar.Visible = true;

        txtNroSocio.Text = "";
        comboTipoDocumento.SelectedIndex = 0;
        txtNroDocumento.Text = "";
        txtNroCUIT.Text = "";
    }
    protected void rdbNroSocio_CheckedChanged(object sender, EventArgs e)
    {
        txtNroSocio.Focus();

        Session["seleccionoNroSocio"] = 1;

        rdbNoSocio.Checked = false;
        //rdbNroSocio.Checked = false;
        rdbDocumento.Checked = false;
        rdbCUIT.Checked = false;

        lblNroSocio.Visible = true;
        txtNroSocio.Visible = true;
        lblTipoDocumento.Visible = false;
        comboTipoDocumento.Visible = false;
        lblNroDocumento.Visible = false;
        txtNroDocumento.Visible = false;
        lblCUIT.Visible = false;
        txtNroCUIT.Visible = false;

        txtNroSocio.Text = "";
        comboTipoDocumento.SelectedIndex = 0;
        txtNroDocumento.Text = "";
        txtNroCUIT.Text = "";
    }
    protected void rdbDocumento_CheckedChanged(object sender, EventArgs e)
    {
        comboTipoDocumento.Focus();

        Session["seleccionoNroDocumento"] = 1;

        rdbNoSocio.Checked = false;
        rdbNroSocio.Checked = false;
        //rdbDocumento.Checked = false;
        rdbCUIT.Checked = false;

        lblNroSocio.Visible = false;
        txtNroSocio.Visible = false;
        lblTipoDocumento.Visible = true;
        comboTipoDocumento.Visible = true;
        comboTipoDocumento.SelectedIndex = 0;
        lblNroDocumento.Visible = true;
        txtNroDocumento.Visible = true;
        lblCUIT.Visible = false;
        txtNroCUIT.Visible = false;

        txtNroSocio.Text = "";
        comboTipoDocumento.SelectedIndex = 0;
        txtNroDocumento.Text = "";
        txtNroCUIT.Text = "";
    }
    protected void rdbCUIT_CheckedChanged(object sender, EventArgs e)
    {
        txtNroCUIT.Focus();

        Session["seleccionoCuit"] = 1;

        rdbNoSocio.Checked = false;
        rdbNroSocio.Checked = false;
        rdbDocumento.Checked = false;
        //rdbCUIT.Checked = false;

        lblNroSocio.Visible = false;
        txtNroSocio.Visible = false;
        lblTipoDocumento.Visible = false;
        comboTipoDocumento.Visible = false;
        lblNroDocumento.Visible = false;
        txtNroDocumento.Visible = false;
        lblCUIT.Visible = true;
        txtNroCUIT.Visible = true;

        txtNroSocio.Text = "";
        comboTipoDocumento.SelectedIndex = 0;
        txtNroDocumento.Text = "";
        txtNroCUIT.Text = "";
    }
    protected void rdbNoSocio_CheckedChanged(object sender, EventArgs e)
    {
        rdbNroSocio.Visible = false;
        rdbDocumento.Visible = false;
        rdbCUIT.Visible = false;

        Session["seleccionoNoSocio"] = 1;

        rdbNroSocio.Checked = false;
        rdbDocumento.Checked = false;
        rdbCUIT.Checked = false;
        rdbSocio.Checked = false;

        lblNroSocio.Visible = false;
        txtNroSocio.Visible = false;
        lblTipoDocumento.Visible = false;
        comboTipoDocumento.Visible = false;
        lblNroDocumento.Visible = false;
        txtNroDocumento.Visible = false;
        lblCUIT.Visible = false;
        txtNroCUIT.Visible = false;

        PanelSocioEmpresa.Visible = false;
        PanelSocioParticular.Visible = false;
        PanelMedidores.Visible = false;
        PanelNoSocio.Visible = true;
        panelNuevaDir.Visible = false;
        panelNuevaDireccion.Visible = true;
        panelDetalleReclamo.Visible = true;

        txtApellidoNoSocio.Focus();
        btnBuscar.Visible = true;

        txtNroSocio.Text = "";
        comboTipoDocumento.SelectedIndex = 0;
        txtNroDocumento.Text = "";
        txtNroCUIT.Text = "";
    }
    protected void comboTipoDocumento_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtNroDocumento.Focus();
    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        //Busqueda por número de Socio

        if (rdbNroSocio.Checked == true)
        {
            PanelNoSocio.Visible = false;

            int tipoSocio = Datos.getSocios().verificarTipoSocio(Convert.ToInt32(txtNroSocio.Text));

            if (tipoSocio == 0)
            {
                lblMensaje.Text = "El nro de socio indicado no corresponde a ningún Socio";

                PanelSocioParticular.Visible = false;
                PanelSocioEmpresa.Visible = false;
                PanelMedidores.Visible = false;
                panelDetalleReclamo.Visible = false;
                panelNuevaDir.Visible = false;
            }
            else
            {
                lblMensaje.Text = "";
                switch (tipoSocio)
                {
                    case 1:
                        {
                            //Socio Persona Fisica
                            PanelSocioParticular.Visible = true;
                            PanelSocioEmpresa.Visible = false;
                            //PanelMedidores.Visible = true;

                            Session["socioParticularEncontrado"] = 1;

                            panelDetalleReclamo.Visible = true;
                            panelNuevaDir.Visible = true;
                         

                            Socio s = Datos.getSocios().traerDatosSocioParticular(Int32.Parse(txtNroSocio.Text));

                            txtNroSocioP.Text = Convert.ToString(s.IdSocio);
                            txtApellidoSocioP.Text = Convert.ToString(s.Apellido);
                            txtNombreSocioP.Text = Convert.ToString(s.Nombre);
                            txtNroDocSocioP.Text = Convert.ToString(s.NroDocumento);
                            txtTipoDocP.Text = Convert.ToString(s.DescripcionTipoDoc);

                            //muestro el Domicilio del Socio

                            int nroSocio = 0;
                            if (txtNroSocio.Text != null)
                                nroSocio = Convert.ToInt32(txtNroSocio.Text);

                            int nroDoc = 0;
                            if (txtNroDocumento.Text != "")
                                nroDoc = Convert.ToInt32(txtNroDocumento.Text);

                            int idrdb = -1;
                            if (comboTipoDocumento.SelectedIndex != 0)
                                idrdb = Convert.ToInt32(comboTipoDocumento.SelectedItem.Value);
                            
                                int nroCuit = 0;
                            if (txtNroCUIT.Text != "")
                                nroCuit = Convert.ToInt32(txtNroCUIT.Text);

                            Domicilio d = Datos.getDomicilios().traerDomicilioSocio(nroSocio, nroDoc, idrdb, nroCuit);

                            txtCalleSocioP.Text = d.NombreCalle;
                            txtNroCalleSocioP.Text = d.NroCalle.ToString();
                            txtPisoSocioP.Text = d.Piso.ToString();
                            txtDptoSocioP.Text = d.Dpto;
                            txtZonaSocioP.Text = d.Zona;

                            ViewState["idDomicilio"] = d.IdDomicilio;

                            break;
                        }
                    case 2:
                        {
                            //Socio Persona Juridica

                            PanelSocioParticular.Visible = false;
                            PanelSocioEmpresa.Visible = true;
                            //PanelMedidores.Visible = true;
                            panelDetalleReclamo.Visible = true;
                            panelNuevaDir.Visible = false;

                            SocioEmpresa se = Datos.getSociosEmpresa().traerDatosSocioEmpresa(Int32.Parse(txtNroSocio.Text));
                            
                            lblNroSocioE.Text = Convert.ToString(se.IdSocioEmpresa);
                            lblCUITE.Text = Convert.ToString(se.NroCUIT);
                            lblRazonSocialE.Text = Convert.ToString(se.RazonSocial);
                            //lblPaginaWebE.Text = se.PaginaWEB;
                            lblApellidoSocioE.Text = Convert.ToString(se.ApellidoResponsable);
                            lblNombreSocioE.Text = Convert.ToString(se.NombreResponsable);
                            lblCalleE.Text = se.NombreCalle;
                            lblNroCalleE.Text = se.NroCalle.ToString();
                            lblPisoE.Text = se.NroPiso.ToString();
                            lblDptoE.Text = se.Dpto;
                            lblZonaE.Text = se.DescripcionZona;

                            ViewState["idDomicilio"] = se.IdDomicilio;

                            break;
                        }
                }

                //busco los Medidores
                int nroSocioParticular = 0;
                int nroSocioEmpresa = 0;

                if(txtNroSocioP.Text != "")
                    nroSocioParticular = Convert.ToInt32(txtNroSocioP.Text);

                if(lblNroSocioE.Text != "")
                    nroSocioEmpresa = Convert.ToInt32(lblNroSocioE.Text);
                
                if(nroSocioParticular != 0)
                {
                    Boolean tieneMedidor = Datos.getMedidores().tieneMedidor(nroSocioParticular);

                    if (tieneMedidor)
                    {
                        SDSMedidoresSocio.SelectParameters["IDSOCIO"].DefaultValue = nroSocioParticular.ToString();
                        PanelMedidores.Visible = true;
                    }
                    else
                    {
                        PanelMedidores.Visible = false;
                    }
                }
                if (nroSocioEmpresa != 0)
                {
                    Boolean tieneMedidor1 = Datos.getMedidores().tieneMedidor(nroSocioEmpresa);

                    if (tieneMedidor1)
                    {
                        SDSMedidoresSocio.SelectParameters["IDSOCIO"].DefaultValue = nroSocioEmpresa.ToString();
                        PanelMedidores.Visible = true;
                    }
                    else
                    {
                        PanelMedidores.Visible = false;
                    }
                }
            }
        }

        //Busqueda por número de Documento
        if (rdbDocumento.Checked == true)
        {
            PanelNoSocio.Visible = false;

            Socio s = Datos.getSocios().traerDatosSocioNroDoc(Int32.Parse(comboTipoDocumento.SelectedItem.Value), Int32.Parse(txtNroDocumento.Text));

            if (s.IdSocio == 0)
            {
                lblMensaje.Text = "El Número de Documento no corresponde a ningún socio";

                PanelSocioParticular.Visible = false;
                PanelSocioEmpresa.Visible = false;
                PanelMedidores.Visible = false;
                panelDetalleReclamo.Visible = false;
                panelNuevaDir.Visible = false;
            }
            else
            {
                //Traer Datos Socio Particular
                lblMensaje.Text = "";

                PanelSocioParticular.Visible = true;
                PanelSocioEmpresa.Visible = false;
                //PanelMedidores.Visible = true;
                panelDetalleReclamo.Visible = true;
                panelNuevaDir.Visible = true;

                txtNroSocioP.Text = Convert.ToString(s.IdSocio);
                txtApellidoSocioP.Text = Convert.ToString(s.Apellido);
                txtNombreSocioP.Text = Convert.ToString(s.Nombre);
                txtNroDocSocioP.Text = Convert.ToString(s.NroDocumento);
                txtTipoDocP.Text = Convert.ToString(s.DescripcionTipoDoc);

             }

            //muestro el Domicilio del Socio

            int nroSocio = 0;
            if (txtNroSocioP.Text != "")
                nroSocio = Convert.ToInt32(txtNroSocioP.Text);

            int nroDoc = 0;
            if (txtNroDocSocioP.Text != "")
                nroDoc = Convert.ToInt32(txtNroDocSocioP.Text);

            int idrdb = -1;
            if (comboTipoDocumento.SelectedIndex != 0)
                idrdb = Convert.ToInt32(comboTipoDocumento.SelectedItem.Value);

            int nroCuit = 0;
            if (txtNroCUIT.Text != "")
                nroCuit = Convert.ToInt32(txtNroCUIT.Text);

            Domicilio d = Datos.getDomicilios().traerDomicilioSocio(nroSocio, nroDoc, idrdb, nroCuit);

            txtCalleSocioP.Text = d.NombreCalle;
            txtNroCalleSocioP.Text = d.NroCalle.ToString();
            txtPisoSocioP.Text = d.Piso.ToString();
            txtDptoSocioP.Text = d.Dpto;
            txtZonaSocioP.Text = d.Zona;

            ViewState["idDomicilio"] = d.IdDomicilio;

            //busco los Medidores
            int nroSocioParticular = 0;
            int nroSocioEmpresa = 0;

            if (txtNroSocioP.Text != "")
                nroSocioParticular = Convert.ToInt32(txtNroSocioP.Text);

            if (lblNroSocioE.Text != "")
                nroSocioEmpresa = Convert.ToInt32(lblNroSocioE.Text);

            if (nroSocioParticular != 0)
            {
                Boolean tieneMedidor = Datos.getMedidores().tieneMedidor(nroSocioParticular);

                if (tieneMedidor)
                {
                    SDSMedidoresSocio.SelectParameters["IDSOCIO"].DefaultValue = nroSocioParticular.ToString();
                    PanelMedidores.Visible = true;
                }
                else
                {
                    PanelMedidores.Visible = false;
                }
            }
            if (nroSocioEmpresa != 0)
            {
                Boolean tieneMedidor1 = Datos.getMedidores().tieneMedidor(nroSocioEmpresa);

                if (tieneMedidor1)
                {
                    SDSMedidoresSocio.SelectParameters["IDSOCIO"].DefaultValue = nroSocioEmpresa.ToString();
                    PanelMedidores.Visible = true;
                }
                else
                {
                    PanelMedidores.Visible = false;
                }
            }
        }

        //Busqueda por número de CUIT
        if (rdbCUIT.Checked == true)
        {
            SocioEmpresa se = Datos.getSociosEmpresa().traerDatosSocioEmpresaXCUIT(Convert.ToInt64(txtNroCUIT.Text));
            if (se.IdSocioEmpresa == 0)
            {
                lblMensaje.Text = "No se encuentra registrada la empresa como Socio";

                PanelSocioParticular.Visible = false;
                PanelSocioEmpresa.Visible = false;
                PanelMedidores.Visible = false;
                panelDetalleReclamo.Visible = false;
                panelNuevaDir.Visible = false;
            }
            else
            {
                lblMensaje.Text = "";

                PanelSocioParticular.Visible = false;
                PanelSocioEmpresa.Visible = true;
                PanelMedidores.Visible = false;
                panelDetalleReclamo.Visible = false;
                panelNuevaDir.Visible = false;

                lblNroSocioE.Text = Convert.ToString(se.IdSocioEmpresa);
                lblCUITE.Text = Convert.ToString(se.NroCUIT);
                lblRazonSocialE.Text = Convert.ToString(se.RazonSocial);
                //lblPaginaWebE.Text = se.PaginaWEB;
                lblApellidoSocioE.Text = Convert.ToString(se.ApellidoResponsable);
                lblNombreSocioE.Text = Convert.ToString(se.NombreResponsable);
                lblCalleE.Text = se.NombreCalle;
                lblNroCalleE.Text = se.NroCalle.ToString();
                lblPisoE.Text = se.NroPiso.ToString();
                lblDptoE.Text = se.Dpto;
                lblZonaE.Text = se.DescripcionZona;

                ViewState["idDomicilio"] = se.IdDomicilio;

            }

            //busco los Medidores
            int nroSocioEmpresa = 0;

            if (lblNroSocioE.Text != "")
                nroSocioEmpresa = Convert.ToInt32(lblNroSocioE.Text);

            if (nroSocioEmpresa != 0)
            {
                Boolean tieneMedidor1 = Datos.getMedidores().tieneMedidor(nroSocioEmpresa);

                if (tieneMedidor1)
                {
                    SDSMedidoresSocio.SelectParameters["IDSOCIO"].DefaultValue = nroSocioEmpresa.ToString();
                    PanelMedidores.Visible = true;
                }
                else
                {
                    PanelMedidores.Visible = false;
                    panelNuevaDir.Visible = true;
                }
            }
        }    
    }
    protected void gvMedidores_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[10].Visible = false;
        e.Row.Cells[11].Visible = false;
    }
    protected void rdbMedidor_CheckedChanged(object sender, EventArgs e)
    {
        //grilla Medidores
        //0:radio, 1:idmedidor, 2:descripcion, 3:zona, 4:calle, 5:nrocalle, 6:piso, 7:dpto, 8:idlinea, 
        //9:prioridad, 10;idcalle, 11:d.iddomicilio
        foreach (GridViewRow rows in gvMedidores.Rows)
        {
            RadioButton medidorSeleccionado = (RadioButton)rows.FindControl("gvMedidores_rdbSeleccionado");

            Session["idMedidorSeleccionado"] = Convert.ToInt32(gvMedidores.Rows[rows.RowIndex].Cells[1].Text);

            if (medidorSeleccionado.Checked)
            {
                ViewState["idDomicilio"] = gvMedidores.Rows[rows.RowIndex].Cells[11].Text;
            }
        }
        
        panelNuevaDireccion.Visible = false;

        txtReclamo.Focus();
    }
    protected void btnNuevaDireccion_Click(object sender, EventArgs e)
    {
        panelNuevaDireccion.Visible = true;
        rdbCalle.Focus();
        lblNroCalleNueva.Text = "";
        lblNroPisoNuevo.Text = "";
        lblNroDptoNuevo.Text = "";
        rdbCalle.SelectedIndex = 0;
        rdbZona.SelectedIndex = 0;

        //guardar la Direccion en ViewState
    }
    protected void btnAceptarDireccion_Click(object sender, EventArgs e)
    {
        rdbCalle.Enabled = false;
        lblNroCalleNueva.Enabled = false;
        lblNroPisoNuevo.Enabled = false;
        lblNroDptoNuevo.Enabled = false;
        rdbZona.Enabled = false;
        btnAceptarDireccion.Enabled = false;

        foreach (GridViewRow row in gvMedidores.Rows)
        {
            RadioButton medidorSeleccionado = (RadioButton)row.FindControl("gvMedidores_rdbSeleccionado");

            if (medidorSeleccionado.Checked)
            {
                medidorSeleccionado.Checked = false;
            }

        }
    }
    protected void btnCancelarDireccion_Click(object sender, EventArgs e)
    {
        panelNuevaDireccion.Visible = false;

        rdbCalle.Enabled = true;
        lblNroCalleNueva.Enabled = true;
        lblNroPisoNuevo.Enabled = true;
        lblNroDptoNuevo.Enabled = true;
        rdbZona.Enabled = true;
        btnAceptarDireccion.Enabled = true;

        rdbCalle.SelectedIndex = 0;
        lblNroCalleNueva.Text = "";
        lblNroPisoNuevo.Text = "";
        lblNroDptoNuevo.Text = "";
        rdbZona.SelectedIndex = 0;
    }
    protected void rdbCalle_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblNroCalleNueva.Focus();
    }
    protected void btnNuevoTipoReclamo_Click(object sender, EventArgs e)
    {
        if (txtNroSocio.Text != "")
            Session["nroSocio"] = Convert.ToInt32(txtNroSocio.Text);

        if (comboTipoDocumento.SelectedIndex != 0)
            Session["selecciontipoDocumento"] = Convert.ToInt32(comboTipoDocumento.SelectedIndex);

        if(txtNroDocumento.Text != "")
            Session["nroDocumento"] = Convert.ToInt32(txtNroDocumento.Text);

        if(txtNroCUIT.Text != "")
            Session["nroCuit"] = Convert.ToInt32(txtNroCUIT.Text);

        if (Convert.ToInt32(Session["socioParticularEncontrado"]) == 1)
        {
            Session["nroSocioP"] = Convert.ToInt32(txtNroSocioP.Text);
            Session["apellidoSocioP"] = txtApellidoSocioP.Text;
            Session["nombreSocioP"] = txtNombreSocioP.Text;
            Session["tipoDocP"] = txtTipoDocP.Text;
            Session["nroDocP"] = Convert.ToInt32(txtNroDocSocioP.Text);
            Session["calleP"] = txtCalleSocioP.Text;
            Session["nroCalleP"] = Convert.ToInt32(txtNroCalleSocioP.Text);
            Session["pisoP"] = Convert.ToInt32(txtPisoSocioP.Text);
            Session["dptoP"] = txtDptoSocioP.Text;
            Session["zonaP"] = txtZonaSocioP.Text;
        }

        if (txtReclamo.Text != "")
        {
            Session["cambioReclamo"] = 1;
            Session["reclamo"] = txtReclamo.Text;
        }

        Session["haciaTipoReclamoTipico"] = 1;
        Response.Redirect("/Cooperativa/MCorrectivoSesion/RegistrarTipoReclamoTipico.aspx", true);

    }
    protected void rdbTipoReclamo_SelectedIndexChanged(object sender, EventArgs e)
    {
        TipoReclamoTipico tr = Datos.getTipoReclamo().traerDatosTipoReclamo(Convert.ToInt32(rdbTipoReclamo.SelectedItem.Value));
        lblPrioridad.Text = tr.PrioridadNombre;

        lblPrioridadTipo.Visible = true;
        lblPrioridad.Visible = true;
    }
    protected void btnRegistrarReclamo_Click(object sender, EventArgs e)
    {
        ModalPopupConfirmacion.Show();
    }
    protected void btnCancelarReclamo_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Show();
    }
    protected void btnAceptarRegistrar_Click(object sender, EventArgs e)
    {
        //atributos comunes
        
        int nroReclamo = Datos.getReclamos().obtenerUltimoNroReclamo();
        Session["nroReclamo"] = nroReclamo;

        DateTime fecha = Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy"));
        
        DateTime hora = Convert.ToDateTime(DateTime.Now.ToString("HH:mm"));

        string descripcionReclamo = txtReclamo.Text;
        
        int idTipoReclamo = Convert.ToInt32(rdbTipoReclamo.SelectedItem.Value);
        
        TipoReclamoTipico t = Datos.getTipoReclamo().traerDatosTipoReclamo(idTipoReclamo);
        int prioridad = Convert.ToInt32(t.Prioridad.ToString());
        
        DatosUsuario datos = (DatosUsuario)Session["datosUsuario"];
        int nroUsuario = Convert.ToInt32(datos.IdUsuario);

        //orden y estado

        Reclamo r = new Reclamo();

        //grilla Medidores
        //0:idmedidor, 1:descripcion, 2:zona, 3:calle, 4:nrocalle, 5:piso, 6:dpto, 7:idlinea, 
        //8:prioridad, 9;idcalle, 10:d.iddomicilio
        try
        {
            //Busco el id del domicilio, sino creo otro

            if (rdbSocio.Checked == true)
            {
                int iddomicilio = 0;
                if(lblNroCalleNueva.Text != "")     //ingresó una nueva Dirección
                    iddomicilio = Datos.getDomicilios().buscarDomicilio(Convert.ToInt32(rdbCalle.SelectedItem.Value), Convert.ToInt32(lblNroCalleNueva.Text), lblNroPisoNuevo.Text, lblNroDptoNuevo.Text);

                if (iddomicilio != 0)
                {
                    //insertar Domicilio
                    int ultimoDomicilio = Datos.getDomicilios().obtenerUltimoIdDomicilio();
                    int dom = Datos.getDomicilios().insertarDomicilio(ultimoDomicilio, Convert.ToInt32(rdbCalle.SelectedItem.Value), Convert.ToInt32(lblNroCalleNueva.Text), Convert.ToInt32(lblNroPisoNuevo.Text), lblNroDptoNuevo.Text, Convert.ToInt32(rdbZona.SelectedItem.Value));

                    ViewState["idDomicilio"] = Convert.ToInt32(ultimoDomicilio);
                }

                //tomo el Domicilio de donde corresponda
                int idDomicilio = Convert.ToInt32(ViewState["idDomicilio"]);
                
                int idsocio = 0;

                //Socio Particular
                if (txtNroSocioP.Text != "")
                    idsocio = Convert.ToInt32(txtNroSocioP.Text);

                //Socio Empresa 
                if (lblNroSocioE.Text != "")
                    idsocio = Convert.ToInt32(lblNroSocioE.Text);
              
                
                //idreclamo, fecha, hora, descripcion, idotc, idsocio,idestadoreclamo,idtiporeclamo,
                //iddomicilio, nrodocumento, prioridad, idusuario, idtipodocumento

                r.NroReclamo = nroReclamo;
                r.Fecha = fecha;
                r.Hora = hora;
                r.Descripcion = descripcionReclamo;
                //otc
                r.NroSocio = idsocio;
                //r.IdEstado = 1; //por defecto, Pendiente
                r.IdTipoReclamo = idTipoReclamo;
                r.IdDomicilio = idDomicilio;
                //nrodocumento, NO va
                r.NroPrioridad = prioridad;
                r.IdUsuario = nroUsuario;
                //tipodocumento, NO va
            }

            if (rdbNoSocio.Checked == true)
            {
                //Buscar persona

                String apellido = txtApellidoNoSocio.Text;
                String nombre = txtNombreNoSocio.Text;
                int tipoDoc = Convert.ToInt32(rdbTipoDocNoSocio.SelectedItem.Value);
                int nroDoc = Convert.ToInt32(txtNroDocNoSocio.Text);
                int tel = Convert.ToInt32(txtNroTelNoSoc.Text);

                Persona p = Datos.getPersonas().mostrarPersona(tipoDoc, nroDoc);

                int piso;
                String depto;

                if (Convert.ToInt32(p.NroDocumento) == 0)  //la Persona NO es socia
                {
                    int ultimoDomicilio = Datos.getDomicilios().obtenerUltimoIdDomicilio();

                    if (lblNroPisoNuevo.Text == "")
                    { piso = 0; }
                    else
                    { piso = Convert.ToInt32(lblNroPisoNuevo.Text); }

                    if (lblNroDptoNuevo.Text == "")
                    { depto = "0"; }
                    else
                    { depto = lblNroDptoNuevo.Text; }

                    int existeDomi = Datos.getDomicilios().buscarDomicilio(Convert.ToInt32(rdbCalle.SelectedItem.Value), Convert.ToInt32(lblNroCalleNueva.Text), Convert.ToString(piso), depto);

                    if (existeDomi == 0) //es nuevo el Domicilio
                    { 
                        int domi = Datos.getDomicilios().insertarDomicilio(ultimoDomicilio, Convert.ToInt32(rdbCalle.SelectedItem.Value), Convert.ToInt32(lblNroCalleNueva.Text), piso, depto, Convert.ToInt32(rdbZona.SelectedItem.Value));
                        ViewState["idDomicilio"] = ultimoDomicilio;
                    }
                    else  //ya existe el Domicilio
                    { 
                        int domi = existeDomi;
                        ViewState["idDomicilio"] = domi;
                    }

                    //Insertar Persona
                    int per = Datos.getPersonas().insertarPersona(nroDoc, tipoDoc, nombre, apellido, tel);

                    int idDomicilio = Convert.ToInt32(ViewState["idDomicilio"]);

                    //idreclamo, fecha, hora, descripcion, idotc, idsocio,idestadoreclamo,idtiporeclamo,
                    //iddomicilio, nrodocumento, prioridad, idusuario, idtipodocumento

                    r.NroReclamo = nroReclamo;
                    r.Fecha = fecha;
                    r.Hora = hora;
                    r.Descripcion = descripcionReclamo;
                    //otc
                    //socio
                    //r.IdEstado = 1; //por defecto, Pendiente
                    r.IdTipoReclamo = idTipoReclamo;
                    r.IdDomicilio = idDomicilio;
                    r.NroDoc = nroDoc;
                    r.NroPrioridad = prioridad;
                    r.IdUsuario = nroUsuario;
                    r.TipoDoc = tipoDoc;

                }
                //else
                //{
                //    //la persona existe el sistema ----> verificar si es socio
                //    Socio s = Datos.getSocios().traerDatosSocioNroDoc(tipoDoc, nroDoc);

                //    if (s.IdSocio != 0)
                //    {
                //        lblMensaje.Text = "La persona indicada es un socio";

                //        PanelNoSocio.Visible = false;
                //        PanelSocio.Visible = true;
                //        rdbNoSocio.Checked = false;
                //        rdbSocio.Checked = true;
                //        rdbDoc.Checked = true;
                //        PanelNroDocumento.Visible = true;
                //        ddlTipoDoc.SelectedValue = Convert.ToString(tipoDoc);
                //        txtNroDoc.Text = Convert.ToString(nroDoc);
                //        btnBuscarSocio.Enabled = true;
                //    }
                //    else
                //    {
                //        lblMensaje.Text = "";
                //        int ultimoDomicilio = Datos.getDomicilios().obtenerUltimoIdDomicilio();

                //        if (txtPisoNoSocio.Text == "")
                //        { piso = 0; }
                //        else
                //        { piso = Convert.ToInt32(txtPisoNoSocio.Text); }

                //        if (txtDeptoNoSocio.Text == "")
                //        { depto = "0"; }
                //        else
                //        { depto = txtDeptoNoSocio.Text; }

                //        int existeDomi = Datos.getDomicilios().buscarDomicilio(Convert.ToInt32(ddlCalleNoSocio.SelectedValue), Convert.ToInt32(txtNroCalle.Text), Convert.ToString(piso), depto);

                //        if (existeDomi == 0)
                //        { int domi = Datos.getDomicilios().insertarDomicilio(ultimoDomicilio, Convert.ToInt32(ddlCalleNoSocio.SelectedValue), Convert.ToInt32(txtNroCalle.Text), piso, depto, Convert.ToInt32(DDLZona.SelectedValue)); }
                //        else
                //        { int domi = existeDomi; }

                //        //insertar reclamo
                //        int idtipo1 = Convert.ToInt32(DDLTipoReclamoTipico.SelectedValue);
                //        DateTime fecha1 = DateTime.Now;
                //        String reclamo1 = txtReclamo.Text;

                //        //buscar el id de la pioridad dependiendo el tipo de reclamo tipico
                //        TipoReclamoTipico t1 = Datos.getTipoReclamo().traerDatosTipoReclamo(Convert.ToInt32(DDLTipoReclamoTipico.SelectedValue));
                //        int priori1 = Convert.ToInt32(t1.Prioridad.ToString());

                //        int recNoSocio = Datos.getReclamos().insertarReclamoNoSocio(nroReclamo, fecha1, reclamo1, idtipo1, ultimoDomicilio, nroDoc, priori1, tipoDoc);
                //    }
                //}
            }

            
            //creo el Reclamo
            int filaReclamo = Datos.getReclamos().crearReclamo(r);

            lblReclamo.Text = "Se generó el Reclamo Nº " + r.NroReclamo;

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
    protected void btnCancelarRegistrar_Click(object sender, EventArgs e)
    {
        ModalPopupConfirmacion.Hide();
    }
    protected void btnAceptarCancelacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/InicioGuardiaReclamo.aspx", true);
    }
    protected void btnCancelarCancelacion_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Hide();
    }
    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/MCorrectivoSesion/GenerarOTC.aspx", true);
    }
    protected void gvMedidores_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeshabilitarMedidor")
        {
            //int rowIndex = ((GridViewRow)((Button)e.CommandSource).NamingContainer).RowIndex;
            int idMedidor= Convert.ToInt32(e.CommandArgument);

            foreach (GridViewRow row in gvMedidores.Rows)
            {
                RadioButton medidorSeleccionado = (RadioButton)row.FindControl("gvMedidores_rdbSeleccionado");

                if (medidorSeleccionado.Checked)
                {
                    if (idMedidor == Convert.ToInt32(gvMedidores.Rows[row.RowIndex].Cells[1].Text))
                    {
                        medidorSeleccionado.Checked = false;
                        break;
                    }
                }
            }
        }

    }
    protected void rdbTipoDocNoSocio_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtNroDocNoSocio.Focus();
    }
}
