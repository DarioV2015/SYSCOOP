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
/// Descripción breve de TareaPlanificada
/// </summary>
/// 
[Serializable]
public class TareaPlanificada
{
	public TareaPlanificada()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    private String idtareaplanificada;

    public String Idtareaplanificada
    {
        get { return idtareaplanificada; }
        set { idtareaplanificada = value; }
    }
    private String idtareageneral;

    public String Idtareageneral
    {
        get { return idtareageneral; }
        set { idtareageneral = value; }
    }
    private DateTime fechainicio;

    public DateTime Fechainicio
    {
        get { return fechainicio; }
        set { fechainicio = value; }
    }
    private DateTime fechafin;

    public DateTime Fechafin
    {
        get { return fechafin; }
        set { fechafin = value; }
    }
    private String duracion;

    public String Duracion
    {
        get { return duracion; }
        set { duracion = value; }
    }
    private String idestado;

    public String Idestado
    {
        get { return idestado; }
        set { idestado = value; }
    }
    private String descestado;

    public String Descestado
    {
        get { return descestado; }
        set { descestado = value; }
    }
    private String tiempoestimado;

    public String Tiempoestimado
    {
        get { return tiempoestimado; }
        set { tiempoestimado = value; }
    }

    private String idprioridad;

    public String Idprioridad
    {
        get { return idprioridad; }
        set { idprioridad = value; }
    }

    private String idzona;

    public String Idzona
    {
        get { return idzona; }
        set { idzona = value; }
    }

    private String desczona;

    public String Desczona
    {
        get { return desczona; }
        set { desczona = value; }
    }

    private String asunto;

    public String Asunto
    {
        get { return asunto; }
        set { asunto = value; }
    }

    private List<Actividad> actividades;

    public List<Actividad> Actividades
    {
        get { return actividades; }
        set { actividades = value; }
    }

    private DateTime fechaCreacion;

    public DateTime FechaCreacion
    {
        get { return fechaCreacion; }
        set { fechaCreacion = value; }
    }


}
