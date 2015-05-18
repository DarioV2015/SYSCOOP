<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="ConsultarMapa.aspx.cs" Inherits="Medidor_ConsultarMapa" Title="Consultar Mapa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
         .margenBoton
         {
            margin-bottom: 0px;
         }
        .EstiloTH
        {
        	font-family:Calibri;
        	font-size:14px;
        	font-weight:bold;
          
          
        }
    </style>

    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?v=3.8&amp;key=AIzaSyALhJSXocMN5jstXyeuT1X8mTiRJkVVXYg&amp;libraries=drawing,geometry&amp;language=es&amp;region=AR&amp;sensor=false"></script>

    <script type="text/javascript" src="../Js/utilGMaps.js"></script>

    <script type="text/javascript" src="../Js/marcadores.js"></script>

    <script type="text/javascript" src="../Js/general.js"></script>

    <script type="text/javascript" src="../Js/JQuery.js"></script>

    <script type="text/javascript" src="../Js/linea.js"></script>
    
    <script type="text/javascript" >
    
    function dibujarMapa(comp)
    {
    var nombre = comp.id;
    
    switch(nombre)
    {
        case "chkPostes":
        if(comp.checked)
        {
            buscarPostes();
        }
        else
        {
            eliminarPostes();
        }
        
        break;
    }
    }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="margin-top:0px">
        <tr>
            <td>
                <table  width="350px" style="margin-top:0px; height:70px">
                    <tr>
                        <th class="EstiloTH"> Medidores
                        </th>
                        <th class="EstiloTH">
                        Postes
                        </th>
                        <th class="EstiloTH">
                        Subestaciones
                        </th>
                        <th class="EstiloTH">
                        Lineas
                        </th>
                    </tr>
                    <tr>
                    <asp:UpdatePanel runat="server" ID="upbtns"><ContentTemplate>
                        <td style="text-align:center">
                            <asp:Image ID="ImageButton1" runat="server" 
                                ImageUrl="~/Imagenes/MedidorV.png"/>
                            <asp:CheckBox ID="chkMedidores" runat="server" AutoPostBack="True" />
                        </td>
                        <td style="text-align:center">
                        <asp:Image ID="ImageButton2" runat="server" ImageUrl="~/Imagenes/poste.png" />
                            <asp:CheckBox ID="chkPostes" runat="server" AutoPostBack="True" />
                        </td>
                        <td style="text-align:center">
                        <asp:Image ID="ImageButton3" runat="server" 
                                ImageUrl="~/Imagenes/Subestacion.png" />
                            <asp:CheckBox ID="chkSubestaciones" runat="server" AutoPostBack="True"/>
                        </td>
                        <td style="text-align:center; height:30px">
                        <asp:Image ID="ImageButton4" runat="server" Height="28px" />
                            <asp:CheckBox ID="chkLineas" runat="server" AutoPostBack="True"/>
                        </td>
                        </ContentTemplate></asp:UpdatePanel>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td  >
                <div id="divMap" style="width: 800px; height: 390px;" />
            </td>
            <td>
                <asp:UpdatePanel ID="upda" runat="server">
                    <ContentTemplate>
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    </td>
                                <td>
                           
                                </td>
                                <td>
                                  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                 </td>
                                <td>
                                  
                                </td>
                                <td>
                                 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                  </td>
                                <td>
                                  
                                </td>
                                <td>
                                    </td>
                            </tr>
                            <tr>
                                <td>
                                   </td>
                                <td>
                              
                                </td>
                                <td>
                                  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                  </td>
                                <td>
                                   
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" 
                                        OnTextChanged="TextBox1_TextChanged" Visible="False"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   </td>
                                <td>
                                 
                                </td>
                                <td>
                                    <asp:Button ID="btnBuscarLineas" runat="Server" Text="Buscar Lineas" Style="margin-bottom: 0px"
                                        UseSubmitBehavior="False" OnClick="btnBuscarPoste_Click" Visible="False" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div>
                </div>
            </td>
        </tr>
     
    </table>
</asp:Content>
