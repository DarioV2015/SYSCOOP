<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true" CodeFile="RegistrarIngresoHerramientas.aspx.cs" Inherits="MPreventivo_RegistrarIngresoHerramientas" Title="Registrar Ingreso de Herramientas" %>
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
       {
           text-align: right;
       }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style9">
                <tr>
                    <td colspan="5" style="background: -webkit-linear-gradient(180deg, #FFFFFF, #E0ECF8);
                text-align: left; border-left-style: outset;">
                        <asp:Label ID="Label4" runat="server" Text="Contrato Nº: "></asp:Label>
                        <asp:Label ID="lblNroContrato" runat="server" Font-Bold="True" 
                            Font-Italic="True" Font-Size="Medium"></asp:Label>
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
                    <td class="style10" width="90px">
                        <asp:Label ID="Label14" runat="server" Text="Nro. Lote:"></asp:Label>
                    </td>
                    <td width="200px">
                        <asp:TextBox ID="txtNroLote" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnNroLote" runat="server" Text="Ingresar" 
                            onclick="btnNroLote_Click" />
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style10">
                        <asp:Label ID="Label15" runat="server" Text="Fecha Venc:"></asp:Label>
                    </td>
                     <td class="style11">
                                    <asp:TextBox ID="txtFechaVenc" runat="server" AutoPostBack="True" 
                                        ontextchanged="txtFechaVenc_Changed" />
                                    <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/1410380987_Calendar_24x24.png" 
                                    ImageAlign="Middle"  style="vertical-align:middle" />
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" 
                                        PopupButtonID="Image1" TargetControlID="txtFechaVenc">
                                    </asp:CalendarExtender>
                                </td>
                    <td>
                        <asp:Button ID="btnFechaVenc" runat="server" Text="Ingresar" 
                            onclick="btnFechaVenc_Click" />
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr><td height="10px"></td></tr>
                <tr>
                <td colspan="5">
                 <asp:CheckBox ID="checkSeleccionTodo" runat="server" AutoPostBack="True" 
                            Font-Bold="True" Font-Size="Medium" 
                            oncheckedchanged="checkSeleccionTodo_CheckedChanged" 
                            Text="Seleccionar Todo" style="margin-left:28px" />
                </td>
                </tr>
                <tr>
                    <td colspan="5" style="text-align: center">
                        <asp:GridView ID="gvDetalle" runat="server" AutoGenerateColumns="False"
                                        HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" 
                                        ForeColor="#333333" GridLines="None" Style="margin-top: 10px; margin-left:32px" 
                                        Width="550px">
                                        <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                        
                            <Columns>
                            <asp:TemplateField ShowHeader="False" HeaderText="Cant. Total Ingresada">
                                    <ItemTemplate>                                        
                                    <asp:CheckBox ID="CheckHerramienta"  oncheckedchanged="CheckHerramienta_CheckedChanged" 
                                    runat="server" Width="50px" ItemStyle-CssClass="estiloHeaderTabla" AutoPostBack="True"  />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:TemplateField>
                            
                                <asp:BoundField DataField="NroHerramienta" HeaderText="Código" 
                                    SortExpression="NroHerramienta" HeaderStyle-Width="45px" ItemStyle-CssClass="estiloHeaderTabla">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="45px"></HeaderStyle>
                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                    
                                <asp:BoundField DataField="DescripHerramienta" HeaderText="Herramienta" 
                                    SortExpression="DescripHerramienta" HeaderStyle-Width="100px" ItemStyle-CssClass="estiloHeaderTabla">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="100px"></HeaderStyle>
                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                    
                                   <asp:TemplateField ShowHeader="False" HeaderText="Lote">
                                                <ItemTemplate>
                                                <asp:TextBox ID="txtNroLote" runat="server" Width="50px" ItemStyle-CssClass="estiloHeaderTabla"/>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:TemplateField>
                                   
                                   <asp:TemplateField ShowHeader="False" HeaderText="Fecha Vencimiento (dd/mm/aaaa)">
                                                <ItemTemplate>
                                                <asp:TextBox ID="txtFechaVen"  runat="server" Width="100px" ItemStyle-CssClass="estiloHeaderTabla" Font-Italic="True" />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="100px"></HeaderStyle>
                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:TemplateField>
                                    
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="style10">
                    </td>
                    <td class="style10">
                    </td>
                    <td class="style10">
                    </td>
                    <td class="style10">
                    </td>
                    <td class="style10">
                    </td>
                </tr>
                <tr>
                     <td colspan="5" style="text-align: left">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:Button ID="btnRegistrar" runat="server" onclick="btnRegistrar_Click" 
                                    style="margin-left:200px; margin-top:20px" Text="Registrar" ValidationGroup="1" />
                                <span style="display: none">
                                <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
                                </span>
                                <asp:ModalPopupExtender ID="ModalPopupConfirmacion" runat="server" 
                                    BackgroundCssClass="reveal-modal-bg" PopupControlID="popUpConfirmacion" 
                                    TargetControlID="LinkButton1">
                                </asp:ModalPopupExtender>

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
                <tr>
                    <td class="style10">
                    </td>
                    <td class="style10">
                    </td>
                    <td class="style10">
                    </td>
                    <td class="style10">
                    </td>
                    <td class="style10">
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
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo" >
            <div class="heading">
                <asp:Label ID="Label9" runat="server" Text="¿Desea registrar el INGRESO de HERRAMIENTAS?" ></asp:Label>
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
        <asp:Image ID="Image4" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="36px" />
    </div>

     <div class="heading" style="width:400px">
        <asp:Label ID="Label13" runat="server" Text="Las HERRAMIENTAS fueron registradas con éxito" style="margin-right:15px"></asp:Label>
        <br />
        </div>
        <div class="content" style="height:100px;border-top: 0.1px solid #bababa; width:400px">
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

