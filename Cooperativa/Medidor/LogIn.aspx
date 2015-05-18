<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="LogIn.aspx.cs" Inherits="LogIn" Title="SISE" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
     <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .datos
        {
            text-align: right;
        }
        .estiloField
        {
            width: 370px;
            border-bottom-left-radius: 6px;
            border-bottom-right-radius: 6px;
            border-top-left-radius: 6px;
            border-top-right-radius: 6px;
            -webkit-border-radius: 7px;
            margin-top: 10px;
            height: 270px;
            -webkit-border-after-color: #A1BCD6;
            -webkit-border-before-color: #A1BCD6;
            -webkit-border-end-color: #A1BCD6;
            -webkit-border-start-color: #A1BCD6;
            border-width: 2px;
            background-image: -moz-radial-gradient(center 45deg,circle cover, #cde6f9, #6191bf);
            background-image: -webkit-gradient(radial, 50% 50%, 0, 50% 50%,900, from(#EFF7FD), to(#255B8F));
        }
        .estiloTextBox
        {
            border: 1px solid #ccc;
            width: 280px;
            font-size: 12px;
            line-height: 1em;
            padding: 4px;
            -moz-box-shadow: inset 0 0 5px #ccc;
            -webkit-box-shadow: inset 0 0 5px #ccc;
            box-shadow: inset 0 0 5px #ccc;
            border-radius: 4px;
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
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <span style="display: none">
        <asp:LinkButton ID="lnkbtn_DummyLnkBtn" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="Login1" PopupControlID="Panel1" runat="server" TargetControlID="lnkbtn_DummyLnkBtn"
        BackgroundCssClass="modalBackground">
    </asp:ModalPopupExtender>
    <asp:Panel ID="Panel1" runat="server">
        <fieldset class="estiloField">
            <table style="margin-left: 25px">
                <tr>
                    <td rowspan="2" width="67px">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagenes/LOGIN.png" />
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Iniciar Sesión" Style="font-family: Calibri;
                            font-size: 30px; margin-left: 27px"></asp:Label>
                    </td>
                </tr>
            </table>
            <table style="height: 90px; margin-left: 50px; margin-top: 20px">
                <tr>
                    <td class="datos">
                        <asp:Label ID="lblUsuario" runat="server" Text="Usuario" Style="font-family: Calibri;
                            font-size: 14px"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUsuario" runat="server" CssClass="estiloTextBox" Width="160px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="datos">
                        <asp:Label ID="lblPass" runat="server" Text="Contraseña" Style="font-family: Calibri;
                            font-size: 14px"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="estiloTextBox"
                            Width="160px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table width="370px">
                <tr>
                    <td>
                        <asp:Button ID="btnAceptar" runat="server" OnClick="BtnAceptar_Click" Text="Iniciar"
                            Style="margin-left: 120px; margin-top: 15px" />
                    </td>
                    <td style="width: 100px">
                        <asp:Label ID="lblMensaje" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        <asp:TextBox ID="txtIp" runat="server" Visible="False"></asp:TextBox>
                    </td>
                    <td style="width: 100px">
                        &nbsp;
                    </td>
                    <td style="width: 100px">
                        &nbsp;
                    </td>
                </tr>
            </table>
        </fieldset>
    </asp:Panel>
    
        <span style="display: none">
        <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
    </span>
                            <asp:ModalPopupExtender ID="mpeConfirmacion" PopupControlID="popUpConfirmacion" runat="server"
        TargetControlID="LinkButton1" BackgroundCssClass="modalBackground">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading" id="modal-1">
            <asp:Label ID="lblNoMedidores" runat="server" Text="Advertencia"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
            <asp:Label ID="lblMensajeAdv" runat="server" Text="Este usuario no tiene permisos" />
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarAdv" runat="server" Text="Aceptar" OnClick="btnAceptarAdv_Click"
                            CssClass="botonPopUp" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
