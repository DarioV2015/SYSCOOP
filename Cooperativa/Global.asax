<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Security" %>
<%@ Import Namespace="System.Security.Principal" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Código que se ejecuta al iniciarse la aplicación

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Código que se ejecuta cuando se cierra la aplicación

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Código que se ejecuta al producirse un error no controlado
        
       

    }

    void Session_Start(object sender, EventArgs e) 
    {
        HttpCookie authCookie = Context.Request.Cookies["Usuario"];
        if (null == authCookie)
        {
            // Si no existe termina
            return;
        }
        FormsAuthenticationTicket autTicket = null;
        try
        {
            autTicket = FormsAuthentication.Decrypt(authCookie.Value);
        }
        catch (Exception ex)
        {
            return;
        }
        if (null == autTicket)
        {
            // No se pudo desencriptar
            return;
        }
        Session["datosUsuario"] = Seguridad.buscarDatos(autTicket.Name);
    }
    
    protected void Application_AuthenticateRequest(object sender, EventArgs e)
    {
        // Recupera la cookie
        HttpCookie authCookie = Context.Request.Cookies["Usuario"];
        if (null == authCookie)
        {
            // Si no existe termina
            return;
        }
        FormsAuthenticationTicket autTicket = null;
        try
        {
            autTicket = FormsAuthentication.Decrypt(authCookie.Value);
        }
        catch (Exception ex)
        {
            return;
        }
        if (null == autTicket)
        {
            // No se pudo desencriptar
            return;
        }
        // Separo los roles

        String[] roles = autTicket.UserData.Split(new char[] { '|' });
        // Creo un objeto Identity y lo vinculo al Context
        GenericIdentity id = new GenericIdentity(autTicket.Name, "Usuario");
        GenericPrincipal principal = new GenericPrincipal(id, roles);
        Context.User = principal;
        
    }
        // Código que se ejecuta cuando se inicia una nueva sesión

    

    void Session_End(object sender, EventArgs e) 
    {
        // Código que se ejecuta cuando finaliza una sesión. 
        // Nota: El evento Session_End se desencadena sólo con el modo sessionstate
        // se establece como InProc en el archivo Web.config. Si el modo de sesión se establece como StateServer 
        // o SQLServer, el evento no se genera.

    }

    
    
       
</script>
