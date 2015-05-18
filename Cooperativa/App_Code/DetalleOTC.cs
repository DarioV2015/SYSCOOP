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
using System.Collections.Generic;

/// <summary>
/// Descripción breve de DetalleOTC
/// </summary>
[Serializable]
public class DetalleOTC
{
    private int nroDetalle;

    public int NroDetalle
    {
        get { return nroDetalle; }
        set { nroDetalle = value; }
    }
    private int nroOTC;

    public int NroOTC
    {
        get { return nroOTC; }
        set { nroOTC = value; }
    }

    private int nroProblema;

    public int NroProblema
    {
        get { return nroProblema; }
        set { nroProblema = value; }
    }
    private int nroSolucion;

    public int NroSolucion
    {
        get { return nroSolucion; }
        set { nroSolucion = value; }
    }

    private List<PYS> listaProbYSol;

    public List<PYS> ListaProbYSol
    {
        get { return listaProbYSol; }
        set { listaProbYSol = value; }
    }



    private List<Insumo> listaInsumos;

    public List<Insumo> ListaInsumos
    {
        get { return listaInsumos; }
        set { listaInsumos = value; }
    }

    public DetalleOTC()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
