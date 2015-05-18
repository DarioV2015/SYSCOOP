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
/// Descripción breve de Proveedor
/// </summary>
public class Proveedor
{

    private int idProveedor;
    public int IdProveedor
    {
        get { return idProveedor; }
        set { idProveedor = value; }
    }
    
    private double cuit;
    public double Cuit
    {
        get { return cuit; }
        set { cuit = value; }
    }

    private String razonSocial;
    public String RazonSocial
    {
        get { return razonSocial; }
        set { razonSocial = value; }
    }

    private String cargoResp;
    public String CargoResp
    {
        get { return cargoResp; }
        set { cargoResp = value; }
    }
    private String apellidoResp;
    public String ApellidoResp
    {
        get { return apellidoResp; }
        set { apellidoResp = value; }
    }
    
    private String nombreResp;
    public String NombreResp
    {
        get { return nombreResp; }
        set { nombreResp = value; }
    }
    
    private int tipoDocResp;
    public int TipoDocResp
    {
        get { return tipoDocResp; }
        set { tipoDocResp = value; }
    }
    private int nroDocResp;
    public int NroDocResp
    {
        get { return nroDocResp; }
        set { nroDocResp = value; }
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


    public Proveedor()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
