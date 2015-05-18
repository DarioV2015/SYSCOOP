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
using System.Data.SqlClient;
using System.Collections.Generic;
using System.IO; 

public partial class Medidor_RegistrarTipoResutladoInstalacionMedidor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
 

    public static int obtenerUltimoNroTipoResultadoInstMedidor()
    {
        string sql = "select max (IDTIPORESULTADO) from TIPORESULTADOIM";
       //SqlConnection con = Conexion.ObtenerConexion();
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }


    public static int crearTipoResultadoIM(TipoResultadoIM trim)
    {
      
        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", trim.IdTipoEstadoIM));
        param.Add(new SqlParameter("@b", trim.Descripcion));
        param.Add(new SqlParameter("@c", trim.Nombre));
        param.Add(new SqlParameter("@d", trim.EstadoIM));


//        SqlConnection con = Conexion.ObtenerConexion();
        // Si no uso esta forma para obtener la conexión dónde obtengo la conexión en esta clase???

        string sql = "insert into TIPORESULTADOIM(IDTIPORESULTADO, DESCRIPCION, NOMBRE, ESTADO) values (@a,@b,@c,@d)";
        int filas = Datos.ejecutarComando(sql,param);
        if (filas != 0)
        { Datos.commit(); }
        return filas;

    }
   
     protected void btnGuardar_Click(object sender, EventArgs e)
    {
            // Genero el nuevo Tipo de Resultado de Instalacion M


        TipoResultadoIM trim = new TipoResultadoIM();

        trim.IdTipoEstadoIM = Convert.ToInt32(obtenerUltimoNroTipoResultadoInstMedidor());
        trim.Descripcion = Convert.ToString(this.txtDescripcion.Text);
        trim.Nombre = Convert.ToString(this.txtNombre.Text);
        trim.EstadoIM = Convert.ToInt32(this.ddlEstadoInstMedidor.SelectedValue);
         
          
      crearTipoResultadoIM(trim);

      }

     protected void sdsEstadoInstMedidor_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
     {

     }
     protected void btnCancelar_Click(object sender, EventArgs e)
     {
         Response.Redirect("/Cooperativa/Default.aspx", false);
     }
     protected void Button1_Click(object sender, EventArgs e)
     {
         Response.Redirect("/Cooperativa/Medidor/RegistrarResultadoInstalacionMedidor.aspx", false);
     }
}
