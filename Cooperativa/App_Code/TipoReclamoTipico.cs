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
/// Descripción breve de TipoReclamoTipico
/// </summary>
public class TipoReclamoTipico
{
    private int idTipoReclamo;

    public int IdTipoReclamo
    {
        get { return idTipoReclamo; }
        set { idTipoReclamo = value; }
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
    private int prioridad;

    public int Prioridad
    {
        get { return prioridad; }
        set { prioridad = value; }
    }
    private string prioridadNombre;
    public string PrioridadNombre
    {
        get { return prioridadNombre; }
        set { prioridadNombre = value; }
    }

    private float tiempoResolucion;

    public float TiempoResolucion
    {
        get { return tiempoResolucion; }
        set { tiempoResolucion = value; }
    }

    public TipoReclamoTipico()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
