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
using System.Web.Services;
using System.Collections.Generic;

//Clases necesarias de iTextSharp
using iTextSharp;
using iTextSharp.text.pdf;
using iTextSharp.text;
using System.IO;
using System.Net;

public partial class Medidor_RegistrarPedidoInstalacionMedidor : System.Web.UI.Page
{
    //private bool asd = false; ViewState["cambioDomicilio"]= false;;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ViewState["cambioDomicilio"] = false;
            Boolean asd = Convert.ToBoolean(ViewState["cambioDomicilio"]);
            ViewState["nuevoDomicilio"] = asd;
            DatosUsuario usr = (DatosUsuario) Session["datosUsuario"];
            Socio s = Datos.getSocios().traerDatosSocio(Convert.ToInt32(usr.NroSocio)); //luego tengo que pasar el nroSocio por el usuario logueado
            this.txtNroSocio.Text = Convert.ToString(s.IdSocio);
            this.txtApellido.Text = s.Apellido;
            this.txtNombre.Text = s.Nombre;
            this.txtNroDocumento.Text = Convert.ToString(s.NroDocumento);
            this.txtNombreCalle.Text = s.NombreCalle;
            this.txtNroCalle.Text = Convert.ToString(s.NroCalle);
            this.txtNroPiso.Text = Convert.ToString(s.NroPiso);
            this.txtDpto.Text = Convert.ToString(s.Dpto);
            this.txtZona.Text = s.DescripcionZona;
            ViewState["nroZona"] = Convert.ToInt32(s.NroZona);
            ViewState["domicilio"] = s.IdDomicilio;

            verificarDomicilio(s.NombreCalle, Convert.ToString(s.NroCalle), Convert.ToString(s.NroPiso), Convert.ToString(s.Dpto),s.Idcalle);
        }
    }
    protected void comboTipoMedidor_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<Medidor> listaMedidoresDisponibles = Datos.getMedidores().traerMedidoresDisponibles();

        int estadoPedido = 0;

        if (listaMedidoresDisponibles.Count == 0) //no hay Medidores disponibles
        {
            estadoPedido = 1;  //PENDIENTE, es decir, NO hay medidores disponibles
            ViewState["estadoPedido"] = estadoPedido;

            ModalPopupNoMedidor.Show();
        }
        else
        {
            foreach (Medidor m in listaMedidoresDisponibles)
            {
                int nroMedidor = Convert.ToInt32(m.NroMedidor);
                ViewState["nroMedidorAsignado"] = nroMedidor;

                estadoPedido = 2;  //ASIGNADO, es decir, hay medidores disponibles
                ViewState["estadoPedido"] = estadoPedido;

                break;
            }
        }
    }
    protected void btnConfirmarPedido_Click(object sender, EventArgs e)
    {
        List<Medidor> listaMedidoresDisponibles = Datos.getMedidores().traerMedidoresDisponibles();

        if (listaMedidoresDisponibles.Count != 0)
        {
            foreach (Medidor m in listaMedidoresDisponibles)
            {
                lblNroMedidorAsignar.Text = m.NroMedidor;
                ViewState["numMedidor"] = m.NroMedidor;
                lblNroFabAsignar.Text = m.NroFabricacion;
                ViewState["nroFabricacion"] = m.NroFabricacion;
                ViewState["fechaAlta"] = m.FechaAlta;
                lblNroLoteAsignar.Text = m.NroLote;

                break;
            }
        }

        ModalPopUpConfirmacion.Show();
    }
    protected void btnAceptarPedidoPendiente_Click(object sender, EventArgs e)
    {
        ModalPopupNoMedidor.Hide();
    }
    protected void btnCancelarPedidoPendiente_Click(object sender, EventArgs e)
    {
        ModalPopupNoMedidor.Hide();
    }
    protected void btnCancelarPedido_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarPedido.Show();
    }
    protected void btnAceptarPedido_Click(object sender, EventArgs e)
    {
        try
        {
            int estadoPedido = Convert.ToInt32(ViewState["estadoPedido"]);

            if (estadoPedido == 2) //hay medidores disponibles
            {
                int nroMedidorAsignado = Convert.ToInt32(ViewState["nroMedidorAsignado"]);
                bool resultado = Datos.getMedidores().actualizarStockMedidores(nroMedidorAsignado);

                if (resultado)
                {
                    //Genero el nuevo Pedido de Instalacion con Medidor

                    PedidoInstalacion pi = new PedidoInstalacion();

                    pi.NroPedido = Convert.ToInt32(Datos.getPedidosInstalacion().obtenerUltimoNroPedido());
                    Session["nroPedido"] = pi.NroPedido;
                    pi.NroSocio = Convert.ToInt32(this.txtNroSocio.Text);
                    pi.NroMedidor = Convert.ToInt32(nroMedidorAsignado);
                    pi.FechaPedido = Convert.ToDateTime(DateTime.Now.ToString());

                    if (Convert.ToBoolean(ViewState["nuevoDomicilio"]) == false) //si no cambió el domicilio
                        pi.IdDomicilio = Convert.ToInt32(ViewState["domicilio"]);
                    else
                    {
                        //genero nuevo domicilio

                        Calle c = new Calle();
                        c.IdCalle = Datos.getCalle().obtenerUltNroCalle();
                        c.NombreCalle = this.txtNombreCalle.Text;

                        Datos.getDomicilios().crearCalle(c);

                        // 2 - Creo un Domicilio

                        Domicilio d = new Domicilio();
                        d.IdDomicilio = Convert.ToInt32(Datos.getDomicilios().obtenerUltNroDomicilio());
                        d.NroCalle = Convert.ToInt32(txtNroCalle.Text);
                        d.Piso = Convert.ToInt32(txtNroPiso.Text);
                        d.IdCalle = c.IdCalle;
                        d.IdZona = Convert.ToInt32(comboZona.SelectedValue);
                        d.Dpto = txtDpto.Text;
                        // De donde saco la latitud y longitud???

                        Datos.getDomicilios().crearDomicilio(d);

                        pi.IdDomicilio = Convert.ToInt32(d.IdDomicilio);

                        ViewState["domicilio"] = d.IdDomicilio;
                    }

                    pi.Estado = Convert.ToInt32("2"); //Pedido de Instalación ASIGNADO

                    bool creoPedido = false;

                    if (Datos.getPedidosInstalacion().crearPedidoInstalacion(pi))
                        creoPedido = true;

                    //actualizo el Estado del Medidor a 2: Asignado

                    int estadoMedidor = Datos.getMedidores().actualizarEstadoMedidor(2, nroMedidorAsignado);

                }

                panelMedidorAsignado.Visible = true;
            }

            if (estadoPedido == 1) //NO hay medidores disponibles
            {
                //Genero el nuevo Pedido de Instalacion con SIN Medidor

                PedidoInstalacion pi = new PedidoInstalacion();

                pi.NroPedido = Convert.ToInt32(Datos.getPedidosInstalacion().obtenerUltimoNroPedido());
                Session["nroPedido"] = pi.NroPedido;
                pi.NroSocio = Convert.ToInt32(this.txtNroSocio.Text);
                pi.FechaPedido = Convert.ToDateTime(DateTime.Now.ToString());

                if (Convert.ToBoolean(ViewState["nuevoDomicilio"]) == false) //si no cambió el domicilio
                    pi.IdDomicilio = Convert.ToInt32(ViewState["domicilio"]);
                else
                {
                    //genero nuevo domicilio

                    Calle c = new Calle();
                    c.IdCalle = Datos.getCalle().obtenerUltNroCalle();
                    c.NombreCalle = this.txtNombreCalle.Text;

                    Datos.getDomicilios().crearCalle(c);

                    // 2 - Creo un Domicilio

                    Domicilio d = new Domicilio();
                    d.IdDomicilio = Convert.ToInt32(Datos.getDomicilios().obtenerUltNroDomicilio());
                    d.NroCalle = Convert.ToInt32(txtNroCalle.Text);
                    d.Piso = Convert.ToInt32(txtNroPiso.Text);
                    d.IdCalle = c.IdCalle;
                    d.IdZona = Convert.ToInt32(comboZona.SelectedValue);
                    d.Dpto = txtDpto.Text;
                    // De donde saco la latitud y longitud???

                    Datos.getDomicilios().crearDomicilio(d);

                    pi.IdDomicilio = Convert.ToInt32(d.IdDomicilio);

                    ViewState["domicilio"] = d.IdDomicilio;
                }

                pi.Estado = Convert.ToInt32("1"); //Pedido de Instalación PENDIENTE

                bool creoPedido = false;

                if (Datos.getPedidosInstalacion().crearPedidoInstalacion(pi))
                    creoPedido = true;

                panelMedidorAsignado.Visible = false;
            }

            Datos.commit();
        }
        catch (Exception err)
        {
            Console.WriteLine(err.ToString());
            Datos.rollback();//sqt.Rollback();
        }

        ModalPopUpConfirmacion.Hide();
        ModalPopupExito.Show();
    }
    protected void btnCancelarPedidoConfirmacion_Click(object sender, EventArgs e)
    {
        ModalPopUpConfirmacion.Hide();
    }
    protected void btnAceptarCancelacionPedido_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }
    protected void btnCancelarCancelacionPedido_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarPedido.Hide();
    }
    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }
    protected void btnVerComprobante_Click(object sender, EventArgs e)
    {
        int estadoPedido = Convert.ToInt32(ViewState["estadoPedido"]);

        if (estadoPedido == 2) //si hay medidores disponibles muestro el PDF completo
        {
            generarPDF1();
        }
        else
        {
            generarPDF2(); //muestro el PDF sin medidor
        }
    }
    protected void generarPDF1()
    {
        //recupero los Datos del Medidor

        int nroMedidor = Convert.ToInt32(ViewState["numMedidor"]);
        int codFabricacion = Convert.ToInt32(ViewState["nroFabricacion"]);
        DateTime fechaAlta = Convert.ToDateTime(ViewState["fechaAlta"]);

        //recupero el domicilio sea nuevo o viejo

        Domicilio d = Datos.getDomicilios().getDomicilio2(Convert.ToInt32(ViewState["domicilio"]));

        try
        {
            Document document = new Document();

            string path = Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, " ");

            //PdfWriter.GetInstance(document, new FileStream(path + "\\PDF\\PedidoDeInstalacion" + Session["nroPedido"] + ".pdf", FileMode.OpenOrCreate));
            PdfWriter.GetInstance(document, new FileStream(path + "\\Archivos\\PedidoDeInstalacion.pdf", FileMode.OpenOrCreate));
            document.Open();
            //string ubicacion = path + "\\PDF\\PedidoDeInstalacion" + Session["nroPedido"] + ".pdf";

            string ubicacion = path + "\\Archivos\\PedidoDeInstalacion.pdf";

            iTextSharp.text.Image jpg = iTextSharp.text.Image.GetInstance(path + "\\Imagenes\\SISE_logo_RGB.jpg");
            jpg.Alignment = iTextSharp.text.Image.MIDDLE_ALIGN;
            jpg.ScaleToFit(90, 90);
            document.Add(jpg);

            document.Add(new Paragraph("Nuevo Pedido de Instalación"));
            document.Add(new Paragraph(" "));

            //creo Tabla

            PdfPTable tabla = new PdfPTable(1);     //Numero de columnas

            for (int i = 0; i < 1; i++)
            {
                tabla.AddCell("Nº de Pedido: " + Session["nroPedido"]);
                tabla.AddCell("Fecha de Pedido: " + DateTime.Now.ToString("dd/MM/yyyy"));
                tabla.AddCell("Hora de Pedido: " + DateTime.Now.ToString("HH:mm") + " hs.");
                tabla.AddCell("Nº de Socio: " + txtNroSocio.Text);
                tabla.AddCell("Apellido de Socio: " + txtApellido.Text);
                tabla.AddCell("Nombre de Socio: " + txtNombre.Text);
                tabla.AddCell("Domicilio de Instalación: " + d.NombreCalle + " Nº: " + d.NroCalle + " , Piso: " + d.Piso + " , Dpto: " + d.Dpto + " , Zona: " + d.Zona);
                tabla.AddCell("Código de Fabricación del Medidor: " + codFabricacion);
                tabla.AddCell("Fecha de Alta del Medidor: " + fechaAlta.ToString("dd/MM/yyyy"));

            }

            document.Add(tabla);
            document.Add(new Paragraph(" "));
            document.Add(new Paragraph(" "));

            document.Close();

            Response.Redirect("./PedidoInstalacionMedidorPDF.aspx", false);


        }
        catch (Exception er)
        {
            Console.WriteLine(er.ToString());
        }
    }
    protected void generarPDF2()
    {
        //recupero el domicilio sea nuevo o viejo

        Domicilio d = Datos.getDomicilios().getDomicilio2(Convert.ToInt32(ViewState["domicilio"]));

        try
        {
            Document document = new Document();

            string path = Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, " ");

            //PdfWriter.GetInstance(document, new FileStream(path + "\\PDF\\PedidoDeInstalacion" + Session["nroPedido"] + ".pdf", FileMode.OpenOrCreate));
            PdfWriter.GetInstance(document, new FileStream(path + "\\Archivos\\PedidoDeInstalacion.pdf", FileMode.OpenOrCreate));
            document.Open();
            //string ubicacion = path + "\\PDF\\PedidoDeInstalacion" + Session["nroPedido"] + ".pdf";

            string ubicacion = path + "\\Archivos\\PedidoDeInstalacion.pdf";

            iTextSharp.text.Image jpg = iTextSharp.text.Image.GetInstance(path + "\\Imagenes\\SISE_logo_RGB.jpg");
            jpg.Alignment = iTextSharp.text.Image.MIDDLE_ALIGN;
            jpg.ScaleToFit(90, 90);
            document.Add(jpg);

            document.Add(new Paragraph("Nuevo Pedido de Instalación"));
            document.Add(new Paragraph(" "));

            //creo Tabla

            PdfPTable tabla = new PdfPTable(1);     //Numero de columnas

            for (int i = 0; i < 1; i++)
            {
                tabla.AddCell("Nº de Pedido: " + Session["nroPedido"]);
                tabla.AddCell("Fecha de Pedido: " + DateTime.Now.ToString("dd/MM/yyyy"));
                tabla.AddCell("Hora de Pedido: " + DateTime.Now.ToString("HH:mm") + " hs.");
                tabla.AddCell("Nº de Socio: " + txtNroSocio.Text);
                tabla.AddCell("Apellido de Socio: " + txtApellido.Text);
                tabla.AddCell("Nombre de Socio: " + txtNombre.Text);
                tabla.AddCell("Domicilio de Instalación: " + d.NombreCalle + " Nº: " + d.NroCalle + " , Piso: " + d.Piso + " , Dpto: " + d.Dpto + " , Zona: " + d.Zona);
                tabla.AddCell("Código de Fabricación del Medidor: s/d");
                tabla.AddCell("Fecha de Alta del Medidor: s/d");

            }

            document.Add(tabla);
            document.Add(new Paragraph(" "));
            document.Add(new Paragraph(" "));
            document.Add(new Paragraph("Nota: La instalación del medidor se realizará dentro de las 72 hs. hábiles de generado el Pedido.", FontFactory.GetFont("arial", 11, Font.BOLD)));


            document.Close();

            Response.Redirect("./PedidoInstalacionMedidorPDF.aspx", false);


        }
        catch (Exception er)
        {
            Console.WriteLine(er.ToString());
        }
    }
    protected void btnNuevaDireccion_Click(object sender, EventArgs e)
    {
        this.btnNuevaDireccion.Enabled = false;
        this.btnNuevaDireccion.Visible = false;
        this.btnAceptarNuevaDireccion.Visible = true;
        this.btnCancelarNuevaDireccion.Visible = true;
        //this.comboZona.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccione la Zona", "0"));
        txtZona.Visible = false;
        comboZona.Visible = true;
        this.comboZona.SelectedIndex = 0;

        this.txtNombreCalle.Enabled = true;
        this.txtNombreCalle.Focus();
        this.txtNombreCalle.Text = " ";
        this.txtNroCalle.Enabled = true;
        this.txtNroCalle.Text = " ";
        this.txtNroPiso.Enabled = true;
        this.txtNroPiso.Text = " ";
        this.txtDpto.Enabled = true;
        this.txtDpto.Text = " ";
        this.comboZona.Enabled = true;

        String str = "<script>loadMap(); </script>";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);
    }
    protected void btnAceptarNuevaDireccion_Click(object sender, EventArgs e)
    {
        ViewState["cambioDomicilio"] = true;
        Boolean asd = Convert.ToBoolean(ViewState["cambioDomicilio"]);
        ViewState["nuevoDomicilio"] = asd;

        this.btnAceptarNuevaDireccion.Visible = false;
        this.btnCancelarNuevaDireccion.Visible = false;
        this.btnNuevaDireccion.Enabled = true;

        this.btnNuevaDireccion.Visible = true;

        this.txtNombreCalle.Enabled = false;
        txtNroCalle.Enabled = false;
        txtNroPiso.Enabled = false;
        txtDpto.Enabled = false;
        this.comboZona.Enabled = false;

        if (this.txtNroCalle.Text == " ")
            txtNroCalle.Text = "0";
        if (this.txtNroPiso.Text == " ")
            txtNroPiso.Text = "0";
        if (this.txtDpto.Text == " ")
            txtDpto.Text = "0";

        verificarDomicilio(this.txtNombreCalle.Text, txtNroCalle.Text, txtNroPiso.Text, txtDpto.Text, "0");

    }
    protected void btnCancelarNuevaDireccion_Click(object sender, EventArgs e)
    {
        this.btnAceptarNuevaDireccion.Visible = false;
        this.btnCancelarNuevaDireccion.Visible = false;

        this.btnNuevaDireccion.Enabled = true;
        this.btnNuevaDireccion.Visible = true;

        comboZona.Visible = false;
        txtZona.Visible = true;

        DatosUsuario usr = (DatosUsuario)Session["datosUsuario"];
        Socio s = Datos.getSocios().traerDatosSocio(Convert.ToInt32(usr.NroSocio)); //luego tengo que pasar el nroSocio por el usuario logueado

        this.txtNroDocumento.Text = Convert.ToString(s.NroDocumento);
        this.txtNombreCalle.Text = s.NombreCalle;
        this.txtNroCalle.Text = Convert.ToString(s.NroCalle);
        this.txtNroPiso.Text = Convert.ToString(s.NroPiso);
        this.txtDpto.Text = Convert.ToString(s.Dpto);
        txtZona.Text = s.DescripcionZona;

        this.txtNombreCalle.Enabled = false;
        this.txtNroCalle.Enabled = false;
        this.txtNroPiso.Enabled = false;
        this.txtDpto.Enabled = false;
        txtZona.Enabled = false;

        verificarDomicilio(s.NombreCalle, Convert.ToString(s.NroCalle), Convert.ToString(s.NroPiso), Convert.ToString(s.Dpto), s.Idcalle);
    }

    [WebMethod]
    public static void setMedidor(String idcalle, String nroCalle, String piso, String depto, String lat, String lon)
    {
        int idDom = Datos.getDomicilios().buscarDomicilio(Convert.ToInt32(idcalle), Convert.ToInt32(nroCalle), piso, depto);
        if (idDom > 0)
        {
            Datos.getDomicilios().actualizarLocalizacion(idDom, lat, lon);
        }
        else
        {
            Domicilio d = new Domicilio();
            d.IdDomicilio = Datos.getDomicilios().obtenerUltimoIdDomicilio();
            d.IdCalle = Convert.ToInt32(idcalle);
            d.NroCalle = Convert.ToInt32(nroCalle);
            if (piso.Length > 0)
                d.Piso = Convert.ToSingle(piso);
            d.Dpto = depto;
            d.Latitud = lat;
            d.Longitud = lon;
            d.IdZona = 1;

            int creado = Datos.getDomicilios().crearDomicilio(d);
            if (creado > 0)
            {

            }

        }
    }

    protected void verificarDomicilio(String calle, String nro, String piso, String dpto, String idcalle)
    {
        String str = "<script>loadMap(); verificarDomicilio('" + calle + "','" + nro + "','" + piso + "','" + dpto + "','" + idcalle + "');</script>";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", str, false);
    }

    [WebMethod]
    public static Object[] buscarTodosPostes()
    {
        List<Marcador> postes = Datos.getPostes().buscarTodosPostes();
        return postes.ToArray();
    }

    [WebMethod]
    public static Object[] getElementosByLinea(String idlinea)
    {

        return Datos.getLineas().buscarElementosByLinea(idlinea).ToArray();
    }
}
