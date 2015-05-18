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

public partial class Medidor_ModificarSocio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

    }

    protected void rbl_Busqueda_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.rbl_Busqueda.SelectedIndex == 0)
        {
            txtNroSocio.Visible = true;      
        }
        if (this.rbl_Busqueda.SelectedIndex == 1)
        {
            txtNroSocio.Visible = true;  
        }
    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
      
        if (rbl_Busqueda.SelectedIndex == 0)
        {
            this.panelPFisica.Visible = true;
            Socio s = Datos.getSocios().traerDatosSocioParticular(Int32.Parse(this.txtNroSocio.Text));
            this.txtNroSocioParticular.Text = Convert.ToString(s.IdSocio);
            this.txtFechaAltaSocio.Text = Convert.ToString(s.FechaAlta);
            this.txtApellido.Text = Convert.ToString(s.Apellido);
            this.txtNombre.Text = Convert.ToString(s.Nombre);
            this.txtNroDocumento.Text = Convert.ToString(s.NroDocumento);
            this.ddlTipo.SelectedValue = Convert.ToString(s.TipoDocumento);
            this.txtEmail.Text = Convert.ToString(s.Email);
            this.radioSexo.SelectedValue = Convert.ToString(s.Sexo);
            this.txtTelFijo.Text = Convert.ToString(s.Telefono);
            this.ddlCalle.SelectedValue = Convert.ToString(s.IdCalle);
            this.txtNroCalle.Text = Convert.ToString(s.NroCalle);
            this.txtPiso.Text = Convert.ToString(s.NroPiso);
            this.txtDpto.Text = Convert.ToString(s.Dpto);
            this.ddlZona.SelectedValue = Convert.ToString(s.DescripcionZona);
            this.ddlEstadoSocio.SelectedValue = Convert.ToString(s.Estado);
            ViewState["idDomicilio"] = s.IdDomicilio;
            ViewState["idCalle"] = s.IdCalle;
            ViewState["idSocio"] = s.IdSocio;
        }

        else
        {
            if (rbl_Busqueda.SelectedIndex == 1)
            {
                this.panelPJuridica.Visible = true;
                SocioEmpresa se = Datos.getSociosEmpresa().traerDatosSocioEmpresa(Int32.Parse(this.txtNroSocio.Text));
                this.txtNroSocioEmpresa.Text = Convert.ToString(se.IdSocioEmpresa);
                this.txtRazonSocial.Text = Convert.ToString(se.RazonSocial);
                this.txtCUIT.Text = Convert.ToString(se.NroCUIT);
                this.ddlTipoOrganizacion.SelectedValue = Convert.ToString(se.IdTipoOrganizacion);
                this.txtFechaInicio.Text = Convert.ToString(se.FechaIncioActividades);
                this.ddlCalleEmpresa.SelectedValue = Convert.ToString(se.IdCalle);
                this.txtNroCalleEmpresa.Text = Convert.ToString(se.NroCalle);
                this.txtPisoEmpresa.Text = Convert.ToString(se.NroPiso);
                this.txtDptoEmpresa.Text = Convert.ToString(se.Dpto);
                this.ddlZonaEmpresa.SelectedValue = Convert.ToString(se.DescripcionZona);
                this.txtTelEmpresa.Text = Convert.ToString(se.Telefono);
                this.txtEmailEmpresa.Text = Convert.ToString(se.Email);
                this.txtWebEmpresa.Text = Convert.ToString(se.PaginaWEB);
                this.txtApellidoResponsable.Text = Convert.ToString(se.ApellidoResponsable);
                this.txtNombreResponsable.Text = Convert.ToString(se.NombreResponsable);
                this.ddlCargoResponsable.SelectedValue = Convert.ToString(se.IdCargo);
                ViewState["idDomicilioEmpresa"] = se.IdDomicilio;
                ViewState["idCalleEmpresa"] = se.IdCalle;
                ViewState["idSocioEmpresa"] = se.IdSocioEmpresa;
            }
        }
    }
    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        int domi = 0;
        if (rbl_Busqueda.SelectedIndex == 0)
        {
            {
                domi = Datos.getDomicilios().buscarDomicilio(Convert.ToInt32(this.ddlCalle.SelectedValue), Convert.ToInt32(this.txtNroCalle.Text), this.txtPiso.Text, this.txtDpto.Text);
                if (domi == 0)
                {
                    domi = Datos.getDomicilios().obtenerUltimoIdDomicilio();
                    Domicilio d = new Domicilio();
                    d.IdDomicilio = Convert.ToInt32(domi);
                    d.NroCalle = Convert.ToInt32(this.txtNroCalle.Text);
                    d.Piso = Convert.ToInt32(this.txtPiso.Text);
                    d.IdCalle = Convert.ToInt32(this.ddlCalle.SelectedValue);
                    d.IdZona = Convert.ToInt32(this.ddlZona.SelectedValue);
                    d.Dpto = Convert.ToString(this.txtDpto.Text);
                    Datos.getDomicilios().crearDomicilio(d);
                }
                else
                {

                    if (Datos.getDomicilios().socioExisteDomicilio(domi))
                    {

                    }
                    else
                    {
                        domi = Datos.getDomicilios().obtenerUltimoIdDomicilio();
                        Domicilio d = new Domicilio();
                        d.IdDomicilio = Convert.ToInt32(domi);
                        d.NroCalle = Convert.ToInt32(this.txtNroCalle.Text);
                        d.Piso = Convert.ToInt32(this.txtPiso.Text);
                        d.IdCalle = Convert.ToInt32(this.ddlCalle.SelectedValue);
                        d.IdZona = Convert.ToInt32(this.ddlZona.SelectedValue);
                        d.Dpto = Convert.ToString(this.txtDpto.Text);
                        Datos.getDomicilios().crearDomicilio(d);

                    }
                }

            }


            Persona p = new Persona();
            p.NroDocumento = Convert.ToInt32(this.txtNroDocumento.Text);
            p.TipoDocumento = Convert.ToInt32(this.ddlTipo.SelectedValue);
            p.IdDomicilio = Convert.ToInt32(domi);
            p.Apellido = this.txtApellido.Text;
            p.Nombre = this.txtNombre.Text;
            p.Email = this.txtEmail.Text;
            p.Sexo = this.radioSexo.SelectedValue;
            p.Telefono = Convert.ToInt32(this.txtTelFijo.Text);
            int numSoc = Convert.ToInt32(ViewState["idSocio"]);


//            Datos.getPersonas().modificarPersona(p.NroDocumento, p.TipoDocumento, p.IdDomicilio, p.Apellido, p.Nombre, p.Email, p.Sexo, p.Telefono, numSoc);
        }

        if (rbl_Busqueda.SelectedIndex == 1)
        {
            domi = Datos.getDomicilios().buscarDomicilio(Convert.ToInt32(this.ddlCalleEmpresa.SelectedValue), Convert.ToInt32(this.txtNroCalleEmpresa.Text), this.txtPisoEmpresa.Text, this.txtDptoEmpresa.Text);
                if (domi == 0)
                {
                    domi = Datos.getDomicilios().obtenerUltimoIdDomicilio();
                    Domicilio d = new Domicilio();
                    d.IdDomicilio = Convert.ToInt32(domi);
                    d.NroCalle = Convert.ToInt32(this.txtNroCalleEmpresa.Text);
                    d.Piso = Convert.ToInt32(this.txtPisoEmpresa.Text);
                    d.IdCalle = Convert.ToInt32(this.ddlCalleEmpresa.SelectedValue);
                    d.IdZona = Convert.ToInt32(this.ddlZonaEmpresa.SelectedValue);
                    d.Dpto = Convert.ToString(this.txtDptoEmpresa.Text);
                    Datos.getDomicilios().crearDomicilio(d);
                }
                else
                {

                    if (Datos.getDomicilios().socioEmpresaExisteDomicilio(domi))
                    {

                    }
                    else
                    {
                        domi = Datos.getDomicilios().obtenerUltimoIdDomicilio();
                        Domicilio d = new Domicilio();
                        d.IdDomicilio = Convert.ToInt32(domi);
                        d.NroCalle = Convert.ToInt32(this.txtNroCalleEmpresa.Text);
                        d.Piso = Convert.ToInt32(this.txtPisoEmpresa.Text);
                        d.IdCalle = Convert.ToInt32(this.ddlCalleEmpresa.SelectedValue);
                        d.IdZona = Convert.ToInt32(this.ddlZonaEmpresa.SelectedValue);
                        d.Dpto = Convert.ToString(this.txtDptoEmpresa.Text);
                        Datos.getDomicilios().crearDomicilio(d);

                    }
          

            }

            SocioEmpresa se = new SocioEmpresa();
            se.RazonSocial = Convert.ToString(this.txtRazonSocial.Text);
            se.NroCUIT = Convert.ToInt32(this.txtCUIT.Text);
            se.IdTipoOrganizacion = Convert.ToInt32(this.ddlTipoOrganizacion.SelectedValue);
            se.Telefono = Convert.ToInt32(this.txtTelEmpresa.Text);
            se.Email = Convert.ToString (this.txtEmailEmpresa.Text);
            se.PaginaWEB = Convert.ToString(this.txtWebEmpresa.Text);
            se.ApellidoResponsable = Convert.ToString(this.txtApellidoResponsable.Text);
            se.NombreResponsable= Convert.ToString(this.txtNombreResponsable.Text);
            se.IdCargo = Convert.ToInt32(this.ddlCargoResponsable.SelectedValue);
            int numSocEmpr = Convert.ToInt32(ViewState["idSocioEmpresa"]);


            Datos.getSociosEmpresa().modificarEmpresa(se.RazonSocial, se.NroCUIT, se.IdTipoOrganizacion, se.Telefono, se.Email, se.PaginaWEB, se.ApellidoResponsable, se.ApellidoResponsable, se.IdCargo, numSocEmpr, domi);

        }
    }

    

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Default.aspx", false);
    }
}
