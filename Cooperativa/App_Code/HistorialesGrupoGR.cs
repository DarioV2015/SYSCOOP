using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;
using System.Data.Odbc;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de HistorialesGrupoGR
/// </summary>
public class HistorialesGrupoGR
{
    public HistorialesGrupoGR()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    
    public List<HistorialGrupoGR> getHistorialXfecha(int mes, int año)
    {
        SqlParameter fechaMes = new SqlParameter("@fechaMes", mes);
        SqlParameter fechaAño = new SqlParameter("@fechaAño", año);

        SqlParameter[] para = { fechaMes, fechaAño };

        String sql = "SELECT H.IDGRUPOGR, H.FECHAINICIO, H.FECHAFIN, T.DESCRIPCION, P.APELLIDO, P.NOMBRE " +
                     "FROM HISTORIALGRUPO H, TURNO T, EMPLEADO E, PERSONA P, EMPLEADOPORGRUPOGR GXE " +
                     "WHERE H.IDGRUPOGR = GXE.IDGRUPOGUADIARECLAMO " +
                     "AND GXE.IDEMPLEADO = E.IDEMPLEADO " +
                     "AND E.NRODOCUMENTO = P.NRODOCUMENTO " +
                     "AND E.IDTIPODOCUMENTO = P.TIPODOCUMENTO " +
                     "AND H.IDTURNO = T.IDTURNO " +
                     "AND (MONTH(H.FECHAINICIO) = @fechaMes OR MONTH(H.FECHAFIN) = @fechaMes) " +
                     "AND (YEAR(H.FECHAINICIO) = @fechaAño OR YEAR(H.FECHAFIN) = @fechaAño)";


        SqlDataReader dr = Datos.obtenerDataReader(sql, para);

        List<HistorialGrupoGR> lista = new List<HistorialGrupoGR>();

        while (dr.Read())
        {
            HistorialGrupoGR hg = new HistorialGrupoGR();
            
            hg.IdGrupo = Convert.ToInt32(dr[0]);
            hg.FechaInicio = DateTime.Parse(dr[1].ToString());
            hg.FechaFin = DateTime.Parse(dr[2].ToString());
            hg.Turno = dr[3].ToString();
            hg.ApellidoEmpleado = dr[4].ToString();
            hg.NombreEmpleado = dr[5].ToString();

            lista.Add(hg);
        }
        dr.Close();
        return lista;

    }

    public List<HistorialGrupoGR> getHistorial()
    {
       
        String sql = "SELECT H.IDGRUPOGR, H.FECHAINICIO, H.FECHAFIN, T.DESCRIPCION, P.APELLIDO, P.NOMBRE " +
                     "FROM HISTORIALGRUPO H, TURNO T, EMPLEADO E, PERSONA P, EMPLEADOPORGRUPOGR GXE " +
                     "WHERE H.IDGRUPOGR = GXE.IDGRUPOGUADIARECLAMO " +
                     "AND GXE.IDEMPLEADO = E.IDEMPLEADO " +
                     "AND E.NRODOCUMENTO = P.NRODOCUMENTO " +
                     "AND E.IDTIPODOCUMENTO = P.TIPODOCUMENTO " +
                     "AND H.IDTURNO = T.IDTURNO";


        SqlDataReader dr = Datos.obtenerDataReader(sql);

        List<HistorialGrupoGR> lista = new List<HistorialGrupoGR>();

        while (dr.Read())
        {
            HistorialGrupoGR hg = new HistorialGrupoGR();

            hg.IdGrupo = Convert.ToInt32(dr[0]);
            hg.FechaInicio = DateTime.Parse(dr[1].ToString());
            hg.FechaFin = DateTime.Parse(dr[2].ToString());
            hg.Turno = dr[3].ToString();
            hg.ApellidoEmpleado = dr[4].ToString();
            hg.NombreEmpleado = dr[5].ToString();

            lista.Add(hg);
        }
        dr.Close();
        return lista;

    }


    public List<HistorialGrupoGR> getHistorialXGrupo(int idGrupo)
    {
        SqlParameter grupo = new SqlParameter("@grupo", idGrupo);
        
        SqlParameter[] para = { grupo };

        String sql = "SELECT H.IDGRUPOGR, H.FECHAINICIO, H.FECHAFIN, T.DESCRIPCION, P.APELLIDO, P.NOMBRE " +
                     "FROM HISTORIALGRUPO H, TURNO T, EMPLEADO E, PERSONA P, EMPLEADOPORGRUPOGR GXE " +
                     "WHERE H.IDGRUPOGR = GXE.IDGRUPOGUADIARECLAMO " +
                     "AND GXE.IDEMPLEADO = E.IDEMPLEADO " +
                     "AND E.NRODOCUMENTO = P.NRODOCUMENTO " +
                     "AND E.IDTIPODOCUMENTO = P.TIPODOCUMENTO " +
                     "AND H.IDTURNO = T.IDTURNO " +
                     "AND H.IDGRUPOGR = @grupo";


        SqlDataReader dr = Datos.obtenerDataReader(sql, para);

        List<HistorialGrupoGR> lista = new List<HistorialGrupoGR>();

        while (dr.Read())
        {
            HistorialGrupoGR hg = new HistorialGrupoGR();

            hg.IdGrupo = Convert.ToInt32(dr[0]);
            hg.FechaInicio = DateTime.Parse(dr[1].ToString());
            hg.FechaFin = DateTime.Parse(dr[2].ToString());
            hg.Turno = dr[3].ToString();
            hg.ApellidoEmpleado = dr[4].ToString();
            hg.NombreEmpleado = dr[5].ToString();

            lista.Add(hg);
        }
        dr.Close();
        return lista;

    }

    public List<HistorialGrupoGR> getHistorialXTurno(int idTurno)
    {
        SqlParameter turno = new SqlParameter("@turno", idTurno);

        SqlParameter[] para = { turno };

        String sql = "SELECT H.IDGRUPOGR, H.FECHAINICIO, H.FECHAFIN, T.DESCRIPCION, P.APELLIDO, P.NOMBRE " +
                     "FROM HISTORIALGRUPO H, TURNO T, EMPLEADO E, PERSONA P, EMPLEADOPORGRUPOGR GXE " +
                     "WHERE H.IDGRUPOGR = GXE.IDGRUPOGUADIARECLAMO " +
                     "AND GXE.IDEMPLEADO = E.IDEMPLEADO " +
                     "AND E.NRODOCUMENTO = P.NRODOCUMENTO " +
                     "AND E.IDTIPODOCUMENTO = P.TIPODOCUMENTO " +
                     "AND H.IDTURNO = T.IDTURNO " +
                     "AND H.IDTURNO = @turno";


        SqlDataReader dr = Datos.obtenerDataReader(sql, para);

        List<HistorialGrupoGR> lista = new List<HistorialGrupoGR>();

        while (dr.Read())
        {
            HistorialGrupoGR hg = new HistorialGrupoGR();

            hg.IdGrupo = Convert.ToInt32(dr[0]);
            hg.FechaInicio = DateTime.Parse(dr[1].ToString());
            hg.FechaFin = DateTime.Parse(dr[2].ToString());
            hg.Turno = dr[3].ToString();
            hg.ApellidoEmpleado = dr[4].ToString();
            hg.NombreEmpleado = dr[5].ToString();

            lista.Add(hg);
        }
        dr.Close();
        return lista;

    }

   
    public int buscarDiagramacionGrupoDisponible(int idGrupo)
    {
        SqlParameter grupo = new SqlParameter("@grupo", idGrupo);
       
        SqlParameter[] para = {grupo};

        String sql = "SELECT HG.IDGRUPOGR "+
                     "FROM HISTORIALGRUPO HG, TURNO T "+
                     "WHERE HG.IDTURNO = T.IDTURNO AND HG.FECHAFIN >= GETDATE() AND HG.IDGRUPOGR = @grupo";

        int id = Datos.obtenerEscalar(sql, para);

        return id;

    }

    public List<HistorialEmpleado> getHistorialGRSuplente(DateTime fechaInicio, DateTime fechaFin)
    {
        SqlParameter inicio = new SqlParameter("@inicio", fechaInicio);
        SqlParameter fin = new SqlParameter("@fin", fechaFin);

        SqlParameter[] para = { inicio, fin };

        String sql = "SELECT DISTINCT HE.IDEMPLEADO, P.APELLIDO, P.NOMBRE, convert(char(10), HE.FECHAINICIO, 103) AS FechaInicio, convert(char(10), HE.FECHAFIN, 103) AS FechaFin "+
                      "FROM HISTORIALEMPLEADO HE, PERSONA P, EMPLEADO E "+
                      "WHERE HE.IDEMPLEADO = E.IDEMPLEADO "+
                      "AND E.IDTIPODOCUMENTO = P.TIPODOCUMENTO "+
                      "AND E.NRODOCUMENTO = P.NRODOCUMENTO "+
                      "AND E.IDCARGO = 2 "+
                      "AND (MONTH(@inicio) = MONTH(HE.FECHAINICIO) OR MONTH(@fin) = MONTH(HE.FECHAFIN))";


        SqlDataReader dr = Datos.obtenerDataReader(sql, para);

        List<HistorialEmpleado> lista = new List<HistorialEmpleado>();

        while (dr.Read())
        {
            HistorialEmpleado he = new HistorialEmpleado();

            he.IdEmpleado = Convert.ToInt32(dr[0]);
            he.ApellidoEmpleado = dr[1].ToString();
            he.NombreEmpleado = dr[2].ToString();
            he.FechaInicio = DateTime.Parse(dr[3].ToString());
            he.FechaFin = DateTime.Parse(dr[4].ToString());

            lista.Add(he);
        }
        dr.Close();
        return lista;

    }
    
    
    
    
   
    

}
