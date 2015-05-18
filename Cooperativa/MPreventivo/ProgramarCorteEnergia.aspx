<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="ProgramarCorteEnergia.aspx.cs" Inherits="MPreventivo_ProgramarCorteEnergia"
    Title="Programar Cortes de Energía" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
    <link href="../Style/TabStyle2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .datos
        {
            text-align: right;
        }
        .estiloHeaderTabla
        {
            font-family: 'trebuchet MS' , 'Lucida sans' , Arial;
            font-size: 12px;
            background-color: #b9c9fe;
            font-weight: bold;
            background: #b9c9fe;
            border-top: 2px solid #aabcfe;
            border-bottom: 1px solid #fff;
            color: #039;
            padding: 8px;
            border-right-style: none;
            border-left-style: ridge;
            border-left-color: #98A9DF;
            border-left-width: 1px;
        }
        .estiloFilasTabla
        {
            font-family: 'trebuchet MS' , 'Lucida sans' , Arial;
            font-size: 12px;
            color: #000;
            text-align: center;
            border-left-style: none;
            border-left-width: 0px;
            border-bottom: 1px solid #fff;
            border-right-style: none;
        }
        .tablaMargen
        {
            margin-left: 63px;
        }
        .botonPopUp
        {
            margin-left: 0px;
            margin-top: 30px;
            text-align: center;
        }
        .divFondo
        {
            position: fixed;
            z-index: 100001;
            left: 447.5px;
            top: 100px;
            border: 4px solid rgb(173, 171, 171);
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            border-bottom-right-radius: 8px;
            border-bottom-left-radius: 8px;
        }
        .FieldDatos
        {
            height: 138px;
            border-radius: 6px;
            border-color: rgb(196, 194, 194);
            border-style: solid;
            border-width: 1px;
        }
        .legendDatos
        {
            font-family: Calibri;
            font-size: 17px;
        }
    </style>

    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?v=3.8&amp;key=AIzaSyALhJSXocMN5jstXyeuT1X8mTiRJkVVXYg&amp;libraries=drawing,geometry&amp;language=es&amp;region=AR&amp;sensor=false"></script>

    <script type="text/javascript" src="../Js/utilGMaps.js"></script>

    <script type="text/javascript" src="../Js/marcadores.js"></script>

    <script type="text/javascript" src="../Js/general.js"></script>

    <script type="text/javascript" src="../Js/RegistrarPlanificacionMP.js"></script>

    <script type="text/javascript">
    
     function RadioCheckOnly(rbControl) {
     
      var gvName = rbControl.defaultValue.split('_')[0];
      var gvControl;
      
      switch (gvName)
      {
        case "gvSubestaciones":
        gvControl =  "<%=gvSubestaciones.ClientID%>";       
        break;
      }
            
      var gv = document.getElementById(gvControl);
      var rbs = gv.getElementsByTagName("input");
      var row = rbControl.parentNode.parentNode;
     
        for (var i = 0; i < rbs.length; i++) {
            if (rbs[i].type == "radio") {
                if (rbs[i].checked && rbs[i] != rbControl) {
                    rbs[i].checked = false;
                    
                    break;
                }
            }
        }
    }    
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="tabconteiner1" runat="server" ActiveTabIndex="0" CssClass="TabStyle2"
        style="margin-top: 10px">
        <asp:TabPanel ID="tabPanel1" runat="server" HeaderText="Zona de Corte">
            <contenttemplate><table style="margin-top:15px; margin-left:10px"><tr><td><asp:Label ID="Label1" runat="server" Text="Zona:"></asp:Label></td><td><asp:DropDownList ID="ddlZonas" runat="server" AutoPostBack="True" DataValueField="idzona"
                    DataTextField="descripcion" OnSelectedIndexChanged="ddlZonas_SelectedIndexChanged"></asp:DropDownList></td></tr></table><table style="margin-top:10px; margin-bottom:10px"><tr><td style="vertical-align:top"><asp:UpdatePanel ID="UpdatePanelSubestaciones" runat="server" Visible="False"><ContentTemplate><fieldset class="FieldDatos" style="height:auto"><legend class="legendDatos">Subestaciones</legend><table style="margin-top:0px"><tr><td><asp:GridView ID="gvSubestaciones" runat="server" AutoGenerateColumns="False"  HeaderStyle-CssClass="estiloHeaderTabla" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" style="margin-top:0px"><RowStyle  BackColor="#E8EFF8" ForeColor="#333333" /><Columns><asp:TemplateField HeaderStyle-CssClass="estiloHeaderTabla"><ItemTemplate><asp:RadioButton ID="gvSubestaciones_rdbSeleccionar" runat="server" AutoPostBack="True"
                                    OnCheckedChanged="gvSubestaciones_rdbSeleccionar_CheckedChanged" /></ItemTemplate><HeaderStyle CssClass="estiloHeaderTabla" /><ItemStyle CssClass="estiloFilasTabla"></ItemStyle></asp:TemplateField><asp:BoundField DataField="idsubestacion" HeaderText="Nro" 
                        HeaderStyle-Width="40px" ItemStyle-CssClass="estiloHeaderTabla"><HeaderStyle CssClass="estiloHeaderTabla" Width="40px"></HeaderStyle><ItemStyle CssClass="estiloFilasTabla"></ItemStyle></asp:BoundField><asp:BoundField DataField="descripcion" HeaderText="Descripción"
                        HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla" ><HeaderStyle CssClass="estiloHeaderTabla" Width="100px"></HeaderStyle><ItemStyle CssClass="estiloFilasTabla"></ItemStyle></asp:BoundField ><asp:TemplateField HeaderText="Calle" HeaderStyle-CssClass="estiloHeaderTabla"><ItemTemplate><asp:Label ID="lblCalleSub" Text='<%#DataBinder.Eval(Container.DataItem, "Domicilio.NombreCalle")%>'
                                    runat="server" /></ItemTemplate><HeaderStyle CssClass="estiloHeaderTabla" /><ItemStyle CssClass="estiloFilasTabla"></ItemStyle></asp:TemplateField><asp:TemplateField HeaderText="Nro" HeaderStyle-CssClass="estiloHeaderTabla"><ItemTemplate><asp:Label ID="lblNroSub" Text='<%#DataBinder.Eval(Container.DataItem, "Domicilio.NroCalle")%>'
                                    runat="server" /></ItemTemplate><HeaderStyle CssClass="estiloHeaderTabla" /><ItemStyle CssClass="estiloFilasTabla"></ItemStyle></asp:TemplateField><asp:TemplateField HeaderText="Piso" HeaderStyle-CssClass="estiloHeaderTabla"><ItemTemplate><asp:Label ID="lblPisoSub" Text='<%#DataBinder.Eval(Container.DataItem, "Domicilio.Piso")%>'
                                    runat="server" /></ItemTemplate><HeaderStyle CssClass="estiloHeaderTabla" /><ItemStyle CssClass="estiloFilasTabla"></ItemStyle></asp:TemplateField><asp:TemplateField HeaderText="Dpto" HeaderStyle-CssClass="estiloHeaderTabla"><ItemTemplate><asp:Label ID="lblDptoSub" Text='<%#DataBinder.Eval(Container.DataItem, "Domicilio.Dpto")%>'
                                    runat="server" /></ItemTemplate><HeaderStyle CssClass="estiloHeaderTabla" /><ItemStyle CssClass="estiloFilasTabla"></ItemStyle></asp:TemplateField></Columns><HeaderStyle CssClass="estiloHeaderTabla" /></asp:GridView></td></tr><tr><td></td><td></td></tr></table></fieldset>
            </ContentTemplate></asp:UpdatePanel></td><td valign="top"><asp:UpdatePanel ID="UpdatePanelMYS" runat="server" ><ContentTemplate><asp:Panel ID="panelMedidoresYSocios" runat="server" Visible="False"><fieldset class="FieldDatos" style="height:auto"><legend class="legendDatos">Medidores y Socios</legend><table style="margin-top:0px"><tr><td><asp:GridView ID="gvSocios" runat="server" AutoGenerateColumns="False"
                 HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333" GridLines="None" style="margin-top:0px"><RowStyle  BackColor="#E8EFF8" ForeColor="#333333" /><Columns><asp:BoundField DataField="NroMedidor" HeaderText="Medidor" HeaderStyle-Width="65px" 
                            ItemStyle-CssClass="estiloHeaderTabla"><HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle><ItemStyle CssClass="estiloFilasTabla"></ItemStyle></asp:BoundField ><asp:TemplateField HeaderText="Calle" HeaderStyle-CssClass="estiloHeaderTabla"><ItemTemplate><asp:Label ID="lblCalleMed" Text='<%#DataBinder.Eval(Container.DataItem, "Domicilio.NombreCalle")%>'
                                    runat="server" /></ItemTemplate><HeaderStyle CssClass="estiloHeaderTabla" /><ItemStyle CssClass="estiloFilasTabla"></ItemStyle></asp:TemplateField><asp:TemplateField HeaderText="Nro" HeaderStyle-CssClass="estiloHeaderTabla"><ItemTemplate><asp:Label ID="lblNroMed" Text='<%#DataBinder.Eval(Container.DataItem, "Domicilio.NroCalle")%>'
                                    runat="server" /></ItemTemplate><HeaderStyle CssClass="estiloHeaderTabla" /><ItemStyle CssClass="estiloFilasTabla"></ItemStyle></asp:TemplateField><asp:TemplateField HeaderText="Piso" HeaderStyle-CssClass="estiloHeaderTabla"><ItemTemplate><asp:Label ID="lblPisoMed" Text='<%#DataBinder.Eval(Container.DataItem, "Domicilio.Piso")%>'
                                    runat="server" /></ItemTemplate><HeaderStyle CssClass="estiloHeaderTabla" /><ItemStyle CssClass="estiloFilasTabla"></ItemStyle></asp:TemplateField><asp:TemplateField HeaderText="Dpto" HeaderStyle-CssClass="estiloHeaderTabla"><ItemTemplate><asp:Label ID="lblDptoMed" Text='<%#DataBinder.Eval(Container.DataItem, "Domicilio.Dpto")%>'
                                    runat="server" /></ItemTemplate><HeaderStyle CssClass="estiloHeaderTabla" /><ItemStyle CssClass="estiloFilasTabla"></ItemStyle></asp:TemplateField><asp:TemplateField HeaderText="Socio" HeaderStyle-Width="100px" HeaderStyle-CssClass="estiloHeaderTabla"><ItemTemplate><asp:Label ID="lblIdSocio" Text='<%#DataBinder.Eval(Container.DataItem, "Socio.IdSocio")%>'
                                    runat="server" /></ItemTemplate><HeaderStyle CssClass="estiloHeaderTabla" Width="100px" /><ItemStyle CssClass="estiloFilasTabla"></ItemStyle></asp:TemplateField><asp:TemplateField HeaderText="Nombre" HeaderStyle-Width="80px" HeaderStyle-CssClass="estiloHeaderTabla"><ItemTemplate><asp:Label ID="lblNombreSocio" Text='<%#DataBinder.Eval(Container.DataItem, "Socio.Nombre")%>'
                                    runat="server" /></ItemTemplate><HeaderStyle CssClass="estiloHeaderTabla" Width="80px" /><ItemStyle CssClass="estiloFilasTabla"></ItemStyle></asp:TemplateField><asp:TemplateField HeaderText="Prioridad" HeaderStyle-Width="80px" HeaderStyle-CssClass="estiloHeaderTabla"><ItemTemplate><asp:Label ID="lblPrioridad" Text='<%# Eval("Prioridad") %>' runat="server" /></ItemTemplate><HeaderStyle CssClass="estiloHeaderTabla" Width="80px" /><ItemStyle CssClass="estiloFilasTabla"></ItemStyle></asp:TemplateField></Columns><HeaderStyle CssClass="estiloHeaderTabla" /></asp:GridView></td></tr></table></fieldset></asp:Panel>
                </ContentTemplate></asp:UpdatePanel></td></tr></table>   
        </contenttemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="tabPanel2" runat="server" HeaderText="Cortes de Energía">
            <ContentTemplate>
            <table>
            <tr>
            <td class="datos">
            <asp:Label ID="Label6" runat="server" Text="Fecha Inicio:">
            </asp:Label>
            <asp:TextBox ID="txtFechaInicio" runat="server"></asp:TextBox><asp:Image ID="Image2" runat="server" ImageUrl="../Imagenes/1410380987_Calendar_24x24.png" 
                                 ImageAlign="Middle"  style="vertical-align:middle"/>
                                 <asp:CalendarExtender ID="CalendarFechaIncio" runat="server" 
                             TargetControlID="txtFechaInicio" PopupButtonID="Image2" 
                    Format="dd/MM/yyyy" Enabled="True"></asp:CalendarExtender> &nbsp;</td><td class="datos"><asp:Label ID="Label7" runat="server" Text="Hora Inicio:"></asp:Label><asp:DropDownList ID="ddlHorasInicio" runat="server"></asp:DropDownList><asp:CustomValidator 
                ID="CustomValidator1" runat="server" ControlToValidate="txtFechaInicio" 
                Display="Dynamic" 
                ErrorMessage="La Fecha de Inicio no puede ser Anterior al dia de Hoy" 
                OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator></td></tr><tr><td class="datos"><asp:Label ID="Label8" runat="server" Text="Fecha Fin:"></asp:Label><asp:TextBox ID="txtFechaFin" runat="server"></asp:TextBox><asp:Image ID="Image3" runat="server" ImageUrl="../Imagenes/1410380987_Calendar_24x24.png" 
                                 ImageAlign="Middle"  style="vertical-align:middle"/><asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                             TargetControlID="txtFechaFin" PopupButtonID="Image3" 
                    Format="dd/MM/yyyy" Enabled="True"></asp:CalendarExtender> &nbsp;</td><td class="datos"><asp:Label ID="Label9" runat="server" Text="Hora Fin:"></asp:Label><asp:DropDownList ID="ddlHorasFin" runat="server"></asp:DropDownList><asp:CustomValidator 
                    ID="CustomValidator3" runat="server" ControlToValidate="txtFechaFin" 
                    Display="Dynamic" 
                    ErrorMessage="La Fecha de Fin no puede ser Anterior a la Fecha de Inicio" 
                    OnServerValidate="CustomValidator3_ServerValidate"></asp:CustomValidator><asp:CustomValidator 
                    ID="CustomValidator2" runat="server" ControlToValidate="txtFechaFin" 
                    Display="Dynamic" 
                    ErrorMessage="La Fecha de Fin no puede ser Anterior al dia de Hoy" 
                    OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator></td></tr></table><table style="margin-top:0px; margin-bottom:10px"><tr><td class="datos" width="73px"><asp:Label ID="Label2" runat="server" Text="Motivo:"></asp:Label></td><td><asp:TextBox ID="txtMotivo" runat="server" style="margin-left:8px" 
                    Width="330px"></asp:TextBox></td></tr></table>
         </contenttemplate>
        </asp:TabPanel>
    </asp:TabContainer>
    <table style="margin-left: 250px; margin-top: 30px">
        <tr>
            <td>
                <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" />
            </td>
            <td>
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" />
            </td>
        </tr>
    </table>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton2" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupExito" PopupControlID="popUpExito" runat="server"
        TargetControlID="LinkButton2">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpExito" runat="server" CssClass="divFondo" Width="310px">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="36px" />
        </div>
        <div class="heading" style="width: 310px">
            <asp:Label ID="Label3" runat="server" Text="El corte se registró con éxito" Style="margin-right: 20px"></asp:Label>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa; width: 310px">
            <div style="margin-right: 15px; text-align: center">
                <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" CausesValidation="False"
                    OnClick="btnAceptarConfirmacion_Click" Style="margin-top: 50px" CssClass="botonPopUp" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
