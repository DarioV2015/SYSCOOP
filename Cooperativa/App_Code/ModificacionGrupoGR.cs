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
/// Descripción breve de ModificacionGrupoGR
/// </summary>
public class ModificacionGrupoGR
{
    private DateTime fechaInicio;

    public DateTime FechaInicio
    {
        get { return fechaInicio; }
        set { fechaInicio = value; }
    }
    private DateTime fechaFin;

    public DateTime FechaFin
    {
        get { return fechaFin; }
        set { fechaFin = value; }
    }
    private int legajoTitular;

    public int LegajoTitular
    {
        get { return legajoTitular; }
        set { legajoTitular = value; }
    }
    private String apellidoTitular;

    public String ApellidoTitular
    {
        get { return apellidoTitular; }
        set { apellidoTitular = value; }
    }
    private int legajoSuplente;

    public int LegajoSuplente
    {
        get { return legajoSuplente; }
        set { legajoSuplente = value; }
    }
    private String apellidoSuplente;

    public String ApellidoSuplente
    {
        get { return apellidoSuplente; }
        set { apellidoSuplente = value; }
    }
    

    public ModificacionGrupoGR()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
