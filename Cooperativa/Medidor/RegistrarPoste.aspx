﻿<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="RegistrarPoste.aspx.cs" Inherits="Medidor_RegistrarPoste" Title="Registrar Poste"
    EnableEventValidation="True" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?v=3.8&amp;key=AIzaSyALhJSXocMN5jstXyeuT1X8mTiRJkVVXYg&amp;libraries=drawing,geometry&amp;language=es&amp;region=AR&amp;sensor=false"></script>

    <script type="text/javascript" src="../Js/utilGMaps.js"></script>

    <script type="text/javascript" src="../Js/marcadores.js"></script>

    <script type="text/javascript" src="../Js/general.js"></script>
    
    <script type="text/javascript" src="../Js/poste.js"></script>

    <script type="text/javascript">
    function buscarDirCalleNro()
    {
   
        var txtcalle = document.getElementById('<%=txtCalle.ClientID%>');
        var txtnro = document.getElementById('<%=txtNro.ClientID%>');
        obtenerLocalizacionDeDireccion(txtcalle.value + txtnro.value,newpostes);
    }
    </script>

    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .boton
        {
            margin-left: 10px;
            margin-top: 10px;
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
        .styleLabelNroDoc
        {
            text-align: right;
        }
        .datos
        {
            text-align: right;
            width: 140px;
        }
        .tablaBorde
        {
            border: solid #ccc 1px;
            -moz-border-radius: 6px;
            -webkit-border-radius: 6px;
            border-radius: 6px;
            -webkit-box-shadow: 0 1px 1px #ccc;
            -moz-box-shadow: 0 1px 1px #ccc;
            box-shadow: 0 1px 1px #ccc;
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
            border-right: none;
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
            border-right: none;
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
        labelSinCarga
        {
            background-color: rgb(240, 240, 240);
            border-color: rgb(214, 214, 214);
            font-family: sans-serif;
            font-size: 14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td style="width: 550px; height: 55px;" rowspan="12">
                <div id="divMap" style="width: 550px; height: 550px;" />
            </td>
            <td>
                <div>
                    <asp:UpdatePanel ID="upMapa" runat="server">
                        <ContentTemplate>
                            <table style="width: 100px;">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="Calle:" Width="70px" Style="text-align: right"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCalle" runat="server" OnTextChanged="txtCalle_TextChanged" AutoPostBack="False"></asp:TextBox>
                                    </td>
                                    <td rowspan="3">
                                        <asp:Button ID="btnBuscarDir" runat="Server" Style="margin-left: 10px" Text="Buscar "
                                            UseSubmitBehavior="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="Nro:" Width="70px" Style="text-align: right"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNro" runat="server" AutoPostBack="False" OnTextChanged="txtNro_TextChanged"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="upTabla" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnRefresco" runat="server" OnClick="Button2_Click" Text="Button"
                            UseSubmitBehavior="True" Style="display: none;" />
                        <asp:GridView ID="gvMarcadores" runat="server" AutoGenerateColumns="False" OnRowCommand="comandosGVPostes"
                            HeaderStyle-CssClass="estiloHeaderTabla" ForeColor="#333333" BorderStyle="None"
                            EmptyDataRowStyle-BackColor="#ECECEC" EmptyDataRowStyle-BorderColor="#CFCFCF"
                            EmptyDataRowStyle-Font-Size="14px" EmptyDataRowStyle-Font-Names="sans-serif"
                            Style="border-right: none; margin-left: 10px" 
                            onpageindexchanging="gvMarcadores_PageIndexChanging">
                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle"
                                Width="150px" />
                            <EmptyDataRowStyle BackColor="#ECECEC" BorderColor="#CFCFCF" 
                                Font-Names="sans-serif" Font-Size="14px" />
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Poste" HeaderStyle-Width="30px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="30px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Latitud" HeaderText="Latitud" HeaderStyle-Width="40px"
                                    ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="40px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Longitud" HeaderText="Longitud" HeaderStyle-Width="40px"
                                    ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="40px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Calle" HeaderText="Calle" HeaderStyle-Width="100px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="100px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Nro" HeaderText="Nro" HeaderStyle-Width="30px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="30px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:TemplateField ShowHeader="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="20px"
                                    ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="estiloHeaderTabla">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnModMarc" runat="server" UseSubmitBehavior="False" OnClick='<%#String.Format("setDragOn(postes, {0})",Container.DataItemIndex) %>'
                                            ImageUrl="../Imagenes/Edit.png" />
                                        <%--<asp:Button ID="btnModMarc" runat="server" 
                                            Text="Modificar" UseSubmitBehavior="False" OnClick='<%#String.Format("setDragOn(postes, {0})",Container.DataItemIndex) %>'/>--%>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="estiloHeaderTabla" HorizontalAlign="Center" 
                                        Width="20px" />
                                    <ItemStyle CssClass="estiloFilasTabla" Width="10px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="20px"
                                    ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="estiloHeaderTabla">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="Button1" runat="server" OnClientClick='<%#String.Format("eliminarMarcador({0})",Eval("Id")) %>'
                                            UseSubmitBehavior="True" ImageUrl="../Imagenes/cancel.png" />
                                        <%--<asp:Button ID="Button1" runat="server" OnClick='<%#String.Format("eliminarMarcador({0})",Eval("Id")) %>'
                                            Text="Eliminar" UseSubmitBehavior="False" />--%>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="estiloHeaderTabla" HorizontalAlign="Center" 
                                        Width="20px" />
                                    <ItemStyle CssClass="estiloFilasTabla" Width="10px"></ItemStyle>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="estiloHeaderTabla" />
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 100%;">
                    <tr>
                        <asp:UpdatePanel ID="upBotones" runat="server">
                            <ContentTemplate>
                                <td width="100px">
                                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" UseSubmitBehavior="True"
                                        Style="margin-left: 100px" OnClick="btnAceptar_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click"
                                        UseSubmitBehavior="False" />
                                </td>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </tr>
                </table>
            </td>
            <td>
            </td>
        </tr>
    </table>
    <span style="display: none">
        <asp:LinkButton ID="lnkbtn_DummyLnkBtn" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="mpeConfirmacion" PopupControlID="popUpConfirmacion" runat="server"
        TargetControlID="lnkbtn_DummyLnkBtn" BackgroundCssClass="modalBackground">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading" id="modal-1">
            <asp:Label ID="lblNoMedidores" runat="server" Text="¿Desea guardar los cambios?"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarRegistrar" runat="server" Text="Aceptar" OnClick="btnAceptarGuardar_Click"
                            CssClass="botonPopUp" />
                        <asp:Button ID="btnCancelarRegistrar" runat="server" Text="Cancelar" OnClick="btnCancelarGuardar_Click"
                            CssClass="botonPopUp" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton2" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupCancelarRegistrar" PopupControlID="popUpCancelarRegistrar"
        BehaviorID="mpeAdv" runat="server" TargetControlID="LinkButton2" BackgroundCssClass="reveal-modal-bg">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpCancelarRegistrar" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image2" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="40px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label3" runat="server" Text="Advertencia" Style="margin-right: 25px"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa; width: 360px">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <asp:Label ID="Label4" runat="server" Text="No se puede eliminar el Poste debido a que esta asociado a una linea"
                            Style="margin-right: 25px"></asp:Label>
                        <asp:Button ID="btnAceptarAdvertencia" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarAdvertencia_Click" Style="margin-top: 50px" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
