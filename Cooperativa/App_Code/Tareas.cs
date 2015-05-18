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
/// Descripción breve de Tareas
/// </summary>
public class Tareas
{

    public int obtenerUltimoIdTarea()
    {
        string sql = "select max(IDTAREAGENERAL) from TAREAGENERAL";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }

    public int insertarTarea(int nro, String nom, String des, int peri)
    {
        SqlParameter nroTarea = new SqlParameter("@nroTarea", nro);
        SqlParameter nomTarea = new SqlParameter("@nomTarea", nom);
        SqlParameter descripTarea = new SqlParameter("@descripTarea", des);
        SqlParameter periodicidad = new SqlParameter("@periodicidad", peri);

        SqlParameter[] para = { nroTarea, nomTarea, descripTarea, periodicidad };


        string sql = "INSERT INTO TAREAGENERAL (IDTAREAGENERAL, NOMBRE, DESCRIPCION, PERIODICIDAD) VALUES (@nroTarea, @nomTarea, @descripTarea, @periodicidad)";

        int filas = 0;

        try
        {
            filas = Datos.ejecutarComando(sql, para);
        }
        catch { }

        return filas;

    }

    public int insertarActividadXTarea(int nroTarea, int nroActividad)
    {
        SqlParameter nroT = new SqlParameter("@nroT", nroTarea);
        SqlParameter nroA = new SqlParameter("@nroA", nroActividad);
        
        SqlParameter[] para = { nroT, nroA  };


        string sql = "INSERT INTO TAREAGENERALXACTIVIDAD (IDTAREA, IDACTIVIDAD) VALUES (@nroT, @nroA)";

        int filas = 0;

        try
        {
            filas = Datos.ejecutarComando(sql, para);
        }
        catch { }

        return filas;

    }

    public List<Tarea> buscarTareas()
    {
        String sql = " select idtareageneral, nombre, descripcion, periodicidad from tareaGeneral ";

        SqlDataReader sdr = Datos.obtenerDataReader(sql);

        List<Tarea> tareas = new List<Tarea>();
        while (sdr.Read())
        {
            Tarea t = new Tarea();
            t.IdTarea = Convert.ToInt32(sdr["idtareageneral"]);
            t.Nombre = sdr["nombre"].ToString();
            t.Descripcion = sdr["descripcion"].ToString();
            t.Periodicidad = Convert.ToInt32(sdr["periodicidad"].ToString());
            tareas.Add(t);
        }
        sdr.Close();
        return tareas;
    }
    
    
    
    public Tareas()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
