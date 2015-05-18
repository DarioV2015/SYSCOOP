<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="RegistrarPlanificacionMantenimientoPreventivo.aspx.cs" Inherits="MPreventivo_RegistrarPlanificacionMantenimientoPreventivo"
    Title="Registrar Planificacion" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
    <link href="../Style/TabStyle2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .datos
        {
            text-align: right;
        }
        .estiloHeaderTabla
        {
            font-family: 'trebuchet MS' , 'Lucida sans' , Arial;
            font-size: 12px;
            background-color: #b9c9fe;
            font-weight: bold;
            background: #b9c9fe;
            border-top: 2px solid #aabcfe;
            border-bottom: 1px solid #fff;
            color: #039;
            padding: 8px;
            border-right-style: none;
            border-left-style: ridge;
            border-left-color: #98A9DF;
            border-left-width: 1px;
        }
        .estiloFilasTabla
        {
            font-family: 'trebuchet MS' , 'Lucida sans' , Arial;
            font-size: 12px;
            color: #000;
            text-align: center;
            border-left-style: none;
            border-left-width: 0px;
            border-bottom: 1px solid #fff;
            border-right-style: none;
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
        .hidden
     {
         display:none;
     }
    </style>

    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?v=3.8&amp;key=AIzaSyALhJSXocMN5jstXyeuT1X8mTiRJkVVXYg&amp;libraries=drawing,geometry&amp;language=es&amp;region=AR&amp;sensor=false"></script>

    <script type="text/javascript" src="../Js/utilGMaps.js"></script>

    <script type="text/javascript" src="../Js/marcadores.js"></script>

    <script type="text/javascript" src="../Js/general.js"></script>

    <script type="text/javascript" src="../Js/RegistrarPlanificacionMP.js"></script>

    <script type="text/javascript">
    
     function RadioCheckOnly(rbControl) {
     
      var gvName = rbControl.defaultValue.split('_')[0];
      var gvControl;
      
      switch (gvName)
      {
        case "gvTareas":
        gvControl =  "<%=gvTareas.ClientID%>";       
        break;   
        case "gvActividades":
        gvControl =  "<%=gvActividades.ClientID%>";       
        break;   
            
      }
            
      var gv = document.getElementById(gvControl);
      var rbs = gv.getElementsByTagName("input");
      var row = rbControl.parentNode.parentNode;
      row.style.backgroundColor = 'rgb(161, 183, 238)';
        for (var i = 0; i < rbs.length; i++) {
            if (rbs[i].type == "radio") {
                if (rbs[i].checked && rbs[i] != rbControl) {
                    rbs[i].checked = false;
                    rbs[i].parentNode.parentNode.parentNode.style.backgroundColor = '#E8EFF8';
                    break;
                }
            }
        }
    }  
    function dibujar()
    {
     var ddl =  document.getElementById('<%=ddlZonas.ClientID%>');
     var id = ddl.options[ddl.selectedIndex].value;  
     dibujarZona(id);
     }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="margin-top: 0px">
        <tr>
            <td valign="top">
                <table style="margin-top: 0px">
                    <tr>
                        <td style="height: 460px;" colspan="3" valign="top">
                            <div id="divMap" style="width: 540px; height: 460px;" />
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="Panel2" runat="server">
                            <asp:TabContainer ID="tabconteiner1" runat="server" ActiveTabIndex="0" CssClass="TabStyle2"
                                Width="446px">
                                <asp:TabPanel ID="tabPanel1" runat="server" HeaderText="Zona">
                                    <ContentTemplate>
                                        <table width="100px" style="margin-top: 10px; margin-left: 85px">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label7" runat="server" Text="Zona:"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlZonas" runat="server" AutoPostBack="True" DataValueField="idzona"
                                                        DataTextField="descripcion" onchange="dibujar()"
                                                        OnSelectedIndexChanged="ddlZonas_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                        <table style="margin-left: 20px">
                                            <tr>
                                                <td>
                                                    <table style="margin-top: 6px; margin-left: 15px">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label4" runat="server" Text="Calle Norte:" Style="margin-left: 10px;
                                                                    font-style: italic"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label1" runat="server" Text="Calle Sur:" Style="margin-left: 10px;
                                                                    font-style: italic"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="txtCalleNorte" runat="server" Enabled="False"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtCalleSur" runat="server" Enabled="False"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label2" runat="server" Text="Calle Este:" Style="margin-left: 10px;
                                                                    font-style: italic"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label3" runat="server" Text="Calle Oeste:" Style="margin-left: 10px;
                                                                    font-style: italic"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="txtCalleEste" runat="server" Enabled="False"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtCalleOeste" runat="server" Enabled="False"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                            </tr>
                                        </table>
                                        </td></tr></table></ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel ID="tabPanel2" runat="server" HeaderText="Tareas Generales" Width="75px">
                                    <ContentTemplate>
                                        <table style="margin-top:0px">
                                            <tr>
                                                <td>
                                                    <asp:GridView ID="gvTareas" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                        ForeColor="#333333" GridLines="None" Width="435px" Style="margin-top: 10px">
                                                        <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:RadioButton ID="gvTareas_rdbSeleccionar" runat="server" AutoPostBack="True"
                                                                        onclick="RadioCheckOnly(this);" OnCheckedChanged="gvTareas_rdbSeleccionado_CheckedChanged" /></ItemTemplate>
                                                                <ItemStyle CssClass="estiloFilasTabla" Width="20px"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="Nombre" HeaderText="Tarea">
                                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="168px"></HeaderStyle>
                                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="descripcion" HeaderText="Descripción">
                                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="140px"></HeaderStyle>
                                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="periodicidad" HeaderText="Periodicidad">
                                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="40px"></HeaderStyle>
                                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="idTarea" HeaderText="Código">
                                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="30px"></HeaderStyle>
                                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                            </asp:BoundField>
                                                        </Columns>
                                                        <HeaderStyle CssClass="estiloHeaderTabla" />
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel ID="tabPanel3" runat="server" HeaderText="Actividades e Insumos">
                                    <ContentTemplate>
                                        <table style="margin-top: 0px">
                                            <tr>
                                                <td style="border-bottom-style: inset" height="25px" width="100px">
                                                    <asp:Label ID="Label9" runat="server" Font-Italic="True" Font-Size="Medium" Text="Actividades"></asp:Label>
                                                </td>
                                                <td width="10px">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <asp:GridView ID="gvActividades" runat="server" AutoGenerateColumns="False"
                                                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                                                        Style="margin-top: 5px" Width="430px">
                                                        <RowStyle BackColor="#E8EFF8" ForeColor="#333333" Width="430px" />
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:RadioButton ID="gvActividades_rdbSeleccionado" runat="server" AutoPostBack="True"
                                                                        onclick="RadioCheckOnly(this);" OnCheckedChanged="gvActividades_rdbSeleccionado_CheckedChanged" /></ItemTemplate>
                                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="nombreact" HeaderText="Nombre">
                                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="160px"></HeaderStyle>
                                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="descripact" HeaderText="Descripción">
                                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="140px"></HeaderStyle>
                                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="DescComplejidad" HeaderText="Complejidad">
                                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="tiempoact" HeaderText="Duración">
                                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="50px"></HeaderStyle>
                                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblActSel" runat="server" Text='<%# Eval("idactividad") %>' CssClass=" hidden"></asp:Label></ItemTemplate>
                                                                <HeaderStyle CssClass="hidden" />
                                                                <ItemStyle CssClass=" hidden"></ItemStyle>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <HeaderStyle CssClass="estiloHeaderTabla" />
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                        </table>
                                        <table style="width: 440px">
                                            <tr>
                                                <td class="datos">
                                                    <asp:Label ID="Label11" runat="server" Text="Prioridad:"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlPrioridad" runat="server" DataTextField="descripcion" DataValueField="idprioridad"
                                                        Width="100px">
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="datos" width="90px">
                                                    <asp:Label ID="Label12" runat="server" Text="Fecha de Inicio:"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtFechaInicio" runat="server" AutoPostBack="True" Width="90px"></asp:TextBox>
                                                    <asp:Image
                                                        ID="Image2" runat="server" ImageUrl="../Imagenes/1410380987_Calendar_24x24.png"
                                                        ImageAlign="Middle" Style="vertical-align: middle; margin-left:5px" />
                                                        <asp:CalendarExtender ID="CalendarExtender1"
                                                            runat="server" TargetControlID="txtFechaInicio" PopupButtonID="Image2" 
                                                        Format="dd/MM/yyyy" Enabled="True">
                                                        </asp:CalendarExtender>
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="La Fecha coincide con otra Tarea Planificada"
                                                        ControlToValidate="txtFechaInicio" Display="Dynamic" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                        </table>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label13" runat="server" Text="Descripción:"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtDescripcion" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:Panel ID="PanelTitulo" runat="server" Visible="False">
                                        
                                        <table id="table1" style="margin-top:0px">
                                            <tr>
                                                <td style="border-bottom-style: inset" height="25px" width="400px">
                                                    <asp:Label ID="Label10" runat="server" Font-Italic="True" Font-Size="Medium" 
                                                        Text="Insumos"></asp:Label>
                                                </td>
                                            </tr>
                                            </table>
                                            </asp:Panel>
                                            <table style="margin-top:0px; margin-left:20px">
                                            <tr>
                                                <td valign="top">
                                                    <asp:GridView ID="gvInsumos" runat="server" AutoGenerateColumns="False"
                                                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                                                        style="margin-top:0px; margin-left:40px" Width="350px">
                                                        <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                                        <Columns>
                                                            <asp:BoundField DataField="nombre" HeaderText="Nombre">
                                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="cantidad" HeaderText="Cantidad" Visible="False">
                                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                            </asp:BoundField>
                                                        </Columns>
                                                        <HeaderStyle CssClass="estiloHeaderTabla" />
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                            </asp:TabContainer>
                            <table style="margin-top: 12px; margin-left: 60px">
                                <tr>
                                    <td>
                                        <asp:Button ID="btnRegistrar" runat="server" OnClick="btnRegistrar_Click" Text="Registrar" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton2" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupExito" PopupControlID="popUpExito" runat="server"
        TargetControlID="LinkButton2">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpExito" runat="server" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="36px" />
        </div>
        <div class="heading" style="width: 320px">
            <asp:Label ID="Label6" runat="server" Text="Se registró con éxito la Tarea" Style="margin-right: 20px"></asp:Label>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <asp:Label ID="lblMensaje" runat="server" Style="margin-right: 26px" Text=""></asp:Label>
                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa; width:320px">
            <div style="margin-right: 15px; text-align: center">
                <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" CausesValidation="False"
                     OnClick="btnAceptarConfirmacion_Click" CssClass="botonPopUp" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
