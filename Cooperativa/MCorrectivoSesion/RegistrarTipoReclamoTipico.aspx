<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="RegistrarTipoReclamoTipico.aspx.cs" Inherits="MCorrectivoSesion_RegistrarTipoReclamoTipico"
    Title="Tipo de Reclamo Típico" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .datos
        {
            text-align: center;
            width: 100px;
        }
        .style8
        {
            width: 261px;
        }
        .style9
        {
            width: 2px;
        }
        .style10
        {
            text-align:center;
            width: 100px;
            height: 6px;
        }
        .style11
        {
            height: 6px;
        }
        .style12
        {
            width: 261px;
            height: 6px;
        }
         .styleBuscarSocio
        {
            height: 10px;
        	text-align:center;
            border-bottom-style: solid;
            border-width: 1px;
            border-bottom-color: rgb(192, 192, 165);
            border-width: 1px;
            font-family: "Source Sans Pro" , Helvetica, Arial;
            font-weight: bold;
            font-size: 12px;
        }
        .labelProblema
        {
            font-weight: bold;
            font-size: 12px;
            font-family: @Arial Unicode MS;
        }
         .tablaMargen
        { margin-left:63px;
        	}
        .botonPopUp
        {
        	margin-left:0px;
        	margin-top:30px;
        	text-align:center;
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
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="94% " cellpadding="4px" style="margin-top: 0px">
        <tr>
            <td class="datos">
                <asp:Label ID="Label4" runat="server" Text="Nombre:"></asp:Label>
            </td>
            <td width="200px" height="20px">
                <asp:TextBox ID="txtNombre" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td height="20px" class="style8">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNombre"
                    Display="Dynamic" SetFocusOnError="True">Debe 
                ingresar el Nombre.</asp:RequiredFieldValidator>
            </td>
            <td width="200px" height="20px">
                &nbsp;
            </td>
            <td rowspan="3" width="600px">
                <table width="94% " style="margin-top: 0px" cellpadding="0px">
                    <tr>
                        <td class="style9">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style9">
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style10">
                <asp:Label ID="Label1" runat="server" Text="Descripción del Reclamo:" 
                    style="margin-top: 0px"></asp:Label>
                &nbsp;
            </td>
            <td width="200px" class="style11">
                <asp:TextBox ID="txtDescripcion" runat="server" Height="50px" 
                    TextMode="MultiLine" Width="300px"></asp:TextBox>
                &nbsp;
            </td>
            <td class="style12">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                    SetFocusOnError="True" ControlToValidate="txtDescripcion">Debe ingresar la Descripción.</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="datos">
                <asp:Label ID="Label2" runat="server" Text="Prioridad:" Font-Size="13px"></asp:Label>
                &nbsp;
            </td>
            <td height="20px">
               <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="comboPrioridad" runat="server" AppendDataBoundItems="True"
                            DataSourceID="sdsPrioridad" DataTextField="DESCRIPCION" 
                            DataValueField="IDPRIORIDAD" Width="200px">
                            <asp:ListItem>Seleccione la Prioridad</asp:ListItem>
                             
                        </asp:DropDownList>
                        
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td height="20px" width="271px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                    InitialValue="Seleccione la Prioridad" SetFocusOnError="True" ControlToValidate="comboPrioridad">Debe 
                seleccionar la Prioridad.</asp:RequiredFieldValidator>
            </td>
            <td height="20px">
                <asp:SqlDataSource ID="sdsPrioridad" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                    ProviderName="System.Data.SqlClient" SelectCommand="SELECT [DESCRIPCION], [IDPRIORIDAD] FROM [PRIORIDAD]">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <br />
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:Button ID="btnRegistrarReclamo" runat="server" Text="Registrar" OnClick="btnRegistrarReclamo_Click" Style="margin-left: 147px"/>
            <asp:Button ID="btnCancelarReclamo" runat="server" CausesValidation="False" OnClick="btnCancelarReclamo_Click"
                Text="Cancelar" />
            <span style="display: none">
                <asp:LinkButton ID="lnkbtn_DummyLnkBtn" runat="server">LinkButton</asp:LinkButton>
            </span>
            <asp:ModalPopupExtender ID="ModalPopupRegistrar" PopupControlID="popUpConfirmacion"
                runat="server" TargetControlID="lnkbtn_DummyLnkBtn" BackgroundCssClass="reveal-modal-bg">
            </asp:ModalPopupExtender>
            <span style="display: none">
                <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
            </span>
            <asp:ModalPopupExtender ID="ModalPopupCancelarRegistrar" PopupControlID="popUpCancelarRegistrar"
                runat="server" TargetControlID="LinkButton1" BackgroundCssClass="reveal-modal-bg">
            </asp:ModalPopupExtender>
            <span style="display: none">
                <asp:LinkButton ID="LinkButton2" runat="server">LinkButton</asp:LinkButton>
            </span>
            <asp:ModalPopupExtender ID="ModalPopupExito" PopupControlID="popUpExito" runat="server"
                TargetControlID="LinkButton2" BackgroundCssClass="reveal-modal-bg">
            </asp:ModalPopupExtender>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo">
     <div class="heading">
        <asp:Label ID="lblNoMedidores" runat="server" Text="¿Desea registrar el Tipo de Reclamo?"></asp:Label>
        <br />
        </div>
         <div class="content" style="height:100px;border-top: 0.1px solid #bababa">
        <div style="margin-right:15px;text-align: center;">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <asp:Button ID="btnAceptarRegistrar" runat="server" Text="Aceptar" OnClick="btnAceptarRegistrar_Click" CssClass="botonPopUp"/>
                <asp:Button ID="btnCancelarRegistrar" runat="server" Text="Cancelar" OnClick="btnCancelarRegistrar_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="popUpCancelarRegistrar" runat="server" Style="display: none" CssClass="divFondo">
    <div style="float:left; width:40px; margin-left: 20px;margin-top: 3px;">
        <asp:Image ID="Image2" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="40px" />
    </div>
    <div class="heading" style="width:360px">
        <asp:Label ID="Label3" runat="server" Text="Se perderán los datos ingresados" style="margin-right:25px"></asp:Label>
        <br />
        <asp:Label ID="Label6" runat="server" Text="¿Desea Continuar?"></asp:Label>
      </div>
      <div class="content" style="height:100px;border-top: 0.1px solid #bababa; width:360px">
        <div style="margin-right:15px;text-align: center">
        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
            <ContentTemplate>
                <asp:Button ID="btnAceptarCancelacion" runat="server" Text="Aceptar" CausesValidation="False"
                    OnClick="btnAceptarCancelacion_Click" style="margin-top:50px"/>
                <asp:Button ID="btnCancelarCancelacion" runat="server" Text="Cancelar" CausesValidation="False"
                    OnClick="btnCancelarCancelacion_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="popUpExito" runat="server" Style="display: none" CssClass="divFondo">
    <div style="float:left; width:40px; margin-left: 20px;margin-top: 3px;">
        <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="40px" />
    </div>
    <div class="heading">
        <asp:Label ID="Label5" runat="server" Text="El Tipo de Reclamo fue registrado con éxito"></asp:Label>
        
    </div>    
     <div class="content" style="height:100px;border-top: 0.1px solid #bababa">
        <div style="margin-right:15px;text-align: center">
        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
            <ContentTemplate>
                <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" CausesValidation="False"
                    OnClick="btnAceptarConfirmacion_Click" CssClass="botonPopUp"/>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
        </div>
    </asp:Panel>
</asp:Content>
