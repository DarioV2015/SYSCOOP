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
/// Descripción breve de CorteProgramado
/// </summary>
public class CorteProgramado
{
	public CorteProgramado()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    private DateTime fechainicio;

    public DateTime Fechainicio
    {
        get { return fechainicio; }
        set { fechainicio = value; }
    }
    private String motivo;

    public String Motivo
    {
        get { return motivo; }
        set { motivo = value; }
    }
    private int idzona;
    public int Idzona
    {
        get { return idzona; }
        set { idzona = value; }
    }

    private int idcorte;
    public int Idcorte
    {
        get { return idcorte; }
        set { idcorte = value; }
    }
    private DateTime fechafin;

    public DateTime Fechafin
    {
        get { return fechafin; }
        set { fechafin = value; }
    }
}
