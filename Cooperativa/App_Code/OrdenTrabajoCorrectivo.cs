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
/// Descripción breve de OrdenTrabajoCorrectivo
/// </summary>
public class OrdenTrabajoCorrectivo
{
    private int nroOTC;

    public int NroOTC
    {
        get { return nroOTC; }
        set { nroOTC = value; }
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
    private string estado;

    public string Estado
    {
        get { return estado; }
        set { estado = value; }
    }
    private int nroGrupoGR;

    public int NroGrupoGR
    {
        get { return nroGrupoGR; }
        set { nroGrupoGR = value; }
    }
    private string nombreCalle;

    public string NombreCalle
    {
        get { return nombreCalle; }
        set { nombreCalle = value; }
    }
    private int nroCalle;

    public int NroCalle
    {
        get { return nroCalle; }
        set { nroCalle = value; }
    }
    private int piso;

    public int Piso
    {
        get { return piso; }
        set { piso = value; }
    }
    private string dpto;

    public string Dpto
    {
        get { return dpto; }
        set { dpto = value; }
    }
    private string zona;

    public string Zona
    {
        get { return zona; }
        set { zona = value; }
    }

    private int nroZona;

    public int NroZona
    {
        get { return nroZona; }
        set { nroZona = value; }
    }

    private DateTime horaInicio;

    public DateTime HoraInicio
    {
        get { return horaInicio; }
        set { horaInicio = value; }
    }
    private DateTime horaFin;

    public DateTime HoraFin
    {
        get { return horaFin; }
        set { horaFin = value; }
    }
    private string usuario;

    public string Usuario
    {
        get { return usuario; }
        set { usuario = value; }
    }
    private float tiempoResolucion;

    public float TiempoResolucion
    {
        get { return tiempoResolucion; }
        set { tiempoResolucion = value; }
    }
    private float prioridad;

    public float Prioridad
    {
        get { return prioridad; }
        set { prioridad = value; }
    }

    private int nroTipoReclamo;

    public int NroTipoReclamo
    {
        get { return nroTipoReclamo; }
        set { nroTipoReclamo = value; }
    }

    private string tipoReclamo;

    public string TipoReclamo
    {
        get { return tipoReclamo; }
        set { tipoReclamo = value; }
    }

    private int idDomicilio;

    public int IdDomicilio
    {
        get { return idDomicilio; }
        set { idDomicilio = value; }
    }

    private String descPriodidad;

    public String DescPriodidad
    {
        get { return descPriodidad; }
        set { descPriodidad = value; }
    }

    public OrdenTrabajoCorrectivo()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
