<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true" CodeFile="RegistrarTipoResutladoInstalacionMedidor.aspx.cs" Inherits="Medidor_RegistrarTipoResutladoInstalacionMedidor" Title="Registrar Tipo Resultado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .tablaBotones
        {
        	margin-left: 40px;
            margin-top: 25px;
        }
        </style>
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table>
      
        <tr>
            <td style="text-align:right">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            </td>
            <td >
                </td>
            <td>
                </td>
        </tr>
        <tr>
            <td style="text-align:right">
                <asp:Label ID="lblDescripcion" runat="server" Text="Descripción"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDescripcion" runat="server"></asp:TextBox>
            </td>
           
        </tr>
        <tr>
            <td style="text-align:right">
                <asp:Label ID="lblEstadoInstMedidor" runat="server" 
                    Text="Estado Instalación Medidor"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlEstadoInstMedidor" runat="server" 
                    DataSourceID="sdsEstadoInstMedidor" DataTextField="DESCRIPCION" 
                    DataValueField="IDESTADOORDENINSTALACION">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsEstadoInstMedidor" runat="server" 
                    ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                    ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT * FROM [ESTADOORDENINSTALACION]" 
                    onselecting="sdsEstadoInstMedidor_Selecting"></asp:SqlDataSource>
            </td>
           
        </tr>
         </table>
         <table class="tablaBotones">
        <tr>
            <td>
                <asp:Button ID="btnGuardar" runat="server" onclick="btnGuardar_Click" 
                    Text="Guardar" />
            </td>
            <td>
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" 
                    onclick="btnCancelar_Click" />
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
            </td>
        </tr>
        </table>
   
</asp:Content>

