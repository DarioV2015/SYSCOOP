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
/// Descripción breve de SociosEmpresa
/// </summary>
public class SociosEmpresa
{
	public SociosEmpresa()
	{
		
	}

    //Lau Villegas

    public int crearSocioEmpresa(SocioEmpresa se)
    {
        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", se.NroCUIT));
        param.Add(new SqlParameter("@b", se.RazonSocial));
        param.Add(new SqlParameter("@c", se.FechaIncioActividades));
        param.Add(new SqlParameter("@d", se.PaginaWEB));
        param.Add(new SqlParameter("@e", se.IdTipoOrganizacion));
        param.Add(new SqlParameter("@f", se.IdDomicilio));
        param.Add(new SqlParameter("@g", se.Telefono));
        param.Add(new SqlParameter("@h", se.Email));
        param.Add(new SqlParameter("@i", se.IdTipoDocResp));
        param.Add(new SqlParameter("@j", se.NroDocResp));

        string sql = "insert into Empresa(CUIT, razonSocial, fechaInicioAct, paginaWeb, idTipoOrg, idDomicilio, telefono, email,tipoDocResp, nroDocResp) values (@a,@b,@c, @d, @e, @f, @g, @h, @i, @j)";
        int filas = 0;

        try
        {
            filas = Datos.ejecutarComando(sql, param);


            if (filas >= 0)
            { Datos.commit(); }
        }
        catch { }

        return filas;

    }


    public SocioEmpresa traerDatosSocioEmpresa(int nroSocio)
    {
        SqlParameter p = new SqlParameter("@a", nroSocio);
        string sql = "SELECT S.IDSOCIO, S.FECHAALTA, S.CUIT, E.RAZONSOCIAL, E.FECHAINICIOACT, E.PAGINAWEB, C.NOMBRE, D.NROCALLE, D.PISO, D.DPTO, P.APELLIDO, P.NOMBRE, E.TELEFONO, E.EMAIL, Z.DESCRIPCION, D.IDCALLE, D.IDDOMICILIO" +
        " FROM SOCIO S, EMPRESA E, DOMICILIO D, CALLE C, PERSONA P, ZONA Z" +
        " WHERE S.CUIT = E.CUIT AND E.IDDOMICILIO = D.IDDOMICILIO AND D.IDCALLE = C.IDCALLE AND E.TIPODOCRESP = P.TIPODOCUMENTO AND E.NRODOCRESP = P.NRODOCUMENTO AND D.IDZONA = Z.IDZONA AND S.IDSOCIO = @a";

        SqlDataReader dr = Datos.obtenerDataReader(sql, p);

        SocioEmpresa se = new SocioEmpresa();

        while (dr.Read())
        {
            se.IdSocioEmpresa = Convert.ToInt32(dr[0]);
            se.FechaAlta = Convert.ToDateTime(dr[1]);
            
            se.NroCUIT = Convert.ToInt64(dr[2]);
            se.RazonSocial = dr[3].ToString();
            se.FechaIncioActividades = Convert.ToDateTime (dr[4]);
            se.PaginaWEB = dr[5].ToString();
            se.NombreCalle = dr[6].ToString();
            se.NroCalle = Convert.ToInt32(dr[7]);
            se.NroPiso = Convert.ToInt32(dr[8]);
            se.Dpto = dr[9].ToString();
            se.ApellidoResponsable = dr[10].ToString();
            se.NombreResponsable = dr[11].ToString();
            se.Telefono = Convert.ToInt32 (dr[12]);
            se.Email = dr[13].ToString();
            se.DescripcionZona = dr[14].ToString();
            se.IdCalle = Convert.ToInt32(dr[15]);
            se.IdDomicilio = Convert.ToInt32(dr[16]);
            
            
        }

        dr.Close();
        return se;
    }

    public int modificarEmpresa(string razSoc, long nroCUIT, int tipoOrg, int tel, string email, string pagWeb, string apellidoResp, string nombreResp, int cargo, int socioEmpresa, int idDomicilio)
    {

        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", razSoc));
        param.Add(new SqlParameter("@b", nroCUIT));
        param.Add(new SqlParameter("@c", tipoOrg));
        param.Add(new SqlParameter("@e", tel));
        param.Add(new SqlParameter("@f", email));
        param.Add(new SqlParameter("@g", pagWeb));
        param.Add(new SqlParameter("@h", apellidoResp));
        param.Add(new SqlParameter("@i", nombreResp));
        param.Add(new SqlParameter("@j", cargo));
        param.Add(new SqlParameter("@k", socioEmpresa));
        param.Add(new SqlParameter("@l", idDomicilio));


        string sql = " update SocioEmpresa " +
            " set iddomicilio=@l, razonsocial= @a, nrocuit = @b, " +
        " idtipoorganizacion = @c, telefono = @e, email =@f, " +
        " paginaweb = @g, apellidoresponsable = @h, " +
        " nombreresponsable = @i, idcargo =@j " +
        " where idsocioempresa= @k";

        int filas = Datos.ejecutarComando(sql, param);
        if (filas != 0)
        { Datos.commit(); }
        return filas;

    }

    public Boolean esSocioEmpresa(int nroSocioEmpresa)
    {
        SqlParameter p = new SqlParameter("@a", nroSocioEmpresa);
        string sql = "SELECT IDSOCIOEMPRESA, RAZONSOCIAL FROM SOCIOEMPRESA WHERE IDSOCIOEMPRESA = @a";

        SqlDataReader dr = Datos.obtenerDataReader(sql, p);

        if (dr.Read())
        { return true; }
        else
        { return false; }

    }

    public SocioEmpresa traerDatosSocioEmpresaXCUIT(long cuit)
    {
        SqlParameter p = new SqlParameter("@a", cuit);
        string sql = "select s.idSocio, s.cuit, e.fechainicioact, e.paginaweb, e.razonsocial, e.telefono, p.apellido, p.nombre, e.email, c.nombre, d.nrocalle, d.piso, d.dpto, d.idzona, c.idcalle, d.iddomicilio " + 
                     "from socio s, empresa e, calle c, domicilio d, zona z, persona p "+
                     "where s.cuit = e.cuit "+
                     "and e.idDomicilio = d.idDomicilio "+
                     "and d.idCalle = c.idCalle "+ 
                     "and d.idZona = z.idZona "+ 
                     "and e.tipodocresp = p.tipodocumento "+
                     "and e.nrodocresp = p.nrodocumento " +
                     "and s.cuit = @a";
                    
        SqlDataReader dr = Datos.obtenerDataReader(sql, p);

        SocioEmpresa se = new SocioEmpresa();

        while (dr.Read())
        {
            se.IdSocioEmpresa = Convert.ToInt32(dr[0]);
            se.NroCUIT = Convert.ToInt64(dr[1]);
            se.FechaIncioActividades = Convert.ToDateTime(dr[2]);
            
            se.PaginaWEB = dr[3].ToString();
            se.RazonSocial = dr[4].ToString();
            
            se.Telefono = Convert.ToInt32(dr[5]);
            se.ApellidoResponsable = dr[6].ToString();
            se.NombreResponsable = dr[7].ToString();
            se.Email = dr[8].ToString();
            se.NombreCalle = dr[9].ToString();
            se.NroCalle = Convert.ToInt32(dr[10]);
            se.NroPiso = Convert.ToInt32(dr[11]);
            se.Dpto = dr[12].ToString();
            se.DescripcionZona = dr[13].ToString();
            se.IdCalle = Convert.ToInt32(dr[14]);
            se.IdDomicilio = Convert.ToInt32(dr[15]);

        }

        dr.Close();
        return se;
    }




}
