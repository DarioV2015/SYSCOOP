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
/// Descripción breve de Problema
/// </summary>
public class Problema
{
    private int nroProblema;

    public int NroProblema
    {
        get { return nroProblema; }
        set { nroProblema = value; }
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

    public Problema()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
