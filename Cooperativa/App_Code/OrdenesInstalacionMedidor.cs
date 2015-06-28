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

/// <summary>
/// Descripción breve de OrdenesInstalacionMedidor
/// </summary>
public class OrdenesInstalacionMedidor
{
    public int obtenerUltimoNroOrden()
    {
        string sql = "select max(idordeninstalacion) from OrdenInstalacion";
        //int ultimoNro = Datos.obtenerMayor(sql, Conexion.ObtenerConexion());
        //SqlConnection con = Datos.crearConexion(ConfigurationManager.ConnectionStrings["HP-PC"].ConnectionString);
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }

    public bool crearOrdenInstalacion(OrdenInstalacionMedidor oi)
    {
              
        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", oi.NroOrden));
        param.Add(new SqlParameter("@b", oi.NroPedido));
        param.Add(new SqlParameter("@c", oi.FechaInst));
        param.Add(new SqlParameter("@d", oi.IdGrupo));
        param.Add(new SqlParameter("@e", oi.IdEstado));

        string sql = "INSERT INTO ORDENINSTALACION " +
           "(IDORDENINSTALACION, IDPEDIDOINSTALACION, FECHAINSTALACION, IDGRUPOGR, IDESTADOORDEN) " +
           "VALUES (@a, @b, @c, @d, @e)";

        int filas = -1;
        string msg = " ";
        try
        {
            filas = Datos.ejecutarComando(sql, param);
        }
        catch (SqlException s)
        {
            msg = s.Message.ToString();
        }

        if (filas == 1)
        {   Datos.commit(); 
            return true;
        }
        else
        {
            return false;
        }
    }

    public int actualizarOrden(int estado, int resultado, int idOrden)
    {
        string sql = "UPDATE ORDENINSTALACION SET IDESTADOORDEN = " + estado + "," + 
        " IDRESULTADOINST = " + resultado +
        " WHERE IDORDENINSTALACION = " + idOrden;
        int v = Datos.ejecutarComando(sql);
        return v;
    }
    public int traerGrupoDelEmpleado(int idUsuario)
    {
        string sql = "select epg.idgrupoguadiareclamo" + 
        " from empleado e, usuario u, empleadoporgrupogr epg" +
        " where e.idempleado = epg.idempleado" +
        " and e.idusuario = u.idusuario " +
        " and e.idusuario = " + idUsuario;

        SqlDataReader dr = Datos.obtenerDataReader(sql);
        int nroGrupo = 0;

        while (dr.Read())
        {
            if (dr[0].GetType() == Type.GetType("System.DBNull"))
                nroGrupo = 0;
            else
                nroGrupo = Convert.ToInt32(dr[0]);
        }

        dr.Close();
        return nroGrupo;
    }

    public List<OrdenInstalacionMedidor> buscarOrdenesInstalacion(int grupoGR)
    {
        String sqlOrdenes = "select oi.idordeninstalacion, convert(char(10)," +
        " oi.fechainstalacion, 103)AS fechainstalacion, " +
        " oi.idgrupogr, z.descripcion" +
        " from ordeninstalacion oi, pedidoinstalacion ped, zona z, domicilio d" +
        " where oi.idpedidoinstalacion=ped.idpedido" +
        " and  ped.iddomicilio=d.iddomicilio" +
        " and d.idzona =z.idzona" +
        " and oi.idestadoorden=1" +
        " and oi.idgrupogr = " + grupoGR;

        SqlDataReader sdr = Datos.obtenerDataReader(sqlOrdenes);
        List<OrdenInstalacionMedidor> ordenes = new List<OrdenInstalacionMedidor>();

        while (sdr.Read())
        {
            OrdenInstalacionMedidor o = new OrdenInstalacionMedidor();
            
            o.NroOrden = Convert.ToInt32(sdr[0]);
            o.FechaInst = Convert.ToDateTime(sdr[1]);
            o.IdGrupo = Convert.ToInt32(sdr[2]);
            o.Zona = sdr[3].ToString();

            ordenes.Add(o);

        }
        sdr.Close();
        return ordenes;

    }
    public List<OrdenInstalacionMedidor> buscarOrdenesInstalacion()
    {
        String sqlOrdenes = "select oi.idordeninstalacion, convert(char(10)," +
        " oi.fechainstalacion, 103)AS fechainstalacion, " +
        " oi.idgrupogr, z.descripcion" +
        " from ordeninstalacion oi, pedidoinstalacion ped, zona z, domicilio d" +
        " where oi.idpedidoinstalacion=ped.idpedido" +
        " and  ped.iddomicilio=d.iddomicilio" +
        " and d.idzona =z.idzona" +
        " and oi.idestadoorden=1";

        SqlDataReader sdr = Datos.obtenerDataReader(sqlOrdenes);
        List<OrdenInstalacionMedidor> ordenes = new List<OrdenInstalacionMedidor>();

        while (sdr.Read())
        {
            OrdenInstalacionMedidor o = new OrdenInstalacionMedidor();

            o.NroOrden = Convert.ToInt32(sdr[0]);
            o.FechaInst = Convert.ToDateTime(sdr[1]);
            o.IdGrupo = Convert.ToInt32(sdr[2]);
            o.Zona = sdr[3].ToString();

            ordenes.Add(o);

        }
        sdr.Close();
        return ordenes;

    }
    public List<PedidoInstalacion> buscarPedidosPendientes()
    {
        String sqlOrdenes = "SELECT PI.IDPEDIDO, PI.IDSOCIO, P.APELLIDO, P.NOMBRE" +
        " FROM PEDIDOINSTALACION PI, SOCIO S, PERSONA P" +
        " WHERE PI.IDSOCIO = S.IDSOCIO" +
        " AND S.IDTIPODOCUMENTO = P.TIPODOCUMENTO" +
        " AND S.NRODOCUMENTO = P.NRODOCUMENTO" +
        " AND PI.IDESTADO = 2";

        SqlDataReader sdr = Datos.obtenerDataReader(sqlOrdenes);
        List<PedidoInstalacion> pedidos = new List<PedidoInstalacion>();

        while (sdr.Read())
        {
            PedidoInstalacion p = new PedidoInstalacion();

            p.NroPedido = Convert.ToInt32(sdr[0]);
            p.NroSocio = Convert.ToInt32(sdr[1]);
            p.ApellidoSocio = Convert.ToString(sdr[2]);
            p.NombreSocio = Convert.ToString(sdr[3]);

            pedidos.Add(p);

        }
        sdr.Close();
        return pedidos;
    }

    public OrdenesInstalacionMedidor()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
