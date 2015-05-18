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

public partial class Medidor_RegistrarDeclaracionArtefactos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           gvListadoArtefactos.DataBind();

           comboArtefacto.SelectedIndex = 0;
           int cantidadTiposArtefactos = Convert.ToInt32(Datos.getTipoArtefactos().traerCantidadTipoArtefacto());

           //verifico si se ha creado algún nuevo Tipo de Artefacto y lo dejo 
           //seleccionado por defecto en el combo
           
           int nuevo = Convert.ToInt32(Session["nuevoTipoArtefacto"]);

           if (nuevo == 1)
           {
               comboArtefacto.SelectedIndex = cantidadTiposArtefactos;
               comboMarca.Focus();
           }
        }
        
    }
    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        btnRegistrarArtefactos.Enabled = true;

        List<Artefacto> listado;
        if (ViewState["lista"] == null)
            listado = new List<Artefacto>();
        else
        {
            listado = (List<Artefacto>)ViewState["lista"];

        }

        Artefacto a = new Artefacto();

        //a.IdArtefacto = Datos.getArtefactos().obtenerUltimoNroArtefacto();
        a.IdTipoArtefacto = Convert.ToInt32(comboArtefacto.SelectedValue);
        a.Descripcion = comboArtefacto.SelectedItem.ToString();
        a.Marca = comboMarca.SelectedItem.ToString();
        a.Modelo = txtModeloArtefacto.Text;
        a.NroFactura = Convert.ToInt32(txtNroFactura.Text);
        a.HsUsoEstimado = Convert.ToSingle(txtHsUso.Text);
        a.Fecha = Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy"));
        a.IdMarca = Convert.ToInt32(comboMarca.SelectedItem.Value);

        listado.Add(a);

        ViewState["lista"] = listado;

        if (listado.Count > 0)
        {

            gvListadoArtefactos.DataSource = listado;
            gvListadoArtefactos.DataBind();
        }

        gvListadoArtefactos.Columns[5].Visible = false;
        gvListadoArtefactos.Columns[6].Visible = false;

        comboArtefacto.SelectedIndex = 0;
        comboMarca.SelectedIndex = 0;
        txtHsUso.Text = " ";
        txtModeloArtefacto.Text = " ";
        txtNroFactura.Text = " ";

        List<Artefacto> listadoArtefactos = (List<Artefacto>)ViewState["lista"];
    }
    protected void btnCancelarConfirmacion_Click(object sender, EventArgs e)
    {
        ModalPopupConfirmacion.Hide();
        comboArtefacto.Focus();
    }
    protected void btnRegistrarArtefactos_Click(object sender, EventArgs e)
    {
        if (comboArtefacto.SelectedIndex == 0 && comboMarca.SelectedIndex == 0 && txtModeloArtefacto.Text == " " && txtNroFactura.Text == " " && txtHsUso.Text == " " && gvListadoArtefactos.Rows.Count != 0)
            ModalPopupConfirmacion.Show();
    }
    protected void btnAceptarConfirmacion_Click1(object sender, EventArgs e)
    {
        DatosUsuario datos = (DatosUsuario)Session["datosUsuario"];
        int nroSocio = Convert.ToInt32(datos.NroSocio);

        List<Artefacto> listadoArtefactos = (List<Artefacto>)ViewState["lista"];


        Artefacto a;

        try
        {
            for (int i = 0; i < listadoArtefactos.Count; i++)
            {
                a = new Artefacto();

                a.IdArtefacto = Datos.getArtefactos().obtenerUltimoNroArtefacto();

                //Calculo de Consumo

                double potencia = Convert.ToDouble(Datos.getArtefactos().buscarPotenciaArtefacto(Convert.ToInt32(listadoArtefactos[i].IdTipoArtefacto)));

                double consumo = Convert.ToDouble(listadoArtefactos[i].HsUsoEstimado) * potencia;

                a.ConsumoPromedio = (float)(Math.Round(consumo * 100) / 100); //se mide en Kw

                a.HsUsoEstimado = Convert.ToSingle(listadoArtefactos[i].HsUsoEstimado);
                a.IdMarca = Convert.ToInt32(listadoArtefactos[i].IdMarca);
                a.NroFactura = Convert.ToInt32(listadoArtefactos[i].NroFactura);
                a.IdTipoArtefacto = Convert.ToInt32(listadoArtefactos[i].IdTipoArtefacto);
                a.IdSocio = nroSocio; 
                a.Modelo = listadoArtefactos[i].Modelo;
                a.Fecha = Convert.ToDateTime(DateTime.Now.ToString());

                int filas = Datos.getArtefactos().crearArtefacto(a);
            }

            Datos.commit();
        }
        //Artefacto a;
        //try
        //{            
        //    for (int i = 0; i < gvListadoArtefactos.Rows.Count; i++)
        //    {
        //        a = new Artefacto();

        //        a.IdArtefacto = Datos.getArtefactos().obtenerUltimoNroArtefacto();

        //        //Calculo de Consumo

        //        double potencia = Convert.ToDouble(Datos.getArtefactos().buscarPotenciaArtefacto(Convert.ToInt32(gvListadoArtefactos.Rows[i].Cells[5].Text)));

        //        double consumo = Convert.ToDouble(gvListadoArtefactos.Rows[i].Cells[4].Text) * potencia;

        //        a.ConsumoPromedio = (float)(Math.Round(consumo * 100) / 100); //se mide en Kw

        //        a.HsUsoEstimado = Convert.ToSingle(gvListadoArtefactos.Rows[i].Cells[4].Text);
        //        a.IdMarca = Convert.ToInt32(gvListadoArtefactos.Rows[i].Cells[6].Text);
        //        a.NroFactura = Convert.ToInt32(gvListadoArtefactos.Rows[i].Cells[3].Text);
        //        a.IdTipoArtefacto = Convert.ToInt32(gvListadoArtefactos.Rows[i].Cells[5].Text);
        //        
        //        a.IdSocio = nroSocio;
        //        a.Modelo = gvListadoArtefactos.Rows[i].Cells[2].Text;
        //        a.Fecha = Convert.ToDateTime(DateTime.Now.ToString());

        //        int filas = Datos.getArtefactos().crearArtefacto(a);
        //    }

        //    Datos.commit();

        //}
        catch (Exception err)
        {
            Console.WriteLine(err.ToString());
            Datos.rollback();
        }


        ModalPopupConfirmacion.Hide();
        ModalPopupCierre.Show();   
    }
    protected void btnAceptarCierre_Click(object sender, EventArgs e)
    {
        //salir de Pagina
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }
    protected void btnAceptarCancelacion_Click(object sender, EventArgs e)
    {
        ModalPopupCancelacion.Hide();
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }
    protected void btnCancelarCancelacion_Click(object sender, EventArgs e)
    {
        ModalPopupCancelacion.Hide();
    }
    protected void btnCancelarArtefactos_Click(object sender, EventArgs e)
    {
        ModalPopupCancelacion.Show();
    }
    protected void btnNuevoArtefacto_Click(object sender, EventArgs e)
    {
        txtDescripcionNuevoArt.Focus();
        ModalPopupNuevoArtefacto.Show();   
    }
    protected void btnAceptarNuevoArtefacto_Click(object sender, EventArgs e)
    {
        int nuevo = 1;

        TipoArtefacto ta = new TipoArtefacto();

        try
        {
            ta.IdTipoArtefacto = Convert.ToInt32(Datos.getTipoArtefactos().obtenerUltimoNroArtefacto());
            ta.Descripcion = txtDescripcionNuevoArt.Text;
            ta.Potencia = (float)Convert.ToDouble(txtPotenciaNuevoArt.Text); ;

            int filas = 0;

            if (txtDescripcionNuevoArt.Text == " " || txtPotenciaNuevoArt.Text == " ")
            { }
            else
            {
                filas = Datos.getTipoArtefactos().crearTipoArtefacto(ta);
            }

            Datos.commit();
            
            ModalPopupNuevoArtefacto.Hide();

            nuevo = 1;

            Session["nuevoTipoArtefacto"] = nuevo;
        }
        catch (Exception err)
        {
            Console.WriteLine(err.ToString());
            Datos.rollback();
        }

        Response.Redirect("/Cooperativa/Medidor/RegistrarDeclaracionArtefactos.aspx", true);
    }
    protected void gvListadoArtefactos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRow")
        {
            //int rowIndex = ((GridViewRow)((Button)e.CommandSource).NamingContainer).RowIndex;
            int idTipoArtefacto = Convert.ToInt32(e.CommandArgument);

            List<Artefacto> listado;
            listado = (List<Artefacto>)ViewState["lista"];

            foreach(Artefacto a in listado)
            {
                if (a.IdTipoArtefacto == idTipoArtefacto)
                {
                    listado.Remove(a);
                    break;
                }
            }
            
            gvListadoArtefactos.DataSource = listado;
            gvListadoArtefactos.DataBind();
        }         

      }
    protected void comboMarca_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtModeloArtefacto.Focus();
    }
    protected void comboArtefacto_SelectedIndexChanged(object sender, EventArgs e)
    {
        comboMarca.Focus();
    }
}
