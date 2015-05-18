<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="RegistrarTareaGeneral.aspx.cs" Inherits="MPreventivo_RegistrarTareaGeneral"
    Title="Página sin título" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .datos
        {
            text-align: right;
            width: 140px;
        }
        .margen
        {
            margin-left: 10px;
        }
        .margenTabla
        {
            margin-right: 450px;
        }
        .styleTitulo
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
        .estiloHeaderTabla
        {
            font-family: Sans-Serif;
            font-size: 13px;
            background-color: #b9c9fe;
            font-weight: bold;
            background: #b9c9fe;
            border-top: 4px solid #aabcfe;
            border-bottom: 1px solid #fff;
            color: #039;
            padding: 8px;
            border-left-style: none;
            border-right-style: none;
            border-left: none;
        }
        .estiloFilasTabla
        {
            text-align: center;
            font-family: Sans-Serif;
            font-size: 13px;
            border-left-style: none;
            border-left-width: 0px;
            border-bottom: 1px solid #fff;
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
       
        .style12
        {
            text-align: right;
        }
        .style13
        {
            text-align: right;
        }
        .font
        {
        	font-family:Sans-Serif;
        	font-size:14px
        	}
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table  width="800px">
        <tr>
            <td colspan="5" style="background: -webkit-linear-gradient(180deg, #FFFFFF, #E0ECF8);
                text-align: left; border-left-style: outset;">
                <asp:Label ID="Label8" runat="server" Text="Nro. Tarea:"></asp:Label>
                <asp:Label ID="lblNroTarea" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style14">
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
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style12" width="40px">
                <asp:Label ID="Label4" runat="server" Text="Nombre:"></asp:Label>
            </td>
            <td class="style10" colspan="4">
                <asp:TextBox ID="txtNombre" runat="server" Width="267px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtNombre" EnableViewState="False" 
                    ErrorMessage="Debe ingresar un NOMBRE para la TAREA" ValidationGroup="1" CssClass="font">*</asp:RequiredFieldValidator>
                &nbsp;
                &nbsp;
            &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style12">
                <asp:Label ID="Label5" runat="server" Text="Descripción:"></asp:Label>
            </td>
            <td class="style10" colspan="4">
                <asp:TextBox ID="txtDescripcion" runat="server" Width="265px" Rows="3" 
                     Wrap="False" TextMode="MultiLine" style="margin-left:10px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtDescripcion" 
                    ErrorMessage="Debe ingresar una DESCRIPCIÓN para la TAREA" ValidationGroup="1">*</asp:RequiredFieldValidator>
                &nbsp;
                &nbsp;
                &nbsp;
            </td>
        </tr>
        
        <tr style="height:180px">
            <td style="text-align: right">
                <asp:Label ID="Label6" runat="server" Text="Periodicidad:"></asp:Label>
            </td>
            <td colspan="4">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table  style="height:155px; margin-top:5px">
                            <tr>
                                <td class="style15">
                                    <asp:RadioButton ID="rdbAño" runat="server" AutoPostBack="True" GroupName="2" OnCheckedChanged="rdbAño_CheckedChanged"
                                        Text="Anual" />
                                        &nbsp;
                                </td>
                                 
                                <td class="style16" style="text-align: right; height:20px">
                                    <asp:Label ID="lblCantAños" runat="server" Text="Cant. Años:" Visible="False"></asp:Label>
                                </td>
                                <td class="style15">
                                    <asp:DropDownList ID="ddlCantAño" runat="server" AutoPostBack="True" Visible="False">
                                        <asp:ListItem Value="1">1 Año</asp:ListItem>
                                        <asp:ListItem Value="2">2 Años</asp:ListItem>
                                        <asp:ListItem Value="3">3 Años</asp:ListItem>
                                        <asp:ListItem Value="4">4 Años</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="rdbMensual" runat="server" AutoPostBack="True" GroupName="2"
                                        OnCheckedChanged="rdbMensual_CheckedChanged" Text="Mensual" />
                                          &nbsp;
                                </td>
                               
                                <td class="style13" style="text-align: right; height:20px">
                                    <asp:Label ID="lblCantMeses" runat="server" Text="Cant. Meses:" Visible="False"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlCantMeses" runat="server" AutoPostBack="True" Visible="False">
                                        <asp:ListItem Value="1">1 Mes</asp:ListItem>
                                        <asp:ListItem Value="2">2 Meses</asp:ListItem>
                                        <asp:ListItem Value="3">3 Meses</asp:ListItem>
                                        <asp:ListItem Value="4">4 Meses</asp:ListItem>
                                        <asp:ListItem Value="5">5 Meses</asp:ListItem>
                                        <asp:ListItem Value="6">6 Meses</asp:ListItem>
                                        <asp:ListItem Value="7">7 Meses</asp:ListItem>
                                        <asp:ListItem Value="8">8 Meses</asp:ListItem>
                                        <asp:ListItem Value="9">9 Meses</asp:ListItem>
                                        <asp:ListItem Value="10">10 Meses</asp:ListItem>
                                        <asp:ListItem Value="11">11 Meses</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="rdbSemanal" runat="server" AutoPostBack="True" GroupName="2"
                                        OnCheckedChanged="rdbSemanal_CheckedChanged" Text="Semanal" />
                                          &nbsp;
                                </td>
                               
                                <td class="style13" height="20px">
                                    <asp:Label ID="lblCantSemanas" runat="server" Text="Cant. Semanas:" Visible="False"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlCantSemanas" runat="server" AutoPostBack="True" Visible="False">
                                        <asp:ListItem Value="1">1 Semana</asp:ListItem>
                                        <asp:ListItem Value="2">2 Semanas</asp:ListItem>
                                        <asp:ListItem Value="3">3 Semanas</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="rdbDiario" runat="server" AutoPostBack="True" GroupName="2"
                                        OnCheckedChanged="rdbDiario_CheckedChanged1" Text="Diario" />
                                           &nbsp;
                                </td>
                              
                                <td class="style13" height="20px">
                                    <asp:Label ID="lblCantDias" runat="server" Text="Cant. Días:" Visible="False"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlCantDias" runat="server" AutoPostBack="True" Visible="False">
                                        <asp:ListItem Value="1">1 Día</asp:ListItem>
                                        <asp:ListItem Value="2">2 Días</asp:ListItem>
                                        <asp:ListItem Value="3">3 Días</asp:ListItem>
                                        <asp:ListItem Value="4">4 Días</asp:ListItem>
                                        <asp:ListItem Value="5">5 Días</asp:ListItem>
                                        <asp:ListItem Value="6">6 Días</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td >
             
            </td>
            <td>
                
            </td>
            <td>
               
            </td>
            <td>
                
            </td>
            <td>
              
            </td>
        </tr>
        </table>
        <table width="800px" style="margin-top:0px">
        <tr>
            <td colspan="5" style="border-bottom-style: inset" height="25px">
               &nbsp;
                <asp:Label ID="Label7" runat="server" Font-Italic="True" Font-Size="Medium" Text="Actividades"></asp:Label>
            </td>
        </tr>
        </table>
        <table style="margin-top:5px">
        <tr>
            <td >
               
            </td>
            <td>
             
            </td>
            <td>
               
            </td>
            <td>
               
            </td>
            <td>
               
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="gvActividades" runat="server" AutoGenerateColumns="False" DataKeyNames="IDACTIVIDAD"
                    DataSourceID="sdsActividades" HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4"
                    ForeColor="#333333" GridLines="None" 
                    Style="margin-top: 0px; overflow: scroll" Width="600px"  SelectedRowStyle-BackColor="#3399FF"  
                   > 
                    <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                   
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:RadioButton ID="gvActividades_rdbSeleccionar" runat="server" OnCheckedChanged="gvActividades_rdbSeleccionar_CheckedChanged"
                                    Width="30px" />
                            </ItemTemplate>
                            <ItemStyle CssClass="estiloFilasTabla" Width="30px"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="IDACTIVIDAD" HeaderText="Actividad" ReadOnly="True"
                            SortExpression="IDACTIVIDAD" HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" SortExpression="NOMBRE" HeaderStyle-Width="65px"
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="DESCRIPCION" HeaderText="Descripción" SortExpression="DESCRIPCION"
                            HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="NOMBRE1" HeaderText="Complejidad" SortExpression="NOMBRE1"
                            HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="TIEMPOESTIMADO" HeaderText="Duración (Minutos)" SortExpression="TIEMPOESTIMADO"
                            HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                    </Columns>

<HeaderStyle CssClass="estiloHeaderTabla"></HeaderStyle>
 <SelectedRowStyle BackColor="DeepPink" ForeColor="PeachPuff" Font-Italic="true" Font-Bold="true" /> 
                </asp:GridView>
            </td>
            <td>
                <asp:Button ID="btnNuevaActividad" runat="server" OnClick="btnNuevaActividad_Click"
                    Text="Nueva Actividad" ValidationGroup="1" />
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:Label ID="lblMensaje" runat="server" Text="" ForeColor="Red" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style14" colspan="5">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="1" CssClass="font" />
                &nbsp;
                &nbsp;
                &nbsp;
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="text-align: left" colspan="5">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Button ID="btnRegistrar" runat="server" OnClick="btnRegistrar_Click" Style="margin-left: 200px"
                            Text="Registrar" ValidationGroup="1" />
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                        <span style="display: none">
                            <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
                        </span>
                        <asp:ModalPopupExtender ID="ModalPopupConfirmacion" PopupControlID="popUpConfirmacion"
                            runat="server" TargetControlID="LinkButton1" BackgroundCssClass="reveal-modal-bg">
                        </asp:ModalPopupExtender>
                        <span style="display: none">
                            <asp:LinkButton ID="LinkButton2" runat="server">LinkButton</asp:LinkButton>
                        </span>
                        <asp:ModalPopupExtender ID="ModalPopupCancelarRegistrar" PopupControlID="popUpCancelarRegistrar"
                            runat="server" TargetControlID="LinkButton2" BackgroundCssClass="reveal-modal-bg">
                        </asp:ModalPopupExtender>
                        <span style="display: none">
                            <asp:LinkButton ID="LinkButton3" runat="server">LinkButton</asp:LinkButton>
                        </span>
                        <asp:ModalPopupExtender ID="ModalPopupExito" PopupControlID="popUpExito" runat="server"
                            TargetControlID="LinkButton3" BackgroundCssClass="reveal-modal-bg">
                        </asp:ModalPopupExtender>
                        <span style="display: none">
                            <asp:LinkButton ID="LinkButton4" runat="server">LinkButton</asp:LinkButton>
                        </span>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td class="style14">
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
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="sdsActividades" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT A.IDACTIVIDAD, A.NOMBRE, A.DESCRIPCION, CA.NOMBRE, A.TIEMPOESTIMADO
  FROM ACTIVIDAD A, COMPLEJIDADACTIVIDAD CA
  WHERE A.COMPLEJIDAD = CA.IDCOMPLEJIDAD"></asp:SqlDataSource>
    <asp:Panel ID="popUpExito" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="40px" />
        </div>
        <div class="heading">
            <asp:Label ID="Labe22" runat="server" Text="La TAREA fue registrada con éxito" Style="margin-right: 15px"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarConfirmacion_Click" CssClass="botonPopUp" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading">
            <asp:Label ID="Label1" runat="server" Text="¿Desea registrar la TAREA?"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarRegistrar" runat="server" Text="Aceptar" OnClick="btnAceptarRegistrar_Click"
                            CssClass="botonPopUp" />
                        <asp:Button ID="btnCancelarRegistrar" runat="server" Text="Cancelar" OnClick="btnCancelarRegistrar_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="popUpCancelarRegistrar" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image2" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="40px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label2" runat="server" Text="Se perderán los datos ingresados" Style="margin-right: 25px"></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text="¿Desea Continuar?"></asp:Label>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa; width: 360px">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarCancelacion" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarCancelacion_Click" Style="margin-top: 50px" />
                        <asp:Button ID="btnCancelarCancelacion" runat="server" Text="Cancelar" CausesValidation="False"
                            OnClick="btnCancelarCancelacion_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
