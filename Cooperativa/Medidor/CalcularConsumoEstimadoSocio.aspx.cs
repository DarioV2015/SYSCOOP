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

public partial class Medidor_CalcularConsumoEstimadoSocio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DatosUsuario datos = (DatosUsuario)Session["datosUsuario"];
        int nroSocio = Convert.ToInt32(datos.NroSocio);

        if (!Page.IsPostBack)
        {
            sdsListadoArtefactos.SelectParameters["a"].DefaultValue = nroSocio.ToString();
 
            double consumo = Datos.getArtefactos().calcularCostoConsumo(nroSocio);  
            double costoTotal = 0;

            //txtResultado.Text = string.Format("{0:n2}", (Math.Truncate(valor * 100) / 100)))
            txtConsumoPorDia.Text = string.Format("{0:n2}", (Math.Truncate(consumo * 100) / 100)) + " Kw";
                //consumo.ToString() + " Kw";

            double costoFinal = 0;

            int mes = Convert.ToInt32(DateTime.Now.ToString("MM"));
            int anio = Convert.ToInt32(DateTime.Now.ToString("yyyy"));

            bool bisiesto = false;

            /*int anio = 2004;
            int mes = 2;*/

            if (anio % 4 == 0 && (anio % 100 != 0 || anio % 400 == 0))
                bisiesto = true;
            else
                bisiesto = false; 

            int dias = 0;

            switch (mes)
            {
                case 1:
                    {
                        dias = 31;
                        lblDiasDeLectura.Text += " (Enero):";
                        break;
                    }
                case 2:
                    {
                        if (bisiesto)
                        {
                            dias = 29;
                            lblDiasDeLectura.Text += " (Febrero):";
                            break;
                        }
                        else
                        {
                            dias = 28;
                            lblDiasDeLectura.Text += " (Febrero):";
                            break;
                        }
                    }
                case 3:
                    {
                        dias = 31;
                        lblDiasDeLectura.Text += " (Marzo):";
                        break;
                    }
                case 4:
                    {
                        dias = 30;
                        lblDiasDeLectura.Text += " (Abril):";
                        break;
                    }
                case 5:
                    {
                        dias = 31;
                        lblDiasDeLectura.Text += " (Mayo):";
                        break;
                    }
                case 6:
                    {
                        dias = 30;
                        lblDiasDeLectura.Text += " (Junio):";
                        break;
                    }
                case 7:
                    {
                        dias = 31;
                        lblDiasDeLectura.Text += " (Julio):";
                        break;
                    }
                case 8:
                    {
                        dias = 31;
                        lblDiasDeLectura.Text += " (Agosto):";
                        break;
                    }
                case 9:
                    {
                        dias = 30;
                        lblDiasDeLectura.Text += " (Septiembre):";
                        break;
                    }
                case 10:
                    {
                        dias = 31;
                        lblDiasDeLectura.Text += " (Octubre):";
                        break;
                    }
                case 11:
                    {
                        dias = 30;
                        lblDiasDeLectura.Text += " (Noviembre):";
                        break;
                    }
                case 12:
                    {
                        dias = 31;
                        lblDiasDeLectura.Text += " (Diciembre):";
                        break;
                    }
            }

            txtDias.Text = dias.ToString();
            double consumoMensual = 0;

            consumoMensual = consumo * dias;

            txtConsumoMensual.Text = string.Format("{0:n2}", (Math.Truncate(consumoMensual * 100) / 100)) + " Kw";

            double valorConsumo = consumoMensual / 40;
            int parteEntera = Convert.ToInt32(Math.Floor(valorConsumo));

            int resultado = 40 * parteEntera;

            double restoDelConsumo = 0;

            if(resultado != 0)
                restoDelConsumo = consumoMensual - resultado;
 
            //determino a qué rango pertenece

            if (valorConsumo >= 0 && valorConsumo <= 1)  //pertenece al primer rango
                costoTotal = Convert.ToDouble(lblRango1.Text) * consumoMensual;

            if (valorConsumo > 1 && valorConsumo <= 2)   //pertenece al segundo rango
                costoTotal = (40 * Convert.ToDouble(lblRango1.Text)) + (restoDelConsumo * Convert.ToDouble(lblRango2.Text));

            if (valorConsumo > 2 && valorConsumo <= 3)   //pertenece al tercer rango
                costoTotal = (40 * Convert.ToDouble(lblRango1.Text)) + (40 * Convert.ToDouble(lblRango2.Text)) + (restoDelConsumo * Convert.ToDouble(lblRango3.Text));

            if (valorConsumo > 3 && valorConsumo <= 4)   //pertenece al cuarto rango
                costoTotal = (40 * Convert.ToDouble(lblRango1.Text)) + (40 * Convert.ToDouble(lblRango2.Text)) + (40 * Convert.ToDouble(lblRango3.Text)) + (restoDelConsumo * Convert.ToDouble(lblRango4.Text));

            if (valorConsumo > 4)   //pertenece al quinto rango
                costoTotal = (40 * Convert.ToDouble(lblRango1.Text)) + (40 * Convert.ToDouble(lblRango2.Text)) + (40 * Convert.ToDouble(lblRango3.Text)) + (40 * Convert.ToDouble(lblRango4.Text)) + (restoDelConsumo * Convert.ToDouble(lblRango5.Text));

            txtCostoTotal.Text = "$ " + string.Format("{0:n2}", (Math.Truncate(costoTotal * 100) / 100));
        }
    }
    protected void btnVolver_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }
}
