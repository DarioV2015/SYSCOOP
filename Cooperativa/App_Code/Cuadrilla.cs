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
/// Descripción breve de Cuadrilla
/// </summary>
public class Cuadrilla
{

    private int idCuadrilla;
    public int IdCuadrilla
    {
        get { return idCuadrilla; }
        set { idCuadrilla = value; }
    }

    private int idEstado;
    public int IdEstado
    {
        get { return idEstado; }
        set { idEstado = value; }
    }

    private string estado;
    public string Estado
    {
        get { return estado; }
        set { estado = value; }
    }

    private int legajoCapataz;
    public int LegajoCapataz
    {
        get { return legajoCapataz; }
        set { legajoCapataz = value; }
    }

    private string apellidoCapataz;
    public string ApellidoCapataz
    {
        get { return apellidoCapataz; }
        set { apellidoCapataz = value; }
    }

    private string nombreCapataz;
    public string NombreCapataz
    {
        get { return nombreCapataz; }
        set { nombreCapataz = value; }
    }

    private int legajoOficial;
    public int LegajoOficial
    {
        get { return legajoOficial; }
        set { legajoOficial = value; }
    }

    private string apellidoOficial;
    public string ApellidoOficial
    {
        get { return apellidoOficial; }
        set { apellidoOficial = value; }
    }

    private string nombreOficial;
    public string NombreOficial
    {
        get { return nombreOficial; }
        set { nombreOficial = value; }
    }

    private int legajoMedioOficial;
    public int LegajoMedioOficial
    {
        get { return legajoMedioOficial; }
        set { legajoMedioOficial = value; }
    }

    private string apellidoMedioOficial;
    public string ApellidoMedioOficial
    {
        get { return apellidoMedioOficial; }
        set { apellidoMedioOficial = value; }
    }

    private string nombreMedioOficial;
    public string NombreMedioOficial
    {
        get { return nombreMedioOficial; }
        set { nombreMedioOficial = value; }
    }

    private int legajoAyudante;
    public int LegajoAyudante
    {
        get { return legajoAyudante; }
        set { legajoAyudante = value; }
    }

    private string apellidoAyudante;
    public string ApellidoAyudante
    {
        get { return apellidoAyudante; }
        set { apellidoAyudante = value; }
    }

    private string nombreAyudante;
    public string NombreAyudante
    {
        get { return nombreAyudante; }
        set { nombreAyudante = value; }
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
    
    
    
    public Cuadrilla()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
