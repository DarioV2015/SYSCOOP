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
/// Descripción breve de Mediciones
/// </summary>
public class Mediciones
{
	public Mediciones()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public int insertarMedicion(int idconsumo, DateTime fechamedicion, int lecturaconsumo, int medidor, float consumo)
    {
        String sql = "INSERT INTO CONSUMO (IDCONSUMO ,FECHAMEDICION ,LECTURACONSUMO,MEDIDOR, CONSUMO) " +
     " VALUES (@IDCONSUMO, @FECHAMEDICION, @LECTURACONSUMO, @MEDIDOR, @CONSUMO)";

        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@IDCONSUMO", idconsumo));
        param.Add(new SqlParameter("@FECHAMEDICION", fechamedicion));
        param.Add(new SqlParameter("@LECTURACONSUMO", lecturaconsumo));
        param.Add(new SqlParameter("@MEDIDOR", medidor));
        param.Add(new SqlParameter("@CONSUMO", consumo));

        return Datos.ejecutarComando(sql, param);
    }

     public float obtenerUltimoConsumo(int idMedidor, int idConsumo)
        {
            List<SqlParameter> param = new List<SqlParameter>();
            param.Add(new SqlParameter("@idMedidor", idMedidor));
            param.Add(new SqlParameter("@idConsumo", idConsumo));

            string sql = "select LECTURACONSUMO  from consumo where medidor = @idMedidor and idconsumo = @idConsumo";

            SqlDataReader dr = Datos.obtenerDataReader(sql, param);//Datos.encontrar(sql, con, p);

            float lecturaConsumo = 0;

            while (dr.Read())
            {
                lecturaConsumo = Convert.ToSingle (dr[0]);
               
            }

            dr.Close();
            return lecturaConsumo;
     }
}
