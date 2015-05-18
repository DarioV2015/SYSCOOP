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
/// Descripción breve de DomilioExterno
/// </summary>
public class DomilioExterno
{
    private float idDomicilioExterno;
    public float IdDomicilioExterno
    {
        get { return idDomicilioExterno; }
        set { idDomicilioExterno = value; }
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

    private string dpto;
    public string Dpto
    {
        get { return dpto; }
        set { dpto = value; }
    }

    private string nombreCalle;
    public string NombreCalle
    {
        get { return nombreCalle; }
        set { nombreCalle = value; }
    }
    
    private string ciudad;
    public string Ciudad
    {
        get { return ciudad; }
        set { ciudad = value; }
    }
    
    private string provincia;
    public string Provincia
    {
        get { return provincia; }
        set { provincia = value; }
    }

    private float idCiudad;
    public float IdCiudad
    {
        get { return idCiudad; }
        set { idCiudad = value; }
    }

    private float idProvincia;
    public float IdProvincia
    {
        get { return idProvincia; }
        set { idProvincia = value; }
    }
    
    
    public DomilioExterno()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
