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
/// Descripción breve de Empresas
/// </summary>
public class Empresas
{
    public int existeEmpresa(long cuit)
    {
        SqlParameter p = new SqlParameter("@a", cuit);
        SqlParameter[] para = { p};

        string sql = "SELECT CUIT FROM EMPRESA CUIT = @a";

        int id = Datos.obtenerEscalar(sql, para);

        return id;

    }

    public int crearEmpresaProveedor(Empresa e)
    {
        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", e.NroCUIT));
        param.Add(new SqlParameter("@b", e.RazonSocial));
        param.Add(new SqlParameter("@c", e.FechaIncioActividades));
        param.Add(new SqlParameter("@d", e.PaginaWEB));
        param.Add(new SqlParameter("@e", e.IdTipoOrganizacion));
        param.Add(new SqlParameter("@f", e.IdDomicilio));
        param.Add(new SqlParameter("@g", e.Telefono));
        param.Add(new SqlParameter("@h", e.Email));
        param.Add(new SqlParameter("@i", e.IdTipoDocResp));
        param.Add(new SqlParameter("@j", e.NroDocResp));
        param.Add(new SqlParameter("@k", e.CargoResponsable));

        string sql = "insert into Empresa(CUIT, razonSocial, fechaInicioAct, paginaWeb, idTipoOrg, idDomicilioExterno, telefono, email,tipoDocResp, nroDocResp, cargoResponsable) values (@a,@b,@c, @d, @e, @f, @g, @h, @i, @j, @k)";
        
        int filas = Datos.ejecutarComando(sql, param);
        
        return filas;

    }



    public Empresas()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
