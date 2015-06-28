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
/// Descripción breve de PedidoInstalacion
/// </summary>
public class PedidoInstalacion
{
    private int nroPedido;

    public int NroPedido
    {
        get { return nroPedido; }
        set { nroPedido = value; }
    }
    private int nroSocio;

    public int NroSocio
    {
        get { return nroSocio; }
        set { nroSocio = value; }
    }
    private int nroMedidor;

    public int NroMedidor
    {
        get { return nroMedidor; }
        set { nroMedidor = value; }
    }
    private DateTime fechaPedido;

    public DateTime FechaPedido
    {
        get { return fechaPedido; }
        set { fechaPedido = value; }
    }
    private int idDomicilio;

    public int IdDomicilio
    {
        get { return idDomicilio; }
        set { idDomicilio = value; }
    }
    private int estado;

    public int Estado
    {
        get { return estado; }
        set { estado = value; }
    }

    private string apellidoSocio;

    public string ApellidoSocio
    {
        get { return apellidoSocio; }
        set { apellidoSocio = value; }
    }
    private string nombreSocio;

    public string NombreSocio
    {
        get { return nombreSocio; }
        set { nombreSocio = value; }
    }

    public PedidoInstalacion()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
