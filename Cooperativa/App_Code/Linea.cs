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
/// Descripción breve de Linea
/// </summary>
public class Linea
{
	public Linea()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    private int idlinea;

    public int Idlinea
    {
        get { return idlinea; }
        set { idlinea = value; }
    }
    private String descripcion;

    public String Descripcion
    {
        get { return descripcion; }
        set { descripcion = value; }
    }
    private Subestacion subestacion;
    public Subestacion Subestacion
    {
        get { return subestacion; }
        set { subestacion = value; }
    }
    private int idtipolinea;
    public int Idtipolinea
    {
        get { return idtipolinea; }
        set { idtipolinea = value; }
    }

}
