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
/// Descripción breve de OTP
/// </summary>
public class OTP
{
	public OTP()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public List<OrdenTrabajoPreventivo> buscarOTPPendientes()
    {
        String sql = " select  tp.fechacreacion, convert(char(10), tp.fechainicio, 103) fechainicio, convert(char(10), tp.fechafin, 103) fechafin, tg.nombre,tp.tiempoestimado, 'tp.fechaideal', "+
                     " p.descripcion prioridad, tp.asunto, z.descripcion zona, tp.duracion, tp.idtareaplanificada " +
                     " from tareaplanificada tp, prioridad p, zona z, tareageneral tg" +
                     " where tp.idprioridad = p.idprioridad " +
                     " and tp.idzona = z.idzona " +
                     " and tp.idtareageneral = tg.idtareageneral "+
                     " and tp.idestado = 1 and fechainicio > getdate()";

        SqlDataReader sdr = Datos.obtenerDataReader(sql);
        List<OrdenTrabajoPreventivo> list = new List<OrdenTrabajoPreventivo>();

        while (sdr.Read())
        {
            OrdenTrabajoPreventivo otp = new OrdenTrabajoPreventivo();

            if (sdr["fechacreacion"].GetType() != Type.GetType("System.DBNull"))
                otp.FechaCreacion = Convert.ToDateTime(sdr["fechacreacion"].ToString());
            if (sdr["fechainicio"].GetType() != Type.GetType("System.DBNull"))
                otp.FechaInicio = Convert.ToDateTime(sdr["fechainicio"].ToString());
            if (sdr["fechafin"].GetType() != Type.GetType("System.DBNull"))
                otp.FechaFin = Convert.ToDateTime(sdr["fechafin"].ToString());

                otp.Nombre = sdr["nombre"].ToString();
                otp.TiempoEstimado = sdr["tiempoestimado"].ToString();
                otp.Prioridad = sdr["prioridad"].ToString();
                otp.Asunto = sdr["asunto"].ToString();
                otp.Zona = sdr["zona"].ToString();
                otp.Duracion = sdr["duracion"].ToString();
                otp.IdTareaPlanificada = Convert.ToInt32(sdr["idtareaplanificada"].ToString());
                list.Add(otp);
            
        }
        sdr.Close();

        return list;
    }

    public int insertarOrdenTrabajoPreventivo(String idorden)
    {
        OrdenTrabajoPreventivo otp = new OrdenTrabajoPreventivo();
        return this.insertarOrdenTrabajoPreventivo(otp);
    }

    public int insertarOrdenTrabajoPreventivo(OrdenTrabajoPreventivo otp)
    {
        String sql = "insert into OrdenTrabajoPreventivo (idordentrabajop, idtareaplanificada, idcuadrilla, "+
            " idestado, idtipootp, fechainicio, horainicio, duracion, fechafin, horafin, descripcion) " +
            " values (@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11)";
        
        List<SqlParameter> param = new List<SqlParameter>();
        param.Add(new SqlParameter("@1", otp.IdOTP));
        param.Add(new SqlParameter("@2", otp.IdTareaPlanificada));
        param.Add(new SqlParameter("@3", otp.IdCuadrilla));
        param.Add(new SqlParameter("@4", otp.IdEstado));
        param.Add(new SqlParameter("@5", otp.Idtipo));
        param.Add(new SqlParameter("@6", otp.FechaInicio));
        param.Add(new SqlParameter("@7", otp.FechaInicio));
        param.Add(new SqlParameter("@8", otp.Duracion));
        param.Add(new SqlParameter("@9", otp.FechaFin));
        param.Add(new SqlParameter("@10", otp.FechaFin));
        param.Add(new SqlParameter("@11", otp.Asunto));

        return Datos.ejecutarComando(sql,param);
    }
    public List<HistorialCuadrilla> traerCuadrillasDisponibles(DateTime fechaInicio, DateTime fechaFin)
    {
        string sql = "select hc.idcuadrilla, convert(char(10), hc.fechainicio, 103), " +
        " convert(char(10), hc.fechafin, 103), hc.idestadocuadrilla " +
        " from cuadrilla c with(NOLOCK), historialcuadrilla hc with(NOLOCK) " +
        " where hc.idcuadrilla = c.idcuadrilla" +
        " and hc.fechainicio <= @p1 and hc.fechafin >= @p2 " + 
        " and hc.idestadocuadrilla = 1 " +
        " and datediff(day, hc.fechainicio, hc.fechafin) >= datediff(day, @p1, @p2) ";

        List<SqlParameter> param = new List<SqlParameter>();
        param.Add(new SqlParameter("@p1", fechaInicio));
        param.Add(new SqlParameter("@p2", fechaFin));

        SqlDataReader dr = Datos.obtenerDataReader(sql,param);
        HistorialCuadrilla hc;
        List<HistorialCuadrilla> listaCuadrillas = new List<HistorialCuadrilla>();

        while (dr.Read())
        {
            hc = new HistorialCuadrilla();

            hc.NroCuadrilla = Convert.ToInt32(dr[0]);
            hc.FechaInicio = Convert.ToDateTime(dr[1]);
            hc.FechaFin = Convert.ToDateTime(dr[2]);
            hc.IdEstado = Convert.ToInt32(dr[3]);

            listaCuadrillas.Add(hc); 
        }

        dr.Close();
        return listaCuadrillas;
    }
    public int crearHistorialCuadrilla(HistorialCuadrilla hc)
    {
        string sql = "insert into HistorialCuadrilla(fechaInicio, idCuadrilla, fechaFin, idEstadoCuadrilla) values (@a,@b,@c,@d)";
        List<SqlParameter> param;

        int filas = -1;
        string msg = " ";

        try
        {
            param = new List<SqlParameter>();

            param.Add(new SqlParameter("@a", hc.FechaInicio));
            param.Add(new SqlParameter("@b", hc.NroCuadrilla));
            param.Add(new SqlParameter("@c", hc.FechaFin));
            param.Add(new SqlParameter("@d", hc.IdEstado));

            filas = Datos.ejecutarComando(sql, param);
            
        }
        catch (SqlException s)
        {
            msg = s.Message.ToString();
        }

        return filas;
    }
    public int setearHistorialCuadrilla(HistorialCuadrilla hcAntes, HistorialCuadrilla hcDespues)
    {
        string sql = "update historialcuadrilla" +
        " set fechainicio = @a, " +
        " fechafin = @b " +
        " where fechainicio = @c " +
        " and fechafin = @d " +
        " and idestadocuadrilla = " + hcAntes.IdEstado +
        " and idcuadrilla = " + hcAntes.NroCuadrilla;

        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", hcDespues.FechaInicio));
        param.Add(new SqlParameter("@b", hcDespues.FechaFin));
        param.Add(new SqlParameter("@c", hcAntes.FechaInicio));
        param.Add(new SqlParameter("@d", hcAntes.FechaFin));

        int filas = 0;

        try
        {
            filas = Datos.ejecutarComando(sql,param);
        }
        catch (SqlException ole)
        {
            string msg = ole.Message.ToString();
        }

        return filas;
    }
    public int setearEstadoHistorialCuadrilla(HistorialCuadrilla hc)
    {
        string sql = "update historialcuadrilla" +
        " set idestadocuadrilla = 2" +
        " where fechainicio = @a " +
        " and fechafin = @b " +
        " and idestadocuadrilla = " + hc.IdEstado +
        " and idcuadrilla = " + hc.NroCuadrilla;


        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", hc.FechaInicio));
        param.Add(new SqlParameter("@b", hc.FechaFin));

        int filas = 0;

        try
        {
            filas = Datos.ejecutarComando(sql,param);
        }
        catch (SqlException ole)
        {
            string msg = ole.Message.ToString();
        }

        return filas;
    }

    public int obtenerUltimoNroOTP()
    {
        string sql = "select max(idordentrabajop) from ordentrabajopreventivo";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }

    public List<OrdenTrabajoPreventivo> buscarOrdenPendientePorUsuario(int idcuadrilla)
    {
        String sql = " select otp.idordentrabajop, otp.fechainicio, otp.fechafin, otp.idtipootp, t.descripcion , otp.idtareaplanificada" +
                     " from ordentrabajopreventivo otp, tipootp t " +
                     " where idestado = 1 " +
                     " and t.idtipootp = otp.idtipootp "+
                     " and idcuadrilla = " + idcuadrilla;

        SqlDataReader sdr = Datos.obtenerDataReader(sql);
        List<OrdenTrabajoPreventivo> list = new List<OrdenTrabajoPreventivo>();

        while (sdr.Read())
        {
            OrdenTrabajoPreventivo otp = new OrdenTrabajoPreventivo();
            otp.IdOTP = Convert.ToInt32(sdr["idordentrabajop"].ToString());
            if (sdr["fechainicio"].GetType() != Type.GetType("System.DBNull"))
                otp.FechaInicio = Convert.ToDateTime(sdr["fechainicio"].ToString());
            if (sdr["fechafin"].GetType() != Type.GetType("System.DBNull"))
                otp.FechaFin = Convert.ToDateTime(sdr["fechafin"].ToString());
            otp.DescripcionTipo = sdr["descripcion"].ToString();
            otp.IdTareaPlanificada = Convert.ToInt32(sdr["idtareaplanificada"].ToString());
            list.Add(otp);

        }
        sdr.Close();

        return list;
    }

    public int finalizarOTP(OrdenTrabajoPreventivo otp)
    {
        string sql = " update ordentrabajopreventivo set idestado = 2, descripcion = '"+otp.Asunto + "' , "+
                     " fechafin = getDate() where idordentrabajop = " + otp.IdOTP;
        int actualizar = Datos.ejecutarComando(sql);
        if (actualizar > 0)
        {
            sql = " update historialcuadrilla" +
      " set idestadocuadrilla = 1 " +
      " where idcuadrilla = " + otp.IdCuadrilla;
           actualizar = Datos.ejecutarComando(sql);

           if (actualizar > 0)
           {
               sql = " update tareaplanificada" +
                 " set idestado = 2 " +
                 " where idtareaplanificada = " + otp.IdTareaPlanificada;
               actualizar = Datos.ejecutarComando(sql);

           }
        }
        return actualizar;
    }
}
