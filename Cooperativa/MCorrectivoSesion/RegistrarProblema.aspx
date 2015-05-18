<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="RegistrarProblema.aspx.cs" Inherits="MCorrectivoSesion_RegistrarProblema"
    Title="Página sin título" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .datos
        {
            text-align: center;
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
    <table>
        <tr>
            <td class="datos">
                <asp:Label ID="Label1" runat="server" Text="Nombre:"></asp:Label>
                &nbsp;
            </td>
            <td class="datos">
                <asp:TextBox ID="txtNombre" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td>
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNombre"
                    Display="Dynamic" SetFocusOnError="True">Debe 
                ingresar el Nombre</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="datos">
                <asp:Label ID="Label2" runat="server" Text="Descripción del Problema:"></asp:Label>
                &nbsp;
            </td>
            <td class="datos">
                <asp:TextBox ID="txtDescripcion" runat="server" Height="50px" TextMode="MultiLine"
                    overflow="hidden" resize="none" Width="300px"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnNuevaSolucion" runat="server" Text="Nueva Solución" PostBackUrl="~/MCorrectivoSesion/RegistrarSolucion.aspx"
                    OnClick="btnNuevaSolucion_Click" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDescripcion"
                    Display="Dynamic" SetFocusOnError="True">Debe 
                ingresar la Descripción</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="datos">
                <asp:Label ID="Label6" runat="server" Text="Solución:"></asp:Label>
                &nbsp;
            </td>
        </tr>
    </table>
    <table style="margin-top: 0px" class="tablaMargen">
        <tr>
            <td class="datos" colspan="2">
                <asp:GridView ID="gvSoluciones" runat="server" AutoGenerateColumns="False" DataSourceID="sdsSoluciones"
                    DataKeyNames="IDSOLUCION" OnRowDataBound="gvSoluciones_RowDataBound" HeaderStyle-CssClass="estiloHeaderTabla"
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField HeaderText="" HeaderStyle-Height="20px">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSolucion" runat="server" Style="position: static" />
                            </ItemTemplate>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="10px"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" SortExpression="NOMBRE" HeaderStyle-Width="65px"
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="DESCRIPCION" HeaderText="Descripción" SortExpression="DESCRIPCION"
                            HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="IDSOLUCION" HeaderText="IDSOLUCION" SortExpression="IDSOLUCION"
                            HeaderStyle-Width="100px" ItemStyle-CssClass="estiloFilasTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="100px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </td>
            <td>
                <asp:SqlDataSource ID="sdsSoluciones" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                    ProviderName="System.Data.SqlClient" SelectCommand="SELECT [NOMBRE], [DESCRIPCION], [IDSOLUCION] FROM [SOLUCION] with(NOLOCK)">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="datos">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" Style="margin-left: 147px"/>
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CausesValidation="False"
                            OnClick="btnCancelar_Click" />
                        <span style="display: none">
                            <asp:LinkButton ID="lnkButton1" runat="server">LinkButton</asp:LinkButton>
                        </span>
                        <asp:ModalPopupExtender ID="ModalPopupConfirmacion" PopupControlID="popUpConfirmacion"
                            runat="server" TargetControlID="lnkButton1" BackgroundCssClass="reveal-modal-bg">
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
        </tr>
    </table>
    <table>
    </table>
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading">
            <asp:Label ID="Label3" runat="server" Text="¿Desea registrar el Problema?"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarRegistrar" runat="server" Text="Aceptar" OnClick="btnAceptarRegistrar_Click"
                            CssClass="botonPopUp" />
                        <asp:Button ID="btnCancelarRegistrar" runat="server" Text="Cancelar" OnClick="btnCancelarRegistrar_Click" />
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
            <asp:Label ID="Label4" runat="server" Text="Se perderán los datos ingresados" Style="margin-right: 25px"></asp:Label>
            <br />
            <asp:Label ID="Label7" runat="server" Text="¿Desea Continuar?"></asp:Label>
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
            <asp:Label ID="Label5" runat="server" Text="El Problema fue registrado con éxito"
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
</asp:Content>
