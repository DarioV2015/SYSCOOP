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
/// Descripción breve de DetalleInsumo
/// </summary>
[Serializable]
public class DetalleInsumo
{
    private int nroDetalleInsumo;

    public int NroDetalleInsumo
    {
        get { return nroDetalleInsumo; }
        set { nroDetalleInsumo = value; }
    }
    private int nroDetalleOTC;

    public int NroDetalleOTC
    {
        get { return nroDetalleOTC; }
        set { nroDetalleOTC = value; }
    }
    private int nroOTC;

    public int NroOTC
    {
        get { return nroOTC; }
        set { nroOTC = value; }
    }
    private int nroInsumo;

    public int NroInsumo
    {
        get { return nroInsumo; }
        set { nroInsumo = value; }
    }
    private string insumo;

    public string Insumo
    {
        get { return insumo; }
        set { insumo = value; }
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

    private string unidadMedida;

    public string UnidadMedida
    {
        get { return unidadMedida; }
        set { unidadMedida = value; }
    }

    private int tipoInsumo;

    public int TipoInsumo
    {
        get { return tipoInsumo; }
        set { tipoInsumo = value; }
    }

    public DetalleInsumo()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
