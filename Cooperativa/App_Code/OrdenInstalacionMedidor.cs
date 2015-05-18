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
/// Descripción breve de OrdenInstalacionMedidor
/// </summary>
public class OrdenInstalacionMedidor
{
    private int nroOrden;

    public int NroOrden
    {
        get { return nroOrden; }
        set { nroOrden = value; }
    }
    
    private DateTime fechaInst;

    public DateTime FechaInst
    {
        get { return fechaInst; }
        set { fechaInst = value; }
    }

    private int nroPedido;

    public int NroPedido
    {
        get { return nroPedido; }
        set { nroPedido = value; }
    }
    
    private int idEstado;

    public int IdEstado
    {
        get { return idEstado; }
        set { idEstado = value; }
    }
    private int idGrupo;

    public int IdGrupo
    {
        get { return idGrupo; }
        set { idGrupo = value; }
    }

    
    public OrdenInstalacionMedidor()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
