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
/// Descripción breve de Proveedores
/// </summary>
public class Proveedores
{
    public int obtenerUltimoIdProveedor()
    {
        string sql = "select max(IDPROVEEDOR) from PROVEEDOR";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }

    public int actualizarFechFinProveedor(int idProveedor)
    {
        String sql = "UPDATE PROVEEDOR SET FECHABAJA = GETDATE() WHERE IDPROVEEDOR = " + idProveedor;

        int filas = Datos.ejecutarComando(sql);

        return filas;
    }

    public int actualizarProveedor(int idProveedor)
    {
        String sql = "UPDATE PROVEEDOR SET  FECHAALTA = GETDATE(), FECHABAJA = NULL WHERE IDPROVEEDOR = " + idProveedor;

        int filas = Datos.ejecutarComando(sql);

        return filas;
    }

    public int crearProveedor(int idProveedor, long cuitEmpresa)
    {

        SqlParameter id = new SqlParameter("@id", idProveedor);
        SqlParameter cuit = new SqlParameter("@cuit", cuitEmpresa);

        SqlParameter[] para = { id, cuit };

        string sql = "INSERT INTO PROVEEDOR (IDPROVEEDOR, CUIT, FECHAALTA) VALUES (@id, @cuit, GETDATE())";

        int filas = Datos.ejecutarComando(sql, para);

        return filas;
    }

    public int existeProveedor(long cuit)
    {
        SqlParameter p = new SqlParameter("@a", cuit);
        SqlParameter[] para = { p };


        string sql = "SELECT IDPROVEEDOR FROM PROVEEDOR WHERE CUIT = @a";

        int id = Datos.obtenerEscalar(sql, para);

        return id;
    }

    public Proveedor elProveedorEstaDadoDeBaja(int idProveedor)
    {
        SqlParameter p = new SqlParameter("@a", idProveedor);
        string sql = "SELECT FECHABAJA FROM PROVEEDOR WHERE IDPROVEEDOR = @a";


        SqlDataReader dr = Datos.obtenerDataReader(sql, p);

        Proveedor prov = new Proveedor();

        while (dr.Read())
        {
            prov.FechaBaja = Convert.ToDateTime(dr[0]);
        }

        dr.Close();
        return prov;

    }
    
    
    
    
    
    public Proveedores()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
