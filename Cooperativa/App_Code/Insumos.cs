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
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de Insumos
/// </summary>
public class Insumos
{

    public Insumo traerInsumo(int nroInsumo)
    {
        SqlParameter p = new SqlParameter("@a", nroInsumo);

        string sql = "SELECT I.IDINSUMO, I.NOMBRE, I.UNIDADMEDIDA, TI.DESCRIPCION " +
                        "FROM INSUMO I, TIPOINSUMO TI " +
                        "WHERE I.IDTIPOINSUMO = TI.IDTIPOINSUMO " +
                        "AND I.IDINSUMO = @a "; 

       
        SqlDataReader dr = Datos.obtenerDataReader(sql, p);

        Insumo i = new Insumo();

        while (dr.Read())
        {
            i.NroInsumo = Convert.ToInt32(dr[0]);
            i.Nombre = dr[1].ToString();
            i.UnidadMedida = dr[2].ToString();
            i.TipoInsumo = dr[3].ToString();
                      
        }

        dr.Close();
        return i;

    }

    public int obtenerUltimoNroInsumo()
    {
        string sql = "select max(IDINSUMO) from INSUMO";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }


    public int crearInsumoConUnidadMedida(int insumo, int tipo, String nombre, String unidad, String descripcion)
    {
        if (descripcion == "")
        {
            SqlParameter id = new SqlParameter("@id", insumo);
            SqlParameter ti = new SqlParameter("@ti", tipo);
            SqlParameter n = new SqlParameter("@n", nombre);
            SqlParameter u = new SqlParameter("@u", unidad);
            

            SqlParameter[] para = { id, ti, n, u };

            string sql = "INSERT INTO INSUMO (IDINSUMO, NOMBRE, UNIDADMEDIDA, IDTIPOINSUMO) " +
                         "VALUES(@id,@n,@u,@ti)";
            
            int filas = Datos.ejecutarComando(sql, para);
            return filas;

        }
        else
        {
            SqlParameter id = new SqlParameter("@id", insumo);
            SqlParameter ti = new SqlParameter("@ti", tipo);
            SqlParameter n = new SqlParameter("@n", nombre);
            SqlParameter u = new SqlParameter("@u", unidad);
            SqlParameter d = new SqlParameter("@d", descripcion);

            SqlParameter[] para = { id, ti, n, u, d };

            string sql = "INSERT INTO INSUMO (IDINSUMO, NOMBRE, UNIDADMEDIDA, IDTIPOINSUMO, DESCRIPCION) " +
                         "VALUES(@id,@n,@u,@ti,@d)";
            
            int filas = Datos.ejecutarComando(sql, para);
            return filas;
        }
    }

    public int crearInsumoConEspecificacion(int insumo, int tipo, String nombre, int especificacion, String descripcion)
    {
        if (descripcion == "")
        {
            SqlParameter id = new SqlParameter("@id", insumo);
            SqlParameter ti = new SqlParameter("@ti", tipo);
            SqlParameter n = new SqlParameter("@n", nombre);
            SqlParameter e = new SqlParameter("@e", especificacion);


            SqlParameter[] para = { id, ti, n, e };

            string sql = "INSERT INTO INSUMO (IDINSUMO, NOMBRE, ESPECIFICACION, IDTIPOINSUMO) " +
                         "VALUES(@id,@n,@e,@ti)";

            int filas = Datos.ejecutarComando(sql, para);
            return filas;

        }
        else
        {
            SqlParameter id = new SqlParameter("@id", insumo);
            SqlParameter ti = new SqlParameter("@ti", tipo);
            SqlParameter n = new SqlParameter("@n", nombre);
            SqlParameter e = new SqlParameter("@e", especificacion);
            SqlParameter d = new SqlParameter("@d", descripcion);

            SqlParameter[] para = { id, ti, n, e, d };

            string sql = "INSERT INTO INSUMO (IDINSUMO, NOMBRE, ESPECIFICACION, IDTIPOINSUMO, DESCRIPCION) " +
                         "VALUES(@id,@n,@e,@ti,@d)";

            int filas = Datos.ejecutarComando(sql, para);
            return filas;
        }
    }


    public List<Insumo> buscarInsumosDeActividad(String idactividad)
    {
        String sql = " select i.idinsumo, i.nombre from insumo i, actividadxinsumos axi " +
                     " where i.idinsumo = axi.idinsumo " +
                     " and axi.idactividad = " + idactividad;


        SqlDataReader sdr = Datos.obtenerDataReader(sql);
        List<Insumo> insumos = new List<Insumo>();
        while (sdr.Read())
        {
            Insumo i = new Insumo();
            i.NroInsumo = Convert.ToInt32(sdr["idinsumo"].ToString());
            i.Nombre = sdr["nombre"].ToString();
            insumos.Add(i);
        }
        sdr.Close();

        return insumos;
    }
    
    public int crearStockInsumo(int insumo, int lote, float cant, DateTime fechaVenc)
    {
        
            SqlParameter idInsumo = new SqlParameter("@idInsumo", insumo);
            SqlParameter nroLote = new SqlParameter("@nroLote", lote);
            SqlParameter cantidad = new SqlParameter("@cantidad", cant);
            SqlParameter fecha = new SqlParameter("@fecha", fechaVenc);

            SqlParameter[] para = { idInsumo, nroLote, cantidad, fecha};

            string sql = "INSERT INTO STOCKINSUMO (NROLOTE, IDINSUMO, CANTIDAD, FECHAVENCIMIENTO, FECHAINGRESO) "+
                         "VALUES (@nroLote, @idInsumo, @cantidad, @fecha, GETDATE())";

            int filas = Datos.ejecutarComando(sql, para);
            return filas;

    }

    public StockInsumo traerStockInsumo(int lote, int nroInsumo)
    {
        SqlParameter idInsumo = new SqlParameter("@idInsumo", nroInsumo);
        SqlParameter nroLote = new SqlParameter("@nroLote", lote);

        SqlParameter[] para = { idInsumo, nroLote };

        string sql = "SELECT NROLOTE, IDINSUMO, CANTIDAD FROM STOCKINSUMO WHERE NROLOTE = @nroLote AND IDINSUMO = @idInsumo";


        SqlDataReader dr = Datos.obtenerDataReader(sql, para);

        StockInsumo si = new StockInsumo();

        while (dr.Read())
        {
            si.NroLote = Convert.ToInt32(dr[0]);
            si.NroInsumo = Convert.ToInt32(dr[1]);
            si.Cantidad = Convert.ToInt32(dr[2]);
            
        }

        dr.Close();
        return si;

    }

    public int actualizarStockInsumo(int insumo, int lote, float cant)
    {

        SqlParameter idInsumo = new SqlParameter("@idInsumo", insumo);
        SqlParameter nroLote = new SqlParameter("@nroLote", lote);
        SqlParameter cantidad = new SqlParameter("@cantidad", cant);
        

        SqlParameter[] para = { idInsumo, nroLote, cantidad };

        string sql = "UPDATE STOCKINSUMO SET CANTIDAD = @cantidad WHERE IDINSUMO = @idInsumo AND NROLOTE = @nroLote";

        int filas = Datos.ejecutarComando(sql, para);
        return filas;

    }

    public List<DetallePedidoInsumo> mostrarDetalleInsumo (int idPedido)
    {
        String sql = "SELECT DP.IDDETALLE, DP.IDINSUMO, I.NOMBRE, DP.CANTIDAD  "+
                      "FROM DETALLEPEDIDOINSUMO DP, INSUMO I "+
                      "WHERE DP.IDINSUMO=I.IDINSUMO "+
                      "AND DP.IDPEDIDO=1" + idPedido;


        SqlDataReader sdr = Datos.obtenerDataReader(sql);
        List<DetallePedidoInsumo> pedido = new List<DetallePedidoInsumo>();
        while (sdr.Read())
        {
            DetallePedidoInsumo dp= new DetallePedidoInsumo();
            dp.NroDetalle = Convert.ToInt32(sdr[0]);
            dp.NroInsumo = Convert.ToInt32(sdr[1]);
            dp.DescripInsumo=Convert.ToString(sdr[2]);
            dp.Cantidad = Convert.ToInt32(sdr[3]);
            pedido.Add(dp);
        }
        sdr.Close();

        return pedido;
    }

    
    public Insumos()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
