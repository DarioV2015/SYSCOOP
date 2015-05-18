<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true" CodeFile="RegistrarIngresoInsumos.aspx.cs" Inherits="MPreventivo_RegistrarIngresoInsumos" Title="Página sin título" %>
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
        .style10
       {           text-align: center;
       }
        .style13
       {
           height: 21px;
       }
        .style14
       {
           width: 5px;
       }
       .style18
       {
           height: 30px;
       }
       .font
        {
        	font-family:Sans-Serif;
        	font-size:14px
        	}
        .style19
       {
           width: 116px;
       }
       .style20
       {
           height: 30px;
           width: 116px;
       }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <table class="style9">
        <tr>
            <td style="background: -webkit-linear-gradient(180deg, #FFFFFF, #E0ECF8);
                text-align: left; border-left-style: outset;" width="800px">
                <asp:Label ID="Label4" runat="server" Text="Contrato Nº: "></asp:Label>
                <asp:Label ID="lblNroContrato" runat="server" Font-Bold="True" 
                    Font-Italic="True" Font-Size="Medium"></asp:Label>
            </td>
        </tr>
        </table>
        
        <table>
         <tr>
            <td colspan="5">
                        <asp:GridView ID="gvDetalle" runat="server" AutoGenerateColumns="False"
                                        HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" 
                                        ForeColor="#333333" GridLines="None" Style="margin-top: 0px" Width="350px">
                                        <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                        
                            <Columns>
                                <asp:TemplateField>
                                <ItemTemplate>
                                <asp:RadioButton ID="gvDetalle_rdbSeleccionar" runat="server" 
                                    oncheckedchanged="gvDetalle_rdbSeleccionar_CheckedChanged" onclick="RadioCheckOnly(this);" Width="30px" AutoPostBack="True" />
                                </ItemTemplate>
                                <ItemStyle CssClass="estiloFilasTabla" Width="20px"></ItemStyle>
                                </asp:TemplateField>
                                
                                <asp:BoundField DataField="NroInsumo" HeaderText="Codigo" 
                                    SortExpression="NroInsumo" HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    
                                <asp:BoundField DataField="DescripInsumo" HeaderText="Insumo" 
                                    SortExpression="DescripInsumo" HeaderStyle-Width="150px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="150px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    
                                <asp:BoundField DataField="CantidadIngresada" HeaderText="Cant. Ingresada" 
                                    SortExpression="CantidadIngresada" HeaderStyle-Width="150px" 
                                    ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="150px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    

                                    
                            </Columns>
                                        <HeaderStyle CssClass="estiloHeaderTabla" />
                        </asp:GridView>
                        
                    </td>
                   
        </tr>
        </table>
        <table>
                
        </table>
        
        <table>
        
                <tr>
                    <td style="text-align: center" class="style13">
                            <asp:Panel ID="Panel1" runat="server">
                                <table class="style9">
                                
                   <tr>
                        <td class="style13">
                            <asp:Label ID="Label14" runat="server" Text="Cantidad:"></asp:Label>
                            </td>
                         <td style="text-align: left">
                             <asp:TextBox ID="txtCantIngresada" runat="server" Enabled="False" Width="50px" ></asp:TextBox>
                            </td>
                         <td class="style19">
                             <asp:Label ID="Label15" runat="server" Text="Cantidad a Ingresar:"></asp:Label>
                            </td>
                         <td style="text-align: left">
                             <asp:TextBox ID="txtCantAIngresar" runat="server" Width="50px"></asp:TextBox>
                            </td>
                         <td>
                             &nbsp;</td>
                        </tr>
                          <tr>
                                <td style="text-align: right" width="90px">
                                    <asp:Label ID="Label5" runat="server" Text="Nro. Lote:"></asp:Label>
                                </td>
                                <td style="text-align: left" width="200px">
                                    <asp:TextBox ID="txtNroLote" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="txtNroLote" ErrorMessage="Debe indicar el LOTE" 
                                        ValidationGroup="1">*</asp:RequiredFieldValidator>
                                </td>
                                <td style="text-align: left" class="style20" >
                                    <asp:Label ID="Label6" runat="server" Text="Fecha Venc:"></asp:Label>
                                </td>
                                <td class="style18" >
                                    <asp:TextBox ID="txtFechaVenc" runat="server" AutoPostBack="True" 
                                        ontextchanged="txtFechaVenc_Changed" />
                                    <asp:Image ID="Image1" runat="server" ImageAlign="Middle" 
                                        ImageUrl="../Imagenes/1410380987_Calendar_24x24.png" 
                                        style="vertical-align:middle" />
                                    </td>
                                <td class="style18" >
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="txtFechaVenc" 
                                        ErrorMessage="Debe ingresar la FECHA DE VENCIMIENTO" ValidationGroup="1">*</asp:RequiredFieldValidator>
                                    </td>
                            </tr>
                            <tr>
                                <td class="style10" colspan="5">
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" 
                                        PopupButtonID="Image1" TargetControlID="txtFechaVenc">
                                    </asp:CalendarExtender>
                                    <asp:Button ID="btnNroLote" runat="server" onclick="btnNroLote_Click" 
                                        Text="Ingresar" ValidationGroup="1" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    </td>
        </tr>
        </table>
        <table>
        <tr>
        <td>
            <asp:Label ID="lblMensaje" runat="server" Font-Italic="True" ForeColor="Red"></asp:Label>
        </td>
        </tr>
       

       
               <tr>
            <td colspan="5">
                        <asp:GridView ID="gvIngreso" runat="server" AutoGenerateColumns="False"
                                        HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" 
                                        ForeColor="#333333" GridLines="None" Style="margin-top: 0px" Width="350px">
                                        <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                        
                            <Columns>
                             
                                
                                <asp:BoundField DataField="NroInsumo" HeaderText="Codigo" 
                                    SortExpression="NroInsumo" HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    
                                <asp:BoundField DataField="DescripInsumo" HeaderText="Insumo" 
                                    SortExpression="DescripInsumo" HeaderStyle-Width="150px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="150px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    
                                <asp:BoundField DataField="CantidadIngresada" HeaderText="Cant. Ingresada" 
                                    SortExpression="CantidadIngresada" HeaderStyle-Width="150px" 
                                    ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="150px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                                                   
                                    
                                <asp:BoundField DataField="NroLote" HeaderText="Nro. Lote" 
                                    SortExpression="NroLote" HeaderStyle-Width="150px" 
                                    ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="150px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                <asp:BoundField DataField="FechaVenc" HeaderText="Fecha Vencimiento" 
                                    SortExpression="FechaVenc" HeaderStyle-Width="150px" 
                                    ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="150px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    
                                
                                    
                            </Columns>
                                        <HeaderStyle CssClass="estiloHeaderTabla" />
                        </asp:GridView>
                    </td>
                    
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan ="5">
                <asp:Panel ID="Panel2" runat="server" Visible="False">
                
                <table class="style9">
                    <tr>
                        <td colspan="5" style="border-bottom-style: outset">
                            <asp:Label ID="Label1" runat="server" Text="Pedidos Internos" 
                                Font-Italic="True" Font-Size="Medium"></asp:Label> </td>
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
                        <td colspan="4">
                           <asp:GridView ID="gvPedidosInternosInsumos" runat="server" 
                                AutoGenerateColumns="False" HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" 
                                ForeColor="#333333" GridLines="None" Style="margin-top: 0px" Width="350px" >
                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                            <Columns>
                                <asp:TemplateField>
                                <ItemTemplate>
                                <asp:RadioButton ID="gvPedidosInternosInsumos_rdbSeleccionar" runat="server" 
                                    oncheckedchanged="gvPedidosInternosInsumos_rdbSeleccionar_CheckedChanged" onclick="RadioCheckOnly(this);" Width="30px" AutoPostBack="True" />
                                </ItemTemplate>
                                <ItemStyle CssClass="estiloFilasTabla" Width="20px"></ItemStyle>
                                </asp:TemplateField>
                                    
                                <asp:BoundField DataField="Nro. Pedido" HeaderText="Nro. Pedido" 
                                    ReadOnly="True" SortExpression="Nro. Pedido" HeaderStyle-Width="150px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="150px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                <asp:BoundField DataField="Tipo Insumo" HeaderText="Tipo Insumo" 
                                    SortExpression="Tipo Insumo" HeaderStyle-Width="150px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="150px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                <asp:BoundField DataField="Fecha" HeaderText="Fecha" ReadOnly="True" 
                                    SortExpression="Fecha" HeaderStyle-Width="150px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="150px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                            </Columns>
                        </asp:GridView></td>
                        <td>
                               <asp:Button ID="btnVerDetalle" runat="server" Text="Ver Detalle" 
                                   onclick="btnVerDetalle_Click" /></td>
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
                        <td colspan="5">
                            <asp:GridView ID="gvDetallePedido" runat="server" AutoGenerateColumns="False" HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" 
                                ForeColor="#333333" GridLines="None" Style="margin-top: 0px" Width="350px">
                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="NroDetalle" HeaderText="Item" 
                                        SortExpression="NroDetalle" HeaderStyle-Width="150px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="150px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NroInsumo" HeaderText="Codigo Insumo" 
                                        SortExpression="NroInsumo" HeaderStyle-Width="150px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="150px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DescripInsumo" HeaderText="Insumo" 
                                        SortExpression="DescripInsumo" HeaderStyle-Width="150px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="150px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" 
                                        SortExpression="Cantidad" HeaderStyle-Width="150px" ItemStyle-CssClass="estiloHeaderTabla">
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="150px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    
                                    <asp:TemplateField ShowHeader="False" HeaderText="Cant. Total Ingresada">
                                    <ItemTemplate>                                        
                                    <asp:CheckBox ID="CheckPedidoInsumo"  oncheckedchanged="CheckPedidoInsumo_CheckedChanged" 
                                    runat="server" Width="30px" ItemStyle-CssClass="estiloHeaderTabla" AutoPostBack="True"  />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:TemplateField>
                                    
                                   <asp:TemplateField ShowHeader="False" HeaderText="Ingreso">
                                   <ItemTemplate>
                                   <asp:TextBox ID="txtCantIngresada" runat="server" Width="50px" ItemStyle-CssClass="estiloHeaderTabla" />
                                   </ItemTemplate>
                                   <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
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
                </asp:Panel>
            </td>
            
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnRegistrar" runat="server" onclick="btnRegistrar_Click" 
                            style="margin-left:200px" Text="Registrar" ValidationGroup="1" />
                        <span style="display: none">
                        <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
                        </span>
                        <asp:ModalPopupExtender ID="ModalPopupConfirmacion" runat="server" 
                            BackgroundCssClass="reveal-modal-bg" PopupControlID="popUpConfirmacion" 
                            TargetControlID="LinkButton1">
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
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style14">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    
    </ContentTemplate>
    </asp:UpdatePanel>

<asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo" >
            <div class="heading">
                <asp:Label ID="Label9" runat="server" Text="¿Desea registrar el INGRESO de INSUMOS?" ></asp:Label>
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
            
  <asp:Panel ID="popUpExito" runat="server" Style="display: none" CssClass="divFondo">
    <div style="float:left; width:40px; margin-left: 20px;margin-top: 3px;">
        <asp:Image ID="Image4" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="40px" />
    </div>

     <div class="heading">
        <asp:Label ID="Label13" runat="server" Text="El INGRESO de INSUMOS fue registrado con éxito" style="margin-right:15px"></asp:Label>
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
        
    <asp:SqlDataSource ID="sdsPedidosInsumos" runat="server" 
        ConnectionString="Data Source=ESTACION_52\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT IDPEDIDO as 'Nro. Pedido', IDTIPOINSUMO as 'Tipo Insumo', CONVERT (char(10), FECHA, 103) as 'Fecha'
FROM  PEDIDOINSUMO
WHERE IDESTADOPEDIDOINSUMO=1"></asp:SqlDataSource>

 <script type="text/javascript">
    
     function RadioCheckOnly(rbControl) {
     
      var gvName = rbControl.defaultValue.split('_')[0];
      var gvControl;
      
      switch (gvName)
      {
        case "gvDetalle":
        gvControl =  "<%=gvDetalle.ClientID%>";       
        break;
        case "gvPedidosInternosInsumos":
        gvControl =  "<%=gvPedidosInternosInsumos.ClientID%>";       
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
        
                        <asp:ValidationSummary ID="ValidationSummary1" 
        runat="server" ValidationGroup="1" />
        
                           
                                   
</asp:Content>

