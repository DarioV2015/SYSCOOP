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
/// Descripción breve de OrdenesInstalacionMedidor
/// </summary>
public class OrdenesInstalacionMedidor
{
    public int obtenerUltimoNroOrden()
    {
        string sql = "select max(idordeninstalacion) from OrdenInstalacion";
        //int ultimoNro = Datos.obtenerMayor(sql, Conexion.ObtenerConexion());
        //SqlConnection con = Datos.crearConexion(ConfigurationManager.ConnectionStrings["HP-PC"].ConnectionString);
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }

    public bool crearOrdenInstalacion(OrdenInstalacionMedidor oi)
    {
              
        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", oi.NroOrden));
        param.Add(new SqlParameter("@b", oi.NroPedido));
        param.Add(new SqlParameter("@c", oi.FechaInst));
        param.Add(new SqlParameter("@d", oi.IdGrupo));
        param.Add(new SqlParameter("@e", oi.IdEstado));

        string sql = "INSERT INTO ORDENINSTALACION " +
           "(IDORDENINSTALACION, IDPEDIDOINSTALACION, FECHAINSTALACION, IDGRUPOGR, IDESTADOORDEN) " +
           "VALUES (@a, @b, @c, @d, @e)";

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

        if (filas == 1)
        {   Datos.commit(); 
            return true;
        }
        else
        {
            return false;
        }
    }

    public int actualizarOrden(int estado, int resultado, int idOrden)
    {
        string sql = "UPDATE ORDENINSTALACION SET IDESTADOORDEN = " + estado + "," + 
        " IDRESULTADOINST = " + resultado +
        " WHERE IDORDENINSTALACION = " + idOrden;
        int v = Datos.ejecutarComando(sql);
        return v;
    }
    
    
    
    public OrdenesInstalacionMedidor()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
