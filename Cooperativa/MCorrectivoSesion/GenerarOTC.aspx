<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="GenerarOTC.aspx.cs" Inherits="MCorrectivoSesion_GenerarOTC" Title="Generar OTC" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
    <link href="../Style/TabStyle2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .datos
        {
            text-align: right;
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
            colspan: 5;
            border-bottom-style: inset;
            height: 25px;
            font-size: 12px;
        }
        .style8
        {
            width: 250px;
        }
        .estiloHeaderTabla
        {
            font-family: 'trebuchet MS' , 'Lucida sans' , Arial;
            font-size: 12px;
            background-color: #b9c9fe;
            font-weight: bold;
            background: #b9c9fe;
            border-top: 2px solid #aabcfe;
            border-bottom: 1px solid #fff;
            color: #039;
            padding: 8px;
            border-right-style: none;
            border-left-style: ridge;
            border-left-color: #98A9DF;
            border-left-width: 1px;
        }
        .estiloFilasTabla
        {
            font-family: 'trebuchet MS' , 'Lucida sans' , Arial;
            font-size: 12px;
            color: #000;
            text-align: center;
            border-left-style: none;
            border-left-width: 0px;
            border-bottom: 1px solid #fff;
            border-right-style: none;
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
            height: auto;
        }
         .FieldDatos
        {
        	height: 138px;
            border-radius: 6px;
            border-color: rgb(196, 194, 194);
            border-style: solid;
            border-width: 1px;
        }
        
         .legendDatos
        {
        	font-family:Calibri;
        	font-size:17px;
        }
        .display
        {
        	display:flex;
        	}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<asp:TabContainer   ID="tabconteiner1" runat="server" ActiveTabIndex="0" 
     CssClass="TabStyle2" style="margin-top:10px">
    <asp:TabPanel ID= "tabPanel1" runat="server" HeaderText="Reclamo Actual" style="display:flex" CssClass="display">
    <ContentTemplate>
   <fieldset class="FieldDatos" style="margin-bottom:15px; margin-top:10px; margin-left:140px">
   <legend class="legendDatos">Datos del Reclamo</legend>
    <table style="margin-left: 10px;margin-top: 5px; height:100px" width="300px">
        <tr>
            <td >
                <asp:Label ID="Label5" runat="server" Text="Nro. Reclamo:"></asp:Label>
            </td>
            <td>
                <asp:Label ID="txtNroReclamo" runat="server" Enabled="False"></asp:Label>
            </td>
            </tr>
            <tr>
            <td >
                <asp:Label ID="Label8" runat="server" Text="Reclamo:"></asp:Label>
            </td>
            <td>
                <asp:Label ID="txtDescripcion" runat="server" Enabled="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label6" runat="server" Text="Tipo Reclamo:"></asp:Label>
            </td>
            <td>
                <asp:Label ID="txtTipoReclamo" runat="server" Enabled="False"></asp:Label>
            </td>
            </tr>
            <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Prioridad:"></asp:Label>
            </td>
            <td>
                <asp:Label ID="txtPrioridad" runat="server" Enabled="False"></asp:Label>
            </td>
        </tr>
    </table>
    </fieldset>
    <fieldset class="FieldDatos" style="margin-bottom:15px; margin-top:10px; margin-left:60px">
    <legend class="legendDatos">Domicilio del Reclamo</legend>
    
    <table width="220px" style="height:70px; margin-top:5px">
        <tr>

            <td >
                <asp:Label ID="Label15" runat="server" Text="Calle:"></asp:Label>

            <td width="110px">
                <asp:Label ID="txtCalle" runat="server" Enabled="False"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label16" runat="server" Text="Nº:"></asp:Label>
            </td>
            <td>
                <asp:Label ID="txtNroCalle" runat="server" Enabled="False"></asp:Label>
            </td>
            </tr>
            <tr>
            <td >
                <asp:Label ID="Label17" runat="server" Text="Piso:"></asp:Label>
            </td>
            <td>
                <asp:Label ID="txtPiso" runat="server" Enabled="False"></asp:Label>
            </td>
            <td >
                <asp:Label ID="Label3" runat="server" Text="Dpto.:"></asp:Label>
            </td>
            <td>
                <asp:Label ID="txtDpto" runat="server" Enabled="False"></asp:Label>
            </td>
            </tr>
            <tr>
            <td>
                <asp:Label ID="Label18" runat="server" Text="Zona:"></asp:Label>
            </td>
            <td>
                <asp:Label ID="txtZona" runat="server" Enabled="False"></asp:Label>
            </td>
        </tr>
    </table>
    </fieldset>
    </ContentTemplate>
    </asp:TabPanel>
    <asp:TabPanel ID= "tabPanel2" runat="server" HeaderText="Titular del Reclamo" >
    <ContentTemplate>    
    <fieldset class="FieldDatos" style="width:300px; margin-bottom:15px; margin-left:300px; margin-top:10px">
    <legend class="legendDatos">Datos</legend>
    <table width="250px" style="margin-left: 26px">
        <tr>

            <td >
                <asp:Label ID="Label21" runat="server" Text="Nro. Socio:"></asp:Label>

            
            <td>
                <asp:Label ID="txtNroSocio" runat="server" Enabled="False"></asp:Label>
            </td>
         </tr>
         <tr>   
            <td >
                <asp:Label ID="Label10" runat="server" Text="Tipo Doc:"></asp:Label>
            </td>
            <td>
                <asp:Label ID="txtTipoDoc" runat="server" Enabled="False"></asp:Label>
            </td>
            <td >
                <asp:Label ID="Label11" runat="server" Text="Nro Doc:"></asp:Label>
            </td>
            <td>
                <asp:Label ID="txtNroDoc" runat="server" Enabled="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label13" runat="server" Text="Apellido:"></asp:Label>
            </td>
            <td width="55px">
                <asp:Label ID="txtApellido" runat="server" Enabled="False"></asp:Label>
            </td>
            <td >
                <asp:Label ID="Label12" runat="server" Text="Nombre:"></asp:Label>
            </td>
            <td>
                <asp:Label ID="txtNombre" runat="server" Enabled="False"></asp:Label>
            </td>
        </tr>
    </table>
   </fieldset>
    </ContentTemplate>
    </asp:TabPanel>
    <asp:TabPanel ID= "tabPanel3" runat="server" HeaderText="Reclamos Asociados a la Orden" Height="166px">
    <ContentTemplate>
   
    <table>
        <tr>
        <td>
            <asp:Label ID="lblNoReclamos" runat="server" Text="No hay Reclamos previos" Visible="false"></asp:Label>
        </td>
        </tr>
        <tr>
             <td colspan="4">
                <asp:GridView ID="gvReclamos" runat="server" AutoGenerateColumns="False" Visible="False"
                    HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                    GridLines="None" Style="margin-top: 10px; margin-bottom:10px; margin-left:25px" OnRowDataBound="gvReclamos_RowDataBound">
                    <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="nroReclamo" HeaderText="Nro" HeaderStyle-Width="85px"
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="35px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="descripcion" HeaderText="Reclamo" HeaderStyle-Width="85px"
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="85px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="descripcionTipoReclamo" HeaderText="Tipo Reclamo" HeaderStyle-Width="185px"
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="185px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="nroSocio" HeaderText="Nro. Socio" HeaderStyle-Width="145px"
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="145px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="apellidoSocio" HeaderText="Apellido" HeaderStyle-Width="145px"
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="145px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="nombreSocio" HeaderText="Nombre" HeaderStyle-Width="145px"
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="145px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="tipoDocDescrip" HeaderText="Tipo Doc." HeaderStyle-Width="145px"
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="145px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="nroDoc" HeaderText="Nro. Doc." HeaderStyle-Width="145px"
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="145px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="fecha" HeaderText="Fecha" HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="hora" HeaderText="Hora" HeaderStyle-Width="55px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="55px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="nroPrioridad" HeaderText="Id prioridad" HeaderStyle-Width="65px"
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="descPriodidad" HeaderText="Prioridad" HeaderStyle-Width="65px"
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="calle" HeaderText="Calle" HeaderStyle-Width="125px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="125px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="nroCalle" HeaderText="Nº" HeaderStyle-Width="45px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="45px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="dpto" HeaderText="Dpto." HeaderStyle-Width="45px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="45px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="piso" HeaderText="Piso" HeaderStyle-Width="45px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="45px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="descZona" HeaderText="Zona" HeaderStyle-Width="60px"
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="55px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="idDomicilio" HeaderText="Id domicilio" HeaderStyle-Width="65px"
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    </ContentTemplate>
    </asp:TabPanel>
    </asp:TabContainer>
    <table>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnGenerarOTC" runat="server" Text="Generar Orden" OnClick="btnGenerarOTC_Click"
                            Style="margin-left: 250px" />
                        <asp:Button ID="btnVolver" runat="server" Text="Volver" OnClick="btnVolver_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupConfirmacion" PopupControlID="popUpConfirmacion"
        runat="server" TargetControlID="LinkButton1" BackgroundCssClass="reveal-modal-bg" />
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading">
            <asp:Label ID="Label31" runat="server" Text="¿Desea generar la OTC?"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarRegistrar" runat="server" Text="Aceptar" OnClick="btnAceptarRegistrar_Click"
                            CssClass="botonPopUp" />
                        <asp:Button ID="btnCancelarRegistrar" runat="server" Text="Cancelar" OnClick="btnCancelarRegistrar_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton2" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupCancelarRegistrar" PopupControlID="popUpCancelarRegistrar"
        runat="server" TargetControlID="LinkButton2" BackgroundCssClass="reveal-modal-bg" />
    <asp:Panel ID="popUpCancelarRegistrar" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image2" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="40px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label32" runat="server" Text="Se perderán los datos ingresados" Style="margin-right: 25px"></asp:Label>
            <br />
            <asp:Label ID="Label33" runat="server" Text="¿Desea Continuar?"></asp:Label>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa; width: 360px">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarCancelacion" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarCancelacion_Click" Style="margin-top: 50px" />
                        <asp:Button ID="btnCancelarCancelacion" runat="server" Text="Cancelar" CausesValidation="False"
                            OnClick="btnCancelarCancelacion_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton3" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupExito" PopupControlID="popUpExito" runat="server"
        TargetControlID="LinkButton3" BackgroundCssClass="reveal-modal-bg" />
    <asp:Panel ID="popUpExito" runat="server" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image3" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="40px" />
        </div>
        <div class="heading">
            <asp:Label ID="Label22" runat="server" Text="La OTC fue registrada con éxito" Style="margin-right: 15px"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 220px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center">
                <br />
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="lblPrioridad" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="lblNroOTCCreada" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Grupo a cargo Nº: "></asp:Label>
                        <asp:Label ID="lblGrupoAsignado" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="Label19" runat="server" Text="Prioridad OTC: "></asp:Label>
                        <asp:Label ID="lblPrioridadOTC" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="Label20" runat="server" Text="Estado de la OTC: "></asp:Label>
                        <asp:Label ID="lblEstadoOTC" runat="server"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                    <ContentTemplate>
                        <br />
                        <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarConfirmacion_Click" CssClass="botonPopUp" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton4" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupNoGrupo" PopupControlID="popUpNoGrupo" runat="server"
        TargetControlID="LinkButton4" BackgroundCssClass="reveal-modal-bg" />
    <asp:Panel ID="popUpNoGrupo" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="40px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label23" runat="server" Text="No hay Grupos disponibles" Style="margin-right: 25px"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 200px; border-top: 0.1px solid #bababa; width: 360px">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="lblGrupoEspera" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="Label24" runat="server" Text="¿Desea continuar?"></asp:Label>
                        <asp:Button ID="btnAceptarNoGrupo" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarNoGrupo_Click" Style="margin-top: 50px" />
                        <asp:Button ID="btnCancelarNoGrupo" runat="server" Text="Cancelar" CausesValidation="False"
                            OnClick="btnCancelarNoGrupo_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton5" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupOTCNueva" PopupControlID="popUpOTCNueva" runat="server"
        TargetControlID="LinkButton4" BackgroundCssClass="reveal-modal-bg" />
    <asp:Panel ID="popUpOTCNueva" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 36px; margin-left: 40px; margin-top: 3px;">
            <asp:Image ID="Image4" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="36px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label26" runat="server" Text="Nueva Orden de Trabajo" Style="margin-right: 55px"></asp:Label>
            <br />
            <asp:Label ID="Label27" runat="server" Text="No hay reclamos relacionados. Se generará una nueva OTC."></asp:Label>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa; width: 360px">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarNuevaOTC" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarNuevaOTC_Click" Style="margin-top: 50px" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton6" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupAsociarOTC" PopupControlID="popUpAsociarOTC"
        runat="server" TargetControlID="LinkButton6" BackgroundCssClass="reveal-modal-bg" />
    <asp:Panel ID="popUpAsociarOTC" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image5" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="36px" />
        </div>
        <div class="heading" style="height: 45px; width: 360px">
            <asp:Label ID="Label28" runat="server" Text="Asociar OTC" Style="margin-right: 65px"></asp:Label>
            <br />
           
        </div>
        <div class="content" style="height: 150px; border-top: 0.1px solid #bababa; width: 360px">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                    <br>
                     <asp:Label ID="Label29" runat="server" Text="Hay reclamos relacionados."></asp:Label>
                     <br />
                    <asp:Label ID="lblReclamosRelacionados" runat="server"></asp:Label>
                        <asp:Button ID="btnAceptarAsociarOTC" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarAsociarOTC_Click" Style="margin-top: 50px" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
