<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true" CodeFile="RegistrarSubestacion.aspx.cs" Inherits="Medidor_RegistrarSubestacion" Title="Registrar Subestacion" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?v=3.8&amp;key=AIzaSyALhJSXocMN5jstXyeuT1X8mTiRJkVVXYg&amp;libraries=drawing,geometry&amp;language=es&amp;region=AR&amp;sensor=false"></script>

    <script type="text/javascript" src="../Js/utilGMaps.js"></script>

    <script type="text/javascript" src="../Js/marcadores.js"></script>

    <script type="text/javascript" src="../Js/general.js"></script>
    
    <script type="text/javascript" src="../Js/linea.js"></script>

    <script type="text/javascript">
    function buscarDirCalleNro()
    {
        var txtcalle = document.getElementById('<%=txtCalle.ClientID%>');
        var txtnro = document.getElementById('<%=txtNro.ClientID%>');
        obtenerLocalizacionDeDireccion(txtcalle.value + txtnro.value,subestaciones);
    }
    </script>

    <style type="text/css">
        .style2
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  
    <table class="style2">
        <tr>
            <td style="width: 800px; height: 600px;">
                <div id="divMap" style="width: 800px; height: 600px;" />
            </td>
            <td>
                <div>
                    <asp:UpdatePanel ID="upMapa" runat="server">
                        <ContentTemplate>
                            <table style="width: 100%;">
                                <tr>
                                    <td class="style2">
                                        <asp:Label ID="Label1" runat="server" Text="Calle:"></asp:Label>
                                    </td>
                                    <td class="style2">
                                        <asp:TextBox ID="txtCalle" runat="server" OnTextChanged="txtCalle_TextChanged" AutoPostBack="True"></asp:TextBox>
                                    </td>
                                    <td class="style2">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="Nro:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNro" runat="server" AutoPostBack="True" 
                                            ontextchanged="txtNro_TextChanged"></asp:TextBox>
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
                                        <asp:Button ID="btnBuscarDir" runat="Server" Text="Buscar Direccion" UseSubmitBehavior="False" />
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                <td>
                                <asp:GridView ID="gvMarcadores" runat="server" AutoGenerateColumns="False" >
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Nro Poste" />
                                <asp:BoundField DataField="Latitud" HeaderText="Latitud" />
                                <asp:BoundField DataField="Longitud" HeaderText="Longitud" />
                                <asp:BoundField DataField="Calle" HeaderText="Calle" />
                                <asp:BoundField DataField="Nro" HeaderText="Nro" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CommandName="DeleteRow" CommandArgument='<%# Eval("Id") %>'
                                            Text="Eliminar" UseSubmitBehavior="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                                </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" UseSubmitBehavior="False" onclick="btnAceptar_Click"/>
                        </td>
                        <td>
                            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" 
                                onclick="btnCancelar_Click" />
                        </td>
                    </tr>
                </table>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
