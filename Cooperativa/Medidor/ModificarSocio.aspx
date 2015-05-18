<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true" CodeFile="ModificarSocio.aspx.cs" Inherits="Medidor_ModificarSocio" Title="Página sin título" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .styleTitulo
        {
            height:10px;
            text-align:left;
            border-bottom-style: solid;
            border-width: 1px;
            border-bottom-color: rgb(192, 192, 165);
            border-width: 1px;
            font-family: "Source Sans Pro", Helvetica, Arial;
            font-weight:bold;
            font-size:12px;
            
        }
    .styleLabelSegCol
    {
    	margin-left:10px;
    }    
    .styleMargen
    {
    	margin-top:10px;
    	}
    .styleMargenprimerafila
    {
    	margin-top:10px;
    	margin-left:10px;
    	}
    .style8
    {
        height: 20px;
    }
      
    .style11
    {
        width: 3px;
    }
  
 </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table style="width: 94%;">
     <tr>
            <td class="styleTitulo" colspan="6" height="15px" >
                Buscar Socio
            </td>
        </tr>
    <tr style="margin-top:0px">
        <td  rowspan="2" width="160px">
            <asp:RadioButtonList ID="rbl_Busqueda" runat="server" AutoPostBack="True" 
                >
                <asp:ListItem >Socio Particular</asp:ListItem>
                <asp:ListItem>Socio Empresa</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td  rowspan="2" width="190px">
            <asp:TextBox ID="txtNroSocio" runat="server" style="margin-top:15px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Debe ingresar un Número de Socio" 
                ControlToValidate="txtNroSocio" Display="Dynamic" SetFocusOnError="True">*</asp:RequiredFieldValidator>
        </td>
        <td  rowspan="2">
                <asp:Button ID="btnBuscar" runat="server" style="margin-top:15px" onclick="btnBuscar_Click" 
                    Text="Buscar" />
                </td>
        <td  rowspan="2">
            &nbsp;</td>
        <td  rowspan="2">
            &nbsp;</td>
        <td >
            </td>
        <td >
            <asp:Panel ID="panelNroSocio" runat="server" Visible="false">
            </asp:Panel>
        </td>
        <td  rowspan="2">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style8" >
            </td>
    </tr>
    <tr>
        <td  colspan="6">
    <asp:Panel ID="panelPFisica" runat="server" Visible="false" >
    <table id="tablaPFisica" style="width:100%;" width="20px">
    <tr>
    <td class="styleTitulo" colspan="14" >
                Datos del Socio
            </td>
            </tr>
        <tr>
            <td  colspan="1">
                <asp:Label ID="Label33" runat="server" Text="Número Socio:" Width="109px" Style="text-align:right" CssClass="styleMargen"></asp:Label>
            </td>
            <td  colspan="1">
                <asp:TextBox ID="txtNroSocioParticular" runat="server" Enabled="False" 
                    CssClass="styleMargenprimerafila"></asp:TextBox>
            </td>
            <td  colspan="1">
                <asp:Label ID="Label34" runat="server" Text="Fecha Alta Socio:" Width="109px" Style="text-align:right" CssClass="styleMargenprimerafila"></asp:Label>
            </td>
            <td  colspan="4">
                <asp:TextBox ID="txtFechaAltaSocio" runat="server" Enabled="False" CssClass="styleMargen"></asp:TextBox>
            </td>
            <td >
            </td>
            <td >
            </td>
        </tr>
        <tr>
            <td  colspan="1">
                <asp:Label ID="Label1" runat="server" Text="Apellido:" Width="109px" Style="text-align:right"></asp:Label>
            </td>
            <td  colspan="1">
                <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ErrorMessage="Debe ingresar un Apellido" ControlToValidate="txtApellido" 
                    Display="Dynamic" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </td>
            <td  colspan="1">
                <asp:Label ID="Label3" runat="server" Text="Nombre:" Width="109px" Style="text-align:right" CssClass="styleLabelSegCol"></asp:Label>
            </td>
            <td  colspan="4">
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ErrorMessage="Debe ingresar un Nombre" ControlToValidate="txtNombre" 
                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </td>
            <td >
            </td>
            <td >
            </td>
        </tr>
        <tr>
            <td  colspan="1">
                <asp:Label ID="Label2" runat="server" Text="Tipo:" Width="109px" Style="text-align:right"></asp:Label>
            </td>
            <td  colspan="1">
                <asp:SqlDataSource ID="sdsTipoDoc0" runat="server" 
                    ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                    ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT * FROM [TIPODOCUMENTO]"></asp:SqlDataSource>
                <asp:DropDownList ID="ddlTipo" runat="server" DataSourceID="sdsTipoDoc0" 
                    DataTextField="DESCRIPCION" DataValueField="IDTIPODOCUMENTO" 
                    Enabled="False">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ErrorMessage="Debe seleccionar un Tipo Documento" 
                    ControlToValidate="ddlTipo" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </td>
            <td  colspan="1">
                <asp:Label ID="Label6" runat="server" Text="Nro Documento:" Width="109px" Style="text-align:right" CssClass="styleLabelSegCol"></asp:Label>
            </td>
            <td  colspan="4">
                <asp:TextBox ID="txtNroDocumento" runat="server" Enabled="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td  colspan="1" >
                <asp:Label ID="Label4" runat="server" Text="Fecha Nacimiento:" Width="109px" Style="text-align:right"></asp:Label>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtFechaNacimiento" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            <td colspan="8" >
            </td>
        </tr>
        <tr>
            
            <td >
          <asp:Label ID="Label7" runat="server" Text="Calle:" Width="109px" Style="text-align:right"></asp:Label>
            </td>
                   
                        <td Style="list-style:none" >
                            <asp:SqlDataSource ID="sdsCalle" runat="server" 
                                ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                                ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [CALLE]">
                            </asp:SqlDataSource>
                            <asp:DropDownList ID="ddlCalle" runat="server" DataSourceID="sdsCalle" 
                                DataTextField="NOMBRE" DataValueField="IDCALLE" Height="22px" 
                                Width="121px" >
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </td>
                        <td colspan="1" rowspan="1" >
                            <asp:Label ID="Label8" runat="server" Text="Número:" Width="109px" Style="text-align:right" CssClass="styleLabelSegCol"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNroCalle" runat="server" Width="40px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
                        <td  >
                            <asp:Label ID="Label9" runat="server" CssClass="styleLabelSegCol" 
                                Style="text-align:right" Text="Piso:" Width="30px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPiso" runat="server" Width="40px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Label ID="Label10" runat="server" CssClass="styleLabelSegCol" 
                    Style="text-align:right" Text="Depto:" Width="40px"></asp:Label>
            </td>
            <td colspan="1">
                <asp:TextBox ID="txtDpto" runat="server" Width="40px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                    ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Label ID="Label29" runat="server" CssClass="styleLabelSegCol" 
                    Style="text-align:right" Text="Zona:" Width="30px"></asp:Label>
            </td>
            </caption>
            <td >
                <asp:DropDownList ID="ddlZona" runat="server" DataSourceID="sdsZona" 
                    DataTextField="DESCRIPCION" DataValueField="IDZONA" 
                    style="margin-right: 0px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                    ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="sdsZona" runat="server" 
                    ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                    ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [ZONA]">
                </asp:SqlDataSource>
            </td>
            </tr>
        <tr>
            <td  colspan="1">
                <asp:Label ID="Label11" runat="server" Text="Teléfono Fijo:" Width="109px" Style="text-align:right"></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="txtTelFijo" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            <td  colspan="4">
            </td>
            <td class="style11"  >
            </td>
            <td >
            </td>
            <td  colspan="2">
            </td>
            <td >
            </td>
            <td >
            </td>
        </tr>

        <tr>
            <td  colspan="1">
                <asp:Label ID="Label13" runat="server" Text="e-mail:" Width="109px" Style="text-align:right"></asp:Label>
            </td>
            <td  colspan="7">
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            <td colspan="2">
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="1">
                <asp:Label ID="Label30" runat="server" Text="Sexo:" Width="109px" Style="text-align:right"></asp:Label>
                </td>
            <td >
                <asp:RadioButtonList ID="radioSexo" runat="server" AutoPostBack="True">
                    <asp:ListItem>Femenino</asp:ListItem>
                    <asp:ListItem>Masculino</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            <td colspan="1" >
                <asp:Label ID="Label35" runat="server" Text="Estado Socio:" Width="109px" Style="text-align:right"></asp:Label>
            </td>
            <td colspan="3">
                <asp:DropDownList ID="ddlEstadoSocio" runat="server" 
                    DataSourceID="sdsEstadoSocio" DataTextField="DESCRIPCION" 
                    DataValueField="IDESTADOSOCIO" Enabled="False">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            <td colspan="1" class="style11">
                <asp:SqlDataSource ID="sdsEstadoSocio" runat="server"
                    ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                    ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT * FROM [ESTADOSOCIO]"></asp:SqlDataSource>
            </td>
            <td >
                </td>
            <td  >
                </td>
        </tr>
        <tr>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
            <td  colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </asp:Panel>
        </td>
        <td >
            &nbsp;</td>
        <td >
            </td>
        <td >
            </td>
    </tr>
    <tr>
        <td colspan="6">
    <asp:Panel ID="panelPJuridica" runat="server" Visible="false">
                <table id="tablaPJuridica" style="width:100%;">
                <tr>
    <td class="styleTitulo" colspan="14" >
                Datos del Socio
            </td>
            </tr>
        <tr>
            <td >
                
                <asp:Label ID="Label36" runat="server" Text="Número Socio:" Width="109px" Style="text-align:right" CssClass="styleMargen"></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="txtNroSocioEmpresa" runat="server" Enabled="False" CssClass="styleMargenprimerafila"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            <td >
            </td>
            <td colspan="3" >
                </td>
            <td >
                </td>
            <td >
                </td>
            <td >
                </td>
            <td >
                </td>
            <td >
                </td>
            <td >
                </td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label14" runat="server" Text="Razón Social:" Width="109px" Style="text-align:right" ></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="txtRazonSocial" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            <td >
                <asp:Label ID="Label15" runat="server" Text="Nro CUIT:" Width="109px" Style="text-align:right"></asp:Label>
            </td>
            <td colspan="3" >
                <asp:TextBox ID="txtCUIT" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label16" runat="server" Text="Tipo Organización:" Width="109px" Style="text-align:right"></asp:Label>
            </td>
            <td >
                <asp:DropDownList ID="ddlTipoOrganizacion" runat="server" 
                    DataSourceID="sdsTipoOrganizacion" DataTextField="DESCRIPCION" 
                    DataValueField="IDTIPOORGANIZACION">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="sdsTipoOrganizacion" runat="server" 
                    ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                    ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT * FROM [TIPOORGANIZACION]"></asp:SqlDataSource>
            </td>
            <td >
                </td>
            <td colspan="3" >
                </td>
            <td >
                </td>
            <td >
                </td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td  title="Te">
                <asp:Label ID="Label17" runat="server" Text="Inicio Actividad:" Width="109px" Style="text-align:right"></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="txtFechaInicio" runat="server" Enabled="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            <td >
                &nbsp;</td>
            <td colspan="3" >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label18" runat="server" Text="Calle:" Width="109px" Style="text-align:right"></asp:Label>
            </td>
            <td >
                <asp:DropDownList ID="ddlCalleEmpresa" runat="server" DataSourceID="sdsCalle" 
                    DataTextField="NOMBRE" DataValueField="IDCALLE">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            <td >
                <asp:Label ID="Label19" runat="server" Text="Número:" Width="109px" Style="text-align:right"></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="txtNroCalleEmpresa" runat="server" Width="40px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            <td >
                <asp:Label ID="Label20" runat="server" Text="Piso:" Style="text-align:right"></asp:Label>
            </td>
            <td colspan="1">
                <asp:TextBox ID="txtPisoEmpresa" runat="server" Width="39px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            <td >
                <asp:Label ID="Label21" runat="server" Text="Depto:" Style="text-align:right"></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="txtDptoEmpresa" runat="server" Width="40px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Label ID="Label32" runat="server" Text="Zona:" Style="text-align:right" CssClass="styleLabelSegCol"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlZonaEmpresa" runat="server" DataSourceID="sdsZona" 
                    DataTextField="DESCRIPCION" DataValueField="IDZONA">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label22" runat="server" Text="Teléfono:" Width="109px" Style="text-align:right"></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="txtTelEmpresa" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            <td >
                </td>
            <td colspan="3" >
                </td>
            <td >
                </td>
            <td >
                </td>
            <td >
                </td>
            <td >
                </td>
            <td >
            </td>
            <td >
            </td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label23" runat="server" Text="e-mail:" Width="109px" Style="text-align:right"></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="txtEmailEmpresa" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
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
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label24" runat="server" Text="Página Web:" Width="109px" Style="text-align:right"></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="txtWebEmpresa" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
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
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label25" runat="server" Text="Apellido(Resp):" Width="109px" Style="text-align:right"></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="txtApellidoResponsable" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            <td >
                </td>
            <td colspan="3" >
                </td>
            <td >
                </td>
            <td >
                </td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label26" runat="server" Text="Nombre(Resp):" Width="109px" Style="text-align:right"></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="txtNombreResponsable" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
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
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label28" runat="server" Text="Cargo(Resp):" Width="109px" Style="text-align:right"></asp:Label>
            </td>
            <td >
                <asp:SqlDataSource ID="sdsCargo" runat="server" 
                    ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                    ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT * FROM [CARGOSOCIOEMPRESA]"></asp:SqlDataSource>
                <asp:DropDownList ID="ddlCargoResponsable" runat="server" 
                    DataSourceID="sdsCargo" DataTextField="DESCRIPCION" DataValueField="IDCARGO">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
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
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td >
            </td>
            <td >
                </td>
            <td >
                </td>
            <td colspan="3" >
                </td>
            <td >
                </td>
            <td >
                </td>
            <td >
                </td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
            </td>
        </tr>
    </table>
                
                </asp:Panel>
    
        </td>
        <td >
            &nbsp;</td>
        <td >
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="6">
            <asp:Button ID="btnGuardar" runat="server" onclick="btnGuardar_Click" 
                Text="Guardar" Style="margin-left:180px"/>
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" 
                onclick="btnCancelar_Click" />
        </td>
        <td >
            &nbsp;</td>
        <td >
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

