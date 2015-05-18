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
/// Descripción breve de Calles
/// </summary>
public class Calles
{
    public Calle getCalle(int idCalle)
    {
        SqlParameter para = new SqlParameter("@idCalle", idCalle);
        string sql = "SELECT NOMBRE FROM CALLE WHERE IDCALLE = @idCalle";

        SqlDataReader dr = Datos.obtenerDataReader(sql, para);//Datos.encontrar(sql, con, p);

        Calle calle = new Calle();

        while (dr.Read())
        {
            calle.NombreCalle = dr[0].ToString();
            
        }

        dr.Close();
        return calle;
    }

    public Calle getCalleXNombre(String nombreCalle)
    {
        SqlParameter para = new SqlParameter("@Calle", nombreCalle);
        string sql = "SELECT IDCALLE,nombre FROM CALLE WHERE upper(NOMBRE) = upper(@Calle)";

        SqlDataReader dr = Datos.obtenerDataReader(sql, para);
        Calle calle = new Calle();
        while (dr.Read())
        {
            calle.IdCalle = Convert.ToInt32(dr[0].ToString());
            calle.NombreCalle = dr[1].ToString();
        }

        dr.Close();
        return calle;
    }
    
    public Calles()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
