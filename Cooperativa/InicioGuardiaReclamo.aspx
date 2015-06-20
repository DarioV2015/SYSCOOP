<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true" CodeFile="InicioGuardiaReclamo.aspx.cs" Inherits="InicioGuardiaReclamo" Title="Página sin título" %>
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
<asp:TabPanel  ID= "tabPanel1" runat="server" HeaderText="Correctivo" Width="75px">
    <HeaderTemplate >
        Correctivo
    </HeaderTemplate>
<ContentTemplate>
   
     
    <asp:Panel ID="Panel2" runat="server" style="display:inline-flex; margin-top:13px">
    
    <fieldset  class="fieldset" style="width:430px">
    <legend  class="titulo">Órdenes de Trabajo Asignadas</legend>
    <br />
<asp:Label ID="Label1" runat="server" Text="No posee órdenes de Trabajo Asignadas" Visible="False"></asp:Label>
         
         <asp:GridView ID="gvOTCEnCurso" runat="server" AutoGenerateColumns="False"
        CellPadding="4" ForeColor="#333333" GridLines="None" style="border:none; width:420px" Visible="True">
            
         <RowStyle  BackColor="#E8EFF8" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="NroOTC" HeaderText="OTC" >
                 <HeaderStyle CssClass="estiloHeaderTabla" Width="60px"></HeaderStyle>
                     <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                     </asp:BoundField > 
                <asp:BoundField DataField="FechaInicio" HeaderText="Fecha Inicio" DataFormatString="{0:d}">
                 <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                     <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                     </asp:BoundField > 
                <asp:BoundField DataField="NombreCalle" HeaderText="Calle">
                 <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                     <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                     </asp:BoundField > 
                <asp:BoundField DataField="NroCalle" HeaderText="Nro" >
                 <HeaderStyle CssClass="estiloHeaderTabla" Width="60px"></HeaderStyle>
                     <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                     </asp:BoundField > 
                <asp:BoundField DataField="Zona" HeaderText="Zona" >
                 <HeaderStyle CssClass="estiloHeaderTabla" Width="60px"></HeaderStyle>
                     <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                     </asp:BoundField > 
            </Columns>
        
        
        </asp:GridView>

           
   </fieldset>

        <fieldset class="fieldset" style="width:430px; margin-left:20px; height:auto">
        <legend class="titulo"> Órdenes de Trabajo Pendientes</legend>
           
         <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="idordentrabajo" DataSourceID="sdsOTCPendientes"
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="430px">
                     <RowStyle  BackColor="#E8EFF8" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="idordentrabajo" HeaderText="Orden" 
                    ReadOnly="True" SortExpression="idordentrabajo">
                    <HeaderStyle CssClass="estiloHeaderTabla" Width="60px"></HeaderStyle>
                     <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                     </asp:BoundField > 
                        
                <asp:BoundField DataField="fechainicio" HeaderText="Fecha Inicio" 
                    SortExpression="fechainicio">
                    <HeaderStyle CssClass="estiloHeaderTabla" Width="80px"></HeaderStyle>
                         <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                <asp:BoundField DataField="idguardiareclamo" HeaderText="Grupo" 
                    SortExpression="idguardiareclamo">
                    <HeaderStyle CssClass="estiloHeaderTabla" Width="60px"></HeaderStyle>
                         <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                <asp:BoundField DataField="descripcion" HeaderText="Zona" 
                    SortExpression="descripcion">
                <HeaderStyle CssClass="estiloHeaderTabla" Width="60px"></HeaderStyle>
                         <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                <asp:BoundField DataField="descripcion1" HeaderText="Estado" 
                    SortExpression="descripcion1">
            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                         <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
            </Columns>
                     <HeaderStyle CssClass="estiloHeaderTabla" />
        </asp:GridView>
        <asp:SqlDataSource ID="sdsOTCPendientes" runat="server" 
            ConnectionString="Data Source=localhost\sqlexpress;Initial Catalog=SISE;Integrated Security=True" 
            ProviderName="System.Data.SqlClient" SelectCommand="select otc.idordentrabajo, convert(char(10), otc.fechainicio, 103)AS fechainicio, otc.idguardiareclamo, z.descripcion, eotc.descripcion
from ordentrabajocorrectivo otc, estadootc eotc, domicilio d, zona z
where otc.idestadoot= eotc.idestadootc
and otc.iddomicilio=d.iddomicilio 
and d.idzona=z.idzona
and (otc.idestadoot = 1 or otc.idestadoot = 2) "></asp:SqlDataSource>
             
        </fieldset></asp:Panel>
        
        
    <asp:Panel ID="Panel3" runat="server" style="display:inline-flex">
     <fieldset class="fieldset" style="width:430px; ">
        <legend class="titulo"> Órdenes de Instalación Pendientes</legend>
         <asp:GridView ID="GvOIPendientes" runat="server" AutoGenerateColumns="False" 
             DataKeyNames="idordeninstalacion" DataSourceID="SdsOIPendientes"
             CellPadding="4" ForeColor="#333333" GridLines="None" Width="430px">
             <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
             <Columns>
                 <asp:BoundField DataField="idordeninstalacion" HeaderText="Orden" 
                     ReadOnly="True" SortExpression="idordeninstalacion">
                      <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                       </asp:BoundField> 
                 <asp:BoundField DataField="fechainstalacion" HeaderText="Fecha Instalacion" 
                     ReadOnly="True" SortExpression="fechainstalacion">
                      <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                       </asp:BoundField> 
                 <asp:BoundField DataField="idgrupogr" HeaderText="Grupo" 
                     SortExpression="idgrupogr">
                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                       </asp:BoundField>   
                 <asp:BoundField DataField="descripcion" HeaderText="Zona" 
                     SortExpression="descripcion">
                      <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                       </asp:BoundField > 
             </Columns>
             <HeaderStyle CssClass="estiloHeaderTabla" />
         </asp:GridView>
         <asp:SqlDataSource ID="SdsOIPendientes" runat="server" 
             ConnectionString="Data Source=localhost\sqlexpress;Initial Catalog=SISE;Integrated Security=True" 
             ProviderName="System.Data.SqlClient" SelectCommand="select oi.idordeninstalacion, convert(char(10), oi.fechainstalacion, 103)AS fechainstalacion, oi.idgrupogr, z.descripcion
FROM ordeninstalacion oi, pedidoinstalacion ped, zona z, domicilio d
where oi.idpedidoinstalacion=ped.idpedido
and  ped.iddomicilio=d.iddomicilio
and d.idzona =z.idzona
and oi.idestadoorden=1"></asp:SqlDataSource>
        </fieldset></asp:Panel>    

</ContentTemplate>
</asp:TabPanel>


</asp:TabContainer>

    
        

</asp:Content>

