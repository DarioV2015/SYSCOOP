<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="RegistrarMedidor.aspx.cs" Inherits="Medidor_RegistrarMedidor" Title="Registrar Medidores" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style2
        {
            height: 233px;
        }
        .style4
        {
            width: 100%;
        }
    </style>

    <script type="text/javascript">
    
     function RadioCheckOnly(rbControl) {
     
      var gvName = rbControl.defaultValue.split('_')[0];
      var gvControl;
      
      switch (gvName)
      {
        case "gvContratos":
        gvControl =  "<%=gvContratos.ClientID%>";       
        break;
        case "gvDetalleContrato":
        gvControl =  "<%=gvDetalleContrato.ClientID%>";       
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 <asp:UpdatePanel ID="UpdatePanel3" runat="server">
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
                </table>
                </ContentTemplate>
                </asp:UpdatePanel>
        <table style="width: 96%; height: 808px;">
            <tr>
                <td>
                    <asp:GridView ID="gvContratos" runat="server" AutoGenerateColumns="False" DataKeyNames="IDCONTRATO"
                        DataSourceID="sdsContratos">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:RadioButton ID="gvContratos_rdbSeleccionar" runat="server" OnCheckedChanged="gvContratos_rdbSeleccionar_CheckedChanged"
                                        AutoPostBack="True" onclick="RadioCheckOnly(this);" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="IDCONTRATO" HeaderText="Nro Contrato" SortExpression="IDCONTRATO" />
                            <asp:BoundField DataField="FECHAPEDIDO" HeaderText="Fecha de Pedido" SortExpression="FECHAPEDIDO" />
                            <asp:BoundField DataField="RAZONSOCIAL" HeaderText="Razon Social" SortExpression="RAZONSOCIAL" />
                            <asp:BoundField DataField="FECHAINGRESO" HeaderText="Fecha de Ingreso" SortExpression="FECHAINGRESO" />
                            <asp:BoundField DataField="descripcion" HeaderText="Estado" SortExpression="descripcion" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sdsContratos" runat="server" ConflictDetection="CompareAllValues"
                        ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                        OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient"
                        SelectCommand="SELECT c.IDCONTRATO, 
       c.FECHAPEDIDO, 
       em.RAZONSOCIAL,
       c.FECHAINGRESO, 
       e.descripcion
FROM CONTRATO  c, proveedor p,  estadocontrato e, empresa em
where c.IDESTADOCONTRATO = 1
and c.idproveedor = p.idproveedor
and  c.idestadocontrato = e.idestadocontrato
and em.cuit = p.cuit"></asp:SqlDataSource>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:GridView ID="gvDetalleContrato" runat="server" AutoGenerateColumns="False" DataKeyNames="NROLOTE"
                        DataSourceID="sdsDetalleContrato" OnSelectedIndexChanged="gvDetalleContrato_SelectedIndexChanged">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:RadioButton ID="gvDetalleContrato_rdbSeleccionar" runat="server" OnCheckedChanged="gvDetalleContrato_rdbSeleccionar_CheckedChanged"
                                        AutoPostBack="True" onclick="RadioCheckOnly(this);" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="IDDETALLECONTRATO" HeaderText="Detalle" ReadOnly="True"
                                SortExpression="IDDETALLECONTRATO" />
                            <asp:BoundField DataField="IDCONTRATO" HeaderText="Nro de Contrato" ReadOnly="True"
                                SortExpression="IDCONTRATO" />
                            <asp:BoundField DataField="NROLOTE" HeaderText="Nro de Lote" SortExpression="NROLOTE" />
                            <asp:BoundField DataField="descripcion" HeaderText="Tipo de Medidor" SortExpression="descripcion" />
                            <asp:BoundField DataField="CANTIDAD" HeaderText="Cantidad" SortExpression="CANTIDAD" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sdsDetalleContrato" runat="server" ConflictDetection="CompareAllValues"
                        ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                        OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient"
                        SelectCommand="SELECT d.IDDETALLECONTRATO, 
       d.IDCONTRATO, 
       d.NROLOTE, 
       t.descripcion, 
       d.CANTIDAD
FROM DETALLECONTRATO d, tipomedidor t
where d.idtipomedidor = t.idtipomedidor
and d.idcontrato = @nrocontrato" FilterExpression="idContrato = '{0}'">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gvContratos" DefaultValue="-1" Name="nrocontrato"
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                        <FilterParameters>
                            <asp:ControlParameter Name="idContrato" ControlID="gvContratos" PropertyName="SelectedValue" />
                        </FilterParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="style2">
                    <asp:Button ID="btnCargarMedidores" runat="server" OnClick="btnCargarMedidores_Click"
                        Text="Cargar Medidores" />
                </td>
                <td class="style2">
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="gvMedidores" runat="server" AutoGenerateColumns="False" OnRowCommand="comandosGVMedidor"
                        DataKeyNames="NROMEDIDOR">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lblEdit" CommandArgument='<%# Eval("NroMedidor") %>' CommandName="EditRow"
                                        runat="server">
                                    Edit
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="lblUpdate" CommandArgument='<%# Eval("NroMedidor") %>' CommandName="UpdateRow"
                                        runat="server">
                                    Update
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="lblCancel" CommandArgument='<%# Eval("NroMedidor") %>' CommandName="CancelRow"
                                        runat="server">
                                    Cancel
                                    </asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Tipo de medidor" DataField="TipoMedidor" SortExpression="TipoMedidor"
                                ReadOnly="true" />
                            <asp:BoundField HeaderText="Fecha de Alta" DataField="FechaAlta" SortExpression="FechaAlta"
                                ReadOnly="true" />
                            <asp:BoundField HeaderText="Nro de Lote" DataField="NroLote" SortExpression="NroLote"
                                ReadOnly="true" />
                            <asp:BoundField HeaderText="Nro de Medidor" DataField="NroMedidor" SortExpression="NroMedidor"
                                ReadOnly="true" />
                            <asp:TemplateField HeaderText="Nro de Fabricacion" SortExpression="NroFabricacion">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("NroFabricacion") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NroFabricacion") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <table class="style4">
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="updateMsj" runat="server">
                                    <ContentTemplate>
                                        <asp:Button ID="btnRegistrar" runat="server" OnClick="btnRegistrar_Click" Text="Registrar" />
                                        <asp:LinkButton ID="lnkOculto" runat="server" Style="display: none;">LinkButton</asp:LinkButton>
                                        <asp:ModalPopupExtender ID="popExtMsj" runat="server" PopupControlID="popMsj" BackgroundCssClass="modalBackground"
                                            TargetControlID="lnkOculto" CancelControlID="btnAceptarMsj">
                                        </asp:ModalPopupExtender>
                                        <asp:Panel ID="popMsj" runat="server" Style="top: 20%; height: 60%; left: 60%; width: 60%;
                                            display: none;">
                                            <div class="md-modal md-effect-5 md-show" id="modal-1">
                                                <div class="md-content">
                                                    <h3>
                                                        Debe registrar todos los medidores del lote</h3>
                                                </div>
                                                <asp:Button ID="btnAceptarMsj" runat="server" Text="Aceptar" />
                                            </div>
                                        </asp:Panel>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <span style="display: none">
        <asp:LinkButton ID="lnkMsj" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupMsj" PopupControlID="popUpMsj" runat="server"
        TargetControlID="lnkMsj">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpMsj" runat="server" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="36px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label6" runat="server" Text="Advertencia" Style="margin-right: 20px"></asp:Label>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <asp:Label ID="lblMensaje" runat="server" Style="margin-right: 26px" Text="No Existen Contratos Pendientes"></asp:Label>
                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center">
                <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" CausesValidation="False"
                    Style="margin-top: 50px" OnClick="btnAceptarConfirmacion_Click" />
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="lnkExito" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="mpeExito" PopupControlID="panelExito" runat="server"
        TargetControlID="lnkExito">
    </asp:ModalPopupExtender>
    <asp:Panel ID="panelExito" runat="server" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image2" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="36px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label2" runat="server" Text="Exito" Style="margin-right: 20px"></asp:Label>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center">
                <asp:Button ID="Button1" runat="server" Text="Aceptar" CausesValidation="False" Style="margin-top: 50px"
                    OnClick="btnAceptarConfirmacion_Click" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
