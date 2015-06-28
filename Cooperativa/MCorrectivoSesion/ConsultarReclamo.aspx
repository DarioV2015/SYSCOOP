<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="ConsultarReclamo.aspx.cs" Inherits="MCorrectivoSesion_ConsultarReclamo"
    Title="Consultar Reclamo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script runat="server">


</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .datos
        {
            text-align: right;
            width: 100px;
        }
        .margen
        {
            margin-left: 10px;
        }
        .margenTabla
        {
            margin-right: 490px;
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
            font-family: 'trebuchet MS' , 'Lucida sans' , Arial;
            font-size: 12px;
            background-color: #b9c9fe;
            font-weight: bold;
            background: #b9c9fe;
            border-top: 2px solid #aabcfe;
            border-bottom: 1px solid #fff;
            color: #039;
            padding: 8px;
            border-right-style: none;
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
            border-right-style: none;
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
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panelBusqueda" runat="server">
                <table width="800px" style="margin-top: 5px">
                    <tr>
                        <td style="border-bottom-style: inset" height="25px">
                            &nbsp;
                            <asp:Label ID="Label15" runat="server" Font-Italic="True" Font-Size="Medium" Text="Buscar Reclamos Pendientes o Asignados a OTC"></asp:Label>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:RadioButton ID="rdb24Horas" runat="server" Text="Últimas 24 horas" AutoPostBack="True"
                                OnCheckedChanged="rdb24Horas_CheckedChanged" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButton ID="rdbOtr" runat="server" Text="Nro. Reclamo" AutoPostBack="True"
                                OnCheckedChanged="rdbOtr_CheckedChanged" />
                        </td>
                        <td>
                            <asp:Label ID="lblNroReclamo" runat="server" Text="Nro. Reclamo:" Visible="False"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNroReclamo" runat="server" Visible="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                    <td></td>
                    </tr>
                      <tr>
                    <td></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click1" />
                        </td>
                        <td>
                            <asp:Button ID="btnVolver" runat="server" Text="Volver" OnClick="btnVolver_Click1" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panelReclamos" runat="server" Visible="false">
                <table width="800px" style="margin-top: 5px">
                    <tr>
                        <td style="border-bottom-style: inset" height="25px">
                            &nbsp;
                            <asp:Label ID="Label2" runat="server" Font-Italic="True" Font-Size="Medium" Text="Detalle del Reclamo"></asp:Label>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <table style="margin-top: 0px">
                    <tr>
                        <td>
                            <asp:GridView runat="server" AutoGenerateColumns="False" ID="gvMaestro" DataSourceID="sdsReclamos"
                                HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                                GridLines="None" Width="920px" OnRowDataBound="gvMaestro_RowDataBound">
                                <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="IDRECLAMO" HeaderText="Nro" SortExpression="DESCRIPCION"
                                        HeaderStyle-Width="50px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DESCRIPCION" HeaderText="Reclamo" SortExpression="DESCRIPCION"
                                        HeaderStyle-Width="120px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="120px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FECHA" HeaderText="Fecha" SortExpression="Fecha" HeaderStyle-Width="65px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="HORA" HeaderText="Hora" SortExpression="Hora" HeaderStyle-Width="50px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IDTIPODOCUMENTO" HeaderText="Tipo Doc" SortExpression="IDTIPODOCUMENTO"
                                        HeaderStyle-Width="70px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NRODOCUMENTO" HeaderText="Nro Doc" SortExpression="NRODOCUMENTO"
                                        HeaderStyle-Width="80px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="80px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IDSOCIO" HeaderText="Socio" HeaderStyle-Width="50px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="APELLIDO" HeaderText="Apellido" SortExpression="APELLIDO"
                                        HeaderStyle-Width="70px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" SortExpression="NOMBRE" HeaderStyle-Width="70px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ESTADO" HeaderText="Estado" SortExpression="ESTADO" HeaderStyle-Width="70px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TIPO" HeaderText="Tipo Reclamo" SortExpression="TIEMPO"
                                        HeaderStyle-Width="170px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="170px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TIEMPORESOLUCION" HeaderText="Tiempo" SortExpression="TIEMPORESOLUCION"
                                        HeaderStyle-Width="100px" ItemStyle-CssClass="estiloHeaderTabla" Visible="False">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="100px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PRI" HeaderText="Prioridad" SortExpression="PRI" HeaderStyle-Width="70px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PRIORIDAD" HeaderText="Pri" SortExpression="PRIORIDAD"
                                        HeaderStyle-Width="70px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IDORDENTRABAJOCORRECTIVO" HeaderText="OTC" SortExpression="IDORDENTRABAJOCORRECTIVO"
                                        HeaderStyle-Width="50px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="HORAINICIO" HeaderText="hora otc" SortExpression="HORAINICIO"
                                        HeaderStyle-Width="50px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TIEMP" HeaderText="tiempo" SortExpression="TIEMP" HeaderStyle-Width="50px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle CssClass="estiloHeaderTabla" />
                            </asp:GridView>
                        </td>
                        <td>
                            <asp:SqlDataSource ID="sdsReclamos" runat="server" ConnectionString="<%$ ConnectionStrings:SISEConnectionString %>"
                                SelectCommand="select r.idreclamo, r.descripcion, convert(char(10), r.fecha, 103) as fecha,convert(nvarchar(5), r.hora, 108) as hora, r.idtipodocumento, r.nrodocumento,r.idsocio, t.descripcion as tipo,p.nombre, p.apellido,eotc.descripcion as estado, pr.descripcion as pri, r.idordentrabajocorrectivo, otc.horainicio,t.tiemporesolucion as tiemp,
(select sum(tiemporesolucion)
from reclamo rc, tiporeclamo tr
where rc.idtiporeclamo = tr.idtiporeclamo
and tr.prioridad &gt; t.prioridad) tiempoResolucion, t.prioridad
from reclamo r, tiporeclamo t, persona p, socio s, estadoreclamo er, prioridad pr, estadootc eotc,
ordentrabajocorrectivo otc
where r.idestadoreclamo = er.idestadoreclamo and
otc.idestadoot = eotc.idestadootc and
r.idordentrabajocorrectivo = otc.idordentrabajo and
r.prioridad = pr.idprioridad and
r.idestadoreclamo in (1,4) and
((r.idtipodocumento is not null and r.nrodocumento is not null and p.tipodocumento = r.idtipodocumento and p.nrodocumento = r.nrodocumento) or
(r.idsocio is not null and s.idsocio = r.idsocio and s.idtipodocumento = p.tipodocumento and s.nrodocumento = p.nrodocumento)
) and
t.idtiporeclamo = r.idtiporeclamo and
((@hoy = 'S' and r.fecha &gt; getdate() - 1) or (@hoy = 'N' and @reclamo is not null and @reclamo = r.idreclamo))
">
                                <SelectParameters>
                                    <asp:Parameter Name="hoy" />
                                    <asp:Parameter Name="reclamo" ConvertEmptyStringToNull="true" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            
            
            
            <asp:Panel ID="panelReclamoSocio" runat="server" Visible="false">
                <table width="800px" style="margin-top: 5px">
                    <tr>
                        <td style="border-bottom-style: inset" height="25px">
                            &nbsp;
                            <asp:Label ID="Label7" runat="server" Font-Italic="True" Font-Size="Medium" Text="Detalle del Reclamo"></asp:Label>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <table style="margin-top: 0px">
                    <tr>
                        <td>
                            <asp:GridView runat="server" AutoGenerateColumns="False" ID="grillaReclamoSocio" DataSourceID="sdsReclamos1"
                                HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                                GridLines="None" Width="920px" OnRowDataBound="gvMaestro_RowDataBound">
                                <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="IDRECLAMO" HeaderText="Nro" SortExpression="DESCRIPCION"
                                        HeaderStyle-Width="50px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DESCRIPCION" HeaderText="Reclamo" SortExpression="DESCRIPCION"
                                        HeaderStyle-Width="120px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="120px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FECHA" HeaderText="Fecha" SortExpression="Fecha" HeaderStyle-Width="65px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="HORA" HeaderText="Hora" SortExpression="Hora" HeaderStyle-Width="50px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IDTIPODOCUMENTO" HeaderText="Tipo Doc" SortExpression="IDTIPODOCUMENTO"
                                        HeaderStyle-Width="70px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NRODOCUMENTO" HeaderText="Nro Doc" SortExpression="NRODOCUMENTO"
                                        HeaderStyle-Width="80px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="80px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IDSOCIO" HeaderText="Socio" HeaderStyle-Width="50px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="APELLIDO" HeaderText="Apellido" SortExpression="APELLIDO"
                                        HeaderStyle-Width="70px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" SortExpression="NOMBRE" HeaderStyle-Width="70px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ESTADO" HeaderText="Estado" SortExpression="ESTADO" HeaderStyle-Width="70px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TIPO" HeaderText="Tipo Reclamo" SortExpression="TIEMPO"
                                        HeaderStyle-Width="170px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="170px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TIEMPORESOLUCION" HeaderText="Tiempo" SortExpression="TIEMPORESOLUCION"
                                        HeaderStyle-Width="100px" ItemStyle-CssClass="estiloHeaderTabla" Visible="False">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="100px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PRI" HeaderText="Prioridad" SortExpression="PRI" HeaderStyle-Width="70px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PRIORIDAD" HeaderText="Pri" SortExpression="PRIORIDAD"
                                        HeaderStyle-Width="70px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IDORDENTRABAJOCORRECTIVO" HeaderText="OTC" SortExpression="IDORDENTRABAJOCORRECTIVO"
                                        HeaderStyle-Width="50px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="HORAINICIO" HeaderText="hora otc" SortExpression="HORAINICIO"
                                        HeaderStyle-Width="50px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TIEMP" HeaderText="tiempo" SortExpression="TIEMP" HeaderStyle-Width="50px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle CssClass="estiloHeaderTabla" />
                            </asp:GridView>
                        </td>
                        <td>
                            <asp:SqlDataSource ID="sdsReclamos1" runat="server" ConnectionString="<%$ ConnectionStrings:SISEConnectionString %>"
                                SelectCommand="select r.idreclamo, r.descripcion, convert(char(10), r.fecha, 103) as fecha,convert(nvarchar(5), r.hora, 108) as hora, r.idtipodocumento, r.nrodocumento,r.idsocio, t.descripcion as tipo,p.nombre, p.apellido,eotc.descripcion as estado, pr.descripcion as pri, r.idordentrabajocorrectivo, otc.horainicio,t.tiemporesolucion as tiemp,
(select sum(tiemporesolucion)
from reclamo rc, tiporeclamo tr
where rc.idtiporeclamo = tr.idtiporeclamo
and tr.prioridad &gt; t.prioridad) tiempoResolucion, t.prioridad
from reclamo r, tiporeclamo t, persona p, socio s, estadoreclamo er, prioridad pr, estadootc eotc,
ordentrabajocorrectivo otc
where r.idestadoreclamo = er.idestadoreclamo and
otc.idestadoot = eotc.idestadootc and
r.idordentrabajocorrectivo = otc.idordentrabajo and
r.prioridad = pr.idprioridad and
r.idestadoreclamo in (1,4) and
((r.idtipodocumento is not null and r.nrodocumento is not null and p.tipodocumento = r.idtipodocumento and p.nrodocumento = r.nrodocumento) or
(r.idsocio is not null and s.idsocio = r.idsocio and s.idtipodocumento = p.tipodocumento and s.nrodocumento = p.nrodocumento)
) and
t.idtiporeclamo = r.idtiporeclamo and
s.idsocio = @socio">
                                <SelectParameters>
                                    <asp:Parameter Name="socio" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panelDetalleTiempos" runat="server" Visible="false">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Tiempo Promedio de Resolución: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblTiempo" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Hora Inicio OTC: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblHoraInicioOTC" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Hora Actual: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblHoraActual" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Tiempo para finalización: " Style="font-weight: bold;"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDuracionEstimada" runat="server" Style="font-weight: bold;"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="Hora Fin estimada OTC: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblHoraFinEstimada" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panelMensaje" runat="server" Visible="false">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
