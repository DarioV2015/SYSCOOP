<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="RegistrarGuardiaReclamoSuplente.aspx.cs" Inherits="MCorrectivoSesion_RegistrarGuardiaReclamoSuplente"
    Title="Página sin título" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td colspan="7" width="1800px" class="styleTitulo">
                <asp:Label ID="Label3" runat="server" Text="Empleados"></asp:Label>
            </td>
        </tr>
    </table>
    <table style="width: 350px; margin-top: 0px">
        <tr>
            <td>
                &nbsp;<asp:GridView ID="gvEmpleados" runat="server" AutoGenerateColumns="False" DataKeyNames="IDEMPLEADO"
                    DataSourceID="SDSEmpleados" HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4"
                    ForeColor="#333333" GridLines="None" Style="margin-top: 0px" Width="350px">
                    <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />

                    <Columns>
                     <asp:TemplateField>
                            <ItemTemplate>
                                <asp:RadioButton ID="gvEmpleados_rdbSeleccionar" runat="server" OnCheckedChanged="gvEmpleados_rdbSeleccionar_CheckedChanged"
                                    onclick="RadioCheckOnly(this);" Width="30px" />
                            </ItemTemplate>
                            <ItemStyle CssClass="estiloFilasTabla" Width="30px"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="IDEMPLEADO" HeaderText="Legajo" ReadOnly="True" SortExpression="IDEMPLEADO"
                            HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="APELLIDO" HeaderText="Apellido" SortExpression="APELLIDO"
                            HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="75px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" SortExpression="NOMBRE" HeaderStyle-Width="65px"
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="75px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>    
                    </Columns>
                </asp:GridView>
                &nbsp;<asp:SqlDataSource ID="SDSEmpleados" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                    ProviderName="System.Data.SqlClient" SelectCommand="SELECT E.IDEMPLEADO, P.APELLIDO, P.NOMBRE FROM PERSONA P, EMPLEADO E, CARGOEMPLEADO C WHERE E.IDCARGO = C.IDCARGOEMPLEADO AND E.IDTIPODOCUMENTO = P.TIPODOCUMENTO AND E.NRODOCUMENTO = P.NRODOCUMENTO AND E.IDCARGO = 3">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" Style="margin-left: 35px"
                            OnClick="btnRegistrar_Click" />
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                        <span style="display: none">
                            <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
                        </span>
                        <asp:ModalPopupExtender ID="ModalPopupRegistrar" runat="server" PopupControlID="popUpConfirmacion"
                            TargetControlID="LinkButton1" BackgroundCssClass="reveal-modal-bg">
                        </asp:ModalPopupExtender>
                        <span style="display: none">
                            <asp:LinkButton ID="LinkButton2" runat="server">LinkButton</asp:LinkButton>
                        </span>
                        <asp:ModalPopupExtender ID="ModalPopupCancelar" runat="server" PopupControlID="popUpCancelar"
                            TargetControlID="LinkButton2" BackgroundCssClass="reveal-modal-bg">
                        </asp:ModalPopupExtender>
                        <span style="display: none">
                            <asp:LinkButton ID="LinkButton3" runat="server">LinkButton</asp:LinkButton>
                        </span>
                        <asp:ModalPopupExtender ID="ModalPopupMsjEmpleados" runat="server" PopupControlID="popUpMsjEmpleados"
                            TargetControlID="LinkButton3" BackgroundCssClass="reveal-modal-bg">
                        </asp:ModalPopupExtender>
                        <span style="display: none">
                            <asp:LinkButton ID="LinkButton4" runat="server">LinkButton</asp:LinkButton>
                        </span>
                        <asp:ModalPopupExtender ID="ModalPopupExito" runat="server" PopupControlID="popUpExito"
                            TargetControlID="LinkButton4" BackgroundCssClass="reveal-modal-bg">
                        </asp:ModalPopupExtender>
                    </ContentTemplate>
                </asp:UpdatePanel>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading" style="width: 410px">
            <asp:Label ID="Label5" runat="server" Text="¿Desea cambiar a la categoria 'Guardia-Reclamo Suplente'?"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa; width: 410px">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarConfirmar" runat="server" Text="Aceptar" OnClick="btnAceptarConfirmar_Click"
                            CssClass="botonPopUp" />
                        <asp:Button ID="btnCancelarConfirmar" runat="server" Text="Cancelar" OnClick="btnCancelarConfirmar_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="popUpCancelar" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image2" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="35px" />
        </div>
        <div class="heading" style="width: 410px">
            <asp:Label ID="Label2" runat="server" Text="¿Está seguro que desea cancelar la registración?"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa; width: 410px">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarCancelar" runat="server" Text="Aceptar" OnClick="btnAceptarCancelar_Click"
                            CssClass="botonPopUp" />
                        <asp:Button ID="btnCancelarCancelar" runat="server" Text="Cancelar" OnClick="btnCancelarCancelar_Click"
                            CssClass="botonPopUp" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="popUpExito" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="35px" />
        </div>
        <div class="heading" style="width: 430px">
            <asp:Label ID="Label7" runat="server" Text="El Guardia Reclamo Suplente fue registrado con éxito"
                Style="margin-right: 15px"></asp:Label>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa; width: 430px">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarConfirmacion_Click" CssClass="botonPopUp" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="popUpMsjEmpleados" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading">
            <asp:Label ID="Label1" runat="server" Text="No existen empleados 'Oficial Electricista' registrados"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarMsjEmpleados" runat="server" Text="Aceptar" OnClick="btnAceptarMsjEmpleados_Click"
                            CssClass="botonPopUp" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>

    <script type="text/javascript">
    
     function RadioCheckOnly(rbControl) {
     
      var gvName = rbControl.defaultValue.split('_')[0];
      var gvControl;
      
      switch (gvName)
      {
        case "gvEmpleados":
        gvControl =  "<%=gvEmpleados.ClientID%>";       
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

</asp:Content>
