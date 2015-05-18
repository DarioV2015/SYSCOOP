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
/// Summary description for Class1
/// </summary>
public class Conexion
{
    private static Conexion instance;
    private SqlConnection DBConection;
    private SqlTransaction transaccion;
    private SqlCommand cmd;

	private Conexion()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static Conexion Instance
    {
        get
        {
            if (instance == null)
            {
                instance = new Conexion();
            }
            return instance;
        }
    }

    public SqlCommand Command
    {
        get
        {
            if (cmd == null)
            {
                cmd = new SqlCommand();
                if (cmd.Transaction == null)
                {
                    cmd.Transaction = Transaccion;
                }
            }
            return cmd;
        }
    }

    private SqlTransaction Transaccion
    {
        get
        {
            if (transaccion == null || Coneccion == null)
            {
                transaccion = Coneccion.BeginTransaction();

                this.Command.Transaction = Transaccion;
            }
            return transaccion;
        }
        set { transaccion = value; }
    }

    private SqlConnection Coneccion
    {
        get
        {
            if (DBConection == null || DBConection.State !=  ConnectionState.Open)
            {
                try
                {
                    String nombrePC = System.Environment.MachineName;
                    DBConection = new SqlConnection(ConfigurationManager.ConnectionStrings["LOCAL"].ConnectionString.ToString());
                    DBConection.Open();
                }
                catch (Exception e)
                {
                    Console.Write(e);
                }
            }
            return DBConection;
        }
    }

    public int ejecutarComando(string strSQL, SqlParameter[] id)
    {
        cmd = new SqlCommand(strSQL, Coneccion);
        for (int i = 0; i < id.Length; i++)
        {
            cmd.Parameters.Add(id[i]);
        }

        cmd.Transaction = Transaccion;

        try
        {
            int v = cmd.ExecuteNonQuery();
            return v;
        }
        catch (Exception err)
        {
            return 0;
        }

    }

    public int ejecutarComando(string strSQL, List<SqlParameter> id)
    {
        cmd = new SqlCommand(strSQL, Coneccion);
        SqlParameter[] arr = id.ToArray();
        cmd.Transaction = Transaccion;

        for (int i = 0; i < arr.Length; i++)
        {
            cmd.Parameters.Add(arr[i]);
        }
         
       

        try
        {
            int v = cmd.ExecuteNonQuery();
            return v;
        }
        catch (Exception err)
        {
            return 0;
        }

    }

    public int ejecutarComando(string strSQL, SqlParameter id)
    {
        try
        {
            cmd = new SqlCommand(strSQL, Coneccion);
            cmd.Transaction = Transaccion;
            cmd.Parameters.Add(id);
            int v = cmd.ExecuteNonQuery();
            return v;
        }
        catch (Exception e)
        {
            return 0;
        }
    }

    public int ejecutarComando(string strSQL)
    {
        try
        {
            cmd = new SqlCommand(strSQL, Coneccion);
            cmd.Transaction = Transaccion;
            int v = cmd.ExecuteNonQuery();
            return v;
        }
        catch (Exception e)
        {
            return 0;
        }
    }

    public SqlDataReader obtenerDataReader(string strSQL, SqlParameter id)
    {

        cmd = new SqlCommand(strSQL, Coneccion);
        cmd.Transaction = Transaccion;
        cmd.Parameters.Add(id);
        SqlDataReader dr = cmd.ExecuteReader();
        //dr.Close();
        return dr;

    }

    public SqlDataReader obtenerDataReader(string strSQL, SqlParameter[] id)
    {
        try
        {
            cmd = new SqlCommand(strSQL, Coneccion);
            cmd.Transaction = Transaccion;
            for (int i = 0; i < id.Length; i++)
            {
                cmd.Parameters.Add(id[i]);
            }
            // cmd = new SqlCommand(strSQL, Coneccion);
            // cmd.Parameters.Add(id);
            SqlDataReader dr = cmd.ExecuteReader();
            //dr.Close();
            return dr;
        }
        catch (Exception e)
        {
            Console.Write(e);
            return null;
        }

    }

    public SqlDataReader obtenerDataReader(string strSQL, List<SqlParameter> id)
    {
        cmd = new SqlCommand(strSQL, Coneccion);
        cmd.Transaction = Transaccion;
        SqlParameter[] arr = id.ToArray();

        for (int i = 0; i < arr.Length; i++)
        {
            cmd.Parameters.Add(arr[i]);
        }
        // cmd = new SqlCommand(strSQL, Coneccion);
        // cmd.Parameters.Add(id);
        SqlDataReader dr = cmd.ExecuteReader();
        //dr.Close();
        return dr;

    }


    public SqlDataReader obtenerDataReader(String strSQL)
    {

        SqlCommand cmd = new SqlCommand(strSQL, Coneccion);
        cmd.Transaction = Transaccion;
        SqlDataReader dr = cmd.ExecuteReader();
        //dr.Close();
        return dr;

    }

     public DataSet obtenerDataset(String strSQL, String dataTable)
    {
        cmd = new SqlCommand(strSQL, Coneccion);
        cmd.Transaction = Transaccion;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds,dataTable);
        return ds;
   
    }

     public SqlDataAdapter obtenerDataAdapter(String strSQL)
     {
         cmd = new SqlCommand(strSQL, Coneccion);
         cmd.Transaction = Transaccion;
         SqlDataAdapter da = new SqlDataAdapter(cmd);
         return da;

     }

     public DataTable getTable(String sql)
     {
         cmd = new SqlCommand(sql,Coneccion);
         cmd.Transaction = Transaccion;
         SqlDataAdapter da = new SqlDataAdapter(cmd);
         DataTable dt = new DataTable();
         da.Fill(dt);
         return dt;
     }

    public void commit()
    {
        try
        {
           Transaccion.Commit();
           Transaccion = Coneccion.BeginTransaction();
        }
        catch (Exception err)
         {
            try
            {
                Transaccion.Rollback();
            }
            catch (Exception e)
            {
                Console.Write(e);
            }
        }
    }

    public void rollback()
    {
        try
        {
            Transaccion.Rollback();
        }
        catch (Exception err)
        {
            Console.Write(err);
        }
    }
          
}
