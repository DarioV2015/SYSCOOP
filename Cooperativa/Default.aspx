<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .borde
        {
            border-right-color:rgb(206, 194, 194);
           border-right-style:solid;
           border-right-width:1px;
        }
        .texto1
        {
        	font-family: Calibri, "Source Sans Pro", Helvetica, Arial;
        	font-size:26px;
        	font-weight:bold;
        	text-shadow: 1px 2px 2px #A3A1A1;

        }
        .texto2
        {
        	font-family: Calibri, "Source Sans Pro", Helvetica, Arial;
        	font-size:17px;
        	 font-style:italic;

        }
        .tabla
        {
        	margin-top:25px;
        	margin-left:25px;
        }
          .FieldDatos
        {
        	height: 138px;
            border-radius: 6px;
            border-color: rgb(224,224, 224);
            border-style: solid;
            border-width: 1px;
            background-image: -moz-radial-gradient(center 45deg,circle cover, #cde6f9, #6191bf);
background-image: -webkit-gradient(radial, 50% 50%, 0, 50% 50%,900, from(#FDFDFD), to(rgb(210, 208, 208)));
        }
        
         .legendDatos
        {
        	font-family:Calibri;
        	font-size:17px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
<fieldset class="FieldDatos" style="width:400px; margin-left:250px; margin-top:50px">
        <table   class="tabla">
            <tr>
                <td rowspan="3" width="100px"  class="borde">
                    <asp:Image ID="Image4" runat="server" 
                        ImageUrl="~/Imagenes/1400964860_user-card_blue.png" Width="96px" Height="90px" />
                </td>
                <td height="50px" style="text-align:center">
                    <asp:Label ID="lblUsuario" runat="server"  Style="margin-left:50px" CssClass="texto1"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align:center">
                    <asp:Label ID="lblRol" runat="server"  Style="margin-left:59px" CssClass="texto2"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        </fieldset>

    
</asp:Content>

