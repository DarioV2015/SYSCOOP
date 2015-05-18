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
/// Descripción breve de HistorialEmpleado
/// </summary>
public class HistorialEmpleado
{
	public HistorialEmpleado()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    private int idEmpleado;

    public int IdEmpleado
    {
        get { return idEmpleado; }
        set { idEmpleado = value; }
    }
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
    private String nombreEmpleado;

    public String NombreEmpleado
    {
        get { return nombreEmpleado; }
        set { nombreEmpleado = value; }
    }
    private String apellidoEmpleado;

    public String ApellidoEmpleado
    {
        get { return apellidoEmpleado; }
        set { apellidoEmpleado = value; }
    }
}
