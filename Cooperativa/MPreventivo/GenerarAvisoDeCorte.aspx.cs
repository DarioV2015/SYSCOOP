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

public partial class MPreventivo_GenerarAvisoDeCorte : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if(gvCortes.Rows.Count == 0)
            {
                lblNoHayCortes.Visible = true;
                lblNoHayCortes.Text = "No hay Cortes Programados";
                btnEnviarMail.Enabled = false;
                gvCortes.Visible = false;
            }
            else
            {
                lblNoHayCortes.Visible = false;
                btnEnviarMail.Enabled = true;
            }
        }
    }
    protected void btnEnviarMail_Click(object sender, EventArgs e)
    {
        ModalPopUpEnviar.Show();
    }
    protected void btnAceptarEnvio_Click(object sender, EventArgs e)
    {
        try
        {
            // 0: chkCorte
            //1: idcorte
            //2: motivo
            //3: fechaInicio
            //4: horaInicio
            //5: fechaFin
            //6: horaFin
            //7: duracion-----
            //8: idLinea
            //9: descripcion

            string sociosSinMail = " ";         
            List<Socio> listaSociosSinMail = new List<Socio>();
           
            foreach (GridViewRow row in gvCortes.Rows)
            {
                RadioButton rdb = (RadioButton)row.FindControl("gvCortes_rdbSeleccionado");
                if (row.Visible == true && rdb.Checked)
                {
                    List<SociosMails> listaSocios = (List<SociosMails>)Datos.getMails().obtenerMailsCorte(Convert.ToInt32(gvCortes.Rows[row.RowIndex].Cells[1].Text));

                    foreach (SociosMails sm in listaSocios)
                    {
                        if (sm.Email != null)
                        {
                            MailMessage mail = new MailMessage();
                            {
                                mail.From = new MailAddress("sise.coopfel@gmail.com");
                                mail.Body = "Estimado/a: " + sm.Nombre + " " + sm.Apellido + " " + "\n" +
                                " Nº Socio: " + sm.NroSocio + ", Documento Nº: " + sm.NroDocumento + " " + "\n" + "\n" +
                                " Le informamos que se efectuará un corte de suministro eléctrico el día " + gvCortes.Rows[row.RowIndex].Cells[3].Text +
                                " a partir de las " + gvCortes.Rows[row.RowIndex].Cells[4].Text + " hs." +
                                " Se prevé una interrupción del servicio durante " + gvCortes.Rows[row.RowIndex].Cells[7].Text + " aproximadamente," +
                                " situación que se estaría normalizando alrededor de las " + gvCortes.Rows[row.RowIndex].Cells[6].Text + " hs." + "\n" +
                                " El motivo del corte es " + gvCortes.Rows[row.RowIndex].Cells[2].Text + "." + "\n" + "\n" +
                                " Disculpe las molestias ocasionadas." + "\n" +
                                " SISE.";

                                mail.Subject = "Aviso Corte de Energía";
                                mail.IsBodyHtml = false;
                            }

                            mail.To.Add(new MailAddress(sm.Email));

                            SmtpClient smtp = new SmtpClient();
                            {
                                smtp.Host = "smtp.gmail.com";
                                smtp.Port = 587;
                                smtp.UseDefaultCredentials = false;
                                smtp.Credentials = new System.Net.NetworkCredential("sise.coopfel@gmail.com", "sisefel123");
                                smtp.EnableSsl = true;
                            }

                            smtp.Send(mail);
                            break;
                        }
                        else
                        {
                            //sociosSinMail += "\n" + sm.Nombre + " " + sm.Apellido + ".";

                            Socio s = new Socio();

                            s.Nombre = sm.Nombre;
                            s.Apellido = sm.Apellido;

                            listaSociosSinMail.Add(s);

                        }
                    }

                    int filasNotificacion = Datos.getMails().setearCorteNotificado(Convert.ToInt32(gvCortes.Rows[row.RowIndex].Cells[1].Text));
                    //notifico si la fila está visible
                }
                

            }

            Datos.commit();  //pasa a estado = 2 (notificado) los Cortes Programados
                            // se notifican todos los cortes que estén visibles

            lblSinMail.Visible = false;
            lblSinMail.Text = sociosSinMail;

            grillaSociosSinMail.DataSource = listaSociosSinMail;
            grillaSociosSinMail.DataBind();


        }
        catch (Exception err)
        {
            Console.WriteLine(err.ToString());
            Datos.rollback();
        }

       

        ModalPopUpEnviar.Hide();
        
        ModalPopupExito.Show();
    }
    protected void btnCancelarEnvio_Click(object sender, EventArgs e)
    {
        ModalPopUpEnviar.Hide();
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarEnvio.Show();
    }
    protected void btnAceptarCancelacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }
    protected void btnCancelarCancelacion_Click(object sender, EventArgs e)
    {
        ModalPopupCancelarEnvio.Hide();
    }
    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }
    protected void gvCortes_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        // 0: chkCorte
        //1: idcorte
        //2: motivo
        //3: fechaInicio
        //4: horaInicio
        //5: fechaFin
        //6: horaFin
        //7: duracion-----
        //8: idLinea
        //9: descripcion

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            float duracionEnMinutos = Convert.ToSingle(e.Row.Cells[7].Text);

            float div = duracionEnMinutos / 60; //duracion en horas 

            int HORAS = Convert.ToInt32(Math.Floor(div));
            float c = div - HORAS; //obtengo la parte decimal para pasarla a minutos
            int MINUTOS = Convert.ToInt32(Math.Floor(c * 60));

            int DIAS;

            string tiempoResolucion;


            if (div > 24)
            {
                float fl = div / 24;
                DIAS = Convert.ToInt32(Math.Floor(fl));
                float residuoDias = fl - DIAS; // obtengo la parte decimal para pasarla a horas
                float hoo = residuoDias * 24;
                int hor = Convert.ToInt32(Math.Floor(residuoDias * 24)); //horas
                float decim = hoo - hor; //obtengo la parte decimal para pasarl a minutos
                int min = Convert.ToInt32(Math.Floor(decim * 60)); //minutos

                tiempoResolucion = DIAS.ToString() + " día/s " + hor.ToString() + " hora/s " + min.ToString() + " minuto/s";
            }
            else
            {
                if (HORAS >= 1)
                    tiempoResolucion = HORAS.ToString() + " hora/s " + MINUTOS.ToString() + " minuto/s";
                else
                    tiempoResolucion = MINUTOS.ToString() + " minuto/s";
            }

            e.Row.Cells[7].Text = tiempoResolucion.ToString();
          
        }
    }
    protected void rdbCorte_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvCortes.Rows)
        {
            RadioButton rdbSeleccionado = (RadioButton)row.FindControl("gvCortes_rdbSeleccionado");
            if (rdbSeleccionado.Checked)
            {
                sdsDetalleCorte.SelectParameters["nroCorte"].DefaultValue = gvCortes.Rows[row.RowIndex].Cells[1].Text;
                panelDetalle.Visible = true;
            }
        }
    }
    protected void gvCortes_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = gvCortes.SelectedRow;

        gvCortes.SelectedRow.Visible = false;

        foreach (GridViewRow rowi in gvCortes.Rows)
        {
            RadioButton rdbSeleccionado = (RadioButton)rowi.FindControl("gvCortes_rdbSeleccionado");
            if (!rdbSeleccionado.Checked)
            {
                panelDetalle.Visible = false;
            }
        }

        int filasInvisibles = 0;

        foreach (GridViewRow rowis in gvCortes.Rows)
        {
            if (rowis.Visible == false)
                filasInvisibles++;
        }
       
        if(filasInvisibles == gvCortes.Rows.Count)   //significa que no hay ninguna fila visible
        {
            lblNoHayCortes.Visible = true;
            lblNoHayCortes.Text = "No hay Cortes Programados";
            btnEnviarMail.Enabled = false;
            gvCortes.Visible = false;
        }
        else
        {
            lblNoHayCortes.Visible = false;
            btnEnviarMail.Enabled = true;
        }

    }
    protected void grillaDetalleCorte_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[3].Visible = false; //mail
    }
   
}
