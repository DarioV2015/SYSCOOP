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
/// Descripción breve de ResultadoInstalacion
/// </summary>
public class ResultadoInstalacion
{

    private float idTipoResultado;

    public float IdTipoResultado
    {
        get { return idTipoResultado; }
        set { idTipoResultado = value; }
    }

    private float idEstadoOIM;

    public float IdEstado
    {
        get { return idEstadoOIM; }
        set { idEstadoOIM = value; }
    }

    private String descripcion;

    public String Descripcion
    {
        get { return descripcion; }
        set { descripcion = value; }
    }
    private String nombre;

    public String Nombre
    {
        get { return nombre; }
        set { nombre = value; }
    }
    
    
    public ResultadoInstalacion()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
