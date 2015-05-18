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
/// Descripción breve de PedidoInsumos
/// </summary>
public class PedidoInsumos
{
    public List<PedidoInsumo> buscarPedidos(int codInsumo)
    {
        String sql = "SELECT DISTINCT PIN.IDPEDIDO, convert(char(10), PIN.FECHA, 103), T.DESCRIPCION " +
                    "FROM DETALLEPEDIDOINSUMO DP, PEDIDOINSUMO PIN,TIPOINSUMO T" +
                    "WHERE DP.IDINSUMO = " + codInsumo +
                    "AND T.IDTIPOINSUMO=PIN.IDTIPOINSUMO " +
                    "AND (PIN.IDESTADOPEDIDOINSUMO=1 OR PIN.IDESTADOPEDIDOINSUMO=2) ";


        SqlDataReader sdr = Datos.obtenerDataReader(sql);
        List<PedidoInsumo> insumos = new List<PedidoInsumo>();
        
        while (sdr.Read())
        {
            PedidoInsumo i = new PedidoInsumo();
            i.NroPedido = Convert.ToInt32(sdr[0]);
            i.Fecha = Convert.ToDateTime(sdr[1]);
            i.TipoInsumo = Convert.ToString(sdr[2]);

            insumos.Add(i);
        }
        sdr.Close();

        return insumos;
    }
    
    public PedidoInsumos()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
