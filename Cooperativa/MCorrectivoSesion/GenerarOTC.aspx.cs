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
using System.Collections.Generic;
using System.Net.Mail;

public partial class MCorrectivoSesion_GenerarOTC : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int nroReclamo = Convert.ToInt32(Session["nroReclamo"]);

            Reclamo r = Datos.getOTC().obtenerDatosReclamoActual(nroReclamo);
            DatosUsuario usr = (DatosUsuario)Session["datosUsuario"];
            int nroUsuario = Convert.ToInt32(usr.IdUsuario);

            if (r != null)
            {

                txtNroReclamo.Text = r.NroReclamo.ToString();

                txtTipoReclamo.Text = r.DescripcionTipoReclamo.ToString();
                txtDescripcion.Text = r.Descripcion.ToString();
                txtPrioridad.Text = r.DescPriodidad.ToString();

                txtTipoDoc.Text = r.Socio.DescripcionTipoDoc.ToString();
                txtNroDoc.Text = r.Socio.NroDocumento.ToString();
                txtNombre.Text = r.Socio.Nombre.ToString();
                txtApellido.Text = r.Socio.Apellido.ToString();
                txtNroSocio.Text = r.NroSocio.ToString();

                txtCalle.Text = r.Calle != null ? r.Calle.ToString() : "";
                txtNroCalle.Text = r.NroCalle != null ? r.NroCalle.ToString() : "";
                txtPiso.Text = r.Piso != null ? r.Piso.ToString() : "";
                txtDpto.Text = r.Dpto != null ? r.Dpto.ToString() : "";
                txtZona.Text = r.DescZona != null ? r.DescZona.ToString() : "";

                //me fijo si ya hay alguna OTC para ese Tipo de Reclamo y Zona

                int nroDomicilio = Convert.ToInt32(r.IdDomicilio);

                Zona z = Datos.getZonas().buscarZonaDomicilio(nroDomicilio);

                OrdenTrabajoCorrectivo otc = Datos.getOTC().buscarOTCPendiente(r.TipoReclamo, r.Zona);

                int nroOTCExistente = -1;

                if (otc != null)
                {
                    nroOTCExistente = Convert.ToInt32(otc.NroOTC);
                    ViewState["NROOTC"] = nroOTCExistente;
                }

                TipoReclamoTipico t = Datos.getTipoReclamo().traerDatosTipoReclamo(Convert.ToInt32(r.TipoReclamo));
                int prioridad = Convert.ToInt32(t.Prioridad.ToString());

                if (otc == null)//NO existe ningún reclamo anterior, creo la OTC con el estado que corresponda
                {
                    btnGenerarOTC.Enabled = true;

                    //me fijo si hay algún GGR que esté EN TURNO (3, en realidad según fechas) y DISPONIBLE (1) u OCUPADO (4)

                    int traerGrupoDisponible = Convert.ToInt32(Datos.getGrupoGuardiaReclamo().buscarGrupoEnTurnoSegunEstado(1));
                    int traerGrupoOcupado = Convert.ToInt32(Datos.getGrupoGuardiaReclamo().buscarGrupoEnTurnoSegunEstado(4));
                    int traerGrupoNoDisponible = Convert.ToInt32(Datos.getGrupoGuardiaReclamo().buscarGrupoEnTurnoSegunEstado(2));

                    int nroGrupo = -1;
                    int idEstadoOrden = -1;

                    if (traerGrupoDisponible != 0)      //es decir, hay un Grupo EN TURNO y DISPONIBLE
                    {
                        nroGrupo = traerGrupoDisponible;
                        ViewState["GRUPO"] = nroGrupo;

                        idEstadoOrden = 1; //EN CURSO
                        lblEstadoOTC.Text = "En Curso";

                        //seteo el estado del GGR como OCUPADO (4)
                        Datos.getGrupoGuardiaReclamo().actualizarEstadoGGR(Convert.ToInt32(ViewState["GRUPO"]), 4);

                        ModalPopupOTCNueva.Show();
                    }

                    if (traerGrupoOcupado != 0)  //es decir, hay un Grupo EN TURNO y OCUPADO
                    {
                        nroGrupo = traerGrupoOcupado;
                        ViewState["GRUPO"] = nroGrupo;

                        idEstadoOrden = 2; //PENDIENTE ASIGNACION
                        lblEstadoOTC.Text = "Pendiente";

                        lblGrupoEspera.Text = "La OTC se generará con estado Pendiente hasta tanto se libere el Grupo Nº " + nroGrupo;
                        ModalPopupNoGrupo.Show();
                    }

                    if (traerGrupoNoDisponible != 0)  //es decir, hay un Grupo NO DISPONIBLE
                    {
                        nroGrupo = traerGrupoNoDisponible;
                        ViewState["GRUPO"] = nroGrupo;

                        idEstadoOrden = 2; //PENDIENTE ASIGNACION
                        lblEstadoOTC.Text = "Pendiente";

                        lblGrupoEspera.Text = "La OTC se generará con estado Pendiente hasta tanto se libere el Grupo Nº " + nroGrupo;
                        ModalPopupNoGrupo.Show();
                    }

                    OrdenTrabajoCorrectivo otc1 = new OrdenTrabajoCorrectivo();

                    otc1.NroOTC = Convert.ToInt32(Datos.getOTC().buscarUltimoNroOTC());

                    ViewState["NROOTC"] = otc1.NroOTC;

                    otc1.FechaInicio = DateTime.Now;
                    //otc1.FechaFin = "01/01/0001 00:00:00";
                    otc1.Estado = idEstadoOrden.ToString();
                    otc1.NroGrupoGR = nroGrupo; //sea el Disponible o el Ocupado
                    otc1.IdDomicilio = nroDomicilio;  //el del Reclamo
                    otc1.HoraInicio = Convert.ToDateTime(DateTime.Now.ToString("HH:mm")); ;
                    //otc1.HoraFin = 0;
                    otc1.Usuario = nroUsuario.ToString();
                    //otc1.TiempoResolucion = 0;
                    otc1.Prioridad = prioridad; //le asigno DIRECTAMENTE la prioridad

                    ViewState["PRIORIDAD"] = prioridad;

                    //idOrdenTrabajo, fechaInicio, fechaFin, idEstadoOt, idGuardiaReclamo, idDomicilio, 
                    //horaInicio, horaFin, idUsuario, tiempoResolucion, prioridad

                    bool OTCCreada = Datos.getOTC().crearOTC1(otc1);

                    //agrego el número de la OTC creada y seteo el estado del Reclamo como ASIGNADO (4)    
                    if (OTCCreada)
                    {
                        Datos.getReclamos().actualizarOTenReclamo(nroReclamo, otc1.NroOTC);
                        Datos.getReclamos().actualizarEstadoReclamo(nroReclamo, 4);
                    }
                }
                else  //agrego al Reclamo, la OTC encontrada y seteo la Prioridad de la OTC
                {

                    lblReclamosRelacionados.Text = "Se asociará el reclamo a la OTC Nº " + nroOTCExistente;

                    ModalPopupAsociarOTC.Show();

                    btnGenerarOTC.Enabled = false;

                    Datos.getReclamos().actualizarOTenReclamo(nroReclamo, nroOTCExistente);
                    Datos.getReclamos().actualizarEstadoReclamo(nroReclamo, 4);

                    float prioridadOrden = Convert.ToSingle(otc.Prioridad);
                    float prioridadReclamoIngresado = Convert.ToSingle(prioridad);

                    //actualizo la Prioridad de la Orden
                    if (prioridadReclamoIngresado > prioridadOrden)
                    {
                        int actualizarPrioridad = Datos.getOTC().setearPrioridadOTC(r.NroOTC, prioridadReclamoIngresado);
                        ViewState["PRIORIDAD"] = prioridadReclamoIngresado;

                        lblPrioridad.Text = "Se actualizó la Prioridad de la OTC";
                    }
                    else
                    {
                        ViewState["PRIORIDAD"] = prioridadOrden;
                    }

                    try
                    {
                        Datos.commit();
                    }
                    catch (Exception err)
                    {
                        Console.WriteLine(err.ToString());
                        Datos.rollback();
                    }

                }

                //    //calculo el tiempo de Resolución de la OTC, todo en MINUTOS!!!

                //    int cantidad = Convert.ToInt32(Datos.getOTC().cantidadTiempos(Convert.ToInt32(r.TipoReclamo)));
                //    float tiempo = Convert.ToSingle(Datos.getOTC().traerTiemposResolucion(Convert.ToInt32(r.TipoReclamo)));

                //    float promedioTiempos = (float)tiempo / cantidad;  //tiempo en minutos

                //    float TIEMPO = Convert.ToSingle(Math.Round(promedioTiempos, 2));

                //    float div = TIEMPO / 60; //duracion en horas 

                //    int HORAS = Convert.ToInt32(Math.Floor(div));
                //    float c = div - HORAS; //obtengo la parte decimal para pasarla a minutos
                //    int MINUTOS = Convert.ToInt32(Math.Floor(c * 60));

                //    int DIAS;


                //    if (div > 24)
                //    {
                //        float fl = div / 24;
                //        DIAS = Convert.ToInt32(Math.Floor(fl));
                //        float residuoDias = fl - DIAS; // obtengo la parte decimal para pasarla a horas
                //        float hoo = residuoDias * 24;
                //        int hor = Convert.ToInt32(Math.Floor(residuoDias * 24)); //horas
                //        float decim = hoo - hor; //obtengo la parte decimal para pasarl a minutos
                //        int min = Convert.ToInt32(Math.Floor(decim * 60)); //minutos

                //        lblTiempo.Text = " " + DIAS.ToString() + " día/s " + hor.ToString() + " hora/s " + min.ToString() + " minuto/s";
                //    }
                //    else
                //    {
                //        if (HORAS >= 1)
                //            lblTiempo.Text = " " + HORAS.ToString() + " hora/s " + MINUTOS.ToString() + " minuto/s";
                //        else
                //            lblTiempo.Text = " " + MINUTOS.ToString() + " minuto/s";
                //    }
                //}
                //else 
                //{
                //    //Mostrar mensaje que no se encuentra el reclamo
                //}


                List<Reclamo> listaReclamos = (List<Reclamo>)Datos.getOTC().buscarReclamosOTC1(Convert.ToInt32(ViewState["NROOTC"]));

                if (listaReclamos.Count != 0)  //hay Reclamos previos
                {
                    gvReclamos.Visible = true;
                    lblNoReclamos.Visible = false;
                    gvReclamos.DataSource = listaReclamos;
                    gvReclamos.DataBind();
                }
                else
                {
                    gvReclamos.Visible = false;
                    lblNoReclamos.Visible = true;
                }
            }
        }
    }
    protected void btnGenerarOTC_Click(object sender, EventArgs e)
    {
        ModalPopupConfirmacion.Show();
    }

    protected void btnAceptarRegistrar_Click(object sender, EventArgs e)
    {
        try
        {
            Datos.commit();
        }
        catch (Exception err)
        {
            Console.WriteLine(err.ToString());
            Datos.rollback();
        }

        
        lblGrupoAsignado.Text = ViewState["GRUPO"].ToString();
        lblPrioridadOTC.Text = ViewState["PRIORIDAD"].ToString();
        lblNroOTCCreada.Text = "Nro. OTC: " + ViewState["NROOTC"].ToString();

        ModalPopupConfirmacion.Hide();
        ModalPopupExito.Show();
    }
    protected void btnCancelarRegistrar_Click(object sender, EventArgs e) 
    {
        ModalPopupConfirmacion.Hide();
    }
    protected void btnVolver_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/InicioGuardiaReclamo.aspx", true);
    }
    protected void btnAceptarCancelacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/InicioGuardiaReclamo.aspx", true);
    }
    protected void btnCancelarCancelacion_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Show();
    }
    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)	//popUp Exito
    {
        Response.Redirect("/Cooperativa/InicioGuardiaReclamo.aspx", true);
    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    SmtpClient smtpClient = new SmtpClient("mail.MyWebsiteDomainName.com", 25);

    //    smtpClient.Credentials = new System.Net.NetworkCredential("rraulsuarez@hotmail.com", "myIDPassword");
    //    smtpClient.UseDefaultCredentials = true;
    //    smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
    //    smtpClient.EnableSsl = true;
    //    MailMessage mail = new MailMessage();

    //    //Setting From , To and CC
    //    mail.From = new MailAddress("info@MyWebsiteDomainName", "MyWeb Site");
    //    mail.To.Add(new MailAddress("info@MyWebsiteDomainName"));
    //    mail.CC.Add(new MailAddress("MyEmailID@gmail.com"));

    //    smtpClient.Send(mail);
    //}

    protected void gvReclamos_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[3].Visible = false;
        e.Row.Cells[4].Visible = false;
        e.Row.Cells[5].Visible = false;
        e.Row.Cells[6].Visible = false;
        e.Row.Cells[7].Visible = false;
        e.Row.Cells[10].Visible = false; //idprioridad
        e.Row.Cells[11].Visible = false; //prioridad
        e.Row.Cells[17].Visible = false; //iddomicilio


        foreach (GridViewRow row in gvReclamos.Rows)
        {
            string fecha = Convert.ToDateTime(gvReclamos.Rows[row.RowIndex].Cells[8].Text).ToString("dd/MM/yyyy");
            string hora = Convert.ToDateTime(gvReclamos.Rows[row.RowIndex].Cells[9].Text).ToString("HH:mm");

            gvReclamos.Rows[row.RowIndex].Cells[8].Text = fecha.ToString();
            gvReclamos.Rows[row.RowIndex].Cells[9].Text = hora.ToString();
        }
    }
    protected void btnAceptarNoGrupo_Click(object sender, EventArgs e)
    {
        ModalPopupNoGrupo.Hide();
    }
    protected void btnCancelarNoGrupo_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarRegistrar.Show();
    }
    protected void btnAceptarNuevaOTC_Click(object sender, EventArgs e)
    {
        ModalPopupOTCNueva.Hide();
    }
    protected void btnAceptarAsociarOTC_Click(object sender, EventArgs e)
    {
        ModalPopupAsociarOTC.Hide();
    }
}
