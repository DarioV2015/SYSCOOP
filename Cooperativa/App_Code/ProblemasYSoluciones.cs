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
/// Descripción breve de ProblemasYSoluciones
/// </summary>
public class ProblemasYSoluciones
{
	public ProblemasYSoluciones()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public int obtenerUltimoNroProblema()
    {
        string sql = "select max(idProblema) from Problema";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }
    public int obtenerUltimoNroSolucion()
    {
        string sql = "select max(idSolucion) from Solucion";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }
    public int crearProblema(Problema p)
    {
        string sql = "insert into Problema(idProblema, nombre,descripcion) values (@a,@b,@c)";
        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", p.NroProblema));
        param.Add(new SqlParameter("@b", p.Nombre));
        param.Add(new SqlParameter("@c", p.Descripcion));

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
    public int crearSolucion(Solucion s)
    {
        string sql = "insert into Solucion(idSolucion, nombre,descripcion) values (@a,@b,@c)";
        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", s.NroSolucion));
        param.Add(new SqlParameter("@b", s.Nombre));
        param.Add(new SqlParameter("@c", s.Descripcion));

        int filas = -1;
        string msg = " ";
        try
        {
            filas = Datos.ejecutarComando(sql, param);
        }
        catch (SqlException sq)
        {
            msg = sq.Message.ToString();
        }

        return filas;
    }
    public int crearProbYSoluc(int p, int s)
    {
        string sql = "insert into ProblemasPorSolucion(idProblema, idSolucion) values (@a,@b)";
        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", p));
        param.Add(new SqlParameter("@b", s));

        int filas = -1;
        string msg = " ";
        try
        {
            filas = Datos.ejecutarComando(sql, param);
        }
        catch (SqlException sq)
        {
            msg = sq.Message.ToString();
        }

        return filas;
    }
    public int crearHerramientasXSoluc(int h, int s)
    {
        string sql = "insert into HerramientasPorSolucion(idHerramienta, idSolucion) values (@a,@b)";
        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", h));
        param.Add(new SqlParameter("@b", s));

        int filas = -1;
        string msg = " ";
        try
        {
            filas = Datos.ejecutarComando(sql, param);
        }
        catch (SqlException sq)
        {
            msg = sq.Message.ToString();
        }

        return filas;
    }
    public Solucion traerSoluciones()
    {
        string sql = "SELECT DESCRIPCION, NOMBRE, IDSOLUCION FROM SOLUCION";

        SqlDataReader dr = Datos.obtenerDataReader(sql);

        Solucion s = new Solucion();

        while (dr.Read())
        {
            s.NroSolucion = Convert.ToInt32(dr[2]);
            s.Nombre = dr[1].ToString();
            s.Descripcion = dr[0].ToString();
        }

        dr.Close();
        return s;
    }
    //public List<Solucion> traerSoluciones()
    //{
    //    List<Solucion> soluciones = new List<Solucion>();
    //    //SqlConnection con = Conexion.ObtenerConexion();
    //    string sql = "SELECT DESCRIPCION, NOMBRE AS SOLUCION, IDSOLUCION FROM SOLUCION";
                        
    //    SqlDataReader dr = Datos.obtenerDataReader(sql);

    //    while (dr.Read())
    //    {
    //        Solucion s = new Solucion();
    //        s.NroSolucion = Convert.ToInt32(dr[2]);
    //        s.Nombre = dr[1].ToString();
    //        s.Descripcion = dr[0].ToString();
    //        soluciones.Add(s);
    //    }
        
    //    dr.Close();
    //    return soluciones;

    //}
}
