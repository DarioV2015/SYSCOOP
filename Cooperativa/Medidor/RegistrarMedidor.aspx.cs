using System;
using System.Collections;
using System.Collections.Generic;
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
using System.Data.Common;



public partial class Medidor_RegistrarMedidor : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        int bandera = Convert.ToInt32(Session["Bandera"]);
        if (bandera == 0)
        {
            int cant;
            String nombreHerramienta;
            int idHerramienta;
            lblNroContrato.Text = Convert.ToString(Session["NroContrato"]);


            List<DetalleContrato> listado = new List<DetalleContrato>();
            listado = (List<DetalleContrato>)Session["ListadoMedidores"];

            DataTable dt = new DataTable();
            //dt.Columns.Add("NroHerramienta", typeof(Int32));
            dt.Columns.Add("DescripHerramienta", typeof(string));

            List<Medidor> medidores = new List<Medidor>();
            int maxId = Datos.getMedidores().obtenerUltimoNroMedidor();

            foreach (DetalleContrato detalle in listado)
            {
                nombreHerramienta = Convert.ToString(detalle.DescripHerramienta);
                //idHerramienta = Convert.ToInt32(detalle.NroHerramienta);
                cant = Convert.ToInt32(detalle.CantidadIngresada);
                for (int i = 0; i < cant; i++)
                {
                   // dt.Rows.Add(idHerramienta, nombreHerramienta);
                    Medidor m = new Medidor();
                   // m.TipoMedidor = gvDetalleContrato.Rows[i].Cells[1].Text.ToString(); ;
                    m.FechaAlta = Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy"));
                    //m.NroLote = gvDetalleContrato.Rows[i].Cells[3].Text.ToString();
                    m.NroMedidor = maxId.ToString();
                    m.NroFabricacion = null;
                    medidores.Add(m);
                }



            }
          //  gvDetalle.DataSource = dt;
           // gvDetalle.DataBind();
            Session["Bandera"] = "1";

        }

        if (!Page.IsPostBack)
        {
            
            if (gvContratos.Rows.Count == 0)
            {
                btnCargarMedidores.Visible = false;
                ModalPopupMsj.Show();
            }
        }
    }

    protected void btnCargarMedidores_Click(object sender, EventArgs e)
    {
        List<Medidor> medidores = new List<Medidor>();
        int maxId = Datos.getMedidores().obtenerUltimoNroMedidor();
        for (int i = 0; i < gvDetalleContrato.Rows.Count; i++)
        {
            RadioButton rdbSeleccionar = (RadioButton)gvDetalleContrato.Rows[i].FindControl("gvDetalleContrato_rdbSeleccionar");
            if (rdbSeleccionar.Checked)
            {
                for (int j = 0; j < Int32.Parse(gvDetalleContrato.Rows[i].Cells[5].Text.ToString()); j++, maxId++)
                {
                    if (gvMedidores.Rows.Count == Int32.Parse(gvDetalleContrato.Rows[i].Cells[5].Text.ToString()))
                    {
                        break;
                    }
                    //float tipoMedidor, DateTime fecha, float lote, float id, String nroFa
                    /*
                                    sdsMedidores.InsertParameters["tipo"].DefaultValue = "1";
                                    sdsMedidores.InsertParameters["fechaalta"].DefaultValue = DateTime.Now.ToString();
                                    sdsMedidores.InsertParameters["nrolote"].DefaultValue = gvDetalleContrato.Rows[i].Cells[3].Text.ToString();
                                    sdsMedidores.InsertParameters["idmedidor"].DefaultValue = maxId.ToString();
                                    sdsMedidores.InsertParameters["nrofabricacion"].DefaultValue = "0";
                                    sdsMedidores.InsertParameters["estado"].DefaultValue = "1";
                                    sdsMedidores.Insert();*/

                    Medidor m = new Medidor();
                    m.TipoMedidor = gvDetalleContrato.Rows[i].Cells[1].Text.ToString(); ;
                    m.FechaAlta = Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy"));
                    m.NroLote = gvDetalleContrato.Rows[i].Cells[3].Text.ToString();
                    m.NroMedidor = maxId.ToString();
                    m.NroFabricacion = null;
                    medidores.Add(m);

                }
            }
                
        }
        if(medidores.Count > 0)
        {
            Dictionary<String, List<Medidor>> listaMedidores;
            if (ViewState["listaMedidores"] == null)
                listaMedidores = new Dictionary<String, List<Medidor>>();
            else
                listaMedidores = (Dictionary<String, List<Medidor>>)ViewState["listaMedidores"];

            listaMedidores[medidores[0].NroLote] = medidores;
            ViewState["listaMedidores"] = listaMedidores;
            gvMedidores.DataSource = medidores;
            gvMedidores.DataBind();
        }
    }


    protected void gvDetalleContrato_SelectedIndexChanged(object sender, EventArgs e)
    {
        String seleccionado = gvDetalleContrato.SelectedValue.ToString();
        ViewState["detalleSeleccionado"] = seleccionado;
        getMedidores(seleccionado);
    }


    protected void comandosGVMedidor(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditRow")
        {
            int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
            gvMedidores.EditIndex = rowIndex;
        }
        else if (e.CommandName == "CancelRow")
        {
            gvMedidores.EditIndex = -1;
        }
        else if (e.CommandName == "UpdateRow")
        {
            int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
            String nroFabricacion = ((TextBox)gvMedidores.Rows[rowIndex].FindControl("TextBox1")).Text;
            String nroMedidor = gvMedidores.Rows[rowIndex].Cells[4].Text;
            String nroLote = gvMedidores.Rows[rowIndex].Cells[3].Text;

            Dictionary<String, List<Medidor>> listaMedidores = (Dictionary<String, List<Medidor>>)ViewState["listaMedidores"];
            List<Medidor> medidores = (List<Medidor>)listaMedidores[nroLote];

            foreach(Medidor m in medidores)
            {
                if (m.NroMedidor.Equals(nroMedidor))
                {
                    m.NroFabricacion = nroFabricacion;
                    break;
                }
            }

            ViewState["listaMedidores"] = listaMedidores;

            gvMedidores.EditIndex = -1;
        }
        String seleccionado = ViewState["detalleSeleccionado"].ToString();
        getMedidores(seleccionado);
        
    }

    protected void getMedidores(String seleccionado)
    {
        List<Medidor> medidores = Datos.getMedidores().getMedidoresDeDetalle(seleccionado);
        if (medidores.Count == 0 && ViewState["listaMedidores"] != null)
        {
            Dictionary<String, List<Medidor>> listaMedidores = (Dictionary<String, List<Medidor>>)ViewState["listaMedidores"];
            try
            {
                medidores = (List<Medidor>)listaMedidores[seleccionado];
            }
            catch (Exception e)
            { }
        }   
            gvMedidores.DataSource = medidores;
            gvMedidores.DataBind();
        
    }
    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        Dictionary<String, List<Medidor>> listaMedidores = (Dictionary<String, List<Medidor>>)ViewState["listaMedidores"];
        Boolean noCargado = false;
        if (listaMedidores != null)
        {
            foreach (List<Medidor> ms in listaMedidores.Values)
            {
                foreach (Medidor m in ms)
                {
                    if (noCargado)
                    {
                        break;
                    }
                    if (m.NroFabricacion == null)
                    {
                        noCargado = true;
                        break;
                    }
                }
            }
        }
        else
        {
            noCargado = true;
        }

        if (noCargado)
        {
            popExtMsj.Show();
            return;
        }

        insertarMedidores();


    }

    private void insertarMedidores()
    {
        Dictionary<String, List<Medidor>> listaMedidores = (Dictionary<String, List<Medidor>>)ViewState["listaMedidores"];

        if (listaMedidores != null)
        {
            foreach (List<Medidor> ms in listaMedidores.Values)
            {
                foreach (Medidor m in ms)
                {
                    Datos.getMedidores().insertarMedidor(m);
                }
                Datos.ejecutarComando("Update contrato set idestadocontrato = 1 where idcontrato = "+"IDCONTRATO");
            }
        }
        try
        {
            Datos.commit();
            mpeExito.Show();
        }
        catch (Exception e) { Console.Write(e); }
    }

    protected void btnAceptarConfirmacion_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Cooperativa/Default.aspx", true);
    }

    protected void gvContratos_rdbSeleccionar_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow row in this.gvContratos.Rows)
        {
            RadioButton rdbSeleccionar = (RadioButton)row.FindControl("gvContratos_rdbSeleccionar");
            if (rdbSeleccionar.Checked)
            {
                String idcontrato = row.Cells[1].Text;
                sdsDetalleContrato.SelectParameters["nrocontrato"].DefaultValue = idcontrato;
                sdsDetalleContrato.Select(DataSourceSelectArguments.Empty);
            }

        }
    }

    protected void gvDetalleContrato_rdbSeleccionar_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow row in this.gvDetalleContrato.Rows)
        {
            RadioButton rdbSeleccionar = (RadioButton)row.FindControl("gvDetalleContrato_rdbSeleccionar");
            if (rdbSeleccionar.Checked)
            {
                String seleccionado = row.Cells[3].Text;
                ViewState["detalleSeleccionado"] = seleccionado;
                getMedidores(seleccionado);
            }

        }
    }

    protected void btnNroLote_Click(object sender, EventArgs e)
    {
 
    }
}
