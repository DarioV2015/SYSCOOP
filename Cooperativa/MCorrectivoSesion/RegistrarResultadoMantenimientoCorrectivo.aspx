<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="RegistrarResultadoMantenimientoCorrectivo.aspx.cs" Inherits="MCorrectivoSesion_RegistrarResultadoMantenimientoCorrectivo"
    Title="Registrar Resultado OTC" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
    <link href="../Style/TabStyle2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .hidden
        {
            display: none;
        }
    </style>
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
        .styleTitulo
        {
            colspan: 5;
            border-bottom-style: inset;
            height: 25px;
            font-size: 12px;
        }
        .FieldDatos
        {
            height: 138px;
            border-radius: 6px;
            border-color: rgb(196, 194, 194);
            border-style: solid;
            border-width: 1px;
        }
        .legendDatos
        {
            font-family: Calibri;
            font-size: 17px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="tabconteiner1" runat="server" ActiveTabIndex="0" CssClass="TabStyle2"
        Style="margin-top: 10px">
        <asp:TabPanel ID="tabPanel1" runat="server" HeaderText="Orden de Trabajo Asignada">
            <ContentTemplate>
                <asp:Label ID="lblNOHayOTC" runat="server" Visible="false"></asp:Label>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="panelDetalleOTC" runat="server" Visible="false">
                            <fieldset class="FieldDatos" style="height: 130px; margin-bottom: 10px; margin-left:40px; margin-top: 10px;
                                width: 850px">
                                <legend class="legendDatos">Datos de la Orden</legend>
                                <table width="94% " cellpadding="4px" style="margin-top: 10px">
                                    <tr>
                                        <td style="text-align: right; width: 120px">
                                            <asp:Label ID="Label2" runat="server" Text="Fecha de Creación:"></asp:Label>
                                        </td>
                                        <td class="style9">
                                            <asp:Label ID="lblFechaCreacion" runat="server" Style="font-weight: bold"></asp:Label>
                                        </td>
                                        <td class="style11">
                                            &nbsp;
                                        </td>
                                        <td class="style15">
                                            &nbsp;
                                        </td>
                                        <td class="style15">
                                            &nbsp;
                                        </td>
                                        <td class="style15">
                                            &nbsp;
                                        </td>
                                        <td class="style15">
                                            &nbsp;
                                        </td>
                                        <td class="style15">
                                            &nbsp;
                                        </td>
                                        <td class="style15">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label4" runat="server" Text="Hora de Creación:"></asp:Label>
                                        </td>
                                        <td class="style9">
                                            <asp:Label ID="lblHoraCreacion" runat="server" Style="font-weight: bold"></asp:Label>
                                        </td>
                                        <td class="style11">
                                            &nbsp;
                                        </td>
                                        <td class="style15">
                                            &nbsp;
                                        </td>
                                        <td class="style15">
                                            &nbsp;
                                        </td>
                                        <td class="style15">
                                            &nbsp;
                                        </td>
                                        <td class="style15">
                                            &nbsp;
                                        </td>
                                        <td class="style15">
                                            &nbsp;
                                        </td>
                                        <td class="style15">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label7" runat="server" Text="Calle:"></asp:Label>
                                        </td>
                                        <td style="text-align: left; width: 78px">
                                            <asp:Label ID="lblCalle" runat="server" Style="font-weight: bold"></asp:Label>
                                        </td>
                                        <td style="width: 20px; text-align: right">
                                            <asp:Label ID="Label9" runat="server" Text="Nº:"></asp:Label>
                                        </td>
                                        <td style="text-align: right; width: 21px">
                                            <asp:Label ID="lblNroCalle" runat="server" Style="font-weight: bold"></asp:Label>
                                        </td>
                                        <td style="text-align: right; width: 41px">
                                            <asp:Label ID="Label10" runat="server" Text="Piso:"></asp:Label>
                                        </td>
                                        <td style="text-align: left; width: 12px">
                                            <asp:Label ID="lblPiso" runat="server" Style="font-weight: bold"></asp:Label>
                                        </td>
                                        <td style="text-align: right; width: 40px">
                                            <asp:Label ID="Label11" runat="server" Text="Dpto:"></asp:Label>
                                        </td>
                                        <td width="20px">
                                            <asp:Label ID="lblDpto" runat="server" Style="font-weight: bold"></asp:Label>
                                        </td>
                                        <td style="text-align: right; width: 40px">
                                            <asp:Label ID="Label12" runat="server" Text="Zona:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblZona" runat="server" Style="font-weight: bold"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                            <fieldset class="FieldDatos" style="width: 850px; height:auto; margin-bottom:10px; margin-left:40px">
                                <legend class="legendDatos">Reclamos asociados a la Orden</legend>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:GridView ID="grillaReclamos" runat="server" AutoGenerateColumns="False" DataKeyNames="idreclamo"
                                                DataSourceID="sdsReclamos" HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4"
                                                ForeColor="#333333" GridLines="None" Style="margin-top: 0px">
                                                <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                                <Columns>
                                                    <asp:BoundField DataField="idreclamo" HeaderText="N° de Reclamo" ReadOnly="True"
                                                        SortExpression="idreclamo" HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="91px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Column1" HeaderText="Fecha" ReadOnly="True" SortExpression="Column1"
                                                        HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Column2" HeaderText="Hora" ReadOnly="True" SortExpression="Column2"
                                                        HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="descripcion" HeaderText="Reclamo" SortExpression="descripcion"
                                                        HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" HeaderStyle-Width="65px"
                                                        ItemStyle-CssClass="estiloHeaderTabla" Visible="False">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido"
                                                        Visible="False">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="idtiporeclamo" HeaderText="idtiporeclamo" ReadOnly="True"
                                                        SortExpression="idtiporeclamo" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="nombre1" HeaderText="Calle" SortExpression="nombre1" HeaderStyle-Width="65px"
                                                        ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="nrocalle" HeaderText="Nº" SortExpression="nrocalle" HeaderStyle-Width="65px"
                                                        ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="piso" HeaderText="Piso" SortExpression="piso" HeaderStyle-Width="65px"
                                                        ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="dpto" HeaderText="Dpto." SortExpression="dpto" HeaderStyle-Width="65px"
                                                        ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="descripcion1" HeaderText="Zona" SortExpression="descripcion1"
                                                        HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="idzona" HeaderText="idzona" ReadOnly="True" SortExpression="idzona"
                                                        HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"></asp:BoundField>
                                                </Columns>
                                                <HeaderStyle CssClass="estiloHeaderTabla" />
                                            </asp:GridView>
                                        </td>
                                        <td>
                                            <asp:SqlDataSource ID="sdsReclamos" runat="server" ConnectionString="<%$ ConnectionStrings:SISEConnectionString %>"
                                                SelectCommand="select distinct r.idreclamo, convert(char(10), r.fecha, 103), convert(nvarchar(5), r.hora, 108), r.descripcion,  
p.nombre, p.apellido, tr.idtiporeclamo, c.nombre, d.nrocalle, d.piso, d.dpto, z.descripcion, z.idzona, r.idordentrabajocorrectivo,s.idsocio
from ordentrabajocorrectivo otc, reclamo r, socio s, persona p, tiporeclamo tr, calle c, 
domicilio d, zona z
where r.idordentrabajocorrectivo = otc.idordentrabajo
and ((r.nrodocumento = p.nrodocumento and r.idtipodocumento = p.tipodocumento) or (s.idsocio = r.idsocio and s.nrodocumento = p.nrodocumento and s.idtipodocumento = p.tipodocumento ))
and r.idtiporeclamo = tr.idtiporeclamo
and r.iddomicilio = d.iddomicilio
and d.idcalle = c.idcalle
and d.idzona = z.idzona
and otc.idestadoot = 1
and otc.idordentrabajo = @nroOrden">
                                                <SelectParameters>
                                                    <asp:Parameter Name="nroorden" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset></asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        </asp:TabPanel>
        
        

        <asp:TabPanel ID="tabPanel2" runat="server" HeaderText="Detalle de la Orden">
            <HeaderTemplate>
                Detalle de la Orden
            </HeaderTemplate>
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="panelDetalle" runat="server" Visible="false">
                            <table width="800px" style="margin-top: 0px">
                                <tr>
                                    <td class="styleTitulo">
                                        <asp:Label ID="Label15" runat="server" Font-Italic="True" Font-Size="Medium" Text="Problemas y Soluciones Sugeridas"></asp:Label>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblNoSeleccionadoProblema" runat="server" Visible="false"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table width="650px" style="margin-top: 0px; margin-left: 70px">
                                <tr>
                                    <td valign="top">
                                        <asp:GridView ID="gvProblemas" runat="server" AutoGenerateColumns="False" DataKeyNames="idproblema"
                                            Visible="false" DataSourceID="sdsProblemas" OnRowDataBound="gvProblemas_RowDataBound"
                                            HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                                            GridLines="None" Style="margin-top: 0px">
                                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                            <Columns>
                                                
                                          
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                               
                                                        <asp:RadioButton ID="gvProblemas_rdbSeleccionado" runat="server" AutoPostBack="True"
                                                            OnCheckedChanged="rdbProblema_CheckedChanged" onclick="RadioCheckOnly(this); "
                                                            Width="20px" />
                          
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:TemplateField>
                            
                                                <asp:BoundField DataField="nombre" HeaderText="Problema" SortExpression="nombre"
                                                    HeaderStyle-Width="180px" ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="180px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="idproblema" HeaderText="idproblema" ReadOnly="True" SortExpression="idproblema"
                                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                            </Columns>
                                            <HeaderStyle CssClass="estiloHeaderTabla" />
                                        </asp:GridView>
                                        <asp:GridView ID="gvProblemasTodos" runat="server" DataSourceID="sdsProblemasTodos"
                                            OnRowDataBound="gvProblemasTodos_RowDataBound" HeaderStyle-CssClass="estiloHeaderTabla"
                                            CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False"
                                            Style="margin-top: 0px">
                                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:RadioButton ID="gvProblemasTodos_rdbSeleccionado" runat="server" AutoPostBack="True"
                                                            OnCheckedChanged="rdbProblemaTodos_CheckedChanged" onclick="RadioCheckOnly(this); "
                                                            Width="20px" />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="nombre" HeaderText="Problema" SortExpression="nombre"
                                                    HeaderStyle-Width="180px" ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="180px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="idproblema" HeaderText="idproblema" ReadOnly="True" SortExpression="idproblema"
                                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                            </Columns>
                                            <HeaderStyle CssClass="estiloHeaderTabla" />
                                        </asp:GridView>
                                    </td>
                                    <td valign="top">
                                        <asp:Label ID="lblNoSolucionesEspecificas" runat="server" Visible="false"></asp:Label>
                                        <asp:GridView ID="grillaSoluciones" runat="server" AutoGenerateColumns="False" DataKeyNames="idsolucion"
                                            Visible="false" DataSourceID="sdsSoluciones" OnRowDataBound="grillaSoluciones_RowDataBound"
                                            HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                                            GridLines="None" Style="margin-top: 0px">
                                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSolucion" runat="server" AutoPostBack="true" OnCheckedChanged="chkSolucion_CheckedChanged" />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Solución" HeaderText="Solución" SortExpression="Solución"
                                                    HeaderStyle-Width="160px" ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="160px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="idsolucion" HeaderText="idsolucion" ReadOnly="True" SortExpression="idsolucion"
                                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                            </Columns>
                                            <HeaderStyle CssClass="estiloHeaderTabla" />
                                        </asp:GridView>
                                        <asp:GridView ID="grillaSolucionesTodas" runat="server" AutoGenerateColumns="False"
                                            DataKeyNames="idsolucion" Visible="false" DataSourceID="sdsSolucionesTodas" OnRowDataBound="grillaSolucionesTodas_RowDataBound"
                                            HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                                            GridLines="None" Style="margin-top: 0px">
                                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSolucionTodas" runat="server" AutoPostBack="true" OnCheckedChanged="chkSolucionTodas_CheckedChanged" />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Solución" HeaderText="Solución" SortExpression="Solución"
                                                    HeaderStyle-Width="160px" ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="160px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="idsolucion" HeaderText="idsolucion" ReadOnly="True" SortExpression="idsolucion"
                                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                            </Columns>
                                            <HeaderStyle CssClass="estiloHeaderTabla" />
                                        </asp:GridView>
                                    </td>
                                    <td style="vertical-align: top">
                                        <table style="margin-top:0px">
                                            <tr>
                                                <td width="50px" style="vertical-align:top">
                                                    <asp:Button ID="btnNuevoProblema" runat="server" Text="Nuevo Problema" OnClick="btnNuevoProblema_Click"
                                                        Style="margin-left: 0px; margin-top: 0px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="50px">
                                                    <asp:Button ID="btnCargarPYS" runat="server" Text="Cargar" OnClick="btnCargarPYS_Click"
                                                        Style="margin-left: 0px; margin-top: 10px" Enabled="False" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            </asp:Panel>
                            <asp:Panel ID="panelProblemasSoluciones" runat="server" Visible="false">
                                <table style="margin-top: 5px">
                                    <tr>
                                        <td class="styleTitulo" width="900 px">
                                            <asp:Label ID="Label18" runat="server" Font-Italic="True" Font-Size="Medium" Text="Detalle de la OTC"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <table style="margin-left:70px; margin-top:5px">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblProblemaFinal" runat="server" Style="margin-left: 10px" Font-Size="14px"
                                                Font-Italic="True" Font-Bold="True"></asp:Label>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <asp:GridView ID="gvPYSOTC" runat="server" OnRowDataBound="gvPYSOTC_RowDataBound"
                                                OnRowCommand="gvPYSOTC_RowCommand" AutoGenerateColumns="False" HeaderStyle-CssClass="estiloHeaderTabla"
                                                CellPadding="4" ForeColor="#333333" GridLines="None" Style="margin-top: 10px">
                                                <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                                <Columns>
                                                    <asp:BoundField DataField="nroproblema" HeaderText="Nro. Problema" HeaderStyle-Width="60px"
                                                        ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="nombreproblema" HeaderText="Nombre" HeaderStyle-Width="60px"
                                                        ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="nrosolucion" HeaderText="Nro. Solución" HeaderStyle-Width="60px"
                                                        ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="nombreSolucion" HeaderText="Solución" HeaderStyle-Width="120px"
                                                        ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="120px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:TemplateField ShowHeader="False" HeaderStyle-CssClass="estiloHeaderTabla" HeaderStyle-Width="30px"
                                                        ItemStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="btnEliminar" runat="server" CommandArgument='<%# Eval("nrosolucion") %>'
                                                                CommandName="DeleteRow" CausesValidation="false" ImageUrl="../Imagenes/cancel.png" />
                                                            <%--<asp:Button ID="btnEliminar" CommandArgument='<%# Eval("nrosolucion") %>' CommandName="DeleteRow"
                                                runat="server" CausesValidation="false" Text="Eliminar" Width="65px" />--%>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                        <td>
                                            <table width="290px">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label" runat="server" Font-Italic="True" Font-Size="Medium" Text=" -   Insumos"
                                                            Style="margin-left: 70px"></asp:Label>
                                                        &nbsp;
                                                        <asp:ImageButton ID="ImageButton4" runat="server" OnClick="imInsumo_Click" ImageUrl="../Imagenes/addVerde.png"
                                                            Width="20px" Height="20px" Style="vertical-align: middle; margin-bottom: 3px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label17" runat="server" Font-Italic="True" Font-Size="Medium" Text=" -   Herramientas Extras"
                                                            Style="margin-left: 70px"></asp:Label>
                                                        &nbsp;
                                                        <asp:ImageButton ID="ImageButton5" runat="server" OnClick="imHerramienta_Click" ImageUrl="../Imagenes/addVerde.png"
                                                            Width="20px" Height="20px" Style="vertical-align: middle; margin-bottom: 3px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <asp:SqlDataSource ID="sdsProblemas" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                                                ProviderName="System.Data.SqlClient" SelectCommand="select p.nombre, p.idproblema
from ordentrabajocorrectivo otc, detalleordentrabajocorrectivo d, problema p, solucion s, 
reclamo r, domicilio do, zona z
where d.idordentrabajo = otc.idordentrabajo
and d.idproblema = p.idproblema
and d.idsolucion = s.idsolucion 
and r.idordentrabajocorrectivo = otc.idordentrabajo
and otc.iddomicilio = do.iddomicilio
and do.idzona = z.idzona
and r.idestadoreclamo = 3
and otc.idestadoot = 3
and r.idtiporeclamo = @tiporeclamo
and z.idzona = @zona">
                                                <SelectParameters>
                                                    <asp:Parameter Name="tiporeclamo" />
                                                    <asp:Parameter Name="zona" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:SqlDataSource ID="sdsSoluciones" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                                                ProviderName="System.Data.SqlClient" SelectCommand="select s.nombre as Solución, s.idsolucion
from problemasporsolucion pps, problema p, solucion s
where pps.idproblema = p.idproblema
and pps.idsolucion = s.idsolucion
and pps.idproblema = @problema">
                                                <SelectParameters>
                                                    <asp:Parameter Name="problema" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:SqlDataSource ID="sdsProblemasTodos" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                                                ProviderName="System.Data.SqlClient" SelectCommand="select p.nombre, p.idproblema from problema p">
                                            </asp:SqlDataSource>
                                            <asp:SqlDataSource ID="sdsSolucionesTodas" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                                                ProviderName="System.Data.SqlClient" SelectCommand="select s.nombre as Solución, s.idsolucion from solucion s">
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                                </fieldset>
                            </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        </asp:TabPanel>
        
      
        <asp:TabPanel ID="tabPanel3" runat="server" HeaderText="Insumos y Herramientas">
            <ContentTemplate>
                <asp:Label ID="Label6" runat="server" Visible="false"></asp:Label>
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="panel1" runat="server">
                            <fieldset class="FieldDatos" style="height: auto; margin-bottom: 10px; margin-top: 10px;
                                width: 500px; margin-left:170px">
                                <legend class="legendDatos">Insumos</legend>
                                <table width="94% " cellpadding="4px" style="margin-top: 0px;">
                                    <tr>
                                        <td style="border-spacing: 0px" valign="top">
                                            <asp:GridView ID="grillaInsumosFinal" runat="server" OnRowDataBound="grillaInsumosFinal_RowDataBound"
                                                AutoGenerateColumns="False" HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4"
                                                ForeColor="#333333" GridLines="None" Style="margin-left: 70px; margin-top: 0px"
                                                OnRowCommand="grillaInsumosFinal_RowCommand" Width="350px">
                                                <RowStyle BackColor="#E8EFF8" ForeColor="#333333" Width="300px" />
                                                <Columns>
                                                    <asp:BoundField DataField="nroDetalleInsumo" HeaderText="Nro. Detalle Insumo" HeaderStyle-Width="60px"
                                                        ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="nroDetalleOTC" HeaderText="Nro. Detalle OTC" HeaderStyle-Width="60px"
                                                        ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="nroOTC" HeaderText="Nro. OTC" HeaderStyle-Width="60px"
                                                        ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="nroInsumo" HeaderText="Insumo" HeaderStyle-Width="60px"
                                                        ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="insumo" HeaderText="Nombre" HeaderStyle-Width="190px" ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="190px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="Cantidad" DataField="cantidad" HeaderStyle-Width="180px"
                                                        ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="100px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="unidadMedida" HeaderText="Unidad" HeaderStyle-Width="20px"
                                                        ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="20px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="TipoInsumo" HeaderText="TipoInsumo" HeaderStyle-Width="60px"
                                                        ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="80px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Especificacion" HeaderText="Especificacion" HeaderStyle-Width="60px"
                                                        ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="80px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:TemplateField ShowHeader="False" HeaderStyle-CssClass="estiloHeaderTabla" HeaderStyle-Width="60px"
                                                        ItemStyle-Width="60px">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="btnEliminar" runat="server" CommandArgument='<%# Eval("nroInsumo") %>'
                                                                CommandName="DeleteRow" CausesValidation="false" ImageUrl="../Imagenes/cancel.png" />
                                                            <%-- <asp:Button ID="btnEliminar" CommandArgument='<%# Eval("nroInsumo") %>' CommandName="DeleteRow"
                                                runat="server" CausesValidation="false" Text="Eliminar" Width="65px" />--%>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                        </asp:Panel>
                        <asp:Panel ID="panel2" runat="server">
                            <fieldset class="FieldDatos" style="height: auto; margin-bottom: 10px; margin-top: 10px;
                                width: 500px; margin-left:170px">
                                <legend class="legendDatos">Herramientas</legend>
                                <table width="94% " cellpadding="4px" style="margin-top: 0px; margin-left:50px">
                                    <tr>
                                        <td valign="top">
                                            <asp:Label ID="lblSinHerramientas" runat="server" Visible="false"></asp:Label>
                                            <asp:GridView ID="grillaHerramientasFinal" runat="server" OnRowDataBound="grillaHerramientasFinal_RowDataBound"
                                                AutoGenerateColumns="False" HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4"
                                                ForeColor="#333333" GridLines="None" Style="margin-left: 50px; margin-top: 0px"
                                                Width="290px" OnRowCommand="grillaHerramientasFinal_RowCommand">
                                                <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                                <Columns>
                                                    <asp:BoundField DataField="nroDetalleHerramienta" HeaderStyle-Width="90px" ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="nroOTC" HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="nroHerramienta" HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="60px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="nombre" HeaderText="Herramienta" HeaderStyle-Width="70px"
                                                        ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="tipoHerramienta" HeaderText="Tipo" HeaderStyle-Width="60px"
                                                        ItemStyle-CssClass="estiloHeaderTabla">
                                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="60px"></HeaderStyle>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:TemplateField ShowHeader="False" HeaderStyle-CssClass="estiloHeaderTabla" HeaderStyle-Width="10px"
                                                        ItemStyle-Width="10px">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="btnEliminar" CommandArgument='<%# Eval("nroHerramienta") %>'
                                                                CommandName="DeleteRow" runat="server" CausesValidation="false" ImageUrl="../Imagenes/cancel.png" />
                                                            <%--<asp:Button ID="btnEliminar" CommandArgument='<%# Eval("nroHerramienta") %>' CommandName="DeleteRow"
                                                runat="server" CausesValidation="false" Text="Eliminar" Width="65px" />--%>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                </table>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
    <asp:Panel ID="panelRegistrar" runat="server" Visible="false">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <table>
                    <caption>
                        <br />
                        <tr>
                            <td>
                                <asp:Button ID="btnRegistrarResultado" runat="server" OnClick="btnRegistrarResultado_Click"
                                    Text="Registrar" Enabled="False" Style="margin-left: 300px" />
                            </td>
                            <td>
                                <asp:Button ID="btnCancelarResultado" runat="server" Text="Cancelar" OnClick="btnCancelarResultado_Click" />
                            </td>
                        </tr>
                    </caption>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Panel ID="panelVolver" runat="server" Visible="true">
        <table>
            <tr>
                <td>
                    <asp:Button ID="btnVolver" runat="server" Text="Volver" OnClick="btnVolver_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="lnk2" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupRegistrar" runat="server" PopupControlID="popUpConfirmacion"
        TargetControlID="lnk2" BackgroundCssClass="reveal-modal-bg">
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
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading">
            <asp:Label ID="lblNoMedidores" runat="server" Text="¿Desea registrar el Resultado de la Orden?"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
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
            <asp:Image ID="Image2" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="35px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label5" runat="server" Text="Se perderán los datos ingresados" Style="margin-right: 25px"></asp:Label>
            <br />
            <asp:Label ID="Label16" runat="server" Text="¿Desea Continuar?"></asp:Label>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
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
    <asp:Panel ID="popUpExito" runat="server" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image3" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="40px" />
        </div>
        <div class="heading" style="width:370px">
            <asp:Label ID="Label1" runat="server" Text="La OTC fue finalizada con éxito" Style="margin-right: 15px"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 200px; border-top: 0.1px solid #bababa; width:370px">
            <div style="margin-right: 15px; text-align: center">
                <br />
                <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="lblTiempoResolucion" runat="server"></asp:Label>
                        <br />
                         <br />
                        <asp:Label ID="lblTiempoTipoReclamo" runat="server"></asp:Label>
                        <br />
                         <asp:Label ID="lblOTCPendiente" runat="server"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                    <ContentTemplate>
                        <br />
                        <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarConfirmacion_Click" Style="margin-top: 20px" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <asp:GridView ID="grillaDetalleOTC" runat="server" Visible="False">
    </asp:GridView>

    <script type="text/javascript">
    
     function RadioCheckOnly(rbControl) {
     
      var gvName = rbControl.defaultValue.split('_')[0];
      var gvControl;
      
      switch (gvName)
      {
        case "gvProblemas":
        gvControl =  "<%=gvProblemas.ClientID%>";       
        break;   
        
        case "gvProblemasTodos":
        gvControl =  "<%=gvProblemasTodos.ClientID%>";       
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

    <span style="display: none">
        <asp:LinkButton ID="lnk1" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupInsumos" PopupControlID="panelInsumos" runat="server"
        TargetControlID="lnk1" BackgroundCssClass="reveal-modal-bg">
    </asp:ModalPopupExtender>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton3" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupHerramientas" PopupControlID="panelHerramientas"
        runat="server" TargetControlID="LinkButton3" BackgroundCssClass="reveal-modal-bg">
    </asp:ModalPopupExtender>
    

    <asp:Panel ID="panelInsumos" runat="server" CssClass="divFondo">
        <div class="heading" style="width: 550px">
            <table style="margin-top: 0px; margin-left: 160px">
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Listado de Insumos" Font-Size="14px" style="margin-left:60px"></asp:Label>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <div class="content" style="height: auto; border-top: 0.1px solid #bababa; width: 550px">
            <div>
                <table style="margin-top: 0px; margin-left: 15px">
                    <tr>
                        <td>
                            <asp:GridView ID="grillaInsumos" runat="server" AutoGenerateColumns="False" DataKeyNames="IDINSUMO"
                                DataSourceID="sdsInsumos" OnRowDataBound="grillaInsumos_RowDataBound" HeaderStyle-CssClass="estiloHeaderTabla"
                                CellPadding="4" ForeColor="#333333" GridLines="None" Style="width: 500px">
                                <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                <Columns>
                                    <asp:TemplateField HeaderStyle-Width="30px">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkInsumo" runat="server" AutoPostBack="True" OnCheckedChanged="chkInsumo_CheckedChanged" />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="IDINSUMO" HeaderText="Nro. Insumo" ReadOnly="True" SortExpression="IDINSUMO"
                                        HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NOMBRE" HeaderText="Insumo" ReadOnly="True" SortExpression="NOMBRE"
                                        HeaderStyle-Width="140px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="140px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Cantidad" ItemStyle-Width="100px" HeaderStyle-CssClass="estiloHeaderTabla">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtCantidad" runat="server" ReadOnly="True" Visible="false" Width="70px"> </asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="UNIDADMEDIDA" HeaderText="Unidad de Medida" ReadOnly="True"
                                        SortExpression="UNIDADMEDIDA" HeaderStyle-Width="120px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="120px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IDTIPOINSUMO" HeaderText="Tipo de Insumo" ReadOnly="True"
                                        SortExpression="IDTIPOINSUMO" HeaderStyle-Width="150px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="150px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ESPECIFICACION" HeaderText="Especificacion" ReadOnly="True"
                                        SortExpression="ESPECIFICACION" HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td width="400px">
                            <asp:Label ID="lblNoStockCuantificable" runat="server" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td width="400px">
                            <asp:Label ID="lblNoStockNoCuantificable" runat="server" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td width="100px">
                            <asp:Button ID="btnCargarInsumo" runat="server" Text="Cargar Insumo" OnClick="btnCargarInsumos_Click"
                                Style="margin-left: 125px; margin-top: 0px; margin-bottom:10px" />
                        </td>
                        <td>
                            <asp:Button ID="btnCerrarInsumos" runat="server" Text="Cerrar" OnClick="btnCerrarInsumos_Click"
                                Style="margin-top: 0px; margin-bottom:10px" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>
    

    
    
    

    
    <asp:Panel ID="panelHerramientas" runat="server" CssClass="divFondo">
        <div class="heading" style="width: 450px">
            <table style="margin-top: 0px; margin-left: 160px">
                <tr>
                    <td class="styleBuscarSocio">
                        <asp:Label ID="Label8" runat="server" Text=" Listado de Herramientas"></asp:Label>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <div class="content" style="height: auto; border-top: 0.1px solid #bababa; width: 450px">
            <div>
                <table style="margin-top: 0px; margin-left: 22px; width: 400px">
                    <tr>
                        <td>
                            <asp:GridView ID="grillaHerramientas" runat="server" AutoGenerateColumns="False"
                                DataKeyNames="idherramienta" DataSourceID="sdsHerramientas" OnRowDataBound="grillaHerramientas_RowDataBound"
                                HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                                GridLines="None" Width="400px">
                                <PagerSettings PageButtonCount="3" />
                                <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkHerramienta" runat="server" Width="20px" />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="estiloFilasTabla" Width="20px"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="idherramienta" HeaderText="Nro" ReadOnly="True"
                                        SortExpression="idherramienta" HeaderStyle-Width="30px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="30px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="descripcion" HeaderText="Herramienta" SortExpression="descripcion"
                                        HeaderStyle-Width="105px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="105px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="descripcion1" HeaderText="Tipo" SortExpression="descripcion1"
                                        HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle CssClass="estiloHeaderTabla" />
                            </asp:GridView>
                        </td>
                        <td>
                            <asp:SqlDataSource ID="sdsHerramientas" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                                ProviderName="System.Data.SqlClient" SelectCommand="select h.idherramienta, h.descripcion, th.descripcion
from herramienta h with(NOLOCK), tipoherramienta th with(NOLOCK)
where h.idtipoherramienta = th.idtipoherramienta"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="sdsInsumos" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                                ProviderName="System.Data.SqlClient" SelectCommand="SELECT [IDINSUMO], [NOMBRE], [ESPECIFICACION], [UNIDADMEDIDA], [IDTIPOINSUMO] FROM [INSUMO] with(NOLOCK)">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
                <table style="margin-left: 60px">
                    <tr>
                        <td width="30px">
                            <asp:Button ID="btnCargarHerramientas" runat="server" OnClick="btnCargarHerramientas_Click"
                                Text="Cargar Herramienta" style="margin-bottom:10px" />
                        </td>
                        <td>
                            <asp:Button ID="btnCerrarHerramientas" runat="server" Text="Cerrar" OnClick="btnCerrarHerramientas_Click" style="margin-bottom:10px" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>

    
    
</asp:Content>
