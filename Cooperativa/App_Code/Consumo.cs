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
/// Descripción breve de Consumo
/// </summary>
public class Consumo
{
	public Consumo()
	{

	}

    private int nroConsumo;

    public int NroConsumo
    {
        get { return nroConsumo; }
        set { nroConsumo = value; }
    }
    private DateTime fechaMedicion;

    public DateTime FechaMedicion
    {
        get { return fechaMedicion; }
        set { fechaMedicion = value; }
    }
    private Double lecturaConsumo;

    public Double LecturaConsumo
    {
        get { return lecturaConsumo; }
        set { lecturaConsumo = value; }
    }
    private int nroMedidor;

    public int NroMedidor
    {
        get { return nroMedidor; }
        set { nroMedidor = value; }
    }

    
    private Double lecturaConsumoUltimoPeriodo;

    public Double LecturaConsumoUltimoPeriodo
    {
        get { return lecturaConsumoUltimoPeriodo; }
        set { lecturaConsumoUltimoPeriodo = value; }
    }
}
