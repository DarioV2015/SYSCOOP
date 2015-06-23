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
/// Descripción breve de PedidosInstalacion
/// </summary>
public class PedidosInstalacion
{

    public PedidosInstalacion()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public int obtenerUltimoNroPedido()
    {
        string sql = "select max(idPedido) from PedidoInstalacion";
        //int ultimoNro = Datos.obtenerMayor(sql, Conexion.ObtenerConexion());
        //SqlConnection con = Datos.crearConexion(ConfigurationManager.ConnectionStrings["HP-PC"].ConnectionString);
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }
    public bool crearPedidoInstalacion(PedidoInstalacion pi)
        {
            string sql = "insert into PedidoInstalacion(idPedido, idSocio, idMedidor, fechaPedido, idDomicilio, idEstado) values (@a,@b,@c,@d,@e,@f)";
            List<SqlParameter> param = new List<SqlParameter>();

            param.Add(new SqlParameter("@a", pi.NroPedido));
            param.Add(new SqlParameter("@b", pi.NroSocio));
            param.Add(new SqlParameter("@c", pi.NroMedidor));
            param.Add(new SqlParameter("@d", pi.FechaPedido));
            param.Add(new SqlParameter("@e", pi.IdDomicilio));
            param.Add(new SqlParameter("@f", pi.Estado));

            //int filas = Datos.actualizar(sql, Conexion.ObtenerConexion(), param);

            int filas = -1;
            string msg = " ";
            try
            {
                filas = Datos.ejecutarComando(sql, param);// Datos.actualizar(sql, cn, param, transa);
            }
            catch(SqlException s)
            {
                msg = s.Message.ToString();
            }

            if (filas == 1)
                return true;
            else
            {
                return false;
            }
        }

    public PedidoInstalacion getPedidoInstalacion(int nroPedido)
    {
        SqlParameter p = new SqlParameter("@nroPed", nroPedido);
        string sql = "SELECT IDSOCIO, IDMEDIDOR, IDDOMICILIO, IDESTADO " +
                        "FROM PEDIDOINSTALACION " +
                        "WHERE IDPEDIDO = @nroPed";

        
        SqlDataReader dr = Datos.obtenerDataReader(sql, p);//Datos.encontrar(sql, con, p);

        PedidoInstalacion pi = new PedidoInstalacion();

        while (dr.Read())
        {
            pi.NroSocio = Convert.ToInt32(dr[0]);
            pi.NroMedidor = Convert.ToInt32(dr[1]);
            pi.IdDomicilio = Convert.ToInt32(dr[2]);
            pi.Estado = Convert.ToInt32(dr[3]);

        }

        dr.Close();
        return pi;
    }

    public int actualizarEstadoPedido(int estado, int idPedido)
    {
        string sql = "UPDATE PEDIDOINSTALACION SET IDESTADO = " + estado + "  WHERE IDPEDIDO =" + idPedido;
        int v = Datos.ejecutarComando(sql);
        return v;
    }

    public Domicilio traerDomicilioPedido(int nroPedido)
    {
        string sql = "select c.nombre, d.nrocalle, d.piso, d.dpto, z.descripcion" +
        " from calle c, domicilio d, zona z, pedidoinstalacion pi" +
        " where d.idcalle = c.idcalle" +
        " and d.idzona = z.idzona" +
        " and pi.iddomicilio = d.iddomicilio" +
        " and pi.idpedido = " + nroPedido;

        SqlDataReader dr = Datos.obtenerDataReader(sql);

        Domicilio d = new Domicilio();

        while (dr.Read())
        {
            d.NombreCalle = dr[0].ToString();
            d.NroCalle = Convert.ToInt32(dr[1]);
            if(dr[2].ToString() != "")
                d.Piso = Convert.ToSingle(dr[2]);
            else
                d.Piso = Convert.ToSingle(0);
            if (dr[3].ToString() != "")
                d.Dpto = dr[3].ToString();
            else
                d.Dpto = "0";
            d.Zona = dr[4].ToString();
        }

        dr.Close();
        return d;
    }
    public Medidor traerDatosMedidor(int nroPedido)
    {
        string sql = "SELECT M.IDMEDIDOR, M.NROFABRICACION, TM.DESCRIPCION" +
        " FROM PEDIDOINSTALACION P, MEDIDOR M, TIPOMEDIDOR TM" +
        " WHERE P.IDMEDIDOR = M.IDMEDIDOR" +
        " AND M.IDTIPOMEDIDOR = TM.IDTIPOMEDIDOR" +
        " AND P.IDPEDIDO = " + nroPedido;

        SqlDataReader dr = Datos.obtenerDataReader(sql);

        Medidor m = new Medidor();

        while (dr.Read())
        {
            m.NroMedidor = dr[0].ToString();
            m.NroFabricacion = dr[1].ToString();
            m.TipoMedidor = dr[2].ToString();
        }

        dr.Close();
        return m;
    }
    public int traerGruposDisponibles(DateTime fecha, int idTurno)
    {
        string sql = "select distinct ggr.idgrupo" +
        " from grupoguardiareclamo ggr, grupoporturno gpt, empleadoporgrupogr epg, empleado e, turno t," +
        " historialgrupo hg" +
        " where ggr.idgrupo = gpt.idgrupogr" +
        " and epg.idempleado = e.idempleado" +
        " and gpt.idturno = t.idturno" +
        " and hg.idgrupogr = ggr.idgrupo" +
        " and @fecha between hg.fechainicio and hg.fechafin" +
        " and hg.idturno = " + idTurno +
        " and ggr.idestadoguardiareclamo = 1";

        SqlParameter pFecha = new SqlParameter("@fecha", fecha);

        SqlDataReader dr = Datos.obtenerDataReader(sql,pFecha);

        int nroGrupo = 0;

        while (dr.Read())
        {
            nroGrupo = Convert.ToInt32(dr[0]);
        }

        dr.Close();
        return nroGrupo;
    }
    public List<Empleado> traerEmpleadosGrupo(int nroGrupo)
    {
        string sql = "select p.apellido, p.nombre" +
        " from grupoguardiareclamo ggr, empleadoporgrupogr epg, empleado e, persona p" +
        " where ggr.idgrupo = epg.idgrupoguadiareclamo" +
        " and e.idempleado = epg.idempleado" +
        " and e.nrodocumento = p.nrodocumento" +
        " and e.idtipodocumento = p.tipodocumento" +
        " and ggr.idgrupo = " + nroGrupo;

        SqlDataReader dr = Datos.obtenerDataReader(sql);
        Empleado em;
        List<Empleado> listaEmpleados = new List<Empleado>();

        while (dr.Read())
        {
            em = new Empleado();

            em.ApellidoEmpleado = dr[0].ToString();
            em.NombreEmpleado = dr[1].ToString();

            listaEmpleados.Add(em);
        }

        dr.Close();
        return listaEmpleados;
    }
    public TipoResultadoIM traerTipoResultadoIM(int nroTipo)
    {
        SqlParameter p = new SqlParameter("@a", nroTipo);

        string sql = "select nombre, descripcion" +
        " from tiporesultadoim" +
        " where idtiporesultado = @a";


        SqlDataReader dr = Datos.obtenerDataReader(sql, p);

        TipoResultadoIM t = new TipoResultadoIM();

        while (dr.Read())
        {
            t.Nombre = dr[0].ToString();
            t.Descripcion = dr[1].ToString();
        }

        dr.Close();
        return t;
    }
}
