<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="InicioJefes.aspx.cs" Inherits="Inicio" Title="Inicio - Jefe de Redes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="Style/PopUp2.css" rel="stylesheet" type="text/css" />
    <link href="Style/Inicio.css" rel="stylesheet" type="text/css" />
    <link href="Style/TabStyle2.css" rel="stylesheet" type="text/css" />
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
        .titulo
        {
            font-family: verdana,tahoma,helvetica;
            font-size: 13px;
            padding: 6px 12px; /* background-color: #4F709F;*/
            background-image: linear-gradient(to top, rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.5));
            background-color: #0bf;
            color: white;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            box-shadow: 2px 2px 4px #888;
            -moz-box-shadow: 2px 2px 4px #888;
            -webkit-box-shadow: 2px 2px 4px #888;
            text-shadow: 1px 1px 1px #333;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="tabconteiner1" runat="server" ActiveTabIndex="0" CssClass="TabStyle2"
        Width="1002px">
        <asp:TabPanel ID="tabPanel1" runat="server" HeaderText="Correctivo" Width="75px">
            <HeaderTemplate>
                CORRECTIVO
            </HeaderTemplate>
            <ContentTemplate>
                <asp:Panel ID="Panel12" runat="server" Style="display: inline-flex; margin-top: 13px">
                    <fieldset class="fieldset" style="width: 430px">
                        <legend class="titulo">Órdenes de Trabajo Asignadas</legend>
                        <br />
                        <asp:Label ID="lblNoHayOTC" runat="server" Text="No posee Órdenes de Trabajo Asignadas"
                            Visible="False"></asp:Label>
                        <asp:GridView ID="gvOTCEnCurso" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" Style="border: none; width: 420px">
                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField DataField="NroOTC" HeaderText="Nº OTC">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="60px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="FechaInicio" HeaderText="Fecha Inicio" DataFormatString="{0:d}">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                    <asp:BoundField DataField="nrogrupogr" HeaderText="Grupo" SortExpression="nrogrupogr">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="NombreCalle" HeaderText="Calle">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="NroCalle" HeaderText="Nro">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="60px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Zona" HeaderText="Zona">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="60px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </fieldset>
                    
                    <fieldset class="fieldset" style="width: 430px;">
                        <legend class="titulo">Órdenes de Instalación de Medidor Pendientes</legend>
                        <br />
                        <asp:Label ID="lblNoHayOrdenesInstalacion" runat="server" Text="No posee Órdenes de Instalación Asignadas"
                            Visible="False"></asp:Label>
                        <asp:GridView ID="GvOIPendientes" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" Width="430px">
                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField DataField="nroorden" HeaderText="Nº Orden" ReadOnly="True" SortExpression="idordeninstalacion">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="fechainst" HeaderText="Fecha Instalación" ReadOnly="True" DataFormatString="{0:d}"
                                    SortExpression="fechainstalacion">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="idgrupo" HeaderText="Grupo" SortExpression="idgrupogr">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="zona" HeaderText="Zona" SortExpression="descripcion">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle CssClass="estiloHeaderTabla" />
                        </asp:GridView>
                    </fieldset></asp:Panel>
                <asp:Panel ID="Panel3" runat="server" Style="display: inline-flex; margin-top: 13px">
                    <fieldset class="fieldset" style="width: auto; margin-left: 20px; height: auto">
                        <legend class="titulo">Grupo en Turno</legend>
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SdsGrupoEnTurno"
                            CellPadding="4" ForeColor="#333333" GridLines="None" Width="360px">
                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" Width="360px" />
                            <Columns>
                                <asp:BoundField HeaderText="Grupo" DataField="idgrupogr" SortExpression="idgrupogr">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Hora Inicio" DataField="horainicio" SortExpression="horainicio">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Hora Fin" DataField="horafin" SortExpression="horafin">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Vehículo" DataField="dominio" SortExpression="dominio">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="IBEmpleados" runat="server" ImageUrl="Imagenes/Info.png" Width="20px"
                                            OnClick="VerEmpleados_click" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="estiloHeaderTabla" />
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="estiloHeaderTabla" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SdsGrupoEnTurno" runat="server" ConnectionString="Data Source=localhost\sqlexpress;Initial Catalog=SISE;Integrated Security=True"
                            ProviderName="System.Data.SqlClient" SelectCommand="select hg.idgrupogr, t.horainicio, t.horafin, v.dominio
from historialgrupo hg, turno t, grupoguardiareclamo ggr, vehiculo v
where hg.idturno = t.idturno
and hg.idgrupogr = ggr.idgrupo
and ggr.idvehiculo = v.idvehiculo
and convert(nvarchar(10), getdate(),103) between hg.fechainicio and hg.fechafin
and CONVERT(varchar(25), GETDATE(), 108) between t.horainicio and t.horafin"></asp:SqlDataSource>
                    </fieldset></asp:Panel>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="tabPanel2" runat="server" HeaderText="PREVENTIVO" Width="75px">
            <ContentTemplate>
                <asp:Panel ID="Panel4" runat="server" EnableTheming="False" Style="display: inline-flex">
                    <fieldset class="fieldset" style="width: auto">
                        <legend class="titulo">Pedidos de Insumos </legend>
                        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataSourceID="SdsPedidoInsumo"
                            CellPadding="4" ForeColor="#333333" GridLines="None" Width="345px">
                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField DataField="fechapedido" HeaderText="Fecha Pedido" SortExpression="fechapedido">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="56px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="nombre" HeaderText="Insumo" SortExpression="nombre">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="51px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="cantidad" HeaderText="Cantidad" SortExpression="cantidad">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="10px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="unidadmedida" HeaderText="Unidad" SortExpression="unidadmedida">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="10px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle CssClass="estiloHeaderTabla" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SdsPedidoInsumo" runat="server" ConnectionString="Data Source=localhost\sqlexpress;Initial Catalog=SISE;Integrated Security=True"
                            ProviderName="System.Data.SqlClient" SelectCommand="select convert(char(10), c.fechapedido, 103)AS fechapedido, i.nombre, dc.cantidad, i.unidadmedida
from insumo i, detallecontrato dc, contrato c
where dc.idcontrato=c.idcontrato
and dc.idinsumo=i.idinsumo
and (c.idestadocontrato=1 or c.idestadocontrato=2)"></asp:SqlDataSource>
                    </fieldset>
                    <fieldset class="fieldset" style="width: auto">
                        <legend class="titulo">Pedidos de Herramientas</legend>
                        <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataSourceID="SdsPedidoHerramienta"
                            Width="257px" Style="border: none">
                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField DataField="fechapedido" HeaderText="Fecha Pedido" SortExpression="fechapedido">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="descripcion" HeaderText="Herramienta" SortExpression="descripcion">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="20px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="cantidad" HeaderText="Cantidad" SortExpression="cantidad">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="10px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle CssClass="estiloHeaderTabla" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SdsPedidoHerramienta" runat="server" ConnectionString="Data Source=localhost\sqlexpress;Initial Catalog=SISE;Integrated Security=True"
                            ProviderName="System.Data.SqlClient" SelectCommand="select convert(char(10), c.fechapedido, 103)AS fechapedido, h.descripcion, dc.cantidad
from herramienta h, detallecontrato dc, contrato c
where dc.idcontrato=c.idcontrato
and dc.idherramienta=h.idherramienta
and (c.idestadocontrato=1 or c.idestadocontrato=2)"></asp:SqlDataSource>
                    </fieldset></asp:Panel>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <span style="display: none">
                <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
            </span>
            <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="popUpEmpleados"
                TargetControlID="LinkButton1">
            </asp:ModalPopupExtender>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Panel ID="popUpEmpleados" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading">
            <asp:Label ID="Label3" runat="server" Text="Integrantes del Grupo"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 180px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <br />
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="idempleado"
                            DataSourceID="SdsEmpleados" HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4"
                            ForeColor="#333333" GridLines="None" Style="margin-top: 0px; margin-left: 16px">
                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                            <HeaderStyle CssClass="estiloHeaderTabla" />
                            <Columns>
                                <asp:BoundField DataField="idempleado" HeaderText="Legajo" ReadOnly="True" SortExpression="idempleado">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        <asp:Button ID="btnAceptarRegistrar" runat="server" Text="Aceptar" OnClick="btnAceptarRegistrar_Click"
                            CssClass="botonPopUp" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <asp:SqlDataSource ID="SdsEmpleados" runat="server" ConnectionString="Data Source=localhost\sqlexpress;Initial Catalog=SISE;Integrated Security=True"
        ProviderName="System.Data.SqlClient" SelectCommand="select hg.idgrupogr, e.idempleado,p.nombre, p.apellido
from historialgrupo hg, turno t, grupoguardiareclamo ggr, vehiculo v, empleadoporgrupogr exg, 
empleado e, persona p
where hg.idturno = t.idturno
and hg.idgrupogr = ggr.idgrupo
and ggr.idvehiculo = v.idvehiculo
and exg.idempleado=e.idempleado
and e.nrodocumento=p.nrodocumento
and e.idtipodocumento=p.tipodocumento
and hg.idgrupogr=exg.idgrupoguadiareclamo
and convert(nvarchar(10), getdate(),103) between hg.fechainicio and hg.fechafin
and CONVERT(varchar(25), GETDATE(), 108) between t.horainicio and t.horafin"></asp:SqlDataSource>
</asp:Content>
