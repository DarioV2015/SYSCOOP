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
/// Descripción breve de Actividad
/// </summary>
[Serializable]
public class Actividad
{
    private int idActividad;

    public int IdActividad
    {
        get { return idActividad; }
        set { idActividad = value; }
    }

    private String nombreAct;

    public String NombreAct
    {
        get { return nombreAct; }
        set { nombreAct = value; }
    }
    private String descripAct;

    public String DescripAct
    {
        get { return descripAct; }
        set { descripAct = value; }
    }
    private int idComplejidad;

    public int IdComplejidad
    {
        get { return idComplejidad; }
        set { idComplejidad = value; }
    }

    private int tiempoAct;

    public int TiempoAct
    {
        get { return tiempoAct; }
        set { tiempoAct = value; }
    }

    private List<Insumo> insumos;

    public List<Insumo> Insumos
    {
        get { return insumos; }
        set { insumos = value; }
    }

    private String descComplejidad;
    public String DescComplejidad
    {
        get { return descComplejidad; }
        set { descComplejidad = value; }
    }
    
    public Actividad()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
