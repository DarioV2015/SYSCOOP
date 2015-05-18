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
/// Descripción breve de Medidor
/// </summary>
[Serializable]
public class Medidor 
{
    private String tipoMedidor;

    public String TipoMedidor
    {
        get { return tipoMedidor; }
        set { tipoMedidor = value; }
    }

    private String prioridad;

    public String Prioridad
    {
        get { return prioridad; }
        set { prioridad = value; }
    }

    private DateTime fechaAlta;

    public DateTime FechaAlta
    {
        get { return fechaAlta; }
        set { fechaAlta = value; }
    }
   
    private String nroLote;

    public String NroLote
    {
        get { return nroLote; }
        set { nroLote = value; }
    }
    private String nroMedidor;

    public String NroMedidor
    {
        get { return nroMedidor; }
        set { nroMedidor = value; }
    }
    private String nroFabricacion;

    public String NroFabricacion
    {
        get { return nroFabricacion; }
        set { nroFabricacion = value; }
    }

    private Domicilio domicilio;
    public Domicilio Domicilio
    {
        get { return domicilio; }
        set { domicilio = value; }
    }

    private int idlinea;
    public int Idlinea
    {
        get { return idlinea; }
        set { idlinea = value; }
    }

    private int idsocio;
    public int Idsocio
    {
        get { return idsocio; }
        set { idsocio = value; }
    }

    private Socio socio;
    public Socio Socio
    {
        get { return socio; }
        set { socio = value; }
    }
    


	public Medidor()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
