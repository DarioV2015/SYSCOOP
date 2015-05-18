<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="RegistrarReclamo.aspx.cs" Inherits="MCorrectivoSesion_RegistrarReclamo"
    Title="Registrar Reclamo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
    <link href="../Style/TabStyle2.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
    
     function RadioCheckOnly(rbControl) {
     
      var gvName = rbControl.defaultValue.split('_')[0];
      var gvControl;
      
      switch (gvName)
      {
        case "gvMedidores":
        gvControl =  "<%=gvMedidores.ClientID%>";       
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
            font-family: Calibri;
            font-size: 17px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="tabconteiner1" runat="server" ActiveTabIndex="0" CssClass="TabStyle2"
        Style="margin-left: 27px; margin-top: 15px; height: 280px">
        <asp:TabPanel ID="tabPanel3" runat="server" HeaderText="Búsqueda" Font-Names="Calibri"
            Font-Size="17px" Height="140px">
            <ContentTemplate>
                <table width="950px">
                    <tr>
                        <td valign="top">
                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="panelBusqueda" runat="server">
                                        <fieldset class="FieldDatos" style="height: 220px; width: 300px">
                                            <legend class="legendDatos">
                                            Buscar
                                                <asp:ImageButton ID="btnBuscar" runat="server"  OnClick="btnBuscar_Click" 
                                                ImageUrl="../Imagenes/button-Buscar.png" style="vertical-align:middle; margin-left:9px; margin-right:7px" /> 
                                            </legend>
                                            <table width="450px">
                                                <tr>
                                                    <td width="60px">
                                                        <asp:RadioButton ID="rdbSocio" runat="server" AutoPostBack="True" GroupName="2" OnCheckedChanged="rdbSocio_CheckedChanged"
                                                            Text="Socio" Style="margin-top: 5px; vertical-align: bottom" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbNroSocio" runat="server" AutoPostBack="True" GroupName="1"
                                                            OnCheckedChanged="rdbNroSocio_CheckedChanged" Text="Nro. Socio" Style="margin-top: 5px;
                                                            vertical-align: bottom" Visible="False" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblNroSocio" runat="server" Text="Nro.:" Visible="False"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtNroSocio" runat="server" Visible="False"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td width="92px">
                                                        <asp:RadioButton ID="rdbDocumento" runat="server" AutoPostBack="True" GroupName="1"
                                                            OnCheckedChanged="rdbDocumento_CheckedChanged" Text="Documento" Style="margin-top: 5px;
                                                            vertical-align: bottom" Visible="False" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblTipoDocumento" runat="server" Text="Tipo:" Visible="False"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="comboTipoDocumento" runat="server" AppendDataBoundItems="True"
                                                            AutoPostBack="True" DataSourceID="sdsTipoDocumentoSocio" DataTextField="DESCRIPCION"
                                                            DataValueField="IDTIPODOCUMENTO" OnSelectedIndexChanged="comboTipoDocumento_SelectedIndexChanged"
                                                            Visible="False" Width="92px">
                                                            <asp:ListItem>Seleccione el Tipo de Documento</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblNroDocumento" runat="server" Text="Nro.:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtNroDocumento" runat="server" Visible="False" Width="70px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:SqlDataSource ID="sdsTipoDocumentoSocio" runat="server" ConnectionString="<%$ ConnectionStrings:SISEConnectionString %>"
                                                            SelectCommand="SELECT [IDTIPODOCUMENTO], [DESCRIPCION] FROM [TIPODOCUMENTO]">
                                                        </asp:SqlDataSource>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbCUIT" runat="server" AutoPostBack="True" GroupName="1" OnCheckedChanged="rdbCUIT_CheckedChanged"
                                                            Text="CUIT" Style="margin-top: 5px; vertical-align: bottom" Visible="False" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblCUIT" runat="server" Text="Nro. CUIT:" Visible="False"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtNroCUIT" runat="server" Visible="False"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:RadioButton ID="rdbNoSocio" runat="server" AutoPostBack="True" GroupName="2"
                                                            OnCheckedChanged="rdbNoSocio_CheckedChanged" Text="No Socio" Style="margin-top: 5px;
                                                            vertical-align: bottom" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <table style="margin-left: 150px">
                                                <tr>
                                                   <%-- <td>
                                                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                                                    </td>--%>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset></asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td valign="top">
                            <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="PanelNoSocio" runat="server" Visible="false">
                                        <fieldset class="FieldDatos" style="width: 320px; margin-left: 100px; height: 220px">
                                            <legend class="legendDatos">Particular</legend>
                                            <table width="400px" style="height: 130px;">
                                                <tr>
                                                    <td class="datos">
                                                        <asp:Label ID="LabelApellidoNoSoico" runat="server" Text="Apellido:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtApellidoNoSocio" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="datos">
                                                        <asp:Label ID="Label36" runat="server" Text="Nombre:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtNombreNoSocio" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="datos">
                                                        <asp:Label ID="Label38" runat="server" Text="Tipo Doc:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="rdbTipoDocNoSocio" runat="server" DataSourceID="sdsTipoDocNoSocio"
                                                            DataTextField="DESCRIPCION" DataValueField="IDTIPODOCUMENTO" AppendDataBoundItems="True"
                                                            AutoPostBack="True" Width="200px" OnSelectedIndexChanged="rdbTipoDocNoSocio_SelectedIndexChanged">
                                                            <asp:ListItem>Seleccione el Tipo de Documento</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td class="datos">
                                                        <asp:Label ID="Label45" runat="server" Text="Nro Doc:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtNroDocNoSocio" runat="server" Width="92px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:SqlDataSource ID="sdsTipoDocNoSocio" runat="server" ConnectionString="<%$ ConnectionStrings:SISEConnectionString %>"
                                                            SelectCommand="SELECT [DESCRIPCION], [IDTIPODOCUMENTO] FROM [TIPODOCUMENTO]">
                                                        </asp:SqlDataSource>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="datos">
                                                        <asp:Label ID="Label35" runat="server" Text="Tel.:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtNroTelNoSoc" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset></asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="PanelSocioParticular" runat="server" Visible="False">
                                        <fieldset class="FieldDatos" style="width: 260px; height: 220px">
                                            <legend class="legendDatos">Socio Particular</legend>
                                            <table width="330px" style="margin-left: 10px; height: 140px">
                                                <tr>
                                                    <td class="datos">
                                                        <asp:Label ID="Label27" runat="server" Text="Nro. Socio:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtNroSocioP" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label40" runat="server" Text="Calle:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtCalleSocioP" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="datos">
                                                        <asp:Label ID="Label15" runat="server" Text="Apellido:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtApellidoSocioP" runat="server" Enabled="False"></asp:Label>
                                                    </td>
                                                    <td class="datos">
                                                        <asp:Label ID="Label41" runat="server" Text="Nº:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtNroCalleSocioP" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="datos">
                                                        <asp:Label ID="Label16" runat="server" Text="Nombre:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtNombreSocioP" runat="server"></asp:Label>
                                                    </td>
                                                    <td class="datos">
                                                        <asp:Label ID="Label42" runat="server" Text="Piso:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtPisoSocioP" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="datos">
                                                        <asp:Label ID="Label17" runat="server" Text="Tipo Doc:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtTipoDocP" runat="server"></asp:Label>
                                                    </td>
                                                    <td class="datos">
                                                        <asp:Label ID="Label43" runat="server" Text="Dpto.:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtDptoSocioP" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="datos">
                                                        <asp:Label ID="Label18" runat="server" Text="Nro Doc:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtNroDocSocioP" runat="server"></asp:Label>
                                                    </td>
                                                    <td class="datos">
                                                        <asp:Label ID="Label44" runat="server" Text="Zona:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtZonaSocioP" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset></asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="PanelSocioEmpresa" runat="server" Visible="False">
                                        <fieldset class="FieldDatos">
                                            <legend class="legendDatos">Empresa</legend>
                                            <table width="800px" style="margin-top: 12px">
                                                <tr>
                                                    <td style="border-bottom-style: inset" height="25px">
                                                        &nbsp;
                                                        <asp:Label ID="Label2" runat="server" Font-Italic="True" Font-Size="Medium" Text="Datos del Socio Empresa"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table>
                                                <tr>
                                                    <td class="datos">
                                                        <asp:Label ID="Label25" runat="server" Text="Nro. Socio:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblNroSocioE" runat="server"></asp:Label>
                                                    </td>
                                                    <td class="datos">
                                                        <asp:Label ID="Label4" runat="server" Text="CUIT:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblCUITE" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="datos">
                                                        <asp:Label ID="Label6" runat="server" Text="Razón Social:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblRazonSocialE" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="datos">
                                                        <asp:Label ID="Label3" runat="server" Text="Apellido Responsable:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblApellidoSocioE" runat="server"></asp:Label>
                                                    </td>
                                                    <td class="datos">
                                                        <asp:Label ID="Label5" runat="server" Text="Nombre Responsable:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblNombreSocioE" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label11" runat="server" Text="Calle:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblCalleE" runat="server"></asp:Label>
                                                    </td>
                                                    <td class="datos">
                                                        <asp:Label ID="Label13" runat="server" Text="Nº:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblNroCalleE" runat="server"></asp:Label>
                                                    </td>
                                                    <td class="datos">
                                                        <asp:Label ID="Label19" runat="server" Text="Piso:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblPisoE" runat="server"></asp:Label>
                                                    </td>
                                                    <td class="datos">
                                                        <asp:Label ID="Label21" runat="server" Text="Dpto.:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblDptoE" runat="server"></asp:Label>
                                                    </td>
                                                    <td class="datos">
                                                        <asp:Label ID="Label23" runat="server" Text="Zona:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblZonaE" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset></asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="tabPanel1" runat="server" HeaderText="Domicilio Incidente" Font-Names="Calibri"
            Font-Size="17px" Height="140px" Enabled="True">
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="PanelMedidores" runat="server" Visible="False" Style="display: inline-flex">
                            <table style="margin-top: 0px">
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvMedidores" runat="server" AutoGenerateColumns="False" DataKeyNames="IDMEDIDOR"
                                            DataSourceID="SDSMedidoresSocio" HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4"
                                            ForeColor="#333333" GridLines="None" OnRowDataBound="gvMedidores_RowDataBound"
                                            OnRowCommand="gvMedidores_RowCommand" Width="700px" Style="margin-top: 10px; margin-left:60px">
                                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:RadioButton ID="gvMedidores_rdbSeleccionado" runat="server" Style="position: static"
                                                            AutoPostBack="True" OnCheckedChanged="rdbMedidor_CheckedChanged" onclick="RadioCheckOnly(this); " />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="IDMEDIDOR" HeaderText="Medidor" ReadOnly="True" SortExpression="IDMEDIDOR">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="DESCRIPCION" HeaderText="Tipo" SortExpression="DESCRIPCION"
                                                    HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Expr1" HeaderText="Zona" SortExpression="Expr1" HeaderStyle-Width="60px"
                                                    ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="NOMBRE" HeaderText="Calle" SortExpression="NOMBRE" HeaderStyle-Width="110px"
                                                    ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="110px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="NROCALLE" HeaderText="Nro" SortExpression="NROCALLE" HeaderStyle-Width="60px"
                                                    ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="PISO" HeaderText="Piso" SortExpression="PISO" HeaderStyle-Width="60px"
                                                    ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="DPTO" HeaderText="Dpto" SortExpression="DPTO" HeaderStyle-Width="60px"
                                                    ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="IDLINEA" HeaderText="Línea" SortExpression="IDLINEA" HeaderStyle-Width="60px"
                                                    ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Expr2" HeaderText="Prioridad" SortExpression="Expr2" HeaderStyle-Width="60px"
                                                    ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="IDCALLE" HeaderText="IDCALLE" SortExpression="IDCALLE"
                                                    HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="IDDOMICILIO" HeaderText="IDDOMICILIO" SortExpression="IDDOMICILIO"
                                                    HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:TemplateField ShowHeader="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="20px"
                                                    ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="estiloHeaderTabla">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="ImageButton4" CommandArgument='<%# Eval("idmedidor") %>' CommandName="DeshabilitarMedidor"
                                                            runat="server" ImageUrl="../Imagenes/cancel.png" CausesValidation="false" Width="15px"
                                                            Height="15px" Style="vertical-align: middle; margin-bottom: 3px;" />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="estiloFilasTabla" Width="10px"></ItemStyle>
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle CssClass="estiloHeaderTabla" />
                                        </asp:GridView>
                                    </td>
                                    <td>
                                        <asp:SqlDataSource ID="SDSMedidoresSocio" runat="server" ConnectionString="<%$ ConnectionStrings:SISEConnectionString %>"
                                            SelectCommand="SELECT M.IDMEDIDOR, TM.DESCRIPCION, Z.DESCRIPCION AS Expr1, C.NOMBRE, D.NROCALLE, D.PISO, D.DPTO, M.IDLINEA, P.DESCRIPCION AS Expr2, D.IDCALLE, D.IDDOMICILIO FROM MEDIDOR AS M INNER JOIN TIPOMEDIDOR AS TM ON M.IDTIPOMEDIDOR = TM.IDTIPOMEDIDOR INNER JOIN DOMICILIO AS D ON M.IDDOMICILIO = D.IDDOMICILIO INNER JOIN CALLE AS C ON D.IDCALLE = C.IDCALLE INNER JOIN ZONA AS Z ON D.IDZONA = Z.IDZONA INNER JOIN PRIORIDAD AS P ON M.IDPRIORIDAD = P.IDPRIORIDAD WHERE (M.IDSOCIO = @IDSOCIO)">
                                            <SelectParameters>
                                                <asp:Parameter Name="IDSOCIO" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="panelNuevaDir" runat="server" Visible="false">
                            <table style="margin-left:40px">
                                <tr>
                                    <td>
                                        <asp:Button ID="btnNuevaDireccion" runat="server" Text="Nueva Dirección" OnClick="btnNuevaDireccion_Click" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="panelNuevaDireccion" runat="server" Visible="false">
                            <table width="800px" style="margin-top: 12px; margin-left:60px">
                                <tr>
                                    <td style="border-bottom-style: inset" height="25px">
                                        &nbsp;
                                        <asp:Label ID="Label8" runat="server" Font-Italic="True" Font-Size="Medium" Text="Dirección del Incidente"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table style="margin-left:60px">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label9" runat="server" Text="Calle:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="rdbCalle" runat="server" AppendDataBoundItems="True" DataSourceID="sdsCalle"
                                            DataTextField="NOMBRE" DataValueField="IDCALLE" AutoPostBack="True" OnSelectedIndexChanged="rdbCalle_SelectedIndexChanged">
                                            <asp:ListItem>Seleccione la Calle</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="datos">
                                        <asp:Label ID="Label14" runat="server" Text="Nº:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="lblNroCalleNueva" runat="server" Width="45px"></asp:TextBox>
                                    </td>
                                    <td class="datos">
                                        <asp:Label ID="Label22" runat="server" Text="Piso:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="lblNroPisoNuevo" runat="server" Width="45px"></asp:TextBox>
                                    </td>
                                    <td class="datos">
                                        <asp:Label ID="Label26" runat="server" Text="Dpto.:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="lblNroDptoNuevo" runat="server" Width="45px"></asp:TextBox>
                                    </td>
                                    <td class="datos">
                                        <asp:Label ID="Label29" runat="server" Text="Zona:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="rdbZona" runat="server" AppendDataBoundItems="True" DataSourceID="sdsZona"
                                            DataTextField="DESCRIPCION" DataValueField="IDZONA">
                                            <asp:ListItem>Seleccione la Zona</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="btnAceptarDireccion" runat="server" OnClick="btnAceptarDireccion_Click"
                                            ImageUrl="../Imagenes/aceptar.png" />
                                        <%-- <asp:Button ID="btnAceptarDireccion" runat="server" Text="Aceptar" OnClick="btnAceptarDireccion_Click" />--%>
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="btnCancelarDireccion" runat="server" OnClick="btnCancelarDireccion_Click"
                                            ImageUrl="../Imagenes/button-CANCELAR.png" />
                                        <%--<asp:Button ID="btnCancelarDireccion" runat="server" Text="Cancelar" OnClick="btnCancelarDireccion_Click" />--%>
                                    </td>
                                    <td>
                                        <asp:SqlDataSource ID="sdsZona" runat="server" ConnectionString="<%$ ConnectionStrings:SISEConnectionString %>"
                                            SelectCommand="SELECT [IDZONA], [DESCRIPCION] FROM [ZONA]"></asp:SqlDataSource>
                                    </td>
                                    <td>
                                        <asp:SqlDataSource ID="sdsCalle" runat="server" ConnectionString="<%$ ConnectionStrings:SISEConnectionString %>"
                                            SelectCommand="SELECT [IDCALLE], [NOMBRE] FROM [CALLE]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="tabPanel2" runat="server" HeaderText="Detalle del Reclamo" Font-Names="Calibri"
            Font-Size="17px" Height="140px">
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="panelDetalleReclamo" runat="server" Visible="false">
                           
                            <table style="margin-left:130px; margin-top:25px">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label20" runat="server" Text="Reclamo:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtReclamo" runat="server" Rows="4" Width="417px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label24" runat="server" Text="Tipo de Reclamo:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="rdbTipoReclamo" runat="server" DataSourceID="sdsTipoReclamo"
                                            DataTextField="DESCRIPCION" DataValueField="IDTIPORECLAMO" AppendDataBoundItems="True"
                                            AutoPostBack="True" OnSelectedIndexChanged="rdbTipoReclamo_SelectedIndexChanged"
                                            Width="240px">
                                            <asp:ListItem>Seleccione el Tipo de Reclamo</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ImageButton ID="btnNuevoTipoReclamo" runat="server" OnClick="btnNuevoTipoReclamo_Click"
                                            ImageUrl="../Imagenes/button-MAS1.png"  style="vertical-align:bottom"/>
                                    </td>
                                    <td>
                                        <%-- <asp:Button ID="btnNuevoTipoReclamo" runat="server" Text="Nuevo Tipo" OnClick="btnNuevoTipoReclamo_Click" />--%>
                                    </td>
                                    <td>
                                        <asp:SqlDataSource ID="sdsTipoReclamo" runat="server" ConnectionString="<%$ ConnectionStrings:SISEConnectionString %>"
                                            SelectCommand="SELECT [IDTIPORECLAMO], [DESCRIPCION] FROM [TIPORECLAMO]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPrioridadTipo" runat="server" Text="Prioridad del Tipo: " Visible="false"></asp:Label>
                                    </td>
                                    <td height="25px">
                                        <asp:Label ID="lblPrioridad" runat="server" Visible="false" style="margin-left:10px"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
    <asp:UpdatePanel ID="UpdatePanel8" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panel1" runat="server">
                <table width="100px" style="margin-top: 60px; margin-left: 250px">
                    <tr>
                        <td>
                            <asp:Button ID="btnRegistrarReclamo" runat="server" Text="Registrar" OnClick="btnRegistrarReclamo_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnCancelarReclamo" runat="server" Text="Cancelar" OnClick="btnCancelarReclamo_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupConfirmacion" PopupControlID="popUpConfirmacion"
        runat="server" TargetControlID="LinkButton1" BackgroundCssClass="reveal-modal-bg" />
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading">
            <asp:Label ID="Label31" runat="server" Text="¿Desea registrar el Reclamo?"></asp:Label>
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
            <asp:Image ID="Image3" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="36px" />
        </div>
        <div class="heading">
            <asp:Label ID="Label1" runat="server" Text="El Reclamo fue registrado con éxito"
                Style="margin-right: 15px"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 150px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center">
                <br />
                <br />
                <asp:UpdatePanel ID="UpdatePanel11" runat="server" >
                    <ContentTemplate>
                        <asp:Label ID="lblReclamo" runat="server"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                    <ContentTemplate>
                        <br />
                        <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarConfirmacion_Click" CssClass="botonPopUp" style="margin-left:0px" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
