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
/// Descripción breve de TipoResultadoIM
/// </summary>
public class TipoResultadoIM
{
	public TipoResultadoIM()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    private int idTipoEstadoIM;

    public int IdTipoEstadoIM
    {
        get { return idTipoEstadoIM; }
        set { idTipoEstadoIM = value; }
    }


    private string nombre;

    public string Nombre
    {
        get { return nombre; }
        set { nombre = value; }
    }



    private string descripcion;

    public string Descripcion
    {
        get { return descripcion; }
        set { descripcion = value; }
    }


    private int estadoIM;

    public int EstadoIM
    {
        get { return estadoIM; }
        set { estadoIM = value; }
    }

   


}
