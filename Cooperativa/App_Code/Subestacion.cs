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
/// Descripción breve de Subestacion
/// </summary>
public class Subestacion
{
	public Subestacion()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    private int idsubestacion;

    public int Idsubestacion
    {
        get { return idsubestacion; }
        set { idsubestacion = value; }
    }
    private String descripcion;

    public String Descripcion
    {
        get { return descripcion; }
        set { descripcion = value; }
    }
    private Domicilio domicilio;

    public Domicilio Domicilio
    {
        get { return domicilio; }
        set { domicilio = value; }
    }
}
