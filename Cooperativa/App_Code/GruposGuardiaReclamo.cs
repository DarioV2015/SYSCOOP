using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.EnterpriseServices;
using System.Collections.Generic;

/// <summary>
/// Descripción breve de GruposGuardiaReclamo
/// </summary>
public class GruposGuardiaReclamo
{
	public GruposGuardiaReclamo()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public List<Persona> buscarGrupo(String fecha, int idTurno)
    {
        SqlParameter fechaPedido = new SqlParameter("@fecha", fecha);
        SqlParameter idTurnoPedido = new SqlParameter("@idTurno", idTurno);

        SqlParameter[] para = { fechaPedido, idTurnoPedido };

        String sql = "select p.nombre, p.apellido " +
                     " from persona p, empleado e, grupoguardiareclamo gr, grupoporturno gxt, turno t, historialgrupo hg, empleadoporgrupogr exg" +
                     " where e.idtipodocumento = p.tipodocumento " +
                     " and e.nrodocumento = p.nrodocumento" +
                     " and gr.idgrupo = exg.IDGRUPOGUADIARECLAMO" +
                     " and e.idempleado = exg.idempleado" +
                     " and hg.idgrupogr = exg.IDGRUPOGUADIARECLAMO" +
                     " and gr.idgrupo = gxt.idgrupogr" +
                     " and t.idturno = gxt.idturno" +
                     " and hg.idturno = gxt.idturno" +
                     " and hg.idturno = @idTurno" +
                     " and @fecha between (hg.fechainicio) and (hg.fechafin)";

        SqlDataReader dr = Datos.obtenerDataReader(sql, para);
       
        List<Persona> lista = new List<Persona>();
        
        while (dr.Read())
        {
            Persona p = new Persona();
            p.Nombre = dr[0].ToString();
            p.Apellido = dr[1].ToString();

            lista.Add(p);
        }

        dr.Close();
        return lista;

    }


    public int buscarIdGrupo(String fecha, int idTurno)
    {
        SqlParameter fechaPedido = new SqlParameter("@fecha", fecha);
        SqlParameter idTurnoPedido = new SqlParameter("@idTurno", idTurno);

        SqlParameter[] para = { fechaPedido, idTurnoPedido };

        String sql = "select gr.idgrupo" +
                     " from grupoguardiareclamo gr, grupoporturno gxt, turno t, historialgrupo hg" +
                     " where gr.idgrupo = gxt.idgrupogr" +
                     " and t.idturno = gxt.idturno" +
                     " and hg.idturno = gxt.idturno" +
                     " and hg.idturno = @idTurno" +
                     " and @fecha between (hg.fechainicio) and (hg.fechafin)";

        int id = Datos.obtenerEscalar(sql, para);

        return id;

    }


    public int buscarIdGrupoXEmpleados(int emp1, int emp2)
    {
        SqlParameter empleado1 = new SqlParameter("@empleado1", emp1);
        SqlParameter empleado2 = new SqlParameter("@empleado2", emp2);

        SqlParameter[] para = { empleado1, empleado2};

        String sql = "SELECT EG1.IDGRUPOGUADIARECLAMO FROM EMPLEADOPORGRUPOGR EG1 WHERE EG1.IDEMPLEADO = @empleado1 "+   
                     "AND EG1.IDGRUPOGUADIARECLAMO IN (SELECT EG2.IDGRUPOGUADIARECLAMO FROM EMPLEADOPORGRUPOGR EG2 "+
                     "WHERE EG2.IDEMPLEADO = @empleado2 )";

        int id = Datos.obtenerEscalar(sql, para);

        return id;

    }

    public List<OrdenInstalacionMedidor> cantidadOrdenesInstalacion (int nroGrupo, DateTime fecha)
    {
        List<OrdenInstalacionMedidor> ordenes = new List<OrdenInstalacionMedidor>();
        //SqlConnection con = Conexion.ObtenerConexion();
        String strSql = "SELECT IDORDENINSTALACION FROM ORDENINSTALACION " +
                        "WHERE  IDGRUPOGR = " + nroGrupo + " AND IDESTADOORDEN = 1 " + "ND FECHAINSTALACION = " + fecha;
        SqlDataReader sdr = Datos.obtenerDataReader(strSql);//Conexion.obtenerDataReader(strSql, con);

        while (sdr.Read())
        {
            OrdenInstalacionMedidor oi = new OrdenInstalacionMedidor();
            oi.NroOrden = Convert.ToInt32(sdr["IDORDENINSTALACION"].ToString());
            ordenes.Add(oi);
        }
        sdr.Close();
        return ordenes;

    }
  
    public int obtenerUltimoNroGrupoGR()
    {
        string sql = "select max(IDGRUPO) from GRUPOGUARDIARECLAMO";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }

    public int crearGrupoGR(int idGrupo)
    {

        SqlParameter idGrupoGR = new SqlParameter("@idGrupoGR", idGrupo);

        SqlParameter[] para = { idGrupoGR };

        string sql = "INSERT INTO GRUPOGUARDIARECLAMO (IDGRUPO, IDESTADOGUARDIARECLAMO, IDAREADOMINIO) VALUES (@idGrupoGR, 1, 1)";

        int filas = Datos.ejecutarComando(sql, para);
        if (filas != 0)
        { Datos.commit(); }
        return filas;
    }

    public int crearEmpleadoXGrupo(int idGrupo, int legajo)
    {

        SqlParameter idGrupoGR = new SqlParameter("@idGrupoGR", idGrupo);
        SqlParameter idEmpleado = new SqlParameter("@idEmpleado", legajo);


        SqlParameter[] para = { idGrupoGR, idEmpleado };

        string sql = "INSERT INTO EMPLEADOPORGRUPOGR (IDGRUPOGUADIARECLAMO, IDEMPLEADO) VALUES (@idGrupoGR, @idEmpleado)";

        int filas = Datos.ejecutarComando(sql, para);
        if (filas != 0)
        { Datos.commit(); }
        return filas;
    }

 
    public int crearGrupoXTurno(int idGrupo, int idTurno)
    {

        SqlParameter idGrupoGR = new SqlParameter("@idGrupoGR", idGrupo);
        SqlParameter turno = new SqlParameter("@turno", idTurno);


        SqlParameter[] para = { idGrupoGR, turno };

        string sql = "INSERT INTO GRUPOPORTURNO (IDGRUPOGR, IDTURNO) VALUES (@idGrupoGR, @turno)";

        int filas = Datos.ejecutarComando(sql, para);
        if (filas != 0)
        { Datos.commit(); }
        return filas;
    }



    public int crearHistorialGrupo(int idGrupo, DateTime fechaIni, DateTime fechaFin, int idTurno)
    {

        SqlParameter idGrupoGR = new SqlParameter("@idGrupoGR", idGrupo);
        SqlParameter inicio = new SqlParameter("@inicio", fechaIni);
        SqlParameter fin = new SqlParameter("@fin", fechaFin);
        SqlParameter turno = new SqlParameter("@turno", idTurno);


        SqlParameter[] para = { idGrupoGR, inicio, fin, turno };

        string sql = "INSERT INTO HISTORIALGRUPO (IDGRUPOGR, FECHAINICIO, FECHAFIN, IDTURNO) VALUES (@idGrupoGR, @inicio, @fin, @turno)";

        int filas = Datos.ejecutarComando(sql, para);
        if (filas != 0)
        { Datos.commit(); }
        return filas;
    }

    //Corresponde al CU Asignar Grupo 
    //Busca los grupos que estan disponibles o en turno y verifica 
    //que la hora actual este entre las horas del turno del grupo dispobible
    public int buscarGrupoDisponible()
    {
       String sql=" select ggr.idgrupo, t.idturno "+
                  " from grupoguardiareclamo ggr with(NOLOCK), historialgrupo hg with(NOLOCK), turno t with(NOLOCK) " +
                  " where ggr.idgrupo = hg.idgrupogr "+
                  " and hg.idturno = t.idturno "+
                  " and ggr.idestadoguardiareclamo in (1,3) "+
                  " and  getdate()  "+
                  " between convert(Datetime , CONVERT(VARCHAR(10), GETDATE(), 103) +' '+t.horainicio , 103)  "+
                  " and convert(Datetime , CONVERT(VARCHAR(10), GETDATE(), 103) +' '+t.horafin , 103)";

       int grupo = Datos.obtenerEscalar(sql);
       return grupo;
    }

    public void actualizarEstadoGROcupado(int idGR)
    {
        String sql = " update grupoguardiareclamo "+
                     " set idestadoguardiareclamo = 4 "+
                     " where idgrupo = "+idGR;

        Datos.ejecutarComando(sql);
    }
    public void actualizarEstadoGGR(int idGR, int estado)
    {
        String sql = " update grupoguardiareclamo " +
                     " set idestadoguardiareclamo =  " + estado + 
                     " where idgrupo = " + idGR;

        Datos.ejecutarComando(sql);
    }
    public int crearHistorialEmpleadoGRSuplente(int idEmpleado, DateTime fechaIni, DateTime fechaFin)
    {

        SqlParameter empleado = new SqlParameter("@empleado", idEmpleado);
        SqlParameter inicio = new SqlParameter("@inicio", fechaIni);
        SqlParameter fin = new SqlParameter("@fin", fechaFin);
        


        SqlParameter[] para = { empleado, inicio, fin };

        string sql = "INSERT INTO HISTORIALEMPLEADO (IDEMPLEADO, FECHAINICIO, FECHAFIN, IDCARGO) VALUES (@empleado, @inicio, @fin, 2)";

        int filas = Datos.ejecutarComando(sql, para);
        if (filas != 0)
        { Datos.commit(); }
        return filas;
    }

    public int existeEmpleadosParaGrupo(int mesDiagramacion, int añoDiagramacion)
    {
        SqlParameter mes = new SqlParameter("@mes", mesDiagramacion);
        SqlParameter año = new SqlParameter("@año", añoDiagramacion);

        SqlParameter[] para = { mes, año };

        String sql = "SELECT E.IDEMPLEADO " +
                     "FROM EMPLEADO E, PERSONA P " +
                     "WHERE E.IDTIPODOCUMENTO = P.TIPODOCUMENTO " +
                     "AND E.NRODOCUMENTO = P.NRODOCUMENTO " +
                     "AND E.IDCARGO = 2 " +
                     "AND E.IDEMPLEADO NOT IN (SELECT HE1.IDEMPLEADO  " +
                     "FROM HISTORIALEMPLEADO HE1 " +
                     "WHERE MONTH(HE1.FECHAINICIO) = @mes " +
                     "AND YEAR(HE1.FECHAINICIO) = @año)";

        int fila = Datos.obtenerEscalar(sql, para);

        return fila;

    }

    public int existeEmpleadosParaGrupo(DateTime inicio, DateTime fin)
    {
        SqlParameter fechaInicio = new SqlParameter("@fechaInicio", inicio);
        SqlParameter fechaFin = new SqlParameter("@fechaFin", fin);

        SqlParameter[] para = { fechaInicio, fechaFin };

        String sql = "SELECT E.IDEMPLEADO " +
                      "FROM EMPLEADO E, PERSONA P "+
                      "WHERE E.IDTIPODOCUMENTO = P.TIPODOCUMENTO "+
                      "AND E.NRODOCUMENTO = P.NRODOCUMENTO "+
                      "AND E.IDCARGO = 1 "+
                      "AND E.IDEMPLEADO NOT IN (SELECT E1.IDEMPLEADO "+
                      "FROM EMPLEADO E1, EMPLEADOPORGRUPOGR EXG, GRUPOPORTURNO GXT, TURNO T, HISTORIALGRUPO HG "+
					  "WHERE EXG.IDEMPLEADO = E1.IDEMPLEADO "+
					  "AND EXG.IDGRUPOGUADIARECLAMO = GXT.IDGRUPOGR "+
					  "AND GXT.IDTURNO = T.IDTURNO "+
					  "AND HG.IDGRUPOGR = EXG.IDGRUPOGUADIARECLAMO "+
					  "AND (@fechaInicio BETWEEN HG.FECHAINICIO AND HG.FECHAFIN "+
					  "OR @fechaFin BETWEEN HG.FECHAINICIO AND HG.FECHAFIN) "+
				      "OR (HG.FECHAFIN <= @fechaFin "+
					  "AND HG.FECHAINICIO >= @fechaInicio))";

        int fila = Datos.obtenerEscalar(sql, para);

        return fila;

    }

    public GrupoGuardiaReclamo existenGruposGR()
    {

        string sql = "SELECT DISTINCT IDGRUPOGR FROM HISTORIALGRUPO WHERE FECHAFIN >= GETDATE()";

        SqlDataReader dr = Datos.obtenerDataReader(sql);

        GrupoGuardiaReclamo gr = new GrupoGuardiaReclamo();
       
        while (dr.Read())
        {
            gr.IdGrupo = Convert.ToInt32(dr[0]);
        }

        dr.Close();
        return gr;
    }

    public List<Empleado> getEmpleadoXGrupo(int grupo)
    {

        SqlParameter idGrupo = new SqlParameter("@idGrupo", grupo);

        SqlParameter[] para = { idGrupo };

        String sql = "SELECT E.IDEMPLEADO, P.APELLIDO, P.NOMBRE " +
                     "FROM EMPLEADO E, PERSONA P, EMPLEADOPORGRUPOGR GXE " +
                     "WHERE GXE.IDEMPLEADO = E.IDEMPLEADO " +
                     "AND E.NRODOCUMENTO = P.NRODOCUMENTO " +
                     "AND E.IDTIPODOCUMENTO = P.TIPODOCUMENTO " +
                     "AND GXE.IDGRUPOGUADIARECLAMO = @idGrupo";


        SqlDataReader dr = Datos.obtenerDataReader(sql, para);

        List<Empleado> lista = new List<Empleado>();

        while (dr.Read())
        {
            Empleado e = new Empleado();

            e.IdEmpleado = Convert.ToInt32(dr[0]);
           e.ApellidoEmpleado = dr[1].ToString();
            e.NombreEmpleado = dr[2].ToString();

            lista.Add(e);
        }
        dr.Close();
        return lista;

    }
    public int buscarGrupoEnTurnoSegunEstado(int nroEstado)
    {
        SqlParameter p = new SqlParameter("@a", nroEstado);

        String sql = "select hg.idgrupogr" + 
        " from historialgrupo hg, turno t, grupoguardiareclamo ggr, vehiculo v, estadoguardiareclamo egr" + 
        " where hg.idturno = t.idturno" +
        " and hg.idgrupogr = ggr.idgrupo" +
        " and ggr.idvehiculo = v.idvehiculo" +
        " and ggr.idestadoguardiareclamo = egr.idestadoguardiareclamo" +
        " and convert(nvarchar(10), getdate(),103) between hg.fechainicio and hg.fechafin" +
        " and CONVERT(varchar(25), GETDATE(), 108) between t.horainicio and t.horafin" +
        " and ggr.idestadoguardiareclamo = @a";

        SqlDataReader dr = Datos.obtenerDataReader(sql, p);
        int nroGrupo = 0;

        while (dr.Read())
        {
            nroGrupo = Convert.ToInt32(dr[0]);
        }
        dr.Close();
        return nroGrupo;
    }
    public int verificarOTCPendienteGrupo(int nroGrupo)
    {
        SqlParameter p = new SqlParameter("@a", nroGrupo);

        String sql = "select otc.idordentrabajo" +
        " from ordentrabajocorrectivo otc, grupoguardiareclamo ggr" +
        " where otc.idguardiareclamo = ggr.idgrupo" +
        " and otc.idguardiareclamo = @a" +
        " and otc.idestadoot = 2"; //estado Pendiente

        SqlDataReader dr = Datos.obtenerDataReader(sql, p);
        int nroOTC = 0;

        while (dr.Read())
        {
            nroOTC = Convert.ToInt32(dr[0]);
        }

        dr.Close();
        return nroOTC;
    }
}
