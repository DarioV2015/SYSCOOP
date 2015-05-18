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

/// <summary>
/// Descripción breve de SocioEmpresa
/// </summary>
public class SocioEmpresa
{
	public SocioEmpresa()
	{
	
	}
    private long nroCUIT;

    public long NroCUIT
    {
        get { return nroCUIT; }
        set { nroCUIT = value; }
    }

    private string razonSocial;

    public string RazonSocial
    {
        get { return razonSocial; }
        set { razonSocial = value; }
    }

    private DateTime fechaIncioActividades;

    public DateTime FechaIncioActividades
    {
        get { return fechaIncioActividades; }
        set { fechaIncioActividades = value; }
    }

    private string paginaWEB;

    public string PaginaWEB
    {
        get { return paginaWEB; }
        set { paginaWEB = value; }
    }

    private int idTipoOrganizacion;

    public int IdTipoOrganizacion
    {
        get { return idTipoOrganizacion; }
        set { idTipoOrganizacion = value; }
    }


    private int idDomicilio;

    public int IdDomicilio
    {
        get { return idDomicilio; }
        set { idDomicilio = value; }
    }


    private int telefono;

    public int Telefono
    {
        get { return telefono; }
        set { telefono = value; }
    }


    private string email;

    public string Email
    {
        get { return email; }
        set { email = value; }
    }


    private DateTime fechaAlta;

    public DateTime FechaAlta
    {
        get { return fechaAlta; }
        set { fechaAlta = value; }
    }

    private DateTime fechaBaja;

    public DateTime FechaBaja
    {
        get { return fechaBaja; }
        set { fechaBaja = value; }
    }

    private int idTipoDocResp;

    public int IdTipoDocResp
    {
        get { return idTipoDocResp; }
        set { idTipoDocResp = value; }
    }

    private int nroDocResp;

    public int NroDocResp
    {
        get { return nroDocResp; }
        set { nroDocResp = value; }
    }

    private string nombreResponsable;

    public string NombreResponsable
    {
        get { return nombreResponsable; }
        set { nombreResponsable = value; }
    }

    private string apellidoResponsable;

    public string ApellidoResponsable
    {
        get { return apellidoResponsable; }
        set { apellidoResponsable = value; }
    }
    
    private int idCargo;

    public int IdCargo
    {
        get { return idCargo; }
        set { idCargo = value; }
    }

    private string nombreCalle;

    public string NombreCalle
    {
        get { return nombreCalle; }
        set { nombreCalle = value; }
    }

    private int nroCalle;

    public int NroCalle
    {
        get { return nroCalle; }
        set { nroCalle = value; }
    }

    private int idCalle;

    public int IdCalle
    {
        get { return idCalle; }
        set { idCalle = value; }
    }

    private int nroPiso;

    public int NroPiso
    {
        get { return nroPiso; }
        set { nroPiso = value; }
    }

    private string dpto;

    public string Dpto
    {
        get { return dpto; }
        set { dpto = value; }
    }

    private string descripcionZona;

    public string DescripcionZona
    {
        get { return descripcionZona; }
        set { descripcionZona = value; }
    }

    private int idSocioEmpresa;

    public int IdSocioEmpresa
    {
        get { return idSocioEmpresa; }
        set { idSocioEmpresa = value; }
    }

}
