<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true" CodeFile="RegistrarInsumo.aspx.cs" Inherits="MPreventivo_RegistrarInsumo" Title="Página sin título" %>
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
            height: 23px;
        }
        .style11
        {
        }
        .style12
        {
            height: 23px;
            width: 217px;
        }
        .style13
        {
        }
        .style14
        {
            height: 20px;
        }
        .style15
        {
            height: 10px;
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
            <table class="style9">
                <tr>
                    <td colspan="5" 
                        style="background: -webkit-linear-gradient(180deg, #FFFFFF, #E0ECF8); border-left-style: outset">
                        <asp:Label ID="Label4" runat="server" Text="Insumo Nº: "></asp:Label>
                        <asp:Label ID="lblNroInsumo" runat="server" Font-Bold="True" Font-Italic="True" 
                            Font-Size="Medium"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style13">
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
                    <td class="style13" style="text-align: right">
                        <asp:Label ID="Label5" runat="server" Text="Tipo Insumo:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTipoInsumo" runat="server" 
                            DataSourceID="sdsTipoInsumo" DataTextField="DESCRIPCION" 
                            DataValueField="IDTIPOINSUMO">
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
                    <td class="style13" style="text-align: right">
                        <asp:Label ID="Label6" runat="server" Text="Nombre:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNombre" runat="server" 
                            ControlToValidate="txtNombre" 
                            ErrorMessage="Debe ingresar un NOMBRE para el INSUMO" ValidationGroup="1" CssClass="font">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label7" runat="server" Text="Unidad Medida:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUnidadMedida" runat="server" OnTextChanged="txtUnidadMedida_TextChanged" AutoPostBack="true"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUnidad" runat="server" 
                            ControlToValidate="txtUnidadMedida" 
                            ErrorMessage="Debe ingresar la UNIDAD de MEDIDA" ValidationGroup="1" CssClass="font">*</asp:RequiredFieldValidator>
                    </td>
                    <td colspan="3" style="border-left-style: outset">
                        <asp:Label ID="lblUnidadMedidaEjemplo" runat="server" Font-Italic="True" 
                            ForeColor="#999999" Text="Ej: Metros, litros, KW, Hz, Pulgadas, Ampere, Ohm"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label27" runat="server" Text="Especificación:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEspecificacion" runat="server" AutoPostBack="True" 
                            ontextchanged="txtEspecificacion_TextChanged"></asp:TextBox>
                    </td>
                    <td colspan="3" style="border-left-style: outset">
                        <asp:Label ID="lblUnidadMedidaEjemplo0" runat="server" Font-Italic="True" 
                            ForeColor="#999999" 
                            Text="Especificación del insumos en el caso que no sea una Unidad de Medida."></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="5" class="style15">
                    </td>
                </tr>
                <tr>
                    <td class="style13" style="text-align: right; vertical-align: top;" 
                        rowspan="11">
                        <asp:Label ID="Label8" runat="server" Text="Especificaciones Técnicas:"></asp:Label>
                    </td>
                    <td height="14px"></td>
                    </tr>
                    <tr>
                    <td colspan="4">
                        <asp:Label ID="Label23" runat="server" Font-Italic="True" 
                            Text="Temperatura Soportada" ForeColor="#494646" style="margin-left:9px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:TextBox ID="txtTemperatura" runat="server" Width="400px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Label ID="Label24" runat="server" Font-Italic="True" 
                            Text="Amperaje Soportado" ForeColor="#494646" style="margin-left:9px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:TextBox ID="txtAmperaje" runat="server" Width="400px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Label ID="Label25" runat="server" Font-Italic="True" 
                            Text="Condiciones Climáticas" ForeColor="#494646" style="margin-left:9px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:TextBox ID="txtCondClima" runat="server" Width="400px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style14" colspan="4">
                        <asp:Label ID="Label26" runat="server" Font-Italic="True" 
                            Text="Modo de Instalación" ForeColor="#494646" style="margin-left:9px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style14" colspan="4">
                        <asp:TextBox ID="txtModoInst" runat="server" Width="400px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Label ID="Label9" runat="server" Font-Italic="True" Text="Otras" 
                            ForeColor="#494646" style="margin-left:9px"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:TextBox ID="txtOtro" runat="server" 
                            Width="400px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td colspan="3">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style13">
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
                            onclick="btnRegistrar_Click" style="margin-left:150px" 
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
                    <td class="style13">
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
                    <td class="style13" colspan="5">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                             ValidationGroup="1" CssClass="font"/>
                    </td>
                </tr>
                <tr>
                    <td class="style11" colspan="5">
                        <asp:SqlDataSource ID="sdsTipoInsumo" runat="server" 
                            ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                            ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [TIPOINSUMO]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style13">
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
                    <td class="style13">
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
                    <td class="style13">
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
                <asp:Label ID="Label1" runat="server" Text="¿Desea registrar el INSUMO?" ></asp:Label>
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
        <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="40px" />
    </div>

     <div class="heading">
        <asp:Label ID="Label22" runat="server" Text="El INSUMO fue registrado con éxito" style="margin-right:15px"></asp:Label>
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

