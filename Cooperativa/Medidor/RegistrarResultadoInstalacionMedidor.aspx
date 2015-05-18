<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="RegistrarResultadoInstalacionMedidor.aspx.cs" Inherits="Medidor_RegistrarResultadoInstalacionMedidor"
    Title="Resultado Instalación Medidor" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" src="../Js/JQuery.js"></script>

    <script type="text/javascript">
    
     function RadioCheckOnly(rbControl) {
     
      var gvName = rbControl.defaultValue.split('_')[0];
      var gvControl;
      
      switch (gvName)
      {
        case "gvOrdenInstalacion":
        gvControl =  "<%=gvOrdenInstalacion.ClientID%>";       
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

    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .styleBuscarSocio
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
        .styleLabelNroDoc
        {
            text-align: right;
        }
        .datos
        {
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
        .DatosPedido
        {
            text-align: center;
            border-bottom-color: rgb(241, 231, 231);
            border-bottom-style: solid;
            border-bottom-width: 1px;
        }
        .style10
        {
            height: 8px;
        }
        .FieldDatos
        {
            height: 138px;
            border-radius: 6px;
            border-color: rgb(196, 194, 194);
            border-style: solid;
            border-width: 2px;
        }
        .legendDatos
        {
            font-family: Calibri;
            font-size: 17px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panelOrdenesInstalacion" runat="server">
                <table width="800px" style="margin-top: 5px">
                    <tr>
                        <td style="border-bottom-style: inset" height="25px">
                            &nbsp;
                            <asp:Label ID="Label19" runat="server" Font-Italic="True" Font-Size="17px" Text="Listado de Órdenes de Instalación"></asp:Label>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <table style="margin-top: 0px">
                    <tr>
                        <td>
                            <asp:GridView ID="gvOrdenInstalacion" runat="server" AutoGenerateColumns="False"
                                DataKeyNames="idordeninstalacion" DataSourceID="SDSOrdenInst" HeaderStyle-CssClass="estiloHeaderTabla"
                                CellPadding="4" ForeColor="#333333" GridLines="None" 
                                Style="margin-top: 6px" onrowdatabound="gvOrdenInstalacion_RowDataBound">
                                <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                <Columns>
                                    <asp:TemplateField HeaderStyle-Width="20px">
                                        <ItemTemplate>
                                            <asp:RadioButton ID="gvOrdenInstalacion_rdbSeleccionado" runat="server" AutoPostBack="True"
                                                OnCheckedChanged="rdbOrdenInstalacion_CheckedChanged" onclick="RadioCheckOnly(this); "
                                                Width="20px" />
                                        </ItemTemplate>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="idordeninstalacion" HeaderText="Nro. Orden" SortExpression="idordeninstalacion"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="110px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="idpedidoinstalacion" HeaderText="Nro.Pedido" SortExpression="idpedidoinstalacion"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="110px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fechapedido" HeaderText="Fecha Pedido" SortExpression="fechapedido"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="idgrupogr" HeaderText="Grupo GR" SortExpression="idgrupogr"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="descripcion" HeaderText="Estado Orden" SortExpression="descripcion"
                                        Visible="false" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle CssClass="estiloHeaderTabla"></HeaderStyle>
                            </asp:GridView>
                        </td>
                        <td>
                            <asp:SqlDataSource ID="SDSOrdenInst" runat="server" ConnectionString="<%$ ConnectionStrings:SISEConnectionString %>"
                                SelectCommand="select distinct oi.idordeninstalacion, oi.idpedidoinstalacion, convert(char(10), pin.fechapedido, 103) as fechapedido, oi.idgrupogr, eoi.descripcion

from ordeninstalacion oi, pedidoinstalacion pin, estadoordeninstalacion eoi,historialgrupo hg, turno t, grupoguardiareclamo ggr

where oi.idpedidoinstalacion=pin.idpedido
and oi.idgrupogr=hg.idgrupogr
and hg.idturno=t.idturno
and oi.idestadoorden=eoi.idestadoordeninstalacion
and eoi.idestadoordeninstalacion=1">
                            
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <table style="margin-top: 6px">
        <tr>
            <td style="vertical-align: top">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="panelDetalleOIM" runat="server" Visible="false">
                            <fieldset class="FieldDatos" style="height: 180px; width: 540px">
                                <legend class="legendDatos" style="font-size: 17px; font-style: italic">Detalle Orden
                                    de Instalación</legend>
                                <%--<table width="400px" style="margin-top: 5px">
                    <tr>
                        <td style="border-bottom-style: inset" height="25px">
                            &nbsp;
                            <asp:Label ID="Label1" runat="server" Font-Italic="True" Font-Size="Medium" Text="Detalle de Orden de Instalación"></asp:Label>
                            &nbsp;
                        </td>
                    </tr>
                </table>--%>
                                <fieldset class="FieldDatos" style="width: 180px; float: left; border: none; margin-top: 5px">
                                    <legend class="legendDatos" style="font-size: 15px; font-weight: bold">Medidor</legend>
                                    <table style="margin-top: 0px; border-top-style: solid; border-top-width: 1px" width="187px">
                                        <tr>
                                            <td class="datos">
                                                <asp:Label ID="Label4" runat="server" Text="Nro:"></asp:Label>
                                            </td>
                                            <td width="70px">
                                                <asp:Label ID="txtNroMedidor" runat="server" Style="margin-left: 5px"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="datos" width="100px">
                                                <asp:Label ID="Label16" runat="server" Text="Nro. Fabricación:"></asp:Label>
                                            </td>
                                            <td width="70px">
                                                <asp:Label ID="txtNroFabr" runat="server" Style="margin-left: 5px"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="datos">
                                                <asp:Label ID="Label18" runat="server" Text="Nro. Lote:"></asp:Label>
                                            </td>
                                            <td width="70px">
                                                <asp:Label ID="txtNroLote" runat="server" Style="margin-left: 5px"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="datos" width="70px">
                                                <asp:Label ID="Label5" runat="server" Text="Fecha Alta:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="txtFechaAlta" runat="server" Style="margin-left: 5px"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="datos">
                                                <asp:Label ID="Label3" runat="server" Text="Tipo de Medidor:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="txtTipoMedidor" runat="server" Style="margin-left: 5px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                                <fieldset class="FieldDatos" style="width: 120px; float: left; border: none; margin-left: 15px;
                                    margin-top: 5px">
                                    <legend class="legendDatos" style="font-size: 15px; font-weight: bold">Socio</legend>
                                    <table style="margin-top: 0px; border-top-style: solid; border-top-width: 1px">
                                        <tr>
                                            <td class="datos">
                                                <asp:Label ID="Label6" runat="server" Text="Nro. Socio:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="txtNroSocio" runat="server" Style="margin-left: 5px"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="datos">
                                                <asp:Label ID="Label7" runat="server" Text="Apellido:"></asp:Label>
                                            </td>
                                            <td class="style13">
                                                <asp:Label ID="txtApellido" runat="server" Style="margin-left: 5px"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="datos">
                                                <asp:Label ID="Label8" runat="server" Text="Nombre:"></asp:Label>
                                            </td>
                                            <td class="style11">
                                                <asp:Label ID="txtNombre" runat="server" Style="margin-left: 5px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                                <fieldset class="FieldDatos" style="border: none; margin-left: 400px; margin-top: 5px">
                                    <legend class="legendDatos" style="font-size: 15px; font-weight: bold">Domicilio</legend>
                                    <table style="margin-top: 0px; border-top-style: solid; border-top-width: 1px;" width="110px">
                                        <tr>
                                            <td class="datos">
                                                <asp:Label ID="Label9" runat="server" Text="Calle:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="txtCalle" runat="server" Style="margin-left: 5px"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="datos">
                                                <asp:Label ID="Label10" runat="server" Text="Nº:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="txtNroCalle" runat="server" Style="margin-left: 5px"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="datos" width="70px">
                                                <asp:Label ID="Label11" runat="server" Text="Piso:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="txtPiso" runat="server" Width="40px" Style="margin-left: 5px"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="datos" width="46px">
                                                <asp:Label ID="Label12" runat="server" Text="Dpto.:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="txtDepto" runat="server" Width="40px" Style="margin-left: 5px"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="datos" width="46px">
                                                <asp:Label ID="Label13" runat="server" Text="Zona:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="txtZona" runat="server" Width="40px" Style="margin-left: 5px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </fieldset></asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="panelResultadoInstalacion" runat="server" Visible="false">
                            <fieldset class="FieldDatos" style="height: 180px;">
                                <legend class="legendDatos" style="font-size: 17px; font-style: italic">Resultado de
                                    la Instalación</legend>
                                <table style="margin-top: 5px; height: 60px">
                                    <tr>
                                        <td width="76px">
                                            <asp:Label ID="Label14" runat="server" Text="Resultado:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlResultadoInst" runat="server" DataSourceID="SDSTipoResultadoInst"
                                                DataTextField="NOMBRE" DataValueField="IDTIPORESULTADO" AppendDataBoundItems="True"
                                                OnSelectedIndexChanged="comboResultadoInstalacion_SelectedIndexChanged" AutoPostBack="true"
                                                Style="margin-left: 0px">
                                                <asp:ListItem>Seleccione un Tipo</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="btnNuevoTipoResultado" OnClick="btnNuevoTipoResultado_Click"
                                                runat="server" ImageUrl="../Imagenes/button-MAS1.png" />
                                            <%--<asp:Button ID="btnNuevoTipoResultado" runat="server" Text="Nuevo Tipo Resultado"
                                OnClick="btnNuevoTipoResultado_Click" />--%>
                                        </td>
                                        <td>
                                            <asp:SqlDataSource ID="SDSTipoResultadoInst" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                                                ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [TIPORESULTADOIM]">
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 30px">
                                            <asp:Label ID="lblDescripcion" runat="server" Text="Descripción:" Visible="false"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblDescripcionResultado" runat="server" Visible="false"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                        </asp:Panel>
                        </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panelBotones" runat="server" Visible="false">
                <table style="margin-left: 250px; margin-top: 30px">
                    <tr>
                        <td>
                            <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" />
                        </td>
                        <td class="style6">
                            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupRegistrarResultado" PopupControlID="popUpConfirmacionResultado"
        runat="server" TargetControlID="LinkButton1">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpConfirmacionResultado" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading">
            <asp:Label ID="Label15" runat="server" Text="¿Desea finalizar la Orden de Instalación?"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarRegistrarResultado" runat="server" Text="Aceptar" OnClick="btnAceptarRegistrarResultado_Click"
                            CssClass="botonPopUp" />
                        <asp:Button ID="btnCancelarRegistrarResultado" runat="server" Text="Cancelar" OnClick="btnCancelarRegistrarResultado_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton2" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupCancelarRegistrarResultado" PopupControlID="popUpCancelarRegistrarResultado"
        runat="server" TargetControlID="LinkButton2">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpCancelarRegistrarResultado" runat="server" Style="display: none"
        CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image2" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="35px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label17" runat="server" Text="Se cancelará el cierre de la Orden de Instalación"
                Style="margin-right: 25px"></asp:Label>
            <br />
            <asp:Label ID="Label20" runat="server" Text="¿Desea Continuar?"></asp:Label>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarCancelacionResultado" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarCancelacionResultado_Click" Style="margin-top: 50px" />
                        <asp:Button ID="btnCancelarCancelacionResultado" runat="server" Text="Cancelar" CausesValidation="False"
                            OnClick="btnCancelarCancelacionResultado_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton3" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupExitoResultado" PopupControlID="popUpExitoResultado"
        runat="server" TargetControlID="LinkButton3">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpExitoResultado" runat="server" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="40px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label21" runat="server" Text="Se finalizó con éxito la Orden de Instalación"
                Style="margin-right: 26px"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarConfirmacionResultado" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarConfirmacionResultado_Click" Style="margin-top: 50px" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
