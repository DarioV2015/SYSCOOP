<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="ReportesReclamos.aspx.cs" Inherits="Reportes_ReportesReclamos" Title="Página sin título" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .datos
        {
            text-align: right;
            width: 140px;
        }
        .boton
        {
            background: rgb(103, 161, 211);
            border: 1px solid rgb(114, 157, 190);
            border-radius: 3px;
            -webkit-box-shadow: inset 0 0 1px 1px #f6f6f6;
            box-shadow: inset 0 0 1px 1px #f6f6f6;
            color: White;
            font: "helvetica neue" , helvetica, arial, sans-serif;
            padding: 8px 0 9px;
            text-align: center; /*text-shadow: 0 1px 0 #fff;*/
            width: 130px;
            margin-left: 20px;
            font-size: 12px;
            font-weight: bold;
        }
        input[type="button"]:hover
        {
            background: rgb(84, 143, 196);
            -webkit-box-shadow: inset 0 0 1px 1px #eaeaea;
            box-shadow: inset 0 0 1px 1px #eaeaea;
            color: White;
            cursor: pointer;
            border: 1px solid rgb(114, 157, 190);
            border-radius: 3px;
        }
        .Label
        {
            font-family: Calibri;
            color: Black;
            font-size: 16px;
        }
        .style9
        {
            height: 25px;
        }
        .style10
        {
            width: 100%;
        }
        .style11
    {
        height: 19px;
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="PanelReclamos1" runat="server">
        <ContentTemplate>
            <table class="style9">
                <tr>
                    <td class="style10" colspan="4">
                        <asp:RadioButton ID="rdReporteReclamos" runat="server" GroupName="1" Text="Reporte Reclamos"
                            AutoPostBack="True" OnCheckedChanged="rdReporteReclamos_CheckedChanged" CssClass="Label"
                            Style="vertical-align: middle" />
                    </td>
                </tr>
                <tr>
                    <td class="style9" colspan="4">
                        <asp:RadioButton ID="rbReportePreventivo" runat="server" GroupName="1" Text="Reporte Mantenimiento Preventivo"
                            AutoPostBack="True" OnCheckedChanged="rbReportePreventivo_CheckedChanged" CssClass="Label" />
                    </td>
                </tr>
                <tr>
                    <td class="style10" colspan="4">
                        <asp:RadioButton ID="rdReporteConsumo" runat="server" AutoPostBack="True" GroupName="1"
                            Text="Reporte Consumo Mensual" OnCheckedChanged="rdReporteConsumo_CheckedChanged"
                            CssClass="Label" />
                    </td>
                </tr>
                <tr>
                    <td class="style10" colspan="4">
                        <asp:RadioButton ID="rdReporteRYP" runat="server" AutoPostBack="True" 
                            CssClass="Label" GroupName="1"                              
                            Text="Reporte Reclamos y Mantenimientos" 
                            oncheckedchanged="rdReporteRYP_CheckedChanged" />
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
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Panel ID="PanelReclamos" runat="server" Visible="False">
                            <table class="style9" style="margin-top: 10px">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text="Zona" Font-Italic="True" CssClass="Label"
                                            Style="margin-left: 4px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text="Socio" Font-Italic="True" CssClass="Label"
                                            Style="margin-left: 4px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Text="Tipo Reclamo" Font-Italic="True" CssClass="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DropDownList ID="ddlZona" runat="server" DataValueField="idzona" DataTextField="descripcion"
                                            Height="25px" AutoPostBack="True" 
                                            onselectedindexchanged="ddlZona_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNroSocio" runat="server" Height="19px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlTipoReclamo" runat="server" Height="25px" DataValueField="idTipoReclamo" DataTextField="descripcion"
                                            AutoPostBack="True" 
                                            onselectedindexchanged="ddlTipoReclamo_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td rowspan="4">
                        <asp:Button ID="btnVerReporte" runat="server" OnClick="btnVerReporte_Click" Text="Ver Reporte"
                            CssClass="boton" Style="margin-top: 18px" Visible="False" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Panel ID="PanelPreventivo" runat="server" Visible="False">
                            <table class="style9">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label7" runat="server" Text="Zona" Font-Italic="True" CssClass="Label"
                                            Style="margin-left: 4px"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DropDownList ID="ddlZonaPreventivo" runat="server" DataValueField="idzona" DataTextField="descripcion"
                                            Height="25px" AutoPostBack="True" 
                                            onselectedindexchanged="ddlZonaPreventivo_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Panel ID="PanelConsumo" runat="server" Visible="False">
                            <table class="style9">
                                <tr>
                                    <td class="style11">
                                        <asp:Label ID="Label10" runat="server" Text="Socio" Font-Italic="True" CssClass="Label"
                                            Style="margin-left: 4px"></asp:Label>
                                    </td>
                                    <td class="style11">
                                        <asp:Label ID="Label8" runat="server" Text="Mes" Font-Italic="True" CssClass="Label"
                                            Style="margin-left: 4px"></asp:Label>
                                    </td>
                                    <td class="style11">
                                        <asp:Label ID="Label9" runat="server" Text="Año" Font-Italic="True" CssClass="Label"
                                            Style="margin-left: 4px"></asp:Label>
                                    </td>
                                    <td class="style11">
                                        <asp:Label ID="Label14" runat="server" CssClass="Label" Font-Italic="True" 
                                            Style="margin-left: 4px" Text="Zona"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtNroSocioConsumo" runat="server" Height="19px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlMes" runat="server" Height="25px" 
                                            onselectedindexchanged="ddlMes_SelectedIndexChanged">
                                            <asp:ListItem Value="0">Seleccinar...</asp:ListItem>
                                            <asp:ListItem Value="1">Enero</asp:ListItem>
                                            <asp:ListItem Value="2">Febrero</asp:ListItem>
                                            <asp:ListItem Value="3">Marzo</asp:ListItem>
                                            <asp:ListItem Value="4">Abril</asp:ListItem>
                                            <asp:ListItem Value="5">Mayo</asp:ListItem>
                                            <asp:ListItem Value="6">Junio</asp:ListItem>
                                            <asp:ListItem Value="7">Julio</asp:ListItem>
                                            <asp:ListItem Value="8">Agosto</asp:ListItem>
                                            <asp:ListItem Value="9">Septiembre</asp:ListItem>
                                            <asp:ListItem Value="10">Octubre</asp:ListItem>
                                            <asp:ListItem Value="11">Noviembre</asp:ListItem>
                                            <asp:ListItem Value="12">Diciembre</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlAño" runat="server" Height="25px" 
                                            onselectedindexchanged="ddlAño_SelectedIndexChanged">
                                            <asp:ListItem Value="0">Seleccionar...</asp:ListItem>
                                            <asp:ListItem>2000</asp:ListItem>
                                            <asp:ListItem>2001</asp:ListItem>
                                            <asp:ListItem>2002</asp:ListItem>
                                            <asp:ListItem>2003</asp:ListItem>
                                            <asp:ListItem>2004</asp:ListItem>
                                            <asp:ListItem>2005</asp:ListItem>
                                            <asp:ListItem>2006</asp:ListItem>
                                            <asp:ListItem>2007</asp:ListItem>
                                            <asp:ListItem>2008</asp:ListItem>
                                            <asp:ListItem>2009</asp:ListItem>
                                            <asp:ListItem>2010</asp:ListItem>
                                            <asp:ListItem>2011</asp:ListItem>
                                            <asp:ListItem>2012</asp:ListItem>
                                            <asp:ListItem>2013</asp:ListItem>
                                            <asp:ListItem>2014</asp:ListItem>
                                            <asp:ListItem>2015</asp:ListItem>
                                            <asp:ListItem>2016</asp:ListItem>
                                            <asp:ListItem>2017</asp:ListItem>
                                            <asp:ListItem>2018</asp:ListItem>
                                            <asp:ListItem>2019</asp:ListItem>
                                            <asp:ListItem>2020</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlZonaConsumo" runat="server" AutoPostBack="True" 
                                            DataTextField="descripcion" DataValueField="idzona" Height="25px" 
                                            onselectedindexchanged="ddlZona_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                <td colspan="3">
                        <asp:Panel ID="PanelRYM" runat="server" Visible="False">
                        
                            <table class="style10">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label11" runat="server" CssClass="Label" Font-Italic="True" 
                                            Style="margin-left: 4px" Text="Zona"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label12" runat="server" CssClass="Label" Font-Italic="True" 
                                            Style="margin-left: 4px" Text="Mes"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label13" runat="server" CssClass="Label" Font-Italic="True" 
                                            Style="margin-left: 4px" Text="Año"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DropDownList ID="ddlZona1" runat="server" AutoPostBack="True" 
                                            DataTextField="descripcion" DataValueField="idzona" Height="25px" 
                                            onselectedindexchanged="ddlZona_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlMes1" runat="server" Height="25px" 
                                            onselectedindexchanged="ddlMes_SelectedIndexChanged">
                                            <asp:ListItem Value="0">Seleccinar...</asp:ListItem>
                                            <asp:ListItem Value="1">Enero</asp:ListItem>
                                            <asp:ListItem Value="2">Febrero</asp:ListItem>
                                            <asp:ListItem Value="3">Marzo</asp:ListItem>
                                            <asp:ListItem Value="4">Abril</asp:ListItem>
                                            <asp:ListItem Value="5">Mayo</asp:ListItem>
                                            <asp:ListItem Value="6">Junio</asp:ListItem>
                                            <asp:ListItem Value="7">Julio</asp:ListItem>
                                            <asp:ListItem Value="8">Agosto</asp:ListItem>
                                            <asp:ListItem Value="9">Septiembre</asp:ListItem>
                                            <asp:ListItem Value="10">Octubre</asp:ListItem>
                                            <asp:ListItem Value="11">Noviembre</asp:ListItem>
                                            <asp:ListItem Value="12">Diciembre</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlAño1" runat="server" Height="25px" 
                                            onselectedindexchanged="ddlAño_SelectedIndexChanged">
                                            <asp:ListItem Value="0">Seleccionar...</asp:ListItem>
                                            <asp:ListItem>2000</asp:ListItem>
                                            <asp:ListItem>2001</asp:ListItem>
                                            <asp:ListItem>2002</asp:ListItem>
                                            <asp:ListItem>2003</asp:ListItem>
                                            <asp:ListItem>2004</asp:ListItem>
                                            <asp:ListItem>2005</asp:ListItem>
                                            <asp:ListItem>2006</asp:ListItem>
                                            <asp:ListItem>2007</asp:ListItem>
                                            <asp:ListItem>2008</asp:ListItem>
                                            <asp:ListItem>2009</asp:ListItem>
                                            <asp:ListItem>2010</asp:ListItem>
                                            <asp:ListItem>2011</asp:ListItem>
                                            <asp:ListItem>2012</asp:ListItem>
                                            <asp:ListItem>2013</asp:ListItem>
                                            <asp:ListItem>2014</asp:ListItem>
                                            <asp:ListItem>2015</asp:ListItem>
                                            <asp:ListItem>2016</asp:ListItem>
                                            <asp:ListItem>2017</asp:ListItem>
                                            <asp:ListItem>2018</asp:ListItem>
                                            <asp:ListItem>2019</asp:ListItem>
                                            <asp:ListItem>2020</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        
                        </asp:Panel>
                
                </tr>
            </table>

    <table>
        <tr>
            <td>
                <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"
                    Visible="False" DisplayGroupTree="False" DisplayToolbar="False" />
            </td>
            <td colspan="2" class="style14">
            </td>
        </tr>
        <tr>
            <td colspan="4">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
            </ContentTemplate>
    </asp:UpdatePanel>
    <div>
        &nbsp;</div>
</asp:Content>
