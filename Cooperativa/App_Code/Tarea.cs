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
/// Descripción breve de Tarea
/// </summary>
public class Tarea
{
    private int idTarea;

    public int IdTarea
    {
        get { return idTarea; }
        set { idTarea = value; }
    }

    private int periodicidad;

    public int Periodicidad
    {
        get { return periodicidad; }
        set { periodicidad = value; }
    }

    private String nombre;

    public String Nombre
    {
        get { return nombre; }
        set { nombre = value; }
    }

    private String descripcion;

    public String Descripcion
    {
        get { return descripcion; }
        set { descripcion = value; }
    }
    
    
    
    public Tarea()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
