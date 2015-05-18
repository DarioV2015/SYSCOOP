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
/// Descripción breve de Lineas
/// </summary>
public class Lineas
{
	public Lineas()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}


    public Marcador[] obtenerLineas(String idlinea)
    {
        String sqlLineas = "select l.idlinea linea, t.idtramolinea tramo, psi.idposte postei, domi.latitud lati, domi.longitud loni, psf.idposte postef, domf.latitud latf, domf.longitud lonf "+
            " from linea l, tramolinea t, poste psi, poste psf, domicilio domi, domicilio domf "+
            " where l.idtramolinea = t.idtramolinea "+
            " and t.idposteinicio = psi.idposte "+
            " and t.idpostefin = psf.idposte "+
            " and domi.iddomicilio = psi.iddomicilio "+
            " and domf.iddomicilio = psf.iddomicilio "+
            " and l.idlinea = "+idlinea+ 
            " order by linea asc, tramo asc";

      //  SqlDataReader sdr = Datos.obtenerDataReader(sqlLineas);
        DataSet lineas = Datos.obtenerDataset(sqlLineas, "lineas"); 
        Marcador[] medidores;
        List<Marcador> listMarc = new List<Marcador>();
            int i = 1;
            
        DataTable dt = lineas.Tables[0];

   foreach (DataRow row in dt.Rows)
{

    Marcador m = new Marcador();
    m.Id = row["postei"].ToString();
    m.Latitud = row["lati"].ToString();
    m.Longitud = row["loni"].ToString();
    if (dt.Rows.Count == i)
    {
        m.Id = row["postef"].ToString();
        m.Latitud = row["latf"].ToString();
        m.Longitud = row["lonf"].ToString();
    }

    listMarc.Add(m);
       i++;

}


        //consulta.Tables["medidores"].Rows.Count
           // sdr.Close();
            medidores = listMarc.ToArray();

        return medidores;
    }

    public List<Linea> buscarLineasSubestacion(String idsubestacion)
    {
        String sql = " select distinct l.idlinea, l.descripcion, l.idsubestacion, l.idtipolinea "+ 
                     " from linea l, subestacion s "+
                     " where l.idsubestacion = s.idsubestacion "+
                     " and s.idsubestacion = "+ idsubestacion;
        SqlDataReader sdr = Datos.obtenerDataReader(sql);
        List<Linea> lineas = new List<Linea>();
        while (sdr.Read())
        {
            Linea l = new Linea();
            l.Idlinea = Convert.ToInt32(sdr["idlinea"].ToString());
            l.Descripcion = sdr["descripcion"].ToString();
            l.Idtipolinea = Convert.ToInt32(sdr["idtipolinea"].ToString());
            l.Subestacion = new Subestacion();
            l.Subestacion.Idsubestacion = Convert.ToInt32(sdr["idsubestacion"].ToString());
            lineas.Add(l);
        }
        sdr.Close();
        return lineas;
    }

    public List<Linea> obtenerTodasLasLineas()
    {
        String sql = " select distinct idlinea, descripcion, idsubestacion from linea ";
        SqlDataReader sdr = Datos.obtenerDataReader(sql);
        List<Linea> lineas = new List<Linea>();
        while (sdr.Read())
        {
            Linea l = new Linea();
            if (sdr["idlinea"].GetType() != Type.GetType("System.DBNull"))
            l.Idlinea = Convert.ToInt32(sdr["idlinea"].ToString());

            if (sdr["descripcion"].GetType() != Type.GetType("System.DBNull"))
            l.Descripcion = sdr["descripcion"].ToString();
            //l.Idtipolinea = Convert.ToInt32(sdr["idtipolinea"].ToString());
            l.Subestacion = new Subestacion();

            if (sdr["idsubestacion"].GetType() != Type.GetType("System.DBNull"))
                l.Subestacion.Idsubestacion = Convert.ToInt32(sdr["idsubestacion"].ToString());

            lineas.Add(l);
        }
        sdr.Close();
        return lineas;
    }

    public List<Marcador> buscarElementosByLinea(String idlinea)
    {
        /*
         * select  * from (select distinct p.idposte, d.latitud, d.longitud, i.descripcion, c.nombre, d.nrocalle, d.idzona, l.idlinea ,tl.idtramolinea
from poste p with(NOLOCK), domicilio d  with(NOLOCK), imagenes i, calle c  with(NOLOCK), tramolinea tl, linea l
where p.iddomicilio = d.iddomicilio 
and tl.idposteinicio = p.idposte
and tl.idtramolinea = l.idtramolinea
and i.id = 3 
and d.idcalle = c.idcalle 
union
select distinct p.idposte, d.latitud, d.longitud, i.descripcion, c.nombre, d.nrocalle, d.idzona, l.idlinea,tl.idtramolinea
from poste p with(NOLOCK), domicilio d  with(NOLOCK), imagenes i, calle c  with(NOLOCK), tramolinea tl, linea l
where p.iddomicilio = d.iddomicilio 
and tl.idpostefin = p.idposte
and tl.idtramolinea = l.idtramolinea
and i.id = 3 
and d.idcalle = c.idcalle
and tl.idtramolinea = (select max(idtramolinea) from tramolinea where idlinea = @idlinea)
union
select distinct s.idsubestacion, d.latitud, d.longitud, i.descripcion, c.nombre, d.nrocalle, d.idzona, l.idlinea,0
from subestacion s with(NOLOCK), domicilio d  with(NOLOCK), imagenes i, calle c  with(NOLOCK), linea l
where s.iddomicilio = d.iddomicilio 
and l.idsubestacion = s.idsubestacion
and i.id = 4 
and d.idcalle = c.idcalle) postes
where idlinea = @idlinea
order by idtramolinea;
*/
        String consultaPostes = " select  * from (select distinct p.idposte, d.latitud, d.longitud, i.descripcion, c.nombre, d.nrocalle, d.idzona, l.idlinea ,tl.idtramolinea " +
                                " from poste p with(NOLOCK), domicilio d  with(NOLOCK), imagenes i, calle c  with(NOLOCK), tramolinea tl, linea l " +
                                " where p.iddomicilio = d.iddomicilio  " +
                                " and tl.idposteinicio = p.idposte " +
                                " and tl.idtramolinea = l.idtramolinea " +
                                " and i.id = 3  " +
                                " and d.idcalle = c.idcalle  " +
                                " union " +
                                " select distinct p.idposte, d.latitud, d.longitud, i.descripcion, c.nombre, d.nrocalle, d.idzona, l.idlinea,tl.idtramolinea " +
                                " from poste p with(NOLOCK), domicilio d  with(NOLOCK), imagenes i, calle c  with(NOLOCK), tramolinea tl, linea l " +
                                " where p.iddomicilio = d.iddomicilio  " +
                                " and tl.idpostefin = p.idposte " +
                                " and tl.idtramolinea = l.idtramolinea " +
                                " and i.id = 3  " +
                                " and d.idcalle = c.idcalle " +
                                " and tl.idtramolinea = (select max(idtramolinea) from tramolinea where idlinea = @idlinea) " +
                                " union " +
                                " select distinct s.idsubestacion, d.latitud, d.longitud, i.descripcion, c.nombre, d.nrocalle, d.idzona, l.idlinea,0 " +
                                " from subestacion s with(NOLOCK), domicilio d  with(NOLOCK), imagenes i, calle c  with(NOLOCK), linea l " +
                                " where s.iddomicilio = d.iddomicilio  " +
                                " and l.idsubestacion = s.idsubestacion " +
                                " and i.id = 4  " +
                                " and d.idcalle = c.idcalle) postes " +
                                " where idlinea = @idlinea " +
                                " order by idtramolinea ";
        //SqlConnection con = Conexion.ObtenerConexion();

        //DataSet consulta = Datos.obtenerDataset(consultaPostes, "postes"); //Conexion.ObtenerDataset(consultaMedidores, con,"medidores");
        SqlDataReader drPostes = Datos.obtenerDataReader(consultaPostes, new SqlParameter("@idlinea", idlinea)); //Conexion.obtenerDataReader(consultaMedidores, con);
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
