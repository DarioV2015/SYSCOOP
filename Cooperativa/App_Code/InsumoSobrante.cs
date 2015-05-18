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
/// Descripción breve de InsumoSobrante
/// </summary>
[Serializable]
public class InsumoSobrante
{
    private int nroInsumo;

    public int NroInsumo
    {
        get { return nroInsumo; }
        set { nroInsumo = value; }
    }
    private float cantidadSobrante;

    public float CantidadSobrante
    {
        get { return cantidadSobrante; }
        set { cantidadSobrante = value; }
    }
    private int nroGrupo;

    public int NroGrupo
    {
        get { return nroGrupo; }
        set { nroGrupo = value; }
    }

    public InsumoSobrante()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
