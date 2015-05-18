using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Collections.Generic;


/// <summary>
/// Descripción breve de Seguridad
/// </summary>
public class Seguridad
{

    public Seguridad()
    {

        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    public static bool ValidarUsuario(string usuario, string password)
    {
        String SQL = "SELECT idUsuario FROM Usuario WHERE nombreusuario = '" + usuario + "' and contraseña = '" + password + "' ";
        int a = Datos.obtenerEscalar(SQL);

        if (a > 0)
        {
            return true;
        }
        else
        {
            return false;
        }

        //TODO: Implementar
        //Devuelve verdadero si existe una fila con el nombre de usuario + password ingresados como parámetros
    }
    
    public static String ObtenerRoles(String usuario)
    {
        String sql = " SELECT r.descripcion "+
                     " FROM Usuario u , rol r "+
                     " WHERE u.idrol = r.idrol "+
                     " and u.nombreusuario = '" + usuario+"'";
        
        SqlDataReader sdr = Datos.obtenerDataReader(sql);
        String rol = null;
        while (sdr.Read())
        {
            rol = sdr["descripcion"] == null ? "SINROL" : sdr["descripcion"].ToString();
        }
        return rol;

    }

    public static DatosUsuario buscarDatos(String usuario)
    {
        String rol = ObtenerRoles(usuario);
        DatosUsuario datos = null; 

        if (rol.ToUpper().Equals("GUARDIA"))
        {
            datos = new DatosUsuario();
            String sqlGuardia = " select u.nombreusuario,   r.descripcion rolusuario, e.idempleado legajo, g.idgrupo, u.idusuario, u.contraseña "+
                                " from usuario u, grupoguardiareclamo g, empleado e, empleadoporgrupogr exg, rol r "+
                                " where u.idusuario = e.idusuario "+
                                " and g.idgrupo = exg.idgrupoguadiareclamo "+
                                " and e.idempleado = exg.idempleado "+
                                " and r.idrol = u.idrol "+
                                " and UPPER(u.nombreusuario) = UPPER('" + usuario + "')";

            SqlDataReader sdr = Datos.obtenerDataReader(sqlGuardia);

            while(sdr.Read())
            {
                datos.Usuario = sdr["nombreusuario"] == null ? "SINUSUARIO" : sdr["nombreusuario"].ToString();
                datos.Rol = sdr["rolusuario"] == null ? "SINUSUARIO" : sdr["rolusuario"].ToString();
                datos.Legajo = sdr["legajo"] == null ? "SINUSUARIO" : sdr["legajo"].ToString();
                datos.NroGuardia = sdr["idgrupo"] == null ? "SINUSUARIO" : sdr["idgrupo"].ToString();
                datos.IdUsuario = sdr["idusuario"] == null ? "SINUSUARIO" : sdr["idusuario"].ToString();
                datos.Password = sdr["contraseña"] == null ? "SINUSUARIO" : sdr["contraseña"].ToString();
                
            }

            sdr.Close();
        }
        else if (rol.ToUpper().Equals("SOCIO"))
        {
            datos = new DatosUsuario();
            String sqlSocio = "select u.nombreusuario, r.descripcion rolusuario, s.idsocio nrosocio, u.contraseña, u.idusuario" +
                                " from usuario u, socio s, rol r "+
                                " where u.idusuario = s.idusuario "+
                                " and u.idrol = r.idrol "+
                                " and UPPER(u.nombreusuario) = UPPER('" + usuario + "')";

            SqlDataReader sdr = Datos.obtenerDataReader(sqlSocio);

            while (sdr.Read())
            {
                datos.Usuario = sdr["nombreusuario"] == null ? "SINUSUARIO" : sdr["nombreusuario"].ToString();
                datos.Rol = sdr["rolusuario"] == null ? "SINUSUARIO" : sdr["rolusuario"].ToString();
                datos.NroSocio = sdr["nrosocio"] == null ? "SINUSUARIO" : sdr["nrosocio"].ToString();
                datos.Password = sdr["contraseña"] == null ? "SINUSUARIO" : sdr["contraseña"].ToString();
                datos.IdUsuario = sdr["idusuario"] == null ? "SINUSUARIO" : sdr["idusuario"].ToString();
            }

            sdr.Close();
        }

        else if (rol.ToUpper().Equals("CAPATAZ"))
        {
            datos = new DatosUsuario();
            String sqlCapataz = "select u.nombreusuario,r.descripcion rolusuario, e.idempleado legajo, c.idcuadrilla, u.idusuario, u.contraseña " +
                               " from usuario u, cuadrilla c, empleado e, rol r, empleadoporcuadrilla ec " +
                               " where u.idusuario = e.idusuario " +
                               " and e.idempleado = ec.idempleado " +
                               " and c.idcuadrilla = ec.idcuadrilla " +
                               " and r.idrol = u.idrol " +
                               " and UPPER(u.nombreusuario) = UPPER('" + usuario + "')";

            SqlDataReader sdr = Datos.obtenerDataReader(sqlCapataz);

            while (sdr.Read())
            {
                datos.Usuario = sdr["nombreusuario"] == null ? "SINUSUARIO" : sdr["nombreusuario"].ToString();
                datos.Rol = sdr["rolusuario"] == null ? "SINUSUARIO" : sdr["rolusuario"].ToString();
                datos.Legajo = sdr["legajo"] == null ? "SINUSUARIO" : sdr["legajo"].ToString();
                datos.NroCuadrilla = sdr["idcuadrilla"] == null ? "SINUSUARIO" : sdr["idcuadrilla"].ToString();
                datos.IdUsuario = sdr["idusuario"] == null ? "SINUSUARIO" : sdr["idusuario"].ToString();
                datos.Password = sdr["contraseña"] == null ? "SINUSUARIO" : sdr["contraseña"].ToString();

            }

            sdr.Close();
        }


        else if (rol.ToUpper().Equals("JEFEREDES"))
        {
            datos = new DatosUsuario();
            String sqlCapataz = "select u.nombreusuario, r.descripcion rolusuario, e.idempleado legajo, u.idusuario, u.contraseña "+
                                " from usuario u, empleado e,rol r "+
                                " where u.idusuario = e.idusuario "+
                                " and r.idrol = u.idrol "+
                                " and r.idrol=3 "+
                                " and UPPER(u.nombreusuario) = UPPER('" + usuario + "')";

            SqlDataReader sdr = Datos.obtenerDataReader(sqlCapataz);

            while (sdr.Read())
            {
                datos.Usuario = sdr["nombreusuario"] == null ? "SINUSUARIO" : sdr["nombreusuario"].ToString();
                datos.Rol = sdr["rolusuario"] == null ? "SINUSUARIO" : sdr["rolusuario"].ToString();
                datos.Legajo = sdr["legajo"] == null ? "SINUSUARIO" : sdr["legajo"].ToString();
                datos.IdUsuario = sdr["idusuario"] == null ? "SINUSUARIO" : sdr["idusuario"].ToString();
                datos.Password = sdr["contraseña"] == null ? "SINUSUARIO" : sdr["contraseña"].ToString();

            }
               sdr.Close();
        }
           else if (rol.ToUpper().Equals("JEFEDISTRIBUCION"))
           {
               datos = new DatosUsuario();
            String sqlCapataz = "select u.nombreusuario, r.descripcion rolusuario, e.idempleado legajo, u.idusuario, u.contraseña "+
                                " from usuario u, empleado e,rol r "+
                                " where u.idusuario = e.idusuario "+
                                " and r.idrol = u.idrol "+
                                " and r.idrol=4 "+
                                " and UPPER(u.nombreusuario) = UPPER('" + usuario + "')";

            SqlDataReader sdr = Datos.obtenerDataReader(sqlCapataz);

            while (sdr.Read())
            {
                datos.Usuario = sdr["nombreusuario"] == null ? "SINUSUARIO" : sdr["nombreusuario"].ToString();
                datos.Rol = sdr["rolusuario"] == null ? "SINUSUARIO" : sdr["rolusuario"].ToString();
                datos.Legajo = sdr["legajo"] == null ? "SINUSUARIO" : sdr["legajo"].ToString();
                datos.IdUsuario = sdr["idusuario"] == null ? "SINUSUARIO" : sdr["idusuario"].ToString();
                datos.Password = sdr["contraseña"] == null ? "SINUSUARIO" : sdr["contraseña"].ToString();

            }
            sdr.Close();
           }

        else if (rol.ToUpper().Equals("ADMINISTRATIVO"))
        {
            datos = new DatosUsuario();
            String sqlCapataz = "select u.nombreusuario, r.descripcion rolusuario, e.idempleado legajo, u.idusuario, u.contraseña " +
                                " from usuario u, empleado e,rol r " +
                                " where u.idusuario = e.idusuario " +
                                " and r.idrol = u.idrol " +
                                " and r.idrol=6 " +
                                " and UPPER(u.nombreusuario) = UPPER('" + usuario + "')";

            SqlDataReader sdr = Datos.obtenerDataReader(sqlCapataz);

            while (sdr.Read())
            {
                datos.Usuario = sdr["nombreusuario"] == null ? "SINUSUARIO" : sdr["nombreusuario"].ToString();
                datos.Rol = sdr["rolusuario"] == null ? "SINUSUARIO" : sdr["rolusuario"].ToString();
                datos.Legajo = sdr["legajo"] == null ? "SINUSUARIO" : sdr["legajo"].ToString();
                datos.IdUsuario = sdr["idusuario"] == null ? "SINUSUARIO" : sdr["idusuario"].ToString();
                datos.Password = sdr["contraseña"] == null ? "SINUSUARIO" : sdr["contraseña"].ToString();

            }
            sdr.Close();
        }

         


        return datos;
    }

    public static int cambiarContraseña(String idUsuario, String contraseña)
    {
        String sql = "update usuario set contraseña = '"+contraseña+"' where idusuario = "+idUsuario;
        int u = Datos.ejecutarComando(sql);
        if(u > 0)
        {
            Datos.commit();
        }
        return u;
    }

    public static int insertarUsuario(String nombreusuario, String contraseña, String idrol)
    {
        String sql = "insert into usuario (idusuario, nombreusuario,contraseña, idrol) values (@p1,@p2,@p3,@p4)";
        List<SqlParameter> param = new List<SqlParameter>();

        int maxid = Datos.obtenerMayor("select max(idusuario) from usuario ");

        param.Add(new SqlParameter("@p1", maxid));
        param.Add(new SqlParameter("@p2", nombreusuario));
        param.Add(new SqlParameter("@p3", contraseña));
        param.Add(new SqlParameter("@p4", idrol));
        int u = Datos.ejecutarComando(sql,param);

        if (u > 0)
            return maxid;

        return u;
    }
}
