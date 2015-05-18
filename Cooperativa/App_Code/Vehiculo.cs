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
/// Descripción breve de Vehiculo
/// </summary>
public class Vehiculo
{

    private int idVehiculo;

    public int IdVehiculo
    {
        get { return idVehiculo; }
        set { idVehiculo = value; }
    }
    
    private String dominio;

    public String Dominio
    {
        get { return dominio; }
        set { dominio = value; }
    }

    private String marca;

    public String Marca
    {
        get { return marca; }
        set { marca = value; }
    }
    
    private DateTime fechaAlta;

    public DateTime FechaAlta
    {
        get { return fechaAlta; }
        set { fechaAlta = value; }
    }
    private DateTime fechaBaja;

    public DateTime FechaBaja
    {
        get { return fechaBaja; }
        set { fechaBaja = value; }
    }




	public Vehiculo()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
