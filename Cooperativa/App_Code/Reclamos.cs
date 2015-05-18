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
/// Descripción breve de Reclamos
/// </summary>
public class Reclamos
{
	public Reclamos()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public int obtenerUltimoNroReclamo()
    {
        string sql = "select max(idreclamo) from reclamo";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }

    public int insertarReclamoSocio(int idReclamo, DateTime fecha, DateTime hora, String descrip, int idSocio, int tipo, int domicilio, int prioridad)
    {
        //SqlConnection con = Conexion.ObtenerConexion();
        SqlParameter idreclamo = new SqlParameter("@idreclamo", idReclamo);
        SqlParameter fechaReclamo = new SqlParameter("@fechaReclamo", fecha);
        SqlParameter descripcion = new SqlParameter("@descripcion", descrip);
        SqlParameter idsocio = new SqlParameter("@idsocio", idSocio);
        
        SqlParameter tipoReclamo = new SqlParameter("@tipoReclamo", tipo);
        SqlParameter idDomi = new SqlParameter("@idDomi", domicilio);
        SqlParameter priori = new SqlParameter("@priori", prioridad);

        SqlParameter[] para = { idreclamo, fechaReclamo, descripcion, idsocio, tipoReclamo, idDomi, priori };


        string sql = "INSERT INTO RECLAMO (IDRECLAMO, FECHA, DESCRIPCION, IDSOCIO, IDESTADORECLAMO, IDTIPORECLAMO, IDDOMICILIO, PRIORIDAD) " +
                     "VALUES (@idreclamo, @fechaReclamo, @descripcion, @idsocio, 1, @tipoReclamo, @idDomi, @priori)";

        int filas = Datos.ejecutarComando(sql, para);
        return filas;
        
        

    }

    public int insertarReclamoNoSocio(int idReclamo, DateTime fecha, String descrip, int tipo, int domicilio, int nroDocumento, int prioridad, int tipoDocumento)
    {
        //SqlConnection con = Conexion.ObtenerConexion();
        SqlParameter idreclamo = new SqlParameter("@idreclamo", idReclamo);
        SqlParameter fechaReclamo = new SqlParameter("@fechaReclamo", fecha);
        SqlParameter descripcion = new SqlParameter("@descripcion", descrip);
        SqlParameter estado = new SqlParameter("@estado", 1);
        SqlParameter tipoReclamo = new SqlParameter("@tipoReclamo", tipo);
        SqlParameter idDomi = new SqlParameter("@idDomi", domicilio);
        SqlParameter nroDoc = new SqlParameter("@nroDoc", nroDocumento);
        SqlParameter priori = new SqlParameter("@priori", prioridad);
        SqlParameter tipoDoc = new SqlParameter("@tipoDoc", tipoDocumento);

        SqlParameter[] para = { idreclamo, fechaReclamo, descripcion, estado, tipoReclamo, idDomi, nroDoc, priori, tipoDoc };


        string sql = "INSERT INTO RECLAMO (IDRECLAMO, FECHA, DESCRIPCION, IDESTADORECLAMO, IDTIPORECLAMO, IDDOMICILIO, NRODOCUMENTO, PRIORIDAD, IDTIPODOCUMENTO) " +
                     "VALUES (@idreclamo, @fechaReclamo, @descripcion, @estado, @tipoReclamo, @idDomi, @nroDoc, @priori, @tipoDoc)";
        int filas=Datos.ejecutarComando(sql, para);
       // if (filas != 0)
       // { Datos.commit(); }
        return filas;

    }

   /* public int calcularTiempoRetraso(int nroReclamo)
    {
        SqlParameter p = new SqlParameter("@r", nroReclamo);
        
        string sql = "select t.tiemporesolucion, " +
                     "(select sum(tiemporesolucion) from reclamo rc, tiporeclamo tr " +
                     "where rc.idtiporeclamo = tr.idtiporeclamo " +
                     "and rc.idestadoreclamo = 1 " +
                     "and tr.prioridad > t.prioridad) tiempoResolucion, t.prioridad " +
                     "from reclamo r, tiporeclamo t " +
                     "where r.idestadoreclamo = 1 and t.idtiporeclamo = r.idtiporeclamo and r.idreclamo = @r";
        
        SqlDataReader dr = Datos.obtenerDataReader(sql, p);
        
        while (dr.Read())

        { int tiempo = Convert.ToInt32(dr[0]); }
        dr.Close();
        
        return tiempo;
    }*/

    public int buscarTiempoFinalizacion(int idReclamo)
    {
        String sql = " select tiemporesolucion from reclamo r with(NOLOCK), tiporeclamo tr with(NOLOCK) " +
                     " where r.idtiporeclamo = tr.idtiporeclamo "+
                     " and r.idreclamo = "+idReclamo;
        int tiempo = Datos.obtenerEscalar(sql);
        return tiempo;

    }

    public void actualizarOTenReclamo(int idReclamo, int idOTC)
    {
        String sql = " update reclamo  "+
                     " set idordentrabajocorrectivo = "+idOTC+
                     " where idreclamo = "+idReclamo;

        Datos.ejecutarComando(sql);
    }
    public void actualizarEstadoReclamo(int idReclamo, int idestado)
    {
        String sql = " update reclamo  " +
                     " set idestadoreclamo = " + idestado +
                     " where idreclamo = " + idReclamo;

        Datos.ejecutarComando(sql);
    }

    public List<Reclamo> getReclamoReporteXFechaYSocioPersona(DateTime fechaInicio, DateTime fechaFin)
    {
        List<Reclamo> reclamos = new List<Reclamo>();
       
        String strSql = "SELECT R.IDRECLAMO, R.FECHA, TR.DESCRIPCION AS 'TIPO RECLAMO', R.DESCRIPCION, "+
                        "R.IDSOCIO, T.DESCRIPCION, R.NRODOCUMENTO, "+
                        "P.APELLIDO, P.NOMBRE, C.NOMBRE as'CALLE',D.NROCALLE, "+
                        "D.PISO, D.DPTO, PR.DESCRIPCION as 'PRIORIDAD' "+    
                        "FROM RECLAMO R, PERSONA P, TIPODOCUMENTO T, DOMICILIO D, CALLE C, PRIORIDAD PR, TIPORECLAMO TR "+
                        "WHERE R.IDTIPODOCUMENTO=P.TIPODOCUMENTO "+
                        "AND R.NRODOCUMENTO=P.NRODOCUMENTO "+
                        "AND T.IDTIPODOCUMENTO=R.IDTIPODOCUMENTO "+
                        "AND R.IDDOMICILIO=D.IDDOMICILIO "+
                        "AND D.IDCALLE=C.IDCALLE "+
                        "AND R.PRIORIDAD = PR.IDPRIORIDAD "+
                        "AND R.IDTIPORECLAMO = TR.IDTIPORECLAMO "+
                       // "AND S.IDTIPOSOCIO=1 "+
                        "AND R.FECHA BETWEEN @fechaInicio AND @fechaFin";

        List<SqlParameter> lstParam = new List<SqlParameter>();
        lstParam.Add(new SqlParameter("@fechaInicio",fechaInicio));
        lstParam.Add(new SqlParameter("@fechaFin",fechaFin));

        
        SqlDataReader d = Datos.obtenerDataReader(strSql,lstParam);

        while (d.Read())
        {
            Reclamo r = new Reclamo();
            r.NroReclamo=Convert.ToInt32(d[0]);
            r.Fecha=Convert.ToDateTime(d[1]);
            r.TipoReclamo=d[2].ToString();
            r.Descripcion=Convert.ToString(d[3]);
            r.NroSocio=Convert.ToInt32(d[4]);
            r.TipoDocDescrip = Convert.ToString(d[5]);
            r.NroDoc=Convert.ToInt32(d[6]);
            r.ApellidoSocio = Convert.ToString(d[7]);
            r.NombreSocio = Convert.ToString(d[8]);
            r.Calle = Convert.ToString(d[9]);
            r.NroCalle=Convert.ToInt32(d[10]);
            r.Piso=Convert.ToInt32(d[11]);
            r.Dpto = Convert.ToString(d[12]);
            r.Prioridad = Convert.ToString(d[13]);
            reclamos.Add(r);

        }
        d.Close();
        return reclamos;

    }
    public int crearReclamo(Reclamo r)
    {
        string sql = "insert into Reclamo(idReclamo, fecha, hora, descripcion,idordentrabajocorrectivo," +
        " idsocio, idestadoreclamo, idtiporeclamo, iddomicilio, nrodocumento, prioridad," +
        " idusuario, idtipodocumento) values (@a,@b,@c,@d,@e,@f,@g,@h,@i,@j,@k,@l,@m)";

        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", r.NroReclamo));
        param.Add(new SqlParameter("@b", r.Fecha));
        param.Add(new SqlParameter("@c", r.Hora));
        param.Add(new SqlParameter("@d", r.Descripcion));

        if (Convert.ToInt32(r.NroOTC) == 0)
            param.Add(new SqlParameter("@e", DBNull.Value));
        else
            param.Add(new SqlParameter("@e", r.NroOTC));

        if (Convert.ToInt32(r.NroSocio) == 0)
            param.Add(new SqlParameter("@f", DBNull.Value));
        else
            param.Add(new SqlParameter("@f", r.NroSocio));

        if (Convert.ToInt32(r.IdEstado) == 0)
            param.Add(new SqlParameter("@g", DBNull.Value));
        else
            param.Add(new SqlParameter("@g", r.IdEstado));

        param.Add(new SqlParameter("@h", r.IdTipoReclamo));
        param.Add(new SqlParameter("@i", r.IdDomicilio));

        if (Convert.ToInt32(r.NroDoc) == 0)
            param.Add(new SqlParameter("@j", DBNull.Value));
        else
            param.Add(new SqlParameter("@j", r.NroDoc));

        param.Add(new SqlParameter("@k", r.NroPrioridad));
        param.Add(new SqlParameter("@l", r.IdUsuario));

        if (Convert.ToInt32(r.TipoDoc) == 0)
            param.Add(new SqlParameter("@m", DBNull.Value));
        else
            param.Add(new SqlParameter("@m", r.TipoDoc));

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

        return filas;
    }
}
