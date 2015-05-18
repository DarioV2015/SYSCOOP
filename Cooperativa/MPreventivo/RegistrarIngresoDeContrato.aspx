<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="RegistrarIngresoDeContrato.aspx.cs" Inherits="MPreventivo_RegistrarIngresoDeContrato"
    Title="Registrar Ingreso de Contrato" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
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
        .style9
        {
            width: 100%;
        }
        .style10
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style9">
                <tr>
                    <td style="background: -webkit-linear-gradient(180deg, #FFFFFF, #E0ECF8); border-left-style: outset">
                        <asp:Label ID="Label4" runat="server" Text="Contrato Nº:"></asp:Label>
                        <asp:Label ID="lblNroContrato" runat="server" Font-Bold="True" Font-Italic="True"
                            Font-Size="Medium"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
            <table width="800px">
                <tr>
                    <td colspan="3" style="border-bottom-style: inset" height="25px">
                        <asp:Label ID="Label8" runat="server" Font-Italic="True" Font-Size="Medium" Text="Criterios de Búsqueda para Contratos"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style12">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td class="style12">
                        &nbsp;
                    </td>
                    <td width="150px">
                        <asp:RadioButton ID="rdbXNroContrato" runat="server" AutoPostBack="True" GroupName="1"
                            OnCheckedChanged="rdbXNroContrato_CheckedChanged" Text="Por Nro. de Contrato" />
                    </td>
                    <td style="text-align: left">
                        <asp:DropDownList ID="ddlNroContrato" runat="server" AutoPostBack="True" DataSourceID="sdsNroContrato"
                            DataTextField="IDCONTRATO" DataValueField="IDCONTRATO" OnSelectedIndexChanged="ddlNroContrato_SelectedIndexChanged"
                            Visible="False">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style12">
                        &nbsp;
                    </td>
                    <td>
                        <asp:RadioButton ID="rdbFecha" runat="server" Text="Por Fecha" AutoPostBack="True"
                            GroupName="1" OnCheckedChanged="rdbFecha_CheckedChanged" />
                    </td>
                    <td>
                        <asp:Panel ID="PanelFecha" runat="server" Visible="False">
                            <table width="640px" style="margin-top: 0px">
                                <tr>
                                    <td style="text-align: right">
                                        <asp:Label ID="Label6" runat="server" Text="Inicio:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFechaInicio" runat="server" AutoPostBack="True" OnTextChanged="txtFechaInicio_Changed" />
                                        <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/1410380987_Calendar_24x24.png"
                                            Style="vertical-align: middle; margin-bottom: 2px" />
                                        <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtFechaInicio"
                                            PopupButtonID="Image1" Format="dd/MM/yyyy">
                                        </asp:CalendarExtender>
                                    </td>
                                    <td style="text-align: right">
                                        <asp:Label ID="Label7" runat="server" Text="Fin:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFechaFin" runat="server" AutoPostBack="True" OnTextChanged="txtFechaFin_Changed" />
                                        <asp:Image ID="Image2" runat="server" ImageUrl="../Imagenes/1410380987_Calendar_24x24.png"
                                            Style="vertical-align: middle; margin-bottom: 2px" />
                                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtFechaFin"
                                            PopupButtonID="Image2" Format="dd/MM/yyyy">
                                        </asp:CalendarExtender>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="style12">
                        &nbsp;
                    </td>
                    <td>
                        <asp:RadioButton ID="rdbProveedor" runat="server" Text="Proveedor" AutoPostBack="True"
                            GroupName="1" OnCheckedChanged="rdbProveedor_CheckedChanged" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlProveedor" runat="server" DataSourceID="sdsProveedor" DataTextField="RAZONSOCIAL"
                            DataValueField="IDPROVEEDOR" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="ddlProveedor_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td class="style13">
                    </td>
                    <td class="style10">
                        <asp:GridView ID="gvContratos" runat="server" AutoGenerateColumns="False" HeaderStyle-CssClass="estiloHeaderTabla"
                            CellPadding="4" ForeColor="#333333" GridLines="None" Style="margin-top: 10px"
                            Width="450px">
                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:RadioButton ID="gvContratos_rdbSeleccionar" runat="server" OnCheckedChanged="gvContratos_rdbSeleccionar_CheckedChanged"
                                            onclick="RadioCheckOnly(this);" Width="30px" AutoPostBack="True" />
                                    </ItemTemplate>
                                    <ItemStyle CssClass="estiloFilasTabla" Width="20px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:BoundField DataField="IdContrato" HeaderText="Contrato" SortExpression="IdContrato"
                                    HeaderStyle-Width="55px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="55px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="RazonSocialProveedor" HeaderText="Proveedor" SortExpression="RazonSocialProveedor"
                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="FechaPedido" HeaderText="Fecha Pedido" SortExpression="FechaPedido"
                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="TipoContrato" HeaderText="Tipo Contrato" SortExpression="TipoContrato"
                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td class="style10">
                        <asp:Button ID="BtnDetalle" runat="server" OnClick="BtnDetalle_Click" Text="Ver Detalle"
                            Visible="False" />
                    </td>
                </tr>
            </table>
            <table width="800px" style="margin-top: 10px">
                <tr>
                    <td style="border-bottom-style: inset" height="25px">
                        <asp:Label ID="Label1" runat="server" Font-Italic="True" Text="Detalle del Contrato"
                            Font-Size="Medium"></asp:Label>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                    </td>
                    <td class="style10">
                        <asp:GridView ID="gvDetalleContratoINSUMO" runat="server" AutoGenerateColumns="False"
                            HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                            GridLines="None" Style="margin-top: 0px" Width="350px">
                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField DataField="NroDetalle" HeaderText="Item" SortExpression="NroDetalle"
                                    HeaderStyle-Width="55px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="55px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="NroInsumo" HeaderText="Insumo" SortExpression="NroInsumo"
                                    HeaderStyle-Width="45px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="45px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="DescripInsumo" HeaderText="Nombre" SortExpression="DescripInsumo"
                                    HeaderStyle-Width="55px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="55px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad"
                                    HeaderStyle-Width="55px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="55px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:TemplateField ShowHeader="False" HeaderText="Ingreso Total">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckTotalInsumo" OnCheckedChanged="CheckTotalInsumo_CheckedChanged"
                                            runat="server" Width="30px" ItemStyle-CssClass="estiloHeaderTabla" AutoPostBack="True" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" HeaderText="Cantidad Ingresada">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtCantidadIngresada" runat="server" Width="50px" ItemStyle-CssClass="estiloHeaderTabla" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="estiloHeaderTabla" />
                        </asp:GridView>
                        <asp:GridView ID="gvDetalleContratoMedidor" runat="server" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="#333333" GridLines="None" HeaderStyle-CssClass="estiloHeaderTabla"
                            Style="margin-top: 0px" Width="350px">
                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField DataField="NroDetalle" HeaderStyle-Width="55px" HeaderText="Item"
                                    ItemStyle-CssClass="estiloHeaderTabla" SortExpression="NroDetalle">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="55px" />
                                    <ItemStyle CssClass="estiloFilasTabla" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DescripHerramienta" HeaderStyle-Width="45px" HeaderText="Tipo de Medidor"
                                    ItemStyle-CssClass="estiloHeaderTabla" SortExpression="DescripHerramienta">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="45px" />
                                    <ItemStyle CssClass="estiloFilasTabla" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Cantidad" HeaderStyle-Width="55px" HeaderText="Cantidad"
                                    ItemStyle-CssClass="estiloHeaderTabla" SortExpression="Cantidad">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="55px" />
                                    <ItemStyle CssClass="estiloFilasTabla" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Ingreso Total" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckTotalMedidores" runat="server" AutoPostBack="True" ItemStyle-CssClass="estiloHeaderTabla"
                                            OnCheckedChanged="CheckTotalMedidores_CheckedChanged" Width="30px" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="50px" />
                                    <ItemStyle CssClass="estiloFilasTabla" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cantidad Ingresada" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtCantIngresadaMedidores" runat="server" ItemStyle-CssClass="estiloHeaderTabla"
                                            Width="50px" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="50px" />
                                    <ItemStyle CssClass="estiloFilasTabla" />
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="estiloHeaderTabla" />
                        </asp:GridView>
                        <asp:GridView ID="gvDatalleContratoHERRAMIENTAS" runat="server" AutoGenerateColumns="False"
                            HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                            GridLines="None" Style="margin-top: 0px" Width="350px">
                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField DataField="NroDetalle" HeaderText="Item" SortExpression="NroDetalle"
                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="NroHerramienta" HeaderText="Cod. Herramienta" SortExpression="NroHerramienta"
                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="DescripHerramienta" HeaderText="Herramienta" SortExpression="DescripHerramienta"
                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad"
                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:TemplateField ShowHeader="False" HeaderText="Cant. Total Ingresada">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckTotalHerramientas" OnCheckedChanged="CheckTotalHerramientas_CheckedChanged"
                                            runat="server" Width="30px" ItemStyle-CssClass="estiloHeaderTabla" AutoPostBack="True" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" HeaderText="Cantidad Ingresada">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtCantIngresadaHerram" runat="server" Width="50px" ItemStyle-CssClass="estiloHeaderTabla" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="estiloHeaderTabla" />
                        </asp:GridView>
                        <asp:Label ID="lblMensaje" runat="server" ForeColor="Red" EnableViewState="True"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="btnIngresar" runat="server" Text="Dar Ingreso" OnClick="btnIngresar_Click"
                            Visible="False" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
            <table width="800px" style="margin-top: 10px">
                <tr>
                    <td style="border-bottom-style: inset" height="25px">
                        <asp:Label ID="Label2" runat="server" Font-Italic="True" Text="Resumen Ingreso Materiales"
                            Font-Size="Medium"></asp:Label>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td colspan="4">
                        <asp:GridView ID="gvResumenInsumos" runat="server" AutoGenerateColumns="False" HeaderStyle-CssClass="estiloHeaderTabla"
                            CellPadding="4" ForeColor="#333333" GridLines="None" Style="margin-top: 0px"
                            Width="350px">
                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField DataField="NroDetalle" HeaderText="Item" SortExpression="NroDetalle"
                                    HeaderStyle-Width="45px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="45px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="NroInsumo" HeaderText="Código" SortExpression="NroInsumo"
                                    HeaderStyle-Width="45px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="45px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="DescripInsumo" HeaderText="Insumo" SortExpression="DescripInsumo"
                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad Pedida" SortExpression="Cantidad"
                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="CantidadIngresada" HeaderText="Cantidad Ingresada" SortExpression="CantidadIngresada"
                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="CantidadRestante" HeaderText="Cantidad Restante" SortExpression="CantidadRestante"
                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle CssClass="estiloHeaderTabla" />
                        </asp:GridView>
                        <asp:GridView ID="gvResumenMedidores" runat="server" AutoGenerateColumns="False"
                            HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                            GridLines="None" Style="margin-top: 0px" Width="350px">
                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField DataField="NroDetalle" HeaderText="Item" SortExpression="NroDetalle"
                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="NroHerramienta" HeaderText="Tipo de Medidor" SortExpression="NroHerramienta"
                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad Pedida" SortExpression="Cantidad"
                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="CantidadIngresada" HeaderText="Cantidad Ingresada" SortExpression="CantidadIngresada"
                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="CantidadRestante" HeaderText="Cantidad Restante" SortExpression="CantidadRestante"
                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle CssClass="estiloHeaderTabla" />
                        </asp:GridView>
                        <asp:GridView ID="gvResumenHerramientas" runat="server" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="#333333" GridLines="None" HeaderStyle-CssClass="estiloHeaderTabla"
                            Style="margin-top: 0px" Width="350px">
                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField DataField="NroDetalle" HeaderStyle-Width="65px" HeaderText="Item"
                                    ItemStyle-CssClass="estiloHeaderTabla" SortExpression="NroDetalle">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px" />
                                    <ItemStyle CssClass="estiloFilasTabla" />
                                </asp:BoundField>
                                <asp:BoundField DataField="NroHerramienta" HeaderStyle-Width="65px" HeaderText="Codigo"
                                    ItemStyle-CssClass="estiloHeaderTabla" SortExpression="NroHerramienta">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px" />
                                    <ItemStyle CssClass="estiloFilasTabla" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DescripHerramienta" HeaderStyle-Width="65px" HeaderText="Herramienta"
                                    ItemStyle-CssClass="estiloHeaderTabla" SortExpression="DescripHerramienta">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px" />
                                    <ItemStyle CssClass="estiloFilasTabla" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Cantidad" HeaderStyle-Width="65px" HeaderText="Cantidad Pedida"
                                    ItemStyle-CssClass="estiloHeaderTabla" SortExpression="Cantidad">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px" />
                                    <ItemStyle CssClass="estiloFilasTabla" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CantidadIngresada" HeaderStyle-Width="65px" HeaderText="Cantidad Ingresada"
                                    ItemStyle-CssClass="estiloHeaderTabla" SortExpression="CantidadIngresada">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px" />
                                    <ItemStyle CssClass="estiloFilasTabla" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CantidadRestante" HeaderStyle-Width="65px" HeaderText="Cantidad Restante"
                                    ItemStyle-CssClass="estiloHeaderTabla" SortExpression="CantidadRestante">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px" />
                                    <ItemStyle CssClass="estiloFilasTabla" />
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle CssClass="estiloHeaderTabla" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left" colspan="5">
                    &nbsp;</tr>
                <tr>
                    <td style="text-align: left" colspan="5">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click"
                                    Style="margin-left: 200px" ValidationGroup="1" Enabled="False" />
                                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                                <span style="display: none">
                                    <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
                                </span>
                                <asp:ModalPopupExtender ID="ModalPopupConfirmacion" PopupControlID="popUpConfirmacion"
                                    runat="server" TargetControlID="LinkButton1" BackgroundCssClass="reveal-modal-bg">
                                </asp:ModalPopupExtender>
                                <span style="display: none">
                                    <asp:LinkButton ID="LinkButton2" runat="server">LinkButton</asp:LinkButton>
                                </span>
                                <asp:ModalPopupExtender ID="ModalPopupCancelarRegistrar" PopupControlID="popUpCancelarRegistrar"
                                    runat="server" TargetControlID="LinkButton2" BackgroundCssClass="reveal-modal-bg">
                                </asp:ModalPopupExtender>
                                <span style="display: none">
                                    <asp:LinkButton ID="LinkButton3" runat="server">LinkButton</asp:LinkButton>
                                </span>
                                <asp:ModalPopupExtender ID="ModalPopupExito" PopupControlID="popUpExito" runat="server"
                                    TargetControlID="LinkButton3" BackgroundCssClass="reveal-modal-bg">
                                </asp:ModalPopupExtender>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td class="style12">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style12">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style12">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:SqlDataSource ID="sdsNroContrato" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
        SelectCommand="SELECT [IDCONTRATO] FROM [CONTRATO]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsProveedor" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
        SelectCommand="SELECT P.IDPROVEEDOR, E.RAZONSOCIAL
FROM PROVEEDOR P, EMPRESA E
WHERE P.CUIT = E.CUIT"></asp:SqlDataSource>

    <script type="text/javascript">
    
     function RadioCheckOnly(rbControl) {
     
      var gvName = rbControl.defaultValue.split('_')[0];
      var gvControl;
      
      switch (gvName)
      {
        case "gvContratos":
        gvControl =  "<%=gvContratos.ClientID%>";       
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

    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading">
            <asp:Label ID="Label9" runat="server" Text="¿Desea registrar el INGRESO del CONTRATO?"></asp:Label>
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
    <asp:Panel ID="popUpCancelarRegistrar" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image3" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="40px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label11" runat="server" Text="Se perderán los datos ingresados" Style="margin-right: 25px"></asp:Label>
            <br />
            <asp:Label ID="Label12" runat="server" Text="¿Desea Continuar?"></asp:Label>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa; width: 360px">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
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
            <asp:Image ID="Image4" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="40px" />
        </div>
        <div class="heading">
            <asp:Label ID="Label13" runat="server" Text="Se registro con éxito el INGRESO del CONTRATO"
                Style="margin-right: 15px"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarConfirmacion_Click" CssClass="botonPopUp" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
