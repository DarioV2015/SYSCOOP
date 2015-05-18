using System;
using System.Collections;
using System.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;


public partial class Medidor_AsignarMedidorASocio : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Datos.combo("select * from tipomedidor", ddlTipoMedidor);
            ddlTipoMedidor.Items.Insert(0, new ListItem("Seleccionar...", string.Empty));

            btnVerificar.Attributes.Add("onclick", "return ponerMedidor();");
           
        }
        else
        {
        //    String calle = ddlCalleMed.SelectedItem.ToString();
          //  String nro = txtNroCalleMed.Text;
           // String str = "<script>loadMap();</script>";
           // Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);
        }
        string str = "<script>loadMap(); </script>";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);
    }


    protected void rdbNroSocio_CheckedChanged(object sender, EventArgs e)
    {
        this.txtNroSocio.Visible = true;
        this.ddlNroDoc.Visible = false;
        this.txtNroDoc.Visible = false;
        this.txtNroCUIT.Visible = false;
        this.btnBuscar.Visible = true;
        this.PanelMedidoresSocio.Visible = false;
        this.PanelSocioParticular.Visible = false;
        this.PanelDatosEmpresa.Visible = false;
        this.lblMensaje.Text = "";

    }
    protected void rbnNroDoc_CheckedChanged(object sender, EventArgs e)
    {
        this.txtNroSocio.Visible = false;
        this.ddlNroDoc.Visible = true;
        this.txtNroDoc.Visible = true;
        this.txtNroCUIT.Visible = false;
        this.btnBuscar.Visible = true;
        this.PanelSocioParticular.Visible = false;
        this.PanelMedidoresSocio.Visible = false;
        this.PanelDatosEmpresa.Visible = false;
        this.lblMensaje.Text = "";
    }
    protected void rbnCuit_CheckedChanged(object sender, EventArgs e)
    {
        this.txtNroSocio.Visible = false;
        this.ddlNroDoc.Visible = false;
        this.txtNroDoc.Visible = false;
        this.txtNroCUIT.Visible = true;
        this.btnBuscar.Visible = true;
        this.PanelSocioParticular.Visible = false;
        this.PanelMedidoresSocio.Visible = false;
        this.PanelDatosEmpresa.Visible = false;
        this.lblMensaje.Text = "";
    }



    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        this.PanelSocioParticular.Visible = false;
        this.PanelDatosEmpresa.Visible = false;
        this.PanelMedidoresSocio.Visible = false;
        if (this.rdbNroSocio.Checked == true)
        {
           
            int tipoSocio = Datos.getSocios().verificarTipoSocio(Convert.ToInt32(this.txtNroSocio.Text)); 
           
            if (tipoSocio == 0)
            { 
                lblMensaje.Text = "El nro de socio inicado no corresponde a ningun socio"; 
            }
            else
            {
                PanelAsignarMedidor.Visible = true;
                this.lblMensaje.Text = "";
                switch (tipoSocio)
                {
                    case 1:
                        {
                            //Socio Persona Fisica
                            
                            Socio s = Datos.getSocios().traerDatosSocioParticular(Int32.Parse(this.txtNroSocio.Text));
                            
                            this.PanelSocioParticular.Visible = true;
                            //panelDom.Visible = true;
                            this.lblNroSocio.Visible = true;
                            this.Label10.Visible = true;
                            this.lblNroSocio.Text = Convert.ToString(s.IdSocio);
                            ViewState["idsocio"] = Convert.ToString(s.IdSocio);
                            this.txtApellido.Text = Convert.ToString(s.Apellido);
                            this.txtNombre.Text = Convert.ToString(s.Nombre);
                            this.ddlCalle.SelectedValue = Convert.ToString(s.IdCalle);
                            this.txtNroCalle.Text = Convert.ToString(s.NroCalle);
                            this.txtPiso.Text = Convert.ToString(s.NroPiso);
                            this.txtDepto.Text = Convert.ToString(s.Dpto);
                            Boolean tieneMedidor=Datos.getMedidores().tieneMedidorActivos(Convert.ToInt32(s.IdSocio));
                            if(tieneMedidor)
                            {
                                this.PanelMedidoresSocio.Visible = true;
                            }
                            else
                            {this.lblMensaje.Text="El Socio no tiene medidores asignados";}
                                                    




                            break;
                        }
                    case 2:
                        {
                            //Socio Persona Juridica
                            this.PanelDatosEmpresa.Visible=true;
//                            panelDom.Visible = true;

                            SocioEmpresa se = Datos.getSociosEmpresa().traerDatosSocioEmpresa(Int32.Parse(this.txtNroSocio.Text));
                            this.lblNroSocio.Visible = true;
                            this.Label10.Visible = true;
                            this.lblNroSocio.Text = Convert.ToString(se.IdSocioEmpresa);
                            ViewState["idsocio"] = Convert.ToString(se.IdSocioEmpresa);
                            this.txtRazonSocial.Text = Convert.ToString(se.RazonSocial);
                            this.txtCUIT.Text = Convert.ToString(se.NroCUIT);
                           //this.txtApellidoResponsable.Text = Convert.ToString(se.ApellidoResponsable);
                            //this.txtNombreResponsable.Text = Convert.ToString(se.NombreResponsable);
                            this.ddlCalleEmpresa.SelectedValue = Convert.ToString(se.IdCalle);
                            this.txtNroCalleEmpresa.Text = Convert.ToString(se.NroCalle);
                            this.txtPisoEmpresa.Text = Convert.ToString(se.NroPiso);
                            this.txtDptoEmpresa.Text = Convert.ToString(se.Dpto);

                            Boolean tieneMedidor = Datos.getMedidores().tieneMedidorActivos(Convert.ToInt32(se.IdSocioEmpresa));
                            if (tieneMedidor)
                            { this.PanelMedidoresSocio.Visible = true; }
                            else
                            { this.lblMensaje.Text = "El Socio no tiene medidores activos"; }

                            break;
                        }
                }
            }
        }
        if (this.rbnNroDoc.Checked == true)
        {

            Socio s = Datos.getSocios().traerDatosSocioNroDoc(Int32.Parse(this.ddlNroDoc.SelectedValue), Int32.Parse(this.txtNroDoc.Text));
            if (s.IdSocio == 0)
            {
                lblMensaje.Text = "El Documento inicado no corresponde a ningun socio";
                
            }
            else
            {
                //Traer Datos Socio Particular
//                panelDom.Visible = true;
                this.lblMensaje.Text = "";
                this.PanelSocioParticular.Visible = true;
                this.lblNroSocio.Visible = true;
                this.Label10.Visible = true;
                this.lblNroSocio.Text = Convert.ToString(s.IdSocio);
                ViewState["idsocio"] = Convert.ToString(s.IdSocio);
                this.txtApellido.Text = Convert.ToString(s.Apellido);
                this.txtNombre.Text = Convert.ToString(s.Nombre);
                this.ddlCalle.SelectedValue = Convert.ToString(s.IdCalle);
                this.txtNroCalle.Text = Convert.ToString(s.NroCalle);
                this.txtPiso.Text = Convert.ToString(s.NroPiso);
                this.txtDepto.Text = Convert.ToString(s.Dpto);
                Boolean tieneMedidor = Datos.getMedidores().tieneMedidorActivos(Convert.ToInt32(s.IdSocio));
                if (tieneMedidor)
                { this.PanelMedidoresSocio.Visible = true; }
                else
                { this.lblMensaje.Text = "El Socio no tiene medidores activos"; }

            }
        }        
        
                
        
        
        if (this.rbnCuit.Checked == true)
        {
            SocioEmpresa se = Datos.getSociosEmpresa().traerDatosSocioEmpresaXCUIT(Convert.ToInt64(this.txtNroCUIT.Text));
            if (se.IdSocioEmpresa == 0)
            {
                lblMensaje.Text = "El CUIT inicado no corresponde a ningun socio";

            }
            else
            {
                lblMensaje.Text = "";
                this.PanelDatosEmpresa.Visible = true;
//                panelDom.Visible = true;
                this.lblNroSocio.Text = Convert.ToString(se.IdSocioEmpresa);
                ViewState["idsocio"] = Convert.ToString(se.IdSocioEmpresa);
                this.txtRazonSocial.Text = Convert.ToString(se.RazonSocial);
                this.txtCUIT.Text = Convert.ToString(se.NroCUIT);
                this.ddlCalleEmpresa.SelectedValue = Convert.ToString(se.IdCalle);
                this.txtNroCalleEmpresa.Text = Convert.ToString(se.NroCalle);
                this.txtPisoEmpresa.Text = Convert.ToString(se.NroPiso);
                this.txtDptoEmpresa.Text = Convert.ToString(se.Dpto);
                Boolean tieneMedidor = Datos.getMedidores().tieneMedidorActivos(Convert.ToInt32(se.IdSocioEmpresa));
                if (tieneMedidor)
                { this.PanelMedidoresSocio.Visible = true; }
                else
                { this.lblMensaje.Text = "El Socio no tiene medidores activos"; }
            }
            
        }

        string str = "<script>loadMap();</script>";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);
    }


    protected void gvMedidoresDisponibles_rdbSeleccionar_CheckedChanged(object sender, EventArgs e)
    {
        int idMedidor;

        foreach (GridViewRow row in gvMedidoresDisponibles.Rows)
        {
            RadioButton gvMedidoresDisponibles_rdbSeleccionar = (RadioButton)row.FindControl("gvMedidoresDisponibles_rdbSeleccionar");
            if (gvMedidoresDisponibles_rdbSeleccionar.Checked)
            {

                idMedidor = Convert.ToInt32(row.Cells[1].Text);
                ViewState["idMedidor"] = idMedidor;

            }

        }
    }

    protected void ddlTipoMedidor_SelectedIndexChanged(object sender, EventArgs e)
    {
        sdsMedidoresDisponibles.SelectParameters["idTipoMedidor"].DefaultValue = ddlTipoMedidor.SelectedValue;
        sdsMedidoresDisponibles.Select(DataSourceSelectArguments.Empty);

        if (gvMedidoresDisponibles.Rows.Count == 0)
        {
            mpeAdvertencia.Show();
        }
            panelDom.Visible = true;
    }
    protected void btnVerificar_Click(object sender, EventArgs e)
    {
        String calle = ddlCalleMed.SelectedItem.ToString();
        String nro = txtNroCalleMed.Text;
        String str = "<script>loadMap(); verificarDomicilio('" + calle + " " + nro + "');</script>";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);
    }

    [WebMethod]
    public static void setMedidor(String idcalle, String nroCalle, String piso, String depto, String lat, String lon)
    {
       int idDom = Datos.getDomicilios().buscarDomicilio(Convert.ToInt32(idcalle), Convert.ToInt32(nroCalle), piso, depto);
        if (idDom > 0)
        {
            Datos.getDomicilios().actualizarLocalizacion(idDom, lat, lon);
        }
        else 
        {
            Domicilio d = new Domicilio();
            d.IdDomicilio = Datos.getDomicilios().obtenerUltimoIdDomicilio();
            d.IdCalle = Convert.ToInt32(idcalle);
            d.NroCalle = Convert.ToInt32(nroCalle);
            if(piso.Length>0)
            d.Piso = Convert.ToSingle(piso);
            d.Dpto = depto;
            d.Latitud = lat;
            d.Longitud = lon;
            d.IdZona = 1;

            int creado = Datos.getDomicilios().crearDomicilio(d);
            if (creado > 0)
            { 

            }

        }
    }
    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        mpeConfirmacion.Show();
    }


    protected void btnAceltarRegistrar_Click(object sender, EventArgs e)
    {

        int idmedidor =  Convert.ToInt32(ViewState["idMedidor"].ToString());
        int idsocio =  Convert.ToInt32(ViewState["idsocio"].ToString());
        Datos.getMedidores().actualizarEstadoMedidor(1, idmedidor);
        Datos.getMedidores().actualizarDomicilioMedidor(idsocio,idmedidor);
        Datos.getMedidores().actualizarSocioMedidor(idsocio,idmedidor);

        Datos.commit();
    }
    protected void btnAceptarAdvertencia_Click(object sender, EventArgs e)
    {
        mpeAdvertencia.Hide();
    }
   
}
