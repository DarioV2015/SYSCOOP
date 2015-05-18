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
/// Descripción breve de Cuadrillas
/// </summary>
public class Cuadrillas
{
    public int buscaridCuadrilla(int idCuadrilla)
    {
        SqlParameter cuadrilla = new SqlParameter("@cuadrilla", idCuadrilla);
       
        SqlParameter[] para = { cuadrilla };

        String sql = "SELECT C.IDCUADRILLA FROM CUADRILLA C, ORDENTRABAJOPREVENTIVO OTP "+
                        "WHERE C.IDCUADRILLA = OTP.IDCUADRILLA "+
                        "AND (OTP.FECHAINICIO >= GETDATE() OR OTP.FECHAFIN = NULL) "+
                        "AND C.IDCUADRILLA = @cuadrilla";

        int id = Datos.obtenerEscalar(sql, para);

        return id;

    }

    public int buscaridVehiculo(int idCuadrilla, DateTime fechaInicio)
    {
        SqlParameter cuadrilla = new SqlParameter("@cuadrilla", idCuadrilla);
        SqlParameter fecha = new SqlParameter("@fecha", fechaInicio);

        SqlParameter[] para = { cuadrilla, fecha };

        String sql = "SELECT IDVEHICULO FROM HISTORIALVEHICULO WHERE FECHAINICIO = @fecha AND IDCUADRILLA=@cuadrilla";

        int id = Datos.obtenerEscalar(sql, para);

        return id;

    }

    public List<Cuadrilla> getCuadrillas()
    {
        List<Cuadrilla> lista = new List<Cuadrilla>();
        
        String strSql = "SELECT IDCUADRILLA FROM CUADRILLA WHERE IDESTADOCUADRILLA=1";

        SqlDataReader sdr = Datos.obtenerDataReader(strSql);

        while (sdr.Read())
        {
            Cuadrilla c = new Cuadrilla();
            c.IdCuadrilla = Convert.ToInt32(sdr[0]);
            
            lista.Add(c);
        }
        sdr.Close();
        return lista;

    }
    
    public List<Cuadrilla> getCuadrillas(int mes, int año)
    {
        SqlParameter nroMes = new SqlParameter("@nroMes", mes);
        SqlParameter nroAño = new SqlParameter("@nroAño", año);

        SqlParameter[] para = { nroMes, nroAño };

        List<Cuadrilla> lista = new List<Cuadrilla>();

        String strSql = "SELECT DISTINCT(HC.IDCUADRILLA)FROM HISTORIALCUADRILLA HC "+
                        "WHERE MONTH(HC.FECHAINICIO)=@nroMes AND YEAR(HC.FECHAINICIO)=@nroAño AND HC.IDESTADOCUADRILLA=1";

        SqlDataReader sdr = Datos.obtenerDataReader(strSql,para);

        while (sdr.Read())
        {
            Cuadrilla c = new Cuadrilla();
            c.IdCuadrilla = Convert.ToInt32(sdr[0]);

            lista.Add(c);
        }
        sdr.Close();
        return lista;

    }

    public List<Cuadrilla> getCuadrillasAsignadaONueva()
    {
        List<Cuadrilla> lista = new List<Cuadrilla>();

        String strSql = "SELECT IDCUADRILLA FROM CUADRILLA WHERE IDESTADOCUADRILLA=1 OR IDESTADOCUADRILLA=2";

        SqlDataReader sdr = Datos.obtenerDataReader(strSql);

        while (sdr.Read())
        {
            Cuadrilla c = new Cuadrilla();
            c.IdCuadrilla = Convert.ToInt32(sdr[0]);

            lista.Add(c);
        }
        sdr.Close();
        return lista;

    }

    public int actualizarEstadoCuadrillABaja(int idCuadrilla, DateTime fechaBaja, DateTime fechaInicio)
    {
        String sql = " UPDATE HISTORIALCUADRILLA SET IDESTADOCUADRILLA = 3, FECHAFIN = @p1 WHERE IDCUADRILLA = @p3 AND FECHAINICIO = @p2";
        List<SqlParameter> param = new List<SqlParameter>();
        param.Add(new SqlParameter("@p1", fechaBaja));
        param.Add(new SqlParameter("@p2", fechaInicio));
        param.Add(new SqlParameter("@p3", idCuadrilla));

        int filas = Datos.ejecutarComando(sql,param);
        
        return filas;
    }

    public int actualizarEstadoHistorialHerramientaASIGNADA(DateTime fechaInicio, int estado, int cuadrilla)
    {
        String sql = "UPDATE HISTORIALHERRAMIENTA SET IDESTADOHERRAMIENTA = 2 WHERE FECHAINICIO = @p1 AND NROCUADRILLA = @p2 AND IDESTADOHERRAMIENTA = 3";
        List<SqlParameter> param = new List<SqlParameter>();
        param.Add(new SqlParameter("@p1", fechaInicio));
        
        param.Add(new SqlParameter("@p3", cuadrilla));
       
        int filas = Datos.ejecutarComando(sql,param);

        return filas;
    }
    public int actualizarSOLOEstadoCuadrillABaja(int idCuadrilla)
    {
        String sql = " UPDATE CUADRILLA SET IDESTADOCUADRILLA = 3 WHERE IDCUADRILLA = " + idCuadrilla;
        
        int filas = Datos.ejecutarComando(sql);

        return filas;
    }

    public int actualizarSOLOEstadoCuadrillAALTA(int idCuadrilla)
    {
        String sql = " UPDATE CUADRILLA SET IDESTADOCUADRILLA = 1 WHERE IDCUADRILLA = " + idCuadrilla;

        int filas = Datos.ejecutarComando(sql);

        return filas;
    }
    public int actualizarEstadoCuadrillaALTA(int idCuadrilla, DateTime fechaInicio)
    {
        String sql = " UPDATE HISTORIALCUADRILLA SET IDESTADOCUADRILLA = 1 WHERE IDCUADRILLA = " + idCuadrilla +" AND FECHAINICIO = '"+fechaInicio+"'";

        int filas = Datos.ejecutarComando(sql);

        return filas;
    }

    public int actualizarFinHistorialVehiculo(int idVehiculo, DateTime fechaInicio, DateTime fechaFin)
    {
        String sql = "UPDATE HISTORIALVEHICULO SET FECHAFIN= @p1 WHERE IDVEHICULO = @p3 AND FECHAINICIO= @p2";
        List<SqlParameter> param = new List<SqlParameter>();
        param.Add(new SqlParameter("@p1", fechaFin));
        param.Add(new SqlParameter("@p2", fechaInicio));
        param.Add(new SqlParameter("@p3", idVehiculo));

        int filas = Datos.ejecutarComando(sql,param);
        
        return filas;
    }

    public int actualizarEstadoVehiculoAAsignada(int idVehiculo)
    {
        String sql = "UPDATE VEHICULO SET IDESTADO = 2 WHERE IDVEHICULO = " + idVehiculo;

        int filas = Datos.ejecutarComando(sql);
        
        return filas;
    }

    public int actualizarEstadoHerramientaAAsignada(int idHerramienta)
    {
        String sql = "UPDATE HERRAMIENTA SET ESTADOHERRAMIENTA = 2 WHERE IDHERRAMIENTA =" + idHerramienta;

        int filas = Datos.ejecutarComando(sql);
        
        return filas;
    }

    public int actualizarFechFinHerramienta(int idHerramienta, int idCuadrilla, DateTime fechaFin)
    {
        String sql = "UPDATE HERRAMIENTAXCUADRILLA SET FECHAFIN = " + fechaFin + " WHERE IDHERRAMIENTA = " + idHerramienta + " AND IDCUADRILLA = " + idCuadrilla;

        int filas = Datos.ejecutarComando(sql);

        return filas;
    }
    public int eliminarHerramientaXCuadrilla(int idHerramienta, int idCuadrilla, DateTime fechaInicio)
    {
        String sql = "DELETE FROM HERRAMIENTAXCUADRILLA WHERE IDHERRAMIENTA = " + idHerramienta + " AND IDCUADRILLA = " + idCuadrilla+" AND FECHAINICIO="+fechaInicio;

        int filas = Datos.ejecutarComando(sql);

        return filas;
    }

    public int actualizarFechFinHistorialHerramienta(int idHerramienta, int idCuadrilla, int mes, int año)
    {
        String sql = "UPDATE HISTORIALHERRAMIENTA SET FECHAFIN = GETDATE() " +
                        "WHERE IDCUADRILLA= " + idCuadrilla +
                        " AND  IDHERRAMIENTA= " + idHerramienta +
                        " AND MONTH(FECHAINICIO)= " + mes +
                        " AND YEAR(FECHAINICIO)=" + año +
                        " AND (IDESTADOHERRAMIENTA=2 OR IDESTADOHERRAMIENTA=2)";

        int filas = Datos.ejecutarComando(sql);

        return filas;
    }

    public int eliminarHistorialHerramienta(int idHerramienta, int idCuadrilla, int mes, int año)
    {
        String sql = "DELETE FROM HISTORIALHERRAMIENTA "+
                      "WHERE IDHERRAMIENTA= "+idHerramienta+
	                  " AND MONTH(FECHAINICIO)= "+mes+
	                  " AND YEAR(FECHAINICIO)="+año+
	                  " AND NROCUADRILLA="+idCuadrilla+
	                  " AND IDESTADOHERRAMIENTA=2";

        int filas = Datos.ejecutarComando(sql);

        return filas;
    }

    public int actualizarEstadoHistorialVehiculo(DateTime fechaInicio, int idCuadrilla)
    {
        String sql = "UPDATE HISTORIALVEHICULO SET IDESTADO = 2 WHERE FECHAINICIO = '"+fechaInicio+"' AND IDCUADRILLA = "+idCuadrilla+" AND IDESTADO = 3";

        int filas = Datos.ejecutarComando(sql);

        return filas;
    }



    public int obtenerUltimoNroCuadrilla()
    {
        string sql = "select max(IDCUADRILLA) from CUADRILLA";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }
    
    public int crearCuadrilla(int idCuadrilla)
    {

        SqlParameter cuadrilla = new SqlParameter("@idCuadrilla", idCuadrilla);

        SqlParameter[] para = { cuadrilla };

        string sql = "INSERT INTO CUADRILLA (IDCUADRILLA, IDESTADOCUADRILLA) VALUES (@idCuadrilla, 1)";

        int filas = Datos.ejecutarComando(sql, para);
        
        return filas;
    }

    public int insertarEmpleadoXCuadrilla(int legajo, int idCuadrilla)
    {

        SqlParameter empleado = new SqlParameter("@legajo", legajo);
        SqlParameter cuadrilla = new SqlParameter("@idCuadrilla", idCuadrilla);

        SqlParameter[] para = { empleado, cuadrilla };

        string sql = "INSERT INTO EMPLEADOPORCUADRILLA (IDEMPLEADO, IDCUADRILLA) VALUES (@legajo, @idCuadrilla)";

        int filas = Datos.ejecutarComando(sql, para);
        
        return filas;
    }

    public int insertarHerramientaXCuadrilla(int idHerramienta, int idCuadrilla)
    {

        SqlParameter herramienta = new SqlParameter("@herramienta", idHerramienta);
        SqlParameter cuadrilla = new SqlParameter("@idCuadrilla", idCuadrilla);

        SqlParameter[] para = { herramienta, cuadrilla };

        string sql = "INSERT INTO HERRAMIENTAXCUADRILLA (IDHERRAMIENTA, IDCUADRILLA, FECHAINICIO) VALUES (@herramienta, @idCuadrilla,GETDATE())";

        int filas = Datos.ejecutarComando(sql, para);
       
        return filas;
    }
   
    public int actualizarHerramientaXCuadrilla(int idCuadrilla, int idHerramienta, DateTime fechaFin)
    {
        String sql = "UPDATE HERRAMIENTAXCUADRILLA SET FECHAFIN = @p2 WHERE IDHERRAMIENTA = @p3 AND IDCUADRILLA = @p1";
        List<SqlParameter> param = new List<SqlParameter>();
        param.Add(new SqlParameter("@p1", idCuadrilla));
        param.Add(new SqlParameter("@p2", fechaFin));
        param.Add(new SqlParameter("@p3", idHerramienta));
        
        int filas = Datos.ejecutarComando(sql, param);

       
        return filas;
    }

    public List<Herramienta> getHerramientaXCuadrilla(int idCuadrilla, int mes, int año)
    {
        List<Herramienta> lista = new List<Herramienta>();

        String strSql = "SELECT H.IDHERRAMIENTA, H.DESCRIPCION, H.NROLOTE, CONVERT (char(10), H.FECHAVENCIMIENTO, 103) " +
                        "FROM HERRAMIENTA H, HISTORIALHERRAMIENTA HH " +
                        "WHERE H.IDHERRAMIENTA = HH.IDHERRAMIENTA " +
                        "AND (MONTH(HH.FECHAINICIO) = " + mes + ") " +
                        "AND (YEAR(HH.FECHAINICIO) = " + año + ") " +
                        "AND (HH.NROCUADRILLA = " + idCuadrilla + ") " +
                        "AND (HH.IDESTADOHERRAMIENTA = 2 OR HH.IDESTADOHERRAMIENTA=1)";

        SqlDataReader sdr = Datos.obtenerDataReader(strSql);

        while (sdr.Read())
        {
            Herramienta h = new Herramienta();
            h.NroHerramienta = Convert.ToInt32(sdr[0]);
            h.Descripcion = Convert.ToString(sdr[1]);
            h.NroLote=Convert.ToInt32(sdr[2]);
            h.FechaVencimiento=Convert.ToDateTime(sdr[3]);

            lista.Add(h);
        }
        sdr.Close();
        return lista;

    }

    public int actualizarVehiculoXCuadrilla(int idCuadrilla, int idVehiculo)
    {
        String sql = "UPDATE CUADRILLA SET  IDVEHICULO =" + idVehiculo + " WHERE IDCUADRILLA =" + idCuadrilla;

        int filas = Datos.ejecutarComando(sql);
      
        return filas;
    }
    
    public Cuadrillas()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}



    public List<Empleado> llenarComboCapataz(int mes, int año)
    {
        SqlParameter nroMes = new SqlParameter("@nroMes", mes);
        SqlParameter nroAño = new SqlParameter("@nroAño", año);

        SqlParameter[] para = { nroMes, nroAño };

        List<Empleado> lista = new List<Empleado>();

        String strSql = "SELECT E.IDEMPLEADO FROM EMPLEADO E WHERE E.IDCARGO = 7 " +
                        "AND E.IDEMPLEADO NOT IN (SELECT E1.IDEMPLEADO " +
                        "FROM EMPLEADO E1, EMPLEADOPORCUADRILLA EXC, CUADRILLA C, HISTORIALCUADRILLA HC " +
                        "WHERE E1.IDEMPLEADO = EXC.IDEMPLEADO " +
                        "AND EXC.IDCUADRILLA = C.IDCUADRILLA " +
                        "AND HC.IDCUADRILLA = C.IDCUADRILLA " +
                        "AND  MONTH(HC.FECHAINICIO)= @nroMes " +
                        "AND YEAR(HC.FECHAFIN)= @nroAño "+
                        "AND HC.IDESTADOCUADRILLA = 1) ";

        SqlDataReader sdr = Datos.obtenerDataReader(strSql,para);
        while (sdr.Read())
        {
            Empleado e = new Empleado();
            e.IdEmpleado = Convert.ToInt32(sdr[0]);

            lista.Add(e);
        }
        
        sdr.Close();
        return lista;

    }

    public List<Empleado> llenarComboOficial(int mes, int año)
    {
        SqlParameter nroMes = new SqlParameter("@nroMes", mes);
        SqlParameter nroAño = new SqlParameter("@nroAño", año);

        SqlParameter[] para = { nroMes, nroAño };

        List<Empleado> lista = new List<Empleado>();

        String strSql = "SELECT E.IDEMPLEADO FROM EMPLEADO E WHERE E.IDCARGO = 3 " +
                        "AND E.IDEMPLEADO NOT IN (SELECT E1.IDEMPLEADO " +
                        "FROM EMPLEADO E1, EMPLEADOPORCUADRILLA EXC, CUADRILLA C, HISTORIALCUADRILLA HC " +
                        "WHERE E1.IDEMPLEADO = EXC.IDEMPLEADO " +
                        "AND EXC.IDCUADRILLA = C.IDCUADRILLA " +
                        "AND HC.IDCUADRILLA = C.IDCUADRILLA " +
                        "AND  MONTH(HC.FECHAINICIO)= @nroMes " +
                        "AND YEAR(HC.FECHAFIN)= @nroAño " +
                        "AND HC.IDESTADOCUADRILLA = 1) ";

        SqlDataReader sdr = Datos.obtenerDataReader(strSql,para);
        while (sdr.Read())
        {
            Empleado e = new Empleado();
            e.IdEmpleado = Convert.ToInt32(sdr[0]);

            lista.Add(e);
        }

        sdr.Close();
        return lista;
    }


    public List<Empleado> llenarComboMedioOficial(int mes, int año)
    {
        SqlParameter nroMes = new SqlParameter("@nroMes", mes);
        SqlParameter nroAño = new SqlParameter("@nroAño", año);

        SqlParameter[] para = { nroMes, nroAño };

        List<Empleado> lista = new List<Empleado>();

        String strSql = "SELECT E.IDEMPLEADO FROM EMPLEADO E WHERE E.IDCARGO = 4 " +
                        "AND E.IDEMPLEADO NOT IN (SELECT E1.IDEMPLEADO " +
                        "FROM EMPLEADO E1, EMPLEADOPORCUADRILLA EXC, CUADRILLA C, HISTORIALCUADRILLA HC " +
                        "WHERE E1.IDEMPLEADO = EXC.IDEMPLEADO " +
                        "AND EXC.IDCUADRILLA = C.IDCUADRILLA " +
                        "AND HC.IDCUADRILLA = C.IDCUADRILLA " +
                        "AND  MONTH(HC.FECHAINICIO)= @nroMes " +
                        "AND YEAR(HC.FECHAFIN)= @nroAño " +
                        "AND HC.IDESTADOCUADRILLA = 1) ";

        SqlDataReader sdr = Datos.obtenerDataReader(strSql,para);
        while (sdr.Read())
        {
            Empleado e = new Empleado();
            e.IdEmpleado = Convert.ToInt32(sdr[0]);

            lista.Add(e);
        }

        sdr.Close();
        return lista;
    }

    public List<Empleado> llenarComboAyudante(int mes, int año)
    {
        SqlParameter nroMes = new SqlParameter("@nroMes", mes);
        SqlParameter nroAño = new SqlParameter("@nroAño", año);

        SqlParameter[] para = { nroMes, nroAño };

        List<Empleado> lista = new List<Empleado>();

        String strSql = "SELECT E.IDEMPLEADO FROM EMPLEADO E WHERE E.IDCARGO = 5 " +
                        "AND E.IDEMPLEADO NOT IN (SELECT E1.IDEMPLEADO " +
                        "FROM EMPLEADO E1, EMPLEADOPORCUADRILLA EXC, CUADRILLA C, HISTORIALCUADRILLA HC " +
                        "WHERE E1.IDEMPLEADO = EXC.IDEMPLEADO " +
                        "AND EXC.IDCUADRILLA = C.IDCUADRILLA " +
                        "AND HC.IDCUADRILLA = C.IDCUADRILLA " +
                        "AND  MONTH(HC.FECHAINICIO)= @nroMes " +
                        "AND YEAR(HC.FECHAFIN)= @nroAño " +
                        "AND HC.IDESTADOCUADRILLA = 1) ";

        SqlDataReader sdr = Datos.obtenerDataReader(strSql,para);
        while (sdr.Read())
        {
            Empleado e = new Empleado();
            e.IdEmpleado = Convert.ToInt32(sdr[0]);

            lista.Add(e);
        }

        sdr.Close();
        return lista;
    }
   
    
    public int actualizarEstadoCuadrillABaja2(int idCuadrilla, DateTime fechaInicio)
    {
        String sql = " UPDATE HISTORIALCUADRILLA SET IDESTADOCUADRILLA = 3 WHERE IDCUADRILLA = " + idCuadrilla + " AND IDESTADOCUADRILLA = 1";

        int filas = Datos.ejecutarComando(sql);

        return filas;
    }

    public int crearHistorialCuadrilla(int idCuadrilla, DateTime fechaInicio, DateTime fechaFin, int idEstado)
    {

        SqlParameter cuadrilla = new SqlParameter("@idCuadrilla", idCuadrilla);
        SqlParameter inicio = new SqlParameter("@inicio", fechaInicio);
        SqlParameter fin = new SqlParameter("@fin", fechaFin);
        SqlParameter estado = new SqlParameter("@estado", idEstado);

        SqlParameter[] para = { cuadrilla, inicio, fin, estado };

        string sql = "INSERT INTO HISTORIALCUADRILLA  (IDCUADRILLA, FECHAINICIO, FECHAFIN, IDESTADOCUADRILLA) VALUES (@idCuadrilla, @inicio, @fin, @estado)";

        int filas = Datos.ejecutarComando(sql, para);

        return filas;
    }

   /*public Cuadrilla getHistorialCuadrillas(int cuadrilla)
    {
        
        Cuadrilla c = new Cuadrilla();
        
       String strSql = "";

        SqlDataReader sdr = Datos.obtenerDataReader(strSql);

        while (sdr.Read())
        {
            c.FechaInicio = Convert.ToDateTime(sdr[]);
            c.FechaFin=Convert.ToDateTime(sdr[]);
            
        }
        sdr.Close();
        return c;

    }*/
}





