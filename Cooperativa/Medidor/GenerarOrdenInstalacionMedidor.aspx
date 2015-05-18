<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="GenerarOrdenInstalacionMedidor.aspx.cs" Inherits="Medidor_GenerarOrdenInstalacionMedidor"
    Title="Orden de Instalación Medidor"  UICulture="auto" Culture="auto" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" src="../Js/JQuery.js"></script>

    <script type="text/javascript">
    
     function RadioCheckOnly(rbControl) {
     
      var gvName = rbControl.defaultValue.split('_')[0];
      var gvControl;
      
      switch (gvName)
      {
        case "gvPedidosInstalacion":
        gvControl =  "<%=gvPedidosInstalacion.ClientID%>";       
        break;               
        
        case "gvTurno":
        gvControl =  "<%=gvTurno.ClientID%>";       
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

    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
     <link href="../Style/TabStyle2.css" rel="stylesheet" type="text/css" />
     
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
        .DatosPedido
        {
        	text-align: center;
            border-bottom-color: rgb(241, 231, 231);
            border-bottom-style: solid;
            border-bottom-width: 1px;
        }
        .style9
        {
            text-align: right;
            height: 8px;
        }
        .style10
        {
            height: 8px;
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
   
  
<asp:TabContainer   ID="tabconteiner1" runat="server" ActiveTabIndex="0" CssClass="TabStyle2" style="margin-left:27px; margin-top:15px">
<asp:TabPanel ID= "tabPanel3" runat="server" HeaderText="Pedidos de Instalación Pendientes" Font-Names="Calibri" Font-Size="17px" Height="140px">
<ContentTemplate>
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panelPedidosInstalacion" runat="server">
                
                <table style="margin-top:0px; margin-left:186px">
                    <tr>
                        <td>
                            <asp:GridView ID="gvPedidosInstalacion" runat="server" AutoGenerateColumns="False"
                                DataKeyNames="IDPEDIDO" DataSourceID="SDSPedidosInst" HeaderStyle-CssClass="estiloHeaderTabla"
                                CellPadding="4" ForeColor="#333333" GridLines="None" Style=" margin-top:20px" Width="270px">
                                <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                <HeaderStyle CssClass="estiloHeaderTabla" />
                                <Columns>
                                    <asp:TemplateField HeaderStyle-Width="20px">
                                        <ItemTemplate>
                                            <asp:RadioButton ID="gvPedidosInstalacion_rdbSeleccionado" runat="server" AutoPostBack="True"
                                                OnCheckedChanged="rdbPedido_CheckedChanged" onclick="RadioCheckOnly(this); "
                                                Width="20px" />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="IDPEDIDO" HeaderText="Nro. Pedido" ReadOnly="True" SortExpression="IDPEDIDO"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IDSOCIO" HeaderText="Nro. Socio" SortExpression="IDSOCIO" Visible="false"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FECHAPEDIDO" HeaderText="Fecha Pedido" SortExpression="FECHAPEDIDO"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IDMEDIDOR" HeaderText="Nro. Medidor" SortExpression="IDMEDIDOR"
                                        Visible="false" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DESCRIPCION" HeaderText="Estado" SortExpression="DESCRIPCION"
                                        Visible="false" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle CssClass="estiloHeaderTabla" />
                            </asp:GridView>
                        </td>
                        <td>
                            <asp:SqlDataSource ID="SDSPedidosInst" runat="server" ConnectionString="<%$ ConnectionStrings:SISEConnectionString %>"
                                SelectCommand="SELECT P.IDPEDIDO, P.IDSOCIO, convert(char(10), P.FECHAPEDIDO, 103)AS FECHAPEDIDO, P.IDMEDIDOR, P.IDDOMICILIO, EP.DESCRIPCION FROM PEDIDOINSTALACION P, ESTADOPEDIDO EP WHERE (P.IDESTADO = EP.IDDESTADOPEDIDO AND P.IDESTADO = 2)
ORDER BY 3 DESC"></asp:SqlDataSource>
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
        </ContentTemplate>
    </asp:UpdatePanel>
</ContentTemplate>
</asp:TabPanel>
<asp:TabPanel ID= "tabPanel1" runat="server" HeaderText="Datos del Pedido de Instalación" Font-Names="Calibri" Font-Size="17px" Height="190px">
<ContentTemplate>

<asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
        
            <asp:Panel ID="panelDetalleInstalacion" runat="server" Visible="false">
                
                <table  style="margin-left:100px" >
                <tr>
                <td valign="top">
               
                <fieldset class="FieldDatos" style="width:175px">
                <legend class="legendDatos" style="font-family:Calibri; font-size:17px">Socio</legend>
                 <table style="margin-top:0px" width="120px">
                    <tr>
                        <td class="datos" style="height:20px">
                            <asp:Label ID="Label1" runat="server" Text="Nro:"  Style="text-align: right" Font-Bold="True"></asp:Label>
                        </td>

                        <td>
                            <asp:Label ID="txtNroSocio" runat="server" Enabled="false"></asp:Label>
                        </td>
                     </tr>
                     <tr>   
                        <td class="datos" style="height:20px">
                            <asp:Label ID="Label2" runat="server" Text="Apellido:"  Style="text-align: right" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="txtApellidoSocio" runat="server" Enabled="false"></asp:Label>
                        </td>
                      </tr>
                      <tr>  
                        <td class="datos">
                            <asp:Label ID="Label3" runat="server" Text=" Nombre:" Style="text-align: right" CssClass="styleLabelSegCol"
                               Font-Bold="True" ></asp:Label>
                        </td>
                        <td colspan="1">
                            <asp:Label ID="txtNombreSocio" runat="server" Enabled="false"></asp:Label>
                        </td>
                        </tr>
                        
                        
                        </table>
                        </fieldset>
                        </td>
                        
                        <td valign="top">
                        <fieldset class="FieldDatos" style="margin-left:20px; width:175px">
                        <legend class="legendDatos" >Domicilio</legend>
                        <table style="margin-top:0px;" width="177px">
                        
                        <tr>
                        <td class="datos" style="height:20px">
                            <asp:Label ID="Label4" Font-Bold="True" runat="server" Text=" Calle:" ></asp:Label>
                        </td>
                        
                        <td>
                            <asp:Label ID="txtCalleInst"   runat="server" Enabled="false"></asp:Label>
                        </td>
                        </tr>
                        <tr>
                        <td class="datos" style="height:20px">
                            <asp:Label ID="Label5" Font-Bold="True" runat="server" Text=" Nro.:"  ></asp:Label>
                        </td>
                        <td class="style16">
                            <asp:Label ID="txtNroCalleInst" runat="server" Enabled="false"></asp:Label>
                        </td>
                        </tr>
                        <tr>
                        <td class="datos" style="height:20px">
                            <asp:Label ID="Label6" Font-Bold="True" runat="server" Text="Piso:" ></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="txtPisoInst" runat="server" Enabled="false"></asp:Label>
                        </td>
                        </tr>
                        <tr>
                        <td class="datos" style="height:20px">
                            <asp:Label ID="Label8" Font-Bold="True" runat="server" Text="Dpto.:" ></asp:Label>
                        </td>
                        <td class="style26">
                            <asp:Label ID="txtDeptoInst" runat="server" Enabled="false"></asp:Label>
                        </td>
                        </tr>
                        <tr>
                        <td class="datos" style="height:20px">
                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Zona:" Style="text-align: right" CssClass="styleLabelSegCol"
                                Width="40px"></asp:Label>
                        </td>
                        <td class="style26">
                            <asp:Label ID="lblZona" runat="server" Enabled="false"></asp:Label>
                        </td>
                        </tr>
                    
                    </table>
                    </fieldset>
                    </td>
                    <td valign="top">
                    <fieldset class="FieldDatos" style="margin-left:20px; width:175px">
                    <legend class="legendDatos" >Medidor</legend>
                    <table style="margin-top:0px;" width="200px">
                    
                    <tr>
                        <td class="datos" style="height:20px">
                            <asp:Label ID="Label10" Font-Bold="True" runat="server"  Text="Nro:"></asp:Label>
                        </td>
                        <td class="style33">
                            <asp:Label ID="txtNroMedidor" runat="server" Enabled="false"></asp:Label>
                        </td>
                        </tr>
                        <tr>
                        <td class="datos" style="height:20px">
                            <asp:Label ID="Label22" Font-Bold="True" runat="server" Text="Nro. Fabricación:"  ></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblNroFabricacion" runat="server" Enabled="false"></asp:Label>
                        </td>
                        </tr>
                        <tr>
                        <td class="style9" style="height:20px">
                            <asp:Label ID="Label9" Font-Bold="True" runat="server"  Text="Tipo:"
                                ></asp:Label>
                        </td>
                        <td class="style10">
                            <asp:Label ID="txtTipoMedidor" runat="server" Enabled="false"></asp:Label>
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


</ContentTemplate>
</asp:TabPanel>

<asp:TabPanel ID= "tabPanel2" runat="server" HeaderText="Detalle de la Orden">
<ContentTemplate>
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panelOrdenInstalacion" runat="server" Visible="false">
                
                <table style="margin-top:0px">
                <tr>
                <td>
                  <table style="margin-top:0px">
                    <tr>
                        <td>
                            <asp:Label ID="Label11" runat="server" Text="Fecha de Realización:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDate" runat="server" Enabled="False" OnTextChanged="txtDate_TextChanged"
                                AutoPostBack="true"></asp:TextBox>
                            <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/1410380987_Calendar_24x24.png"
                                Style="vertical-align: middle; margin-bottom: 2px" />
                            <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtDate"
                                PopupButtonID="Image1" Format="dd/MM/yyyy" >
                            </asp:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                    <td>
                    <table>
                    <tr style="margin-top:0px">
                        <td colspan="2">
                            <asp:Label ID="Label12" runat="server" Text="Turno:"></asp:Label>
                        </td>
                       </tr>
                        </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:GridView ID="gvTurno" runat="server" AutoGenerateColumns="False" DataKeyNames="IDTURNO"
                                DataSourceID="SDSTurno" HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4"
                                ForeColor="#333333" GridLines="None" Style="margin-left: 26px; margin-top:7px">
                                <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:RadioButton ID="gvTurno_rdbSeleccionado" runat="server" AutoPostBack="True"
                                                OnCheckedChanged="rdbTurno_CheckedChanged" onclick="RadioCheckOnly(this); " Width="20px" />
                                        </ItemTemplate>
                                         <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="IDTURNO" HeaderText="Turno" ReadOnly="True" SortExpression="IDTURNO"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="HORAINICIO" HeaderText="Inicio" SortExpression="HORAINICIO"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="HORAFIN" HeaderText="Fin" SortExpression="HORAFIN" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </td>
                        <td>
                            <asp:SqlDataSource ID="SDSTurno" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                                ProviderName="System.Data.SqlClient" SelectCommand="SELECT [IDTURNO], [HORAINICIO], [HORAFIN] FROM [TURNO]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    </table>
                    </td>
                    <td>
                    <table style="margin-top:0px; margin-left:30px; margin-bottom:6px">
                    <tr>
                        <td>
                        <table style="margin-top:0px; height:30px">
                          <tr>
                           <td>
                            <asp:Label ID="lblGrupo" runat="server" Text="Nro. Grupo:" Visible="false"></asp:Label>
                           </td>
                           <td>
                            <asp:Label ID="lblNroGrupoGR" runat="server" Enabled="false" Visible="false"></asp:Label>
                           </td>
                        </tr>
                        </table>
                        </td>   
                        
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="grillaGrupoGR" runat="server" AutoGenerateColumns="False" HeaderStyle-CssClass="estiloHeaderTabla"
                                CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="grillaGrupoGR_RowDataBound"
                                Style="margin-top: 0px; margin-left: 10px">
                                <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="idempleado" ReadOnly="True" HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fechaalta" ReadOnly="True" HeaderStyle-Width="250 px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fechabaja" ReadOnly="True" HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="idcargo" ReadOnly="True" HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="idtipodocumento" ReadOnly="True" HeaderStyle-Width="60px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nrodocumento" ReadOnly="True" HeaderStyle-Width="60px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="idusuario" ReadOnly="True" HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="estado1" ReadOnly="True" HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="apellidoempleado" HeaderText="Apellido" ReadOnly="True"
                                        HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nombreempleado" HeaderText="Nombre" ReadOnly="True" HeaderStyle-Width="60px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    
                    
                    <tr>
                        <td>
                            <asp:Label ID="lblNoGrupoDisponible" runat="server" Text="No hay Grupos disponibles"
                                Visible="False"></asp:Label>
                        </td>
                    </tr>
                    </table>
                    </td>
                    </tr>
                    <tr>
                    
                </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

</ContentTemplate>
</asp:TabPanel>

</asp:TabContainer>

    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
    <ContentTemplate>
            <asp:Panel ID="panelBotones" runat="server" Visible="true">
            <table style="margin-left:250px; margin-top:30px">
                    <tr>
                        <td>
                            <asp:Button ID="btnGenerar" runat="server" Text="Generar Orden" OnClick="btnGenerar_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                        </td>
                    </tr>
                </table>
            
            </asp:Panel>
            </ContentTemplate>
            
    </asp:UpdatePanel>
    
               
  
    <span style="display: none">
        <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupConfirmacion" PopupControlID="popUpConfirmacionOrden"
        runat="server" TargetControlID="LinkButton1">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpConfirmacionOrden" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading">
            <asp:Label ID="Label13" runat="server" Text="¿Desea confirmar la Orden de Instalación del Medidor?"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarRegistrarOrden" runat="server" Text="Aceptar" OnClick="btnAceptarRegistrarOrden_Click"
                            CssClass="botonPopUp" />
                        <asp:Button ID="btnCancelarRegistrarOrden" runat="server" Text="Cancelar" OnClick="btnCancelarRegistrarOrden_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton2" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupCancelarRegistrar" PopupControlID="popUpCancelarRegistrar"
        runat="server" TargetControlID="LinkButton2">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpCancelarRegistrar" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image2" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="35px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label14" runat="server" Text="Se cancelará la generación de la Orden"
                Style="margin-right: 25px"></asp:Label>
            <br />
            <asp:Label ID="Label16" runat="server" Text="¿Desea Continuar?"></asp:Label>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarCancelacionOrden" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarCancelacionOrden_Click" Style="margin-top: 50px" />
                        <asp:Button ID="btnCancelarCancelacionOrden" runat="server" Text="Cancelar" CausesValidation="False"
                            OnClick="btnCancelarCancelacionOrden_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton3" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupExito" PopupControlID="popUpExito" runat="server"
        TargetControlID="LinkButton3">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpExito" runat="server" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image3" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="36px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label15" runat="server" Text="Se generó con éxito la Orden de Instalación"
                Style="margin-right: 26px"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarConfirmacionOrden" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarConfirmacionOrden_Click" CssClass="botonPopUp" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    
</asp:Content>
