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
/// Descripción breve de Marcador
/// </summary>
public class Marcador
{
    private String idLinea;
    public String IdLinea
    {
        get { return idLinea; }
        set { idLinea = value; }
    }

    private String esNuevo;

    private String calle;

    public String Calle
    {
        get { return this.Domicilio.NombreCalle; }
        set { this.Domicilio.NombreCalle = value; }
    }

    private String nro;

    public String Nro
    {
        get { return this.Domicilio.NroCalle.ToString(); }
        set { this.Domicilio.NroCalle = Convert.ToSingle(value); }
    }

    public String EsNuevo
    {
        get { return esNuevo; }
        set { esNuevo = value; }
    }

    private String imagen;

    public String Imagen
    {
        get { return imagen; }
        set { imagen = value; }
    }

    private String id;

    public String Id
    {
        get { return id; }
        set { id = value; }
    }
    private String latitud;

    public String Latitud
    {
        get { return latitud; }
        set { latitud = value; }
    }
    private String longitud;

    public String Longitud
    {
        get { return longitud; }
        set { longitud = value; }
    }

    private Domicilio domicilio;

    public Domicilio Domicilio
    {
        get {
            if (domicilio == null)
            { domicilio = new Domicilio(); }
            return domicilio; 
        }
        set { domicilio = value; }
    }

    private String idzona;

    public String Idzona
    {
        get { return this.Domicilio.IdZona.ToString(); }
        set { this.Domicilio.IdZona = Convert.ToSingle(value); }
    }


	public Marcador()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}


}
