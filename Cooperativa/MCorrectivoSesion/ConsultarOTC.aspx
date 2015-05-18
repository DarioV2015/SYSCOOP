<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="ConsultarOTC.aspx.cs" Inherits="MCorrectivoSesion_ConsultarOTC" Title="SISE" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
     <link href="../Style/TabStyle2.css" rel="stylesheet" type="text/css" />
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
             font-family: 'trebuchet MS', 'Lucida sans', Arial;
            font-size: 12px;
            
            background-color: #b9c9fe;
            font-weight: bold;
            background: #b9c9fe;
            border-top: 2px solid #aabcfe;
            border-bottom: 1px solid #fff;
            color: #039;
            padding: 8px;
           border-right-style:none;
            border-left-style: ridge;
            border-left-color: #98A9DF;
            border-left-width: 1px;
        }
        .estiloFilasTabla
        {
             font-family: 'trebuchet MS', 'Lucida sans', Arial;
            font-size: 12px;
            color: #000;
            text-align: center;
            border-left-style: none;
            border-left-width: 0px;
            border-bottom: 1px solid #fff;
            border-right-style:none;
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
        	font-family:Calibri;
        	font-size:17px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:Panel ID="panelOTCAsignada" runat="server" Visible="false" style=" display:inline-flex">
    <fieldset class="FieldDatos" style="height:auto; width:890px; margin-left:50px; margin-top:10px">
    <legend class="legendDatos">
     <asp:Label ID="lblGrupo" runat="server" Text="Datos de la Orden de Trabajo del Grupo Nº" CssClass="legendDatos"></asp:Label>
    </legend>
       
        <table width="auto " cellpadding="4px" style="margin-top: 10px">
            <tr>
                <td class="datos" style="margin-top: 0px">
                    <asp:Label ID="Label1" runat="server" Text="Nro Orden de Trabajo:"></asp:Label>
                    &nbsp;
                </td>
                <td>
                    <asp:Label ID="lblNroOTC" runat="server" Style="font-weight: bold;"></asp:Label>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="datos">
                    <asp:Label ID="Label2" runat="server" Text="Fecha Inicio:"></asp:Label>
                    &nbsp;
                </td>
                <td width="80px">
                    <asp:Label ID="lblFechaInicio" runat="server" Style="font-weight: bold;"></asp:Label>
                    &nbsp;
                </td>
                   <td class="datos">
                    <asp:Label ID="Label5" runat="server" Text="Hora Inicio:"></asp:Label>
                    &nbsp;
                </td>
                <td>
                    <asp:Label ID="lblHoraInicio" runat="server" Style="font-weight: bold;"></asp:Label>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="datos">
                    <asp:Label ID="Label7" runat="server" Text="Prioridad:"></asp:Label>
                    &nbsp;
                </td>
                <td>
                    <asp:Label ID="lblPrioridad" runat="server" Style="font-weight: bold;"></asp:Label>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="datos">
                    <asp:Label ID="Label9" runat="server" Text="Tipo Reclamo:"></asp:Label>
                    &nbsp;
                </td>
                <td width="160px">
                    <asp:Label ID="lblTipoReclamo" runat="server" Style="font-weight: bold;"></asp:Label>
                </td>
            </tr>
        </table>
       
       
        <table width="607px " cellpadding="4px" style="margin-top: 0px; margin-left:56px">
            <tr>
                <td class="datos">
                    <asp:Label ID="Label11" runat="server" Text="Calle:"></asp:Label>
                    &nbsp;
                </td>
                <td width="120px">
                    <asp:Label ID="lblCalle" runat="server" Style="font-weight: bold;"></asp:Label>
                </td>
                <td class="datos" style="width: 45px">
                    <asp:Label ID="Label13" runat="server" Text="Nro:"></asp:Label>
                    &nbsp;
                </td>
                <td style="width: 50px; margin-left: 80px;">
                    <asp:Label ID="lblNroCalle" runat="server" Style="font-weight: bold;"></asp:Label>
                </td>
                <td class="datos" style="width: 45px">
                    <asp:Label ID="Label15" runat="server" Text="Piso:"></asp:Label>
                </td>
                <td style="width: 50px">
                    <asp:Label ID="lblPiso" runat="server" Style="font-weight: bold;"></asp:Label>
                </td>
                <td class="datos" style="width: 45px">
                    <asp:Label ID="Label17" runat="server" Text="Dpto:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblDpto" runat="server" Style="font-weight: bold;"></asp:Label>
                </td>
                   <td class="datos">
                    <asp:Label ID="Label19" runat="server" Text="Zona:"></asp:Label>
                    &nbsp;
                </td>
                <td width="120px">
                    <asp:Label ID="lblZona" runat="server" Style="font-weight: bold;"></asp:Label>
                </td>
            </tr>
        </table>
         </fieldset>
        </asp:Panel>
        
        <asp:Panel ID="panelReclamos" runat="server" Visible="false" style="display:inline-flex">
        <fieldset class="FieldDatos" style="height:150px; margin-top:10px;margin-left:50px">
        <legend class="legendDatos">
        <asp:Label ID="lblReclamosAsociados" runat="server" Text="Reclamos asociados" CssClass="legendDatos"></asp:Label>
        </legend>
        <table width="400px" style="margin-top:0px">
            <%--<tr>
                <td class="styleBuscarSocio" colspan="7" width="1800px">
                    <asp:Label ID="lblReclamosAsociados" runat="server" Text="Reclamos asociados"></asp:Label>
                </td>
            </tr>--%>
            <tr>
                <td>
                    <asp:GridView ID="grillaReclamos" runat="server" AutoGenerateColumns="False" DataKeyNames="idreclamo,idsocio"
                        DataSourceID="sdsReclamos" HeaderStyle-CssClass="estiloHeaderTabla" ForeColor="#333333"
                        BorderStyle="None" style="width:500px">
                        <RowStyle BackColor="#E8EFF8" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle"
                            Width="150px" Height="30px" />
                        <Columns>
                            <asp:BoundField DataField="idreclamo" HeaderText="Nro. Reclamo" ReadOnly="True" SortExpression="idreclamo"
                                HeaderStyle-Width="90px" ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="idsocio" HeaderText="Socio" ReadOnly="True" SortExpression="idsocio"
                                ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" ItemStyle-CssClass="estiloHeaderTabla" Visible="False">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="60px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido"
                                ItemStyle-CssClass="estiloHeaderTabla" Visible="False">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="descripcion" HeaderText="Reclamo" SortExpression="descripcion"
                                ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="100px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Prioridad" HeaderText="Prioridad" SortExpression="Prioridad"
                                HeaderStyle-Width="40px" ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="60px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Column1" HeaderText="Fecha" ReadOnly="True" SortExpression="Column1"
                                HeaderStyle-Width="40px" ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Column2" HeaderText="Hora" ReadOnly="True" SortExpression="Column2"
                                HeaderStyle-Width="40px" ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="false" ForeColor="#333333" />
                        <HeaderStyle CssClass="estiloHeaderTabla" BorderStyle="None"></HeaderStyle>
                        <EditRowStyle BackColor="#999999" BorderStyle="None" />
                        <AlternatingRowStyle BackColor="#F8F9FC" ForeColor="#284775" />
                    </asp:GridView>
                    </td>
                    <td>
                    <asp:SqlDataSource ID="sdsReclamos" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SISEConnectionString %>" SelectCommand="select distinct r.idreclamo, s.idsocio, p.nombre, p.apellido, r.descripcion, 
pr.descripcion as Prioridad, convert(char(10), r.fecha, 103), CONVERT(nvarchar(5), r.hora, 108) 
from reclamo r, socio s, persona p, prioridad pr, ordentrabajocorrectivo otc, tiporeclamo tr
where ((r.idsocio = s.idsocio) or (r.nrodocumento = p.nrodocumento) and (r.idtipodocumento = p.tipodocumento))
and r.idordentrabajocorrectivo = otc.idordentrabajo
and s.nrodocumento = p.nrodocumento
and s.idtipodocumento = p.tipodocumento
and r.idestadoreclamo in (1,4)
and r.idtiporeclamo = tr.idtiporeclamo
and r.prioridad = pr.idprioridad
and otc.idordentrabajo = @nroorden">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblNroOTC" Name="nroorden" PropertyName="Text" 
                                DefaultValue="" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        </fieldset>
        <fieldset class="FieldDatos" style="height: auto; margin-top:10px; margin-left:25px">
        <legend class="legendDatos">Problemas y Soluciones Posibles</legend>
        <table width="300px" style="margin-top:0px">
           
            <tr>
                <td>
                    <asp:GridView ID="grillaPYS" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="sdsProbYSoluciones" HeaderStyle-CssClass="estiloHeaderTabla" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                        EmptyDataText="No hay problemas ni soluciones sugeridas." style="width:320px;">
                    <RowStyle  BackColor="#E8EFF8" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="Problema" HeaderText="Problema" SortExpression="Problema"
                                HeaderStyle-Width="40px" ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="60px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Solución" HeaderText="Solución" SortExpression="Solución"
                                HeaderStyle-Width="40px" ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="60px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                            </asp:BoundField>
                        </Columns>
                        <HeaderStyle CssClass="estiloHeaderTabla" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                
                <td>
                    <caption>
                        <caption>
                            <asp:SqlDataSource ID="sdsProbYSoluciones" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                                ProviderName="System.Data.SqlClient" SelectCommand="select distinct p.descripcion as Problema, s.descripcion as Solución
from ordentrabajocorrectivo otc, detalleordentrabajocorrectivo d, problema p, solucion s, 
reclamo r, domicilio do, zona z
where d.idordentrabajo = otc.idordentrabajo
and d.idproblema = p.idproblema
and d.idsolucion = s.idsolucion 
and r.idordentrabajocorrectivo = otc.idordentrabajo
and otc.iddomicilio = do.iddomicilio
and do.idzona = z.idzona
and r.idestadoreclamo = 2
and otc.idestadoot = 3
and r.idtiporeclamo = @tiporeclamo
and z.idzona = @zona">
                                <SelectParameters>
                                    <asp:Parameter Name="tiporeclamo" />
                                    <asp:Parameter Name="zona" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </caption>
                    </caption>
                </td>
            </tr>
            
        </table>
        </fieldset>
      
    </asp:Panel>
      <table>
        <tr>        
        <td>
            
         <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" 
                    style="margin-top:10px; margin-left:50px;" />
                </td>
                </tr>

                </table>
    <asp:Panel ID="PanelNoHayOTC" runat="server" Visible="false">
        <br />
        <br />
        <asp:Label ID="lblNoHayOTC" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnVolver2" runat="server" Text="Volver" OnClick="btnVolver2_Click" />
    </asp:Panel>
</asp:Content>
