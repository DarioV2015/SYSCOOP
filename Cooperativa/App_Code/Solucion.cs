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
using System.Collections.Generic;

/// <summary>
/// Descripción breve de Solucion
/// </summary>
[Serializable]
public class Solucion
{
    private int nroSolucion;

    public int NroSolucion
    {
        get { return nroSolucion; }
        set { nroSolucion = value; }
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

    public Solucion()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
