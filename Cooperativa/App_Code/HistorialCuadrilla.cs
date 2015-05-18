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
/// Descripción breve de HistorialCuadrilla
[Serializable]
public class HistorialCuadrilla
{
    private int nroCuadrilla;

    public int NroCuadrilla
    {
        get { return nroCuadrilla; }
        set { nroCuadrilla = value; }
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
    private int idEstado;

    public int IdEstado
    {
        get { return idEstado; }
        set { idEstado = value; }
    }

    public HistorialCuadrilla()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
