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
/// Descripción breve de Herramienta
/// </summary>
[Serializable]
public class Herramienta
{
    private int nroHerramienta;

    public int NroHerramienta
    {
        get { return nroHerramienta; }
        set { nroHerramienta = value; }
    }
    private string descripcion;

    public string Descripcion
    {
        get { return descripcion; }
        set { descripcion = value; }
    }
    private DateTime fechaIngreso;

    public DateTime FechaIngreso
    {
        get { return fechaIngreso; }
        set { fechaIngreso = value; }
    }
    private DateTime fechaVencimiento;

    public DateTime FechaVencimiento
    {
        get { return fechaVencimiento; }
        set { fechaVencimiento = value; }
    }
    private DateTime fechaBaja;

    public DateTime FechaBaja
    {
        get { return fechaBaja; }
        set { fechaBaja = value; }
    }
    private int nroLote;

    public int NroLote
    {
        get { return nroLote; }
        set { nroLote = value; }
    }
    private int nroTipoHerramienta;

    public int NroTipoHerramienta
    {
        get { return nroTipoHerramienta; }
        set { nroTipoHerramienta = value; }
    }
    private string descripcionTipo;

    public string DescripcionTipo
    {
        get { return descripcionTipo; }
        set { descripcionTipo = value; }
    }

    private string especificacionTecnica;

    public string EspecificacionTecnica
    {
        get { return especificacionTecnica; }
        set { especificacionTecnica = value; }
    }

    private int idEstado;

    public int IdEstado
    {
        get { return idEstado; }
        set { idEstado = value; }
    }


    public Herramienta()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
