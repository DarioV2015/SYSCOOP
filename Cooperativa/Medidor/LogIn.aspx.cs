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

public partial class LogIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //para sacar la Ip 
        //al pedo, pero Raul lo queria =)
        txtIp.Text = Convert.ToString(Request.ServerVariables["REMOTE_ADDR"]);
        txtUsuario.Focus();
        Login1.Show();
    }

    protected void BtnAceptar_Click(object sender, EventArgs e)
    {

        try
        {
            //Si el usuario está autenticado?
            if (Seguridad.ValidarUsuario(txtUsuario.Text, txtPass.Text))
            {
                String Usr = txtUsuario.Text;
                /*Obtiene un string con todos los roles

                */
                string roles = Seguridad.ObtenerRoles(Usr);

                Session["datosUsuario"] = Seguridad.buscarDatos(Usr);

                //Crear un ticket de autenticación
                FormsAuthenticationTicket autTicket = new FormsAuthenticationTicket(1, Usr, DateTime.Now, DateTime.Now.AddMinutes(59), false, roles);
                //Encriptar el ticket
                string encrTicket = FormsAuthentication.Encrypt(autTicket);
                // Crea una cookie con el ticket encriptado
                HttpCookie autCookie = new HttpCookie("Usuario", encrTicket);
                // Agrega la cookie a la Response
                Response.Cookies.Add(autCookie);
                // Redirecciona al usuario a la página que solicitó originalmente
                if (roles.Equals("Socio"))
                {
                    Response.Redirect("~/Default.aspx");
                }
                else
                    if (roles.Equals("JefeRedes") || roles.Equals("JefeDistribucion"))
                    {
                        Response.Redirect("~/InicioJefes.aspx");
                    }
                    else if (roles.Equals("Capataz"))
                    {
                        Response.Redirect("~/InicioCapataz.aspx");
                    }
                    else if (roles.Equals("Guardia"))
                    {
                        Response.Redirect("~/InicioGuardiaReclamo.aspx");
                    }
                    else if (roles.Equals("Administrativo"))
                    {
                        Response.Redirect("~/InicioAdministrativo.aspx");
                    }
                Response.Redirect(FormsAuthentication.GetRedirectUrl(Usr, false));
                //Response.Redirect("~/Default.aspx");
            }
            else
            {
                mpeConfirmacion.Show();
            }
                //lblMensaje.Visible = true;
                //lblMensaje.Text = "No tiene autorización para ingresar al sistema";
        }
        catch (Exception ex)
        {
            mpeConfirmacion.Show();

        }

    }

    protected void btnAceptarAdv_Click(object sender, EventArgs e)
    {
        mpeConfirmacion.Hide();
    }
       
}
