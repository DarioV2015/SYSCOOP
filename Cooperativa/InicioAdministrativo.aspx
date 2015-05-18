<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true" CodeFile="InicioAdministrativo.aspx.cs" Inherits="InicioAdministrativo" Title="Página sin título" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
   	font-family:verdana,tahoma,helvetica;
   	font-size:13px;
   	padding: 6px 12px;
    
   /* background-color: #4F709F;*/
    background-image: linear-gradient(to top, rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.5));
    background-color  : #0bf;
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:TabContainer   ID="tabconteiner1" runat="server" ActiveTabIndex="0" 
        CssClass="TabStyle2" Width="1002px">
<asp:TabPanel ID= "tabPanel1" runat="server" HeaderText="Instalaciones" Width="75px">
    
<ContentTemplate>

    <asp:Panel ID="Panel1" runat="server">
    
    <fieldset  class="fieldset" style="width:auto; margin-left:230px; margin-top:10px">
    <legend  class="titulo">Pedidos Instalación Pendientes</legend>
        <asp:GridView ID="GvPedidosPendientes" runat="server" 
            AutoGenerateColumns="False" DataKeyNames="idpedido" CellPadding="4" ForeColor="#333333" GridLines="None"
            DataSourceID="SdsPedidosInstalacionPendientes" HeaderStyle-CssClass="estiloHeaderTabla" Width="430px">
         <RowStyle  BackColor="#E8EFF8" ForeColor="#333333" />
          <HeaderStyle CssClass="estiloHeaderTabla" />
            <Columns>
                <asp:BoundField DataField="idpedido" HeaderText="Pedido" ReadOnly="True" 
                    SortExpression="idpedido" >
                     <HeaderStyle CssClass="estiloHeaderTabla" Width="60px"></HeaderStyle>
                     <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                     </asp:BoundField > 
                <asp:BoundField DataField="fechapedido" HeaderText="Fecha " 
                    SortExpression="fechapedido" >
                     <HeaderStyle CssClass="estiloHeaderTabla" Width="80px"></HeaderStyle>
                     <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                     </asp:BoundField > 
                <asp:BoundField DataField="nombre" HeaderText="Calle" SortExpression="nombre" >
                 <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                     <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                     </asp:BoundField > 
                <asp:BoundField DataField="nrocalle" HeaderText="Nro" 
                    SortExpression="nrocalle" >
                     <HeaderStyle CssClass="estiloHeaderTabla" Width="60px"></HeaderStyle>
                     <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                     </asp:BoundField > 
            </Columns>
        
        </asp:GridView>
        <asp:SqlDataSource ID="SdsPedidosInstalacionPendientes" runat="server" 
            ConnectionString="Data Source=LU-PC\sqlexpress;Initial Catalog=SISE;Integrated Security=True" 
            ProviderName="System.Data.SqlClient" SelectCommand="select distinct p.idpedido, convert(char(10), p.fechapedido, 103)AS fechapedido, c.nombre, d.nrocalle
from pedidoinstalacion p, calle c, domicilio d, estadopedido ep
where p.iddomicilio=d.iddomicilio
and d.idcalle=c.idcalle
and p.idestado=1"></asp:SqlDataSource>
    
    
    </fieldset></asp:Panel>

</ContentTemplate>
</asp:TabPanel>
</asp:TabContainer>
</asp:Content>

