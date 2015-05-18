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
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de Artefactos
/// </summary>
public class Artefactos
{
	public Artefactos()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public int obtenerUltimoNroArtefacto()
    {
        string sql = "select max(idArtefacto) from Artefacto";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }
    public int crearArtefacto(Artefacto a)
    {
        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", a.IdArtefacto));
        param.Add(new SqlParameter("@b", a.ConsumoPromedio));
        param.Add(new SqlParameter("@c", a.HsUsoEstimado));
        param.Add(new SqlParameter("@d", a.IdMarca));
        param.Add(new SqlParameter("@e", a.NroFactura));
        param.Add(new SqlParameter("@f", a.IdTipoArtefacto));
        param.Add(new SqlParameter("@g", a.IdSocio));  //esta seteado
        param.Add(new SqlParameter("@h", a.Modelo));
        param.Add(new SqlParameter("@i", a.Fecha));

        string sql = "insert into Artefacto(idArtefacto,consumoPromedio, hsUsoEstimado, marca, nroFactura, idTipoArtefacto, idSocio, modelo, fecha) values (@a,@b,@c,@d,@e,@f,@g,@h,@i)";

        int filas = 0;

        try
        {
            filas = Datos.ejecutarComando(sql, param);
        }
        catch { }

        return filas;

    }
    //public int crearArtefactos(List<Artefacto> listaArtefactos)
    //{
    //    string sql = "insert into Artefacto(idArtefacto,consumoPromedio, hsUsoEstimado, marca, nroFactura, idTipoArtefacto, idSocio, modelo, fecha) values (@a,@b,@c,@d,@e,@f,@g,@h,@i)";
    //    List<SqlParameter> param;

    //    int filas = -1;
    //    string msg = " ";

    //    try
    //    {
    //        foreach (Artefacto a in listaArtefactos)
    //        {
    //            param = new List<SqlParameter>();

    //            param.Add(new SqlParameter("@a", a.IdArtefacto));
    //            param.Add(new SqlParameter("@b", a.ConsumoPromedio));
    //            param.Add(new SqlParameter("@c", a.HsUsoEstimado));
    //            param.Add(new SqlParameter("@d", a.IdMarca));
    //            param.Add(new SqlParameter("@e", a.NroFactura));
    //            param.Add(new SqlParameter("@f", a.IdTipoArtefacto));
    //            param.Add(new SqlParameter("@g", a.IdSocio));
    //            param.Add(new SqlParameter("@h", a.Modelo));
    //            param.Add(new SqlParameter("@i", a.Fecha));

    //            filas = Datos.ejecutarComando(sql, param);
    //        }
    //    }
    //    catch (SqlException s)
    //    {
    //        msg = s.Message.ToString();
    //    }

    //    return filas;
    //}
    public double calcularConsumoSocio(float horas, int idtipoartefacto)
    {
        String strSql = "select potencia from tipoArtefacto where idtipoartefacto = " + idtipoartefacto;

        SqlDataReader sdr = Datos.obtenerDataReader(strSql);

        double consumoPromedio = 0;

        while(sdr.Read())
            consumoPromedio = (Convert.ToDouble(sdr["potencia"].ToString())) * horas;

        sdr.Close();
        return consumoPromedio;

    }
    public double calcularCostoConsumo(int nroSocio)
    {
        String strSql = "select t.descripcion, t.potencia," +
            " a.hsusoestimado, a.consumopromedio" +
            " from tipoArtefacto t, artefacto a, socio s" +
            " where a.idtipoartefacto = t.idtipoartefacto" +
            " and a.idsocio = s.idsocio" +
            " and s.idsocio = " + nroSocio; 

        SqlDataReader sdr = Datos.obtenerDataReader(strSql);

        double costoConsumo = 0;

        while (sdr.Read())
            costoConsumo += (Convert.ToDouble(sdr["consumopromedio"].ToString()));

        sdr.Close();
        return costoConsumo;
    }
    public double buscarPotenciaArtefacto(int idTipoArtefacto)
    {
        String strSql = "select potencia" +
        " from tipoartefacto" +
        " where idtipoartefacto = " + idTipoArtefacto;

        SqlDataReader sdr = Datos.obtenerDataReader(strSql);

        double potencia = 0;

        while (sdr.Read())
            potencia = Convert.ToDouble(sdr[0]);

        sdr.Close();
        return potencia;
    }
}
