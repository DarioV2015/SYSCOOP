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
/// Descripción breve de TipoMedidor
/// </summary>
public class TipoMedidor
{
    private int idTipoMedidor;

    public int IdTipoMedidor
    {
        get { return idTipoMedidor; }
        set { idTipoMedidor = value; }
    }

    private String descripcion;

    public String Descripcion
    {
        get { return descripcion; }
        set { descripcion = value; }
    }
    
    public TipoMedidor()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
