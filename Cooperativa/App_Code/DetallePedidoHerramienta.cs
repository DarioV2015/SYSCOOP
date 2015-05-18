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
/// Descripción breve de DetallePedidoHerramienta
[Serializable]
public class DetallePedidoHerramienta
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
    private int nroHerramienta;

    public int NroHerramienta
    {
        get { return nroHerramienta; }
        set { nroHerramienta = value; }
    }

    private String descripHerramienta;

    public String DescripHerramienta
    {
        get { return descripHerramienta; }
        set { descripHerramienta = value; }
    }

    private float cantidad;

    public float Cantidad
    {
        get { return cantidad; }
        set { cantidad = value; }
    }
    public DetallePedidoHerramienta()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
