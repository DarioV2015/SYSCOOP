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
/// Descripción breve de TipoArtefactos
/// </summary>
public class TipoArtefactos
{
	public TipoArtefactos()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public int obtenerUltimoNroArtefacto()
    {
        string sql = "select max(idTipoArtefacto) from TipoArtefacto";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }
    public int crearTipoArtefacto(TipoArtefacto t)
    {
        string sql = "insert into TipoArtefacto(idTipoArtefacto,descripcion, potencia) values (@a,@b,@c)";
        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", t.IdTipoArtefacto));
        param.Add(new SqlParameter("@b", t.Descripcion));
        param.Add(new SqlParameter("@c", t.Potencia));

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
    public int traerCantidadTipoArtefacto()
    {
        string sql = "select count(*) from tipoartefacto";

        SqlDataReader dr = Datos.obtenerDataReader(sql);
        int cantidad = 0;

        while (dr.Read())
        {
            cantidad = Convert.ToInt32(dr[0]);
        }

        dr.Close();
        return cantidad;
    }
}
