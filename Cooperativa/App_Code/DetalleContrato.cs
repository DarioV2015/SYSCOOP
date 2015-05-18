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
/// Descripción breve de DetalleContrato
/// </summary>
public class DetalleContrato
{
   

    private int nroDetalle;

    public int NroDetalle
    {
        get { return nroDetalle; }
        set { nroDetalle = value; }
    }
    private int nroContrato;

    public int NroContrato
    {
        get { return nroContrato; }
        set { nroContrato = value; }
    }
    private int nroInsumo;

    public int NroInsumo
    {
        get { return nroInsumo; }
        set { nroInsumo = value; }
    }

    private int nroHerramienta;

    public int NroHerramienta
    {
        get { return nroHerramienta; }
        set { nroHerramienta = value; }
    }

    private String descripInsumo;

    public String DescripInsumo
    {
        get { return descripInsumo; }
        set { descripInsumo = value; }
    }

    private String descripHerramienta;

    public String DescripHerramienta
    {
        get { return descripHerramienta; }
        set { descripHerramienta = value; }
    }

    private int idTipoMedidores;

    public int IdTipoMedidores
    {
        get { return idTipoMedidores; }
        set { idTipoMedidores = value; }
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

    private float cantidadRestante;

    public float CantidadRestante
    {
        get { return cantidadRestante; }
        set { cantidadRestante = value; }
    }

    private int idEstado;

    public int IdEstado
    {
        get { return idEstado; }
        set { idEstado = value; }
    }

    private int nroLote;

    public int NroLote
    {
        get { return nroLote; }
        set { nroLote = value; }
    }

    

	public DetalleContrato()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
