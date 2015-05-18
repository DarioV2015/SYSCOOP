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
/// Descripción breve de Herramientas
/// </summary>
public class Herramientas
{
    public int crearHistorialHerramienta(int idHerramienta, DateTime fechaInicio, DateTime fechaFin, String observacion, int idGrupo)
    {

        SqlParameter idHer = new SqlParameter("@idHer", idHerramienta);
        SqlParameter inicio = new SqlParameter("@inicio", fechaInicio);
        SqlParameter fin = new SqlParameter("@fin", fechaFin);
        SqlParameter observ = new SqlParameter("@observ", observacion);
        SqlParameter idGrupoGR = new SqlParameter("@idGrupoGR", idGrupo);



        SqlParameter[] para = { idHer, inicio, fin, observ, idGrupoGR };

        string sql = "INSERT INTO HISTORIALHERRAMIENTA (IDHERRAMIENTA, FECHAINICIO, FECHAFIN, OBSERVACION, NROGRUPOGR) "+ 
                     "VALUES (@idHer, @inicio, @fin, @observ, @idGrupoGR)";

        int filas = Datos.ejecutarComando(sql, para);
       
        return filas;
    }

    public Herramienta traerHerramienta(int nroHerramienta)
    {
        SqlParameter p = new SqlParameter("@a", nroHerramienta);

        string sql = "SELECT H.IDHERRAMIENTA, H.DESCRIPCION, H.NROLOTE, convert(char(10), H.FECHAVENCIMIENTO, 103), TH.DESCRIPCION FROM HERRAMIENTA H, TIPOHERRAMIENTA TH WHERE TH.IDTIPOHERRAMIENTA=H.IDTIPOHERRAMIENTA AND H.IDHERRAMIENTA = @a";


        SqlDataReader dr = Datos.obtenerDataReader(sql, p);

        Herramienta h = new Herramienta();

        while (dr.Read())
        {
            h.NroHerramienta=Convert.ToInt32(dr[0]);
            h.Descripcion=dr[1].ToString();
            h.NroLote = Convert.ToInt32(dr[2]);
            h.FechaVencimiento = Convert.ToDateTime(dr[3]);
            h.DescripcionTipo = dr[4].ToString();
            

        }

        dr.Close();
        return h;

    }

    public Herramienta traerHerramientaSinLote(int nroHerramienta)
    {
        SqlParameter p = new SqlParameter("@a", nroHerramienta);

        string sql = "SELECT H.IDHERRAMIENTA, H.DESCRIPCION, TH.DESCRIPCION FROM HERRAMIENTA H, TIPOHERRAMIENTA TH WHERE TH.IDTIPOHERRAMIENTA=H.IDTIPOHERRAMIENTA AND H.IDHERRAMIENTA = @a";


        SqlDataReader dr = Datos.obtenerDataReader(sql, p);

        Herramienta h = new Herramienta();

        while (dr.Read())
        {
            h.NroHerramienta = Convert.ToInt32(dr[0]);
            h.Descripcion = dr[1].ToString();
                     
            h.DescripcionTipo = dr[2].ToString();


        }

        dr.Close();
        return h;

    }

    public int actualizarEstadoHerramientaADisponible(int idHerramienta)
    {
        String sql = "UPDATE HERRAMIENTA SET ESTADOHERRAMIENTA = 1 WHERE IDHERRAMIENTA = " + idHerramienta;

        int filas = Datos.ejecutarComando(sql);
       
        return filas;
    }

    public int obtenerUltimoNroHerramienta()
    {
        string sql = "select max(IDHERRAMIENTA) from HERRAMIENTA";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }

    public int crearHerramienta(int herra, int tipo, String nombre, String especificacion)
    {
        if (especificacion == "")
        {
            SqlParameter id = new SqlParameter("@id", herra);
            SqlParameter ti = new SqlParameter("@ti", tipo);
            SqlParameter n = new SqlParameter("@n", nombre);


            SqlParameter[] para = { id, ti, n };

            string sql = "INSERT INTO HERRAMIENTA (IDHERRAMIENTA, DESCRIPCION, IDTIPOHERRAMIENTA, ESPECIFICACIONTECNICA) " +
                         "VALUES(@id,@n,@ti,'Ninguna')";

            int filas = Datos.ejecutarComando(sql, para);
            return filas;

        }
        else
        {
            SqlParameter id = new SqlParameter("@id", herra);
            SqlParameter ti = new SqlParameter("@ti", tipo);
            SqlParameter n = new SqlParameter("@n", nombre);
            SqlParameter esp = new SqlParameter("@esp", especificacion);


            SqlParameter[] para = { id, ti, n, esp };

            string sql = "INSERT INTO HERRAMIENTA (IDHERRAMIENTA, DESCRIPCION, IDTIPOHERRAMIENTA, ESPECIFICACIONTECNICA) " +
                         "VALUES(@id,@n,@ti,@esp)";

            int filas = Datos.ejecutarComando(sql, para);
            return filas;

        }
    }

    public int crearIngresoHerramienta(int herra, String descip, int tipo, DateTime fechaVenc, int ntoLote, String especificacion)
    {
       
        if (especificacion == "")
        {
            SqlParameter id = new SqlParameter("@id", herra);
            SqlParameter descripcion = new SqlParameter("@descripcion", descip);
            SqlParameter ti = new SqlParameter("@ti", tipo);
            SqlParameter fechaVen = new SqlParameter("@fechaVen", fechaVenc);
            SqlParameter lote = new SqlParameter("@lote", ntoLote);


            SqlParameter[] para = { id, descripcion, ti, fechaVen, lote };

            string sql = "INSERT INTO HERRAMIENTA (IDHERRAMIENTA, DESCRIPCION, FECHAINGRESO, FECHAVENCIMIENTO, NROLOTE, IDTIPOHERRAMIENTA, ESTADOHERRAMIENTA) " +
                         "VALUES (@id, @descripcion, getdate(), @fechaVen, @lote, @ti, 1)";

            int filas = Datos.ejecutarComando(sql, para);
            return filas;

        }
        else
        {
            SqlParameter id = new SqlParameter("@id", herra);
            SqlParameter descripcion = new SqlParameter("@descripcion", descip);
            SqlParameter ti = new SqlParameter("@ti", tipo);
            SqlParameter fechaVen = new SqlParameter("@fechaVen", fechaVenc);
            SqlParameter lote = new SqlParameter("@lote", ntoLote);
            SqlParameter esp = new SqlParameter("@esp", especificacion);


            SqlParameter[] para = { id, descripcion, ti, fechaVen, lote, esp };

            string sql = "INSERT INTO HERRAMIENTA (IDHERRAMIENTA, DESCRIPCION, FECHAINGRESO, FECHAVENCIMIENTO, NROLOTE, IDTIPOHERRAMIENTA, ESTADOHERRAMIENTA, ESPECIFICACIONTECNICA) " +
                         "VALUES (@id, @descripcion, getdate(), @fechaVen, @lote, @ti, 1, @esp)";

            int filas = Datos.ejecutarComando(sql, para);
            return filas;

        }   
    }
    
    public Herramienta traerHerramientaCompleta(int nroHerramienta)
    {
        SqlParameter p = new SqlParameter("@a", nroHerramienta);

        string sql = "SELECT IDHERRAMIENTA, DESCRIPCION, IDTIPOHERRAMIENTA, ESPECIFICACIONTECNICA "+
                     "FROM HERRAMIENTA WHERE IDHERRAMIENTA = @a";


        SqlDataReader dr = Datos.obtenerDataReader(sql, p);

        Herramienta h = new Herramienta();

        while (dr.Read())
        {
            h.NroHerramienta = Convert.ToInt32(dr[0]);
            h.Descripcion = dr[1].ToString();
            h.NroTipoHerramienta = Convert.ToInt32(dr[2]);
            h.EspecificacionTecnica= Convert.ToString(dr[3]);


        }

        dr.Close();
        return h;

    }

    public List<Herramienta> getHERRAMIENTA(int mes, int año ,int tipo, DateTime fechaInicio)
    {
        SqlParameter nroMes = new SqlParameter("@nroMes", mes);
        SqlParameter nroAño = new SqlParameter("@nroAño", año);
        SqlParameter idTipo = new SqlParameter("@idTipo", tipo);
        SqlParameter fecha = new SqlParameter("@fecha", fechaInicio);

        SqlParameter[] para = { nroMes, nroAño, idTipo, fecha };

        List<Herramienta> lista = new List<Herramienta>();

        String strSql = "SELECT DISTINCT H.IDHERRAMIENTA, H.DESCRIPCION FROM HERRAMIENTA H "+
                        "WHERE  H.IDTIPOHERRAMIENTA=@idTipo " +
                        "AND H.FECHAVENCIMIENTO >= @fecha " +
                        "AND H.IDHERRAMIENTA NOT IN(SELECT HH1.IDHERRAMIENTA "+
                        "FROM HISTORIALHERRAMIENTA HH1 "+
                        "WHERE MONTH(HH1.FECHAINICIO)=@nroMes " +
                        "AND YEAR(HH1.FECHAFIN)=@nroAño "+
                        "AND HH1.IDESTADOHERRAMIENTA=2)";

        SqlDataReader sdr = Datos.obtenerDataReader(strSql, para);

        while (sdr.Read())
        {
            Herramienta h = new Herramienta();
            h.NroHerramienta = Convert.ToInt32(sdr[0]);
            h.Descripcion=Convert.ToString(sdr[1]);

            lista.Add(h);
        }
        sdr.Close();
        return lista;

    }
    public int crearHistorialHerramientaCuadrilla(int idHerramienta, DateTime fechaInicio, DateTime fechaFin, String observacion, int idCuadrilla, int estado)
    {

        SqlParameter idHer = new SqlParameter("@idHer", idHerramienta);
        SqlParameter inicio = new SqlParameter("@inicio", fechaInicio);
        SqlParameter fin = new SqlParameter("@fin", fechaFin);
        SqlParameter observ = new SqlParameter("@observ", observacion);
        SqlParameter idCuarilla = new SqlParameter("@idCuarilla", idCuadrilla);
        SqlParameter idEstado = new SqlParameter("@idEstado", estado);



        SqlParameter[] para = { idHer, inicio, fin, observ, idCuarilla, idEstado };

        string sql = "INSERT INTO HISTORIALHERRAMIENTA (IDHERRAMIENTA, FECHAINICIO, FECHAFIN, OBSERVACION, NROCUADRILLA, IDESTADOHERRAMIENTA) " +
                     "VALUES (@idHer, @inicio, @fin, @observ, @idCuarilla, @idEstado)";

        int filas = Datos.ejecutarComando(sql, para);

        return filas;
    }

    public int actualizarEstadoHISTORIALHerramienta(int idHerramienta, DateTime fechaFin, DateTime fechaInicio, int estado)
    {
        String sql = "UPDATE HISTORIALHERRAMIENTA SET FECHAFIN = @p2, IDESTADOHERRAMIENTA= @p4 WHERE IDHERRAMIENTA= @p3 AND FECHAINICIO=@p1" ;
        List<SqlParameter> param = new List<SqlParameter>();
        param.Add(new SqlParameter("@p1", fechaInicio));
        param.Add(new SqlParameter("@p2", fechaFin));
        param.Add(new SqlParameter("@p3", idHerramienta));
        param.Add(new SqlParameter("@p4", estado));
       
        int filas = Datos.ejecutarComando(sql, param);

        

        return filas;
    }
    
    
    public Herramientas()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public List<Herramienta> traerHerramientas()
    {
        string sql = "select h.idherramienta, h.descripcion, th.descripcion as tipo" +
        " from herramienta h, tipoherramienta th" +
        " where h.idtipoherramienta = th.idtipoherramienta";

        SqlDataReader dr = Datos.obtenerDataReader(sql);

        Herramienta h;
        List<Herramienta> listaHerramientas = new List<Herramienta>();

        while (dr.Read())
        {
            h = new Herramienta();

            h.NroHerramienta = Convert.ToInt32(dr[0]);
            h.Descripcion = dr[1].ToString();
            h.DescripcionTipo = dr[2].ToString();

            listaHerramientas.Add(h);
        }

        dr.Close();
        return listaHerramientas;

    }
}
