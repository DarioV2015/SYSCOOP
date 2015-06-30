<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="CambiarPassword.aspx.cs" Inherits="MCorrectivoSesion_CambiarPassword"
    Title="Cambiar contraseña" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .estiloHeaderTabla
        {
            font-family: Sans-Serif;
            font-size: 13px;
            background-color: #b9c9fe;
            font-weight: bold;
            background: #b9c9fe;
            border-top: 4px solid #aabcfe;
            border-bottom: 1px solid #fff;
            color: #039;
            padding: 8px;
            border-left-style: none;
            border-right-style: none;
            border-left: none;
        }
        .estiloFilasTabla
        {
            text-align: center;
            font-family: Sans-Serif;
            font-size: 13px;
            border-left-style: none;
            border-left-width: 0px;
            border-bottom: 1px solid #fff;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel runat="server" ID="udpPass">
        <ContentTemplate>
            <table width="480px" style="margin-left: 10px">
                <tr>
                    <td class=" datos">
                        &nbsp;<asp:Label ID="Label1" runat="server" Text="Contraseña Anterior"></asp:Label>
                    </td>
                    <td>
                        &nbsp;<asp:TextBox ID="txtAnterior" runat="server" TextMode="Password" Height="20px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="datos">
                        &nbsp;<asp:Label ID="Label2" runat="server" Text="Contraseña Nueva"></asp:Label>
                    </td>
                    <td>
                        &nbsp;<asp:TextBox ID="txtNueva" runat="server" TextMode="Password" Height="20px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="datos">
                        &nbsp;<asp:Label ID="Label3" runat="server" Text="Repetir Contraseña"></asp:Label>
                    </td>
                    <td>
                        &nbsp;<asp:TextBox ID="txtRepetir" runat="server" TextMode="Password" Height="20px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <table style="margin-left: 15px">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                        </td>
                    </ContentTemplate>
                </asp:UpdatePanel>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:ModalPopupExtender ID="ModalPopupExito" PopupControlID="popUpExito" runat="server"
                TargetControlID="LinkButton1" BackgroundCssClass="reveal-modal-bg">
            </asp:ModalPopupExtender>
            <span style="display: none">
                <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
            </span>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
        <ContentTemplate>
            <asp:ModalPopupExtender ID="ModalPopupConfirmacion" PopupControlID="popUpConfirmacion"
                runat="server" TargetControlID="LinkButton2" BackgroundCssClass="reveal-modal-bg">
            </asp:ModalPopupExtender>
            <span style="display: none">
                <asp:LinkButton ID="LinkButton2" runat="server">LinkButton</asp:LinkButton>
            </span>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading">
            <asp:Label ID="Label4" runat="server" Text="¿Desea cambiar la contraseña?"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarRegistrar" runat="server" Text="Aceptar" OnClick="btnAceptarRegistrar_Click"
                            CssClass="botonPopUp" />
                        <asp:Button ID="btnCancelarRegistrar" runat="server" Text="Cancelar" OnClick="btnCancelarRegistrar_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
        <ContentTemplate>
            <asp:ModalPopupExtender ID="ModalPopupCancelarRegistrar" PopupControlID="popUpCancelarRegistrar"
                runat="server" TargetControlID="LinkButton3" BackgroundCssClass="reveal-modal-bg">
            </asp:ModalPopupExtender>
            <span style="display: none">
                <asp:LinkButton ID="LinkButton3" runat="server">LinkButton</asp:LinkButton>
            </span>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Panel ID="popUpCancelarRegistrar" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image2" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="40px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label6" runat="server" Text="Se cancelará el cambio de contraseña"
                Style="margin-right: 25px"></asp:Label>
            <br />
            <asp:Label ID="Label7" runat="server" Text="¿Desea Continuar?"></asp:Label>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa; width: 360px">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarCancelacion" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarCancelacion_Click" Style="margin-top: 50px" />
                        <asp:Button ID="btnCancelarCancelacion" runat="server" Text="Cancelar" CausesValidation="False"
                            OnClick="btnCancelarCancelacion_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="popUpExito" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="40px" />
        </div>
        <div class="heading">
            <asp:Label ID="Label5" runat="server" Text="La contraseña fue cambiada con éxito"
                Style="margin-right: 15px"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarConfirmacion_Click" CssClass="botonPopUp" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <asp:UpdatePanel ID="UpdatePanel11" runat="server">
        <ContentTemplate>
            <asp:ModalPopupExtender ID="ModalPopupPasswordEquivocada" PopupControlID="popUpPasswordEquivocada"
                runat="server" TargetControlID="LinkButton5" BackgroundCssClass="reveal-modal-bg">
            </asp:ModalPopupExtender>
            <span style="display: none">
                <asp:LinkButton ID="LinkButton5" runat="server">LinkButton</asp:LinkButton>
            </span>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Panel ID="popUpPasswordEquivocada" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image4" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="40px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label9" runat="server" Text="La contraseña no es correcta" Style="margin-right: 25px"></asp:Label>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa; width: 360px">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarNoCorrecta" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarNoCorrecta_Click" Style="margin-top: 50px" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <asp:UpdatePanel ID="UpdatePanel9" runat="server">
        <ContentTemplate>
            <asp:ModalPopupExtender ID="ModalPopupNoCoinciden" PopupControlID="popUpNoCoinciden"
                runat="server" TargetControlID="LinkButton4" BackgroundCssClass="reveal-modal-bg">
            </asp:ModalPopupExtender>
            <span style="display: none">
                <asp:LinkButton ID="LinkButton4" runat="server">LinkButton</asp:LinkButton>
            </span>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Panel ID="popUpNoCoinciden" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image3" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="40px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label8" runat="server" Text="No coinciden las contraseñas" Style="margin-right: 25px"></asp:Label>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa; width: 360px">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="AceptarNoCoinciden" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarNoCoinciden_Click" Style="margin-top: 50px" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
