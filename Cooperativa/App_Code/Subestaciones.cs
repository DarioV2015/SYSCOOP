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
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Data.Odbc;

/// <summary>
/// Descripción breve de Subestaciones
/// </summary>
public class Subestaciones
{
	public Subestaciones()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public int insertarSubestacion(Marcador m)
    {
        String sqlMax = "select max(idsubestacion) from subestacion";
        int max = Datos.obtenerMayor(sqlMax);
        int nroDom = Datos.getDomicilios().buscarDomicilio(m.Domicilio.NombreCalle, Convert.ToSingle(m.Domicilio.NroCalle));
        if (nroDom != 0)
        {
            String insert = "insert into subestacion (idsubestacion,iddomicilio) values (@idsubestacion, @iddomicilio)";
            SqlParameter idsubestacion = new SqlParameter("@idsubestacion", max);
            SqlParameter piddomicilio = new SqlParameter("@iddomicilio", nroDom);
            //SqlParameter pfecha = new SqlParameter("@fecha", DateTime.Now);

            SqlParameter[] para = { idsubestacion, piddomicilio };

            return Datos.ejecutarComando(insert, para);
        }
        else
        {
            String sql = "select max(idcalle) from calle";
            int maxCalle = Datos.obtenerMayor(sql);
            Calle c = new Calle();
            c.IdCalle = maxCalle;
            c.NombreCalle = m.Domicilio.NombreCalle;
            Datos.getDomicilios().crearCalle(c);
            m.Domicilio.IdDomicilio = Datos.getDomicilios().obtenerUltimoIdDomicilio();
            m.Domicilio.IdZona = 1;
            m.Domicilio.IdCalle = maxCalle;
            m.Domicilio.Latitud = m.Latitud;
            m.Domicilio.Longitud = m.Longitud;
            m.Domicilio.Dpto = "0";
            Datos.getDomicilios().crearDomicilio(m.Domicilio);

            String insert = "insert into subestacion (idsubestacion,iddomicilio) values (@idsubestacion, @iddomicilio)";
            SqlParameter idsubestacion = new SqlParameter("@idsubestacion", max);
            SqlParameter piddomicilio = new SqlParameter("@iddomicilio", m.Domicilio.IdDomicilio);
            //SqlParameter pfecha = new SqlParameter("@fecha", DateTime.Now);

            SqlParameter[] para = { idsubestacion, piddomicilio };

            return Datos.ejecutarComando(insert, para);
        }
        return 0;
    }

    public List<Subestacion> buscarSubestacionesZona(String idzona)
    {
        String sql = " select s.idsubestacion, s.descripcion, s.iddomicilio "+
                     " from subestacion s, domicilio d " +
                     " where s.iddomicilio = d.iddomicilio "+
                     " and d.idzona = "+idzona;

        SqlDataReader sdr = Datos.obtenerDataReader(sql);
        List<Subestacion> subestaciones = new List<Subestacion>();
        while (sdr.Read())
        {
            Subestacion s = new Subestacion();
            s.Idsubestacion = Convert.ToInt32(sdr["idsubestacion"].ToString());
            s.Descripcion = sdr["descripcion"].ToString();
            Domicilio d = new Domicilio();
            s.Domicilio = d;
            s.Domicilio = Datos.getDomicilios().getDomicilio(Convert.ToInt32(sdr["iddomicilio"].ToString()));
            subestaciones.Add(s);
        }
        sdr.Close();
        return subestaciones;
    }

    public Subestacion buscarSubestacionesDomicilio(String iddomicilio)
    {
        String sql = " select s.idsubestacion, s.descripcion, s.iddomicilio " +
                     " from subestacion s, domicilio d " +
                     " where s.iddomicilio = d.iddomicilio " +
                     " and d.iddomicilio = " + iddomicilio;

        SqlDataReader sdr = Datos.obtenerDataReader(sql);
        Subestacion s = new Subestacion();
        while (sdr.Read())
        {
            s.Idsubestacion = Convert.ToInt32(sdr["idsubestacion"].ToString());
            s.Descripcion = sdr["descripcion"].ToString();
            s.Domicilio = Datos.getDomicilios().getDomicilio(Convert.ToInt32(sdr["iddomicilio"].ToString()));
        }
        sdr.Close();
        return s;
    }

    public Subestacion buscarSubestacionesId(String id)
    {
        String sql = " select s.idsubestacion, s.descripcion, s.iddomicilio " +
                     " from subestacion s, domicilio d " +
                     " where s.iddomicilio = d.iddomicilio " +
                     " and d.idsubestacion = " + id;

        SqlDataReader sdr = Datos.obtenerDataReader(sql);
        Subestacion s = new Subestacion();
        while (sdr.Read())
        {
            s.Idsubestacion = Convert.ToInt32(sdr["idsubestacion"].ToString());
            s.Descripcion = sdr["descripcion"].ToString();
            s.Domicilio = Datos.getDomicilios().getDomicilio(Convert.ToInt32(sdr["iddomicilio"].ToString()));
        }
        sdr.Close();
        return s;
    }


    public List<Marcador> buscarSubestaciones()
    {
        String consultaSubestaciones = " select s.idsubestacion, d.latitud, d.longitud, i.descripcion, c.nombre, d.nrocalle from subestacion s with(NOLOCK), domicilio d  with(NOLOCK), imagenes i, calle c  with(NOLOCK) "+
                                " where s.iddomicilio = d.iddomicilio and i.id = 4 "+ 
                                " and d.idcalle = c.idcalle ;";
        //SqlConnection con = Conexion.ObtenerConexion();

        DataSet consulta = Datos.obtenerDataset(consultaSubestaciones, "subestaciones"); //Conexion.ObtenerDataset(consultaMedidores, con,"medidores");
        SqlDataReader drSub = Datos.obtenerDataReader(consultaSubestaciones); //Conexion.obtenerDataReader(consultaMedidores, con);
        //String a = consulta.Tables["medidores"].Count();
        List<Marcador> subestaciones = new List<Marcador>();

        while (drSub.Read())
        {
            Marcador m = new Marcador();
            m.Id = drSub["idsubestacion"].ToString();
            m.Latitud = drSub["LATITUD"].ToString();
            m.Longitud = drSub["LONGITUD"].ToString();
            m.Imagen = drSub["descripcion"].ToString();
            Domicilio d = new Domicilio();
            d.NombreCalle = drSub["NOMBRE"].ToString();
            d.NroCalle = Convert.ToSingle(drSub["NROCALLE"]);
            m.Domicilio = d;
            m.EsNuevo = "N";
            subestaciones.Add(m);
        }
        drSub.Close();
        return subestaciones;
    }

}
