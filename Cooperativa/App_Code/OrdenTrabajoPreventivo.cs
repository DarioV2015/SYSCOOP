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
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de OrdenTrabajoPreventivo
/// </summary>
public class OrdenTrabajoPreventivo
{
	public OrdenTrabajoPreventivo()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    private DateTime fechaCreacion;

    public DateTime FechaCreacion
    {
        get { return fechaCreacion; }
        set { fechaCreacion = value; }
    }

    private String nombre;

    public String Nombre
    {
        get { return nombre; }
        set { nombre = value; }
    }

    private String tiempoEstimado;

    public String TiempoEstimado
    {
        get { return tiempoEstimado; }
        set { tiempoEstimado = value; }
    }

    private String prioridad;

    public String Prioridad
    {
        get { return prioridad; }
        set { prioridad = value; }
    }

    private String asunto;

    public String Asunto
    {
        get { return asunto; }
        set { asunto = value; }
    }

    private String zona;

    public String Zona
    {
        get { return zona; }
        set { zona = value; }
    }

    private String duracion;

    public String Duracion
    {
        get { return duracion; }
        set { duracion = value; }
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

    private int idTareaPlanificada;

    public int IdTareaPlanificada
    {
        get { return idTareaPlanificada; }
        set { idTareaPlanificada = value; }
    }

    private int idOTP;
    public int IdOTP
    {
        get { return idOTP; }
        set { idOTP = value; }
    }

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

    private int idTipo;
    public int Idtipo
    {
        get { return idTipo; }
        set { idTipo = value; }
    }

    private String descripcionTipo;

    public String DescripcionTipo
    {
        get { return descripcionTipo; }
        set { descripcionTipo = value; }
    }
        
}
