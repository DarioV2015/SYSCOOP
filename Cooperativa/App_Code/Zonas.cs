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
using System.Collections.Generic;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de Zonas
/// </summary>
public class Zonas
{
	public Zonas()
	{
		
	}

    public List<Zona> listasZonas()
    {
        String sql = " select z.idzona, z.descripcion, z.cantmanzanas, cn.nombre CalleNorte, cs.nombre CalleSur, ce.nombre CalleEste, co.nombre CalleOeste "+
                     " from zona z, calle cn, calle cs, calle ce, calle co "+
                     " where z.callenorte = cn.idcalle "+
                     " and z.callesur = cs.idcalle "+
                     " and z.calleeste = ce.idcalle "+
                     " and z.calleoeste = co.idcalle ";

        SqlDataReader sdr = Datos.obtenerDataReader(sql);

        List<Zona> zonas = new List<Zona>();
        while(sdr.Read())
        {
            Zona z = new Zona();
            z.IdZona = Convert.ToInt32(sdr["idzona"]);
            z.Descripcion = sdr["descripcion"].ToString();
            if (sdr["cantmanzanas"].GetType() != Type.GetType("System.DBNull"))
                z.CantManzanas = Convert.ToInt32(sdr["cantmanzanas"].ToString());
            z.CalleNorte = sdr["callenorte"].ToString();
            z.CalleSur = sdr["callesur"].ToString();
            z.CalleEste = sdr["calleeste"].ToString();
            z.CalleOeste = sdr["calleoeste"].ToString();
            zonas.Add(z);
        }
        sdr.Close();
        return zonas;
    }
    public Zona buscarZonaDomicilio(int idDomicilio)
    {
        SqlParameter p = new SqlParameter("@a", idDomicilio);
        string sql = "select z.idzona" +
        " from domicilio d, zona z" +
        " where d.idzona = z.idzona" +
        " and d.iddomicilio = @a";

        SqlDataReader dr = Datos.obtenerDataReader(sql, p);

        Zona z = new Zona();

        while (dr.Read())
        {
            z.IdZona = Convert.ToInt32(dr[0]);
        }

        dr.Close();
        return z;
    }

}
