using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;
using System.Data.Odbc;
using System.Data.SqlClient;

    /// <summary>
    /// Descripción breve de Medidores
    /// </summary>
    public class Medidores
    {

        public Medidores()
        {
            // TODO: Agregar aquí la lógica del constructor
            //
        }

        public List<Medidor> getMedidoresDeDetalle(String nrolote)
        {
            List<Medidor> medidores = new List<Medidor>();
            //SqlConnection con = Conexion.ObtenerConexion();
            String strSql = "SELECT t.descripcion, " +
            " m.fechaalta, " +
            " m.nrolote, " +
            " m.idmedidor, " +
            " m.nrofabricacion " +
            " FROM tipomedidor t, medidor m " +
            " where m.idtipomedidor = t.idtipomedidor "+
            " and m.nrolote = "+nrolote;
            SqlDataReader sdr = Datos.obtenerDataReader(strSql);//Conexion.obtenerDataReader(strSql, con);

            while (sdr.Read())
            {
                Medidor m = new Medidor();
                m.TipoMedidor = sdr["descripcion"].ToString();
                m.FechaAlta = Convert.ToDateTime(sdr["fechaalta"]);
                m.NroLote = sdr["nrolote"].ToString();
                m.NroMedidor = sdr["idmedidor"].ToString();
                m.NroFabricacion = sdr["nrofabricacion"].ToString();
                medidores.Add(m);
            }
            sdr.Close();
            return medidores;

        }

        public void insertarMedidor(float tipoMedidor, DateTime fecha, float lote, float id, String nroFab)
        {
            //SqlConnection con = Conexion.ObtenerConexion();
            SqlParameter tipo = new SqlParameter("@tipo", tipoMedidor);
            SqlParameter fechaalta = new SqlParameter("@fechaalta", fecha);
            SqlParameter nrolote = new SqlParameter("@nrolote", lote);
            SqlParameter idmedidor = new SqlParameter("@idmedidor", id);
            SqlParameter nrofabricacion = new SqlParameter("@nrofabricacion", nroFab);
            SqlParameter estado = new SqlParameter("@estado", 1);

            SqlParameter[] para = { tipo, fechaalta, nrolote, idmedidor, nrofabricacion, estado };

            
            string sql = "INSERT INTO MEDIDOR (IDTIPOMEDIDOR, FECHAALTA, NROLOTE, " +
            " IDMEDIDOR, NROFABRICACION,IDESTADOMEDIDOR) VALUES (@tipo, @fechaalta, @nrolote, @idmedidor, @nrofabricacion,@estado)";
            Datos.ejecutarComando(sql,para);

        }

        public int obtenerUltimoNroMedidor()
        {
            string sql = "select max(idmedidor) from Medidor";
            int ultimoNro = Datos.obtenerMayor(sql);
            return ultimoNro;
        }
        //Romina
        public int actualizarEstadoMedidor(int estado, int idMedidor)
        {
            string sql = "UPDATE MEDIDOR SET IDESTADOMEDIDOR = " + estado + " WHERE IDMEDIDOR =" + idMedidor;
            int v = Datos.ejecutarComando(sql);
            return v;
        }
        public int actualizarCategoriaMedidor(int cate, int idMedidor)
        {
            string sql = "UPDATE MEDIDOR SET IDCATEGORIA = " + cate + " WHERE IDMEDIDOR =" + idMedidor;
            int v = Datos.ejecutarComando(sql);
            return v;
        }
        public int actualizarDomicilioMedidor(int dom, int idMedidor)
        {
            string sql = "UPDATE MEDIDOR SET IDDOMICILIO = " + dom + " WHERE IDMEDIDOR =" + idMedidor;
            int v = Datos.ejecutarComando(sql);
            return v;
        }
        public int actualizarSocioMedidor(int idsocio, int idMedidor)
        {
            string sql = "UPDATE MEDIDOR SET idsocio = " + idsocio + " WHERE IDMEDIDOR =" + idMedidor;
            int v = Datos.ejecutarComando(sql);
            return v;
        }


        public Medidor traerMedidor(int tipoMedidor)
        {
            SqlParameter p = new SqlParameter("@a", tipoMedidor);
            //busco de los medidores disponibles el de la fecha más vieja
            string sql = "select top 1 m.idmedidor, m.nrofabricacion, m.fechaalta" + 
            " from medidor m where m.idtipomedidor = @a" +
            " and m.idestadomedidor = 1" +
            " order by m.fechaalta asc";

            //SqlConnection con = Conexion.ObtenerConexion();

            SqlDataReader dr = Datos.obtenerDataReader(sql, p); //Datos.encontrar(sql, con, p);

            Medidor m = new Medidor();

            while (dr.Read())
            {
                m.NroMedidor = dr[0].ToString();
                m.NroFabricacion = dr[1].ToString();
                m.FechaAlta = Convert.ToDateTime(dr[2]);
            }

            dr.Close();
            return m;

        }
        public Medidor traerMedidorOIM(int nroOIM)
        {
            SqlParameter p = new SqlParameter("@a", nroOIM);
            
            string sql = "select m.idmedidor, m.nrofabricacion, m.nrolote," +
            " convert(char(10), m.fechaalta, 103), tm.descripcion" +
            " from ordeninstalacion oi, pedidoinstalacion pin," +
            " medidor m, tipomedidor tm" +
            " where oi.idpedidoinstalacion = pin.idpedido" +
            " and pin.idmedidor = m.idmedidor" +
            " and m.idtipomedidor = tm.idtipomedidor" +
            " and oi.idordeninstalacion = @a";

            //SqlConnection con = Conexion.ObtenerConexion();

            SqlDataReader dr = Datos.obtenerDataReader(sql, p); //Datos.encontrar(sql, con, p);

            Medidor m = new Medidor();

            while (dr.Read())
            {
                m.NroMedidor = dr[0].ToString();
                m.NroFabricacion = dr[1].ToString();
                m.NroLote = dr[2].ToString();
                m.FechaAlta = Convert.ToDateTime(dr[3]);
                m.TipoMedidor = dr[4].ToString();
            }

            dr.Close();
            return m;

        }
        public bool actualizarStockMedidores(int nroMedidor)
        {
            SqlParameter p = new SqlParameter("@a", nroMedidor);
            string sql = "update Medidor set idestadomedidor = 2 where idmedidor = @a";
            //actualizo el estado del medidor seleccionado a Asigando(2)


            int filas = 0;

            try
            {
                filas = Datos.ejecutarComando(sql, p);//Datos.actualizar2(sql, cn, p, transa);
            }
            catch //(OleDbException ole)
            {
                // msg = ole.Message.ToString();
            }

            if (filas == 1)
                return true;
            else
            {
                return false;
            }
        }

        public void insertarMedidor(Medidor m)
        {
            this.insertarMedidor(Convert.ToSingle(m.TipoMedidor), m.FechaAlta, Convert.ToSingle(m.NroLote), Convert.ToSingle(m.NroMedidor), m.NroFabricacion);
        }

        public Consumo obtenerConsumo(int idMedidor)
        {
            SqlParameter para = new SqlParameter("@idMedidor", idMedidor);
            string sql = "select top 2 idconsumo, fechamedicion, lecturaconsumo, medidor from consumo where medidor= @idMedidor  order by 2 desc  ";

            SqlDataReader dr = Datos.obtenerDataReader(sql, para);//Datos.encontrar(sql, con, p);

            Consumo consumoC = new Consumo();

            while (dr.Read())
            {
                consumoC.NroConsumo = Convert.ToInt32(dr[0]);
                consumoC.FechaMedicion = Convert.ToDateTime(dr[1]);
                consumoC.LecturaConsumo = Convert.ToSingle (dr[2]);
                consumoC.NroMedidor = Convert.ToInt32 (dr[3]);

            }

            dr.Close();
            return consumoC;
        
        
        
        }

        public Boolean tieneMedidor(int nroSocio)
        {
            SqlParameter para = new SqlParameter("@n", nroSocio);
            string sql = "SELECT IDMEDIDOR FROM MEDIDOR WHERE IDSOCIO = @n";

            SqlDataReader dr = Datos.obtenerDataReader(sql, para);//Datos.encontrar(sql, con, p);

            Boolean vari;

            if (dr.Read())

            { vari = true; }
            else
            { vari = false; }
            
            dr.Close();
            return vari;

            
        }
        
        public Boolean tieneMedidorActivos(int nroSocio)
        {
            SqlParameter para = new SqlParameter("@n", nroSocio);
            string sql = "SELECT IDMEDIDOR FROM MEDIDOR WHERE IDESTADOMEDIDOR = 3 AND IDSOCIO = @n";

            SqlDataReader dr = Datos.obtenerDataReader(sql, para);//Datos.encontrar(sql, con, p);

            Boolean vari;

            if (dr.Read())

            { vari = true; }
            else
            { vari = false; }

            dr.Close();
            return vari;


        }

        public List<Medidor> buscarMedidoresLinea(int idlinea)
        {
            String sql = " select * from medidor m, prioridad p where m.idprioridad = p.idprioridad and idlinea = " + idlinea;

            SqlDataReader sdr = Datos.obtenerDataReader(sql);
            List<Medidor> medidores = new List<Medidor>();
            while (sdr.Read())
            {
                Medidor m = new Medidor();
                m.NroMedidor = sdr["idmedidor"].ToString();
                if (sdr["descripcion"].GetType() != Type.GetType("System.DBNull"))
                    m.Prioridad = sdr["descripcion"].ToString();
                m.FechaAlta = Convert.ToDateTime(sdr["fechaalta"].ToString());
                m.NroLote = sdr["nrolote"].ToString();
                m.TipoMedidor = sdr["idtipomedidor"].ToString();
                m.Domicilio = Datos.getDomicilios().getDomicilio(Convert.ToInt32(sdr["iddomicilio"].ToString()));
                m.Idlinea = Convert.ToInt32(sdr["idlinea"].ToString());
                
                m.Idsocio = Convert.ToInt32(sdr["idsocio"].ToString());
                medidores.Add(m);
            }
            sdr.Close();
            return medidores;
        }
        public List<Medidor> traerMedidoresDisponibles()
        {
            string sql = "select m.idmedidor, m.nrofabricacion, m.nrolote, m.fechaalta" +
            " from medidor m, estadomedidor em" +
            " where m.idestadomedidor = em.idestadomedidor" +
            " and m.idestadomedidor = 1" +
            " order by m.fechaalta asc";

            SqlDataReader dr = Datos.obtenerDataReader(sql);
            Medidor m;
            List<Medidor> listaMedidores = new List<Medidor>();

            while (dr.Read())
            {
                m = new Medidor();

                m.NroMedidor = dr[0].ToString();
                m.NroFabricacion = dr[1].ToString();
                m.NroLote = dr[2].ToString();
                m.FechaAlta = Convert.ToDateTime(dr[3]);

                listaMedidores.Add(m);
            }

            dr.Close();
            return listaMedidores;
        }
        public int actualizarMedidores(int nroMedidor, int idDomicilio, int nroSocio, int estado, int idZona)
        {
            SqlParameter p = new SqlParameter("@a", nroMedidor);
            string sql = "update medidor" +
            " set iddomicilio = " + idDomicilio + "," +
            " idsocio = " + nroSocio + "," +
            " idestadomedidor = " + estado + "," +
            " idzona = " + idZona + "," +
            " idlinea = 1, " + 
            " idprioridad = 1 " +
            " where idmedidor = @a";

            int filas = 0;

            try
            {
                filas = Datos.ejecutarComando(sql, p);
            }
            catch (OleDbException ole)
            {
                string msg = ole.Message.ToString();
            }

            return filas;
        }
    }