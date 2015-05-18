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
/// Descripción breve de Socios
/// </summary>
public class Socios
{

    public Socios()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}




    public int crearSocio(Socio s)
    {

        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", s.IdSocio));
        param.Add(new SqlParameter("@b", DateTime.Now));
        param.Add(new SqlParameter("@c", DateTime.Now));//s.FechaBaja));
        param.Add(new SqlParameter("@d", s.NroDocumento));
        param.Add(new SqlParameter("@e", s.Estado));
        param.Add(new SqlParameter("@f", s.IdUsuario));
        param.Add(new SqlParameter("@g", s.IdTipoDocumento));
        param.Add(new SqlParameter("@h", s.IdTipoSocio));
        param.Add(new SqlParameter("@i", s.CUIT1));


        string sql = "insert into Socio(idSocio, fechaAlta, fechaBaja, nroDocumento, idEstado, idUsuario, idTipoDocumento, idTipoSocio, CUIT) values (@a,@b,@c,@d,@e,@f,@g,@h,@i)";
        // Puse en duro la fechaBaja
        int filas = Datos.ejecutarComando(sql, param);

        return filas;

    }

    public int obtenerUltNroSocio()
    {
        string sql = "select max (idSocio) from Socio";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }

    public Socio traerDatosSocio(int nroSocio)
    {
        SqlParameter p = new SqlParameter("@a", nroSocio);
        string sql = "select s.idSocio, p.apellido, p.nombre, p.nroDocumento, c.nombre as CALLE, d.nroCalle, d.piso,d.dpto, z.descripcion, p.email, p.iddomicilio, z.idzona, s.idestado, d.idCalle from persona p, socio s, calle c, domicilio d, zona z where s.nroDocumento = p.nroDocumento and s.idTipoDocumento = p.TipoDocumento and p.idDomicilio = d.idDomicilio and d.idCalle = c.idCalle and d.idZona = z.idZona and s.idSocio = @a";
        
        //SqlConnection con = Conexion.ObtenerConexion();
        
        //SqlConnection con = Datos.crearConexion(ConfigurationManager.ConnectionStrings["HP-PC"].ConnectionString);

        SqlDataReader dr = Datos.obtenerDataReader(sql, p);//Datos.encontrar(sql, con, p);

        Socio s = new Socio();

        while (dr.Read())
        {
            s.IdSocio = Convert.ToInt32(dr[0]);
            s.Apellido = dr[1].ToString();
            s.Nombre = dr[2].ToString();
            s.NroDocumento = Convert.ToInt32(dr[3]);
            s.NombreCalle = dr[4].ToString();
            s.NroCalle = Convert.ToInt32(dr[5]);
            if (dr[6].GetType() !=  Type.GetType("System.DBNull"))
                s.NroPiso = Convert.ToInt32(dr[6]);

            if (dr[7].GetType() != Type.GetType("System.DBNull"))
                s.Dpto = dr[7].ToString();
            s.DescripcionZona = dr[8].ToString();
            s.IdDomicilio = Convert.ToInt32(dr[10]);
            s.Email = dr[9].ToString();
            s.NroZona = Convert.ToInt32(dr[11]);
            s.Estado = Convert.ToInt32(dr[12]);
            s.Idcalle = dr["idCalle"].ToString();
        }

        dr.Close();
        return s;
    }

    public Socio traerDatosSocioNroDoc(int tipoDoc,int nroDoc)
    {

        List<SqlParameter> param = new List<SqlParameter>();
        param.Add(new SqlParameter("@td", tipoDoc));
        param.Add(new SqlParameter("@nd", nroDoc));

        string sql = "select s.idSocio, p.apellido, p.nombre, p.tipodocumento, p.nroDocumento," +
        " c.nombre as CALLE, c.idCalle, d.nroCalle, d.piso,d.dpto, z.descripcion, p.email, p.iddomicilio, td.descripcion" +
        " from persona p, socio s, calle c, domicilio d, zona z, tipodocumento td" +
        " where s.nroDocumento = p.nroDocumento and s.idTipoDocumento = p.TipoDocumento " +
        " and p.idDomicilio = d.idDomicilio and d.idCalle = c.idCalle and d.idZona = z.idZona " +
        " and p.tipodocumento = td.idtipodocumento" +
        " and s.idtipoDocumento = @td" +
        " and s.nroDocumento = @nd";


        SqlDataReader dr = Datos.obtenerDataReader(sql, param);//Datos.encontrarLista(sql,con,param);


        Socio s = new Socio();
        

        while (dr.Read())
        {
            s.IdSocio = Convert.ToInt32(dr[0]);
            s.Apellido = dr[1].ToString();
            s.Nombre = dr[2].ToString();
            s.TipoDocumento = Convert.ToInt32(dr[3]);
            s.NroDocumento = Convert.ToInt32(dr[4]);
            s.NombreCalle = dr[5].ToString();
            s.IdCalle = Convert.ToInt32(dr[6]);
            s.NroCalle = Convert.ToInt32(dr[7]);
            s.NroPiso = Convert.ToInt32(dr[8]);
            s.Dpto = dr[9].ToString();
            s.DescripcionZona = dr[10].ToString();
            s.Email = dr[11].ToString();
            s.IdDomicilio = Convert.ToInt32(dr[12]);
            s.DescripcionTipoDoc = dr[13].ToString();

        }

        dr.Close();
        return s;
    }

    //Romina
   public Calle traerCalleSocio(int nroSocio)
    {
        SqlParameter p = new SqlParameter("@a", nroSocio);
        string sql = "select c.idCalle, c.nombre as CALLE from persona p, socio s, calle c, domicilio d, zona z where s.nroDocumento = p.nroDocumento and s.idTipoDocumento = p.TipoDocumento and p.idDomicilio = d.idDomicilio and d.idCalle = c.idCalle and d.idZona = z.idZona and s.idSocio = @a";

      //  SqlConnection con = Conexion.ObtenerConexion();

        SqlDataReader dr = Datos.obtenerDataReader(sql, p);//Datos.encontrar(sql, con, p);

        Calle ca = new Calle();

        while (dr.Read())
        {
            ca.IdCalle=  Convert.ToInt32(dr[0]);
            ca.NombreCalle = dr[1].ToString();
            
        }

        dr.Close();
        return ca;
    }

   public Calle traerCalleSocioNroDoc(int tipoDoc, int nroDoc)
   {

       List<SqlParameter> param = new List<SqlParameter>();
       param.Add(new SqlParameter("@td", tipoDoc));
       param.Add(new SqlParameter("@nd", nroDoc));

       string sql = "select c.idCalle, c.nombre as CALLE from persona p, socio s, calle c, domicilio d, zona z where s.nroDocumento = p.nroDocumento and s.idTipoDocumento = p.TipoDocumento and p.idDomicilio = d.idDomicilio and d.idCalle = c.idCalle and d.idZona = z.idZona and s.idtipoDocumento = @td and s.nroDocumento = @nd";

       //SqlConnection con = Conexion.ObtenerConexion();

       SqlDataReader dr = Datos.obtenerDataReader(sql, param);//Datos.encontrarLista(sql, con, param);


       Calle ca = new Calle();

       while (dr.Read())
       {
           ca.IdCalle = Convert.ToInt32(dr[0]);
           ca.NombreCalle = dr[1].ToString();

       }

       dr.Close();
       return ca;
   }


    //Lau Villegas

   public Socio traerDatosSocioParticular(int nroSocio)
   {
       SqlParameter p = new SqlParameter("@a", nroSocio);
       string sql = "select s.idSocio, s.fechaalta, p.apellido, p.nombre, p.nroDocumento, p.tipodocumento, p.email," +
       " p.sexo, p.telefono, c.nombre, d.nrocalle, d.piso, d.dpto, d.idzona, s.idestado, c.idcalle, p.idDomicilio," +
       " td.descripcion" +
       " from persona p, socio s, calle c, domicilio d, zona z, estadosocio e,tipodocumento td" +
       " where s.nroDocumento = p.nroDocumento and s.idTipoDocumento = p.TipoDocumento and p.idDomicilio = d.idDomicilio" +
       " and d.idCalle = c.idCalle and d.idZona = z.idZona and s.idestado=e.idestadosocio and s.idsocio= @a" +
       " and p.tipodocumento = td.idtipodocumento";

       SqlDataReader dr = Datos.obtenerDataReader(sql, p);

       Socio s = new Socio();

       while (dr.Read())
       {
           s.IdSocio = Convert.ToInt32(dr[0]);
           s.FechaAlta = Convert.ToDateTime(dr[1]);
           s.Apellido = dr[2].ToString();
           s.Nombre = dr[3].ToString();
           s.NroDocumento = Convert.ToInt32(dr[4]);
           s.TipoDocumento = Convert.ToInt32(dr[5]); //ver como lo muestro en un combo
           s.Email = dr[6].ToString();
           s.Sexo = dr[7].ToString();

           if (dr[8].GetType() != Type.GetType("System.DBNull"))
               s.Telefono = Convert.ToInt32(dr[8]);
           else
               s.Telefono = 0;

           s.NombreCalle = dr[9].ToString();

           if (dr[10].GetType() != Type.GetType("System.DBNull"))
               s.NroCalle = Convert.ToInt32(dr[10]);
           else
               s.NroCalle = 0;

           if (dr[11].GetType() != Type.GetType("System.DBNull"))
               s.NroPiso = Convert.ToInt32(dr[11]);
           else
               s.NroPiso = 0;

           if (dr[12].GetType() != Type.GetType("System.DBNull"))
               s.Dpto = dr[12].ToString();
           else
               s.Dpto = Convert.ToString("0");

           s.DescripcionZona = dr[13].ToString();
           s.Estado = Convert.ToInt32 (dr[14]);
           s.IdCalle = Convert.ToInt32(dr[15]);
           s.IdDomicilio = Convert.ToInt32(dr[16]);
           s.DescripcionTipoDoc = dr[17].ToString();
       }

       dr.Close();
       return s;
   }

   public int verificarTipoSocio(int nroSocio)
   {
       SqlParameter p = new SqlParameter("@a", nroSocio);
       string sql = "SELECT IDTIPOSOCIO FROM SOCIO WHERE IDSOCIO = @a";

       SqlDataReader dr = Datos.obtenerDataReader(sql, p);

       int variable;

       if (dr.Read())
       { variable = Convert.ToInt32(dr[0]); }
       else 
       { variable = 0; }
       
       dr.Close();
       return variable;
   
   }






}
