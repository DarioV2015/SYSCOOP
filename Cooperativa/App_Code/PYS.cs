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
/// Descripción breve de PYS
/// </summary>
[Serializable]
public class PYS
{
    private int nroProblema;

    public int NroProblema
    {
        get { return nroProblema; }
        set { nroProblema = value; }
    }
    private string nombreProblema;

    public string NombreProblema
    {
        get { return nombreProblema; }
        set { nombreProblema = value; }
    }
    private string descripcionProblema;

    public string DescripcionProblema
    {
        get { return descripcionProblema; }
        set { descripcionProblema = value; }
    }
    private int nroSolucion;

    public int NroSolucion
    {
        get { return nroSolucion; }
        set { nroSolucion = value; }
    }
    private string nombreSolucion;

    public string NombreSolucion
    {
        get { return nombreSolucion; }
        set { nombreSolucion = value; }
    }
    private string descripcionSolucion;

    public string DescripcionSolucion
    {
        get { return descripcionSolucion; }
        set { descripcionSolucion = value; }
    }

    public PYS()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
