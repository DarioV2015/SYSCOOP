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

public partial class Inicio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (GridView2.Rows.Count == 0)
        {
            Label1.Visible = true;
        }
        if (GridTareasPr.Rows.Count == 0)
        {
            Label2.Visible = true;
        }

    }
    protected void VerEmpleados_click (object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }

    protected void btnAceptarRegistrar_Click(object sender, EventArgs e)
    {
        ModalPopupExtender1.Hide();
    }

   
}
