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
/// Descripción breve de Prioridad
/// </summary>
public class Prioridad
{
	public Prioridad()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    private int idprioridad;

    public int Idprioridad
    {
        get { return idprioridad; }
        set { idprioridad = value; }
    }
    private String descripcion;

    public String Descripcion
    {
        get { return descripcion; }
        set { descripcion = value; }
    }
    private int ranking;

    public int Ranking
    {
        get { return ranking; }
        set { ranking = value; }
    }
}
