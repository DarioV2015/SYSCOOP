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
/// Descripción breve de Domicilios
/// </summary>
public class Domicilios
{
	public Domicilios()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public int obtenerUltNroDomicilio()
    {
        string sql = "select max (idDomicilio) from Domicilio";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }

    public int crearCalle(Calle c)
    {

        List<SqlParameter> param = new List<SqlParameter>();

     //   param.Add(new SqlParameter("@a", c.IdCalle));
      //  param.Add(new SqlParameter("@b", c.NombreCalle));

        //string sql = "insert into Calle(idCalle, nombre) values (@a,@b)";
        string sql = "insert into Calle(idCalle, nombre) values ("+c.IdCalle+",'"+c.NombreCalle+"')";
        //int filas = Datos.ejecutarComando(sql, param);
        Archivo a = new Archivo();
        a.guardarLinea(sql);
        int filas = Datos.ejecutarComando(sql);
        return filas;

    }
    public int crearDomicilio(Domicilio d)
    {

        List<SqlParameter> param = new List<SqlParameter>();

      //  param.Add(new SqlParameter("@a", d.IdDomicilio));
    //    param.Add(new SqlParameter("@b", d.NroCalle));
    //    param.Add(new SqlParameter("@c", d.Piso));
    //    param.Add(new SqlParameter("@d", d.IdCalle));
    //    param.Add(new SqlParameter("@e", d.IdZona));
    //    param.Add(new SqlParameter("@f", d.Dpto));

        string sql = "insert into Domicilio(idDomicilio, nroCalle, piso, idCalle, idZona, dpto, latitud, longitud ) values ("
                + d.IdDomicilio + "," + d.NroCalle + "," + d.Piso + "," + d.IdCalle + ", " + d.IdZona + ", '" + d.Dpto + "')";
        if (d.Latitud != null && d.Longitud != null)
        {
  //          param.Add(new SqlParameter("@g", d.Latitud));
  //          param.Add(new SqlParameter("@h", d.Longitud));//

            sql = "insert into Domicilio(idDomicilio, nroCalle, piso, idCalle, idZona, dpto, latitud, longitud ) values ("
                +d.IdDomicilio+","+d.NroCalle+","+d.Piso+","+d.IdCalle+", "+d.IdZona+", '"+d.Dpto+"', '"+d.Latitud+"', '"+d.Longitud+"')";
        }

        
        //Puse en duro la latitud 
        //Puse en duro la longitud
      //  int filas = Datos.ejecutarComando(sql, param);
        Archivo a = new Archivo();
        a.guardarLinea(sql);
        int filas = Datos.ejecutarComando(sql);
        return filas;

    }
    public bool crearDomicilio1(Domicilio d)
    {
        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", d.IdDomicilio));
        param.Add(new SqlParameter("@b", d.NroCalle));
        param.Add(new SqlParameter("@c", d.Piso));
        param.Add(new SqlParameter("@d", d.IdCalle));
        param.Add(new SqlParameter("@e", d.IdZona));
        param.Add(new SqlParameter("@f", d.Dpto));
        param.Add(new SqlParameter("@g", ""));
        param.Add(new SqlParameter("@h", ""));

       string sql = "insert into Domicilio(idDomicilio, nroCalle, piso, idCalle, idZona, dpto, latitud, longitud )" +
       " values (@a, @b, @c, @d, @e, @f, @g, @h)";

        int insertado = Datos.ejecutarComando(sql, param);
        bool correcto = false;

        if (insertado > 0)
        {
            correcto = true;
        }
        return correcto;
    }
    /*public List<Domicilio> getDomicilioDeDetalle(String idDom)
    {
        List<Domicilio> domicilios = new List<Domicilio>();
        String strSql = "SELECT d.iddomicilio, " +
        " c.nombre, " +
        " d.nrocalle, " +
        " d.piso, " +
        " d.depto " +
        " z.descripcion " +
        " FROM domicilio d, calle c, zona z " +
        " where d.idcalle = c.idcalle " +
        " and d.idzona = z.idzona " + 
        " and d.iddomicilio = " + idDom;
        SqlDataReader sdr = Datos.obtenerDataReader(strSql);//Conexion.obtenerDataReader(strSql, con);

        while (sdr.Read())
        {
           Domicilio d = new Domicilio();
           d.IdDomicilio = sdr["iddomicilio"].ToString();
           d.NombreCalle = sdr["nombre"].ToString();
           d.NroCalle = sdr["nrocalle"].ToString();
           d.NroPiso = sdr["piso"].ToString();
           d.Depto = sdr["depto"].ToString();
           d.Zona = sdr["descripcion"].ToString();
           domicilios.Add(d);
            
        }
        return domicilios;

    }*/

    public int insertarDomicilio(int idDomicilio, int idCalle,int nroCalle, int piso, String depto, int idZona)
    {
        //SqlConnection con = Conexion.ObtenerConexion();
        SqlParameter idDom = new SqlParameter("@idDomicilio", idDomicilio);
        SqlParameter calle = new SqlParameter("@idCalle", idCalle);
        SqlParameter nroCal = new SqlParameter("@nroCalle", nroCalle);
        SqlParameter nroPiso = new SqlParameter("@piso", piso);
        SqlParameter departamento = new SqlParameter("@depto", depto);
        SqlParameter zona = new SqlParameter("@idZona", idZona);
       // SqlParameter lati = new SqlParameter("@latitud", latitud);
       // SqlParameter longit = new SqlParameter("@longitud", longitud);

        SqlParameter[] para = { idDom, calle, nroCal, nroPiso, departamento, zona};


        string sql = "INSERT INTO DOMICILIO (IDDOMICILIO, NROCALLE, PISO, IDCALLE, DPTO, IDZONA) " +
            "VALUES (@idDomicilio, @idCalle, @nroCalle, @piso, @depto, @idZona)";
        int filas = Datos.ejecutarComando(sql, para);
        /*if (filas != 0)
        { Datos.commit(); }*/
        return filas;

    }

    public int obtenerUltimoIdDomicilio()
    {
        string sql = "select max(idDomicilio) from Domicilio";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }
   
    public int buscarDomicilio(int idCalle, int nroCalle, String piso, String depto)
    {
        SqlParameter calle = new SqlParameter("@idCalle", idCalle);
        SqlParameter nroCal = new SqlParameter("@nroCalle", nroCalle);
        SqlParameter nroPiso = new SqlParameter("@piso", piso);
        SqlParameter departamento = new SqlParameter("@depto", depto);

        SqlParameter[] para = { calle, nroCal, nroPiso, departamento };

        String sql = "SELECT IDDOMICILIO " +
                     "FROM DOMICILIO " +
                     "WHERE IDCALLE = @idCalle" +
                     " AND NROCALLE = @nroCalle" +
                     " AND PISO = @piso " +
                     " AND DPTO = @depto ";

        int nroDomicilio = (Datos.obtenerEscalar(sql, para));
        
        return nroDomicilio;
    }

   public bool socioExisteDomicilio (int idDomicilio)
   {
       SqlParameter obtenido = new SqlParameter ("@idDomicilio", idDomicilio);
       

       SqlParameter para = ( obtenido );

       String sql = "select * from socio s, persona p, domicilio d " +
                    "where s.nrodocumento=p.nrodocumento" +
                    "and s.idtipodocumento=p.tipodocumento" +
                    "and p.iddomicilio=d.iddomicilio" +
                    "and d.iddomicilio = @idDomicilio" +
                    "and s.idestado = 1";
       
       int valor = Datos.ejecutarComando(sql);
       bool existe;
       if (valor == 0)
       { existe = false; }
       else
       { existe = true; }

       return existe;
   }

   public bool socioEmpresaExisteDomicilio(int idDomicilio)
   {
       SqlParameter obtenido = new SqlParameter("@idDomicilio", idDomicilio);


       SqlParameter para = (obtenido);

       String sql = "select * from socioempresa se, domicilio d " +
                    " where se.iddomicilio=d.iddomicilio " +
                    " and d.iddomicilio = @idDomicilio " +
                    " and se.estado = 1" ;

       int valor = Datos.ejecutarComando(sql);
       bool existe;
       if (valor == 0)
       { existe = false; }
       else
       { existe = true; }

       return existe;
   } 
        

   
    public int buscarDomicilio(String calle, float nroCalle)
    {
        SqlParameter pNroCalle = new SqlParameter("@nroCalle", nroCalle);
        SqlParameter pCalle  = new SqlParameter("@calle", calle.ToUpper());

        SqlParameter[] para = { pCalle, pNroCalle};

        String sql = "select d.iddomicilio from domicilio d, calle c " +
        " where d.idcalle = c.idcalle "+
        " and upper(c.nombre) = upper(@calle)" +
        " and d.nrocalle = @nroCalle";

        SqlDataReader dr = Datos.obtenerDataReader(sql,para);
        int nroDomicilio = 0;
        while(dr.Read())
        {
            nroDomicilio = Convert.ToInt32(dr[0]);
        }
        dr.Close();

        return nroDomicilio;

    }


    public Domicilio getDomicilio(int nroDomicilio)
    {
        SqlParameter para = new SqlParameter("@nroDomi", nroDomicilio);
        string sql = "SELECT IDCALLE, NROCALLE, PISO, DPTO, latitud, longitud "+
                     "FROM DOMICILIO " +  
                     "WHERE IDDOMICILIO = @nroDomi";


        SqlDataReader dr = Datos.obtenerDataReader(sql, para);//Datos.encontrar(sql, con, p);

       Domicilio domi = new Domicilio();

        while (dr.Read())
        {
            domi.IdCalle = Convert.ToInt32(dr["idcalle"]);
            domi.NroCalle = Convert.ToInt32(dr["nrocalle"]);
            if (dr["piso"].GetType() != Type.GetType("System.DBNull"))
                domi.Piso = Convert.ToInt32(dr["piso"]);
            if (dr["dpto"].GetType() != Type.GetType("System.DBNull"))
                domi.Dpto = dr["dpto"].ToString();
            domi.Latitud = dr["latitud"].ToString();
            domi.Longitud = dr["longitud"].ToString();
            domi.NombreCalle = Datos.getCalles().getCalle(domi.IdCalle).NombreCalle;
        }

        dr.Close();
        return domi;
    }
    public Domicilio getDomicilio2(int nroDomicilio)
    {
        SqlParameter para = new SqlParameter("@nroDomi", nroDomicilio);
        string sql = "SELECT D.IDCALLE, D.NROCALLE, D.PISO, D.DPTO, D.latitud, D.longitud, Z.DESCRIPCION, Z.IDZONA" +
                     " FROM DOMICILIO D, ZONA Z" +
                     " WHERE IDDOMICILIO = @nroDomi" +
                     " AND D.IDZONA = Z.IDZONA";


        SqlDataReader dr = Datos.obtenerDataReader(sql, para);//Datos.encontrar(sql, con, p);

        Domicilio domi = new Domicilio();

        while (dr.Read())
        {
            domi.IdCalle = Convert.ToInt32(dr[0]);
            domi.NroCalle = Convert.ToInt32(dr[1]);

            if (dr[2].GetType() != Type.GetType("System.DBNull"))
                domi.Piso = Convert.ToInt32(dr[2]);
            else
                domi.Piso = 0;

            if (dr[3].GetType() != Type.GetType("System.DBNull"))
                domi.Dpto = dr[3].ToString();
            else
                domi.Dpto = "0";

            domi.Latitud = dr[4].ToString();
            domi.Longitud = dr[5].ToString();
            domi.NombreCalle = Datos.getCalles().getCalle(domi.IdCalle).NombreCalle;
            domi.Zona = dr[6].ToString(); ;
            domi.IdZona = Convert.ToInt32(dr[7]);
        }

        dr.Close();
        return domi;
    }

    public int actualizarLocalizacion(int idDomicilio, String lat, String lon)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        list.Add(new SqlParameter("@idDomicilio", idDomicilio));
        list.Add(new SqlParameter("@lat", lat));
        list.Add(new SqlParameter("@lon", lon));


        String sql = " update from domicilio " +
                     " set latitud = @lat, longitud = @lon " +
                     " where iddomicilio = @idDomicilio ";


        int valor = Datos.ejecutarComando(sql,list);
        return valor;
    }
    public Domicilio traerDomicilioSocio(int nroSocio, int nroDocumento, int idTipo, int nroCUIT)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        
        if(Convert.ToInt32(nroSocio) == 0)
            list.Add(new SqlParameter("@nroSocio", DBNull.Value));
        else
            list.Add(new SqlParameter("@nroSocio", nroSocio));
        
        if(Convert.ToInt32(nroDocumento) == 0)
            list.Add(new SqlParameter("@nroDocumento", DBNull.Value));
        else
            list.Add(new SqlParameter("@nroDocumento", nroDocumento));
        
        if(Convert.ToInt32(idTipo) == -1)
            list.Add(new SqlParameter("@idTipo", DBNull.Value));
        else
            list.Add(new SqlParameter("@idTipo", idTipo));

        if (Convert.ToInt32(nroCUIT) == 0)
            list.Add(new SqlParameter("@nroCUIT", DBNull.Value));
        else
            list.Add(new SqlParameter("@nroCUIT", nroCUIT));

        string sql = "select c.nombre, d.nrocalle, d.piso, d.dpto," +
        " z.descripcion, z.idzona, c.idcalle, d.iddomicilio" +
        " from calle c, domicilio d, zona z, socio s, persona p" +
        " where d.idcalle = c.idcalle" +
        " and d.idzona = z.idzona" +
        " and s.nrodocumento = p.nrodocumento" +
        " and s.idtipodocumento = p.tipodocumento" +
        " and p.iddomicilio = d.iddomicilio" +
        " and ((s.idsocio = @nroSocio)" +
        " or(p.nrodocumento = @nroDocumento and p.tipodocumento = @idTipo)" +
        " or(s.cuit = @nroCUIT))";

        SqlDataReader dr = Datos.obtenerDataReader(sql,list);

        Domicilio domi = new Domicilio();

        while (dr.Read())
        {
            domi.NombreCalle = dr[0].ToString();

            if (dr[1].GetType() != Type.GetType("System.DBNull"))
                domi.NroCalle = Convert.ToInt32(dr[1]);
            else
                domi.NroCalle = 0;

            if (dr["piso"].GetType() != Type.GetType("System.DBNull"))
                domi.Piso = Convert.ToInt32(dr[2]);
            else
                domi.Piso = 0;

            if (dr["piso"].GetType() != Type.GetType("System.DBNull"))
                domi.Dpto = dr[3].ToString();
            else
                domi.Dpto = Convert.ToString("0");

            domi.Zona = dr[4].ToString(); ;
            domi.IdZona = Convert.ToInt32(dr[5]);
            domi.IdCalle = Convert.ToInt32(dr[6]);
            domi.IdDomicilio = Convert.ToInt32(dr[7]);
        }

        dr.Close();
        return domi;
    }

   
}
