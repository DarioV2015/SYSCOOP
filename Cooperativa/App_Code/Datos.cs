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
/// Descripción breve de Datos
/// </summary>
public class Datos
{
    private static Conexion con = Conexion.Instance;

    public static Medidores getMedidores()
    {
            return (new Medidores()); 
    }

    public static Lineas getLineas()
    {
        return (new Lineas());
    }

    public static Postes getPostes()
    {
        return (new Postes());
    }

    public static Subestaciones getSubestaciones()
    {
        return (new Subestaciones());
    }

    public static Mediciones getMediciones()
    {
        return (new Mediciones());
    }

    public static PedidosInstalacion getPedidosInstalacion()
    {
            return (new PedidosInstalacion()); 
    }

    public static GruposGuardiaReclamo getGrupoGuardiaReclamo()
    {
        return (new GruposGuardiaReclamo());
    }

    public static Herramientas getHerramienta()
    {
        return (new Herramientas());
    }

    public static Socios getSocios()
    {
            return (new Socios()); 
    }

    public static Domicilios getDomicilios()
    {
        return (new Domicilios());
    }
    public static Artefactos getArtefactos()
    {
        return (new Artefactos());
    }
    public static Calles getCalles()
    {
        return (new Calles());
    }

    public static SocioEmpresa getSocioEmpresa()
    {
        return (new SocioEmpresa());
    }

    public static SociosEmpresa getSociosEmpresa()
    {
        return (new SociosEmpresa());
    }
   
    public static Calle getCalle()
    {
        return (new Calle());
    }

    
    public static TiposMedidor getTipoMedidor()
    {
        return (new TiposMedidor());
    }

    public static Personas getPersonas()
    {
        return (new Personas());
    }

    public static Consumos getConsumos()
    {
        return (new Consumos());
    }
    
    //public static Domicilios getDomicilios()
    //{
    //    return (new Domicilios());
    //}

    public static TipoArtefactos getTipoArtefactos()
    {
        return (new TipoArtefactos());
    }

    public static OrdenesInstalacionMedidor getOrdenInstalacion()
    {
        return (new OrdenesInstalacionMedidor());
    }
    public static ResultadosInstalacion getResultadoInstalacion()
    {
        return (new ResultadosInstalacion());
    }
    public static TipoReclamos getTipoReclamo()
    {
        return (new TipoReclamos());
    }
    public static ProblemasYSoluciones getProbYSol()
    {
        return (new ProblemasYSoluciones());
    }
    public static OTC getOTC()
    {
        return (new OTC());
    }

    public static Reclamos getReclamos()
    {
        return (new Reclamos());
    }


    public static DetalleOTC getDetalleOTC()
    {
        return (new DetalleOTC());
    }
    public static Empleados getEmpleados()
    {
        return (new Empleados());
    }
    public static HistorialesGrupoGR getHistorial()
    {
        return (new HistorialesGrupoGR());
    }
    public static DetalleInsumo getDetalleInsumo()
    {
        return (new DetalleInsumo());
    }
    public static HerramientaPorOTC getHerramientaPorOTC()
    {
        return (new HerramientaPorOTC());
    }
    public static Insumos getInsumo()
    {
        return (new Insumos());
    }
    public static Actividades getActividades()
    {
        return (new Actividades());
    }
    public static Tareas getTarea()
    {
        return (new Tareas());
    }
    public static Mails getMails()
    {
        return (new Mails());
    }
    public static Cuadrillas getCuadrillas()
    {
        return (new Cuadrillas());
    }
    public static Proveedores getProveedores()
    {
        return (new Proveedores());
    }
    public static DomiciliosExternos getDomiciliosExternos()
    {
        return (new DomiciliosExternos());
    }
    public static Empresas getEmpresa()
    {
        return (new Empresas());
    }

    public static OTP getOTP()
    {
        return (new OTP());
    }

    public static Zonas getZonas()
    {
        return (new Zonas());
    }
    public static Avisos getAvisos()
    {
        return (new Avisos());
    }
    public static Contratos getContratos()
    {
        return (new Contratos());
    }
    public static TareasPlanificadas getTareasPlanificadas()
    {
        return (new TareasPlanificadas());
    }
    public static Vehiculos getVehiculos()
    {
        return (new Vehiculos());
    }
    public static Cortes getCortes()
    {
        return (new Cortes());
    }

    public static PedidoInsumos getPedidoInsumos()
    {
        return (new PedidoInsumos());
    }
	public Datos()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public static void combo(String query,DropDownList dll)
    {
     
        DataSet ds = con.obtenerDataset(query, "combo");
        dll.DataSource=ds;
        dll.DataValueField = Convert.ToString(ds.Tables["combo"].Columns[0]);
        dll.DataTextField = Convert.ToString(ds.Tables["combo"].Columns[1]);
        dll.DataBind();

       // return dl;
    }

    public static int obtenerMayor(string sql)
    {
        SqlDataReader dr = null;
        try
        {
            dr = Datos.obtenerDataReader(sql);
            int max = 1;
            while (dr.Read())
            {
                //max = dr[0].ToString() == "" ? Convert.ToInt32(dr[0]) : 0;
                if (dr[0].GetType() == Type.GetType("System.DBNull"))
                    max = -1;
                else
                    max = Convert.ToInt32(dr[0].ToString());
            }

            dr.Close();

            if (max == null || max == -1)
                return 1;
            else
                return max + 1;
        }
        catch (Exception e)
        {
            return 0;
        }
    }

    public static int obtenerEscalar(string sql, SqlParameter[] param)
    {
        SqlDataReader dr = null;
        try
        {
             dr = Datos.obtenerDataReader(sql,param );
            int max = 0;
            while (dr.Read())
            {
                max = Convert.ToInt32(dr[0]);
            }

            dr.Close();

            if (max == null || max == -1)
                return 1;
            else
                return max;

            
        }
        catch (Exception e)
        {
            return 0;
        }
    }

    public static void commit()
    {
        con.commit();
    }

    public static void rollback()
    {
        con.rollback();
    }

    public static int ejecutarComando(string strSQL, SqlParameter[] id)
    {
        return con.ejecutarComando(strSQL, id);
    }

    public static int ejecutarComando(string strSQL)
    {
        return con.ejecutarComando(strSQL);
    }

    public static int ejecutarComando(string strSQL, SqlParameter id)
    {
        return con.ejecutarComando(strSQL, id);
    }

    public static int ejecutarComando(string strSQL, List<SqlParameter> id)
    {
        return con.ejecutarComando(strSQL, id);
    }

    public static SqlDataReader obtenerDataReader(String strSQL, SqlParameter[] id)
    {
        return con.obtenerDataReader(strSQL,id);

    }

    public static SqlDataReader obtenerDataReader(String strSQL)
    {
        return con.obtenerDataReader(strSQL);

    }

    public static SqlDataReader obtenerDataReader(String strSQL, SqlParameter id)
    {
        return con.obtenerDataReader(strSQL,id);

    }

    public static SqlDataReader obtenerDataReader(String strSQL, List<SqlParameter> id)
    {
        return con.obtenerDataReader(strSQL, id);

    }

    public static DataSet obtenerDataset(String strSQL, String dataTable)
    {
        return con.obtenerDataset(strSQL,dataTable);
    }

    public static int obtenerEscalar(string sql)
    {
        SqlDataReader dr = null;
        try
        {
            dr = Datos.obtenerDataReader(sql);
            int max = -1;
            while (dr.Read())
            {
                max = Convert.ToInt32(dr[0]);
            }

            dr.Close();

            if (max == null || max == -1)
                return -1;
            else
                return max;


        }
        catch (Exception e)
        {
            return -1;
        }
    }
    public static string recuperarPassword(int idUsuario)
    {
        String sql = "select u.contraseña" +
        " from usuario u" +
        " where u.idusuario = " + idUsuario;

        SqlDataReader d = Datos.obtenerDataReader(sql);

        string password = ""; 

        while (d.Read())
        {
            password = d[0].ToString();
        }

        d.Close();

        return password;
    }
}
 