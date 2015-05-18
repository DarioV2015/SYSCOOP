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
/// Descripción breve de Actividades
/// </summary>
public class Actividades
{
    public int obtenerUltimoIdActividad()
    {
        string sql = "select max(IDACTIVIDAD) from ACTIVIDAD";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }

    public int getDuracionComplejidad(int idComplejidad)
    {
        SqlParameter para = new SqlParameter("@idComp", idComplejidad);
        string sql = "SELECT DURACION FROM COMPLEJIDADACTIVIDAD WHERE IDCOMPLEJIDAD =@idComp";

        SqlDataReader dr = Datos.obtenerDataReader(sql, para);//Datos.encontrar(sql, con, p);

        int duracion = 0;
        while (dr.Read())
        {
            duracion = Convert.ToInt32(dr[0]);

        }

        dr.Close();
        return duracion;
    }

    public int insertarActividad(int nroAct, String nom, String des, int comp, int dura)
    {
        SqlParameter nroActividad = new SqlParameter("@nroActividad", nroAct);
        SqlParameter nomActividad = new SqlParameter("@nomActividad", nom);
        SqlParameter descripActividad = new SqlParameter("@descripActividad", des);
        SqlParameter complejidad = new SqlParameter("@complejidad", comp);
        SqlParameter duracion = new SqlParameter("@duracion", dura);

        SqlParameter[] para = { nroActividad, nomActividad, descripActividad, complejidad, duracion };


        string sql = "INSERT INTO ACTIVIDAD (IDACTIVIDAD, NOMBRE, DESCRIPCION, COMPLEJIDAD, TIEMPOESTIMADO) "+
                     "VALUES (@nroActividad, @nomActividad, @descripActividad, @complejidad, @duracion)";

        int filas = 0;

        try
        {
            filas = Datos.ejecutarComando(sql, para);
        }
        catch { }

        return filas;

    }
    public int insertarInsumoXActividad(int nroAct, int codigo)
    {
        SqlParameter nroActividad = new SqlParameter("@nroActividad", nroAct);
        SqlParameter codigoInsumo = new SqlParameter("@codigoInsumo", codigo);
        
        SqlParameter[] para = { nroActividad, codigoInsumo };
        string sql = "INSERT INTO ACTIVIDADXINSUMOS (IDACTIVIDAD, IDINSUMO) VALUES (@nroActividad, @codigoInsumo)";
        
        int filas = 0;

        try
        {
            filas = Datos.ejecutarComando(sql, para);
        }
        catch { }

        return filas;
    }

    public List<Actividad> buscarActividadesDeTarea(String idTarea)
    {
        String sql = " select a.idactividad, a.Descripcion, a.complejidad, tp.duracion, a.nombre, ca.nombre desccomplejidad "+
                     " from tareaplanificada tp, tareageneral tg, actividad a, tareageneralxactividad txa, complejidadactividad ca " +
                     " where tp.idtareageneral = tg.idtareageneral "+
                     " and tg.idtareageneral = txa.idtarea "+
                     " and txa.idactividad = a.idactividad "+
                     " and ca.idcomplejidad = a.complejidad " +
                     " and tp.idtareaplanificada = " +idTarea;

        List<Actividad> actividades = new List<Actividad>();

        SqlDataReader sdr = Datos.obtenerDataReader(sql);

        while (sdr.Read())
        {
            Actividad a = new Actividad();
            a.IdActividad = Convert.ToInt32(sdr["idactividad"].ToString());
            a.DescripAct = sdr["descripcion"].ToString();
            a.NombreAct = sdr["nombre"].ToString();
            a.DescComplejidad = sdr["desccomplejidad"].ToString();
            a.IdComplejidad = Convert.ToInt32(sdr["complejidad"].ToString());
            a.TiempoAct = Convert.ToInt32(sdr["duracion"].ToString());

            actividades.Add(a);
        }

        sdr.Close();

        return actividades;
    }

    
    public Actividades()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
