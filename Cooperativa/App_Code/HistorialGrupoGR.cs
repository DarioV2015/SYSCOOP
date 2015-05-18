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
/// Descripción breve de HistorialGrupoGR
/// </summary>
public class HistorialGrupoGR
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

    private int idGrupo;

    public int IdGrupo
    {
        get { return idGrupo; }
        set { idGrupo = value; }
    }

    private int idTurno;

    public int IdTurno
    {
        get { return idTurno; }
        set { idTurno = value; }
    }

    private String turno;

    public String Turno
    {
        get { return turno; }
        set { turno = value; }
    }

    private String apellidoEmpleado;

    public String ApellidoEmpleado
    {
        get { return apellidoEmpleado; }
        set { apellidoEmpleado = value; }
    }
    
    private String nombreEmpleado;

    public String NombreEmpleado
    {
        get { return nombreEmpleado; }
        set { nombreEmpleado = value; }
    }
    
    
    public HistorialGrupoGR()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
