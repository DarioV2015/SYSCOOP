using System;
using System.IO;
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

public partial class Medidor_RegistrarMedicionMedidor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void UploadButton_Click(object sender, EventArgs e)
    {
        if (FileUploadControl.HasFile)
        {
            try
            {


                if (FileUploadControl.PostedFile.ContentType == "text/plain" || FileUploadControl.PostedFile.ContentType == "text/html"
                    || FileUploadControl.PostedFile.ContentType == "application/octet-stream")
                {

                    if (FileUploadControl.PostedFile.ContentLength < 1048576)
                    {
                        /*string filename = Path.GetFileName(FileUploadControl.FileName);
                        FileUploadControl.SaveAs(Server.MapPath("~/") + filename);*/
                        Archivo ar = new Archivo(FileUploadControl.PostedFile);
                        List<Medicion> med =  ar.leerMedicion();
                        ViewState["mediciones"] = med;
                        gvMediciones.DataSource = med;
                        gvMediciones.DataBind();
                        //StatusLabel.Text = "Upload status: File uploaded!";
                    }
                   
                }
               
            }
            catch (Exception ex)
            {
            
            }
        }
    }

    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        ModalPopupExito.Show();
    }

    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        List<Medicion> med = (List<Medicion>)ViewState["mediciones"];
        int id = Datos.obtenerMayor("select max(idconsumo) from consumo");
        int err = 1;
        int aux = 0;
        foreach (Medicion m in med)
        {
            float consumoActual = 0;
            int nroMedidor = Convert.ToInt32(m.NROCUENTA);
            int ultimoId = Datos.obtenerMayor("select max(idconsumo) from consuMo where medidor = "+nroMedidor);
            int ultimoIdConsumo = (ultimoId - 1); 
           
            float ultimoConsumo = Convert.ToSingle(Datos.getMediciones().obtenerUltimoConsumo(nroMedidor, ultimoIdConsumo));
            if (ultimoConsumo == 0)
            {
                consumoActual = Convert.ToSingle(m.ESTADO);
            }
            else 
            {
                float consumosMesAnterio = Convert.ToSingle(m.ESTADO);
                consumoActual = consumosMesAnterio - ultimoConsumo;
            }

            aux = Datos.getMediciones().insertarMedicion(id++, Convert.ToDateTime(m.FECHA), Convert.ToInt32(m.ESTADO), Convert.ToInt32(m.NROCUENTA), consumoActual);
            if (aux == 0)
                err = 0;
        }

        if (err == 0)
        {
            Datos.rollback(); 
        }
        else
        {
            Datos.commit();  
        }
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }

    protected void btnCancelarConfirmacion_Click(object sender, EventArgs e)
    {
        ModalPopupExito.Hide();
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Datos.rollback();
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }
    
}
