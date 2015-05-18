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
/// Descripción breve de Empleados
/// </summary>
public class Empleados
{
	public Empleados()
	{
		
	}



    public int cambiarCategoria (int idEmpleado)
    {
        try
        {   
            string sql = "update empleado set idcargo = 1  WHERE idempleado = " + idEmpleado;
            int v = Datos.ejecutarComando(sql);
            return v;
        }
        catch (Exception ex)
        {
            throw ex;
        }
     }

    public int quitarOficialdeCuadrilla (int idEmpleado)
    {
        try
        {
            string sql = "delete from empleadoporcuadrilla where idempleado= " + idEmpleado;
            int v = Datos.ejecutarComando(sql);
            return v;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public int buscarCuadrilla (int idEmpleado)
    {
        try
        {
            string sql = "select idcuadrilla from empleadoporcuadrilla where idempleado= " + idEmpleado;
            int v = Datos.obtenerEscalar(sql);
            return v;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public int obtenerCargo(int idEmpleado)
    {
        try
        {
            string sql = "select idCargo from empleado where idempleado = " + idEmpleado;
            int v = Datos.obtenerEscalar(sql);
            return v;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public int cambiarCategoriaGRS(int idEmpleado)
    {
        try
        {
            string sql = "update empleado set idcargo = 2  WHERE idempleado = " + idEmpleado;
            int v = Datos.ejecutarComando(sql);
            return v;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public Empleado getEmpleado(int legajo)
    {
        String strSql = "SELECT E.IDEMPLEADO, P.APELLIDO, P.NOMBRE " +
                        "FROM EMPLEADO E, PERSONA P " +
                        "WHERE E.IDTIPODOCUMENTO=P.TIPODOCUMENTO " +
                        "AND E.NRODOCUMENTO=P.NRODOCUMENTO " +
                        "AND E.IDEMPLEADO = " + legajo;

        SqlDataReader sdr = Datos.obtenerDataReader(strSql);

        Empleado e = new Empleado();
        while (sdr.Read())
        {
            e.IdEmpleado = Convert.ToInt32(sdr[0]);
            e.ApellidoEmpleado = Convert.ToString(sdr[1]);
            e.NombreEmpleado = Convert.ToString(sdr[2]);
        }
        sdr.Close();
        return e;

    }
    public Empleado getCapataz(int nroGrupo)
    {
       String strSql = "SELECT E.IDEMPLEADO, P.APELLIDO, P.NOMBRE "+
            "FROM EMPLEADO E, EMPLEADOPORCUADRILLA EXC, PERSONA P "+
            "WHERE E.IDCARGO = 7 "+
            "AND E.IDTIPODOCUMENTO=P.TIPODOCUMENTO "+
            "AND E.NRODOCUMENTO=P.NRODOCUMENTO "+
            "AND EXC.IDEMPLEADO=E.IDEMPLEADO "+
            "AND EXC.IDCUADRILLA= " + nroGrupo;
        
        SqlDataReader sdr = Datos.obtenerDataReader(strSql);
       
        Empleado e = new Empleado();
        while (sdr.Read())
        {
            e.IdEmpleado = Convert.ToInt32(sdr[0]);
            e.ApellidoEmpleado = Convert.ToString(sdr[1]);
            e.NombreEmpleado = Convert.ToString(sdr[2]);
        }
        sdr.Close();
        return e;

    }

    public Empleado getOficial(int nroGrupo)
    {
        String strSql = "SELECT E.IDEMPLEADO, P.APELLIDO, P.NOMBRE " +
             "FROM EMPLEADO E, EMPLEADOPORCUADRILLA EXC, PERSONA P " +
             "WHERE E.IDCARGO = 3 " +
             "AND E.IDTIPODOCUMENTO=P.TIPODOCUMENTO " +
             "AND E.NRODOCUMENTO=P.NRODOCUMENTO " +
             "AND EXC.IDEMPLEADO=E.IDEMPLEADO " +
             "AND EXC.IDCUADRILLA= " + nroGrupo;

        SqlDataReader sdr = Datos.obtenerDataReader(strSql);

        Empleado e = new Empleado();
        while (sdr.Read())
        {
            e.IdEmpleado = Convert.ToInt32(sdr[0]);
            e.ApellidoEmpleado = Convert.ToString(sdr[1]);
            e.NombreEmpleado = Convert.ToString(sdr[2]);
        }
        sdr.Close();
        return e;

    }

    public Empleado getMedioOficial(int nroGrupo)
    {
        String strSql = "SELECT E.IDEMPLEADO, P.APELLIDO, P.NOMBRE " +
             "FROM EMPLEADO E, EMPLEADOPORCUADRILLA EXC, PERSONA P " +
             "WHERE E.IDCARGO = 4 " +
             "AND E.IDTIPODOCUMENTO=P.TIPODOCUMENTO " +
             "AND E.NRODOCUMENTO=P.NRODOCUMENTO " +
             "AND EXC.IDEMPLEADO=E.IDEMPLEADO " +
             "AND EXC.IDCUADRILLA= " + nroGrupo;

        SqlDataReader sdr = Datos.obtenerDataReader(strSql);

        Empleado e = new Empleado();
        while (sdr.Read())
        {
            e.IdEmpleado = Convert.ToInt32(sdr[0]);
            e.ApellidoEmpleado = Convert.ToString(sdr[1]);
            e.NombreEmpleado = Convert.ToString(sdr[2]);
        }
        sdr.Close();
        return e;

    }

    public Empleado getAyudante(int nroGrupo)
    {
        String strSql = "SELECT E.IDEMPLEADO, P.APELLIDO, P.NOMBRE " +
             "FROM EMPLEADO E, EMPLEADOPORCUADRILLA EXC, PERSONA P " +
             "WHERE E.IDCARGO = 5 " +
             "AND E.IDTIPODOCUMENTO=P.TIPODOCUMENTO " +
             "AND E.NRODOCUMENTO=P.NRODOCUMENTO " +
             "AND EXC.IDEMPLEADO=E.IDEMPLEADO " +
             "AND EXC.IDCUADRILLA= " + nroGrupo;

        SqlDataReader sdr = Datos.obtenerDataReader(strSql);

        Empleado e = new Empleado();
        while (sdr.Read())
        {
            e.IdEmpleado = Convert.ToInt32(sdr[0]);
            e.ApellidoEmpleado = Convert.ToString(sdr[1]);
            e.NombreEmpleado = Convert.ToString(sdr[2]);
        }
        sdr.Close();
        return e;

    }

    public Empleado getCapatazXLegajo(int idCapataz)
    {
        String strSql = "SELECT E.IDEMPLEADO, P.APELLIDO, P.NOMBRE " +
                        "FROM EMPLEADO E, PERSONA P " +
                        "WHERE E.IDTIPODOCUMENTO = P.TIPODOCUMENTO " +
                        "AND E.NRODOCUMENTO = P.NRODOCUMENTO " +
                        "AND E.IDEMPLEADO =" + idCapataz;

        SqlDataReader sdr = Datos.obtenerDataReader(strSql);

        Empleado e = new Empleado();
        while (sdr.Read())
        {
            e.IdEmpleado = Convert.ToInt32(sdr[0]);
            e.ApellidoEmpleado = Convert.ToString(sdr[1]);
            e.NombreEmpleado = Convert.ToString(sdr[2]);
        }
        sdr.Close();
        return e;

    }

    public Empleado getOficialXLegajo(int idOficial)
    {
        String strSql = "SELECT E.IDEMPLEADO, P.APELLIDO, P.NOMBRE " +
                        "FROM EMPLEADO E, PERSONA P " +
                        "WHERE E.IDTIPODOCUMENTO = P.TIPODOCUMENTO " +
                        "AND E.NRODOCUMENTO = P.NRODOCUMENTO " +
                        "AND E.IDEMPLEADO =" + idOficial;

        SqlDataReader sdr = Datos.obtenerDataReader(strSql);

        Empleado e = new Empleado();
        while (sdr.Read())
        {
            e.IdEmpleado = Convert.ToInt32(sdr[0]);
            e.ApellidoEmpleado = Convert.ToString(sdr[1]);
            e.NombreEmpleado = Convert.ToString(sdr[2]);
        }
        sdr.Close();
        return e;

    }

    public Empleado getMedioOficialXLegajo(int idMedioOficial)
    {
        String strSql = "SELECT E.IDEMPLEADO, P.APELLIDO, P.NOMBRE " +
                        "FROM EMPLEADO E, PERSONA P " +
                        "WHERE E.IDTIPODOCUMENTO = P.TIPODOCUMENTO " +
                        "AND E.NRODOCUMENTO = P.NRODOCUMENTO " +
                        "AND E.IDEMPLEADO =" + idMedioOficial;

        SqlDataReader sdr = Datos.obtenerDataReader(strSql);

        Empleado e = new Empleado();
        while (sdr.Read())
        {
            e.IdEmpleado = Convert.ToInt32(sdr[0]);
            e.ApellidoEmpleado = Convert.ToString(sdr[1]);
            e.NombreEmpleado = Convert.ToString(sdr[2]);
        }
        sdr.Close();
        return e;

    }

    public Empleado getAyudanteXLegajo(int idAyudante)
    {
        String strSql = "SELECT E.IDEMPLEADO, P.APELLIDO, P.NOMBRE " +
                        "FROM EMPLEADO E, PERSONA P " +
                        "WHERE E.IDTIPODOCUMENTO = P.TIPODOCUMENTO " +
                        "AND E.NRODOCUMENTO = P.NRODOCUMENTO " +
                        "AND E.IDEMPLEADO =" + idAyudante;

        SqlDataReader sdr = Datos.obtenerDataReader(strSql);

        Empleado e = new Empleado();
        while (sdr.Read())
        {
            e.IdEmpleado = Convert.ToInt32(sdr[0]);
            e.ApellidoEmpleado = Convert.ToString(sdr[1]);
            e.NombreEmpleado = Convert.ToString(sdr[2]);
        }
        sdr.Close();
        return e;

    }
    

}
