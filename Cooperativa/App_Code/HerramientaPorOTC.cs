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
/// Descripción breve de HerramientaPorOTC
/// </summary>
[Serializable]
public class HerramientaPorOTC
{
    private int nroDetalleHerramienta;

    public int NroDetalleHerramienta
    {
        get { return nroDetalleHerramienta; }
        set { nroDetalleHerramienta = value; }
    }
    private int nroOTC;

    public int NroOTC
    {
        get { return nroOTC; }
        set { nroOTC = value; }
    }
    private int nroHerramienta;

    public int NroHerramienta
    {
        get { return nroHerramienta; }
        set { nroHerramienta = value; }
    }
    private string nombre;

    public string Nombre
    {
        get { return nombre; }
        set { nombre = value; }
    }

    private string tipoHerramienta;

    public string TipoHerramienta
    {
        get { return tipoHerramienta; }
        set { tipoHerramienta = value; }
    }

    public HerramientaPorOTC()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
