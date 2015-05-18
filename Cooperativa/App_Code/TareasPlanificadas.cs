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
/// Descripción breve de TareasPlanificadas
/// </summary>
public class TareasPlanificadas
{
	public TareasPlanificadas()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public TareaPlanificada buscarTareaPlanificada(String idzona, String idtarea)
    {
        String sql = " select * from tareaplanificada tp "+
                     " where tp.idzona =  "+idzona+
                     " and tp.idtareageneral =  "+idtarea+
                     " and tp.fechainicio = (Select max(fechainicio)  from tareaplanificada tp2 "+
                     " where tp2.idzona = tp.idzona  "+
                     " and tp2.idtareageneral = tp.idtareageneral) ";

        SqlDataReader sdr = Datos.obtenerDataReader(sql);
        TareaPlanificada tarea = null;
        while (sdr.Read())
        {
             tarea = new TareaPlanificada();
            tarea.Idtareaplanificada = sdr["idtareaplanificada"].ToString();
            tarea.Idtareageneral = sdr["idtareageneral"].ToString();
            tarea.Fechainicio = Convert.ToDateTime(sdr["fechainicio"].ToString());
            if (sdr["fechafin"].GetType() != Type.GetType("System.DBNull"))
            {
                tarea.Fechafin = Convert.ToDateTime(sdr["fechafin"].ToString());
            }
            tarea.Duracion   = sdr["duracion"].ToString();
            tarea.Idestado = sdr["idestado"].ToString();
            tarea.Tiempoestimado = sdr["tiempoestimado"].ToString();
            tarea.Idprioridad = sdr["idprioridad"].ToString();
            tarea.Idzona = sdr["idzona"].ToString();
            tarea.Asunto = sdr["asunto"].ToString();
 
        }
        sdr.Close();
        if (tarea != null)
        {
            List<Actividad> actividades = Datos.getActividades().buscarActividadesDeTarea(tarea.Idtareaplanificada);

            foreach (Actividad a in actividades)
            {
                a.Insumos = Datos.getInsumo().buscarInsumosDeActividad(a.IdActividad.ToString());
            }

            tarea.Actividades = actividades;

        }
        return tarea;
    }

    public List<TareaPlanificada> buscarTareasEntreMes(String idzona)
    {
        String sql = " select idtareaplanificada, idtareageneral, duracion, CONVERT(VARCHAR(10), fechainicio, 103) fechainicio, CONVERT(VARCHAR(10), fechafin, 103) fechafin, "+
                     " idestado, tiempoestimado,idprioridad,idzona,asunto from tareaplanificada "+
                     " where month(fechainicio)  between month(getDate())-1 and  month(getDate())+1 "+
                     " and idzona = "+idzona;

        SqlDataReader sdr = Datos.obtenerDataReader(sql);
        List<TareaPlanificada> tareas = new List<TareaPlanificada>();
        while (sdr.Read())
        {
            TareaPlanificada tarea = new TareaPlanificada();
            tarea.Idtareaplanificada = sdr["idtareaplanificada"].ToString();
            tarea.Idtareageneral = sdr["idtareageneral"].ToString();
            tarea.Fechainicio = Convert.ToDateTime(sdr["fechainicio"].ToString());
            if (sdr["fechafin"].GetType() != Type.GetType("System.DBNull"))
            {
                tarea.Fechafin = Convert.ToDateTime(sdr["fechafin"].ToString());
            }
            tarea.Duracion = sdr["duracion"].ToString();
            tarea.Idestado = sdr["idestado"].ToString();
            tarea.Tiempoestimado = sdr["tiempoestimado"].ToString();
            tarea.Idprioridad = sdr["idprioridad"].ToString();
            tarea.Idzona = sdr["idzona"].ToString();
            tarea.Asunto = sdr["asunto"].ToString();
            tareas.Add(tarea);
        }
        sdr.Close();

        return tareas;
    }

    public List<Prioridad> buscarPrioridades()
    {
        String sql = " select idprioridad, descripcion, ranking from prioridad";

        SqlDataReader sdr = Datos.obtenerDataReader(sql);
        List<Prioridad> prioridades = new List<Prioridad>();
        while (sdr.Read())
        {
            Prioridad p = new Prioridad();
            p.Idprioridad = Convert.ToInt32(sdr["idprioridad"].ToString());
            p.Descripcion = sdr["descripcion"].ToString();
            p.Ranking = Convert.ToInt32(sdr["ranking"].ToString());
            prioridades.Add(p);
        }
        sdr.Close();

        return prioridades;
    }

    public int insertarTareaPlanificada(int idtareaplanificada)
    {
        TareaPlanificada t = new TareaPlanificada();
        t.Idtareaplanificada = idtareaplanificada.ToString();
        return this.insertarTareaPlanificada(t);
    }

    public int insertarTareaPlanificada(TareaPlanificada t)
    {
        String sql = " insert into tareaplanificada (idtareaplanificada, idtareageneral, idzona, asunto, fechainicio, idestado, idprioridad, fechacreacion, fechafin, duracion, tiempoestimado )"+
                     " values (@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p10,@p11 )";
        List<SqlParameter> param = new List<SqlParameter>(); 
        
        param.Add(new SqlParameter("@p1", t.Idtareaplanificada));
        param.Add(new SqlParameter("@p2", t.Idtareageneral));
        param.Add(new SqlParameter("@p3", t.Idzona));
        param.Add(new SqlParameter("@p4", t.Asunto));
        param.Add(new SqlParameter("@p5", t.Fechainicio));
        param.Add(new SqlParameter("@p6", t.Idestado));
        param.Add(new SqlParameter("@p7", t.Idprioridad));
        param.Add(new SqlParameter("@p8", t.FechaCreacion));
        param.Add(new SqlParameter("@p9", t.Fechafin));
        param.Add(new SqlParameter("@p10", t.Tiempoestimado));
        param.Add(new SqlParameter("@p11", t.Tiempoestimado));

        int insertado = Datos.ejecutarComando(sql,param);
        return insertado;
    }

    public int obtenerUltimoNroTareaPlanificada()
    {
        string sql = "select max (idtareaplanificada) from tareaplanificada";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }

    public int actualizarTarea(String idtarea)
    {
        String sql = " update tareaplanificada set idestado = 3 where idtareaplanificada = "+idtarea;
        int insertado = Datos.ejecutarComando(sql);
        return insertado;
    }
}
