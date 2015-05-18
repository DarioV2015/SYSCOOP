<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="AsignarMedidorASocio.aspx.cs" Inherits="Medidor_AsignarMedidorASocio"
    Title="Asignar Medidor a Socio" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?v=3.8&amp;key=AIzaSyALhJSXocMN5jstXyeuT1X8mTiRJkVVXYg&amp;libraries=drawing,geometry&amp;language=es&amp;region=AR&amp;sensor=false"></script>

    <script type="text/javascript" src="../Js/utilGMaps.js"></script>

    <script type="text/javascript" src="../Js/marcadores.js"></script>

    <script type="text/javascript" src="../Js/general.js"></script>

    <script type="text/javascript" src="../Js/AsignarMedidorASocio.js"></script>

    <script type="text/javascript">
    
     function RadioCheckOnly(rbControl) {
     
      var gvName = rbControl.defaultValue.split('_')[0];
      var gvControl;
      
      switch (gvName)
      {
        case "gvMedidoresDisponibles":
        gvControl =  "<%=gvMedidoresDisponibles.ClientID%>";       
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
    
    function ponerMedidor()
    {
    loadMap();
     var ddl =  document.getElementById('<%=ddlCalleMed.ClientID%>');
     var txtNroMed =  document.getElementById('<%=txtNroCalleMed.ClientID%>'); 
     var calle = ddl.options[ddl.selectedIndex].text 
     var idcalle = ddl.value;
     var txtPiso = document.getElementById('<%=txtPisoMed.ClientID%>'); 
     var txtDpto = document.getElementById('<%=txtDeptoMed.ClientID%>'); 
     
     verificarDomicilio(calle,txtNroMed.value,txtPiso.value,txtDpto.value,idcalle);
     
     
    }    
    </script>

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
            width: 99%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style11">
                <tr>
                    <td>
                        <asp:RadioButton ID="rdbNroSocio" runat="server" Text="Nro. Socio" AutoPostBack="True"
                            GroupName="1" OnCheckedChanged="rdbNroSocio_CheckedChanged" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtNroSocio" runat="server" Visible="False" Width="128px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style16">
                        <asp:RadioButton ID="rbnNroDoc" runat="server" Text="Nro. Documento" AutoPostBack="True"
                            GroupName="1" OnCheckedChanged="rbnNroDoc_CheckedChanged" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlNroDoc" runat="server" DataSourceID="ddlTipoDoc" DataTextField="DESCRIPCION"
                            DataValueField="IDTIPODOCUMENTO" Visible="False">
                        </asp:DropDownList>
                    </td>
                    <td class="style16">
                        <asp:TextBox ID="txtNroDoc" runat="server" Visible="False"></asp:TextBox>
                    </td>
                    <td class="style16">
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButton ID="rbnCuit" runat="server" Text="Nro. CUIT" AutoPostBack="True"
                            GroupName="1" OnCheckedChanged="rbnCuit_CheckedChanged" />
                    </td>
                    <td class="style17">
                        <asp:TextBox ID="txtNroCUIT" runat="server" Visible="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center">
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" Visible="False" OnClick="btnBuscar_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="border-bottom-style: outset">
                        <asp:Label ID="lblMensaje" runat="server" Font-Italic="True" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Label ID="Label10" runat="server" Text="Número de Socio: " Visible="False"></asp:Label>
                        <asp:Label ID="lblNroSocio" runat="server" Visible="False" Font-Bold="True" Font-Italic="True"
                            Font-Size="Medium"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Panel ID="PanelSocioParticular" runat="server" Visible="False">
                            <table class="style9">
                                <tr>
                                    <td style="text-align: right">
                                        <asp:Label ID="lblapellido" runat="server" Text="Apellido:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtApellido" runat="server" Enabled="False"></asp:TextBox>
                                    </td>
                                    <td style="text-align: right">
                                        <asp:Label ID="Label16" runat="server" Text="Nombre:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNombre" runat="server" Enabled="False"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right">
                                        <asp:Label ID="Label15" runat="server" Text="Calle:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlCalle" runat="server" DataSourceID="sdsCalle" DataTextField="NOMBRE"
                                            DataValueField="IDCALLE" Enabled="False">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: right">
                                        <asp:Label ID="Label17" runat="server" Text="Nro.:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNroCalle" runat="server" Enabled="False"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td style="text-align: right">
                                        <asp:Label ID="Label18" runat="server" Text="Piso:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPiso" runat="server" Enabled="False"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td style="text-align: right">
                                        <asp:Label ID="Label19" runat="server" Text="Depto:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDepto" runat="server" Enabled="False"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Panel ID="PanelDatosEmpresa" runat="server" Visible="False">
                            <table class="style9">
                                <tr>
                                    <td style="text-align: right">
                                        <asp:Label ID="Label11" runat="server" Text="CUIT:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCUIT" runat="server" Enabled="False"></asp:TextBox>
                                    </td>
                                    <td style="text-align: right">
                                        <asp:Label ID="Label1" runat="server" Text="Razón Social:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRazonSocial" runat="server" Enabled="False"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right">
                                        <asp:Label ID="Label2" runat="server" Text="Calle:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlCalleEmpresa" runat="server" DataSourceID="sdsCalle" DataTextField="NOMBRE"
                                            DataValueField="IDCALLE" Enabled="False">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: right">
                                        <asp:Label ID="Label3" runat="server" Text="Nro:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNroCalleEmpresa" runat="server" Enabled="False"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td style="text-align: right">
                                        <asp:Label ID="Label4" runat="server" Text="Piso:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPisoEmpresa" runat="server" Enabled="False"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td style="text-align: right">
                                        <asp:Label ID="Label12" runat="server" Text="Depto:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDptoEmpresa" runat="server" Enabled="False"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="styleTitulo">
                        <asp:Panel ID="PanelMedidoresSocio" runat="server" Visible="False">
                            <table>
                                <tr>
                                    <td colspan="5">
                                        <asp:Label runat="server" Text="Medidores Actuales del Socio"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <asp:GridView ID="GridView1" DataKeyNames="IDMEDIDOR" DataSourceID="sdsMedidores"
                                            runat="server" AutoGenerateColumns="False" HeaderStyle-CssClass="estiloHeaderTabla"
                                            CellPadding="4" ForeColor="#333333" GridLines="None" Style="margin-top: 0px"
                                            Width="350px">
                                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                            <Columns>
                                                <asp:BoundField DataField="IDMEDIDOR" HeaderText="Nro. Medidor" ReadOnly="True" SortExpression="IDMEDIDOR"
                                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="NOMBRE" HeaderText="Calle" SortExpression="NOMBRE" HeaderStyle-Width="65px"
                                                    ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="NROCALLE" HeaderText="Nro" SortExpression="NROCALLE" HeaderStyle-Width="65px"
                                                    ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="PISO" HeaderText="Piso" SortExpression="PISO" HeaderStyle-Width="65px"
                                                    ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="DPTO" HeaderText="Dpto" SortExpression="DPTO" HeaderStyle-Width="65px"
                                                    ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="DESCRIPCION" HeaderText="Prioridad" SortExpression="DESCRIPCION"
                                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="DESCRIPCION1" HeaderText="Estado Medidor" SortExpression="DESCRIPCION1"
                                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Panel ID="PanelAsignarMedidor" runat="server" Visible="False">
                            <table>
                                <tr>
                                    <td colspan="5">
                                        <asp:Label ID="Label14" runat="server" Text="Asignación de Medidores"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right">
                                        <asp:Label ID="Label13" runat="server" Text="Tipo de Medidor:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlTipoMedidor" runat="server" AutoPostBack="True" DataTextField="DESCRIPCION"
                                            DataValueField="IDTIPOMEDIDOR" OnSelectedIndexChanged="ddlTipoMedidor_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <asp:GridView ID="gvMedidoresDisponibles" runat="server" AutoGenerateColumns="False"
                                            DataKeyNames="IDMEDIDOR" DataSourceID="sdsMedidoresDisponibles" HeaderStyle-CssClass="estiloHeaderTabla"
                                            CellPadding="4" ForeColor="#333333" GridLines="None" Style="margin-top: 0px"
                                            Width="350px">
                                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:RadioButton ID="gvMedidoresDisponibles_rdbSeleccionar" runat="server" OnCheckedChanged="gvMedidoresDisponibles_rdbSeleccionar_CheckedChanged"
                                                            onclick="RadioCheckOnly(this);" Width="30px" AutoPostBack="True" />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="estiloFilasTabla" Width="30px"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="IDMEDIDOR" HeaderText="Nro. Medidor" ReadOnly="True" SortExpression="IDMEDIDOR"
                                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Column1" HeaderText="Fecha Alta" ReadOnly="True" SortExpression="Column1"
                                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="NROLOTE" HeaderText="Nro. Lote" SortExpression="NROLOTE"
                                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="NROFABRICACION" HeaderText="Nro. Fabricación" SortExpression="NROFABRICACION"
                                                    HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                            </Columns>
                                            <HeaderStyle CssClass="estiloHeaderTabla" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="panelDom" runat="Server" Visible="False">
                            <table>
                                <tr>
                                    <td style="text-align: right">
                                        <asp:Label ID="Label5" runat="server" Text="Calle:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlCalleMed" runat="server" DataSourceID="sdsCalle" DataTextField="NOMBRE"
                                            DataValueField="IDCALLE" Enabled="True">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: right">
                                        <asp:Label ID="Label6" runat="server" Text="Nro:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNroCalleMed" runat="server" Enabled="True"></asp:TextBox>
                                    </td>
                                    <td rowspan="2">
                                        <asp:Button ID="btnVerificar" runat="server" Text="Verificar Domicilio" UseSubmitBehavior="False" />
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                        <asp:Label ID="Label7" runat="server" Text="Piso:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPisoMed" runat="server" Enabled="True"></asp:TextBox>
                                    </td>
                                    <td style="text-align: right">
                                        <asp:Label ID="Label8" runat="server" Text="Depto:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDeptoMed" runat="server" Enabled="True"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td class="style17">
                        &nbsp;
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
                        <div id="divMap" style="width: 800px; height: 350px;" />
                    </td>
                </tr>
                <asp:SqlDataSource ID="ddlTipoDoc" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                    ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [TIPODOCUMENTO]">
                </asp:SqlDataSource>
                <tr>
                    <td>
                        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" 
                            onclick="btnAceptar_Click" />
                    </td>
                    <td>
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:SqlDataSource ID="sdsCalle" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [CALLE]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsMedidoresDisponibles" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT M.IDMEDIDOR, convert(char(10), M.FECHAALTA, 103), M.NROLOTE, M.NROFABRICACION
FROM MEDIDOR M
WHERE M.IDESTADOMEDIDOR = 1
AND M.IDTIPOMEDIDOR = @idTipoMedidor">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlTipoMedidor" Name="idTipoMedidor" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsMedidores" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT M.IDMEDIDOR, C.NOMBRE, D.NROCALLE, D.PISO, D.DPTO, P.DESCRIPCION, EM.DESCRIPCION
FROM MEDIDOR M, PRIORIDAD P, DOMICILIO D, CALLE C, ESTADOMEDIDOR EM
WHERE M.IDDOMICILIO = D.IDDOMICILIO
AND M.IDPRIORIDAD = P.IDPRIORIDAD
AND D.IDCALLE = C.IDCALLE
AND M.IDESTADOMEDIDOR = EM.IDESTADOMEDIDOR
AND M.IDSOCIO = @idsocio">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblNroSocio" Name="idsocio" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <span style="display: none">
        <asp:LinkButton ID="lnkbtn_DummyLnkBtn" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="mpeConfirmacion" PopupControlID="popUpConfirmacion" runat="server"
        TargetControlID="lnkbtn_DummyLnkBtn" BackgroundCssClass="modalBackground">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading" id="modal-1">
            <asp:Label ID="lblNoMedidores" runat="server" Text="¿Desea guardar los cambios?"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarRegistrar" runat="server" Text="Aceptar" OnClick="btnAceltarRegistrar_Click"
                            CssClass="botonPopUp" />
                        <asp:Button ID="btnCancelarRegistrar" runat="server" Text="Cancelar" 
                            CssClass="botonPopUp" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
       <span style="display: none">
        <asp:LinkButton ID="LinkButton2" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="mpeAdvertencia" PopupControlID="popUpAdvertencia"
        BehaviorID="mpeAdv" runat="server" TargetControlID="LinkButton2" BackgroundCssClass="reveal-modal-bg">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpAdvertencia" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image2" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="40px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label9" runat="server" Text="Advertencia" Style="margin-right: 25px"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa; width: 360px">
            <div style="margin-right: 15px; text-align: center">
                o<asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <asp:Label ID="Label20" runat="server" Style="margin-right: 25px" 
                            Text="No hay medidores disponibles para el tipo seleccionado"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
