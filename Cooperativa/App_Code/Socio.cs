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
/// Descripción breve de Socio
/// </summary>
[Serializable]
public class Socio : Persona{

    private int idSocio;

    public int IdSocio
    {
        get { return idSocio; }
        set { idSocio = value; }
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

    private int nroDocumento;

    public int NroDocumento1
    {
        get { return nroDocumento; }
        set { nroDocumento = value; }
    }
    
    private int estado;

    public int Estado
    {
        get { return estado; }
        set { estado = value; }
    }
    private int idUsuario;

    public int IdUsuario
    {
        get { return idUsuario; }
        set { idUsuario = value; }
    }

    private int idTipoDocumento;

    public int IdTipoDocumento
    {
        get { return idTipoDocumento; }
        set { idTipoDocumento = value; }
    }

    private String descripcionTipoDoc;

    public String DescripcionTipoDoc
    {
        get { return descripcionTipoDoc; }
        set { descripcionTipoDoc = value; }
    }

    private int idTipoSocio;

    public int IdTipoSocio
    {
        get { return idTipoSocio; }
        set { idTipoSocio = value; }
    }

    private long CUIT;

    public long CUIT1
    {
        get { return CUIT; }
        set { CUIT = value; }
    }

    private String idcalle;
    public String Idcalle
    {
        get { return idcalle; }
        set { idcalle = value; }
    }

    public Socio() 
	{

    }	
}
