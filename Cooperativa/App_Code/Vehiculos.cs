using System;
using System.Data;
using System.Configuration;
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
/// Descripción breve de Vehiculos
/// </summary>
public class Vehiculos
{
    public int crearHistorialVehiculoCuadrilla(int idVehiculo, DateTime fechaInicio, DateTime fechaFin, int idCuadrilla, int estado)
    {

        SqlParameter idVeh = new SqlParameter("@idVeh", idVehiculo);
        SqlParameter inicio = new SqlParameter("@inicio", fechaInicio);
        SqlParameter fin = new SqlParameter("@fin", fechaFin);
        SqlParameter idCuarilla = new SqlParameter("@idCuarilla", idCuadrilla);
        SqlParameter idEstado = new SqlParameter("@idEstado", estado);

        SqlParameter[] para = { idVeh, inicio, fin, idCuarilla, idEstado };

        string sql = "INSERT INTO HISTORIALVEHICULO (IDVEHICULO, FECHAINICIO, FECHAFIN, IDESTADO, IDCUADRILLA) "+
                        "VALUES (@idVeh, @inicio, @fin, @idEstado, @idCuarilla)";

        int filas = Datos.ejecutarComando(sql, para);

        return filas;
    }
   
    public int actualizarEstadoHISTORIALVehiculo(int idVehiculo, DateTime fechaFin, DateTime fechaInicio, int estado)
    {
        String sql = "UPDATE HISTORIALVEHICULO SET FECHAFIN = @b, IDESTADO = @c WHERE IDVEHICULO = @d AND FECHAINICIO= @a";
        List<SqlParameter> param = new List<SqlParameter>();
        
        param.Add(new SqlParameter("@a", fechaInicio));
        param.Add(new SqlParameter("@b", fechaFin));
        param.Add(new SqlParameter("@c", estado));
        param.Add(new SqlParameter("@d", idVehiculo));

        int filas = Datos.ejecutarComando(sql, param);
               
        return filas;
    }
    
    
    public Vehiculo traerVehiculo(int idCuadrilla)
    {
        
        SqlParameter cuadrilla = new SqlParameter("@cuadrilla", idCuadrilla);

        SqlParameter[] para = { cuadrilla };

        string sql = "SELECT V.IDVEHICULO, V.MARCA, V.DOMINIO FROM VEHICULO V, HISTORIALVEHICULO HV "+
                    "WHERE HV.IDVEHICULO=V.IDVEHICULO "+
                    "AND HV.IDCUADRILLA= @cuadrilla " +
                    "AND HV.IDESTADO = 2";


        SqlDataReader dr = Datos.obtenerDataReader(sql, para);

        Vehiculo v = new Vehiculo();
        

        while (dr.Read())
        {
           
            v.IdVehiculo = Convert.ToInt32(dr[0]);
            v.Marca = Convert.ToString(dr[1]);
            v.Dominio = Convert.ToString(dr[2]);
            
        }

        dr.Close();
        return v;

    }

    
    public Vehiculos()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
