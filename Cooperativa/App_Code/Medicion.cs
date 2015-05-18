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
/// Descripción breve de Medicion
/// </summary>
[Serializable]
public class Medicion
{
    private String Nrocuenta;

    public String NROCUENTA
    {
        get { return Nrocuenta; }
        set { Nrocuenta = value; }
    }
    private String Nroruta;

    public String NRORUTA
    {
        get { return Nroruta; }
        set { Nroruta = value; }
    }
    private String Secuencia;

    public String SECUENCIA
    {
        get { return Secuencia; }
        set { Secuencia = value; }
    }
    private String Estado;

    public String ESTADO
    {
        get { return Estado; }
        set { Estado = value; }
    }
    private String Desconocido;

    public String DESCONOCIDO
    {
        get { return Desconocido; }
        set { Desconocido = value; }
    }
    private String Fecha;

    public String FECHA
    {
        get { return Fecha; }
        set { Fecha = value; }
    }
    private String Hora;

    public String HORA
    {
        get { return Hora; }
        set { Hora = value; }
    }
    private String Novedades;

    public String NOVEDADES
    {
        get { return Novedades; }
        set { Novedades = value; }
    }
    private String DomicilioCorregido;

    public String DOMICILIOCORREGIDO
    {
        get { return DomicilioCorregido; }
        set { DomicilioCorregido = value; }
    }
    private String NroMedidorCorregido;

    public String NROMEDIDORCORREGIDO
    {
        get { return NroMedidorCorregido; }
        set { NroMedidorCorregido = value; }
    }

	public Medicion()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
