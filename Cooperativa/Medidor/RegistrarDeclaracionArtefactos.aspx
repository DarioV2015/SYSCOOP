<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="RegistrarDeclaracionArtefactos.aspx.cs" Inherits="Medidor_RegistrarDeclaracionArtefactos"
    Title="Declaración de Artefactos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script runat="server">

  
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
            text-align: right;
            width: 140px;
        }
        .tablaBorde
        {
        	border: solid #ccc 1px;
            -moz-border-radius: 6px;
            -webkit-border-radius: 6px;
            border-radius: 6px;
            -webkit-box-shadow: 0 1px 1px #ccc;
            -moz-box-shadow: 0 1px 1px #ccc;
            box-shadow: 0 1px 1px #ccc;
        }
        
       

        
        .estiloHeaderTabla
        {
            font-family: 'trebuchet MS', 'Lucida sans', Arial;
            font-size: 12px;
            
            background-color: #b9c9fe;
            font-weight: bold;
            background: #b9c9fe;
            border-top: 2px solid #aabcfe;
            border-bottom: 1px solid #fff;
            color: #039;
            padding: 8px;
           border-right-style:none;
            border-left-style: ridge;
            border-left-color: #98A9DF;
            border-left-width: 1px;
        }
        .estiloFilasTabla
        {
        	font-family: 'trebuchet MS', 'Lucida sans', Arial;
            font-size: 12px;
            color: #000;
            text-align: center;
            border-left-style: none;
            border-left-width: 0px;
            border-bottom: 1px solid #fff;
            border-right-style:none;
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
        labelSinCarga
        {
        	background-color: rgb(240, 240, 240);
            border-color: rgb(214, 214, 214);
            font-family:Calibri,  sans-serif;
            font-size: 14px;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" >
        <ContentTemplate>
        
        <table>
        <tr>
        <td>
        <fieldset class="FieldDatos" style="height:215px">
        <legend class="legendDatos"> Datos</legend>
            <table style="margin-top:0px">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Tipo de Artefacto:" Width="159px" Style="text-align: right"></asp:Label>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="comboArtefacto" runat="server" AppendDataBoundItems="True"
                                    DataSourceID="sdsArtefacto" DataTextField="DESCRIPCION" DataValueField="IDTIPOARTEFACTO"
                                    Width="220px" OnSelectedIndexChanged="comboArtefacto_SelectedIndexChanged" Height="27px">
                                    <asp:ListItem>Seleccione el Tipo de Artefacto</asp:ListItem>
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                    <span style="display: none">
                        <asp:LinkButton ID="LinkButton4" runat="server"></asp:LinkButton>
                    </span>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                            <ContentTemplate>
                                <asp:ImageButton ID="btnNuevoArtefacto" CausesValidation="False"  OnClick="btnNuevoArtefacto_Click" runat="server" ImageUrl="../Imagenes/button-MAS1.png" />
                                <%--<asp:Button ID="btnNuevoArtefacto" runat="server" Text="Otro Artefacto" OnClick="btnNuevoArtefacto_Click"
                                    CausesValidation="False" />--%>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:ModalPopupExtender ID="ModalPopupNuevoArtefacto" runat="server" TargetControlID="LinkButton4"
                            PopupControlID="popUpNuevoArtefacto" CancelControlID="btnCancelarNuevoArt">
                        </asp:ModalPopupExtender>
                    </td>
                    <td>
                        <asp:Panel ID="popUpNuevoArtefacto" runat="server" CssClass="divFondo" Width="390px">
                            <div class="heading" style="width: 390px; ">
                                <table style="margin-top: 0px; margin-left: 140px">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label6" runat="server" Text="Nuevo Artefacto" style="font-family:Sans-Serif; font-size:14px"></asp:Label>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            
                            <div class="content" style="height: 140px; border-top: 0.1px solid #bababa; width: 390px">
                                <div>
                                 &nbsp;
                                    <table style="margin-top: 0px; margin-left: 55px">
                                        <tr>
                                            <td>
                                                &nbsp;<asp:Label ID="Label9" runat="server" Text="Descripción:"></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;<asp:TextBox ID="txtDescripcionNuevoArt" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;<asp:Label ID="Label10" runat="server" Text="Potencia (Kw):"></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;<asp:TextBox ID="txtPotenciaNuevoArt" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        </table>
                                        <table style="margin-left:35px">
                                        <tr>
                                            <td>
                                               <asp:Button ID="btnAceptarNuevoArt" runat="server" Text="Aceptar" OnClick="btnAceptarNuevoArtefacto_Click"
                                                    CausesValidation="False" />
                                            </td>
                                            <td>
                                               <asp:Button ID="btnCancelarNuevoArt" runat="server" Text="Cancelar" CausesValidation="False" />
                                            </td>
                                        </tr>
                                    </table>
                        </asp:Panel>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="comboArtefacto"
                            InitialValue="Seleccione el Tipo de Artefacto" SetFocusOnError="True">Debe 
                            seleccionar el Tipo de Artefacto</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:SqlDataSource ID="sdsArtefacto" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                            ProviderName="System.Data.SqlClient" SelectCommand="SELECT [IDTIPOARTEFACTO], [DESCRIPCION] FROM [TIPOARTEFACTO]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td width="120px">
                        <asp:Label ID="Label5" runat="server" Text="Marca:" Width="159px" Style="text-align: right"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="comboMarca" runat="server" DataSourceID="sdsMarca" DataTextField="DESCRIPCION"
                            DataValueField="IDMARCA" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="comboMarca_SelectedIndexChanged"
                            Width="220px" Height="27px">
                            <asp:ListItem>Seleccione la Marca</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="comboMarca"
                            Display="Dynamic" InitialValue="Seleccione la Marca" SetFocusOnError="True">Debe seleccionar la Marca</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;
                        <asp:SqlDataSource ID="sdsMarca" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                            ProviderName="System.Data.SqlClient" SelectCommand="SELECT [DESCRIPCION], [IDMARCA] FROM [MARCA] ORDER BY [DESCRIPCION]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td width="120px">
                        <asp:Label ID="Label2" runat="server" Text="Modelo de Artefacto:" Width="159px" Style="text-align: right"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtModeloArtefacto" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtModeloArtefacto"
                            Display="Dynamic" SetFocusOnError="True">Debe ingresar el Modelo del Artefacto</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td width="120px">
                        <asp:Label ID="Label3" runat="server" Text="Nro Factura de Compra:" Width="159px"
                            Style="text-align: right"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNroFactura" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtNroFactura"
                            Display="Dynamic" SetFocusOnError="True">Debe 
                    ingresar el Nro. de Factura</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNroFactura"
                            Display="Dynamic" SetFocusOnError="True" ValidationExpression="^(?:\+|-)?\d+$">Error de formato, el campo permite 
                    sólo números.</asp:RegularExpressionValidator>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td width="120px">
                        <asp:Label ID="Label4" runat="server" Text="Hs.Uso Estimada por Dia:" Width="159px"
                            Style="text-align: right"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtHsUso" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtHsUso"
                            Display="Dynamic" SetFocusOnError="True">Debe 
                    ingresar las Hs. Uso </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Agregar"
                            Style="margin-left: 170px; margin-top:7px" CssClass="margen" />
                        &nbsp;
                    </td>
                </tr>
                
            </table>
            </fieldset>
            </td>
            
            <td valign="top">
            <fieldset class="FieldDatos" style="height:215px">
            <legend class="legendDatos">Artefactos Cargados</legend>
            <asp:GridView ID="gvListadoArtefactos" runat="server" CellPadding="4" GridLines="Horizontal"
                Width="470px" DataKeyNames="IDTIPOARTEFACTO" AutoGenerateColumns="False" EmptyDataText="No ha cargado ningún artefacto."
                OnRowCommand="gvListadoArtefactos_RowCommand" HeaderStyle-CssClass="estiloHeaderTabla"
                ForeColor="#333333" BorderStyle="None" EmptyDataRowStyle-BackColor="#ECECEC" 
                EmptyDataRowStyle-BorderColor="#CFCFCF" EmptyDataRowStyle-Font-Size="14px" 
                EmptyDataRowStyle-Font-Names="sans-serif" style=" border-right:none;">
                <RowStyle BackColor="#E8EFF8" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle"
                    Width="150px"  />
                <Columns>
                    <asp:BoundField HeaderText="Artefacto" DataField="Descripcion" ReadOnly="true"
                        HeaderStyle-Width="70px" ItemStyle-CssClass="estiloHeaderTabla"  >
                        <HeaderStyle CssClass="estiloHeaderTabla" Width="70px" ></HeaderStyle>
                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Marca" DataField="Marca" ReadOnly="true" HeaderStyle-Width="60px"
                        ItemStyle-CssClass="estiloHeaderTabla">
                        <HeaderStyle CssClass="estiloHeaderTabla" Width="30px"></HeaderStyle>
                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Modelo" DataField="Modelo" ReadOnly="true" HeaderStyle-Width="60px"
                        ItemStyle-CssClass="estiloHeaderTabla">
                        <HeaderStyle CssClass="estiloHeaderTabla" Width="30px"></HeaderStyle>
                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Nro de Factura" DataField="nrofactura" ReadOnly="true"
                        HeaderStyle-Width="70px" ItemStyle-CssClass="estiloHeaderTabla">
                        <HeaderStyle CssClass="estiloHeaderTabla" Width="70px"></HeaderStyle>
                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Hs. de Uso" DataField="hsusoestimado" ReadOnly="true"
                        HeaderStyle-Width="50px" ItemStyle-CssClass="estiloHeaderTabla">
                        <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Id Tipo de Artefacto" DataField="idtipoartefacto" ReadOnly="true"
                        HeaderStyle-Width="10px" ItemStyle-CssClass="estiloHeaderTabla">
                        <HeaderStyle CssClass="estiloHeaderTabla" Width="10px"></HeaderStyle>
                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Id Marca" DataField="idMarca" ReadOnly="true" HeaderStyle-Width="60px"
                        ItemStyle-CssClass="estiloHeaderTabla">
                        <HeaderStyle CssClass="estiloHeaderTabla" Width="40px"></HeaderStyle>
                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField ShowHeader="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="20px"
                        ItemStyle-HorizontalAlign="Center"   HeaderStyle-CssClass="estiloHeaderTabla">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton4" CommandArgument='<%# Eval("idtipoartefacto") %>'
                                CommandName="DeleteRow" runat="server" ImageUrl="../Imagenes/cancel.png"
                                CausesValidation="false" Width="15px" Height="15px" Style="vertical-align: middle;
                                margin-bottom: 3px;" />
                        </ItemTemplate>
                         <ItemStyle CssClass="estiloFilasTabla" Width="10px" ></ItemStyle>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </fieldset>
            </td>
            </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Button ID="btnRegistrarArtefactos" runat="server" Text="Aceptar" Style="margin-left: 330px"
                CssClass="margen" CausesValidation="False" Enabled="False" OnClick="btnRegistrarArtefactos_Click" />
            <asp:Button ID="btnCancelarArtefactos" runat="server" Text="Cancelar" OnClick="btnCancelarArtefactos_Click"
                CausesValidation="False" />
            <span style="display: none">
                <asp:LinkButton ID="LinkButton2" runat="server">LinkButton</asp:LinkButton>
            </span>
            <asp:ModalPopupExtender ID="ModalPopupConfirmacion" runat="server" PopupControlID="popUpConfirmacion"
                BackgroundCssClass="modalBackground" TargetControlID="LinkButton2">
            </asp:ModalPopupExtender>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading">
            <asp:Label ID="Label11" runat="server" Text="¿Desea confirmar los Artefactos?"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" OnClick="btnAceptarConfirmacion_Click1"
                            CssClass="botonPopUp" CausesValidation="False" />
                        <asp:Button ID="btnCancelarConfirmacion" runat="server" Text="Cancelar" OnClick="btnCancelarConfirmacion_Click"
                            CausesValidation="False" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupCierre" runat="server" PopupControlID="popUpCierre"
        TargetControlID="LinkButton1">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpCierre" runat="server" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image6" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="36px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label14" runat="server" Text="Los Artefactos se registraron con éxito"
                Style="margin-right: 26px"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarCierre" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarCierre_Click" Style="margin-top: 30px" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton3" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupCancelacion" runat="server" TargetControlID="LinkButton3"
        PopupControlID="popUpCancelacion">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpCancelacion" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image5" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="35px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label12" runat="server" Text="Se cancelará el registro de Artefactos"
                Style="margin-right: 25px"></asp:Label>
            <br />
            <asp:Label ID="Label13" runat="server" Text="¿Desea Continuar?"></asp:Label>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarCancelacion" runat="server" Text="Continuar" CausesValidation="False"
                            OnClick="btnAceptarCancelacion_Click" Style="margin-top: 50px" />
                        <asp:Button ID="btnCancelarCancelacion" runat="server" Text="Cancelar" CausesValidation="False"
                            OnClick="btnCancelarCancelacion_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        
 <script type="text/javascript">
  $(function() {
    $('.footable').footable();
  });
</script>
    </asp:Panel>
    
   
</asp:Content>
