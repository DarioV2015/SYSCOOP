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
/// Descripción breve de Calle
[Serializable]
public class Calle
{
	    
    private int idCalle;
    public int IdCalle
    {
        get { return idCalle; }
        set { idCalle = value; }
    }

    private string nombreCalle;
    public string NombreCalle
    {
        get { return nombreCalle; }
        set { nombreCalle = value; }
    }
    public Calle()
    {

    }
    public int obtenerUltNroCalle()
    {
        string sql = "select max (idCalle) from Calle";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }
}
