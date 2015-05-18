<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="RegistrarSolucion.aspx.cs" Inherits="MCorrectivoSesion_RegistrarSolucion"
    Title="Página sin título" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ PreviousPageType VirtualPath="~/MCorrectivoSesion/RegistrarProblema.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .datos
        {
            text-align: center;
        }
        .styleBuscarSocio
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
    <table style="margin-left: 7px">
        <tr>
            <td class="datos">
                <asp:Label ID="Label1" runat="server" Text="Problema:"></asp:Label>
                &nbsp;
            </td>
            <td>
                <asp:Label ID="lblNombreProblema" runat="server" Text="Nombre del problema" CssClass="labelProblema"></asp:Label>
                &nbsp;
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="styleBuscarSocio" colspan="7" width="1200px">
                <asp:Label ID="Label2" runat="server" Text="Asignar Solución"></asp:Label>
                &nbsp;
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="datos">
                <asp:Label ID="Label3" runat="server" Text="Nombre:"></asp:Label>
            </td>
            <td class="datos">
                <asp:TextBox ID="txtNombreSolucion" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNombreSolucion"
                    Display="Dynamic" SetFocusOnError="True">Debe 
                ingresar el Nombre</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="datos">
                <asp:Label ID="Label4" runat="server" Text="Descripción de la Solución:"></asp:Label>
            </td>
            <td class="datos">
                <asp:TextBox ID="txtDescripcionSolucion" runat="server" TextMode="MultiLine" Height="50px"
                    Width="300px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDescripcionSolucion"
                    Display="Dynamic" SetFocusOnError="True">Debe ingresar la Descripción</asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <table style="margin-top: 0px" class="tablaMargen">
        <tr>
            <td class="datos" colspan="2">
                <asp:GridView ID="gvHerramientas" runat="server" AutoGenerateColumns="False" DataSourceID="sdsHerramientas"
                    DataKeyNames="idherramienta" OnRowDataBound="gvHerramientas_RowDataBound" HeaderStyle-CssClass="estiloHeaderTabla"
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField HeaderText="" HeaderStyle-Height="20px">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkHerramienta" runat="server" Style="position: static" />
                            </ItemTemplate>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="10px"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="HERRAMIENTA" HeaderText="Herramienta" SortExpression="Herramienta"
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="TIPO" HeaderText="Tipo" SortExpression="Tipo" HeaderStyle-Width="60px"
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="IDHERRAMIENTA" HeaderText="IDHERRAMIENTA" SortExpression="IDHERRAMIENTA"
                            HeaderStyle-Width="100px" ItemStyle-CssClass="estiloFilasTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="100px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </td>
            <td>
                <asp:SqlDataSource ID="sdsHerramientas" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                    ProviderName="System.Data.SqlClient" SelectCommand="select h.descripcion as HERRAMIENTA, hr.descripcion as TIPO, h.idherramienta
from herramienta h, tipoherramienta hr
where h.idtipoherramienta = hr.idtipoherramienta"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnRegistrarSolucion" runat="server" Text="Registrar" Style="margin-left: 147px"
                            OnClick="btnRegistrarSolucion_Click" />
                        <asp:Button ID="btnCancelarSolucion" runat="server" Text="Cancelar" CausesValidation="false"
                            OnClick="btnCancelarSolucion_Click" />
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
            </td>
            <td>
            </td>
        </tr>
    </table>
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading">
            <asp:Label ID="Label5" runat="server" Text="¿Desea registrar la Solución?"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarConfirmar" runat="server" Text="Aceptar" OnClick="btnAceptarConfirmar_Click"
                            CssClass="botonPopUp" />
                        <asp:Button ID="btnCancelarConfirmar" runat="server" Text="Cancelar" OnClick="btnCancelarConfirmar_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="popUpCancelarRegistrar" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image2" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="40px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label6" runat="server" Text="Se perderán los datos ingresados" Style="margin-right: 25px"></asp:Label>
            <br />
            <asp:Label ID="Label8" runat="server" Text="¿Desea Continuar?"></asp:Label>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa; width: 360px">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
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
            <asp:Label ID="Label7" runat="server" Text="La Solución fue registrada con éxito"
                Style="margin-right: 15px"></asp:Label>
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
</asp:Content>

