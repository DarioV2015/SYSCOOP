<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="AvisosVarios.aspx.cs" Inherits="MPreventivo_AvisosVarios" Title="Avisos Varios" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
            width: 140px;
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
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panelVencimientoInsumos" runat="server" Visible="False">
                <table width="800px" style="margin-top: 5px">
                    <tr>
                        <td style="border-bottom-style: inset" height="25px">
                            &nbsp;
                            <asp:Label ID="Label15" runat="server" Font-Italic="True" Font-Size="Medium" Text="Listado de Vencimiento de Insumos"></asp:Label>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:GridView ID="grillaVencimientoInsumos" runat="server" AutoGenerateColumns="False"
                                HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                                GridLines="None" OnRowDataBound="grillaVencimientoInsumos_RowDataBound" Style="margin-top: 0px;
                                margin-left: 10px">
                                <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="nroInsumo" HeaderText="Nro. Insumo" ReadOnly="True" HeaderStyle-Width="60px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nombre" HeaderText="Insumo" ReadOnly="True" HeaderStyle-Width="250 px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="especificacion" HeaderText="Especificación" ReadOnly="True"
                                        HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="cantidad" HeaderText="Cantidad" ReadOnly="True" HeaderStyle-Width="60px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="unidadMedida" HeaderText="Unidad" ReadOnly="True" HeaderStyle-Width="60px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="idTipoInsumo" HeaderText="Tipo Insumo" ReadOnly="True"
                                        HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="tipoInsumo" HeaderText="Tipo Insumo" ReadOnly="True" HeaderStyle-Width="60px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fechaVencimiento" HeaderText="Vencimiento" ReadOnly="True"
                                        HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnGenerarPedidoInsumos" runat="server" Text="Generar Pedido" OnClick="btnGenerarPedidoInsumos_Click"
                                Style="margin-left: 50px; margin-top: 10px" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panelVencimientoHerramientas" runat="server" Visible="False">
                <table width="800px" style="margin-top: 12px">
                    <tr>
                        <td style="border-bottom-style: inset" height="25px">
                            &nbsp;
                            <asp:Label ID="Label17" runat="server" Font-Italic="True" Font-Size="Medium" Text="Listado de Vencimiento de Herramientas"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:GridView ID="grillaVencimientoHerramientas" runat="server" AutoGenerateColumns="False"
                                HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                                GridLines="None" OnRowDataBound="grillaVencimientoHerramientas_RowDataBound"
                                Style="margin-top: 0px; margin-left: 10px" Width="240px">
                                <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="nroHerramienta" HeaderText="Nro. Herramienta" ReadOnly="True"
                                        HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="descripcion" HeaderText="Herramienta" ReadOnly="True"
                                        HeaderStyle-Width="250 px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fechaIngreso" HeaderText="Fecha Ingreso" ReadOnly="True"
                                        HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fechaVencimiento" HeaderText="Vencimiento" ReadOnly="True"
                                        HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fechaBaja" HeaderText="Fecha Baja" ReadOnly="True" HeaderStyle-Width="60px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nroLote" HeaderText="Nro. Lote" ReadOnly="True" HeaderStyle-Width="60px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nroTipoHerramienta" HeaderText="nroTipoHerramienta" ReadOnly="True"
                                        HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="descripcionTipo" HeaderText="descripcionTipo" ReadOnly="True"
                                        HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="especificacionTecnica" HeaderText="especificacionTecnica"
                                        ReadOnly="True" HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="idEstado" HeaderText="idEstado" ReadOnly="True" HeaderStyle-Width="60px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnGenerarPedidoHerramientas" runat="server" Text="Generar Pedido"
                                OnClick="btnGenerarPedidoHerramientas_Click" Style="margin-top: 10px; margin-left: 50px" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panelFaltaStock" runat="server" Visible="False">
                <table width="800px" style="margin-top: 15px">
                    <tr>
                        <td style="border-bottom-style: inset" height="25px">
                            &nbsp;
                            <asp:Label ID="Label18" runat="server" Font-Italic="True" Font-Size="Medium" Text="Listado de Insumos con Stock Insuficiente"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:GridView ID="grillaInsumosSinStock" runat="server" AutoGenerateColumns="False"
                                HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                                GridLines="None" OnRowDataBound="grillaInsumosSinStock_RowDataBound" Style="margin-top: 0px;
                                margin-left: 10px">
                                <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="nroInsumo" HeaderText="Nro. Insumo" ReadOnly="True" HeaderStyle-Width="60px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nombre" HeaderText="Insumo" ReadOnly="True" HeaderStyle-Width="250 px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="especificacion" HeaderText="Especificación" ReadOnly="True"
                                        HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="cantidad" HeaderText="Cantidad" ReadOnly="True" HeaderStyle-Width="60px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="unidadMedida" HeaderText="Unidad" ReadOnly="True" HeaderStyle-Width="60px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="idTipoInsumo" HeaderText="Tipo Insumo" ReadOnly="True"
                                        HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="tipoInsumo" HeaderText="Tipo Insumo" ReadOnly="True" HeaderStyle-Width="60px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fechaVencimiento" HeaderText="Vencimiento" ReadOnly="True"
                                        HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </td>
                        <tr>
                            <td>
                                <asp:Button ID="btnGenerarPedidoInsumosStock" runat="server" Text="Generar Pedido"
                                    OnClick="btnGenerarPedidoInsumosStock_Click" Style="margin-top: 10px; margin-left: 50px" />
                                <br />
                            </td>
                        </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <span style="display: none">
        <asp:LinkButton ID="lnkbtn_DummyLnkBtn" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupInsumos" PopupControlID="panelInsumos" runat="server"
        TargetControlID="lnkbtn_DummyLnkBtn" BackgroundCssClass="reveal-modal-bg">
    </asp:ModalPopupExtender>
    <asp:Panel ID="panelInsumos" runat="server" CssClass="divFondo">
        <div class="heading" style="width: 460px">
            <table style="margin-top: 0px; margin-left: 160px">
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Pedido de Insumos" Font-Size="15px" Style="color: rgb(105, 98, 98)"></asp:Label>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <div class="content" style="height: 170px; border-top: 0.1px solid #bababa; width: 460px">
            <div>
                <table style="margin-top: 0px; margin-left: 15px">
                    <tr>
                        <td colspan="2">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="grillaInsumos" runat="server" AutoGenerateColumns="False" DataKeyNames="IDINSUMO"
                                        DataSourceID="sdsInsumos" OnRowCommand="grillaInsumos_RowCommand" OnRowDataBound="grillaInsumos_RowDataBound"
                                        HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                                        GridLines="None" Style="margin-left: 26px">
                                        <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                        <Columns>
                                            <asp:BoundField DataField="Column1" HeaderText="Nro. Insumo" ReadOnly="True" SortExpression="IDINSUMO"
                                                HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="idinsumo" HeaderText="Insumo" ReadOnly="True" SortExpression="NOMBRE"
                                                HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="nombre" HeaderText="Insumo" ReadOnly="True" SortExpression="UNIDADMEDIDA"
                                                HeaderStyle-Width="150px" ItemStyle-CssClass="estiloHeaderTabla">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="120px"></HeaderStyle>
                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Cantidad" ItemStyle-Width="100px">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtCantidad" runat="server" Width="90px"> </asp:TextBox>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="unidadmedida" HeaderText="Unidad de Medida" ReadOnly="True"
                                                SortExpression="UNIDADMEDIDA" HeaderStyle-Width="150px" ItemStyle-CssClass="estiloHeaderTabla">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="150px"></HeaderStyle>
                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Column2" HeaderText="Vencimiento" ReadOnly="True" SortExpression="ESPECIFICACION"
                                                HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:TemplateField ShowHeader="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="40px"
                                                ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton4" CommandArgument='<%# Eval("idinsumo") %>' CommandName="OcultarFila"
                                                        runat="server" ImageUrl="../Imagenes/deleteAzul.png" Width="20px" Height="20px"
                                                        Style="vertical-align: middle; margin-bottom: 3px;" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle CssClass="estiloHeaderTabla" />
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:SqlDataSource ID="sdsInsumos" runat="server" ConnectionString="<%$ ConnectionStrings:SISEConnectionString %>"
                                SelectCommand="select datediff(month, CURRENT_TIMESTAMP, si.fechavencimiento), i.idinsumo, i.nombre, i.unidadmedida,
convert(char(10), si.fechavencimiento, 103)
from insumo i, stockinsumo si
where i.idinsumo = si.idinsumo
and si.cantidad &gt; 0
and datediff(month, CURRENT_TIMESTAMP, si.fechavencimiento) &lt;= 2
and i.idinsumo not in
(select i.idinsumo
from stockinsumo si, insumo i, detallepedidoinsumo dpi, pedidoinsumo pi
where si.idinsumo = i.idinsumo
and i.idinsumo = dpi.idinsumo
and pi.idestadopedidoinsumo in (1,2))"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px">
                            <asp:Button ID="btnAceptarPedidoInsumos" runat="server" Text="Aceptar" OnClick="btnAceptarPedidoInsumos_Click"
                                Style="margin-left: 60px; margin-top: 20px" />
                        </td>
                        <td>
                            <asp:Button ID="btnCancelarPedidoInsumos" runat="server" Text="Cancelar" OnClick="btnCancelarPedidoInsumos_Click"
                                Style="margin-top: 20px" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton8" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupHerramientas" PopupControlID="panelHerramientas"
        runat="server" TargetControlID="LinkButton8">
    </asp:ModalPopupExtender>
    <asp:Panel ID="panelHerramientas" runat="server" CssClass="divFondo" Width="400px">
        <div class="heading" style="width: 400px">
            <table style="margin-top: 0px; margin-left: 130px">
                <tr>
                    <td>
                        <asp:Label ID="Label10" runat="server" Text="Pedido de Herramientas"></asp:Label>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <div class="content" style="height: 230px; border-top: 0.1px solid #bababa; width: 400px">
            <div>
                <table style="margin-top: 0px; margin-left: 15px">
                    <tr>
                        <td colspan="2">
                            <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="grillaVencimientoHerramientas2" runat="server" AutoGenerateColumns="False"
                                        DataKeyNames="IDHERRAMIENTA" OnRowCommand="grillaVencimientoHerramientas2_RowCommand"
                                        DataSourceID="sdsHerramientas" OnRowDataBound="grillaVencimientoHerramientas2_RowDataBound"
                                        HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                                        GridLines="None" Style="margin-left: 20px">
                                        <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                        <Columns>
                                            <asp:BoundField DataField="Column1" HeaderText="Meses" ReadOnly="True" SortExpression="IDHERRAMIENTA"
                                                HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="idherramienta" HeaderText="Nro. Herramienta" ReadOnly="True"
                                                SortExpression="IDHERRAMIENTA" HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="descripcion" HeaderText="Herramienta" ReadOnly="True"
                                                SortExpression="DESCRIPCION" HeaderStyle-Width="150px" ItemStyle-CssClass="estiloHeaderTabla">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="150px"></HeaderStyle>
                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Column2" HeaderText="Vencimiento" ReadOnly="True" SortExpression="UNIDADMEDIDA"
                                                HeaderStyle-Width="150px" ItemStyle-CssClass="estiloHeaderTabla">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="150px"></HeaderStyle>
                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Cantidad" ItemStyle-Width="100px">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtCantidadHerramienta" runat="server" Width="90px"> </asp:TextBox>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                            </asp:TemplateField>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton5" runat="server" CommandArgument='<%# Eval("idherramienta") %>'
                                                        CommandName="OcultarFila" ImageUrl="../Imagenes/deleteAzul.png" Width="20px"
                                                        Height="20px" Style="vertical-align: middle; margin-bottom: 3px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle CssClass="estiloHeaderTabla" />
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:SqlDataSource ID="sdsHerramientas" runat="server" ConnectionString="<%$ ConnectionStrings:SISEConnectionString %>"
                                SelectCommand="select datediff(month, CURRENT_TIMESTAMP, h.fechavencimiento), h.idherramienta, h.descripcion,
convert(char(10),h.fechavencimiento, 103)
from herramienta h
where datediff(month, CURRENT_TIMESTAMP, h.fechavencimiento) &lt;= 2
and h.idherramienta not in
(select h.idherramienta
from herramienta h, detallepedidoherramienta dph, pedidoherramienta ph
where h.idherramienta = dph.idherramienta
and ph.idestadopedidoherramienta in (1,2))"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px">
                            <asp:Button ID="btnAceptarPedidoHerramientas" runat="server" Text="Aceptar" OnClick="btnAceptarPedidoHerramientas_Click"
                                Style="margin-left: 50px; margin-top: 20px" />
                        </td>
                        <td>
                            <asp:Button ID="btnCancelarPedidoHerramientas" runat="server" Text="Cancelar" OnClick="btnCancelarPedidoHerramientas_Click"
                                Style="margin-top: 20px" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>
    <asp:UpdatePanel ID="UpdatePanel16" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panelSinMedidores" runat="server" Visible="False">
                <table width="800px" style="margin-top: 5px">
                    <tr>
                        <td style="border-bottom-style: inset" height="25px">
                            &nbsp;
                            <asp:Label ID="Label19" runat="server" Font-Italic="True" Font-Size="Medium" Text="Stock de Medidores"></asp:Label>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:GridView ID="grillaSinMedidores" runat="server" AutoGenerateColumns="False"
                                HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                                GridLines="None" Style="margin-top: 0px; margin-left: 10px">
                                <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="nromedidor" HeaderText="Nro. Medidor" ReadOnly="True"
                                        HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nrolote" HeaderText="Nro. Lote" ReadOnly="True" HeaderStyle-Width="250 px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nrofabricacion" HeaderText="Nro. Fabricación" ReadOnly="True"
                                        HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="tipomedidor" HeaderText="Tipo Medidor" ReadOnly="True"
                                        HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnGenerarPedidoMedidores" runat="server" Text="Generar Pedido" OnClick="btnGenerarPedidoMedidores_Click"
                                Style="margin-left: 50px; margin-top: 10px" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <!--Insumos vencidos--->
    <span style="display: none">
        <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupRegistrarInsumos" PopupControlID="popUpConfirmacionInsumos"
        runat="server" TargetControlID="LinkButton1">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpConfirmacionInsumos" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading">
            <asp:Label ID="Label1" runat="server" Text="¿Desea confirmar el Pedido de Insumos por Vencimiento?"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarRegistrarInsumos" runat="server" Text="Aceptar" OnClick="btnAceptarRegistrarInsumos_Click"
                            CssClass="botonPopUp" />
                        <asp:Button ID="btnCancelarRegistrarInsumos" runat="server" Text="Cancelar" OnClick="btnCancelarRegistrarInsumos_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton2" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupCancelarRegistrarInsumos" PopupControlID="popUpCancelarRegistrarInsumos"
        runat="server" TargetControlID="LinkButton2">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpCancelarRegistrarInsumos" runat="server" Style="display: none"
        CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image2" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="35px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label5" runat="server" Text="Se cancelará el Pedido de Insumos" Style="margin-right: 25px"></asp:Label>
            <br />
            <asp:Label ID="Label16" runat="server" Text="¿Desea Continuar?"></asp:Label>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarCancelacionInsumos" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarCancelacionInsumos_Click" Style="margin-top: 50px" />
                        <asp:Button ID="btnCancelarCancelacionInsumos" runat="server" Text="Cancelar" CausesValidation="False"
                            OnClick="btnCancelarCancelacionInsumos_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton3" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupExitoInsumos" PopupControlID="popUpExitoInsumos"
        runat="server" TargetControlID="LinkButton3">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpExitoInsumos" runat="server" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="40px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label6" runat="server" Text="Se generó con éxito el Pedido de Insumos"
                Style="margin-right: 26px"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarConfirmacionInsumos" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarConfirmacionInsumos_Click" Style="margin-top: 50px" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton4" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupInsSinStock" PopupControlID="panelInsumosSinStock"
        runat="server" TargetControlID="LinkButton4">
    </asp:ModalPopupExtender>
    <asp:Panel ID="panelInsumosSinStock" runat="server" CssClass="divFondo" Width="400px">
        <div class="heading" style="width: 400px">
            <table style="margin-top: 0px; margin-left: 120px">
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Pedido de Insumos Faltantes"></asp:Label>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <div class="content" style="height: 230px; border-top: 0.1px solid #bababa; width: 400px">
            <div>
                <table style="margin-top: 0px; margin-left: 15px">
                    <tr>
                        <td colspan="2">
                            <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="grillaInsumosSinStock2" runat="server" AutoGenerateColumns="False"
                                        DataKeyNames="IDINSUMO" DataSourceID="sdsInsumosF" OnRowCommand="grillaInsumosSinStock2_RowCommand"
                                        OnRowDataBound="grillaInsumosSinStock2_RowDataBound" HeaderStyle-CssClass="estiloHeaderTabla"
                                        CellPadding="4" ForeColor="#333333" GridLines="None" Style="margin-left: 10px">
                                        <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                        <Columns>
                                            <asp:BoundField DataField="idinsumo" HeaderText="Nro. Insumo" ReadOnly="True" SortExpression="IDINSUMO"
                                                HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="nombre" HeaderText="Insumo" ReadOnly="True" SortExpression="NOMBRE"
                                                HeaderStyle-Width="150px" ItemStyle-CssClass="estiloHeaderTabla">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="150px"></HeaderStyle>
                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Cantidad" ItemStyle-Width="100px">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtCantidadFaltante" runat="server" Width="90px"> </asp:TextBox>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="unidadmedida" HeaderText="Unidad de Medida" ReadOnly="True"
                                                SortExpression="UNIDADMEDIDA" HeaderStyle-Width="150px" ItemStyle-CssClass="estiloHeaderTabla">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="150px"></HeaderStyle>
                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton6" runat="server" CommandArgument='<%# Eval("idinsumo") %>'
                                                        CommandName="OcultarFila" ImageUrl="../Imagenes/deleteAzul.png" Width="20px"
                                                        Height="20px" Style="vertical-align: middle; margin-bottom: 3px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle CssClass="estiloHeaderTabla" />
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:SqlDataSource ID="sdsInsumosF" runat="server" ConnectionString="<%$ ConnectionStrings:SISEConnectionString %>"
                                SelectCommand="select i.idinsumo, i.nombre, si.cantidad, i.unidadmedida
from insumo i, stockinsumo si
where i.idinsumo = si.idinsumo
and si.cantidad &lt;= 100
and i.idtipoinsumo = 1
and i.idinsumo not in
(select i.idinsumo
from stockinsumo si, insumo i, detallepedidoinsumo dpi, pedidoinsumo pi
where si.idinsumo = i.idinsumo
and i.idinsumo = dpi.idinsumo
and pi.idestadopedidoinsumo in (1,2))
union
select i.idinsumo, i.nombre, si.cantidad,i.unidadmedida
from insumo i, stockinsumo si
where i.idinsumo = si.idinsumo
and si.cantidad &lt;= 1
and i.idtipoinsumo = 2
and i.idinsumo not in
(select i.idinsumo
from stockinsumo si, insumo i, detallepedidoinsumo dpi, pedidoinsumo pi
where si.idinsumo = i.idinsumo
and i.idinsumo = dpi.idinsumo
and pi.idestadopedidoinsumo in (1,2))"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px">
                            <asp:Button ID="btnAceptarPedidoInsumosF" runat="server" Text="Aceptar" OnClick="btnAceptarPedidoInsumosF_Click"
                                Style="margin-left: 40px; margin-top: 20px" />
                        </td>
                        <td>
                            <asp:Button ID="btnCancelarPedidoInsumosF" runat="server" Text="Cancelar" OnClick="btnCancelarPedidoInsumosF_Click"
                                Style="margin-top: 20px" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>
    <!--Herramientas vencidas--->
    <span style="display: none">
        <asp:LinkButton ID="LinkButton9" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupRegistrarHerramientas" PopupControlID="popUpConfirmacionHerramientas"
        runat="server" TargetControlID="LinkButton9">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpConfirmacionHerramientas" runat="server" Style="display: none"
        CssClass="divFondo">
        <div class="heading">
            <asp:Label ID="Label11" runat="server" Text="¿Desea confirmar el Pedido de Herramientas por Vencimiento?"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarRegistrarHerramientas" runat="server" Text="Aceptar" OnClick="btnAceptarRegistrarHerramientas_Click"
                            CssClass="botonPopUp" />
                        <asp:Button ID="btnCancelarRegistrarHerramientas" runat="server" Text="Cancelar"
                            OnClick="btnCancelarRegistrarHerramientas_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton10" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupCancelarRegistrarHerramientas" PopupControlID="popUpCancelarRegistrarHerramientas"
        runat="server" TargetControlID="LinkButton10">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpCancelarRegistrarHerramientas" runat="server" Style="display: none"
        CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image5" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="35px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label12" runat="server" Text="Se cancelará el Pedido de Herramientas"
                Style="margin-right: 25px"></asp:Label>
            <br />
            <asp:Label ID="Label13" runat="server" Text="¿Desea Continuar?"></asp:Label>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarCancelacionHerramientas" runat="server" Text="Aceptar"
                            CausesValidation="False" OnClick="btnAceptarCancelacionHerramientas_Click" Style="margin-top: 50px" />
                        <asp:Button ID="btnCancelarCancelacionHerramientas" runat="server" Text="Cancelar"
                            CausesValidation="False" OnClick="btnCancelarCancelacionHerramientas_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton11" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupExitoHerramientas" PopupControlID="popUpExitoHerramientas"
        runat="server" TargetControlID="LinkButton11">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpExitoHerramientas" runat="server" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image6" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="40px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label14" runat="server" Text="Se generó con éxito el Pedido de Herramientas"
                Style="margin-right: 26px"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarConfirmacionHerramientas" runat="server" Text="Aceptar"
                            CausesValidation="False" OnClick="btnAceptarConfirmacionHerramientas_Click" Style="margin-top: 50px" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <!--Insumos Sin Stock--->
    <span style="display: none">
        <asp:LinkButton ID="LinkButton5" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupRegistrarInsumosF" PopupControlID="popUpConfirmacionInsumosF"
        runat="server" TargetControlID="LinkButton5">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpConfirmacionInsumosF" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading">
            <asp:Label ID="Label4" runat="server" Text="¿Desea confirmar el Pedido de Insumos por Faltante?"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarRegistrarInsumosF" runat="server" Text="Aceptar" OnClick="btnAceptarRegistrarInsumosF_Click"
                            CssClass="botonPopUp" />
                        <asp:Button ID="btnCancelarRegistrarInsumosF" runat="server" Text="Cancelar" OnClick="btnCancelarRegistrarInsumosF_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton6" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupCancelarRegistrarInsumosF" PopupControlID="popUpCancelarRegistrarInsumosF"
        runat="server" TargetControlID="LinkButton6">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpCancelarRegistrarInsumosF" runat="server" Style="display: none"
        CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image3" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="35px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label7" runat="server" Text="Se cancelará el Pedido de Insumos" Style="margin-right: 25px"></asp:Label>
            <br />
            <asp:Label ID="Label8" runat="server" Text="¿Desea Continuar?"></asp:Label>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarCancelacionInsumosF" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarCancelacionInsumosF_Click" Style="margin-top: 50px" />
                        <asp:Button ID="btnCancelarCancelacionInsumosF" runat="server" Text="Cancelar" CausesValidation="False"
                            OnClick="btnCancelarCancelacionInsumosF_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton7" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupExitoInsumosF" PopupControlID="popUpExitoInsumosF"
        runat="server" TargetControlID="LinkButton7">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpExitoInsumosF" runat="server" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image4" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="40px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label9" runat="server" Text="Se generó con éxito el Pedido de Insumos Faltantes"
                Style="margin-right: 26px"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarConfirmacionInsumosF" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarConfirmacionInsumosF_Click" Style="margin-top: 50px" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton12" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupMedidores" PopupControlID="panelMedidores"
        runat="server" TargetControlID="LinkButton12" BackgroundCssClass="reveal-modal-bg">
    </asp:ModalPopupExtender>
    <asp:Panel ID="panelMedidores" runat="server" CssClass="divFondo">
        <div class="heading" style="width: 400px">
            <table style="margin-top: 0px; margin-left: 160px">
                <tr>
                    <td>
                        <asp:Label ID="Label20" runat="server" Text="Pedido de Medidores" Font-Size="15px"
                            Style="color: rgb(105, 98, 98)"></asp:Label>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <div class="content" style="height: 170px; border-top: 0.1px solid #bababa; width: 400px; height: 200px">
            <div>
                <table style="margin-top: 0px; margin-left: 15px">
                    <tr>
                        <td colspan="2">
                            <asp:UpdatePanel ID="UpdatePanel17" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="grillaMedidores" runat="server" AutoGenerateColumns="False" DataKeyNames="idtipomedidor"
                                        DataSourceID="sdsMedidores" OnRowCommand="grillaMedidores_RowCommand" OnRowDataBound="grillaMedidores_RowDataBound"
                                        HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                                        GridLines="None" Style="margin-left: 26px">
                                        <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                        <Columns>
                                            <asp:BoundField DataField="idtipomedidor" HeaderText="Id Tipo Medidor" SortExpression="idtipomedidor"
                                                HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="descripcion" HeaderText="Tipo Medidor" SortExpression="descripcion"
                                                HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Cantidad" ItemStyle-Width="100px">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtCantidadMedidor" runat="server" Width="90px"> </asp:TextBox>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                            </asp:TemplateField>
                                            <asp:TemplateField ShowHeader="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="40px"
                                                ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton4" CommandArgument='<%# Eval("idtipomedidor") %>'
                                                        CommandName="OcultarFila" runat="server" ImageUrl="../Imagenes/deleteAzul.png"
                                                        Width="20px" Height="20px" Style="vertical-align: middle; margin-bottom: 3px;" />
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" Width="40px" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle CssClass="estiloHeaderTabla" />
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:SqlDataSource ID="sdsMedidores" runat="server" ConnectionString="<%$ ConnectionStrings:SISEConnectionString %>"
                                SelectCommand="select distinct m.idtipomedidor, tm.descripcion
from medidor m, tipomedidor tm
where m.idtipomedidor = tm.idtipomedidor"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px">
                            <asp:Button ID="btnAceptarPedidoMedidores" runat="server" Text="Aceptar" OnClick="btnAceptarPedidoMedidores_Click"
                                Style="margin-left: 60px; margin-top: 20px" />
                        </td>
                        <td>
                            <asp:Button ID="btnCancelarPedidoMedidores" runat="server" Text="Cancelar" OnClick="btnCancelarPedidoMedidores_Click"
                                Style="margin-top: 20px" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>
    <!--Medidores faltantes--->
    <span style="display: none">
        <asp:LinkButton ID="LinkButton13" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupRegistrarMedidores" PopupControlID="popUpConfirmacionMedidores"
        runat="server" TargetControlID="LinkButton13">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpConfirmacionMedidores" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading">
            <asp:Label ID="Label21" runat="server" Text="¿Desea confirmar el Pedido de Medidores por Faltante?"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel18" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarRegistrarMedidores" runat="server" Text="Aceptar" OnClick="btnAceptarRegistrarMedidores_Click"
                            CssClass="botonPopUp" />
                        <asp:Button ID="btnCancelarRegistrarMedidores" runat="server" Text="Cancelar" OnClick="btnCancelarRegistrarMedidores_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton14" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupCancelarRegistrarMedidores" PopupControlID="popUpCancelarRegistrarMedidores"
        runat="server" TargetControlID="LinkButton14">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpCancelarRegistrarMedidores" runat="server" Style="display: none"
        CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image7" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="35px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label22" runat="server" Text="Se cancelará el Pedido de Medidores"
                Style="margin-right: 25px"></asp:Label>
            <br />
            <asp:Label ID="Label23" runat="server" Text="¿Desea Continuar?"></asp:Label>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel19" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarCancelacionMedidores" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarCancelacionMedidores_Click" Style="margin-top: 50px" />
                        <asp:Button ID="btnCancelarCancelacionMedidores" runat="server" Text="Cancelar" CausesValidation="False"
                            OnClick="btnCancelarCancelacionMedidores_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton15" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupExitoMedidores" PopupControlID="popUpExitoMedidores"
        runat="server" TargetControlID="LinkButton15">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpExitoMedidores" runat="server" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image8" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="40px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label24" runat="server" Text="Se generó con éxito el Pedido de Medidores"
                Style="margin-right: 26px"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel20" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarConfirmacionMedidores" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarConfirmacionMedidores_Click" Style="margin-top: 50px" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
