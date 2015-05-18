using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Collections.Generic;

public partial class Medidor_RegistrarSocio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void radioTipoSocio_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.radioTipoSocio.SelectedIndex == 0)
        {
            panelPFisica.Visible = true;
            panelPJuridica.Visible = false;
        }

        if (this.radioTipoSocio.SelectedIndex == 1)
        {
            panelPJuridica.Visible = true;
            panelPFisica.Visible = false;

        }

        btnGuardar.Visible = true;
    }


    protected void btnGuardar_Click(object sender, EventArgs e)
    {

        ModalPopupRegistrar.Show();
    }


    protected void btnAceptarConfirmar_Click (object sender, EventArgs e)
    {
        try
        {
            {
                if (this.radioTipoSocio.SelectedIndex == 0)
                {
                    Persona existe = Datos.getPersonas().mostrarPersona(Convert.ToInt32(this.ddlTipo.SelectedValue), Convert.ToInt32(this.txtNroDocumento.Text));

                    if (existe.NroDocumento != null && existe.NroDocumento != 0)
                    {
                        lblTitAdvertencia.Text = "Ha Ocurrido un Problema";
                        lblMsjAdvertencia.Text = "La persona ya es socio.";
                        ModalPopupRegistrar.Hide();
                        Datos.rollback();
                        btnAceptarCancelacion.Visible = false;
                        btnCancelarCancelacion.Text = "Aceptar";
                        ModalPopupCancelarRegistrar.Show();
                        return;
                    }

                    // 2 - Creo un Domicilio

                    Domicilio d = new Domicilio();
                    d.IdDomicilio = Convert.ToInt32(Datos.getDomicilios().obtenerUltNroDomicilio());
                    d.NroCalle = Convert.ToInt32(this.txtNroCalle.Text);
                    d.Piso = Convert.ToInt32(this.txtPiso.Text);
                    d.IdCalle = Convert.ToInt32(this.ddlCalle.SelectedValue);
                    d.IdZona = Convert.ToInt32(this.ddlZona.SelectedValue);
                    d.Dpto = this.txtDpto.Text;


                    if (Datos.getDomicilios().crearDomicilio(d) <= 0)
                    {
                        lblTitAdvertencia.Text = "Ha Ocurrido un Problema";
                        lblMsjAdvertencia.Text = "No se pudo registrar el domicilio.";
                        ModalPopupRegistrar.Hide();
                        Datos.rollback();
                        btnAceptarCancelacion.Visible = false;
                        btnCancelarCancelacion.Text = "Aceptar";
                        ModalPopupCancelarRegistrar.Show();
                        return;
                    }

                    // 3 - Creo una Persona

                    Persona p = new Persona();
                    p.NroDocumento = Convert.ToInt32(this.txtNroDocumento.Text);
                    p.TipoDocumento = Convert.ToInt32(this.ddlTipo.SelectedValue);
                    p.IdDomicilio = Convert.ToInt32(d.IdDomicilio);
                    p.Nombre = Convert.ToString(this.txtNombre.Text);
                    p.Apellido = Convert.ToString(this.txtApellido.Text);
                    p.Email = Convert.ToString(this.txtEmail.Text);
                    p.Sexo = Convert.ToString(this.radioSexo.SelectedItem.Text);
                    p.Telefono = Convert.ToInt64(this.txtTelFijo.Text);
                    p.FechaNacimiento = Convert.ToDateTime(this.txtFechaNacimiento.Text);

                    if (Datos.getPersonas().crearPersona(p) <= 0)
                    {
                        lblTitAdvertencia.Text = "Ha Ocurrido un Problema";
                        lblMsjAdvertencia.Text = "No se pudo registrar la Persona.";
                        Datos.rollback();
                        ModalPopupRegistrar.Hide();
                        btnAceptarCancelacion.Visible = false;
                        btnCancelarCancelacion.Text = "Aceptar";
                        ModalPopupCancelarRegistrar.Show();
                        return;
                    }




                    // 4 - Creo un Socio

                    Socio s = new Socio();
                    s.IdSocio = Convert.ToInt32(Datos.getSocios().obtenerUltNroSocio());
                    s.FechaAlta = Convert.ToDateTime(DateTime.Today);
                    s.NroDocumento = p.NroDocumento;
                    s.IdTipoDocumento = p.TipoDocumento;
                    //ROL 2 SOCIO
                    int idusuario = Seguridad.insertarUsuario(p.Apellido, p.NroDocumento.ToString(), "2");
                    if(idusuario > 0)
                        s.IdUsuario = idusuario;
                    s.Estado = 1;
                    s.IdTipoSocio = 1;


                    if (Datos.getSocios().crearSocio(s) <= 0)
                    {
                        lblTitAdvertencia.Text = "Ha Ocurrido un Problema";
                        lblMsjAdvertencia.Text = "No se pudo registrar el Socio.";
                        Datos.rollback();
                        ModalPopupRegistrar.Hide();
                        btnAceptarCancelacion.Visible = false;
                        btnCancelarCancelacion.Text = "Aceptar";
                        ModalPopupCancelarRegistrar.Show();
                        return;
                    }


                }
                else if (this.radioTipoSocio.SelectedIndex == 1)
                {
                    // 2 - Creo un Domicilio

                    Domicilio d = new Domicilio();
                    d.IdDomicilio = Convert.ToInt32(Datos.getDomicilios().obtenerUltNroDomicilio());
                    d.NroCalle = Convert.ToInt32(this.txtNroCalleEmpresa.Text);
                    d.Piso = Convert.ToInt32(this.txtPisoEmpresa.Text);
                    d.IdCalle = Convert.ToInt32(this.ddlCalleEmpresa.SelectedValue);
                    d.IdZona = Convert.ToInt32(this.ddlZonaEmpresa.SelectedValue);
                    d.Dpto = Convert.ToString(this.txtDptoEmpresa.Text);
                    

                    Datos.getDomicilios().crearDomicilio(d);

                    // 3 - Creo un nuevo Socio Empresa

                    SocioEmpresa se = new SocioEmpresa();
                    se.NroCUIT = Convert.ToInt64(this.txtCUIT.Text);
                    se.RazonSocial = Convert.ToString(this.txtRazonSocial.Text);
                    se.FechaIncioActividades = Convert.ToDateTime(this.txtFechaInicio.Text);
                    se.PaginaWEB = Convert.ToString(this.txtWebEmpresa.Text);
                    se.IdTipoOrganizacion = Convert.ToInt32(this.ddlTipoOrganizacion.SelectedValue);
                    se.IdDomicilio = Convert.ToInt32(d.IdDomicilio);
                    se.Telefono = Convert.ToInt32(this.txtTelEmpresa.Text);
                    se.Email = Convert.ToString(this.txtEmailEmpresa.Text);
                    se.IdTipoDocResp = Convert.ToInt32(this.ddlTipoDocResp.SelectedValue);
                    se.NroDocResp = Convert.ToInt32(this.txtNroDocResp.Text);

                    Datos.getSociosEmpresa().crearSocioEmpresa(se);

                    Socio s = new Socio();
                    s.IdSocio = Convert.ToInt32(Datos.getSocios().obtenerUltNroSocio());
                    s.FechaAlta = Convert.ToDateTime(DateTime.Today);
                    s.IdTipoDocumento = Convert.ToInt32(this.ddlTipoDocResp.SelectedValue);
                    s.NroDocumento = Convert.ToInt32(this.txtNroDocResp.Text);
                    s.Estado = 1;
                    s.IdTipoSocio = 2;
                    s.CUIT1 = Convert.ToInt64(this.txtCUIT.Text);
                    int idusuario = Seguridad.insertarUsuario(se.RazonSocial, this.txtCUIT.Text, "2");
                    if (idusuario > 0)
                        s.IdUsuario = idusuario;
                    
                   Datos.getSocios().crearSocio(s);

                }
            }
            Datos.commit();
        }

        catch (Exception err)
        {
            Console.WriteLine(err.ToString());
            Datos.rollback();
        }

        ModalPopupRegistrar.Hide();
        ModalPopupExito.Show();

       

    }


    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        btnAceptarCancelacion.Visible = true;
        btnCancelarCancelacion.Text = "Cancelar";
        ModalPopupCancelarRegistrar.Show();

    }

    protected void btnCancelarConfirmar_Click(object sender, EventArgs e)
    {
         Response.Redirect("/Cooperativa/Medidor/RegistrarSocio.aspx", true);    
    }

     protected void btnAceptarCancelacion_Click (object sender, EventArgs e)
     {
         Response.Redirect("/Cooperativa/default.aspx", true);    
     }

     protected void btnCancelarCancelacion_Click(object sender, EventArgs e)

     {
         ModalPopupCancelarRegistrar.Hide();       
     }

     protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)

     {
         //Response.Redirect("/Cooperativa/Medidor/RegistrarSocio.aspx", true); 
         Response.Redirect("/Cooperativa/default.aspx", true);
     
     }




     protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
     {
         if (Convert.ToDateTime(args.Value) > DateTime.Now)
         {
             args.IsValid = false;
         }
     }
}
