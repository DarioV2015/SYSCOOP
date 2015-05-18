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
using System.Data.OleDb;
using System.Data.Odbc;
/// <summary>
/// Descripción breve de Contratos
/// </summary>
public class Contratos
{
    public int obtenerUltimoItemContrato()
    {
        string sql = "select max(IDDETALLECONTRATO) from DETALLECONTRATO";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }

    public int obtenerUltimoIdContrato()
    {
        string sql = "select max(IDCONTRATO) from CONTRATO";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }

    public int insertarCONTRATO(int idContrato, DateTime fechaPedido, int idProveedor, String tipo)
    {
        SqlParameter nroContrato = new SqlParameter("@nroContrato", idContrato);
        SqlParameter fecha = new SqlParameter("@fecha", fechaPedido);
        SqlParameter proveedor = new SqlParameter("@proveedor", idProveedor);
        SqlParameter tipoContrato = new SqlParameter("@tipoContrato", tipo);

        SqlParameter[] para = { nroContrato, fecha, proveedor, tipoContrato };


        string sql = "INSERT INTO CONTRATO (IDCONTRATO, FECHAPEDIDO, IDPROVEEDOR, IDESTADOCONTRATO, TIPOCONTRATO) VALUES (@nroContrato, @fecha, @proveedor, 1, @tipoContrato)";

        int filas = 0;

        try
        {
            filas = Datos.ejecutarComando(sql, para);
        }
        catch { }

        return filas;
    }

    public int insertarItemDettaleMedidor(int idContrato, int idItem, int idTipoMedidor, float cant)
    {
        SqlParameter nroContrato = new SqlParameter("@nroContrato", idContrato);
        SqlParameter itemDetalle = new SqlParameter("@itemDetalle", idItem);
        SqlParameter tipoMed = new SqlParameter("@tipoMed", idTipoMedidor);
        SqlParameter cantidad = new SqlParameter("@cantidad", cant);


        SqlParameter[] para = { nroContrato, itemDetalle, tipoMed, cantidad };


        string sql = "INSERT INTO DETALLECONTRATO (IDDETALLECONTRATO, IDCONTRATO, CANTIDAD, IDTIPOMEDIDOR, IDESTADODETALLECONTRATO) VALUES (@itemDetalle, @nroContrato, @cantidad,@tipoMed,1)";

        int filas = 0;

        try
        {
            filas = Datos.ejecutarComando(sql, para);
        }
        catch { }

        return filas;
    }

    public int insertarItemDettaleHerramienta(int idContrato, int idItem, int idHerramienta, float cant)
    {
        SqlParameter nroContrato = new SqlParameter("@nroContrato", idContrato);
        SqlParameter itemDetalle = new SqlParameter("@itemDetalle", idItem);
        SqlParameter herramienta = new SqlParameter("@herramienta", idHerramienta);
        SqlParameter cantidad = new SqlParameter("@cantidad", cant);


        SqlParameter[] para = { nroContrato, itemDetalle, herramienta, cantidad };


        string sql = "INSERT INTO DETALLECONTRATO (IDDETALLECONTRATO, IDCONTRATO, CANTIDAD, IDHERRAMIENTA, IDESTADODETALLECONTRATO) VALUES (@itemDetalle, @nroContrato, @cantidad,@herramienta,1)";

        int filas = 0;

        try
        {
            filas = Datos.ejecutarComando(sql, para);
        }
        catch { }

        return filas;
    }
   

    public int insertarItemDettaleInsumo(int idContrato, int idItem, int idInsumo, float cant)
    {
        SqlParameter nroContrato = new SqlParameter("@nroContrato", idContrato);
        SqlParameter itemDetalle = new SqlParameter("@itemDetalle", idItem);
        SqlParameter insumo = new SqlParameter("@insumo", idInsumo);
        SqlParameter cantidad = new SqlParameter("@cantidad", cant);


        SqlParameter[] para = { nroContrato, itemDetalle, insumo, cantidad };


        string sql = "INSERT INTO DETALLECONTRATO (IDDETALLECONTRATO, IDCONTRATO, CANTIDAD, IDINSUMO, IDESTADODETALLECONTRATO) VALUES (@itemDetalle, @nroContrato, @cantidad,@insumo, 1)";

        int filas = 0;

        try
        {
            filas = Datos.ejecutarComando(sql, para);
        }
        catch { }

        return filas;
    }

    public List<Contrato> buscarContratoXNro(int nroContrato)
    {
        SqlParameter nro = new SqlParameter("@nro", nroContrato);
        
        SqlParameter[] para = { nro };

        String sql = "SELECT C.IDCONTRATO, E.RAZONSOCIAL, convert(char(10), C.FECHAPEDIDO, 103), C.TIPOCONTRATO " +
                     "FROM PROVEEDOR P, EMPRESA E, CONTRATO C "+
                     "WHERE C.IDPROVEEDOR = P.IDPROVEEDOR "+
                     "AND P.CUIT = E.CUIT "+
                     "AND (C.IDESTADOCONTRATO = 1 OR C.IDESTADOCONTRATO = 3) " +
                     "AND C.IDCONTRATO = @nro";
        
        SqlDataReader sdr = Datos.obtenerDataReader(sql,para);

        List<Contrato> lista = new List<Contrato>();
       
        while (sdr.Read())
        {
            Contrato c = new Contrato();
            c.IdContrato = Convert.ToInt32(sdr[0]);
            c.RazonSocialProveedor = Convert.ToString(sdr[1]);
            c.FechaPedido = Convert.ToDateTime(sdr[2]);
            c.TipoContrato = Convert.ToString(sdr[3]);
            lista.Add(c);
           
        }
        sdr.Close();
        return lista;
    }

    public List<Contrato> buscarContratoXFechaInicioYFin(DateTime fechaInicio, DateTime fechaFin)
    {
        SqlParameter inicio = new SqlParameter("@inicio", fechaInicio);
        SqlParameter fin = new SqlParameter("@fin", fechaFin);

        SqlParameter[] para = { inicio, fin };

        String sql = "SELECT C.IDCONTRATO, E.RAZONSOCIAL, convert(char(10), C.FECHAPEDIDO, 103), C.TIPOCONTRATO " +
                        "FROM PROVEEDOR P, EMPRESA E, CONTRATO C "+
                        "WHERE C.IDPROVEEDOR = P.IDPROVEEDOR  "+
                        "AND P.CUIT = E.CUIT "+
                        "AND (C.IDESTADOCONTRATO = 1 OR C.IDESTADOCONTRATO = 3) " +
                        "AND C.FECHAPEDIDO >= @inicio "+
                        "AND C.FECHAPEDIDO <= @fin" ;

        SqlDataReader sdr = Datos.obtenerDataReader(sql,para);

        List<Contrato> lista = new List<Contrato>();

        while (sdr.Read())
        {
            Contrato c = new Contrato();
            c.IdContrato = Convert.ToInt32(sdr[0]);
            c.RazonSocialProveedor = Convert.ToString(sdr[1]);
            c.FechaPedido = Convert.ToDateTime(sdr[2]);
            c.TipoContrato = Convert.ToString(sdr[3]);
            lista.Add(c);

        }
        sdr.Close();
        return lista;
    }

    public List<Contrato> buscarContratoXFechaInicio(DateTime fechaInicio)
    {
        SqlParameter inicio = new SqlParameter("@inicio", fechaInicio);
        

        SqlParameter[] para = { inicio };

        String sql = "SELECT C.IDCONTRATO, E.RAZONSOCIAL, convert(char(10), C.FECHAPEDIDO, 103), C.TIPOCONTRATO " +
                        "FROM PROVEEDOR P, EMPRESA E, CONTRATO C " +
                        "WHERE C.IDPROVEEDOR = P.IDPROVEEDOR  " +
                        "AND (C.IDESTADOCONTRATO = 1 OR C.IDESTADOCONTRATO = 3) " +
                        "AND P.CUIT = E.CUIT " +
                        "AND C.FECHAPEDIDO >= @inicio ";

        SqlDataReader sdr = Datos.obtenerDataReader(sql,para);

        List<Contrato> lista = new List<Contrato>();

        while (sdr.Read())
        {
            Contrato c = new Contrato();
            c.IdContrato = Convert.ToInt32(sdr[0]);
            c.RazonSocialProveedor = Convert.ToString(sdr[1]);
            c.FechaPedido = Convert.ToDateTime(sdr[2]);
            c.TipoContrato = Convert.ToString(sdr[3]);
            lista.Add(c);

        }
        sdr.Close();
        return lista;
    }

    public List<Contrato> buscarContratoXProveedor(int idProveedor)
    {
        SqlParameter proveed = new SqlParameter("@proveed", idProveedor);


        SqlParameter[] para = { proveed };

        String sql = "SELECT C.IDCONTRATO, E.RAZONSOCIAL, convert(char(10), C.FECHAPEDIDO, 103), C.TIPOCONTRATO "+
                        "FROM PROVEEDOR P, EMPRESA E, CONTRATO C "+
                        "WHERE C.IDPROVEEDOR = P.IDPROVEEDOR "+
                        "AND (C.IDESTADOCONTRATO = 1 OR C.IDESTADOCONTRATO = 3) " +
                        "AND P.CUIT = E.CUIT "+
                        "AND C.IDPROVEEDOR=@proveed";

       
        SqlDataReader sdr = Datos.obtenerDataReader(sql, para);

        List<Contrato> lista = new List<Contrato>();

        while (sdr.Read())
        {
            Contrato c = new Contrato();
            c.IdContrato = Convert.ToInt32(sdr[0]);
            c.RazonSocialProveedor = Convert.ToString(sdr[1]);
            c.FechaPedido = Convert.ToDateTime(sdr[2]);
            c.TipoContrato = Convert.ToString(sdr[3]);
            lista.Add(c);

        }
        sdr.Close();
        return lista;
    }


    public List<DetalleContrato> traerDetallePedidoInsumo (int idContrato)
    {
        SqlParameter contrato = new SqlParameter("@contrato", idContrato);

        SqlParameter[] para = { contrato };

        String sql = "SELECT D.IDDETALLECONTRATO, D.IDINSUMO, I.NOMBRE, D.CANTIDAD " +
                        "FROM DETALLECONTRATO D, INSUMO I " +
                        "WHERE I.IDINSUMO = D.IDINSUMO " +
                        "AND (D.IDESTADODETALLECONTRATO = 1 OR D.IDESTADODETALLECONTRATO = 2) " +
                        "AND D.IDCONTRATO = @contrato";


        SqlDataReader sdr = Datos.obtenerDataReader(sql, para);

        List<DetalleContrato> lista = new List<DetalleContrato>();
        String cant;

       
        while (sdr.Read())
        {
            DetalleContrato dc = new DetalleContrato();
            
            dc.NroDetalle= Convert.ToInt32(sdr[0]);
            dc.NroInsumo = Convert.ToInt32(sdr[1]);
            dc.DescripInsumo = Convert.ToString(sdr[2]);
            dc.Cantidad = Convert.ToSingle(sdr[3]);

            lista.Add(dc);

        }
        sdr.Close();
        return lista;
    }

    public List<DetalleContrato> traerDetallePedidoHerramienta(int idContrato)
    {
        SqlParameter contrato = new SqlParameter("@contrato", idContrato);

        SqlParameter[] para = { contrato };

        String sql = "SELECT D.IDDETALLECONTRATO, D.IDHERRAMIENTA, H.DESCRIPCION, D.CANTIDAD " +
                        "FROM DETALLECONTRATO D, HERRAMIENTA H "+
                        "WHERE D.IDHERRAMIENTA = H.IDHERRAMIENTA "+
                        "AND (D.IDESTADODETALLECONTRATO = 1 OR D.IDESTADODETALLECONTRATO = 2) " +
                        "AND IDCONTRATO = @contrato";

        
        SqlDataReader sdr = Datos.obtenerDataReader(sql, para);

        List<DetalleContrato> lista = new List<DetalleContrato>();

        while (sdr.Read())
        {
            DetalleContrato dc = new DetalleContrato();
            dc.NroDetalle = Convert.ToInt32(sdr[0]);
            dc.NroHerramienta = Convert.ToInt32(sdr[1]);
            dc.DescripHerramienta = Convert.ToString(sdr[2]);            
            dc.Cantidad = Convert.ToSingle(sdr[3]);
            lista.Add(dc);

        }
        sdr.Close();
        return lista;
    }

    public List<DetalleContrato> traerDetallePedidoMedidor(int idContrato)
    {
        SqlParameter contrato = new SqlParameter("@contrato", idContrato);

        SqlParameter[] para = { contrato };

        String sql = " select dc.iddetallecontrato, tm.descripcion tipomedidor, dc.cantidad "+
                     " from detalleContrato dc, tipomedidor tm "+
                     " where dc.idtipomedidor = tm.idtipomedidor "+
                     " AND dc.IDCONTRATO = @contrato ";


        SqlDataReader sdr = Datos.obtenerDataReader(sql, para);

        List<DetalleContrato> lista = new List<DetalleContrato>();

        while (sdr.Read())
        {
            DetalleContrato dc = new DetalleContrato();
            dc.NroDetalle = Convert.ToInt32(sdr[0]);
            //dc.NroHerramienta = Convert.ToInt32(sdr[1]);
            dc.DescripHerramienta = Convert.ToString(sdr[1]);
            dc.Cantidad = Convert.ToSingle(sdr[2]);
            lista.Add(dc);

        }
        sdr.Close();
        return lista;
    }

    public int actualizarEstadoDetalleCOMPLETADO(int idContrato, int idDetalle)
    {
        String sql = " UPDATE DETALLECONTRATO SET IDESTADODETALLECONTRATO = 3 " +
                        "WHERE IDCONTRATO = " + idContrato + " AND IDDETALLECONTRATO = " + idDetalle;

        int filas = Datos.ejecutarComando(sql);

        return filas;
    }
   
    public int actualizarEstadoDetallePARCIAL(int idContrato, int idDetalle , float cantRestante)
    {
        String sql = " UPDATE DETALLECONTRATO SET IDESTADODETALLECONTRATO = 2, CANTIDADRESTANTE = "+ cantRestante +
                     " WHERE IDCONTRATO = " + idContrato + " AND IDDETALLECONTRATO = " + idDetalle;

        int filas = Datos.ejecutarComando(sql);

        return filas;
    }

    public int actualizarEstadoContratoCOMPLETADO(int idContrato)
    {
        String sql = " UPDATE CONTRATO SET FECHAINGRESO = GETDATE(), IDESTADOCONTRATO = 2 WHERE IDCONTRATO = " + idContrato;
        
        int filas = Datos.ejecutarComando(sql);

        return filas;
    }

    public int actualizarEstadoContratoPARCIAL(int idContrato)
    {
        String sql = " UPDATE CONTRATO SET FECHAINGRESO = GETDATE(), IDESTADOCONTRATO = 3 WHERE IDCONTRATO = " + idContrato;

        int filas = Datos.ejecutarComando(sql);

        return filas;
    }




    public List<DetalleContrato> traerDetallePedidoInsumoPARCIAL(int idContrato)
    {
        SqlParameter contrato = new SqlParameter("@contrato", idContrato);

        SqlParameter[] para = { contrato };

        String sql = "SELECT D.IDDETALLECONTRATO, D.IDINSUMO, I.NOMBRE, D.CANTIDADRESTANTE " +
                        "FROM DETALLECONTRATO D, INSUMO I " +
                        "WHERE I.IDINSUMO = D.IDINSUMO " +
                        "AND (D.IDESTADODETALLECONTRATO = 1 OR D.IDESTADODETALLECONTRATO = 2) " +
                        "AND D.IDCONTRATO = @contrato";


        SqlDataReader sdr = Datos.obtenerDataReader(sql, para);

        List<DetalleContrato> lista = new List<DetalleContrato>();
        String cant;


        while (sdr.Read())
        {
            DetalleContrato dc = new DetalleContrato();

            dc.NroDetalle = Convert.ToInt32(sdr[0]);
            dc.NroInsumo = Convert.ToInt32(sdr[1]);
            dc.DescripInsumo = Convert.ToString(sdr[2]);
            dc.Cantidad = Convert.ToSingle(sdr[3]);

            lista.Add(dc);

        }
        sdr.Close();
        return lista;
    }

    public List<DetalleContrato> traerDetallePedidoHerramientaPARCIAL(int idContrato)
    {
        SqlParameter contrato = new SqlParameter("@contrato", idContrato);

        SqlParameter[] para = { contrato };

        String sql = "SELECT D.IDDETALLECONTRATO, D.IDHERRAMIENTA, H.DESCRIPCION, D.CANTIDADRESTANTE " +
                        "FROM DETALLECONTRATO D, HERRAMIENTA H " +
                        "WHERE D.IDHERRAMIENTA = H.IDHERRAMIENTA " +
                        "AND (D.IDESTADODETALLECONTRATO = 1 OR D.IDESTADODETALLECONTRATO = 2) " +
                        "AND IDCONTRATO = @contrato";


        SqlDataReader sdr = Datos.obtenerDataReader(sql, para);

        List<DetalleContrato> lista = new List<DetalleContrato>();

        while (sdr.Read())
        {
            DetalleContrato dc = new DetalleContrato();
            dc.NroDetalle = Convert.ToInt32(sdr[0]);
            dc.NroHerramienta = Convert.ToInt32(sdr[1]);
            dc.DescripHerramienta = Convert.ToString(sdr[2]);
            dc.Cantidad = Convert.ToSingle(sdr[3]);
            lista.Add(dc);

        }
        sdr.Close();
        return lista;
    }

    public List<DetalleContrato> traerDetallePedidoMedidorPARCIAL(int idContrato)
    {
        SqlParameter contrato = new SqlParameter("@contrato", idContrato);

        SqlParameter[] para = { contrato };

        String sql = " select dc.iddetallecontrato, tm.descripcion tipomedidor, dc.cantidadrestante "+
                     " from detalleContrato dc, tipomedidor tm "+
                     " where dc.idtipomedidor = tm.idtipomedidor "+
                     " AND (Dc.IDESTADODETALLECONTRATO = 1 OR Dc.IDESTADODETALLECONTRATO = 2) "+
                     " AND dc.IDCONTRATO = @contrato ";


        SqlDataReader sdr = Datos.obtenerDataReader(sql, para);

        List<DetalleContrato> lista = new List<DetalleContrato>();

        while (sdr.Read())
        {
            DetalleContrato dc = new DetalleContrato();
            dc.NroDetalle = Convert.ToInt32(sdr[0]);
            //dc.NroHerramienta = Convert.ToInt32(sdr[1]);
            dc.DescripHerramienta = Convert.ToString(sdr[1]);
            dc.Cantidad = Convert.ToSingle(sdr[2]);
            lista.Add(dc);

        }
        sdr.Close();
        return lista;
    }

    public int getEsdtadoContrato(int nroContrato)
    {
        SqlParameter para = new SqlParameter("@idContrato", nroContrato);
        string sql = "SELECT IDESTADOCONTRATO FROM CONTRATO WHERE IDCONTRATO = @idContrato";

        SqlDataReader dr = Datos.obtenerDataReader(sql, para);

        int idEstado = 0;
        
        while (dr.Read())
        {
            idEstado = Convert.ToInt32(dr[0]);

        }
        dr.Close();
        return idEstado;
    }






    
    public Contratos()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
