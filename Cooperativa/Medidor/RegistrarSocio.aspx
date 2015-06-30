<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="RegistrarSocio.aspx.cs" Inherits="Medidor_RegistrarSocio" Title="Registrar Socio" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
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
        .font
        {
            font-family: Sans-Serif;
            font-size: 14px;
        }
        .datos
        {
            text-align: right;
            width: 140px;
        }
        .styleTitulo
        {
            border-bottom-style: inset;
            height: 25px;
        }
        .styleMargen
        {
            margin-top: 10px;
        }
        .styleLabelSegCol
        {
            margin-left: 10px;
        }
        .styleMargenprimerafila
        {
            margin-top: 10px;
            margin-left: 10px;
        }
        .style8
        {
            width: -30;
        }
        .style9
        {
            width: 23px;
        }
        .style14
        {
            width: 175px;
        }
        .style15
        {
            width: 148px;
        }
    </style>

    <script language="javascript" type="text/javascript">


    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td class="styleTitulo">
                <asp:Label ID="Label12" runat="server" Font-Italic="True" Font-Size="Medium" Text="Tipo de Socio"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:RadioButtonList ID="radioTipoSocio" runat="server" AutoPostBack="True" OnSelectedIndexChanged="radioTipoSocio_SelectedIndexChanged"
                    Style="margin-left: 29px" Width="135px">
                    <asp:ListItem>Particular</asp:ListItem>
                    <asp:ListItem>Empresa</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <asp:Panel ID="panelPFisica" runat="server" Visible="false">
        <table id="tablaPFisica">
            <tr>
                <td class="styleTitulo">
                    <asp:Label ID="Label27" runat="server" Font-Italic="True" Font-Size="Medium" Text="Datos del Socio"></asp:Label>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Sexo:" CssClass="styleMargen" Style="text-align: right"
                        Width="109px"></asp:Label>
                </td>
                <td class="style14">
                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                        <ContentTemplate>
                            <asp:RadioButtonList ID="radioSexo" runat="server" AutoPostBack="True" OnSelectedIndexChanged="radioSexo_SelectedIndexChanged">
                                <asp:ListItem>Femenino</asp:ListItem>
                                <asp:ListItem>Masculino</asp:ListItem>
                            </asp:RadioButtonList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td class="style15">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Debe seleccionar un Sexo"
                        ControlToValidate="radioSexo" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Apellido:" CssClass="styleMargen" Style="text-align: right"
                        Width="109px"></asp:Label>
                </td>
                <td class="style14">
                    <asp:TextBox ID="txtApellido" runat="server" Style="margin-left: 13px" CssClass="styleMargen"
                        MaxLength="60"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Debe ingresar un Apellido"
                        ControlToValidate="txtApellido" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td class="style15">
                    <asp:Label ID="Label3" runat="server" Text="Nombre:" Width="109px" Style="text-align: right"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNombre" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Debe ingresar un Nombre"
                        ControlToValidate="txtNombre" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Tipo:" Width="109px" Style="text-align: right"></asp:Label>
                </td>
                <td class="style14">
                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlTipo" runat="server" DataSourceID="sdsTipoDoc" DataTextField="DESCRIPCION"
                                DataValueField="IDTIPODOCUMENTO" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlTipo_SelectedIndexChanged"
                                AutoPostBack="True">
                                <asp:ListItem>Seleccione un Tipo Documento</asp:ListItem>
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td class="style15">
                    <asp:Label ID="Label6" runat="server" Text="Nro Documento:" Style="text-align: right"
                        Width="109px" CssClass="styleLabelSegCol"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNroDocumento" runat="server" MaxLength="8"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Debe ingresar un Número Documento"
                        ControlToValidate="txtNroDocumento" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:SqlDataSource ID="sdsTipoDoc" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                        ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [TIPODOCUMENTO]">
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Debe seleccionar un Tipo Documento"
                        ControlToValidate="ddlTipo" Display="Dynamic" SetFocusOnError="True" InitialValue="Seleccione un Tipo Documento">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Fecha Nacimiento:" Style="text-align: right"
                        Width="109px"></asp:Label>
                </td>
                <td class="style14">
                    <asp:TextBox ID="txtFechaNacimiento" runat="server" OnTextChanged="txtFechaNacimiento_TextChanged"></asp:TextBox>
                    <asp:Image ID="imgFecNac" runat="server" ImageUrl="../Imagenes/1410380987_Calendar_24x24.png"
                        ImageAlign="Middle" Style="vertical-align: middle" />
                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtFechaNacimiento"
                        PopupButtonID="imgFecNac" Format="dd/MM/yyyy">
                    </asp:CalendarExtender>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td class="style15">
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="La Fecha de Nacimiento no puede ser posterior al dia de hoy."
                        ControlToValidate="txtFechaNacimiento" Display="Dynamic" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label11" runat="server" Text="Teléfono Fijo:" Style="text-align: right"
                        Width="109px"></asp:Label>
                </td>
                <td class="style14">
                    <asp:TextBox ID="txtTelFijo" runat="server" MaxLength="9"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label13" runat="server" Text="e-mail:" Style="text-align: right" Width="109px"></asp:Label>
                </td>
                <td class="style14">
                    <asp:TextBox ID="txtEmail" runat="server" MaxLength="60" Width="261px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="Debe ingresar un dirección de Email"
                        ControlToValidate="txtEmail" Display="Dynamic" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Ingrese correctamente la dirección de Email"
                        ControlToValidate="txtEmail" Display="Dynamic" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
        <table style="margin-top: 0px; width: 840px">
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Calle:" Style="text-align: right" Width="109px"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlCalle" runat="server" DataSourceID="sdsCalle" DataTextField="NOMBRE"
                        DataValueField="IDCALLE" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True">Seleccione una Calle</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Debe seleccionar una Calle"
                        ControlToValidate="ddlCalle" SetFocusOnError="True" InitialValue="Seleccione una Calle">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Número:" Style="text-align: right" CssClass="styleLabelSegCol"></asp:Label>
                </td>
                <td width="30px">
                    <asp:TextBox ID="txtNroCalle" runat="server" Width="40px" MaxLength="4"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Debe ingresar un Número de Calle"
                        ControlToValidate="txtNroCalle" Display="Dynamic" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td class="style9">
                    <asp:Label ID="Label9" runat="server" Text="Piso:" CssClass="styleLabelSegCol" Style="text-align: right"
                        Width="27px"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPiso" runat="server" Width="40px" MaxLength="2"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="Depto:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDpto" runat="server" Width="40px" MaxLength="2"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label29" runat="server" Text="Zona:" CssClass="styleLabelSegCol" Style="text-align: right"
                        Width="30px"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlZona" runat="server" DataSourceID="sdsZona" DataTextField="DESCRIPCION"
                        DataValueField="IDZONA" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlZona_SelectedIndexChanged"
                        AutoPostBack="True">
                        <asp:ListItem>Seleccione una Zona</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlZona"
                        Display="Dynamic" ErrorMessage="Debe seleccionar una Zona" InitialValue="Seleccione una Zona"
                        SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                </td>
                <td>
                    <asp:SqlDataSource ID="sdsCalle" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                        ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [CALLE]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:SqlDataSource ID="sdsZona" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                        ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [ZONA]"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <table style="margin-top: 0px">
            <tr>
                <td colspan="2">
                    &nbsp;
                    <asp:Label ID="lblMensajes" runat="server" ForeColor="#CC0000"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td colspan="3">
                    &nbsp;
                </td>
                <td colspan="2">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td colspan="2">
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
    </asp:Panel>
    <asp:Panel ID="panelPJuridica" runat="server" Visible="false">
        <table id="tablaPJuridica">
            <tr>
                <td class="styleTitulo">
                    <asp:Label ID="Label28" runat="server" Font-Italic="True" Font-Size="Medium" Text="Datos Socio "></asp:Label>
                    &nbsp;
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label14" runat="server" Text="Razón Social:" CssClass="styleMargen"
                        Style="text-align: right" Width="109px"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtRazonSocial" runat="server" CssClass="styleMargen" Width="128px"
                        MaxLength="20"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Debe ingresar una Razón Social"
                        ControlToValidate="txtRazonSocial" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label15" runat="server" Text="Nro CUIT:" Style="text-align: right"
                        Width="109px"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCUIT" runat="server" Height="22px" Width="128px" MaxLength="11"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Debe ingresar un CUIT"
                        ControlToValidate="txtCUIT" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label16" runat="server" Text="Tipo Organización:" Style="text-align: right"
                        Width="109px"></asp:Label>
                </td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlTipoOrganizacion" runat="server" DataSourceID="sdsTipoOrganizacion"
                                DataTextField="DESCRIPCION" DataValueField="IDTIPOORGANIZACION" AppendDataBoundItems="True"
                                OnSelectedIndexChanged="ddlTipoOrganizacion_SelectedIndexChanged">
                                <asp:ListItem>Seleccione un Tipo Organización</asp:ListItem>
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Debe seleccionar un Tipo Organización"
                        ControlToValidate="ddlTipoOrganizacion" SetFocusOnError="True" Display="Dynamic"
                        InitialValue="Seleccione un Tipo Organización">*</asp:RequiredFieldValidator>
                </td>
                <asp:SqlDataSource ID="sdsTipoOrganizacion" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                    ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [TIPOORGANIZACION]">
                </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label17" runat="server" Text="Inicio Actividad:" Style="text-align: right"
                        Width="109px"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFechaInicio" runat="server" AutoPostBack="True"></asp:TextBox>
                </td>
                <td>
                    <asp:Image ID="imgFecInic" runat="server" ImageUrl="../Imagenes/1410380987_Calendar_24x24.png"
                        ImageAlign="Middle" Style="vertical-align: middle" />
                    <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtFechaInicio"
                        PopupButtonID="imgFecInic" Format="dd/MM/yyyy">
                    </asp:CalendarExtender>
                </td>
                <td>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="La Fecha de Inicio de Actividad no puede ser posterior al dia de hoy."
                        ControlToValidate="txtFechaInicio" Display="Dynamic" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label18" runat="server" Text="Calle:" Style="text-align: right" Width="109px"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlCalleEmpresa" runat="server" DataSourceID="sdsCalle" DataTextField="NOMBRE"
                        DataValueField="IDCALLE" AppendDataBoundItems="True">
                        <asp:ListItem>Seleccione una Calle</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Debe seleccionar una Calle"
                        ControlToValidate="ddlCalleEmpresa" Display="Dynamic" InitialValue="Seleccione una Calle"
                        SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Label ID="Label19" runat="server" Text="Número:" Style="text-align: right" Width="80px"
                        CssClass="styleLabelSegCol"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNroCalleEmpresa" runat="server" Width="40px" MaxLength="4"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Debe ingresar un Número de Calle"
                        SetFocusOnError="True" ControlToValidate="txtNroCalleEmpresa" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Label ID="Label20" runat="server" Text="Piso:" Style="text-align: right" CssClass="styleLabelSegCol"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPisoEmpresa" runat="server" Width="40px" MaxLength="2"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label21" runat="server" Text="Depto:" Style="text-align: right" CssClass="styleLabelSegCol"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDptoEmpresa" runat="server" Width="40px" MaxLength="2"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label32" runat="server" Text="Zona:" CssClass="styleLabelSegCol" Style="text-align: right"
                        Width="30px"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlZonaEmpresa" runat="server" DataSourceID="sdsZona" DataTextField="DESCRIPCION"
                        DataValueField="IDZONA" AppendDataBoundItems="True">
                        <asp:ListItem>Seleccione una Zona</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Debe seleccionar una Zona"
                        ControlToValidate="ddlCalleEmpresa" Display="Dynamic" InitialValue="Seleccione una Zona"
                        SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label22" runat="server" Text="Teléfono:" Style="text-align: right"
                        Width="109px"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTelEmpresa" runat="server" MaxLength="9"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label23" runat="server" Text="e-mail:" Style="text-align: right" Width="109px"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmailEmpresa" runat="server" MaxLength="60" Width="261px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="Debe ingresar un Dirección de Email"
                        ControlToValidate="txtEmailEmpresa" Display="Dynamic" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ingrese correctamente la dirección de Email"
                        ControlToValidate="txtEmailEmpresa" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label24" runat="server" Text="Página Web:" Style="text-align: right"
                        Width="109px"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtWebEmpresa" runat="server" MaxLength="20" Width="261px"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Ingrese correctamente la Dirección URL"
                        ControlToValidate="txtWebEmpresa" SetFocusOnError="True" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label25" runat="server" Text="Tipo (Resp):" Style="text-align: right"
                        Width="109px"></asp:Label>
                </td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlTipoDocResp" runat="server" DataSourceID="sdsTipoDoc" DataTextField="DESCRIPCION"
                                DataValueField="IDTIPODOCUMENTO" AppendDataBoundItems="True" AutoPostBack="True"
                                OnSelectedIndexChanged="ddlTipoDocResp_SelectedIndexChanged">
                                <asp:ListItem>Seleccione un Tipo Documento</asp:ListItem>
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="Debe seleccionar un Tipo Documento"
                        InitialValue="Seleccione un Tipo Documento" SetFocusOnError="True" ControlToValidate="ddlTipoDocResp"
                        Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Label ID="Label26" runat="server" Text="Nro Documento (Resp):" Style="text-align: right"
                        Width="109px"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNroDocResp" runat="server" MaxLength="8"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="Debe ingresar un Número Documento"
                        ControlToValidate="txtNroDocResp" Display="Dynamic" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading">
            <asp:Label ID="Label31" runat="server" Text="¿Desea confirmar la registración de Nuevo Socio?"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
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
    <asp:Panel ID="popUpCancelarRegistrar" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image2" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="40px" />
        </div>
        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
            <ContentTemplate>
                <div class="heading" style="width: 420px">
                    <asp:Label ID="lblTitAdvertencia" runat="server" Text="¿Está seguro que desea cancelar la registración?"></asp:Label>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa; width: 420px">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <div>
                            <asp:Label ID="lblMsjAdvertencia" runat="server" Text=""></asp:Label>
                        </div>
                        <div>
                            <asp:Button ID="btnAceptarCancelacion" runat="server" Text="Aceptar" CausesValidation="False"
                                OnClick="btnAceptarCancelacion_Click" Style="margin-top: 35px" />
                            <asp:Button ID="btnCancelarCancelacion" runat="server" Text="Cancelar" CausesValidation="False"
                                OnClick="btnCancelarCancelacion_Click" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="popUpExito" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px; height: auto">
            <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="35px" />
        </div>
        <div class="heading" style="width: 400px">
            <asp:Label ID="Label33" runat="server" Text="El Socio fue registrado con éxito" Style="margin-right: 15px"></asp:Label>
            <br />
            <asp:Label ID="Label30" runat="server" Text="Tome nota de sus datos de Usuario. Recuerde cambiar su contraseña."></asp:Label>
            <br />
            <asp:Label ID="lblNombreUsuario" runat="server" Text="USUARIO: nombre"></asp:Label>
            <asp:Label ID="lblPassword" runat="server" Text="CONTRASEÑA: Nº Documento"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa; width: 400px">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarConfirmacion_Click" CssClass="botonPopUp" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <table>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click"
                            Style="margin-left: 200px" Enabled="False" />
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click"
                            CausesValidation="False" />
                        <span style="display: none">
                            <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
                        </span>
                        <asp:ModalPopupExtender ID="ModalPopupCancelarRegistrar" PopupControlID="popUpCancelarRegistrar"
                            runat="server" TargetControlID="LinkButton1" BackgroundCssClass="reveal-modal-bg">
                        </asp:ModalPopupExtender>
                        <span style="display: none">
                            <asp:LinkButton ID="LinkButton2" runat="server">LinkButton</asp:LinkButton>
                        </span>
                        <asp:ModalPopupExtender ID="ModalPopupRegistrar" runat="server" PopupControlID="popUpConfirmacion"
                            TargetControlID="LinkButton2" BackgroundCssClass="reveal-modal-bg">
                        </asp:ModalPopupExtender>
                        <span style="display: none">
                            <asp:LinkButton ID="LinkButton3" runat="server">LinkButton</asp:LinkButton>
                        </span>
                        <asp:ModalPopupExtender ID="ModalPopupExito" PopupControlID="popUpExito" runat="server"
                            TargetControlID="LinkButton3" BackgroundCssClass="reveal-modal-bg">
                        </asp:ModalPopupExtender>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
</asp:Content>
