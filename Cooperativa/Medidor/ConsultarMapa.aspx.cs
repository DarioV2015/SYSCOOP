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
using System.Data.OleDb;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.Web.Services;
using System.Collections.Generic;

public partial class Medidor_ConsultarMapa : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String str = "<script> loadMap(); ";
        
        if (chkMedidores.Checked)
            str += " buscarMedidores(); ";
        else
            str += " eliminarMedidores(); ";

        if (chkPostes.Checked)
            str += " buscarPostes(); ";
        else
            str += " eliminarPostes(); ";

        if (chkSubestaciones.Checked)
            str += " buscarSubestaciones(); ";
        else
            str += " eliminarSubestaciones(); ";

        if (chkLineas.Checked)
            str += " cargarLineas(); ";
       /* else
            str += " eliminarSubestaciones(); ";*/

        str += "</script>";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);
        //LLAMAR FUNCION JS desde C#
       /* string str = "<script>loadMap();</script>";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);
        Button2.Attributes.Add("onclick", "return agregarMarcador();");
        btnBuscarMed.Attributes.Add("onclick", "return buscarMedidores();");
        btnEliminarMed.Attributes.Add("onclick", "return eliminarMedidores();");
        Button4.Attributes.Add("onclick", "return buscarDir();");
        btnBuscarPoste.Attributes.Add("onclick", "return buscarPostes();");
        btnEliminarPostes.Attributes.Add("onclick", "return eliminarPostes();");
        btnBuscarSub.Attributes.Add("onclick", "return buscarSubestaciones();");
        btnEliminarSub.Attributes.Add("onclick", "return eliminarSubestaciones();");
        btnBuscarLineas.Attributes.Add("onclick", "return buscarLineas();");*/
    }

    protected void consultarMedidores()
    {
       /* String consultaMedidores = "select * from medidor m, domicilio d, Imagenes i  "+
        " where m.iddomicilio = d.iddomicilio and m.imagen = i.id";
        //SqlConnection con = Conexion.ObtenerConexion();
        DataSet consulta = Conexion.ObtenerDataset(consultaMedidores, con, "medidores");
      //  GridView1.DataSource = consulta.Tables["medidores"];
      //  GridView1.DataBind();

        //string str = "<script>";
           
        /*   while (dr.Read())
           {
                str += "alert('" + dr["IDMEDIDOR"].ToString() + "');";
                break;
           }
           dr.Close();
           str += "</script>";
           Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);*/

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        consultarMedidores();
    }

   
    protected void Button2_Click(object sender, EventArgs e)
    {
        string str = "<script>agregarMarcador();</script>";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);
    }

    [WebMethod]
    public static Object[] getMedidores()
    {
        String consultaMedidores = "select * from medidor m, domicilio d, estadoMedidor e ,Imagenes i   "+
        "where m.iddomicilio = d.iddomicilio and m.idestadomedidor = e.idestadomedidor  and e.imagen = i.id";
        //SqlConnection con = Conexion.ObtenerConexion();

        //DataSet consulta = Datos.obtenerDataset(consultaMedidores, "medidores"); //Conexion.ObtenerDataset(consultaMedidores, con,"medidores");
        SqlDataReader drMedidor = Datos.obtenerDataReader(consultaMedidores); //Conexion.obtenerDataReader(consultaMedidores, con);
        //String a = consulta.Tables["medidores"].Count();
        List<Marcador> medidores = new List<Marcador>();

        while (drMedidor.Read())
        {
            Marcador m = new Marcador();
            m.Id = drMedidor["IDMEDIDOR"].ToString();
            m.Latitud = drMedidor["LATITUD"].ToString() ;
            m.Longitud = drMedidor["LONGITUD"].ToString();
            m.Imagen = drMedidor["descripcion"].ToString();
            m.EsNuevo = "N";
            medidores.Add(m);
        }
        drMedidor.Close();

        return medidores.ToArray();
    }

    public void buscarMaximo() {

       /* String consultaMedidores = "select max(idmedidor) maximo from medidor m";
       // SqlConnection con = Conexion.ObtenerConexion();
        SqlDataReader drMax = new SqlDataReader();//Conexion.obtenerDataReader(consultaMedidores, con);

        String maximo ="";

        while (drMax.Read())
        {
            maximo = drMax["maximo"].ToString();
        }
        drMax.Close();

        Session["maximo"] = maximo;*/
    }
    protected void btnBuscarPoste_Click(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static Object[] getPostes()
    {
        String consultaPostes = "select idposte, latitud, longitud, descripcion from poste p with(NOLOCK), domicilio d with(NOLOCK), imagenes i " +
                                   " where p.iddomicilio = d.iddomicilio and i.id = 3;";
        //SqlConnection con = Conexion.ObtenerConexion();

        DataSet consulta = Datos.obtenerDataset(consultaPostes, "postes"); //Conexion.ObtenerDataset(consultaMedidores, con,"medidores");
        SqlDataReader drPostes = Datos.obtenerDataReader(consultaPostes); //Conexion.obtenerDataReader(consultaMedidores, con);
        //String a = consulta.Tables["medidores"].Count();
        List<Marcador> postes = new List<Marcador>();

        int i = 0;

        while (drPostes.Read())
        {
            Marcador m = new Marcador();
            m.Id = drPostes["IDPOSTE"].ToString();
            m.Latitud = drPostes["LATITUD"].ToString();
            m.Longitud = drPostes["LONGITUD"].ToString();
            m.Imagen = drPostes["descripcion"].ToString();
            m.EsNuevo = "N";
            postes.Add(m);
        }
        drPostes.Close();

        return postes.ToArray();
    }


    [WebMethod]
    public static Object[] getSubestaciones()
    {
        List<Marcador> subestaciones = Datos.getSubestaciones().buscarSubestaciones();
        return subestaciones.ToArray();
    }
    /*
    [WebMethod]
    public static Object[] getSubestaciones()
    {
        String consultaSubestaciones = "select idsubestacion, latitud, longitud, i.descripcion from subestacion s, domicilio d, imagenes i " +
                                   " where s.iddomicilio = d.iddomicilio and i.id = 4;";
        //SqlConnection con = Conexion.ObtenerConexion();

        DataSet consulta = Datos.obtenerDataset(consultaSubestaciones, "subestaciones"); //Conexion.ObtenerDataset(consultaMedidores, con,"medidores");
        SqlDataReader drSubestaciones = Datos.obtenerDataReader(consultaSubestaciones); //Conexion.obtenerDataReader(consultaMedidores, con);
        //String a = consulta.Tables["medidores"].Count();
        Marcador[] subestaciones = new Marcador[10];

        int i = 0;

        while (drSubestaciones.Read())
        {
            Marcador m = new Marcador();
            m.Id = drSubestaciones["idsubestacion"].ToString();
            m.Latitud = drSubestaciones["LATITUD"].ToString();
            m.Longitud = drSubestaciones["LONGITUD"].ToString();
            m.Imagen = drSubestaciones["descripcion"].ToString();
            m.EsNuevo = "N";
            subestaciones[i++] = m;
        }
        drSubestaciones.Close();

        return subestaciones;
    }*/

    [WebMethod(EnableSession = true)]
    public static Object[] getLineas()
    {
        String lin = HttpContext.Current.Session["linea"].ToString();
        Marcador[] lineas = Datos.getLineas().obtenerLineas(lin);

        return lineas;
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        Session["linea"] = ((TextBox)sender).Text;
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }

    [WebMethod]
    public static Object[] buscarTodasLineas()
    {
        Object[] arr = Datos.getLineas().obtenerTodasLasLineas().ToArray();
        return arr;
    }

    [WebMethod(EnableSession = true)]
    public static Object[] getLinea(String linea)
    {
        Marcador[] lineas = Datos.getLineas().buscarElementosByLinea(linea).ToArray();
        return lineas;
    }
}
