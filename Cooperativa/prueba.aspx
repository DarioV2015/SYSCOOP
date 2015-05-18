<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true" CodeFile="prueba.aspx.cs" Inherits="prueba" Title="Página sin título" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:Button ID="btnConfirmarPedido" runat="server" 
                                Text="Confirmar Pedido" />
      <asp:Panel ID="popUpConfirmacionPedido" runat="server" Style="top: 20%; height: 60%;
                                left: 60%; width: 60%; display: none">
                                <div class="md-modal md-effect-5 md-show" id="modal-1">
                                    <div class="md-content" style="width:750px">
                                        <h3>
                                            ¿Desea confirmar el pedido de instalación?</h3> 
                                        <br />
                                        <table style="width: 750px; height: 69px;">
                                            <tr>
                                                <td class="style11">
                                                    <asp:Label ID="Label14" runat="server" Text="Nº de Socio:"></asp:Label>
                                                </td>
                                                <td class="style12">
                                                    <asp:TextBox ID="txtNroSocioConf" runat="server" Enabled="False"></asp:TextBox>
                                                </td>
                                                <td class="style13">
                                                    &nbsp;
                                                </td>
                                                <td class="style14">
                                                    &nbsp;
                                                </td>
                                                <td class="style15">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style11">
                                                    <asp:Label ID="Label15" runat="server" Text="Apellido:"></asp:Label>
                                                </td>
                                                <td class="style12">
                                                    <asp:TextBox ID="txtApellidoConf" runat="server" Enabled="False"></asp:TextBox>
                                                </td>
                                                <td class="style13">
                                                    &nbsp;
                                                </td>
                                                <td class="style14">
                                                    &nbsp;
                                                </td>
                                                <td class="style15">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style11">
                                                    <asp:Label ID="Label16" runat="server" Text="Nombre:"></asp:Label>
                                                </td>
                                                <td class="style12">
                                                    <asp:TextBox ID="txtNombreConf" runat="server" Enabled="False"></asp:TextBox>
                                                </td>
                                                <td class="style13">
                                                    &nbsp;
                                                </td>
                                                <td class="style14">
                                                    &nbsp;
                                                </td>
                                                <td class="style15">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style11">
                                                    <asp:Label ID="Label17" runat="server" Text="Calle:"></asp:Label>
                                                </td>
                                                <td class="style12">
                                                    <asp:TextBox ID="txtCalleConf" runat="server" Enabled="False"></asp:TextBox>
                                                </td>
                                                <td class="style13">
                                                    <asp:Label ID="Label18" runat="server" Text="Nº:"></asp:Label>
                                                </td>
                                                <td class="style14">
                                                    <asp:TextBox ID="txtNumCalleConf" runat="server" Enabled="False" Width="71px"></asp:TextBox>
                                                </td>
                                                <td class="style15">
                                                    <asp:Label ID="Label19" runat="server" Text="Piso:"></asp:Label>
                                                </td>
                                                <td class="style16">
                                                    <asp:TextBox ID="txtPisoConf" runat="server" Enabled="False" Width="67px"></asp:TextBox>
                                                </td>
                                                <td class="style16">
                                                    <asp:Label ID="Label20" runat="server" Text="Dpto.:"></asp:Label>
                                                </td>
                                                <td class="style16">
                                                    <asp:TextBox ID="txtDptoConf" runat="server" Enabled="False" Width="51px"></asp:TextBox>
                                                </td>
                                                <td class="style16">
                                                    <asp:Label ID="Label21" runat="server" Text="Zona:"></asp:Label>
                                                </td>
                                                <td class="style16">
                 
                                                    <asp:TextBox ID="txtZonaConf" runat="server" Enabled="False" Width="81px"></asp:TextBox>
                                                   
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style11">
                                                    <asp:Label ID="Label22" runat="server" Text="Nº Medidor:"></asp:Label>
                                                </td>
                                                <td class="style12">
                                                    <asp:TextBox ID="txtNroMedidorConf" runat="server" Enabled="False"></asp:TextBox>
                                                </td>
                                                <td class="style13">
                                                    &nbsp;
                                                </td>
                                                <td class="style14">
                                                    &nbsp;
                                                </td>
                                                <td class="style15">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style11">
                                                    <asp:Label ID="Label23" runat="server" Text="Código de Fabricación:"></asp:Label>
                                                </td>
                                                <td class="style12">
                                                    <asp:TextBox ID="txtCodFabricacionConf" runat="server" Enabled="False"></asp:TextBox>
                                                </td>
                                                <td class="style13">
                                                    &nbsp;
                                                </td>
                                                <td class="style14">
                                                    &nbsp;
                                                </td>
                                                <td class="style15">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style11">
                                                    <asp:Label ID="Label24" runat="server" Text="Fecha Alta Medidor:"></asp:Label>
                                                </td>
                                                <td class="style12">
                                                    <asp:TextBox ID="txtFechaConf" runat="server" Enabled="False"></asp:TextBox>
                                                </td>
                                                <td class="style13">
                                                    &nbsp;
                                                </td>
                                                <td class="style14">
                                                    &nbsp;
                                                </td>
                                                <td class="style15">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style11">
                                                    &nbsp;
                                                </td>
                                                <td class="style12">
                                                    &nbsp;
                                                </td>
                                                <td class="style13">
                                                    &nbsp;
                                                </td>
                                                <td class="style14">
                                                    &nbsp;
                                                </td>
                                                <td class="style15">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                                <td class="style16">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style11" colspan="10">
                                                    <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" />
                                                    <asp:Button ID="btnCancelarConfirmacion" runat="server" Text="Cancelar" />
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                     </div>
                                </div> 
                            </asp:Panel>
                             <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" 
                                PopupControlID="popUpConfirmacionPedido" BackgroundCssClass="modalBackground"
                                TargetControlID="btnConfirmarPedido" >
                            </asp:ModalPopupExtender>
</asp:Content>

