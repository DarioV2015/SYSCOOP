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
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de Avisos
/// </summary>
public class Avisos
{
	public Avisos()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public List<Insumo> traerInsumosVencidos()
    {
        string sql = "select datediff(month, CURRENT_TIMESTAMP, si.fechavencimiento), i.idinsumo, i.nombre, i.unidadmedida," +
        " convert(char(10), si.fechavencimiento, 103)" +
        " from insumo i, stockinsumo si" +
        " where i.idinsumo = si.idinsumo" +
        " and si.cantidad > 0" +
        " and i.idinsumo not in" +
        " (select i.idinsumo" +
        " from stockinsumo si, insumo i, detallepedidoinsumo dpi, pedidoinsumo pi" +
        " where si.idinsumo = i.idinsumo" +
        " and i.idinsumo = dpi.idinsumo" +
        " and pi.idestadopedidoinsumo in (1,2))";

        SqlDataReader dr = Datos.obtenerDataReader(sql);
        Insumo ins;
        List<Insumo> listaInsumosPorVencer = new List<Insumo>();

        while (dr.Read())
        {
            if (Convert.ToInt32(dr[0])<= 2) //insumo a 2 meses de vencerse
            {
                ins = new Insumo();

                ins.NroInsumo = Convert.ToInt32(dr[1]);
                ins.Nombre = dr[2].ToString();
                ins.UnidadMedida = dr[3].ToString();
                ins.FechaVencimiento = Convert.ToDateTime(dr[4]);

                listaInsumosPorVencer.Add(ins);
            }
        }

        dr.Close();
        return listaInsumosPorVencer;
    }
    public int obtenerUltimoPedidoInsumos()
    {
        string sql = "select max(idPedido) from PedidoInsumo with(NOLOCK)";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }
    public int obtenerUltimoDetallePedidoInsumos()
    {
        string sql = "select max(idDetalle) from DetallePedidoInsumo with(NOLOCK)";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }
    public int crearPedidoInsumo(PedidoInsumo pedido)
    {
        string sql = "insert into PedidoInsumo(idPedido, fecha, hora, idUsuario,idEstadoPedidoInsumo, idTipoPedido) values (@a,@b,@c,@d,@e,@f)";
        List<SqlParameter> param;

        int filas = -1;
        string msg = " ";

        try
        {
            param = new List<SqlParameter>();

            param.Add(new SqlParameter("@a", pedido.NroPedido));
            param.Add(new SqlParameter("@b", pedido.Fecha));
            param.Add(new SqlParameter("@c", pedido.Hora));
            param.Add(new SqlParameter("@d", pedido.NroUsuario));
            param.Add(new SqlParameter("@e", pedido.Estado));
            param.Add(new SqlParameter("@f", pedido.TipoPedido));

            filas = Datos.ejecutarComando(sql, param);
        }
        catch (SqlException s)
        {
            msg = s.Message.ToString();
        }

        return filas;
    }
    public int crearDetallePedidoInsumos(List<DetallePedidoInsumo> detallePedido)
    {
        string sql = "insert into DetallePedidoInsumo(idDetalle, idPedido, idInsumo, cantidad) values (@a,@b,@c,@d)";
        List<SqlParameter> param;

        int filas = -1;
        string msg = " ";

        try
        {
            foreach (DetallePedidoInsumo d in detallePedido)
            {
                param = new List<SqlParameter>();

                param.Add(new SqlParameter("@a", d.NroDetalle));
                param.Add(new SqlParameter("@b", d.NroPedido));
                param.Add(new SqlParameter("@c", d.NroInsumo));
                param.Add(new SqlParameter("@d", d.Cantidad));

                filas = Datos.ejecutarComando(sql, param);
            }
        }
        catch (SqlException s)
        {
            msg = s.Message.ToString();
        }

        return filas;
    }
    public List<Insumo> traerInsumosFaltaStock()
    {
        string sql = "select i.idinsumo, i.nombre, si.cantidad, i.unidadmedida" +
        " from insumo i, stockinsumo si" +
        " where i.idinsumo = si.idinsumo" +
        " and si.cantidad <= 100" +
        " and i.idtipoinsumo = 1" +
        " and i.idinsumo not in" +
        " (select i.idinsumo" +
        " from stockinsumo si, insumo i, detallepedidoinsumo dpi, pedidoinsumo pi" +
        " where si.idinsumo = i.idinsumo" +
        " and i.idinsumo = dpi.idinsumo" +
        " and pi.idestadopedidoinsumo in (1,2))" +
        " union" +
        " select i.idinsumo, i.nombre, si.cantidad,i.unidadmedida" +
        " from insumo i, stockinsumo si" +
        " where i.idinsumo = si.idinsumo" +
        " and si.cantidad <= 1" +
        " and i.idtipoinsumo = 2" +
        " and i.idinsumo not in" +
        " (select i.idinsumo" +
        " from stockinsumo si, insumo i, detallepedidoinsumo dpi, pedidoinsumo pi" +
        " where si.idinsumo = i.idinsumo" +
        " and i.idinsumo = dpi.idinsumo" +
        " and pi.idestadopedidoinsumo in (1,2))";

        SqlDataReader dr = Datos.obtenerDataReader(sql);
        Insumo ins;
        List<Insumo> listaInsumosSinStock = new List<Insumo>();

        while (dr.Read())
        {
            ins = new Insumo();

            ins.NroInsumo = Convert.ToInt32(dr[0]);
            ins.Nombre = dr[1].ToString();
            ins.Cantidad = Convert.ToSingle(dr[2]);
            ins.UnidadMedida = dr[3].ToString();

            listaInsumosSinStock.Add(ins);
        }

        dr.Close();
        return listaInsumosSinStock;
    }
    public List<Herramienta> traerHerramientasVencidas()
    {
        string sql = "select datediff(month, CURRENT_TIMESTAMP, h.fechavencimiento), h.idherramienta, h.descripcion," +
        " convert(char(10),h.fechavencimiento, 103)" +
        " from herramienta h" +
        " where h.idherramienta not in" +
        " (select h.idherramienta" +
        " from herramienta h, detallepedidoherramienta dph, pedidoherramienta ph" +
        " where h.idherramienta = dph.idherramienta" +
        " and ph.idestadopedidoherramienta in (1,2))";

        SqlDataReader dr = Datos.obtenerDataReader(sql);
        Herramienta her;
        List<Herramienta> listaHerramientasPorVencer = new List<Herramienta>();

        while (dr.Read())
        {
            if (Convert.ToInt32(dr[0]) <= 2) //herramientas a 6 meses de vencerse
            {
                her = new Herramienta();

                her.NroHerramienta = Convert.ToInt32(dr[1]);
                her.Descripcion = dr[2].ToString();
                her.FechaVencimiento = Convert.ToDateTime(dr[3]);

                listaHerramientasPorVencer.Add(her);
            }
        }

        dr.Close();
        return listaHerramientasPorVencer;
    }
    public int obtenerUltimoPedidoHerramientas()
    {
        string sql = "select max(idPedido) from PedidoHerramienta with(NOLOCK)";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }
    public int obtenerUltimoDetallePedidoHerramientas()
    {
        string sql = "select max(idDetalle) from DetallePedidoHerramienta with(NOLOCK)";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }
    public int crearPedidoHerramienta(PedidoHerramienta pedido)
    {
        string sql = "insert into PedidoHerramienta(idPedido, fecha, hora, idUsuario,idEstadoPedidoHerramienta, idTipoPedido) values (@a,@b,@c,@d,@e,@f)";
        List<SqlParameter> param;

        int filas = -1;
        string msg = " ";

        try
        {
            param = new List<SqlParameter>();

            param.Add(new SqlParameter("@a", pedido.NroPedido));
            param.Add(new SqlParameter("@b", pedido.Fecha));
            param.Add(new SqlParameter("@c", pedido.Hora));
            param.Add(new SqlParameter("@d", pedido.NroUsuario));
            param.Add(new SqlParameter("@e", pedido.Estado));
            param.Add(new SqlParameter("@f", pedido.TipoPedido));

            filas = Datos.ejecutarComando(sql, param);
        }
        catch (SqlException s)
        {
            msg = s.Message.ToString();
        }

        return filas;
    }
    public int crearDetallePedidoHerramientas(List<DetallePedidoHerramienta> detallePedido)
    {
        string sql = "insert into DetallePedidoHerramienta(idDetalle, idPedido, idHerramienta, cantidad) values (@a,@b,@c,@d)";
        List<SqlParameter> param;

        int filas = -1;
        string msg = " ";

        try
        {
            foreach (DetallePedidoHerramienta d in detallePedido)
            {
                param = new List<SqlParameter>();

                param.Add(new SqlParameter("@a", d.NroDetalle));
                param.Add(new SqlParameter("@b", d.NroPedido));
                param.Add(new SqlParameter("@c", d.NroHerramienta));
                param.Add(new SqlParameter("@d", d.Cantidad));

                filas = Datos.ejecutarComando(sql, param);
            }
        }
        catch (SqlException s)
        {
            msg = s.Message.ToString();
        }

        return filas;
    }
    public List<Medidor> traerStockMedidores()
    {
        string sql = "select m.idmedidor, m.nrolote, m.nrofabricacion, tm.descripcion" +
        " from medidor m, tipomedidor tm" +
        " where m.idtipomedidor = tm.idtipomedidor" +
        " and m.idestadomedidor <> 2" +
        " and m.idestadomedidor <> 3" +
        " and m.idtipomedidor not in" +
        " (select dpm.idtipomedidor" +
        " from detallepedidomedidor dpm)";

        SqlDataReader dr = Datos.obtenerDataReader(sql);
        Medidor m;
        List<Medidor> listaMedidores = new List<Medidor>();

        while (dr.Read())
        {
            m = new Medidor();

            m.NroMedidor = dr[0].ToString();
            m.NroLote = dr[1].ToString();
            m.NroFabricacion = dr[2].ToString();
            m.TipoMedidor = dr[3].ToString();

            listaMedidores.Add(m);
        }

        dr.Close();
        return listaMedidores;
    }
    public int crearPedidoMedidores(PedidoMedidor pedido)
    {
        string sql = "insert into PedidoMedidor(idPedido, fecha, hora, idUsuario,idEstadoPedido) values (@a,@b,@c,@d,@e)";
        List<SqlParameter> param;

        int filas = -1;
        string msg = " ";

        try
        {
            param = new List<SqlParameter>();

            param.Add(new SqlParameter("@a", pedido.NroPedido));
            param.Add(new SqlParameter("@b", pedido.Fecha));
            param.Add(new SqlParameter("@c", pedido.Hora));
            param.Add(new SqlParameter("@d", pedido.NroUsuario));
            param.Add(new SqlParameter("@e", pedido.EstadoPedido));
           
            filas = Datos.ejecutarComando(sql, param);
        }
        catch (SqlException s)
        {
            msg = s.Message.ToString();
        }

        return filas;
    }
    public int crearDetallePedidoMedidores(List<DetallePedidoMedidor> detallePedido)
    {
        string sql = "insert into DetallePedidoMedidor(idDetalle, idPedido, idTipoMedidor, cantidad) values (@a,@b,@c,@d)";
        List<SqlParameter> param;

        int filas = -1;
        string msg = " ";

        try
        {
            foreach (DetallePedidoMedidor d in detallePedido)
            {
                param = new List<SqlParameter>();

                param.Add(new SqlParameter("@a", d.NroDetalle));
                param.Add(new SqlParameter("@b", d.NroPedido));
                param.Add(new SqlParameter("@c", d.TipoMedidor));
                param.Add(new SqlParameter("@d", d.Cantidad));

                filas = Datos.ejecutarComando(sql, param);
            }
        }
        catch (SqlException s)
        {
            msg = s.Message.ToString();
        }

        return filas;
    }
    public int obtenerUltimoPedidoMedidores()
    {
        string sql = "select max(idPedido) from PedidoMedidor with(NOLOCK)";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }
    public int obtenerUltimoDetallePedidoMedidores()
    {
        string sql = "select max(idDetalle) from DetallePedidoMedidor with(NOLOCK)";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }
}
