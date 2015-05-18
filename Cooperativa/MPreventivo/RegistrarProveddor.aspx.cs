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

public partial class MPreventivo_RegistrarProveddor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int ultimoProveedor = Datos.getProveedores().obtenerUltimoIdProveedor();
        lblNroProveedor.Text = Convert.ToString(ultimoProveedor);
    }

    protected void BTNRegistrar_Click(object sender, EventArgs e)
    {
        ModalPopupConfirmacion.Show();
    }
    protected void BTNCanelar_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Show();
    }
    protected void btnAceptarRegistrar_Click(object sender, EventArgs e)
    {
        int empre = 0;
        
        int ultimoProveedor = Datos.getProveedores().obtenerUltimoIdProveedor();
        String razonSocial= this.txtRazonSocial.Text;
        long cuit = Convert.ToInt64(this.txtCUIT.Text);
        
        int tipoOrg = Convert.ToInt32(ddlTipoEmpresa.SelectedValue);
        DateTime fechaInicioActividad = Convert.ToDateTime(this.txtFechaInicio.Text);
        int idProvicia = Convert.ToInt32(ddlProvinvia.SelectedValue);
        int idCiudad = Convert.ToInt32(ddlCiudad.SelectedValue);
        String calle = this.txtCalle.Text;
        int nroCalle=Convert.ToInt32(this.txtNrocalle.Text);
        int piso;
        if (this.txtPiso.Text == "")
        {
            piso = 0;                       
        }
        else
        {
            piso = Convert.ToInt32(this.txtPiso.Text);
            
        }
        String depto;
        if (this.txtDepto.Text == "")
        {
            depto = "NULL";
        }
        else
        {
            depto = this.txtDepto.Text;
        }
        
        
        int tel = Convert.ToInt32(this.txtTelefono.Text);
        
        String email = this.txtEmail.Text;
        

        String sitioWeb = txtPaginaWEB.Text;
        if (sitioWeb == "")
        { sitioWeb = "NULL"; }


        int tipoDoc = Convert.ToInt32(this.ddlTipoDoc.SelectedValue);
        int nroDoc = Convert.ToInt32(this.txtNroDoc.Text);
        String apellido = this.txtApellidoResp.Text;
        String nombre = this.txtNombreResp.Text;
        int telResp;
        if (this.txtTelResponsable.Text == "")
        { telResp = 0; }
        else
        { telResp = Convert.ToInt32(this.txtTelResponsable.Text); }
        
        String emailResp = this.txtEmailResp.Text;
        if (emailResp == "")
        { emailResp = "NULL"; }


        String cargo = this.txtCargoResponsable.Text;
        String sexo = "";
        if (this.rdbFemenino.Checked)
        { sexo = "F"; }
        else
        { sexo = "M"; }
        int nroDomi= Datos.getDomiciliosExternos().obtenerUltimoIdDomicilioExterno();

        //Verifico si existe la empresa y si es proveedor

        int existe = Datos.getEmpresa().existeEmpresa(cuit);
        
        if (existe > 0)
        {
            //Existe empresa creada
            int prov = Datos.getProveedores().existeProveedor(cuit); 
            if(prov>0)
            {
                //La empresa es proveedor
                //Verificar si esta dada de alta o tiene fecha de baja
                Proveedor pr = new Proveedor();
                pr = Datos.getProveedores().elProveedorEstaDadoDeBaja(prov);
                        
                if(pr.FechaBaja <= DateTime.Now)
                {
                    //El Proveedor esta dado de baja
                    // Preguntar si desea darlo de alta y actualizar los datos
                    ModalPopupDarAlta.Show();

                }
                else
                {
                    //El proveedor existe y esta dado de alta
                    ModalPopupExisteLaEmpresa.Show();
                }

            }
            else
            {
                //la empresa existe pero no es proveedor
                 int povee = Datos.getProveedores().crearProveedor(ultimoProveedor, cuit);
                 if (povee > 0)
                 { Datos.commit(); }
            }

            
        }
        else
        {
            //REGISTRO DOMICILIOEXTERNO
            int domi = Datos.getDomiciliosExternos().crearDomicilioExterno(nroDomi, calle, nroCalle, piso, depto, idCiudad);
            
            //REGISTRO RESPONPABLE: PERSONA
            Persona p = new Persona();
            p.TipoDocumento = tipoDoc;
            p.NroDocumento = nroDoc;
            p.Apellido = apellido;
            p.Nombre = nombre;
            p.Sexo = sexo;
            p.Telefono = telResp;
            p.Email = emailResp;

            int resp = Datos.getPersonas().crearPersonaResponsable(p);
            
            //REGISTRO EMPRESA
            Empresa em = new Empresa();
            em.NroCUIT = cuit;
            em.RazonSocial = razonSocial;
            em.FechaIncioActividades = fechaInicioActividad;
            em.PaginaWEB = sitioWeb;
            em.IdTipoOrganizacion = tipoOrg;
            em.IdDomicilio = nroDomi;
            em.Telefono = tel;
            em.Email = email;
            em.IdTipoDocResp = tipoDoc;
            em.NroDocResp = nroDoc;
            em.CargoResponsable = cargo;

            empre = Datos.getEmpresa().crearEmpresaProveedor(em);

            //REGISTRO PROVEEDOR

            int povee = Datos.getProveedores().crearProveedor(ultimoProveedor, cuit);

            if (domi > 0 && empre > 0 && povee > 0)
            {
                Datos.commit();
                ModalPopupConfirmacion.Hide();
                ModalPopupExito.Show();
            }

        }
                 


    } 
    protected void btnCancelarRegistrar_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Show();
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
        //EXITO
        Response.Redirect("/Cooperativa/Default.aspx", true);

    }
    protected void btnAceptarDarAlta_Click(object sender, EventArgs e)
    {
        ModalPopupDarAlta.Hide();
        int cuit = Convert.ToInt32(txtCUIT.Text);
        int prov = Datos.getProveedores().existeProveedor(cuit); 
        int fila = Datos.getProveedores().actualizarProveedor(prov);
        if (fila > 0)
        {
            Datos.commit();
            ModalPopupExito.Show();
        }
        
    }
    protected void btnCancelarDarAlta_Click(object sender, EventArgs e)
    {
        
    }
    protected void btnAceptarExistEmpresa_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }

    
}



