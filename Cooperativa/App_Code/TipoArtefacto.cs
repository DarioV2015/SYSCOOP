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
/// Descripción breve de TipoArtefacto
/// </summary>
public class TipoArtefacto
{
    private int idTipoArtefacto;

    public int IdTipoArtefacto
    {
        get { return idTipoArtefacto; }
        set { idTipoArtefacto = value; }
    }
    private string descripcion;

    public string Descripcion
    {
        get { return descripcion; }
        set { descripcion = value; }
    }
    private float potencia;

    public float Potencia
    {
        get { return potencia; }
        set { potencia = value; }
    }

    public TipoArtefacto()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
