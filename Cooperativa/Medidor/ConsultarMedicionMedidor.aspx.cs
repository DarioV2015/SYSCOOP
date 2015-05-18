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

public partial class Medidor_ConsultarMedicionMedidor : System.Web.UI.Page
{

    protected void rbl_Consultar_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbl_Consultar.SelectedIndex == 0)
        {
            ddlPrioridad.Visible = true;
            txtBuscar.Visible = false;

        }

        if (rbl_Consultar.SelectedIndex == 1)
        {
            txtBuscar.Visible = true;
            ddlPrioridad.Visible = false;
        }

        if (rbl_Consultar.SelectedIndex == 2)
        {
            txtBuscar.Visible = true;
            ddlPrioridad.Visible = false;
        }
    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        // //foreach (GridViewRow row in gvZona.Rows)

        // //           {

        //   //             if (rbl_Consultar.SelectedValue())
        //                {
        //     //               try
        //                    {

        //                        int nroSolucion = Convert.ToInt32(gvSoluciones.Rows[row.RowIndex].Cells[3].Text);
        //                        int ProbYSol = Datos.getProbYSol().crearProbYSoluc(p.NroProblema, nroSolucion);
        //}
        //                    catch (Exception err)
        //                    {
        //                        Console.WriteLine(err.ToString());
        //                        Datos.rollback();

        //                    }
        //                    }
        //                }
    }




    protected void rdbSeleccionado_CheckedChanged(object sender, EventArgs e)
    {

        int wiIdMedidor;

        foreach (GridViewRow row in gvZona.Rows)
        {
            RadioButton rdbZona = (RadioButton)row.FindControl("gvZona_rdbSeleccionado");
            if (rdbZona.Checked)
            {

                wiIdMedidor = Convert.ToInt32(row.Cells[0].Text);

                Consumos.ObtenerConsumoPorIdDeMedidor(wiIdMedidor);


            }

        }
    }


}
