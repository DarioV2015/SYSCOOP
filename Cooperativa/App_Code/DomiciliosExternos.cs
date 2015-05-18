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
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de DomiciliosExternos
/// </summary>
public class DomiciliosExternos
{
    public int obtenerUltimoIdDomicilioExterno()
    {
        string sql = "select max(IDDOMICILIOEXTERNO) from DOMICILIOEXTERNO";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }

   public int crearDomicilioExterno(int nroDomi, String calle, int nro, int piso, String depto, int ciudad)
    {
     

       if (piso == 0)
        {
            SqlParameter id = new SqlParameter("@id", nroDomi);
            SqlParameter ca = new SqlParameter("@calle", calle);
            SqlParameter n = new SqlParameter("@n", nro);
            SqlParameter de = new SqlParameter("@de", depto);
            SqlParameter idCiudad = new SqlParameter("@idCiudad", ciudad);

            SqlParameter[] para = { id, ca, n, de, idCiudad };

            string sql = "INSERT INTO DOMICILIOEXTERNO (IDDOMICILIOEXTERNO, CALLE, NUMERO, DEPTO, IDCIUDAD) " +
                         "VALUES(@id,@calle,@n,@de,@idCiudad)";
            int filas = Datos.ejecutarComando(sql, para);
            return filas;
        }
        else 
        {
            SqlParameter id = new SqlParameter("@id", nroDomi);
            SqlParameter ca = new SqlParameter("@calle", calle);
            SqlParameter n = new SqlParameter("@n", nro);
            SqlParameter pi = new SqlParameter("@pi", piso);
            SqlParameter de = new SqlParameter("@de", depto);
            SqlParameter idCiudad = new SqlParameter("@idCiudad", ciudad);

            SqlParameter[] para = { id, ca, n, pi, de, idCiudad };

            string sql = "INSERT INTO DOMICILIOEXTERNO (IDDOMICILIOEXTERNO, CALLE, NUMERO, PISO, IDCIUDAD, DEPTO) " +
                         "VALUES(@id,@calle,@n,@pi, @idCiudad, @de)";
            
           int filas = Datos.ejecutarComando(sql, para);
            return filas;
        }
        
   

    }

    public DomiciliosExternos()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
