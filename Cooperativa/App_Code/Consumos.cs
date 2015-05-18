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
/// Descripción breve de Consumos
/// </summary>
public class Consumos
{
    public Consumos()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public static Consumo ObtenerConsumoPorIdDeMedidor(int IdMedidor)
    {
        String wszSql;
        Consumo oConsumo = null ;
        SqlParameter oMedidor;
        SqlDataReader oDr;
        List<Consumo> oListaConsumos;
     

        try
        {
            oMedidor = new SqlParameter("@IdMedidor", IdMedidor);
            SqlParameter[] para = { oMedidor };

            wszSql = "SELECT TOP 2 FECHAMEDICION, LECTURACONSUMO " +
                         "FROM CONSUMO " +
                         "WHERE MEDIDOR = @IdMedidor " +
                         "ORDER BY FECHAMEDICION DESC";

            oDr = (Datos.obtenerDataReader(wszSql, para));

            if (oDr.FieldCount > 0)
            {

                if (oDr.FieldCount == 2)
                {
                    oListaConsumos = new List<Consumo>();
                    
                    while (oDr.Read())
                    {
                        oConsumo = new Consumo();
                        oConsumo.FechaMedicion = Convert.ToDateTime(oDr[0]);
                        oConsumo.LecturaConsumo = Convert.ToDouble(oDr[1]);
                        oListaConsumos.Add(oConsumo);
                    }

                    oListaConsumos[0].LecturaConsumo = oListaConsumos[0].LecturaConsumo - oListaConsumos[1].LecturaConsumo;
                    return oListaConsumos[0];

                    oDr.Close();

                }
                else
                {
                    while (oDr.Read())
                    {
                        oConsumo = new Consumo();
                        oConsumo.FechaMedicion = Convert.ToDateTime(oDr[0]);
                        oConsumo.LecturaConsumo = Convert.ToDouble(oDr[1]);
                        oConsumo.LecturaConsumoUltimoPeriodo = Convert.ToDouble(oDr[1]);
                        // Estaría bueno actualizar la documentación mostrando este caso del primer mes donde
                        // sólo nos devuelve un único consumo.
                    }
                    oDr.Close();


                }
            }



        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            oDr = null;
            oMedidor = null;
        }


        return oConsumo;
    }
}
