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
/// Descripción breve de TipoReclamos
/// </summary>
public class TipoReclamos
{
	public TipoReclamos()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public int obtenerUltimoNroArtefacto()
    {
        string sql = "select max(idTipoReclamo) from TipoReclamo";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }
    public int crearTipoReclamo(TipoReclamoTipico t)
    {
        string sql = "insert into TipoReclamo(idTipoReclamo,descripcion, prioridad, tiempoResolucion, nombre) values (@a,@b,@c,@d,@e)";
        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", t.IdTipoReclamo));
        param.Add(new SqlParameter("@b", t.Descripcion));
        param.Add(new SqlParameter("@c", t.Prioridad));
        param.Add(new SqlParameter("@d", t.TiempoResolucion));
        param.Add(new SqlParameter("@e", t.Nombre));

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

    public TipoReclamoTipico traerDatosTipoReclamo(int idTipo)
    {
        SqlParameter p = new SqlParameter("@a", idTipo);
        string sql = "SELECT T.DESCRIPCION, T.PRIORIDAD, T.TIEMPORESOLUCION, P.DESCRIPCION FROM TIPORECLAMO T, PRIORIDAD P WHERE T.PRIORIDAD = P.IDPRIORIDAD AND IDTIPORECLAMO = @a";

        SqlDataReader dr = Datos.obtenerDataReader(sql, p);

        TipoReclamoTipico t = new TipoReclamoTipico();

        while (dr.Read())
        {
            t.Nombre = dr[0].ToString();
            t.Prioridad = Convert.ToInt32(dr[1]);
            t.TiempoResolucion = Convert.ToInt32(dr[2]);
            t.PrioridadNombre = Convert.ToString(dr[3]);
        }

        dr.Close();
        return t;
    }
    /*public int PrioridadTipoReclamo(int idTipo)
    {
        SqlParameter p = new SqlParameter("@a", idTipo);
        string sql = "SELECT PRIORIDAD FROM TIPORECLAMO WHERE IDTIPORECLAMO = @a";

        SqlDataReader dr = Datos.obtenerDataReader(sql, p);

        TipoReclamoTipico t = new TipoReclamoTipico();

        while (dr.Read())
        {
            t.Prioridad = Convert.ToInt32(dr[1]);
        }

        dr.Close();
        return t;
    }*/
    public TipoReclamoTipico traerTiempoResolucion(int tipoReclamo)
    {
        SqlParameter p = new SqlParameter("@a", tipoReclamo);
        string sql = "select distinct tr.tiemporesolucion" +
        " from reclamo r, tiporeclamo tr" +
        " where tr.idtiporeclamo = r.idtiporeclamo" +
        " and tr.idtiporeclamo = @a";

        SqlDataReader dr = Datos.obtenerDataReader(sql, p);

        TipoReclamoTipico t = new TipoReclamoTipico();

        while (dr.Read())
        {
            t.TiempoResolucion = Convert.ToSingle(dr[0]);
        }

        dr.Close();
        return t;
    }
    public List<TipoReclamoTipico> listasTipoReclamo()
    {
        String sql = "SELECT IDTIPORECLAMO, DESCRIPCION FROM TIPORECLAMO";

        SqlDataReader sdr = Datos.obtenerDataReader(sql);

        List<TipoReclamoTipico> tipoReclamo = new List<TipoReclamoTipico>();
        while (sdr.Read())
        {
            TipoReclamoTipico t = new TipoReclamoTipico();
            t.IdTipoReclamo= Convert.ToInt32(sdr[0]);
            t.Descripcion=sdr[1].ToString();

            tipoReclamo.Add(t);
        }
        sdr.Close();
        return tipoReclamo;
    }
}
