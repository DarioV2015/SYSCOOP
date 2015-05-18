<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true" CodeFile="RegistrarHerramienta.aspx.cs" Inherits="MPreventivo_RegistrarHerramienta" Title="Página sin título" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
  <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style9
        {
            width: 100%;
        }
        .style10
        {
            height: 23px;
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
         .font
        {
        	font-family:Sans-Serif;
        	font-size:14px
        	}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="800px">
                <tr>
                    <td colspan="5" 
                        style="background: -webkit-linear-gradient(180deg, #FFFFFF, #E0ECF8); border-left-style: outset">
                        <asp:Label ID="Label4" runat="server" Text="Herramienta Nº: "></asp:Label>
                        <asp:Label ID="lblNroHerramienta" runat="server" Font-Bold="True" 
                            Font-Italic="True" Font-Size="Medium"></asp:Label>
                    </td>
                </tr>
                </table>
                <table>
                <tr>
                    <td>
                        </td>
                    <td>
                        </td>
                    <td>
                       </td>
                    <td>
                      </td>
                    <td>
                       </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label5" runat="server" Text="Tipo Herramienta:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTipoHerramienta" runat="server" AutoPostBack="True" 
                            DataSourceID="sdsTipoHerramienta" DataTextField="DESCRIPCION" 
                            DataValueField="IDTIPOHERRAMIENTA">
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
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
                    <td>
                        </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label6" runat="server" Text="Nombre:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtNombre" 
                            ErrorMessage="Debe ingresar un nombre para la HERRAMIENTA" ValidationGroup="1">*</asp:RequiredFieldValidator>
                    </td>
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
                    <td style="text-align: right">
                        <asp:Label ID="Label7" runat="server" Text="Especificaciones Técnicas:"></asp:Label>
                    </td>
                    <td colspan="4">
                        <asp:Label ID="Label23" runat="server" Font-Italic="True" 
                            Text="Durabilidad" ForeColor="#424141" style="margin-left:10px"></asp:Label>
                        </td>
                </tr>
                <tr>
                    <td class="style10">
                        </td>
                    <td class="style10" colspan="4">
                     <asp:TextBox ID="txtDurabilidad" runat="server" Width="400px"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td colspan="4">
                        <asp:Label ID="Label24" runat="server" Font-Italic="True" ForeColor="#424141" 
                            Text="Seguridad"  style="margin-left:10px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style10">
                        </td>
                    <td class="style10" colspan="4">
                        <asp:TextBox ID="txtSeguridad" runat="server" Width="400px"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td colspan="4">
                        <asp:Label ID="Label25" runat="server" Font-Italic="True" ForeColor="#424141" 
                            Text="Normas"  style="margin-left:10px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style10">
                        </td>
                    <td class="style10" colspan="4">
                        <asp:TextBox ID="txtNormas" runat="server" Width="400px"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td colspan="4">
                        <asp:Label ID="Label26" runat="server" Font-Italic="True" ForeColor="#424141" 
                            Text="Otras"  style="margin-left:10px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td colspan="4">
                        <asp:TextBox ID="txtOtras" runat="server" Width="400px"></asp:TextBox>
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
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                                     
                     <asp:Button ID="btnRegistrar" runat="server" Text="Registrar"  
                            onclick="btnRegistrar_Click" style="margin-left:250px; margin-top:15px" 
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
                <caption>
                    <tr>
                        <td class="style13" colspan="5">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                 ValidationGroup="1" CssClass="font" />
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
                </caption>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    
  <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo" >
            <div class="heading">
                <asp:Label ID="Label1" runat="server" Text="¿Desea registrar la HERRAMIENTA?" ></asp:Label>
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
        <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="36px" />
    </div>

     <div class="heading">
        <asp:Label ID="Label22" runat="server" Text="La HERRAMIENTA fue registrada con éxito" style="margin-right:15px"></asp:Label>
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
    
    
    
    
    <asp:SqlDataSource ID="sdsTipoHerramienta" runat="server" 
        ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
        SelectCommand="SELECT * FROM [TIPOHERRAMIENTA]"></asp:SqlDataSource>
    
    
    
    
</asp:Content>

