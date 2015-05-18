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
/// Descripción breve de PedidoMedidor
/// </summary>
public class PedidoMedidor
{
    private int nroPedido;

    public int NroPedido
    {
        get { return nroPedido; }
        set { nroPedido = value; }
    }
    private DateTime fecha;

    public DateTime Fecha
    {
        get { return fecha; }
        set { fecha = value; }
    }
    private DateTime hora;

    public DateTime Hora
    {
        get { return hora; }
        set { hora = value; }
    }
    private int nroUsuario;

    public int NroUsuario
    {
        get { return nroUsuario; }
        set { nroUsuario = value; }
    }
    private int estadoPedido;

    public int EstadoPedido
    {
        get { return estadoPedido; }
        set { estadoPedido = value; }
    }

    private List<DetallePedidoMedidor> detalleMedidores;

    public List<DetallePedidoMedidor> DetalleMedidores
    {
        get { return detalleMedidores; }
        set { detalleMedidores = value; }
    }

    public PedidoMedidor()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
