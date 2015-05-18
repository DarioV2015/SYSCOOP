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
/// Descripción breve de Reclamo
/// </summary>
public class Reclamo
{
    private int nroReclamo;

    public int NroReclamo
    {
        get { return nroReclamo; }
        set { nroReclamo = value; }
    }

    private DateTime fecha;

    public DateTime Fecha
    {
        get { return fecha; }
        set { fecha = value; }
    }
    
    private DateTime hora;
    
    public DateTime Hora
    {
        get { return hora; }
        set { hora = value; }
    }

    private String descripcion;

    public String Descripcion
    {
        get { return descripcion; }
        set { descripcion = value; }
    }

    private int nroOTC;

    public int NroOTC
    {
        get { return nroOTC; }
        set { nroOTC = value; }
    }
    private int nroSocio;

    public int NroSocio
    {
        get { return nroSocio; }
        set { nroSocio = value; }
    }
    private String estado;

    public String Estado
    {
        get { return estado; }
        set { estado = value; }
    }
    private int idEstado;

    public int IdEstado
    {
        get { return idEstado; }
        set { idEstado = value; }
    }
    private int idTipoReclamo;

    public int IdTipoReclamo
    {
        get { return idTipoReclamo; }
        set { idTipoReclamo = value; }
    }
    private String tipoReclamo;

    private String descripcionTipoReclamo;

    public String DescripcionTipoReclamo
    {
        get { return descripcionTipoReclamo; }
        set { descripcionTipoReclamo = value; }
    }

    public String TipoReclamo
    {
        get { return tipoReclamo; }
        set { tipoReclamo = value; }
    }
    private int idDomicilio;

    public int IdDomicilio
    {
        get { return idDomicilio; }
        set { idDomicilio = value; }
    }

    private int idcalle;

    public int IdCalle
    {
        get { return idcalle; }
        set { idcalle = value; }
    }
    private int nroCalle;

    public int NroCalle
    {
        get { return nroCalle; }
        set { nroCalle = value; }
    }
    private int piso;

    public int Piso
    {
        get { return piso; }
        set { piso = value; }
    }
    private String dpto;

    public String Dpto
    {
        get { return dpto; }
        set { dpto = value; }
    }
    private int nroPrioridad;
    public int NroPrioridad
    {
        get { return nroPrioridad; }
        set { nroPrioridad = value; }
    }
    private String prioridad;

    private String descPriodidad;

    public String DescPriodidad
    {
        get { return descPriodidad; }
        set { descPriodidad = value; }
    }

    public String Prioridad
    {
        get { return prioridad; }
        set { prioridad = value; }
    }
    private int idUsuario;
    public int IdUsuario
    {
        get { return idUsuario; }
        set { idUsuario = value; }
    }
    private int nroDoc;
    public int NroDoc
    {
        get { return nroDoc; }
        set { nroDoc = value; }
    }
    private int tipoDoc;
    public int TipoDoc
    {
        get { return tipoDoc; }
        set { tipoDoc = value; }
    }

    private String descZona;

    public String DescZona
    {
        get { return descZona; }
        set { descZona = value; }
    }

    private String zona;

    public String Zona
    {
        get { return zona; }
        set { zona = value; }
    }

    private String calle;

    public String Calle
    {
        get { return calle; }
        set { calle = value; }
    }

    
    
    private Socio socio;

    public Socio Socio
    {
        get 
        {
            if (socio == null)
            {
                socio = new Socio();
            }
            return socio; 
        }
        set { socio = value; }
    }

    private String tipoDocDescrip;

    public String TipoDocDescrip
    {
        get { return tipoDocDescrip; }
        set { tipoDocDescrip = value; }
    }

    private String apellidoSocio;

    public String ApellidoSocio
    {
        get { return apellidoSocio; }
        set { apellidoSocio = value; }
    }
    private String nombreSocio;

    public String NombreSocio
    {
        get { return nombreSocio; }
        set { nombreSocio = value; }
    }
    public Reclamo()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
