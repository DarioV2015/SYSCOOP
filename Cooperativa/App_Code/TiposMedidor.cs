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
/// Descripción breve de TiposMedidor
/// </summary>
public class TiposMedidor
{
    public TipoMedidor getTipoDeMedidores(int idMedidor)
    {
        SqlParameter para = new SqlParameter("@idMedidor", idMedidor);
        string sql = "select M.IDTIPOMEDIDOR, TM.DESCRIPCION FROM MEDIDOR M, TIPOMEDIDOR TM WHERE M.IDTIPOMEDIDOR = TM.IDTIPOMEDIDOR AND IDMEDIDOR = @idMedidor";

        SqlDataReader dr = Datos.obtenerDataReader(sql, para);//Datos.encontrar(sql, con, p);

        TipoMedidor tipo = new TipoMedidor();

        while (dr.Read())
        {
            tipo.Descripcion = dr[1].ToString();
        

        }

        dr.Close();
        return tipo;
    }

    public TipoMedidor traerTipoMedidor(int tipo)
    {
        SqlParameter p = new SqlParameter("@a", tipo);

        string sql = "SELECT IDTIPOMEDIDOR, DESCRIPCION FROM TIPOMEDIDOR WHERE IDTIPOMEDIDOR = @a";


        SqlDataReader dr = Datos.obtenerDataReader(sql, p);

        TipoMedidor t = new TipoMedidor();

        while (dr.Read())
        {
            t.IdTipoMedidor=Convert.ToInt32(dr[0]);
            t.Descripcion=dr[1].ToString();
            
        }

        dr.Close();
        return t;

    }
    
    public TiposMedidor()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
