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
/// Descripción breve de Contrato
/// </summary>
public class Contrato
{
    private int idContrato;

    public int IdContrato
    {
        get { return idContrato; }
        set { idContrato = value; }
    }

    private DateTime fechaPedido;

    public DateTime FechaPedido
    {
        get { return fechaPedido; }
        set { fechaPedido = value; }
    }

    private DateTime fechaIngreso;

    public DateTime FechaIngreso
    {
        get { return fechaIngreso; }
        set { fechaIngreso = value; }
    }
    private int idProveedor;

    public int IdProveedor
    {
        get { return idProveedor; }
        set { idProveedor = value; }
    }

    private String razonSocialProveedor;

    public String RazonSocialProveedor
    {
        get { return razonSocialProveedor; }
        set { razonSocialProveedor = value; }
    }

    private int idEstadoContrato;

    public int IdEstadoContrato
    {
        get { return idEstadoContrato; }
        set { idEstadoContrato = value; }
    }

    private String estadoContrato;

    public String EstadoContrato
    {
        get { return estadoContrato; }
        set { estadoContrato = value; }
    }
    private String tipoContrato;

    public String TipoContrato
    {
        get { return tipoContrato; }
        set { tipoContrato = value; }
    }


    
    
    public Contrato()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
