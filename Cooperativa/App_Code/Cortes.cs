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
/// Descripción breve de Cortes
/// </summary>
public class Cortes
{
	public Cortes()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public List<CorteProgramado> buscarCortesProgramados()
    {
        String sql = " select CONVERT(VARCHAR(10), fechainicio, 103) fechainicio, idcorte, motivo, idsubestacion from corteprogramado " +
                     " where month(fechainicio)  between month(getDate())-1 and  month(getDate())+1 ";

        SqlDataReader sdr = Datos.obtenerDataReader(sql);
        List<CorteProgramado> cortes = new List<CorteProgramado>();
        while (sdr.Read())
        {
            CorteProgramado c = new CorteProgramado();
            c.Idcorte = Convert.ToInt32(sdr["idcorte"].ToString());
            c.Fechainicio = Convert.ToDateTime(sdr["fechainicio"].ToString());
            c.Idzona = Convert.ToInt32(sdr["idsubestacion"].ToString());
            c.Motivo = sdr["motivo"].ToString();
            cortes.Add(c);
        }
        sdr.Close();
        return cortes;
    }

    public int obtenerUltimoNroCorte()
    {
        string sql = "select max(idcorte) from CorteProgramado";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }

    public int insertarCorteProgramado(CorteProgramado cp)
    {
        String sql = " insert into corteprogramado (idcorte, idsubestacion, motivo, horainicio, fechainicio, horafin, fechafin,notificacion)" +
                     " values (@p1,@p2,@p3,@p4,@p5,@p6,@p7 ,1)";
        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@p1", cp.Idcorte));
        param.Add(new SqlParameter("@p2", cp.Idzona));
        param.Add(new SqlParameter("@p3", cp.Motivo));
        param.Add(new SqlParameter("@p4", cp.Fechainicio));
        param.Add(new SqlParameter("@p5", cp.Fechainicio));
        param.Add(new SqlParameter("@p6", cp.Fechafin));
        param.Add(new SqlParameter("@p7", cp.Fechafin));

        int insertado = Datos.ejecutarComando(sql, param);
        return insertado;
    }

}
