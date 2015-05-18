<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true" CodeFile="InicioCapataz.aspx.cs" Inherits="InicioCapataz" Title="Página sin título" %>
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
        
        <asp:TabPanel ID="tabPanel2" runat="server" HeaderText="Preventivo" Width="75px">
<ContentTemplate>
<asp:Panel ID="Panel4" runat="server" EnableTheming="False" style="display:inline-flex" >
        <fieldset class="fieldset" >
        <legend class="titulo">Cortes de energía Programados</legend>
            <asp:GridView ID="GridCortes" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SdsCortes" style="border:none" Width="460px">
                <RowStyle  BackColor="#E8EFF8" ForeColor="#333333" CssClass="estiloFilasTabla" />
                <Columns>
                    <asp:BoundField DataField="idsubestacion" HeaderText="Subestacion" 
                        SortExpression="idsubestacion" >
                        <HeaderStyle CssClass="estiloHeaderTabla" Width="25px"></HeaderStyle>
                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="descripcion" HeaderText="Zona" 
                        SortExpression="descripcion" >
                      <HeaderStyle CssClass="estiloHeaderTabla" Width="25px"></HeaderStyle>
                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                    </asp:BoundField>  
                    <asp:BoundField DataField="fechainicio" HeaderText="Fecha Inicio" 
                        ReadOnly="True" SortExpression="fechainicio" >
                      <HeaderStyle CssClass="estiloHeaderTabla" Width="25px"></HeaderStyle>
                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                    </asp:BoundField>  
                    <asp:BoundField DataField="motivo" HeaderText="Motivo" 
                        SortExpression="motivo" >
                      <HeaderStyle CssClass="estiloHeaderTabla" Width="25px"></HeaderStyle>
                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                    </asp:BoundField>  
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SdsCortes" runat="server" 
                ConnectionString="Data Source=localhost\sqlexpress;Initial Catalog=SISE;Integrated Security=True" 
                ProviderName="System.Data.SqlClient" SelectCommand="select cp.idsubestacion,z.descripcion, convert(char(10), cp.fechainicio, 103)AS fechainicio, cp.motivo
from corteprogramado cp, zona z, domicilio d, subestacion s
where cp.idsubestacion=s.idsubestacion
and s.iddomicilio=d.iddomicilio
and d.idzona=z.idzona
and cp.fechainicio &gt; getdate()"></asp:SqlDataSource>
         </fieldset>
         
        <fieldset class="fieldset" >
        <legend class="titulo">Tareas Programadas</legend>
            <asp:GridView ID="GridTareas" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SdsTareas" style="border:none" Width="460px">
                  <RowStyle  BackColor="#E8EFF8" ForeColor="#333333" CssClass="estiloFilasTabla" />
                <Columns>
                    <asp:BoundField DataField="nombre" HeaderText="Tarea" 
                    SortExpression="nombre" >
                    <HeaderStyle CssClass="estiloHeaderTabla" Width="55px"></HeaderStyle>
                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                    </asp:BoundField> 
                    <asp:BoundField DataField="idcuadrilla" HeaderText="Cuadrilla" 
                        SortExpression="idcuadrilla" >
                        <HeaderStyle CssClass="estiloHeaderTabla" Width="15px"></HeaderStyle>
                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                    </asp:BoundField> 
                    <asp:BoundField DataField="fechainicio" HeaderText="Fecha Inicio" 
                        ReadOnly="True" SortExpression="fechainicio" >
                        <HeaderStyle CssClass="estiloHeaderTabla" Width="55px"></HeaderStyle>
                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                    </asp:BoundField> 
                    <asp:BoundField DataField="horainicio" HeaderText="Hora Inicio" ReadOnly="True" 
                        SortExpression="horainicio" >
                         <HeaderStyle CssClass="estiloHeaderTabla" Width="45px"></HeaderStyle>
                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                    </asp:BoundField> 
                    <asp:BoundField DataField="duracion" HeaderText="Duración (Días) " 
                        SortExpression="duracion">
                        <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                    </asp:BoundField >
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SdsTareas" runat="server" 
                ConnectionString="Data Source=localhost\sqlexpress;Initial Catalog=SISE;Integrated Security=True" 
                ProviderName="System.Data.SqlClient" SelectCommand="select tg.nombre, otp.idcuadrilla, convert(char(10), otp.fechainicio, 103)AS fechainicio, CONVERT(varchar(25), otp.horainicio, 108) AS horainicio,otp.duracion
from tareaplanificada tp, tareageneral tg, ordentrabajopreventivo otp
where tp.idtareageneral=tg.idtareageneral
and otp.idtareaplanificada=tp.idtareaplanificada
and otp.idestado=1"></asp:SqlDataSource>  
        </fieldset></asp:Panel>
   
       <asp:Panel ID="Panel1" runat="server" EnableTheming="False" style="display:inline-flex" >
        <fieldset class="fieldset" style="width:auto; height:120px">
        <legend class="titulo">Cuadrilla en Servicio</legend>
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="idcuadrilla,fechainicio" DataSourceID="sdsTurno" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="3" Width="316px">
                     <RowStyle  BackColor="#E8EFF8" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="idcuadrilla" HeaderText="Cuadrilla" ReadOnly="True" 
                    SortExpression="idcuadrilla">
                    <HeaderStyle CssClass="estiloHeaderTabla" Width="25px"></HeaderStyle>
                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                    </asp:BoundField>
                <asp:BoundField DataField="fechainicio" HeaderText="Fecha Inicio" 
                    SortExpression="fechainicio" ReadOnly="True">
                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                <asp:BoundField DataField="fechafin" HeaderText="Fecha Fin" 
                    SortExpression="fechafin">
                    <HeaderStyle CssClass="estiloHeaderTabla" Width="80px"></HeaderStyle>
                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                <asp:BoundField DataField="descripcion" HeaderText="Descripcion" 
                    SortExpression="descripcion">
                    <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
            </Columns>
            
                      <HeaderStyle CssClass="estiloHeaderTabla" />
            
        </asp:GridView>
        <asp:SqlDataSource ID="sdsTurno" runat="server" 
            ConnectionString="Data Source=localhost\sqlexpress;Initial Catalog=SISE;Integrated Security=True" 
            ProviderName="System.Data.SqlClient" SelectCommand="select hc.idcuadrilla,convert(char(10), hc.fechainicio, 103)AS fechainicio,convert(char(10), hc.fechafin, 103)AS fechafin, ec.descripcion
from historialcuadrilla hc, cuadrilla c, estadocuadrilla ec
where hc.idcuadrilla = c.idcuadrilla
and c.idestadocuadrilla = ec.idestadocuadrilla
and convert(nvarchar(10), getdate(),103) between hc.fechainicio and hc.fechafin"></asp:SqlDataSource>

</fieldset>

       
        <fieldset class="fieldset" style="width:auto">
        <legend class="titulo">Pedidos de Insumos </legend>
            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SdsPedidoInsumo"
                CellPadding="4" ForeColor="#333333" GridLines="None" Width="345px">
                <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="fechapedido" HeaderText="Fecha Pedido" 
                        SortExpression="fechapedido">
                        <HeaderStyle CssClass="estiloHeaderTabla" Width="56px"></HeaderStyle>
                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                    <asp:BoundField DataField="nombre" HeaderText="Insumo" 
                        SortExpression="nombre">
                        <HeaderStyle CssClass="estiloHeaderTabla" Width="51px"></HeaderStyle>
                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                    
                        </asp:BoundField> 
                        
                    <asp:BoundField DataField="cantidad" HeaderText="Cantidad" 
                        SortExpression="cantidad">
                        <HeaderStyle CssClass="estiloHeaderTabla" Width="10px"></HeaderStyle>
                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                    <asp:BoundField DataField="unidadmedida" HeaderText="Unidad" 
                        SortExpression="unidadmedida">
                        <HeaderStyle CssClass="estiloHeaderTabla" Width="10px"></HeaderStyle>
                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField> 
                </Columns>
                <HeaderStyle CssClass="estiloHeaderTabla" />
            </asp:GridView>
            <asp:SqlDataSource ID="SdsPedidoInsumo" runat="server" 
                ConnectionString="Data Source=localhost\sqlexpress;Initial Catalog=SISE;Integrated Security=True" 
                ProviderName="System.Data.SqlClient" SelectCommand="select convert(char(10), c.fechapedido, 103)AS fechapedido, i.nombre, dc.cantidad, i.unidadmedida
from insumo i, detallecontrato dc, contrato c
where dc.idcontrato=c.idcontrato
and dc.idinsumo=i.idinsumo
and (c.idestadocontrato=1 or c.idestadocontrato=2)"></asp:SqlDataSource>  
        </fieldset>
        
        <fieldset class="fieldset"  style="width:auto">
        <legend class="titulo">Pedidos de Herramientas</legend>
            <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SdsPedidoHerramienta" Width="257px" style="border:none">
            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="fechapedido" HeaderText="Fecha Pedido" SortExpression="fechapedido" 
                   >
                    <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="descripcion" HeaderText="Herramienta" 
                        SortExpression="descripcion"  >
                         <HeaderStyle CssClass="estiloHeaderTabla" Width="20px"></HeaderStyle>
                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                    </asp:BoundField>    
                    <asp:BoundField DataField="cantidad" HeaderText="Cantidad" 
                        SortExpression="cantidad" >
                         <HeaderStyle CssClass="estiloHeaderTabla" Width="10px"></HeaderStyle>
                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                    </asp:BoundField>    
                    
                </Columns>
            <HeaderStyle CssClass="estiloHeaderTabla" />
            
            </asp:GridView>
            <asp:SqlDataSource ID="SdsPedidoHerramienta" runat="server" 
                ConnectionString="Data Source=localhost\sqlexpress;Initial Catalog=SISE;Integrated Security=True" 
                ProviderName="System.Data.SqlClient" SelectCommand="select convert(char(10), c.fechapedido, 103)AS fechapedido, h.descripcion, dc.cantidad
from herramienta h, detallecontrato dc, contrato c
where dc.idcontrato=c.idcontrato
and dc.idherramienta=h.idherramienta
and (c.idestadocontrato=1 or c.idestadocontrato=2)"></asp:SqlDataSource> 
        </fieldset></asp:Panel>



</ContentTemplate>
</asp:TabPanel>
 </asp:TabContainer>
</asp:Content>

