
<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true" CodeFile="RegistrarProveddor.aspx.cs" Inherits="MPreventivo_RegistrarProveddor" Title="Página sin título" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
 
<link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
          .datos
        {
            text-align: right;
        }
          .estiloHeaderTabla
        {
        	    font-family:Sans-Serif;
                Font-Size :13px; 
                background-color:#b9c9fe;
        
                font-weight: bold;
                background: #b9c9fe;
                border-top: 4px solid #aabcfe;
                border-bottom: 1px solid #fff;
                color: #039;
                padding: 8px;
                border-left-style:none;
                border-right-style:none;
                border-left:none;
          
        }
        .estiloFilasTabla
        {
              text-align:center;
              font-family:Sans-Serif;
              font-size:13px;
              border-left-style:none;
              border-left-width:0px;
              border-bottom: 1px solid #fff;
        }
        .tablaMargen
        { margin-left:63px;
        	}
        .botonPopUp
        {
        	margin-left:0px;
        	margin-top:30px;
        	text-align:center;
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
        .style9
        {
            width: 100%;
        }
        .style10
        {
            text-align: left;
        }
        .style11
        {
            text-align: left;
            height: 29px;
        }
        .style12
        {
            height: 29px;
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
                        <asp:Label ID="Label4" runat="server" Text="Proveedor Nº: " Font-Size="Small"></asp:Label>
                        <asp:Label ID="lblNroProveedor" runat="server" Font-Bold="True" 
                            Font-Italic="True" Font-Size="Medium"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td >
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
                <table style=" margin-top:0px">
                <tr>
                    <td colspan="5" style="border-bottom-style: inset" height="25px" width="800px">
                        <asp:Label ID="Label6" runat="server" Font-Italic="True" Font-Size="Medium" 
                            Text="Datos de la Empresa"></asp:Label>
                    </td>
                </tr>
                </table>
                <table>
                <tr>
                    <td class="style10">
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
                        <asp:Label ID="Label5" runat="server" Text="Razon Social:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRazonSocial" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorRazonSocial" 
                            runat="server" ControlToValidate="txtRazonSocial" 
                            ErrorMessage="Debe ingresar una RAZON SOCIAL" ValidationGroup="1" CssClass="font">*</asp:RequiredFieldValidator>
                    </td>
                    <td style="text-align: right">
                        <asp:Label ID="Label29" runat="server" Text="Tipo de Empresa:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTipoEmpresa" runat="server" 
                            DataSourceID="sdsTipoEmpresa" DataTextField="DESCRIPCION" 
                            DataValueField="IDTIPOORGANIZACION">
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label7" runat="server" Text="CUIT:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCUIT" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCUIT" runat="server" 
                            ControlToValidate="txtCUIT" ErrorMessage="Debe ingresar el CUIT" 
                            ValidationGroup="1" CssClass="font">*</asp:RequiredFieldValidator>
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
                        <asp:Label ID="Label8" runat="server" Text="Fecha Inicio Actividad:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFechaInicio" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorFechaInicioActv" 
                            runat="server" ControlToValidate="txtFechaInicio" 
                            ErrorMessage="Debe ingresar la FECHA DE INICIO DE ACTIVIDAD de la EMPRESA" 
                            ValidationGroup="1" CssClass="font">*</asp:RequiredFieldValidator>
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
                        <asp:Label ID="Label15" runat="server" Text="Provincia:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlProvinvia" runat="server" AutoPostBack="True" 
                            DataSourceID="sdsProvincia" DataTextField="NOMBRE" DataValueField="IDPROVINCIA">
                        </asp:DropDownList>
                    </td>
                    <td style="text-align: right">
                        <asp:Label ID="Label16" runat="server" Text="Ciudad:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCiudad" runat="server" AutoPostBack="True" 
                            DataSourceID="sdsCiudad" DataTextField="NOMBRE" DataValueField="IDCIUDAD">
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label9" runat="server" Text="Calle:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCalle" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCalle" runat="server" 
                            ControlToValidate="txtCalle" ErrorMessage="Debe ingresar la CALLE" 
                            ValidationGroup="1" CssClass="font">*</asp:RequiredFieldValidator>
                    </td>
                    <td style="text-align: right">
                        <asp:Label ID="Label10" runat="server" Text="Nro:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNrocalle" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNroCalle" runat="server" 
                            ControlToValidate="txtNrocalle" 
                            ErrorMessage="Debe ingresar el NÚMERO de la Calle" ValidationGroup="1" CssClass="font">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td >
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td style="text-align: right">
                        <asp:Label ID="Label11" runat="server" Text="Piso:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPiso" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td >
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td style="text-align: right">
                        <asp:Label ID="Label12" runat="server" Text="Depto:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDepto" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label13" runat="server" Text="Teléfono:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTelefono" runat="server" 
                            ErrorMessage="Debe ingresar el TELEFONO de la empresa" 
                            ControlToValidate="txtTelefono" ValidationGroup="1" CssClass="font">*</asp:RequiredFieldValidator>
                    </td>
                    <td style="text-align: right">
                        <asp:Label ID="Label14" runat="server" Text="e-mail:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" 
                            ControlToValidate="txtEmail" 
                            ErrorMessage="Debe ingresar el  E-MAIL de la emrpesa" ValidationGroup="1" CssClass="font">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td style="text-align: right">
                        <asp:Label ID="Label30" runat="server" Text="Sitio WEB:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPaginaWEB" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style10">
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
                <table style="margin-top:0px">
                <tr>
                    <td colspan="5" style="border-bottom-style: inset" height="25px" width="800px">
                        <asp:Label ID="Label17" runat="server" Font-Italic="True" Font-Size="Medium" 
                            Text="Datos Responsable"></asp:Label>
                    </td>
                </tr>
                </table>
                <table>
                <tr>
                    <td class="style10">
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
                        <asp:Label ID="Label18" runat="server" Text="Tipo Documento:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTipoDoc" runat="server" DataSourceID="sdsTipoDoc" 
                            DataTextField="DESCRIPCION" DataValueField="IDTIPODOCUMENTO">
                        </asp:DropDownList>
                    </td>
                    <td style="text-align: right">
                        <asp:Label ID="Label19" runat="server" Text="Nro. Documento:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtNroDoc" runat="server"></asp:TextBox></td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label1" runat="server" Text="Apellido:"></asp:Label>
                    <td>
                        <asp:TextBox ID="txtApellidoResp" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidatorApellido" 
                            runat="server" ControlToValidate="txtApellidoResp" 
                            ErrorMessage="Debe ingresar el APELLIDO del responsable" 
                            ValidationGroup="1" CssClass="font">*</asp:RequiredFieldValidator>
                        </td>
                    <td style="text-align: right">
                        <asp:Label ID="Label2" runat="server" Text="Nombre:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtNombreResp" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNombre" 
                            runat="server" ControlToValidate="txtNombreResp" 
                            ErrorMessage="Debe ingresar el NOMBRE del responsable" 
                            ValidationGroup="1" CssClass="font">*</asp:RequiredFieldValidator></td>
                    <td>
                        </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label20" runat="server" Text="Sexo:"></asp:Label>
                        </td>
                    <td colspan="4">
                        <asp:RadioButton ID="drdbMasculino" runat="server" GroupName="Sexo" 
                            Text="Masculino" style="text-align: right" />
                            <asp:RadioButton ID="rdbFemenino" runat="server" GroupName="Sexo" 
                            Text="Femenino" /></td>
                   
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label21" runat="server" Text="Teléfono:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtTelResponsable" runat="server"></asp:TextBox></td>
                    <td style="text-align: right">
                       <asp:Label ID="Label28" runat="server" Text="e-mail:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtEmailResp" runat="server"></asp:TextBox></td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label3" runat="server" Text="Cargo:"></asp:Label></td>
                    <td colspan="4">
                        <asp:TextBox ID="txtCargoResponsable" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCargo" 
                            runat="server" ControlToValidate="txtCargoResponsable" 
                            ErrorMessage="Debe ingresar el CARGO del responsable" 
                            ValidationGroup="1" CssClass="font">*</asp:RequiredFieldValidator>
                       </td>
                </tr>
                <tr>
                    <td class="style11">
                        </td>
                    <td class="style12">
                        </td>
                    <td class="style12">
                        </td>
                    <td class="style12">
                        </td>
                    <td class="style12">
                        </td>
                        
                </tr>
                <tr>
                    <td colspan="5">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="BTNRegistrar" runat="server" onclick="BTNRegistrar_Click" 
                            Text="Registrar" style="margin-left:180px" ValidationGroup="1" CssClass="font"/>
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
                            <asp:ModalPopupExtender ID="ModalPopupDarAlta" PopupControlID="popUpDarAlta"
                             runat="server" TargetControlID="LinkButton4" BackgroundCssClass="reveal-modal-bg">
                            </asp:ModalPopupExtender>
                            
                    <span style="display: none">
                            <asp:LinkButton ID="LinkButton5" runat="server">LinkButton</asp:LinkButton>
                    </span>
                            <asp:ModalPopupExtender ID="ModalPopupExisteLaEmpresa" PopupControlID="popUpExisteLaEmpresa"
                             runat="server" TargetControlID="LinkButton5" BackgroundCssClass="reveal-modal-bg">
                            </asp:ModalPopupExtender>
                                               
                    </ContentTemplate>
                </asp:UpdatePanel>
                        </td>
                </tr>
                <tr>
                    <td class="style10">
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
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            ValidationGroup="1" CssClass="font"/>
                    </td>
                </tr>
                <tr>
                    <td class="style10">
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
    
    <asp:SqlDataSource ID="sdsTipoDoc" runat="server" 
        ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT * FROM [TIPODOCUMENTO]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsProvincia" runat="server" 
        ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [PROVINCIA]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsCiudad" runat="server" 
        ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT IDCIUDAD, NOMBRE FROM CIUDAD WHERE IDPROVINCIA = @idProvinvia">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlProvinvia" Name="idProvinvia" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    
   
    
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo" >
            <div class="heading">
                <asp:Label ID="Label24" runat="server" Text="¿Desea guardar los cambios?" ></asp:Label>
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
        <asp:Label ID="Label25" runat="server" Text="Se perderán los datos ingresados" style="margin-right:25px"></asp:Label>
        <br />
        <asp:Label ID="Label26" runat="server" Text="¿Desea Continuar?"></asp:Label>
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
        <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="38px" />
    </div>

     <div class="heading">
        <asp:Label ID="Label27" runat="server" Text="Se ha realizado con éxito su operación" style="margin-right:15px"></asp:Label>
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
    
     <asp:Panel ID="popUpDarAlta" runat="server" Style="display: none" CssClass="divFondo" >
                <div class="heading">
                <asp:Label ID="Label22" runat="server" Text="El Proveedor EXISTE pero esta dado de BAJA" style="margin-right:25px"></asp:Label>
                <br />
                <asp:Label ID="Label23" runat="server" Text="¿Desea darlo de ALTA?"></asp:Label>
                </div
                <div class="content" style="height:100px;border-top: 0.1px solid #bababa">
                <div style="margin-right:15px;text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel6" runat="server" >
              
                <ContentTemplate>
              
                    <asp:Button ID="btnAceptarDarAlta" runat="server" Text="Aceptar" onclick="btnAceptarDarAlta_Click" CssClass="botonPopUp" />
                    <asp:Button ID="btnCancelarDarAlta" runat="server" Text="Cancelar" onclick="btnCancelarDarAlta_Click"/>
                 
                </ContentTemplate>
                    
                </asp:UpdatePanel>
                </div>
                </div>
            </asp:Panel>
            
     <asp:Panel ID="popUpExisteLaEmpresa" runat="server" Style="display: none" CssClass="divFondo" >
                <div class="heading">
                <asp:Label ID="Label31" runat="server" Text="El Proveedor ya EXISTE" style="margin-right:25px"></asp:Label>
                <br />
                <asp:Label ID="Label32" runat="server" Text="La operación fue cancelada"></asp:Label>
                </div
                <div class="content" style="height:100px;border-top: 0.1px solid #bababa">
                <div style="margin-right:15px;text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel7" runat="server" >
              
                <ContentTemplate>
              
                    <asp:Button ID="btnAceptarExistEmpresa" runat="server" Text="Aceptar" onclick="btnAceptarExistEmpresa_Click" CssClass="botonPopUp" />
                    
                 
                </ContentTemplate>
                    
                </asp:UpdatePanel>
                </div>
                </div>
            </asp:Panel>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <asp:SqlDataSource ID="sdsTipoEmpresa" runat="server" 
        ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT * FROM [TIPOORGANIZACION]"></asp:SqlDataSource>
    
</asp:Content>

