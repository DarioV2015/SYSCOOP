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
/// Descripción breve de Personas
/// </summary>
public class Personas
{
	public Personas()
	{

	}

    public int crearPersona(Persona p)
    {

        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", p.NroDocumento));
        param.Add(new SqlParameter("@b", p.TipoDocumento));
        param.Add(new SqlParameter("@c", p.IdDomicilio));
        param.Add(new SqlParameter("@d", p.Nombre));
        param.Add(new SqlParameter("@e", p.Apellido));
        param.Add(new SqlParameter("@f", p.Email));
        param.Add(new SqlParameter("@g", p.Sexo));
        param.Add(new SqlParameter("@h", p.Telefono));
        param.Add(new SqlParameter("@i", p.FechaNacimiento));


        string sql = "insert into Persona(nroDocumento, tipoDocumento, idDomicilio, nombre, apellido, email, sexo, telefono, fechanac) values (@a,@b,@c,@d, @e, @f, @g, @h, @i)";
        int filas = Datos.ejecutarComando(sql, param);
        return filas;

    }

    public int modificarPersona(int nroDoc, int tipoDoc, int idDomicilio, string apellido, string nombre, string email, string sexo, int tel, int idsocio)
    {

        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", nroDoc));
        param.Add(new SqlParameter("@b", tipoDoc));
        param.Add(new SqlParameter("@c", idDomicilio));
        param.Add(new SqlParameter("@e", apellido));
        param.Add(new SqlParameter("@f", nombre));
        param.Add(new SqlParameter("@g", email));
        param.Add(new SqlParameter("@h", sexo));
        param.Add(new SqlParameter("@i", tel));
        param.Add(new SqlParameter("@j", idsocio));


        string sql = " update Persona " +
            " set iddomicilio= @c, apellido = @e, nombre = @f, email = @g, sexo =@h, telefono = @i " +
            " where nrodocumento=@a and tipodocumento=@b and exists " +
            " (  select p.tipodocumento, p.nrodocumento, s.idsocio " +
            "   from socio s, persona p " +
            " where p.nrodocumento=s.nrodocumento " +
            " and p.TIPODOCUMENTO=s.idTIPODOCUMENTO " +
            " and p.tipodocumento=@b and p.nrodocumento=@a " +
            " and s.idsocio=@j )";

        int filas = Datos.ejecutarComando(sql, param);
        if (filas != 0)
        { Datos.commit(); }
        return filas;

    }
   
    public int insertarPersona(int nroDoc, int tipoDoc, String nom, String ape, int tel)
    {
        SqlParameter nroDocumento = new SqlParameter("@nroDocumento", nroDoc);
        SqlParameter tipoDocumento = new SqlParameter("@tipoDocumento", tipoDoc);
        SqlParameter nombre = new SqlParameter("@nombre", nom);       
        SqlParameter apellido = new SqlParameter("@apellido", ape);
        SqlParameter telefono = new SqlParameter("@telefono", tel);
                

        SqlParameter[] para = { nroDocumento, tipoDocumento, nombre, apellido, telefono };


        string sql = "INSERT INTO PERSONA (NRODOCUMENTO, TIPODOCUMENTO, NOMBRE, APELLIDO, TELEFONO) "+
                     "VALUES (@nroDocumento, @tipoDocumento, @nombre, @apellido, @telefono)";
        
        int filas=Datos.ejecutarComando(sql, para);
       // if (filas != 0)
     //{ Datos.commit(); }
        return filas; 

    }

    public Persona mostrarPersona(int tipoDoc, int nroDoc)
    {
        SqlParameter tipoDocumento = new SqlParameter("@tipoDocumento", tipoDoc);
        SqlParameter nroDocumento = new SqlParameter("@nroDocumento", nroDoc);

        SqlParameter[] para = { tipoDocumento, nroDocumento };


        string sql = "SELECT NRODOCUMENTO, TIPODOCUMENTO, NOMBRE, APELLIDO, EMAIL, SEXO, TELEFONO " +
                     "FROM PERSONA WHERE NRODOCUMENTO = @nroDocumento AND TIPODOCUMENTO = @tipoDocumento";


        SqlDataReader dr = Datos.obtenerDataReader(sql, para);

        Persona p = new Persona();

        while (dr.Read())
        { 
            p.NroDocumento = Convert.ToInt32(dr[0]);
            p.TipoDocumento = Convert.ToInt32(dr[1]);
            p.Nombre = dr[2].ToString();
            p.Apellido = dr[3].ToString();
            p.Email = dr[4].ToString();
            p.Sexo = dr[5].ToString();
            p.Telefono = Convert.ToInt32(dr[6]);

       

        }
        dr.Close();
        return p;
    }

    public int crearPersonaResponsable(Persona p)
    {
        List<SqlParameter> param = new List<SqlParameter>();
        string sql = "";

        if (p.Telefono == 0)
        {
            if (p.Email == "NULL")
            {
                param.Add(new SqlParameter("@a", p.NroDocumento));
                param.Add(new SqlParameter("@b", p.TipoDocumento));
                param.Add(new SqlParameter("@c", p.Nombre));
                param.Add(new SqlParameter("@d", p.Apellido));
                param.Add(new SqlParameter("@e", p.Sexo));

                sql = "insert into Persona(nroDocumento, tipoDocumento, nombre, apellido, sexo) values (@a,@b,@c,@d,@e)";
            }
            else
            {
                param.Add(new SqlParameter("@a", p.NroDocumento));
                param.Add(new SqlParameter("@b", p.TipoDocumento));
                param.Add(new SqlParameter("@c", p.Nombre));
                param.Add(new SqlParameter("@d", p.Apellido));
                param.Add(new SqlParameter("@e", p.Sexo));
                param.Add(new SqlParameter("@f", p.Email));

                sql = "insert into Persona(nroDocumento, tipoDocumento, nombre, apellido, sexo, email) values (@a,@b,@c,@d,@e,@f)";

            }
        }

        else
        {
            if (p.Email == "NULL")
            {
                param.Add(new SqlParameter("@a", p.NroDocumento));
                param.Add(new SqlParameter("@b", p.TipoDocumento));
                param.Add(new SqlParameter("@c", p.Nombre));
                param.Add(new SqlParameter("@d", p.Apellido));
                param.Add(new SqlParameter("@e", p.Sexo));
                param.Add(new SqlParameter("@f", p.Telefono));

                sql = "insert into Persona(nroDocumento, tipoDocumento, nombre, apellido, sexo, telefono) values (@a,@b,@c,@d,@e,@f)";
            }
            else
            {
                param.Add(new SqlParameter("@a", p.NroDocumento));
                param.Add(new SqlParameter("@b", p.TipoDocumento));
                param.Add(new SqlParameter("@c", p.Nombre));
                param.Add(new SqlParameter("@d", p.Apellido));
                param.Add(new SqlParameter("@e", p.Sexo));
                param.Add(new SqlParameter("@f", p.Telefono));
                param.Add(new SqlParameter("@g", p.Email));

                sql = "insert into Persona(nroDocumento, tipoDocumento, nombre, apellido, sexo, telefono, email) values (@a,@b,@c,@d,@e,@f,@g)";
            }
        }
        

       
        int filas = Datos.ejecutarComando(sql, param);
        return filas;

    }




}
