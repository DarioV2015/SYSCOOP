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
/// Descripción breve de PedidoHerramienta
/// </summary>
public class PedidoHerramienta
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
    private int estado;

    public int Estado
    {
        get { return estado; }
        set { estado = value; }
    }

    private int tipoPedido;

    public int TipoPedido
    {
        get { return tipoPedido; }
        set { tipoPedido = value; }
    }

    private List<DetallePedidoHerramienta> detalleHerramientas;

    public List<DetallePedidoHerramienta> DetalleHerramientas
    {
        get { return detalleHerramientas; }
        set { detalleHerramientas = value; }
    }

    public PedidoHerramienta()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
