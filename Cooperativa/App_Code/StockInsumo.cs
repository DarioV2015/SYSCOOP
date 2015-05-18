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
/// Descripción breve de StockInsumo
/// </summary>
[Serializable]
public class StockInsumo
{
    private int nroInsumo;

    public int NroInsumo
    {
        get { return nroInsumo; }
        set { nroInsumo = value; }
    }
    private string nombreInsumo;

    public string NombreInsumo
    {
        get { return nombreInsumo; }
        set { nombreInsumo = value; }
    }
    private float cantidadTotal;

    public float CantidadTotal
    {
        get { return cantidadTotal; }
        set { cantidadTotal = value; }
    }
    private float especificacion;

    public float Especificacion
    {
        get { return especificacion; }
        set { especificacion = value; }
    }
    private float cantidad;

    public float Cantidad
    {
        get { return cantidad; }
        set { cantidad = value; }
    }
    private int nroLote;

    public int NroLote
    {
        get { return nroLote; }
        set { nroLote = value; }
    }
    private DateTime fechaIngreso;

    public DateTime FechaIngreso
    {
        get { return fechaIngreso; }
        set { fechaIngreso = value; }
    }

    private float cantIngresada;

    public float CantIngresada
    {
        get { return cantIngresada; }
        set { cantIngresada = value; }
    }
    public StockInsumo()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
