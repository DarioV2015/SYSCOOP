<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true" CodeFile="RegistrarContrato.aspx.cs" Inherits="MPreventivo_RegistrarContrato" Title="Página sin título" %>
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
            width: 100%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table  style="margin-top:0px; width:820px">
                <tr>
                    <td colspan="5" 
                        style="background: -webkit-linear-gradient(180deg, #FFFFFF, #E0ECF8); border-left-style: outset">
                        <asp:Label ID="Label4" runat="server" Text="Contrato Nº: "></asp:Label>
                        <asp:Label ID="lblNroContrato" runat="server" Font-Bold="True" 
                            Font-Italic="True" Font-Overline="False" Font-Size="Medium"></asp:Label>
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
                    <td style="text-align: right">
                        <asp:Label ID="Label5" runat="server" Text="Proveedor:"></asp:Label>
                    </td>
                    <td width="280px">
                        <asp:DropDownList ID="ddlProveedor" runat="server" Height="25px" 
                            DataSourceID="sdsProveedor" DataTextField="RAZONSOCIAL" 
                            DataValueField="IDPROVEEDOR" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td colspan="3" style="border-left-style: outset; border-left-width:2px" rowspan="2">
                        <asp:FormView ID="FormViewProveedor" runat="server" 
                            DataSourceID="sdsDatosProveedor" Font-Italic="True" Font-Names="Arial Narrow" 
                            Font-Size="Small" ForeColor="#999999" style="margin-top:0px; margin-left:10px">
                            <EditItemTemplate>
                                CUIT:
                                <asp:TextBox ID="CUITTextBox" runat="server" Text='<%# Bind("CUIT") %>' />
                                <br />
                                RAZONSOCIAL:
                                <asp:TextBox ID="RAZONSOCIALTextBox" runat="server" 
                                    Text='<%# Bind("RAZONSOCIAL") %>' />
                                <br />
                                NOMBRE:
                                <asp:TextBox ID="NOMBRETextBox" runat="server" Text='<%# Bind("NOMBRE") %>' />
                                <br />
                                NOMBRE1:
                                <asp:TextBox ID="NOMBRE1TextBox" runat="server" Text='<%# Bind("NOMBRE1") %>' />
                                <br />
                                TELEFONO:
                                <asp:TextBox ID="TELEFONOTextBox" runat="server" 
                                    Text='<%# Bind("TELEFONO") %>' />
                                <br />
                                EMAIL:
                                <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                                <br />
                                APELLIDO:
                                <asp:TextBox ID="APELLIDOTextBox" runat="server" 
                                    Text='<%# Bind("APELLIDO") %>' />
                                <br />
                                NOMBRE2:
                                <asp:TextBox ID="NOMBRE2TextBox" runat="server" Text='<%# Bind("NOMBRE2") %>' />
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Actualizar" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                    CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                CUIT:
                                <asp:TextBox ID="CUITTextBox" runat="server" Text='<%# Bind("CUIT") %>' />
                                <br />
                                RAZONSOCIAL:
                                <asp:TextBox ID="RAZONSOCIALTextBox" runat="server" 
                                    Text='<%# Bind("RAZONSOCIAL") %>' />
                                <br />
                                NOMBRE:
                                <asp:TextBox ID="NOMBRETextBox" runat="server" Text='<%# Bind("NOMBRE") %>' />
                                <br />
                                NOMBRE1:
                                <asp:TextBox ID="NOMBRE1TextBox" runat="server" Text='<%# Bind("NOMBRE1") %>' />
                                <br />
                                TELEFONO:
                                <asp:TextBox ID="TELEFONOTextBox" runat="server" 
                                    Text='<%# Bind("TELEFONO") %>' />
                                <br />
                                EMAIL:
                                <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                                <br />
                                APELLIDO:
                                <asp:TextBox ID="APELLIDOTextBox" runat="server" 
                                    Text='<%# Bind("APELLIDO") %>' />
                                <br />
                                NOMBRE2:
                                <asp:TextBox ID="NOMBRE2TextBox" runat="server" Text='<%# Bind("NOMBRE2") %>' />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                    CommandName="Insert" Text="Insertar" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                    CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                CUIT:
                                <asp:Label ID="CUITLabel" runat="server" Text='<%# Bind("CUIT") %>' />
                                <br />
                                Razon Social:
                                <asp:Label ID="RAZONSOCIALLabel" runat="server" 
                                    Text='<%# Bind("RAZONSOCIAL") %>' />
                                <br />
                                Localidad:
                                <asp:Label ID="NOMBRELabel" runat="server" Text='<%# Bind("NOMBRE") %>' />
                                &nbsp;(<asp:Label ID="NOMBRE1Label" runat="server" Text='<%# Bind("NOMBRE1") %>' />
                                )<br />
                                Telefono:
                                <asp:Label ID="TELEFONOLabel" runat="server" Text='<%# Bind("TELEFONO") %>' />
                                <br />
                                e-mail:
                                <asp:Label ID="EMAILLabel" runat="server" Text='<%# Bind("EMAIL") %>' />
                                <br />
                                Responsable:
                                <asp:Label ID="APELLIDOLabel" runat="server" Text='<%# Bind("APELLIDO") %>' />
                                ,
                                <asp:Label ID="NOMBRE2Label" runat="server" Text='<%# Bind("NOMBRE2") %>' />
                                <br />
                            </ItemTemplate>
                        </asp:FormView>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                            <asp:Label ID="Label1" runat="server" Text="Fecha Inicio:"></asp:Label></td>
                        <td colspan="0">
                             <asp:TextBox ID="txtFecha" runat="server" AutoPostBack="True" 
                            ontextchanged="text_Changed"  />
                            <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/1410380987_Calendar_24x24.png" 
                                 ImageAlign="Middle"  style="vertical-align:middle"/>
                            <asp:CalendarExtender ID="CalendarExtender2" runat="server" 
                             TargetControlID="txtFecha" PopupButtonID="Image1" Format="dd/MM/yyyy">
                                </asp:CalendarExtender>
                             
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                 ControlToValidate="txtFecha" ErrorMessage="Debe ingresar la fecha del pedido" 
                                 ValidationGroup="1" style="margin-left:10px; font-family:Sans-Serif; font-size:14px"></asp:RequiredFieldValidator>
                        </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                   <caption>
                       &nbsp;
                       <tr style="border-bottom-style: outset">
                           
                           <td colspan="3">
                               <asp:Panel ID="Panel1" runat="server" Width="300px">
                                   <table class="style9" style="margin-left:140px">
                                       <tr>
                                           <td>
                                               <asp:RadioButton ID="rdbInsumo" runat="server" AutoPostBack="True" 
                                                   GroupName="tipo" oncheckedchanged="rdbInsumo_CheckedChanged" Text="Insumo" />
                                           </td>
                                           <td>
                                               <asp:RadioButton ID="rdbHerramienta" runat="server" AutoPostBack="True" 
                                                   GroupName="tipo" oncheckedchanged="rdbHerramienta_CheckedChanged" 
                                                   Text="Herramienta" />
                                           </td>
                                           <td>
                                               <asp:RadioButton ID="rdbMedidor" runat="server" AutoPostBack="True" 
                                                   GroupName="tipo" oncheckedchanged="rdbMedidor_CheckedChanged" Text="Medidor" />
                                           </td>
                                       </tr>
                                   </table>
                               </asp:Panel>
                           </td>
                       </tr>
                       <tr>
                           <td colspan="5" style="border-top-style: outset">
                               <asp:Panel ID="PanelInsumo" runat="server" Visible="False">
                                   <table width="800px">
                                       <tr>
                                           <td style="text-align: right" width="120px">
                                               <asp:Label ID="Label6" runat="server" Text="Tipo Insumo:"></asp:Label>
                                           </td>
                                           <td width="40px">
                                               <asp:DropDownList ID="ddlTipoInsumo" runat="server" AutoPostBack="True" 
                                                   DataSourceID="sdsTipoInsumo" DataTextField="DESCRIPCION" 
                                                   DataValueField="IDTIPOINSUMO" >
                                               </asp:DropDownList>
                                           </td>
                                           <td style="text-align: right" width="70px">
                                               <asp:Label ID="Label7" runat="server" Text="Insumo:"></asp:Label>
                                           </td>
                                           <td width="40px">
                                               <asp:DropDownList ID="ddlInsumos" runat="server" DataSourceID="sdsInsumo" 
                                                   DataTextField="NOMBRE" DataValueField="IDINSUMO" >
                                               </asp:DropDownList>
                                           </td>
                                           <td width="40px">
                                               <asp:Button ID="btnAgregar" runat="server" onclick="btnAgregar_Click" 
                                                   Text="Agregar" style="margin-left:30px" Width="100px" />
                                           </td>
                                           <td>
                                            <asp:Button ID="btnNuevo" runat="server" onclick="btnNuevo_Click" 
                                                   Text="Nuevo" Width="100px" />
                                           </td>
                                       </tr>
                                       </table>
                                       <table>
                                       <tr>
                                           <td colspan="5">
                                               <asp:GridView ID="gvInsumo" runat="server" AutoGenerateColumns="False" 
                                                   CellPadding="4" ForeColor="#333333" GridLines="None" 
                                                   HeaderStyle-CssClass="estiloHeaderTabla" onrowcommand="gvInsumo_RowCommand" 
                                                   Style="margin-top: 10px; margin-left:132px" Width="350px">
                                                   <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                                   <Columns>
                                                       <asp:TemplateField HeaderText="Item" ShowHeader="False">
                                                           <ItemTemplate>
                                                               <%#Container.DataItemIndex+1%>
                                                           </ItemTemplate>
                                                           <HeaderStyle CssClass="estiloHeaderTabla" Width="50px" />
                                                           <ItemStyle CssClass="estiloFilasTabla" />
                                                       </asp:TemplateField>
                                                       <asp:BoundField DataField="NroInsumo" HeaderStyle-Width="65px" 
                                                           HeaderText="Insumo" ItemStyle-CssClass="estiloHeaderTabla" 
                                                           SortExpression="NroInsumo">
                                                           <HeaderStyle CssClass="estiloHeaderTabla" Width="65px" />
                                                           <ItemStyle CssClass="estiloFilasTabla" />
                                                       </asp:BoundField>
                                                       <asp:BoundField DataField="TipoInsumo" HeaderStyle-Width="120px" 
                                                           HeaderText="Tipo Insumo" ItemStyle-CssClass="estiloHeaderTabla" 
                                                           SortExpression="TipoInsumo">
                                                           <HeaderStyle CssClass="estiloHeaderTabla" Width="120px" />
                                                           <ItemStyle CssClass="estiloFilasTabla" />
                                                       </asp:BoundField>
                                                       <asp:BoundField DataField="Nombre" HeaderStyle-Width="65px" HeaderText="Insumo" 
                                                           ItemStyle-CssClass="estiloHeaderTabla" SortExpression="Nombre">
                                                           <HeaderStyle CssClass="estiloHeaderTabla" Width="65px" />
                                                           <ItemStyle CssClass="estiloFilasTabla" />
                                                       </asp:BoundField>
                                                       <asp:TemplateField HeaderText="Cantidad" ShowHeader="False">
                                                           <ItemTemplate>
                                                               <asp:TextBox ID="txtCantidad" runat="server" 
                                                                   ItemStyle-CssClass="estiloHeaderTabla" Width="50px" />
                                                           </ItemTemplate>
                                                           <HeaderStyle CssClass="estiloHeaderTabla" Width="50px" />
                                                           <ItemStyle CssClass="estiloFilasTabla" />
                                                       </asp:TemplateField>
                                                       <asp:TemplateField ShowHeader="False">
                                                           <ItemTemplate>
                                                               <asp:Button ID="btnEliminar" runat="server" CausesValidation="false" 
                                                                   CommandArgument='<%# Eval("nroInsumo") %>' CommandName="DeleteRow" 
                                                                   ItemStyle-CssClass="estiloHeaderTabla" Text="Eliminar" Width="90px" />
                                                           </ItemTemplate>
                                                           <HeaderStyle CssClass="estiloHeaderTabla" Width="65px" />
                                                           <ItemStyle CssClass="estiloFilasTabla" />
                                                       </asp:TemplateField>
                                                   </Columns>
                                                   <HeaderStyle CssClass="estiloHeaderTabla" />
                                               </asp:GridView>
                                           </td>
                                       </tr>
                                   </table>
                               </asp:Panel>
                           </td>
                       </tr>
                       <tr>
                           <td colspan="5">
                               <asp:Panel ID="PanelHerramienta" runat="server" Visible="False">
                                   <table >
                                       <tr>
                                           <td style="text-align: right" width="140px">
                                               <asp:Label ID="Label2" runat="server" Text=" Tipo Herramienta:"></asp:Label>
                                           </td>
                                           <td width="40px">
                                               <asp:DropDownList ID="ddlTipoHerramienta" runat="server" AutoPostBack="True" 
                                                   DataSourceID="sdsTipoHerramienta" DataTextField="DESCRIPCION" 
                                                   DataValueField="IDTIPOHERRAMIENTA">
                                               </asp:DropDownList>
                                           </td>
                                           <td style="text-align: right" width="100px">
                                               <asp:Label ID="Label3" runat="server" Text="Herramienta:"></asp:Label>
                                           </td>
                                           <td width="40px">
                                               <asp:DropDownList ID="ddlHerranmienta" runat="server" AutoPostBack="True" 
                                                   DataSourceID="sdsHerramienta" DataTextField="DESCRIPCION" 
                                                   DataValueField="IDHERRAMIENTA">
                                               </asp:DropDownList>
                                           </td>
                                           <td width="40px">
                                               <asp:Button ID="btnAgregarHerramienta" runat="server" 
                                                   onclick="btnAgregarHerramienta_Click" Text="Agregar" Width="100px" />
                                           </td>
                                           <td width="40px">
                                           <asp:Button ID="btnNuevaHerramienta" runat="server" 
                                                   onclick="btnNuevaHerramienta_Click" Text="Nueva" Width="100px" />
                                           </td>
                                       </tr>
                                       </table>
                                       <table>
                                       <tr>
                                           <td colspan="5">
                                               <asp:GridView ID="gvHerramientas" runat="server" AutoGenerateColumns="False" 
                                                   CellPadding="4" ForeColor="#333333" GridLines="None" 
                                                   HeaderStyle-CssClass="estiloHeaderTabla" 
                                                   onrowcommand="gvHerramientas_RowCommand" Style="margin-top: 0px; margin-left:120px" Width="550px">
                                                   <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                                   <Columns>
                                                       <asp:TemplateField HeaderText="Item" ShowHeader="False">
                                                           <ItemTemplate>
                                                               <%#Container.DataItemIndex+1%>
                                                           </ItemTemplate>
                                                           <HeaderStyle CssClass="estiloHeaderTabla" Width="40px" />
                                                           <ItemStyle CssClass="estiloFilasTabla" />
                                                       </asp:TemplateField>
                                                       <asp:BoundField DataField="NroHerramienta" HeaderStyle-Width="65px" 
                                                           HeaderText="Herramienta" ItemStyle-CssClass="estiloHeaderTabla" 
                                                           SortExpression="NroHerramienta">
                                                           <HeaderStyle CssClass="estiloHeaderTabla" Width="65px" />
                                                           <ItemStyle CssClass="estiloFilasTabla" />
                                                       </asp:BoundField>
                                                       <asp:BoundField DataField="DescripcionTipo" HeaderStyle-Width="65px" 
                                                           HeaderText="Tipo " ItemStyle-CssClass="estiloHeaderTabla" 
                                                           SortExpression="DescripcionTipo">
                                                           <HeaderStyle CssClass="estiloHeaderTabla" Width="65px" />
                                                           <ItemStyle CssClass="estiloFilasTabla" />
                                                       </asp:BoundField>
                                                       <asp:BoundField DataField="Descripcion" HeaderStyle-Width="85px" 
                                                           HeaderText="Nombre" ItemStyle-CssClass="estiloHeaderTabla" 
                                                           SortExpression="Descripcion">
                                                           <HeaderStyle CssClass="estiloHeaderTabla" Width="85px" />
                                                           <ItemStyle CssClass="estiloFilasTabla" />
                                                       </asp:BoundField>
                                                       <asp:TemplateField HeaderText="Cantidad" ShowHeader="False">
                                                           <ItemTemplate>
                                                               <asp:TextBox ID="txtCantidadHerramienta" runat="server" 
                                                                   ItemStyle-CssClass="estiloHeaderTabla" Width="50px" />
                                                           </ItemTemplate>
                                                           <HeaderStyle CssClass="estiloHeaderTabla" Width="50px" />
                                                           <ItemStyle CssClass="estiloFilasTabla" />
                                                       </asp:TemplateField>
                                                       <asp:TemplateField ShowHeader="False">
                                                           <ItemTemplate>
                                                               <asp:Button ID="btnEliminar" runat="server" CausesValidation="false" 
                                                                   CommandArgument='<%# Eval("nroHerramienta") %>' CommandName="DeleteRow" 
                                                                   ItemStyle-CssClass="estiloHeaderTabla" Text="Eliminar" Width="90px" />
                                                           </ItemTemplate>
                                                           <HeaderStyle CssClass="estiloHeaderTabla" Width="65px" />
                                                           <ItemStyle CssClass="estiloFilasTabla" />
                                                       </asp:TemplateField>
                                                   </Columns>
                                                   <HeaderStyle CssClass="estiloHeaderTabla" />
                                               </asp:GridView>
                                           </td>
                                       </tr>
                                   </table>
                               </asp:Panel>
                               
                               <asp:Panel ID="PanelMedidor" runat="server" Visible="False">
                                   <table style="margin-left:130px">
                                       <tr>
                                           <td style="text-align: right" width="100px">
                                               <asp:Label ID="Label8" runat="server" Text=" Tipo Medidor:"></asp:Label>
                                           </td>
                                           <td width="40px"> 
                                               <asp:DropDownList ID="ddlTipoMedidor" runat="server" AutoPostBack="True" 
                                                   DataSourceID="sdsTipoMedidor" DataTextField="DESCRIPCION" 
                                                   DataValueField="IDTIPOMEDIDOR">
                                               </asp:DropDownList>
                                           </td>
                                           <td width="40px">
                                               <asp:Button ID="btnAgregarMedidor" runat="server" 
                                                   onclick="btnAgregarMedidor_Click1" Text="Agregar" Width="100px" />
                                           </td>
                                           <td>
                                               <td />
                                               </td>
                                           </tr>
                                           </table>
                                           <table>
                                          
                                           <tr>
                                               <td colspan="5">
                                                   <asp:GridView ID="gvMedidor" runat="server" AutoGenerateColumns="False" 
                                                       CellPadding="4" ForeColor="#333333" GridLines="None" 
                                                       HeaderStyle-CssClass="estiloHeaderTabla" onrowcommand="gvMedidor_RowCommand" 
                                                       Style="margin-top: 10px; margin-left:150px" Width="350px">
                                                       <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                                       <Columns>
                                                           <asp:TemplateField HeaderText="Item" ShowHeader="False">
                                                               <ItemTemplate>
                                                                   <%#Container.DataItemIndex+1%>
                                                               </ItemTemplate>
                                                               <HeaderStyle CssClass="estiloHeaderTabla" Width="50px" />
                                                               <ItemStyle CssClass="estiloFilasTabla" />
                                                           </asp:TemplateField>
                                                           <asp:BoundField DataField="IdTipoMedidor" HeaderStyle-Width="65px" 
                                                               HeaderText="Código" ItemStyle-CssClass="estiloHeaderTabla" 
                                                               SortExpression="IdTipoMedidor">
                                                               <HeaderStyle CssClass="estiloHeaderTabla" Width="65px" />
                                                               <ItemStyle CssClass="estiloFilasTabla" />
                                                           </asp:BoundField>
                                                           <asp:BoundField DataField="Descripcion" HeaderStyle-Width="65px" 
                                                               HeaderText="Tipo" ItemStyle-CssClass="estiloHeaderTabla" 
                                                               SortExpression="Descripcion">
                                                               <HeaderStyle CssClass="estiloHeaderTabla" Width="65px" />
                                                               <ItemStyle CssClass="estiloFilasTabla" />
                                                           </asp:BoundField>
                                                           <asp:TemplateField HeaderText="Cantidad" ShowHeader="False">
                                                               <ItemTemplate>
                                                                   <asp:TextBox ID="txtCantidadMedidores" runat="server" 
                                                                       ItemStyle-CssClass="estiloHeaderTabla" Width="50px" />
                                                               </ItemTemplate>
                                                               <HeaderStyle CssClass="estiloHeaderTabla" Width="50px" />
                                                               <ItemStyle CssClass="estiloFilasTabla" />
                                                           </asp:TemplateField>
                                                           <asp:TemplateField ShowHeader="False">
                                                               <ItemTemplate>
                                                                   <asp:Button ID="btnEliminar" runat="server" CausesValidation="false" 
                                                                       CommandArgument='<%# Eval("idTipoMedidor") %>' CommandName="DeleteRow" 
                                                                       ItemStyle-CssClass="estiloHeaderTabla" Text="Eliminar" Width="90px" />
                                                               </ItemTemplate>
                                                               <HeaderStyle CssClass="estiloHeaderTabla" Width="65px" />
                                                               <ItemStyle CssClass="estiloFilasTabla" />
                                                           </asp:TemplateField>
                                                       </Columns>
                                                       <HeaderStyle CssClass="estiloHeaderTabla" />
                                                   </asp:GridView>
                                               </td>
                                           </tr>
                                       </table>
                                   </asp:Panel>
                               </td>
                           </tr>
                           <tr>
                               <td colspan="5">
                                   &nbsp;</td>
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
                               <td colspan="5" style="text-align: left">
                                   <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                       <ContentTemplate>
                                           <asp:Button ID="btnRegistrar" runat="server" onclick="btnRegistrar_Click" 
                                               style="margin-left:200px" Text="Registrar" ValidationGroup="1" />
                                           <asp:Button ID="btnCancelar" runat="server" onclick="btnCancelar_Click" 
                                               Text="Cancelar" />
                                           <span style="display: none">
                                           <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
                                           </span>
                                           <asp:ModalPopupExtender ID="ModalPopupConfirmacion" runat="server" 
                                               BackgroundCssClass="reveal-modal-bg" PopupControlID="popUpConfirmacion" 
                                               TargetControlID="LinkButton1">
                                           </asp:ModalPopupExtender>
                                           <span style="display: none">
                                           <asp:LinkButton ID="LinkButton2" runat="server">LinkButton</asp:LinkButton>
                                           </span>
                                           <asp:ModalPopupExtender ID="ModalPopupCancelarRegistrar" runat="server" 
                                               BackgroundCssClass="reveal-modal-bg" PopupControlID="popUpCancelarRegistrar" 
                                               TargetControlID="LinkButton2">
                                           </asp:ModalPopupExtender>
                                           <span style="display: none">
                                           <asp:LinkButton ID="LinkButton3" runat="server">LinkButton</asp:LinkButton>
                                           </span>
                                           <asp:ModalPopupExtender ID="ModalPopupExito" runat="server" 
                                               BackgroundCssClass="reveal-modal-bg" PopupControlID="popUpExito" 
                                               TargetControlID="LinkButton3">
                                           </asp:ModalPopupExtender>
                                       </ContentTemplate>
                                   </asp:UpdatePanel>
                               </td>
                           </tr>
                           <tr>
                               <td colspan="5">
                                   &nbsp;</td>
                           </tr>
                       </caption>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:SqlDataSource ID="sdsDatosProveedor" runat="server" 
                            ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                            ProviderName="System.Data.SqlClient" 
                            
            SelectCommand="SELECT P.CUIT, E.RAZONSOCIAL,C.NOMBRE, PROV.NOMBRE, E.TELEFONO, E.EMAIL, PER.APELLIDO, PER.NOMBRE
FROM PROVEEDOR P, EMPRESA E, PERSONA PER, DOMICILIOEXTERNO DE, CIUDAD C, PROVINCIA PROV
                                            WHERE P.CUIT = E.CUIT
                                            AND E.TIPODOCRESP=PER.TIPODOCUMENTO
                                            AND E.NRODOCRESP=PER.NRODOCUMENTO
                                            AND E.IDDOMICILIOEXTERNO=DE.IDDOMICILIOEXTERNO
                                            AND DE.IDCIUDAD=C.IDCIUDAD
                                            AND C.IDPROVINCIA = PROV.IDPROVINCIA											AND P.IDPROVEEDOR = @proveddor">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlProveedor" Name="proveddor" 
                PropertyName="SelectedValue" />
        </SelectParameters>
        </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="sdsProveedor" runat="server" 
                            ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                            ProviderName="System.Data.SqlClient" 
                            SelectCommand="SELECT P.IDPROVEEDOR, E.RAZONSOCIAL
                                          FROM PROVEEDOR P, EMPRESA E
                                          WHERE P.CUIT = E.CUIT"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsTipoInsumo" runat="server" 
                            ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                            ProviderName="System.Data.SqlClient"
        SelectCommand="SELECT * FROM [TIPOINSUMO]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsInsumo" runat="server" 
                            ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                            ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT IDINSUMO, NOMBRE, UNIDADMEDIDA, ESPECIFICACION FROM INSUMO WHERE IDTIPOINSUMO = @idTipoInsumo">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlTipoInsumo" Name="idTipoInsumo" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsTipoHerramienta" runat="server" 
                            ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                            ProviderName="System.Data.SqlClient"
        SelectCommand="SELECT * FROM [TIPOHERRAMIENTA]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsHerramienta" runat="server" 
                            ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                            ProviderName="System.Data.SqlClient"
        SelectCommand="SELECT IDHERRAMIENTA, DESCRIPCION  FROM HERRAMIENTA WHERE IDTIPOHERRAMIENTA=@tipoHerramienta">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlTipoHerramienta" Name="tipoHerramienta" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsTipoMedidor" runat="server" 
        ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT * FROM [TIPOMEDIDOR]"></asp:SqlDataSource>
    
    
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo" >
            <div class="heading">
                <asp:Label ID="Label9" runat="server" Text="¿Desea registrar el CONTRATO?" ></asp:Label>
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
        <asp:Label ID="Label11" runat="server" Text="Se perderán los datos ingresados" style="margin-right:25px"></asp:Label>
        <br />
        <asp:Label ID="Label12" runat="server" Text="¿Desea Continuar?"></asp:Label>
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
        <asp:Image ID="Image3" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="36px" />
    </div>

     <div class="heading">
        <asp:Label ID="Label13" runat="server" Text="El CONTRATO fue registrado con éxito" style="margin-right:15px"></asp:Label>
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

