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
/// Descripción breve de DetallePedidoInsumo
/// </summary>
[Serializable]
public class DetallePedidoInsumo
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
    private int nroInsumo;

    public int NroInsumo
    {
        get { return nroInsumo; }
        set { nroInsumo = value; }
    }

    

    private String descripInsumo;

    public String DescripInsumo
    {
        get { return descripInsumo; }
        set { descripInsumo = value; }
    }

    
    
 
    private float cantidad;

    public float Cantidad
    {
        get { return cantidad; }
        set { cantidad = value; }
    }

    private float cantidadIngresada;

    public float CantidadIngresada
    {
        get { return cantidadIngresada; }
        set { cantidadIngresada = value; }
    }
    
    private int nroLote;

    public int NroLote
    {
        get { return nroLote; }
        set { nroLote = value; }
    }

    private DateTime fechaVenc;

    public DateTime FechaVenc
    {
        get { return fechaVenc; }
        set { fechaVenc = value; }
    }


    public DetallePedidoInsumo()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
