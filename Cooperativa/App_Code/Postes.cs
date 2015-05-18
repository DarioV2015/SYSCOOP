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
using System.Data.OleDb;
using System.Data.Odbc;

/// <summary>
/// Descripción breve de Postes
/// </summary>
public class Postes
{
	public Postes()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public int insertarPoste(Marcador m)
    {
        String sqlMax = "select max(idposte) from poste";
        int max = Datos.obtenerMayor(sqlMax);
        int nroDom = Datos.getDomicilios().buscarDomicilio(m.Domicilio.NombreCalle, Convert.ToSingle(m.Domicilio.NroCalle));
        if (nroDom != 0)
        {
            String insert = "insert into Poste (idposte,iddomicilio,fechaalta) values (@idposte, @iddomicilio, @fecha)";
            SqlParameter pidposte = new SqlParameter("@idposte", max);
            SqlParameter piddomicilio = new SqlParameter("@iddomicilio", nroDom);
            SqlParameter pfecha = new SqlParameter("@fecha", DateTime.Now);

            SqlParameter[] para = { pidposte, piddomicilio, pfecha };

            return Datos.ejecutarComando(insert, para);
        }
        else
        {
            Calle calle = Datos.getCalles().getCalleXNombre(m.Domicilio.NombreCalle);
            if (calle.IdCalle == 0)
            {
                String sql = "select max(idcalle) from calle";
                int maxCalle = Datos.obtenerMayor(sql);
                Calle c = new Calle();
                c.IdCalle = maxCalle;
                c.NombreCalle = m.Domicilio.NombreCalle;
                Datos.getDomicilios().crearCalle(c);
                calle = c;
            }
            m.Domicilio.IdDomicilio = Datos.getDomicilios().obtenerUltimoIdDomicilio();
            //m.Domicilio.IdZona = 1;
            m.Domicilio.IdCalle = calle.IdCalle;
            m.Domicilio.Latitud = m.Latitud;
            m.Domicilio.Longitud = m.Longitud;
            m.Domicilio.Dpto = "0";
            Datos.getDomicilios().crearDomicilio(m.Domicilio);

            String insert = "insert into Poste (idposte,iddomicilio,fechaalta) values ("+max+", "+m.Domicilio.IdDomicilio+", getDate())";
            //SqlParameter pidposte = new SqlParameter("@idposte", max);
            //SqlParameter piddomicilio = new SqlParameter("@iddomicilio", m.Domicilio.IdDomicilio);
            //SqlParameter pfecha = new SqlParameter("@fecha", DateTime.Now);

            //SqlParameter[] para = { pidposte, piddomicilio, pfecha };
        //    SqlParameter[] para = {  pfecha };
            Archivo a = new Archivo();
            a.guardarLinea(insert); 
            return Datos.ejecutarComando(insert);
        }
        return 0;
    }

    public List<Marcador> buscarPostes()
    {
        String consultaPostes = " select p.idposte, d.latitud, d.longitud, i.descripcion, c.nombre, d.nrocalle from poste p with(NOLOCK), domicilio d  with(NOLOCK), imagenes i, calle c  with(NOLOCK)" +
                                  "  where p.iddomicilio = d.iddomicilio and i.id = 3 "+
                                  " and d.idcalle = c.idcalle "+
                                  " order by 1";
        //SqlConnection con = Conexion.ObtenerConexion();

        //DataSet consulta = Datos.obtenerDataset(consultaPostes, "postes"); //Conexion.ObtenerDataset(consultaMedidores, con,"medidores");
        SqlDataReader drPostes = Datos.obtenerDataReader(consultaPostes); //Conexion.obtenerDataReader(consultaMedidores, con);
        //String a = consulta.Tables["medidores"].Count();
        List<Marcador> postes = new List<Marcador>();

        while (drPostes.Read())
        {
            Marcador m = new Marcador();
            m.Id = drPostes["IDPOSTE"].ToString();
            m.Latitud = drPostes["LATITUD"].ToString();
            m.Longitud = drPostes["LONGITUD"].ToString();
            m.Imagen = drPostes["descripcion"].ToString();
            Domicilio d = new Domicilio();
            d.NombreCalle = drPostes["NOMBRE"].ToString();
            d.NroCalle = Convert.ToSingle(drPostes["NROCALLE"]);
            m.Domicilio = d;
            m.EsNuevo = "N";
            postes.Add(m);
        }
        drPostes.Close();
        return postes;
    }

    public int eliminarPoste(String id)
    {
        String sqlDelete = "delete from poste where idposte = "+id;
        return Datos.ejecutarComando(sqlDelete);
    }

    public int updateUbicacionPoste(Marcador m)
    {
       // String sqlMax = "select max(idposte) from poste";
       // int max = Datos.obtenerMayor(sqlMax) + 1;
        int nroDom = Datos.getDomicilios().buscarDomicilio(m.Domicilio.NombreCalle, Convert.ToSingle(m.Domicilio.NroCalle));
        if (nroDom != 0)
        {
            String insert = "update Poste set iddomicilio = @iddomicilio where idposte = @idposte";
            SqlParameter pidposte = new SqlParameter("@idposte", m.Id);
            SqlParameter piddomicilio = new SqlParameter("@iddomicilio", nroDom);

            SqlParameter[] para = { pidposte, piddomicilio};

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

            String insert = "update Poste set iddomicilio = @iddomicilio where idposte = @idposte";
            SqlParameter pidposte = new SqlParameter("@idposte", m.Id);
            SqlParameter piddomicilio = new SqlParameter("@iddomicilio", m.Domicilio.IdDomicilio);

            SqlParameter[] para = { pidposte, piddomicilio};

            return Datos.ejecutarComando(insert, para);
        }
        return 0;
    }

    public List<Marcador> buscarTodosPostes()
    {
        String consultaPostes = " select distinct p.idposte, d.latitud, d.longitud, i.descripcion, c.nombre, d.nrocalle, d.idzona, l.idlinea " +
                                " from poste p with(NOLOCK), domicilio d  with(NOLOCK), imagenes i, calle c  with(NOLOCK), tramolinea tl, linea l "+
                                " where p.iddomicilio = d.iddomicilio  "+
                                " and tl.idposteinicio = p.idposte "+
                                " and tl.idtramolinea = l.idtramolinea "+
                                " and i.id = 3  "+
                                " and d.idcalle = c.idcalle  "+
                                " union "+
                                " select distinct p.idposte, d.latitud, d.longitud, i.descripcion, c.nombre, d.nrocalle, d.idzona, l.idlinea " +
                                " from poste p with(NOLOCK), domicilio d  with(NOLOCK), imagenes i, calle c  with(NOLOCK), tramolinea tl, linea l "+
                                " where p.iddomicilio = d.iddomicilio  "+
                                " and tl.idpostefin = p.idposte "+
                                " and tl.idtramolinea = l.idtramolinea "+
                                " and i.id = 3  "+
                                " and d.idcalle = c.idcalle ";
        //SqlConnection con = Conexion.ObtenerConexion();

        //DataSet consulta = Datos.obtenerDataset(consultaPostes, "postes"); //Conexion.ObtenerDataset(consultaMedidores, con,"medidores");
        SqlDataReader drPostes = Datos.obtenerDataReader(consultaPostes); //Conexion.obtenerDataReader(consultaMedidores, con);
        //String a = consulta.Tables["medidores"].Count();
        List<Marcador> postes = new List<Marcador>();

        while (drPostes.Read())
        {
            Marcador m = new Marcador();
            m.Id = drPostes["IDPOSTE"].ToString();
            m.Latitud = drPostes["LATITUD"].ToString();
            m.Longitud = drPostes["LONGITUD"].ToString();
            m.Imagen = drPostes["descripcion"].ToString();
            m.IdLinea = drPostes["idlinea"].ToString();
            Domicilio d = new Domicilio();
            d.NombreCalle = drPostes["NOMBRE"].ToString();
            d.NroCalle = Convert.ToSingle(drPostes["NROCALLE"]);
            d.IdZona = Convert.ToSingle(drPostes["idzona"].ToString());
            m.Domicilio = d;
            m.EsNuevo = "N";
            postes.Add(m);
        }
        drPostes.Close();
        return postes;
    }


}
