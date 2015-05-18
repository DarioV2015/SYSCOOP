<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="RegistrarPedidoInstalacionMedidor.aspx.cs" Inherits="Medidor_RegistrarPedidoInstalacionMedidor"
    Title="Pedido de Instalación de Medidor" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?v=3.8&amp;key=AIzaSyALhJSXocMN5jstXyeuT1X8mTiRJkVVXYg&amp;libraries=drawing,geometry&amp;language=es&amp;region=AR&amp;sensor=false"></script>

    <script type="text/javascript" src="../Js/utilGMaps.js"></script>

    <script type="text/javascript" src="../Js/marcadores.js"></script>

    <script type="text/javascript" src="../Js/general.js"></script>

    <script type="text/javascript" src="../Js/linea.js"></script>
    
        <script type="text/javascript" src="../Js/PedidoInstalacion.js"></script>

    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
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
        .styleLabelNroDoc
        {
            text-align: right;
        }
        .datos
        {
            text-align: right;
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
 <%--    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
        <ContentTemplate> --%>
            <asp:Panel ID="panelDatosSoico" runat="server">
                <table width="800px" style="margin-top: 0px">
                    <tr>
                        <td style="border-bottom-style: inset" height="25px">
                            &nbsp;
                            <asp:Label ID="Label15" runat="server" Font-Italic="True" Font-Size="Medium" Text="Datos del Socio"></asp:Label>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <table width="807px" style="margin-top: 0px">
                    <tr>
                        <td width="780px" class="datos">
                            <asp:Label ID="Label1" runat="server" Text="Nro. de Socio:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNroSocio" runat="server" Enabled="false"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="datos">
                            <asp:Label ID="Label2" runat="server" Text="Apellido:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtApellido" runat="server" Enabled="false"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="datos">
                            <asp:Label ID="Label3" runat="server" Text="Nombre:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNombre" runat="server" Enabled="false"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="datos">
                            <asp:Label ID="Label4" runat="server" Text="Nro. Documento:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNroDocumento" runat="server" Enabled="false"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="datos">
                            <asp:Label ID="Label5" runat="server" Text="Calle:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNombreCalle" runat="server" Enabled="false"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Nro:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNroCalle" runat="server" Enabled="false" Width="40px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="Piso:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNroPiso" runat="server" Enabled="false" Width="40px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="Dpto.:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDpto" runat="server" Enabled="false" Width="40px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="Zona:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtZona" runat="server" Enabled="false"></asp:TextBox>
                            <asp:DropDownList ID="comboZona" runat="server" DataSourceID="sdsZona" DataTextField="DESCRIPCION"
                                DataValueField="IDZONA" AppendDataBoundItems="True" Visible="false" Width="126px">
                                <asp:ListItem>Seleccione Zona</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                  <%--       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate> --%>
                                <td width="100px">
                                    <asp:ImageButton ID="btnNuevaDireccion" runat="server" OnClick="btnNuevaDireccion_Click"
                                        ImageUrl="../Imagenes/button-MAS1.png" />
                                    <%--<asp:Button ID="btnNuevaDireccion" runat="server"  OnClick="btnNuevaDireccion_Click"
                                        Style="margin-left: 60px; margin-top: 20px;     "   Text="Nueva Dirección" />--%>
                                </td>
                                <td width="100px">
                                    <asp:ImageButton ID="btnAceptarNuevaDireccion" OnClick="btnAceptarNuevaDireccion_Click"
                                        runat="server" ImageUrl="../Imagenes/aceptar.png" Visible="False" />
                                    <%--<asp:Button ID="btnAceptarNuevaDireccion" runat="server" Text="Aceptar" OnClick="btnAceptarNuevaDireccion_Click"
                                        Style="margin-left: 60px; margin-top: 20px" Visible="false" />--%>
                                </td>
                                <td width="100px">
                                    <asp:ImageButton ID="btnCancelarNuevaDireccion" OnClick="btnCancelarNuevaDireccion_Click"
                                        runat="server" ImageUrl="../Imagenes/button-CANCELAR.png" Visible="False" />
                                    <%--<asp:Button ID="btnCancelarNuevaDireccion" runat="server" Text="Cancelar" OnClick="btnCancelarNuevaDireccion_Click"
                                        Style="margin-left: 60px; margin-top: 20px" Visible="false" />--%>
                                </td>
                      <%--         </ContentTemplate>
                        </asp:UpdatePanel> --%>
                        <td>
                            <asp:SqlDataSource ID="sdsZona" runat="server" ConnectionString="<%$ ConnectionStrings:SISEConnectionString %>"
                                SelectCommand="SELECT [IDZONA], [DESCRIPCION] FROM [ZONA]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="datos">
                            <asp:Label ID="Label10" runat="server" Text="Tipo Medidor:"></asp:Label>
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="comboTipoMedidor" runat="server" DataSourceID="sdsTipoMedidor"
                                        DataTextField="DESCRIPCION" DataValueField="IDTIPOMEDIDOR" OnSelectedIndexChanged="comboTipoMedidor_SelectedIndexChanged"
                                        AppendDataBoundItems="True" AutoPostBack="True" Width="150px">
                                        <asp:ListItem>Seleccione el Tipo de Medidor</asp:ListItem>
                                    </asp:DropDownList>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:SqlDataSource ID="sdsTipoMedidor" runat="server" ConnectionString="<%$ ConnectionStrings:SISEConnectionString %>"
                                SelectCommand="SELECT [IDTIPOMEDIDOR], [DESCRIPCION] FROM [TIPOMEDIDOR]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    </table>
                    <table style="margin-top:3px">
                    <tr>
                    <td colspan="6">
                     <div id="divMap" style="width: 800px; height: 170px;" />
                    </td>
                    </tr>
                </table>
                <table style="margin-top:10px">
                    <tr>
                        <td>
                            <asp:Button ID="btnConfirmarPedido" runat="server" Text="Aceptar" OnClick="btnConfirmarPedido_Click"
                                Style="margin-top: 10px; margin-left: 250px" />
                        </td>
                        <td>
                            <asp:Button ID="btnCancelarPedido" runat="server" Text="Cancelar" OnClick="btnCancelarPedido_Click"
                                Style="margin-top: 10px; margin-left: 20px" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
  <%--       </ContentTemplate>
    </asp:UpdatePanel> --%>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton2" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopUpConfirmacion" PopupControlID="popUpConfirmacion"
        runat="server" TargetControlID="LinkButton2">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading">
            <asp:Label ID="Label12" runat="server" Text="¿Desea confirmar el Pedido de Instalación del Medidor?"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="panelMedidorAsignado" runat="server" Visible ="false">
                            <table style="margin-top: 0px; margin-left: 65px">
                                <tr>
                                    <td style="border-bottom-style: inset; border-bottom-width: 2px" height="25px">
                                        &nbsp;
                                        <asp:Label ID="Label17" runat="server" Font-Italic="True" Font-Size="15px" Text="Datos del Medidor a asignar"></asp:Label>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <table style="margin-left: 93px">
                                <tr>
                                    <td class="datos">
                                        <asp:Label ID="Label18" runat="server" Text="Nro. Medidor:" Font-Italic="True"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblNroMedidorAsignar" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="datos">
                                        <asp:Label ID="Label19" runat="server" Text="Nro. Fabricación:" Font-Italic="True"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblNroFabAsignar" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="datos">
                                        <asp:Label ID="Label21" runat="server" Text="Nro. Lote:" Font-Italic="True"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblNroLoteAsignar" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarPedido" runat="server" Text="Aceptar" OnClick="btnAceptarPedido_Click"
                            CssClass="botonPopUp" />
                        <asp:Button ID="btnCancelarPedidoConfirmacion" runat="server" Text="Cancelar" OnClick="btnCancelarPedidoConfirmacion_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton3" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupCancelarPedido" PopupControlID="popUpCancelarPedido"
        runat="server" TargetControlID="LinkButton3">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpCancelarPedido" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image2" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="35px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label13" runat="server" Text="Se cancelará el Pedido de Instalación"
                Style="margin-right: 25px"></asp:Label>
            <br />
            <asp:Label ID="Label16" runat="server" Text="¿Desea Continuar?"></asp:Label>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarCancelacionPedido" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarCancelacionPedido_Click" Style="margin-top: 50px" />
                        <asp:Button ID="btnCancelarCancelacionPedido" runat="server" Text="Cancelar" CausesValidation="False"
                            OnClick="btnCancelarCancelacionPedido_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton4" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupExito" PopupControlID="popUpExito" runat="server"
        TargetControlID="LinkButton4">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpExito" runat="server" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="36px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label14" runat="server" Text="Se generó con éxito el Pedido de Instalación"
                Style="margin-right: 2px"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarConfirmacion_Click" CssClass="botonPopUp" />
                            <asp:Button ID="btnVerComprobante" runat="server" Text="Comprobante" CausesValidation="False"
                            OnClick="btnVerComprobante_Click"  />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton5" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupNoMedidor" PopupControlID="popUpNoMedidor"
        runat="server" TargetControlID="LinkButton5">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpNoMedidor" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px">
            <asp:Image ID="Image3" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="35px" />
        </div>
        <div class="heading" style="width: 420px; height: auto">
            <asp:Label ID="Label20" runat="server" Text="No hay medidores disponibles" Style="margin-right: 25px"></asp:Label>
            <br />
        </div>
        <div class="content" style="width: 420px; height: 120px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                    <ContentTemplate>
                        <br />
                        <asp:Label ID="Label23" runat="server" Text="En caso de Registrar el Pedido se generará con estado Pendiente"></asp:Label>
                        <asp:Button ID="btnAceptarPedidoPendiente" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarPedidoPendiente_Click" Style="margin-top: 50px" />
                        <asp:Button ID="btnCancelarPedidoPendiente" runat="server" Text="Cancelar" CausesValidation="False"
                            OnClick="btnCancelarPedidoPendiente_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
