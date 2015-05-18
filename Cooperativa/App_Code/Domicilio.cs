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
/// Descripción breve de Domicilio
/// </summary>
[Serializable]
public class Domicilio : Calle
{
    private float idDomicilio;

    public float IdDomicilio
    {
        get { return idDomicilio; }
        set { idDomicilio = value; }
    }

    private float nroCalle;

    public float NroCalle
    {
        get { return nroCalle; }
        set { nroCalle = value; }
    }

    private float piso;

    public float Piso
    {
        get { return piso; }
        set { piso = value; }
    }

    private float idZona;

    public float IdZona
    {
        get { return idZona; }
        set { idZona = value; }
    }

    private string dpto;

    public string Dpto
    {
        get { return dpto; }
        set { dpto = value; }
    }

    private string latitud;

    public string Latitud
    {
        get { return latitud; }
        set { latitud = value; }
    }

    private string longitud;

    public string Longitud
    {
        get { return longitud; }
        set { longitud = value; }
    }


    private string nombreCalle;
    public string NombreCalle
    {
        get { return nombreCalle; }
        set { nombreCalle = value; }
    }


    private string zona;
    public string Zona
    {
        get { return zona; }
        set { zona = value; }
    }

    private String descripcion;

    public String Descripcion
    {
        get { 
            if (descripcion == null) 
            {
                descripcion = this.NombreCalle + " " + this.NroCalle + " " + this.Piso + " " + this.Dpto;
            } 
            return descripcion; 
        }
        set { descripcion = value; }
    }

    public Domicilio()

	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
