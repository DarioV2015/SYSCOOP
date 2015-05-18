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
/// Descripción breve de Mails
/// </summary>
public class Mails
{
	public Mails()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public List<SociosMails> obtenerMailsCorte(int nroCorte)
    {
        string sql = "select s.idsocio, p.apellido, p.nombre, p.nrodocumento, p.email" +
        " from persona p, socio s, medidor m, linea l, corteprogramado cp" +
        " where s.nrodocumento = p.nrodocumento" +
        " and s.idtipodocumento = p.tipodocumento" +
        " and m.idsocio = s.idsocio" +
        " and m.idlinea = l.idlinea" +
        " and cp.fechainicio > CURRENT_TIMESTAMP" +
        " and cp.idcorte = " + nroCorte;

        SqlDataReader dr = Datos.obtenerDataReader(sql);

        SociosMails sm;
        List<SociosMails> listaSocios = new List<SociosMails>();
        //string cadenaMails = " ";

        while (dr.Read())
        {
               //cadenaMails += dr[4].ToString() + ",";
            if (dr[4].GetType() != Type.GetType("System.DBNull"))
            {
                sm = new SociosMails();

                sm.NroSocio = Convert.ToInt32(dr[0]);
                sm.Apellido = dr[1].ToString();
                sm.Nombre = dr[2].ToString();
                sm.NroDocumento = Convert.ToInt32(dr[3]);
                sm.Email = dr[4].ToString();

                //listaSocios.Add(sm);
            }
            else
            {
                sm = new SociosMails();

                sm.NroSocio = Convert.ToInt32(dr[0]);
                sm.Apellido = dr[1].ToString();
                sm.Nombre = dr[2].ToString();
                sm.NroDocumento = Convert.ToInt32(dr[3]);
                sm.Email = null;

                //listaSocios.Add(sm);
            }

            listaSocios.Add(sm); 
        }

        dr.Close();
        return listaSocios;
    }
    public int setearCorteNotificado(int nroCorte)
    {
        string sql = "update corteprogramado" +
        " set notificacion = 2" +
        " where idcorte = " + nroCorte;

        List<SqlParameter> param = new List<SqlParameter>();

        int filas = 0;

        try
        {
            filas = Datos.ejecutarComando(sql);
        }
        catch (SqlException ole)
        {
            string msg = ole.Message.ToString();
        }

        return filas;
    }
}
