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
/// Descripción breve de datosUsuario
/// </summary>
public class DatosUsuario
{
	public DatosUsuario()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    private String usuario;

    public String Usuario
    {
        get { return usuario; }
        set { usuario = value; }
    }
    private String rol;

    public String Rol
    {
        get { return rol; }
        set { rol = value; }
    }
    private String nroSocio;

    public String NroSocio
    {
        get { return nroSocio; }
        set { nroSocio = value; }
    }
    private String nroGuardia;

    public String NroGuardia
    {
        get { return nroGuardia; }
        set { nroGuardia = value; }
    }

    private String legajo;

    public String Legajo
    {
        get { return legajo; }
        set { legajo = value; }
    }

    private String password;

    public String Password
    {
        get { return password; }
        set { password = value; }
    }

    private String idUsuario;

    public String IdUsuario
    {
        get { return idUsuario; }
        set { idUsuario = value; }
    }

    private String Nrocuadrilla;

    public String NroCuadrilla
    {
        get { return Nrocuadrilla; }
        set { Nrocuadrilla = value; }
    }

}
