<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true" CodeFile="RegistrarCuadrilla.aspx.cs" Inherits="MPreventivo_RegistrarCuadrilla" Title="Página sin título" %>
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
            text-align:center;
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
           height: 19px;
       }
       .style11
       {
           height: 23px;
           text-align: left;
       }
       .style12
       {
           height: 26px;
           text-align: left;
       }
       .style13
       {
           height: 26px;
           text-align: right;
       }
       .style14
       {
           height: 25px;
           text-align: left;
       }
       .style15
       {
           height: 27px;
           text-align: left;
       }
       .style16
       {
           height: 23px;
       }
       .style19
       {
           height: 26px;
           text-align: center;
       }
       .style20
       {
           height: 26px;
           text-align: left;
           width: 10px;
       }
       </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="margin-left:45px">

                <tr>
                    
                     <td style="text-align: right">
                            <asp:Label ID="Label19" runat="server" Text="Mes:"></asp:Label></td>
                        <td colspan="0">
                            
                             
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
                    
                     <td style="text-align: right; width:50px">
                            <asp:Label ID="Label20" runat="server" Text="Año:"></asp:Label></td>
                     <td colspan="0">
                            
                             
                         <asp:DropDownList ID="ddlAño" runat="server" AutoPostBack="True" Width="101px" 
                             onselectedindexchanged="ddlAño_SelectedIndexChanged">
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
            <table>
                <tr>
                    <td style="text-align: right">
                        &nbsp;</td>
                    <td colspan="0">
                        &nbsp;</td>
                    <td style="text-align: right">
                        &nbsp;</td>
                    <td colspan="0">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            
                <tr style="border-bottom-style: groove">
                    <td style="text-align: right" class="style11" rowspan="3"  >
                        <asp:Label ID="Label4" runat="server" Text="Nro. Cuarilla:"></asp:Label>
                    </td>
                    <td class="style11" rowspan="3">
                        <asp:DropDownList ID="ddlCuadrilla" runat="server" AutoPostBack="True" 
                              onselectedindexchanged="ddlCuadrilla_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                   
                    <td>
                        <asp:Button ID="btnNuevaCuadrilla" runat="server" 
                            onclick="btnNuevaCuadrilla_Click" Text="Nueva" Width="100px" />
                    </td>
                    <td width="5px"></td>
                    <td style="border-left-style: outset; border-left-width:2px" colspan="2" rowspan="3">
                        <asp:Label ID="lblMensajeCuadrilla" runat="server"></asp:Label>
                        <asp:ListView ID="ListViewCuadrilla" runat="server" 
                            DataSourceID="sdsEmpleadoXCuadrilla" style="margin-left:10px">
                            <ItemTemplate>
                                <asp:Label ID="DESCRIPCIONLabel" runat="server" 
                                    Text='<%# Eval("DESCRIPCION") %>' Font-Size="Medium" Font-Italic="True"></asp:Label>
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
                                <span style="margin-left:10px">No se han encontrado CUADRILLAS DISPONIBLES</span>
                            </EmptyDataTemplate>
                            
                            <LayoutTemplate>
                                <div ID="itemPlaceholderContainer" runat="server" 
                                    style="font-family: Calibri; margin-left:10px">
                                    
                                    <span ><span ID="itemPlaceholder" 
                                        runat="server"></span></span></span>
                                </div>
                            </LayoutTemplate>
                            
                        </asp:ListView>
                    </td>
                </tr>
                <tr style="border-bottom-style: groove">
                    <td>
                        <asp:Button ID="btnReemplazar" runat="server" onclick="btnReemplazar_Click" 
                            Text="Reemplazar" Width="100px"  />
                    </td>
                </tr>
                <tr style="border-bottom-style: groove">
                    <td>
                        <asp:Button ID="btnDarBaja" runat="server" onclick="btnDarBaja_Click" 
                            Text="Eliminar" Width="100px" />
                    </td>
                </tr>
                <tr style="border-left-width: medium; border-bottom-style: groove">
                    <td colspan="5" class="style16">
                        <asp:Label ID="lblMensajeNoPuedeReemplazar" runat="server" ForeColor="Red"></asp:Label>
                        <asp:Label ID="lblFechaCuadrillaReemplazada" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                </tr>

                </table>
                

                 
                
                <table width="800px">
                <tr style="border-left-width: medium; border-bottom-style: groove">
                    <td colspan="4" 

                        
                        style="background: -webkit-linear-gradient(180deg, #FFFFFF, #E0ECF8); border-left-style: outset">
                        <asp:Label ID="Label5" runat="server" Font-Italic="True" Font-Size="Medium" 
                            Text="Capataz     "></asp:Label>
                        <asp:Label ID="lblMensajeCapataz" runat="server" Font-Italic="True" 
                            ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style14">
                        <asp:Label ID="lblLegajoCapataz" runat="server" Text="Legajo" style="margin-left:10px"></asp:Label>
                    </td>
                    <td class="style14" >
                        <asp:Label ID="lblApellidoCapataz" runat="server" Text="Apellido" style="margin-left:10px"></asp:Label>
                    </td>
                    <td class="style14" colspan="2">
                        <asp:Label ID="lblNombreCapataz" runat="server" Text="Nombre" style="margin-left:10px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style14" width="200px">
                        <asp:DropDownList ID="ddlLegajoCapataz" runat="server" Enabled="False" 
                            onselectedindexchanged="ddlLegajoCapataz_SelectedIndexChanged" 
                            AutoPostBack="True" >
                        </asp:DropDownList>
                     </td>
                    <td class="style11" width="200px">
                        <asp:TextBox ID="txtApellidoCapataz" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                    <td colspan="2" width="200px">
                        <asp:TextBox ID="txtNombreCapataz" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                   
                    
                </tr>
                <tr>
                    <td class="style15" colspan="4">
                    </td>
                </tr>
                <tr style="border-left-width: medium; border-bottom-style: groove">
                    <td colspan="4" 

                        
                        style="background: -webkit-linear-gradient(180deg, #FFFFFF, #E0ECF8); border-left-style: outset">
                        <asp:Label ID="Label6" runat="server" Font-Italic="True" Font-Size="Medium" 
                            Text="Oficial     "></asp:Label>
                        <asp:Label ID="lblMensajeOficial" runat="server" Font-Italic="True" 
                            ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
            
            
                <tr>
                    <td class="style14">
                        <asp:Label ID="lblLegajo0" runat="server" Text="Legajo" style="margin-left:10px"></asp:Label>
                        <td class="style14">
                            <asp:Label ID="lblApellido0" runat="server" Text="Apellido" style="margin-left:10px"></asp:Label>
                        </td>
                        <td class="style19" width="40px">
                            <asp:Label ID="lblNombre0" runat="server" Text="Nombre" style=" margin-right:100px"></asp:Label>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </td>
                </tr>
                <tr>
                    <td class="style11">
                        <asp:DropDownList ID="ddlLegajoOficial" runat="server" Enabled="False" 
                            onselectedindexchanged="ddlLegajoOficial_SelectedIndexChanged" 
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td class="style14">
                        <asp:TextBox ID="txtApellidoOficial" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNombreOficial" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style12" colspan="4">
                        </td>
                </tr>
                <tr style="border-left-width: medium; border-bottom-style: groove">
                    <td colspan="4" 
                        
                        
                        style="background: -webkit-linear-gradient(180deg, #FFFFFF, #E0ECF8); border-left-style: outset">
                        <asp:Label ID="Label7" runat="server" Font-Italic="True" Font-Size="Medium" 
                            Text="Medio Oficial     "></asp:Label>
                        <asp:Label ID="lblMensajeMedioO" runat="server" Font-Italic="True" 
                            ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style14">
                        <asp:Label ID="lblLegajo1" runat="server" Text="Legajo" style="margin-left:10px"></asp:Label>
                    </td>
                    <td class="style14">
                        <asp:Label ID="lblApellido1" runat="server" Text="Apellido" style="margin-left:10px"></asp:Label>
                    </td>
                    <td class="style14" colspan="2">
                        <asp:Label ID="lblNombre1" runat="server" Text="Nombre" style="margin-left:10px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style14">
                        <asp:DropDownList ID="ddlLegajoMedioOf" runat="server" Enabled="False" 
                            onselectedindexchanged="ddlLegajoMedioOf_SelectedIndexChanged" 
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td class="style11">
                        <asp:TextBox ID="txtApellidoMedioOf" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNombreMedioOf" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style11" colspan="4">
                        &nbsp;</td>
                </tr>
                <tr style="border-left-width: medium; border-bottom-style: groove">
                    <td colspan="4" 
                        
                        
                        style="background: -webkit-linear-gradient(180deg, #FFFFFF, #E0ECF8); border-left-style: outset">
                        <asp:Label ID="Label1" runat="server" Font-Italic="True" Font-Size="Medium" 
                            Text="Ayudante     "></asp:Label>
                        <asp:Label ID="lblMensajeAyudante" runat="server" Font-Italic="True" 
                            ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style14">
                        <asp:Label ID="Label2" runat="server" Text="Legajo" style="margin-left:10px"></asp:Label>
                    </td>
                    <td class="style14">
                        <asp:Label ID="Label3" runat="server" Text="Apellido" style="margin-left:10px"></asp:Label>
                    </td>
                    <td class="style14" colspan="2">
                        <asp:Label ID="Label8" runat="server" Text="Nombre" style="margin-left:10px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="ddlLegajoAyudante" runat="server" Enabled="False" 
                            onselectedindexchanged="ddlLegajoAyudante_SelectedIndexChanged" 
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="txtApellidoAyudante" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNombreAyudante" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style11" colspan="4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style19" colspan="4">
                        </td>
                </tr>
                </table>
                 
                <table width="800px">
                <tr>
                    <td  style="border-bottom-style: inset" height="25px">
                    &nbsp;
                        <asp:Label ID="Label9" runat="server" Font-Italic="True" Font-Size="Medium" 
                            Text="Vehículo"></asp:Label>
                    </td>
                </tr>
                </table>
                <table>
                <tr>
                    <td  colspan="4">
                        <asp:FormView ID="FormViewVehiculoAsignado" runat="server" Visible="False" 
                            DataKeyNames="IDVEHICULO" DataSourceID="SqlVehiculoAsignado">
                            <EditItemTemplate>
                                IDVEHICULO:
                                <asp:Label ID="IDVEHICULOLabel1" runat="server" 
                                    Text='<%# Eval("IDVEHICULO") %>' />
                                <br />
                                MARCA:
                                <asp:TextBox ID="MARCATextBox" runat="server" Text='<%# Bind("MARCA") %>' />
                                <br />
                                DOMINIO:
                                <asp:TextBox ID="DOMINIOTextBox" runat="server" Text='<%# Bind("DOMINIO") %>' />
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Actualizar" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                    CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                IDVEHICULO:
                                <asp:TextBox ID="IDVEHICULOTextBox" runat="server" 
                                    Text='<%# Bind("IDVEHICULO") %>' />
                                <br />
                                MARCA:
                                <asp:TextBox ID="MARCATextBox" runat="server" Text='<%# Bind("MARCA") %>' />
                                <br />
                                DOMINIO:
                                <asp:TextBox ID="DOMINIOTextBox" runat="server" Text='<%# Bind("DOMINIO") %>' />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                    CommandName="Insert" Text="Insertar" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                    CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                IDVEHICULO:
                                <asp:Label ID="IDVEHICULOLabel" runat="server" 
                                    Text='<%# Eval("IDVEHICULO") %>' />
                                <br />
                                MARCA:
                                <asp:Label ID="MARCALabel" runat="server" Text='<%# Bind("MARCA") %>' />
                                <br />
                                DOMINIO:
                                <asp:Label ID="DOMINIOLabel" runat="server" Text='<%# Bind("DOMINIO") %>' />
                                <br />
                            </ItemTemplate>
                        </asp:FormView>
                    </td>
                </tr>
                <tr>
                    <td class="style11" colspan="4">
                        <asp:GridView ID="gvVehículo" runat="server" AutoGenerateColumns="False" 
                            DataKeyNames="IDVEHICULO" DataSourceID="sdsVehiculo" HeaderStyle-CssClass="estiloHeaderTabla" 
                            CellPadding="4" ForeColor="#333333" GridLines="None" 
                            style="margin-left:10px; margin-top:0px" Visible="False">
                            <RowStyle  BackColor="#E8EFF8" ForeColor="#333333" />
                            <Columns>
                            
                            <asp:TemplateField>
                            <ItemTemplate>
                                <asp:RadioButton ID="gvVehículo_rdbSeleccionar" runat="server" 
                                    oncheckedchanged="gvVehículo_rdbSeleccionar_CheckedChanged" onclick="RadioCheckOnly(this);" Width="30px" />
                            </ItemTemplate>
                            <ItemStyle CssClass="estiloFilasTabla" Width="20px"></ItemStyle>
                            </asp:TemplateField>                           
                            
                            <asp:BoundField DataField="IDVEHICULO" HeaderText="Vehiculo" ReadOnly="True" 
                                    SortExpression="IDVEHICULO" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                            </asp:BoundField>
                                
                            <asp:BoundField DataField="MARCA" HeaderText="Marca" SortExpression="MARCA" 
                                    ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                            </asp:BoundField>
                            
                            <asp:BoundField DataField="DOMINIO" HeaderText="Dominio" SortExpression="DOMINIO" 
                                    ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                            </asp:BoundField>
                        
                          <asp:BoundField DataField="FECHAALTA" HeaderText="Fecha Alta" 
                                    SortExpression="FECHAALTA" ItemStyle-CssClass="estiloHeaderTabla">
                          <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                         <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        </Columns>
                            <HeaderStyle CssClass="estiloHeaderTabla" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                </table>
                <table width="800px">
                <tr>
                    <td  style="border-bottom-style: inset" height="25px">
                       &nbsp;
                        <asp:Label ID="Label10" runat="server" Font-Italic="True" Font-Size="Medium" 
                            Text="Herramientas"></asp:Label>
                    </td>
                </tr>
                </table>
                <table>
                <tr>
                    <td class="style11">
                        &nbsp;</td>
                    <td class="style11">
                        &nbsp;</td>
                    <td class="style11">
                        &nbsp;</td>
                    <td class="style11" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style13" width="140px">
                        <asp:Label ID="lblTipoHerramienta" runat="server" Text="Tipo de Herramienta:"></asp:Label>
                    </td>
                    <td class="style12" width="90px">
                        <asp:DropDownList ID="ddlTipoHerramienta" runat="server" AutoPostBack="True" 
                            DataSourceID="sdstipoHerramienta" DataTextField="DESCRIPCION" 
                            DataValueField="IDTIPOHERRAMIENTA" Enabled="False" 
                            onselectedindexchanged="ddlTipoHerramienta_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td class="style13" width="90px">
                        <asp:Label ID="lblHerramienta" runat="server" Text="Herramienta:"></asp:Label>
                    </td>
                    <td class="style12" width="30px">
                        <asp:DropDownList ID="ddlHerramienta" runat="server" AutoPostBack="True" 
                             Enabled="False">
                        </asp:DropDownList>
                    </td>
                    <td class="style20">
                        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" 
                            onclick="btnAgregar_Click" Enabled="False" />
                    </td>
                </tr>
                <tr>
                    <td >
                        </td>
                    <td >
                        </td>
                    <td >
                        </td>
                    <td colspan="2">
                        </td>
                </tr>
                <tr>
                   <td class="style11" colspan="5" align="center" >
                        <asp:GridView ID="gvHerramientas" runat="server" AutoGenerateColumns="False" 
                            onrowcommand="gvHerramienta_RowCommand" HeaderStyle-CssClass="estiloHeaderTabla" 
                            CellPadding="4" ForeColor="#333333" GridLines="None" style="margin-left:10px; width:550px">
                            <RowStyle  BackColor="#E8EFF8" ForeColor="#333333" />
                            
                            <Columns>
                                <asp:BoundField DataField="NroHerramienta" HeaderText="Herramienta" 
                                    SortExpression="NroHerramienta" HeaderStyle-Width="45px" ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="45px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                
                                
                                <asp:BoundField DataField="Descripcion" HeaderText="Nombre" 
                                    SortExpression="Descripcion" HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                               
                               
                               <asp:BoundField DataField="NroLote" HeaderText="Lote" 
                                    SortExpression="NroLote" HeaderStyle-Width="55px" ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="55px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                
                                
                                <asp:BoundField DataField="FechaVencimiento" HeaderText="Fecha Vencimiento" 
                                    SortExpression="FechaVencimiento" HeaderStyle-Width="105px" ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="105px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                    
                                <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                <asp:Button ID="btnEliminar" CommandArgument='<%# Eval("nroHerramienta") %>' CommandName="DeleteRow" runat="server" CausesValidation="false" 
                                Text="Eliminar" ItemStyle-CssClass="estiloHeaderTabla" Width="90px" />
                                </ItemTemplate>
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="45px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="style15">
                        </td>
                    <td class="style15">
                        </td>
                    <td class="style15">
                        </td>
                    <td class="style15" colspan="2">
                        </td>
                </tr>
                <tr>
                    <td class="style15" colspan="5">
                        <asp:GridView ID="gvHerramientasAsignadas" runat="server" 
                            AutoGenerateColumns="False" DataSourceID="sdsHerramientasAsignadas" HeaderStyle-CssClass="estiloHeaderTabla" 
                            CellPadding="4" ForeColor="#333333" GridLines="None" 
                            style="margin-left:165px" Visible="False">
                            <RowStyle  BackColor="#E8EFF8" ForeColor="#333333" />
                            
                            <Columns>
                                <asp:BoundField DataField="IDHERRAMIENTA" HeaderText="Nro. Herramienta" 
                                    SortExpression="IDHERRAMIENTA" HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                    
                                <asp:BoundField DataField="DESCRIPCION" HeaderText="Herramienta" 
                                    SortExpression="DESCRIPCION" HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                    
                                <asp:BoundField DataField="NROLOTE" HeaderText="Nro. Lote" 
                                    SortExpression="NROLOTE" HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                    
                                <asp:BoundField DataField="Column1" HeaderText="Fecha Vencimiento" 
                                    ReadOnly="True" SortExpression="Column1" HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle CssClass="estiloHeaderTabla" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="style11" colspan="5">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="BTNGuardar" runat="server" onclick="BTNGuardar_Click" Text="Guardar" style="margin-left:250px"/>
                        <asp:Button ID="BTNCanelar" runat="server" Text="Cancelar" onclick="BTNCanelar_Click" />                  
                   
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
                            
                    <span style="display: none">
                            <asp:LinkButton ID="LinkButton4" runat="server">LinkButton</asp:LinkButton>
                    </span>
                            <asp:ModalPopupExtender ID="ModalPopupCuadrillaNOReemplazable" PopupControlID="popUpCuadrillaNOReemplazable"
                             runat="server" TargetControlID="LinkButton4" BackgroundCssClass="reveal-modal-bg">
                            </asp:ModalPopupExtender>
                            
                    </ContentTemplate>
                </asp:UpdatePanel>
                        </td>
                </tr>
                <tr>
                    <td class="style11" colspan="5">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style11" colspan="5">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="5">
                        <asp:SqlDataSource ID="sdsCuadrilla" runat="server" 
                            ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                            ProviderName="System.Data.SqlClient" 
                            SelectCommand="SELECT DISTINCT(HC.IDCUADRILLA)
FROM HISTORIALCUADRILLA HC 
WHERE MONTH(HC.FECHAINICIO)=@mes
AND YEAR(HC.FECHAINICIO)=@año">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlMes" Name="mes" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlAño" Name="año" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="sdsVehiculo" runat="server" 
                            ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                            ProviderName="System.Data.SqlClient" 
                            SelectCommand="SELECT DISTINCT V.IDVEHICULO, V.MARCA, V.DOMINIO, V.FECHAALTA
FROM VEHICULO V
WHERE V.IDVEHICULO NOT IN(
SELECT HV.IDVEHICULO
FROM HISTORIALVEHICULO HV
WHERE MONTH(HV.FECHAINICIO)=@mes
AND YEAR(HV.FECHAFIN)=@año
AND HV.IDESTADO=2)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlMes" Name="mes" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlAño" Name="año" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="sdsHerramienta" runat="server" 
                            ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                            ProviderName="System.Data.SqlClient" SelectCommand="SELECT IDHERRAMIENTA, DESCRIPCION
FROM HERRAMIENTA
WHERE IDTIPOHERRAMIENTA = @idTipoHerramienta
AND ESTADOHERRAMIENTA = 1
AND FECHAVENCIMIENTO &gt; GETDATE()">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlTipoHerramienta" Name="idTipoHerramienta" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlVehiculoAsignado" runat="server" 
                            ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                            ProviderName="System.Data.SqlClient" SelectCommand="SELECT V.IDVEHICULO, V.MARCA, V.DOMINIO FROM VEHICULO V, HISTORIALVEHICULO HV
                    WHERE HV.IDVEHICULO=V.IDVEHICULO                     
                    AND HV.IDCUADRILLA= @Cuadrilla 
                    AND HV.IDESTADO = 2">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlCuadrilla" Name="Cuadrilla" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="sdsHerramientasAsignadas" runat="server" 
                            ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                            ProviderName="System.Data.SqlClient" SelectCommand="SELECT HXC.IDHERRAMIENTA, H.DESCRIPCION, H.NROLOTE, CONVERT (char(10), H.FECHAVENCIMIENTO, 103)
  FROM HERRAMIENTAXCUADRILLA HXC, HERRAMIENTA H
  WHERE H.IDHERRAMIENTA=HXC.IDHERRAMIENTA 
  AND HXC.IDCUADRILLA = @Cuadrilla

">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlCuadrilla" Name="Cuadrilla" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="sdstipoHerramienta" runat="server" 
                            ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                            ProviderName="System.Data.SqlClient" 
                            SelectCommand="SELECT * FROM [TIPOHERRAMIENTA]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="sdsHistorialCuadrilla" runat="server" 
                            ConnectionString="Data Source=ESTACION_52\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                            ProviderName="System.Data.SqlClient" SelectCommand="  SELECT  convert(char(10), FECHAINICIO, 103),  convert(char(10), FECHAFIN, 103)
  FROM HISTORIALCUADRILLA
  WHERE IDCUADRILLA = @idCuadrilla
  AND IDESTADOCUADRILLA = 1
  AND MONTH(FECHAINICIO)= @mes
  AND YEAR(FECHAINICIO)= @año
">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlCuadrilla" Name="idCuadrilla" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlMes" Name="mes" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlAño" Name="año" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="sdsEmpleadoXCuadrilla" runat="server" 
                            ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                            ProviderName="System.Data.SqlClient" SelectCommand="SELECT C.DESCRIPCION, EXC.IDEMPLEADO, P.APELLIDO, P.NOMBRE
  FROM EMPLEADOPORCUADRILLA EXC, EMPLEADO E, PERSONA P, CARGOEMPLEADO C
  WHERE EXC.IDEMPLEADO = E.IDEMPLEADO
  AND E.IDTIPODOCUMENTO=P.TIPODOCUMENTO
  AND E.NRODOCUMENTO=P.NRODOCUMENTO
  AND E.IDCARGO=C.IDCARGOEMPLEADO
  AND EXC.IDCUADRILLA=@idCuadrilla
">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlCuadrilla" Name="idCuadrilla" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    
    <script type="text/javascript">
    
     function RadioCheckOnly(rbControl) {
     
      var gvName = rbControl.defaultValue.split('_')[0];
      var gvControl;
      
      switch (gvName)
      {
        case "gvVehículo":
        gvControl =  "<%=gvVehículo.ClientID%>";       
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
    
    
        <asp:Panel ID="popUpCuadrillaNOReemplazable" runat="server" Style="display: none" CssClass="divFondo" >
            <div class="heading" style="width:360px">
                <asp:Label ID="Label15" runat="server" Text="La Cuadriila NO puede ser Reemplazada y/o Eliminada" style="margin-right:25px"></asp:Label>
                <br />
                <asp:Label ID="Label16" runat="server" Text="¿Desea selec?"></asp:Label>
                </div>
                <div class="content" style="height:100px;border-top: 0.1px solid #bababa">
                <div style="margin-right:15px;text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel6" runat="server" >
              
                <ContentTemplate>
              
                    <asp:Button ID="btnAceptarCuadrillaNoReemplazable" runat="server" Text="Aceptar" onclick="btnAceptarCuadrillaNoReemplazable_Click" CssClass="botonPopUp" />
                    <asp:Button ID="btnCancelarCuadrillaNoReemplazable" runat="server" Text="Cancelar" onclick="btnCancelarCuadrillaNoReemplazable_Click"/>
                 
                </ContentTemplate>
                    
                </asp:UpdatePanel>
                </div>
                </div>
            </asp:Panel>
    
    
    
    
    
    
    
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo" >
            <div class="heading">
                <asp:Label ID="Label11" runat="server" Text="¿Desea guardar los cambios?" ></asp:Label>
                <br />
                </div >
                <div class="content" style="height:100px;border-top: 0.1px solid #bababa">
                <div style="margin-right:15px;text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" >
              
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
        <asp:Label ID="Label12" runat="server" Text="Se perderán los datos ingresados" style="margin-right:25px"></asp:Label>
        <br />
        <asp:Label ID="Label13" runat="server" Text="¿Desea Continuar?"></asp:Label>
        </div>
        <div class="content" style="height:100px;border-top: 0.1px solid #bababa; width:360px">
        <div style="margin-right:15px;text-align: center">
        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
        <ContentTemplate>
            <asp:Button ID="btnAceptarCancelacion" runat="server" Text="Aceptar" CausesValidation="False" onclick="btnAceptarCancelacion_Click" style="margin-top:50px"/>
            <asp:Button ID="btnCancelarCancelacion" runat="server" Text="Cancelar" CausesValidation="False" onclick="btnCancelarCancelacion_Click"/>
        </ContentTemplate>
        </asp:UpdatePanel>
        </div>
        </div>
    </asp:Panel>
  
    <asp:Panel ID="popUpExito" runat="server" Style="display: none" CssClass="divFondo">
    <div style="float:left; width:40px; margin-left: 20px;margin-top: 3px;">
        <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="36px" />
    </div>

     <div class="heading">
        <asp:Label ID="Label14" runat="server" Text="Se ha registrado la Cuadrilla" style="margin-right:15px"></asp:Label>
        <br />
        </div>
        <div class="content" style="height:100px;border-top: 0.1px solid #bababa">
        <div style="margin-right:15px;text-align: center">
        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
        <ContentTemplate>
            <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" CausesValidation="False" onclick="btnAceptarConfirmacion_Click"
            CssClass="botonPopUp" />        
        </ContentTemplate>
        </asp:UpdatePanel>
        </div>
        </div>
    </asp:Panel>
    
    
    
    
    
    
                        
    
    
    
    
    
    
    
</asp:Content>

