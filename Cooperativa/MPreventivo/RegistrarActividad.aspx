<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true" CodeFile="RegistrarActividad.aspx.cs" Inherits="MPreventivo_RegistrarActividad" Title="Página sin título" %>
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
            height: 24px;
        }
        .style10
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style9" width="800px">
                <tr>
                    <td style="background: -webkit-linear-gradient(180deg, #FFFFFF, #E0ECF8); text-align: left; border-left-style: outset;" 
                        colspan="5">
                        <asp:Label ID="Label15" runat="server" Text="Tarea:"></asp:Label>
                        <asp:Label ID="lblTarea" runat="server" Font-Bold="True" Font-Italic="True" 
                            Font-Size="Medium"></asp:Label>
                    </td>
                </tr>
                </table>
                <table width="800px">
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td colspan="2">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="border-bottom-style: inset;" colspan="5">
                        <asp:Label ID="Label6" runat="server" Text="Actividad" Font-Italic="True" 
                            Font-Size="Medium"></asp:Label>
                       </td>
                </tr>
                </table>
                <table style="margin-top:0px; margin-left:18px" >
                <tr>
                    <td style="text-align: right">
                        &nbsp;</td>
                    <td colspan="4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label7" runat="server" style="text-align: right" Text="Nombre:"></asp:Label>
                    </td>
                    <td colspan="4">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" 
                            ControlToValidate="TextBox1" 
                            ErrorMessage="Debe indicar un nombre para la Actividad" ValidationGroup="1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr><td></td></tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label8" runat="server" Text="Descripción:"></asp:Label>
                    </td>
                    <td colspan="4">
                        <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label9" runat="server" Text="Complejidad:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlComplejidad" runat="server" AutoPostBack="True" 
                            DataSourceID="sdsComplejidad" DataTextField="NOMBRE" 
                            DataValueField="IDCOMPLEJIDAD" Height="28px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:FormView ID="FormViewDutración" runat="server" 
                            DataSourceID="sdsDuracionComplejidad" style="margin-top:0px; margin-left:15px">
                            <EditItemTemplate>
                                DURACION:
                                <asp:TextBox ID="DURACIONTextBox" runat="server" 
                                    Text='<%# Bind("DURACION") %>' />
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Actualizar" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                    CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                DURACION:
                                <asp:TextBox ID="DURACIONTextBox" runat="server" 
                                    Text='<%# Bind("DURACION") %>' />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                    CommandName="Insert" Text="Insertar" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                    CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label16" runat="server" Text="Duración:"></asp:Label>
                                
                                <asp:Label ID="DURACIONLabel" runat="server" Text='<%# Bind("DURACION") %>' />
                                &nbsp;
                                <asp:Label ID="Label17" runat="server" Text="Minutos"></asp:Label>
                                <br />
                            </ItemTemplate>
                        </asp:FormView>
                        
                    </td>
                    <td>
                        <asp:Panel ID="PanelDuracion" runat="server" Visible="False">
                            <table class="style9" style="margin-top:0px; margin-left:10px">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label12" runat="server" Text="Duración Estimada:"></asp:Label>
                                    </td>
                                    <td style="text-align: left">
                                        <asp:TextBox ID="txtDuracion" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvDuracion" runat="server" 
                                            ErrorMessage="Debe ingresar una duración para la actividad"
                                            ValidationGroup="1" ControlToValidate="txtDuracion">*</asp:RequiredFieldValidator>
                                        <asp:Label ID="Label13" runat="server" Text="Minutos"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Button ID="btnModificarDuracion" runat="server" Text="Modificar" 
                            onclick="btnModificarDuracion_Click" />
                    </td>
                </tr>
                </table>
                <table style="margin-top:0px">
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label11" runat="server" Text="Tipo de Insumo:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTipoInsumo" runat="server" AutoPostBack="True" 
                            DataSourceID="sdsTipoInsumo" DataTextField="DESCRIPCION" 
                            DataValueField="IDTIPOINSUMO" Height="28px">
                        </asp:DropDownList>
                    </td>
                    <td style="text-align: right" width="71px">
                        <asp:Label ID="Label10" runat="server" Text="Insumos:"></asp:Label>
                    </td>
                    <td style="text-align: left">
                        <asp:DropDownList ID="ddlInsumos" runat="server" AutoPostBack="True" 
                            DataSourceID="sdsInsumos" DataTextField="NOMBRE" DataValueField="IDINSUMO" Height="28px">
                        </asp:DropDownList>
                    </td>
                    <td style="text-align: left">
                        <asp:Button ID="btnAgregar" runat="server" onclick="btnAgregar_Click" 
                            Text="Agregar" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center" colspan="5">
                        <asp:GridView ID="gvInsumo" runat="server" AutoGenerateColumns="False" 
                            onrowcommand="gvInsumo_RowCommand" HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4"
                            ForeColor="#333333" GridLines="None"  Width="530px" style="margin-left:100px">
                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                             
                            <Columns>
                                <asp:BoundField DataField="NroInsumo" HeaderText="Código Insumo" 
                                    SortExpression="NroInsumo" HeaderStyle-Width="85px" ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="85px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                
                                <asp:BoundField DataField="Nombre" HeaderText="Insumo" 
                                    SortExpression="Nombre" HeaderStyle-Width="55px" ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="55px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                
                                <asp:BoundField DataField="UnidadMedida" HeaderText="Unidad Medida" 
                                    SortExpression="UnidadMedida" HeaderStyle-Width="85px" ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="85px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                                
                                <asp:BoundField DataField="TipoInsumo" HeaderText="Tipo Insumo" 
                                    SortExpression="TipoInsumo" HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:BoundField>
                               
                               <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                <asp:Button ID="btnEliminar" CommandArgument='<%# Eval("nroInsumo") %>' CommandName="DeleteRow" runat="server" CausesValidation="false" Text="Eliminar" ItemStyle-CssClass="estiloHeaderTabla" Width="70px" />
                                </ItemTemplate>
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td>
                    
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left" colspan="5" class="style11">
                        <asp:Label ID="lblMensaje" runat="server" Text="" ForeColor="Red" 
                            style="text-align: left"></asp:Label></td>
                </tr>
                <tr>
                    <td style="text-align: left" colspan="5">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" >
                    <ContentTemplate>
                                     
                     <asp:Button ID="btnRegistrar" runat="server" Text="Registrar"  
                            onclick="btnRegistrar_Click" style="margin-left:200px; margin-top:15px" 
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
                            
                    <span style="display: none">
                            <asp:LinkButton ID="LinkButton4" runat="server">LinkButton</asp:LinkButton>
                    </span>
                            <asp:ModalPopupExtender ID="ModalPopupInsumo" PopupControlID="popUpInsumo"
                             runat="server" TargetControlID="LinkButton4" BackgroundCssClass="reveal-modal-bg">
                            </asp:ModalPopupExtender>
                            
                    </ContentTemplate>
                </asp:UpdatePanel>
                        
                        
                        </td>
                </tr>
                <tr>
                <td colspan ="5">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="1"/>
                </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <asp:SqlDataSource ID="sdsComplejidad" runat="server" 
                            ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                            ProviderName="System.Data.SqlClient" 
                            
                            SelectCommand="SELECT IDCOMPLEJIDAD, NOMBRE, DURACION FROM COMPLEJIDADACTIVIDAD"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="sdsDuracionComplejidad" runat="server" 
                            ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                            ProviderName="System.Data.SqlClient" 
                            
                            SelectCommand="SELECT DURACION FROM COMPLEJIDADACTIVIDAD WHERE (IDCOMPLEJIDAD = @idComplejidad)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlComplejidad" Name="idComplejidad" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="sdsInsumos" runat="server" 
                            ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                            ProviderName="System.Data.SqlClient" 
                            SelectCommand="SELECT IDINSUMO, NOMBRE FROM INSUMO WHERE IDTIPOINSUMO = @idTipoInsumo">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlTipoInsumo" Name="idTipoInsumo" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="sdsTipoInsumo" runat="server" 
                            ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                            ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [TIPOINSUMO]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo" >
            <div class="heading">
                <asp:Label ID="Label1" runat="server" Text="¿Desea registrar la ACTIVIDAD?" ></asp:Label>
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
            
            
     <asp:Panel ID="popUpInsumo" runat="server" Style="display: none" CssClass="divFondo">
     <div style="float:left; width:40px; margin-left: 20px;margin-top: 3px;">
        <asp:Image ID="Image3" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="40px" />
    </div>
    <div class="heading" style="width:360px">
        <asp:Label ID="Label5" runat="server" Text="No ha seleccionado ningun insumo" style="margin-right:25px"></asp:Label>
        <br />
        <asp:Label ID="Label14" runat="server" Text="¿Desea Continuar?"></asp:Label>
        </div>
        <div class="content" style="height:100px;border-top: 0.1px solid #bababa; width:360px">
        <div style="margin-right:15px;text-align: center">
        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
        <ContentTemplate>
            <asp:Button ID="btnAceptarSinInsumo" runat="server" Text="Aceptar" CausesValidation="False" onclick="btnAceptarSinInsumo_Click" style="margin-top:50px"/>
            <asp:Button ID="btnCancelarSinInsumo" runat="server" Text="Cancelar" CausesValidation="False" onclick="btnCancelarSinInsumo_Click"/>
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
        <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="37px" />
    </div>

     <div class="heading">
        <asp:Label ID="Label4" runat="server" Text="La ACTIVIDAD fue registrada con éxito" style="margin-right:15px"></asp:Label>
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
                    
 
