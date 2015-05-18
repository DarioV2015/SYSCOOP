<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="CalcularConsumoEstimadoSocio.aspx.cs" Inherits="Medidor_CalcularConsumoEstimadoSocio"
    Title="Calcular Consumo Estimado del Socio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
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
            text-align: right;
            width: 140px;
        }
        .estiloHeaderTabla
        {
           font-family: 'trebuchet MS', 'Lucida sans', Arial;
            font-size: 12px;
            
            background-color: #b9c9fe;
            font-weight: bold;
            background: #b9c9fe;
            border-top: 2px solid #aabcfe;
            border-bottom: 1px solid #fff;
            color: #039;
            padding: 8px;
           border-right-style:none;
            border-left-style: ridge;
            border-left-color: #98A9DF;
            border-left-width: 1px;
        }
        .estiloFilasTabla
        {
            font-family: 'trebuchet MS', 'Lucida sans', Arial;
            font-size: 12px;
            color: #000;
            text-align: center;
            border-left-style: none;
            border-left-width: 0px;
            border-bottom: 1px solid #fff;
            border-right-style:none;
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
        	font-family:Calibri;
        	font-size:17px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panelDetalleArtefactos" runat="server">
            <table>
            <tr>
            <td valign="top">
            <fieldset class="FieldDatos" style="width:500px; height:170px">
            <legend class="legendDatos">Detalle de Artefactos</legend>
               
                <table>
                    <tr>
                        <td>
                            <asp:GridView ID="grillaArtectos" runat="server" AutoGenerateColumns="False" DataSourceID="sdsListadoArtefactos"
                                HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                                GridLines="None" Width="500px">
                                <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="descripcion" HeaderText="Tipo de Artefacto" ReadOnly="True"
                                        SortExpression="descripcion" HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="100px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="potencia" HeaderText="Potencia (Kw.)" ReadOnly="True"
                                        SortExpression="potencia" HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="80px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="hsusoestimado" HeaderText="Horas de Uso" ReadOnly="True"
                                        SortExpression="hsusoestimado" HeaderStyle-Width="90px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="consumopromedio" HeaderText="Consumo Promedio (Kwh)" ReadOnly="True"
                                        SortExpression="consumopromedio" HeaderStyle-Width="150px" 
                                        ItemStyle-CssClass="estiloHeaderTabla" DataFormatString="{0:F2}">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="150px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle CssClass="estiloHeaderTabla" />
                            </asp:GridView>
                        </td>
                       </tr>
                        </table>
                        </fieldset>
                        </td>
                        <td valign="top">
                        <fieldset class="FieldDatos" style="width:300px; height:170px">
                        <legend class="legendDatos">Cuadro Tarifario Energía Eléctrica</legend>
                            <table style="margin-left:30px; margin-top:0px">
                            
                                <tr>
                                    <td height="25px">
                                        <asp:Label ID="Label12" runat="server" Text="Rango" Font-Bold="True"></asp:Label>
                                    </td>
                                    <td height="25px">
                                        <asp:Label ID="Label13" runat="server" Text="Costo" Font-Bold="True"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label14" runat="server" Text="De 0 a 40 Kwh."></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblRango1" runat="server" Text="0,824100"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text="c/u"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label18" runat="server" Text="De 41 a 80 Kwh."></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblRango2" runat="server" Text="0,900900"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Text="c/u"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label20" runat="server" Text="De 81 a 120 Kwh."></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblRango3" runat="server" Text="1,065400"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label7" runat="server" Text="c/u"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label22" runat="server" Text="De 121 a 200 Kwh."></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblRango4" runat="server" Text="1,258700"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label8" runat="server" Text="c/u"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="160px">
                                        <asp:Label ID="Label24" runat="server" Text="De 200 Kwh. en adelante"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblRango5" runat="server" Text="1,402800"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label9" runat="server" Text="c/u"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                <td>
                            <asp:SqlDataSource ID="sdsListadoArtefactos" runat="server" ConnectionString="<%$ ConnectionStrings:SISEConnectionString %>"
                                SelectCommand="select t.descripcion, t.potencia, a.hsusoestimado, a.consumopromedio
from tipoArtefacto t, artefacto a, socio s
where a.idtipoartefacto = t.idtipoartefacto
and a.idsocio = s.idsocio
and s.idsocio = @a">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="" Name="a" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                                </tr>
                            </table>
                            </fieldset>
</td>
</tr>
</table>

            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panelConsumo" runat="server">
            <fieldset class="FieldDatos" style="width:502px; height:auto; margin-top:10px">
            <legend class="legendDatos">Consumo Estimado de Artefactos Declarados</legend>
                
                <table style="width:350px; margin-left:110px">
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Consumo por Día:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="txtConsumoPorDia" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblDiasDeLectura" runat="server" Text="Día de Lectura"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="txtDias" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblConsumoMensual" runat="server" Text="Consumo Mensual:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="txtConsumoMensual" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label16" runat="server" Text="Costo Total para el mes:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="txtCostoTotal" runat="server"></asp:Label>
                        </td>
                    </tr>
                     </table>
                </fieldset>
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="btnVolver" runat="server" Text="Aceptar" OnClick="btnVolver_Click" />
                        </td>
                    </tr>
                    </table>
               
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
</asp:Content>
