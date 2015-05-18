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
/// Descripción breve de Zona
/// </summary>
public class Zona
{
	public Zona()
	{
	
	}

    private int idZona;

    public int IdZona
    {
        get { return idZona; }
        set { idZona = value; }
    }

    private string descripcion;

    public string Descripcion
    {
        get { return descripcion; }
        set { descripcion = value; }
    }

    private int cantManzanas;

    public int CantManzanas
    {
        get { return cantManzanas; }
        set { cantManzanas = value; }
    }

    private string calleNorte;

    public string CalleNorte
    {
        get { return calleNorte; }
        set { calleNorte = value; }
    }

    private string calleSur;

    public string CalleSur
    {
        get { return calleSur; }
        set { calleSur = value; }
    }

    private string calleEste;

    public string CalleEste
    {
        get { return calleEste; }
        set { calleEste = value; }
    }

    private string calleOeste;

    public string CalleOeste
    {
        get { return calleOeste; }
        set { calleOeste = value; }
    }
}
