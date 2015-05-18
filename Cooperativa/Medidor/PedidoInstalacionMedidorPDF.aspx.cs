using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;

public partial class Medidor_PedidoInstalacionMedidorPDF : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string path = Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, " ");

        //string archivo = path + "\\PDF\\PedidoDeInstalacion" + Session["nroPedido"] + ".pdf";

        string archivo = path + "\\Archivos\\PedidoDeInstalacion.pdf";
        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.AddHeader("Content-Disposition","attachment; filename=" + "Comprobante");
        //HttpContext.Current.Response.AddHeader("Content-Length",toDownload.Length.ToString());
        HttpContext.Current.Response.ContentType = "application/pdf";
        HttpContext.Current.Response.WriteFile(archivo);
        HttpContext.Current.Response.End();

    }
}
