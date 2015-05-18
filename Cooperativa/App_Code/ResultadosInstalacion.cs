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
/// Descripción breve de ResultadosInstalacion
/// </summary>
public class ResultadosInstalacion
{

    public ResultadoInstalacion getResultadoInstalacion(int idResultado)
    {
        SqlParameter p = new SqlParameter("@nroResultado", idResultado);
        string sql = "SELECT DESCRIPCION, NOMBRE, ESTADO " +
                     "FROM TIPORESULTADOIM " +
                     "WHERE IDTIPORESULTADO = @nroResultado";


        SqlDataReader dr = Datos.obtenerDataReader(sql, p);//Datos.encontrar(sql, con, p);

        ResultadoInstalacion re = new ResultadoInstalacion();

        while (dr.Read())
        {
            re.Descripcion = Convert.ToString(dr[0]);
            re.Nombre = Convert.ToString(dr[1]);
            re.IdEstado = Convert.ToInt32(dr[2]);
            
        }

        dr.Close();
        return re;
    }
    
    public ResultadosInstalacion()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
