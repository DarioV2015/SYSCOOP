<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true" CodeFile="AsignarHerramientaACuadrilla.aspx.cs" Inherits="MPreventivo_AsignarHerramientaACuadrilla" Title="Página sin título" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
           height: 23px;
       }
       
       .style10
       {
           height: 25px;
       }
       .style11
       {
           width: 100%;
       }
       
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table class="style9">
                <tr>
                    <td style="text-align: right" class="style10" colspan="5">
                        <asp:Panel ID="Panel1" runat="server">
                            <table style="margin-left:23px">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label23" runat="server" Text="Mes:"></asp:Label>
                                    </td>
                                    <td style="text-align: left">
                                        <asp:DropDownList ID="ddlMes" runat="server" AutoPostBack="True" 
                                            onselectedindexchanged="ddlMes_SelectedIndexChanged">
                                            <asp:ListItem Selected="True" Value="1">Enero</asp:ListItem>
                                            <asp:ListItem Value="2">Febrero</asp:ListItem>
                                            <asp:ListItem Value="3">Marzo</asp:ListItem>
                                            <asp:ListItem Value="4">Abril</asp:ListItem>
                                            <asp:ListItem Value="5">Mayo</asp:ListItem>
                                            <asp:ListItem Value="6">Junio</asp:ListItem>
                                            <asp:ListItem Value="7">Julio</asp:ListItem>
                                            <asp:ListItem Value="8">Agosto</asp:ListItem>
                                            <asp:ListItem Value="9">Septiembre</asp:ListItem>
                                            <asp:ListItem Value="10">Octubre</asp:ListItem>
                                            <asp:ListItem Value="11">Noviembre</asp:ListItem>
                                            <asp:ListItem Value="12">Diciembre</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td width="53px">
                                        <asp:Label ID="Label24" runat="server" Text="Año:"></asp:Label>
                                    </td>
                                    <td style="text-align: left;">
                                        <asp:DropDownList ID="ddlAño" runat="server" AutoPostBack="True" 
                                            onselectedindexchanged="ddlAño_SelectedIndexChanged" Width="101px">
                                            <asp:ListItem Selected="True">2010</asp:ListItem>
                                            <asp:ListItem>2011</asp:ListItem>
                                            <asp:ListItem>2012</asp:ListItem>
                                            <asp:ListItem>2013</asp:ListItem>
                                            <asp:ListItem>2014</asp:ListItem>
                                            <asp:ListItem>2015</asp:ListItem>
                                            <asp:ListItem>2016</asp:ListItem>
                                            <asp:ListItem>2017</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                </table>
                <table>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label4" runat="server" Text="Cuadrilla:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCuadrilla" runat="server" AutoPostBack="True" >
                        </asp:DropDownList>
                    </td>
                    <td width="7px"></td>
                    <td colspan="3" style="border-left-style: outset">
                        <asp:Label ID="lblMensajeCuadrilla1" runat="server"></asp:Label>
                        <asp:ListView ID="ListView1" runat="server" 
                            DataSourceID="sdsEmpleadoXCuadrilla" style="margin-left:10px">
                            <ItemTemplate>
                                <asp:Label ID="DESCRIPCIONLabel" runat="server" Font-Italic="True" 
                                    Font-Size="Medium" Text='<%# Eval("DESCRIPCION") %>'></asp:Label>
                                <br />
                                Legajo
                                <asp:Label ID="IDEMPLEADOLabel" runat="server" Text='<%# Eval("IDEMPLEADO") %>'></asp:Label>
                                -
                                <asp:Label ID="APELLIDOLabel" runat="server" Text='<%# Eval("APELLIDO") %>'></asp:Label>
                                ,
                                <asp:Label ID="NOMBRELabel" runat="server" Text='<%# Eval("NOMBRE") %>'></asp:Label>
                                <br />
                                <br />
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <span>No se han encontrado CUADRILLAS DISPONIBLES</span>
                            </EmptyDataTemplate>
                            <LayoutTemplate>
                                <div ID="itemPlaceholderContainer" runat="server" style="font-family: Calibri; margin-left:10px">
                                    <span><span ID="itemPlaceholder" runat="server"></span></span></span>
                                </div>
                            </LayoutTemplate>
                        </asp:ListView>
                    </td>
                </tr>
                </table>
                <table width="800px">
                <tr>
                    <td colspan="5">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="5">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="border-bottom-style: inset" height="25px">
                        <asp:Label ID="Label8" runat="server" Font-Italic="True" Font-Size="Medium" 
                            Text="Herramientas YA ASIGNADAS"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style15" colspan="5">
                        <asp:Label ID="LblMensaje" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                </table>
                <table>
                <tr>
                    <td class="style15" colspan="5">
                        <asp:GridView ID="gvHerramientasAsignadas" runat="server" 
                                            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                                            GridLines="None" HeaderStyle-CssClass="estiloHeaderTabla" 
                                            onrowcommand="gvHerramientasAsignadas_RowCommand" 
                                            onselectedindexchanged="gvHerramientasAsignadas_SelectedIndexChanged" 
                                            style="margin-left:165px">
                                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                            <Columns>
                                                <asp:BoundField DataField="NroHerramienta" HeaderStyle-Width="65px" 
                                                    HeaderText="Nro. Herramienta" ItemStyle-CssClass="estiloHeaderTabla" 
                                                    SortExpression="NroHerramienta">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px" />
                                                    <ItemStyle CssClass="estiloFilasTabla" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Descripcion" HeaderStyle-Width="65px" 
                                                    HeaderText="Herramienta" ItemStyle-CssClass="estiloHeaderTabla" 
                                                    SortExpression="Descripcion">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px" />
                                                    <ItemStyle CssClass="estiloFilasTabla" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="NroLote" HeaderStyle-Width="65px" 
                                                    HeaderText="Nro. Lote" ItemStyle-CssClass="estiloHeaderTabla" 
                                                    SortExpression="NroLote">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px" />
                                                    <ItemStyle CssClass="estiloFilasTabla" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="FechaVencimiento" HeaderStyle-Width="65px" 
                                                    HeaderText="Fecha Vencimiento" ItemStyle-CssClass="estiloHeaderTabla" 
                                                    ReadOnly="True" SortExpression="FechaVencimiento">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px" />
                                                    <ItemStyle CssClass="estiloFilasTabla" />
                                                </asp:BoundField>
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:Button ID="btnEliminarAsignada" runat="server" CausesValidation="false" 
                                                            CommandArgument='<%# Eval("nroHerramienta") %>' CommandName="DeleteRow" 
                                                            ItemStyle-CssClass="estiloHeaderTabla" Text="Eliminar" />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px" />
                                                    <ItemStyle CssClass="estiloFilasTabla" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle CssClass="estiloHeaderTabla" />
                                        </asp:GridView></td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                </table>
                <table width="800px">
                <tr>
                    <td style="border-bottom-style: inset" height="25px">
                        <asp:Label ID="Label5" runat="server" Text="Herramientas A ASIGNAR" Font-Italic="True" 
                            Font-Size="Medium"></asp:Label>
                    </td>
                </tr>
                </table>
                <table width="700px">
                <tr>
                    <td class="style11">
                    </td>
                    <td class="style11">
                    </td>
                    <td class="style11">
                    </td>
                    <td class="style11">
                    </td>
                    <td class="style11">
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label6" runat="server" Text="Tipo Herramienta:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTipoHerramienta" runat="server" 
                            DataSourceID="sdsTipoHerramienta" DataTextField="DESCRIPCION" 
                            DataValueField="IDTIPOHERRAMIENTA" AutoPostBack="True" 
                            onselectedindexchanged="ddlTipoHerramienta_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td width="5px"></td>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Herramienta:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlHerramienta" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" 
                            onclick="btnAgregar_Click" />
                    </td>
                </tr>
                </table>
                <table>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="5" class="style9">
                    <asp:GridView ID="gvHerramientas" runat="server" AutoGenerateColumns="False" 
                            onrowcommand="gvHerramienta_RowCommand" HeaderStyle-CssClass="estiloHeaderTabla" 
                            CellPadding="4" ForeColor="#333333" GridLines="None" style="margin-left:15px" Width="600px">
                            <RowStyle  BackColor="#E8EFF8" ForeColor="#333333" />
                            
                            <Columns>
                                <asp:BoundField DataField="NroHerramienta" HeaderText="Herramienta" 
                                    SortExpression="NroHerramienta" HeaderStyle-Width="55px" ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="55px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                
                                
                                <asp:BoundField DataField="Descripcion" HeaderText="Nombre" 
                                    SortExpression="Descripcion" HeaderStyle-Width="55px" ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="55px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                               
                               
                               <asp:BoundField DataField="NroLote" HeaderText="Nro. Lote" 
                                    SortExpression="NroLote" HeaderStyle-Width="45px" ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="45px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                
                                
                                <asp:BoundField DataField="FechaVencimiento" HeaderText="Fecha Vencimiento" 
                                    SortExpression="FechaVencimiento" HeaderStyle-Width="95px" ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="95px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                    
                                <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                <asp:Button ID="btnEliminar" CommandArgument='<%# Eval("nroHerramienta") %>' CommandName="DeleteRow" runat="server" CausesValidation="false" Text="Eliminar" 
                                ItemStyle-CssClass="estiloHeaderTabla" Width="90px" />
                                </ItemTemplate>
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="55px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: left" colspan="5">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                                     
                     <asp:Button ID="btnAsignar" runat="server" Text="Asignar" onclick="btnAsignar_Click" style="margin-left:200px" 
                            ValidationGroup="1" />
                     
                   
                      <asp:Button ID="btnCancelar" runat="server" Text="Cancelar"  onclick="btnCancelar_Click" />                  
               
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
                             runat="server" TargetControlID="LinkButton2" BackgroundCssClass="reveal-modal-bg" >
                            </asp:ModalPopupExtender>

                            
                    <span style="display: none">
                            <asp:LinkButton ID="LinkButton3" runat="server">LinkButton</asp:LinkButton>
                    </span>
                            <asp:ModalPopupExtender ID="ModalPopupExito" PopupControlID="popUpExito"
                             runat="server" TargetControlID="LinkButton3" BackgroundCssClass="reveal-modal-bg">
                            </asp:ModalPopupExtender>
                            
                    
                            
                    </ContentTemplate>
                </asp:UpdatePanel>
                        
                        
                        </td>
                </tr>
                <tr>
                    <td colspan="5">
                        &nbsp;</td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo" >
            <div class="heading">
                <asp:Label ID="Label1" runat="server" Text="¿Desea asignar las HERRAMIENTAS a la CUADRILLA?" ></asp:Label>
                <br />
                </div >
                <div class="content" style="height:100px;border-top: 0.1px solid #bababa">
                <div style="margin-right:15px;text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Always">
              
                <ContentTemplate>
              
                    <asp:Button ID="btnAceptarRegistrar" runat="server" Text="Aceptar" onclick="btnAceptarRegistrar_Click" CssClass="botonPopUp" />
                    <asp:Button ID="btnCancelarRegistrar" runat="server" Text="Cancelar" onclick="btnCancelarRegistrar_Click"/>
                 
                </ContentTemplate>
                    
                </asp:UpdatePanel>
                </div>
                </div>
            </asp:Panel>
            
     
    
     <asp:Panel ID="popUpCancelarRegistrar" runat="server" Style="display: none" CssClass="divFondo">
     <div style="float:left; width:40px; margin-left: 20px;margin-top: 3px;">
        <asp:Image ID="Image2" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="40px" />
    </div>
    <div class="heading" style="width:360px">
        <asp:Label ID="Label2" runat="server" Text="Se perderán los datos ingresados" style="margin-right:25px"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" Text="¿Desea Continuar?"></asp:Label>
        </div>
        <div class="content" style="height:100px;border-top: 0.1px solid #bababa; width:360px">
        <div style="margin-right:15px;text-align: center">
        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Button ID="btnAceptarCancelacion" runat="server" Text="Aceptar" CausesValidation="False" onclick="btnAceptarCancelacion_Click" style="margin-top:50px"/>
            <asp:Button ID="btnCancelarCancelacion" runat="server" Text="Cancelar" CausesValidation="False" onclick="btnCancelarCancelacion_Click"/>
        </ContentTemplate>
        </asp:UpdatePanel>
        </div>
        </div>
    </asp:Panel>
  
    <asp:Panel ID="popUpExito" runat="server" Style="display: none" CssClass="divFondo" Width="400px">
    <div style="float:left; width:40px; margin-left: 20px;margin-top: 3px;">
        <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="36px" />
    </div>

     <div class="heading" style="width:400px">
        <asp:Label ID="Label22" runat="server" Text="Las HERRAMIENTAS fueron asignadas con éxito" style="margin-right:15px"></asp:Label>
        <br />
        </div>
        <div class="content" style="height:100px;border-top: 0.1px solid #bababa;width:400px"   >
        <div style="margin-right:15px;text-align: center">
        <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" CausesValidation="False" onclick="btnAceptarConfirmacion_Click"
            CssClass="botonPopUp" />        
        </ContentTemplate>
        </asp:UpdatePanel>
        </div>
        </div>
    </asp:Panel>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
                        <asp:SqlDataSource ID="sdsEmpleadoXCuadrilla" runat="server" 
                            ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                            ProviderName="System.Data.SqlClient" SelectCommand="SELECT C.DESCRIPCION, EXC.IDEMPLEADO, P.APELLIDO, P.NOMBRE
  FROM EMPLEADOPORCUADRILLA EXC, EMPLEADO E, PERSONA P, CARGOEMPLEADO C
  WHERE EXC.IDEMPLEADO = E.IDEMPLEADO
  AND E.IDTIPODOCUMENTO=P.TIPODOCUMENTO
  AND E.NRODOCUMENTO=P.NRODOCUMENTO
  AND E.IDCARGO=C.IDCARGOEMPLEADO
  AND EXC.IDCUADRILLA=@idCuadrilla">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlCuadrilla" Name="idCuadrilla" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsTipoHerramienta" runat="server" 
        ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT * FROM [TIPOHERRAMIENTA]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="sdsCuadrilla" runat="server" 
                            ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                            ProviderName="System.Data.SqlClient" 
                            
                            
        SelectCommand="SELECT * FROM CUADRILLA WHERE IDESTADOCUADRILLA = 1 OR IDESTADOCUADRILLA = 2">
                        </asp:SqlDataSource>
                        </asp:Content>

