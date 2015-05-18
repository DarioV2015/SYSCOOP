<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="RegistrarResultadoOTP.aspx.cs" Inherits="MPreventivo_RegistrarResultadoOTP"
    Title="Registrar Resultado Orden Trabajo Preventivo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
    <link href="../Style/TabStyle2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .datos
        {
            text-align: right;
            width: 140px;
        }
        .margen
        {
            margin-left: 10px;
        }
        .margenTabla
        {
            margin-right: 450px;
        }
        .styleTitulo
        {
            height: 10px;
            text-align: left;
            border-bottom-style: solid;
            border-width: 1px;
            border-bottom-color: rgb(192, 192, 165);
            border-width: 1px;
            font-family: "Source Sans Pro" , Helvetica, Arial;
            font-weight: bold;
            font-size: 12px;
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
        .style12
        {
            text-align: right;
        }
        .style13
        {
            text-align: right;
        }
        .font
        {
            font-family: Sans-Serif;
            font-size: 14px;
        }
        .hidden
        {
            display: none;
        }
    </style>

    <script type="text/javascript">
    
     function RadioCheckOnly(rbControl) {
     
      var gvName = rbControl.defaultValue.split('_')[0];
      var gvControl;
      
      switch (gvName)
      {
        case "gvOTP":
        gvControl =  "<%=gvOTP.ClientID%>";       
        break;       
      }
            
      var gv = document.getElementById(gvControl);
      var rbs = gv.getElementsByTagName("input");
      var row = rbControl.parentNode.parentNode;
      row.style.backgroundColor = 'rgb(161, 183, 238)';
        for (var i = 0; i < rbs.length; i++) {
            if (rbs[i].type == "radio") {
                if (rbs[i].checked && rbs[i] != rbControl) {
                    rbs[i].checked = false;
                     rbs[i].parentNode.parentNode.parentNode.style.backgroundColor = '#E8EFF8';
                    break;
                }
            }
        }
    }    
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="tabconteiner1" runat="server" ActiveTabIndex="0" CssClass="TabStyle2"
        Style="margin-top: 10px">
        <asp:TabPanel ID="tabPanel1" runat="server" HeaderText="Órdenes de trabajo Pendientes">
            <ContentTemplate>
                <table style="margin-top: 0px; margin-left: 40px">
                    <tr>
                        <td>
                            <asp:Label ID="lblNoExiste" runat="server" Text="No hay Ordenes de trabajo pendiente para el usuario conectado."
                                Style="font-family: Sans-Serif; font-size: 14px"></asp:Label>
                            <asp:GridView ID="gvOTP" runat="server" AutoGenerateColumns="False" HeaderStyle-CssClass="estiloHeaderTabla"
                                CellPadding="4" ForeColor="#333333" GridLines="None" Style="margin-left: 200px;
                                margin-bottom: 20px">
                                <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:RadioButton ID="gvOTP_rdbSeleccionar" runat="server" OnCheckedChanged="gvOTP_rdbSeleccionar_CheckedChanged"
                                                AutoPostBack="True" onclick="RadioCheckOnly(this);" />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="estiloFilasTabla" Width="30px"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="idotp" HeaderText="Nro Orden" HeaderStyle-Width="65px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fechainicio" HeaderText="Fecha Inicio" HeaderStyle-Width="65px"
                                        ItemStyle-CssClass="estiloHeaderTabla" DataFormatString="{0:d}">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fechafin" HeaderText="Fecha Fin" HeaderStyle-Width="65px"
                                        ItemStyle-CssClass="estiloHeaderTabla" DataFormatString="{0:d}">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="descripciontipo" HeaderText="Tipo" HeaderStyle-Width="65px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="idtareaplanificada" HeaderStyle-CssClass="hidden"
                                        ItemStyle-CssClass="hidden">
                                        <ItemTemplate>
                                            <asp:Label ID="lblIdTareaPlanificada" Text='<%# Eval("idtareaplanificada") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="tabPanel2" runat="server" HeaderText="Detalle y Resultado">
            <ContentTemplate>
                <table style="margin-top: 0px; margin-left: 250px">
                    <tr>
                        <td>
                            <asp:GridView ID="gvTareas" runat="server" DataSourceID="sdsTareas" AutoGenerateColumns="False"
                                HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                                GridLines="None" Width="350px">
                                <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="tarea" HeaderText="Tarea General" HeaderStyle-Width="65px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="actividades" HeaderText="Actividad" HeaderStyle-Width="65px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsTareas" runat="server" ConnectionString="<%$ ConnectionStrings:SISEConnectionString %>"
                                SelectCommand="select tg.descripcion tarea, a.descripcion  actividades
from ordentrabajopreventivo otp, tareaplanificada tp, tareageneral tg, tareageneralxactividad txa, actividad a
where otp.idtareaplanificada = tp.idtareaplanificada
and tp.idtareageneral = tg.idtareageneral
and txa.idtarea = tg.idtareageneral
and txa.idactividad = a.idactividad
and otp.idtareaplanificada = @tareaplanificada">
                                <SelectParameters>
                                    <asp:Parameter Name="tareaplanificada" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
                <table style="margin-left: 250px; margin-top: 20px; margin-bottom: 20px">
                    <tr>
                        <td valign="top">
                            <asp:Label ID="lblTrabajo" runat="server" Text="Trabajo Realizado:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDescripcion" runat="server" Width="220px" Height="40px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
    <table style="margin-left: 100px; margin-top: 20px">
        <tr>
            <td>
                <asp:UpdatePanel runat="server" ID="upBotones">
                    <ContentTemplate>
                        <asp:Button ID="btnRegistrar" runat="server" OnClick="btnRegistrar_Click" Text="Registrar"
                            Style="margin-left: 230px" UseSubmitBehavior="True" />
                        <asp:Button ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton2" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupExito" PopupControlID="popUpExito" runat="server"
        TargetControlID="LinkButton2">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpExito" runat="server" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="35px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label6" runat="server" Text="El Resultado se registró con éxito"></asp:Label>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center">
                <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" CausesValidation="False"
                    Style="margin-top: 30px" OnClick="btnAceptarConfirmacion_Click" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
