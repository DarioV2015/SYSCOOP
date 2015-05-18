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
/// Descripción breve de SociosMails
/// </summary>
[Serializable]
public class SociosMails
{
    private int nroSocio;

    public int NroSocio
    {
        get { return nroSocio; }
        set { nroSocio = value; }
    }
    private string nombre;

    public string Nombre
    {
        get { return nombre; }
        set { nombre = value; }
    }
    private string apellido;

    public string Apellido
    {
        get { return apellido; }
        set { apellido = value; }
    }
    private int nroDocumento;

    public int NroDocumento
    {
        get { return nroDocumento; }
        set { nroDocumento = value; }
    }
    private string email;

    public string Email
    {
        get { return email; }
        set { email = value; }
    }

    public SociosMails()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
