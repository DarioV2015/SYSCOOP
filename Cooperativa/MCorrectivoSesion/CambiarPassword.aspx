<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true" CodeFile="CambiarPassword.aspx.cs" Inherits="MCorrectivoSesion_CambiarPassword" Title="SISE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
 <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .datos
        {
        	text-align: right;
            
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel runat="server" ID="udpPass">
<ContentTemplate>
    <table width="480px" style="margin-left:10px">
        <tr>
            <td class=" datos">
                &nbsp;<asp:Label ID="Label1" runat="server" Text="Contraseña Anterior"></asp:Label>
            </td>
            <td>
                &nbsp;<asp:TextBox ID="txtAnterior" runat="server" TextMode="Password" Height="20px"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator1" runat="server" 
                    ControlToValidate="txtAnterior" ErrorMessage="La Contraseña no coincide." 
                    onservervalidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
           <td class="datos">
                &nbsp;<asp:Label ID="Label2" runat="server" Text="Contraseña Nueva"></asp:Label>
            </td>
            <td>
                &nbsp;<asp:TextBox ID="txtNueva" runat="server" TextMode="Password" Height="20px"></asp:TextBox>
            </td>
        </tr>
        <tr >
            <td  class="datos">
                &nbsp;<asp:Label ID="Label3" runat="server" Text="Repetir Contraseña"></asp:Label>
            </td>
            <td>
                &nbsp;<asp:TextBox ID="txtRepetir" runat="server" TextMode="Password" Height="20px"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtNueva" ControlToValidate="txtRepetir" 
                    ErrorMessage="No Coinciden las Contraseñas"></asp:CompareValidator>
            </td>
        </tr>
        </table>
        <table style="margin-left:15px">
         <tr>
            <td>
                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" 
                    onclick="btnAceptar_Click" />
            </td>
            <td>
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" 
                    onclick="btnCancelar_Click" />
            </td>
        </tr>
    </table>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

