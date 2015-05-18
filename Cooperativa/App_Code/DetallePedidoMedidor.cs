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
/// Descripción breve de DetallePedidoMedidor
/// </summary>
[Serializable]
public class DetallePedidoMedidor
{
    private int nroDetalle;

    public int NroDetalle
    {
        get { return nroDetalle; }
        set { nroDetalle = value; }
    }
    private int nroPedido;

    public int NroPedido
    {
        get { return nroPedido; }
        set { nroPedido = value; }
    }
    private int tipoMedidor;

    public int TipoMedidor
    {
        get { return tipoMedidor; }
        set { tipoMedidor = value; }
    }
    private string descripcionTipoMedidor;

    public string DescripcionTipoMedidor
    {
        get { return descripcionTipoMedidor; }
        set { descripcionTipoMedidor = value; }
    }
    private int cantidad;

    public int Cantidad
    {
        get { return cantidad; }
        set { cantidad = value; }
    }

    public DetallePedidoMedidor()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
