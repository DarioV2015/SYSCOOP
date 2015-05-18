<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="RegistrarDiagramacionTurnosGuardiaReclamo.aspx.cs" Inherits="MCorrectivoSesion_RegistrarDiagramacionTurnosGuardiaReclamo"
    Title="SISE" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .datos
        {
            text-align: right;
        }
        .estiloHeaderTabla
        {
            font-family: Sans-Serif;
            font-size: 13px;
            background-color: #b9c9fe;
            text-align: center;
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
        .check
        {
            vertical-align: bottom;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="500px">
        <tr>
            <td colspan="6">
                <asp:Panel ID="Panel1" runat="server">
                    <table>
                        <tr>
                            <td>
                                <asp:RadioButton ID="RadioButton1" runat="server" AutoPostBack="True" GroupName="1"
                                    OnCheckedChanged="RadioButton1_CheckedChanged" Text="Filtrar por Fecha" />
                            </td>
                            <td class="datos">
                                <asp:Label ID="Label1" runat="server" Text="Mes:"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlMes" runat="server" AutoPostBack="True" Enabled="False"
                                    OnSelectedIndexChanged="ddlMes_SelectedIndexChanged">
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
                            <td class="datos" width="40px">
                                <asp:Label ID="Label2" runat="server" Text=" Año:"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" Enabled="False"
                                    OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Width="101px">
                                    <asp:ListItem>2014</asp:ListItem>
                                    <asp:ListItem>2013</asp:ListItem>
                                    <asp:ListItem>2012</asp:ListItem>
                                    <asp:ListItem>2011</asp:ListItem>
                                    <asp:ListItem>2010</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton ID="RadioButton2" runat="server" AutoPostBack="True" GroupName="1"
                                    OnCheckedChanged="RadioButton2_CheckedChanged" Text="Filtrar por grupo" />
                            </td>
                            <td class="datos">
                                <asp:Label ID="Label6" runat="server" Text="Grupo:"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DDLGrupo" runat="server" AutoPostBack="True" DataSourceID="SDSGrupo"
                                    DataTextField="IDGRUPO" DataValueField="IDGRUPO" Enabled="False" OnSelectedIndexChanged="DDLGrupo_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton ID="RadioButton3" runat="server" AutoPostBack="True" EnableViewState="False"
                                    GroupName="1" OnCheckedChanged="RadioButton3_CheckedChanged" Text="Filtrar por turno" />
                            </td>
                            <td class="datos">
                                <asp:Label ID="Label8" runat="server" Text="Turno:"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DDLTurnoHistorial" runat="server" AutoPostBack="True" DataSourceID="SDSTurno"
                                    DataTextField="DESCRIPCION" DataValueField="IDTURNO" Enabled="False" OnSelectedIndexChanged="DDLTurnoHistorial_SelectedIndexChanged">
                                    <asp:ListItem>Seleccionar</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblHistorial" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <tr>
                                <td colspan="5">
                                    <asp:SqlDataSource ID="SDSGrupo" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                                        ProviderName="System.Data.SqlClient" SelectCommand="SELECT [IDGRUPO] FROM [GRUPOGUARDIARECLAMO]">
                                    </asp:SqlDataSource>
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
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="text-align: right" colspan="10">
                <asp:GridView ID="GVHistorial" runat="server" CellPadding="4" AutoGenerateColumns="False"
                    DataKeyNames="IDGRUPOGR,FECHAINICIO" DataSourceID="SDSHistorialXFecha" HeaderStyle-CssClass="estiloHeaderTabla"
                    ForeColor="#333333" GridLines="None" Width="600px">
                    <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="IDGRUPOGR" HeaderText="Grupo Nro" ReadOnly="True" SortExpression="IDGRUPOGR"
                            HeaderStyle-Width="90px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="FECHAINICIO" HeaderText="Fecha Inicio" ReadOnly="True"
                            SortExpression="FECHAINICIO" HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="FECHAFIN" HeaderText="Fecha Fin" SortExpression="FECHAFIN"
                            HeaderStyle-Width="90px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="DESCRIPCION" HeaderText="Descripción" SortExpression="DESCRIPCION"
                            HeaderStyle-Width="90px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="APELLIDO" HeaderText="Apellido" SortExpression="APELLIDO"
                            HeaderStyle-Width="90px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" SortExpression="NOMBRE" HeaderStyle-Width="90px"
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle CssClass="estiloHeaderTabla"></HeaderStyle>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="text-align: right" colspan="6">
                <asp:GridView ID="GVHistorialXGrupo" runat="server" AutoGenerateColumns="False" DataKeyNames="IDGRUPOGR,FECHAINICIO"
                    DataSourceID="SDSHistorialXGrupo" Visible="False" HeaderStyle-CssClass="estiloHeaderTabla"
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="600px">
                    <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="IDGRUPOGR" HeaderText="Nro. Grupo" ReadOnly="True" SortExpression="IDGRUPOGR"
                            HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="FECHAINICIO" HeaderText="Fecha Inicio" ReadOnly="True"
                            SortExpression="FECHAINICIO" HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="FECHAFIN" HeaderText="Fecha Fin" SortExpression="FECHAFIN"
                            HeaderStyle-Width="90px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="DESCRIPCION" HeaderText="Turno" SortExpression="DESCRIPCION"
                            HeaderStyle-Width="90px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="APELLIDO" HeaderText="Apellido" SortExpression="APELLIDO"
                            HeaderStyle-Width="90px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" SortExpression="NOMBRE" HeaderStyle-Width="90px"
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle CssClass="estiloHeaderTabla"></HeaderStyle>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="text-align: right" colspan="6">
                <asp:GridView ID="GVHistorialXTurno" runat="server" AutoGenerateColumns="False" DataKeyNames="IDGRUPOGR,FECHAINICIO"
                    DataSourceID="SDSHistorialXTurno" Visible="False" HeaderStyle-CssClass="estiloHeaderTabla"
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="600px">
                    <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="IDGRUPOGR" HeaderText="Nro. Grupo" ReadOnly="True" SortExpression="IDGRUPOGR"
                            HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="FECHAINICIO" HeaderText="Fecha Inicio" ReadOnly="True"
                            SortExpression="FECHAINICIO" HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="FECHAFIN" HeaderText="Fecha Fin" SortExpression="FECHAFIN"
                            HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="DESCRIPCION" HeaderText="Turno" SortExpression="DESCRIPCION"
                            HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="APELLIDO" HeaderText="Apellido" SortExpression="APELLIDO"
                            HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" SortExpression="NOMBRE" HeaderStyle-Width="65px"
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle CssClass="estiloHeaderTabla"></HeaderStyle>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:SqlDataSource ID="SDSHistorialXFecha" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                    ProviderName="System.Data.SqlClient" SelectCommand="SELECT H.IDGRUPOGR, CONVERT(char(10), H.FECHAINICIO, 103) AS FECHAINICIO, CONVERT(char(10), H.FECHAFIN, 103) AS FECHAFIN, T.DESCRIPCION, P.APELLIDO, P.NOMBRE
                     FROM HISTORIALGRUPO H, TURNO T, EMPLEADO E, PERSONA P, EMPLEADOPORGRUPOGR GXE
                     WHERE H.IDGRUPOGR = GXE.IDGRUPOGUADIARECLAMO 
                     AND GXE.IDEMPLEADO = E.IDEMPLEADO
                     AND E.NRODOCUMENTO = P.NRODOCUMENTO 
                     AND E.IDTIPODOCUMENTO = P.TIPODOCUMENTO 
                     AND H.IDTURNO = T.IDTURNO 
                     AND (MONTH(H.FECHAINICIO) = @fechaMes OR MONTH(H.FECHAFIN) = @fechaMes) 
                     AND (YEAR(H.FECHAINICIO) = @fechaAño OR YEAR(H.FECHAFIN) = @fechaAño)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlMes" Name="fechaMes" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownList2" Name="fechaAño" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="6">
            </td>
        </tr>
        <tr>
            <td style="text-align: right" colspan="3">
                <asp:Panel ID="Panel2" runat="server">
                    <table style="margin-top: 0px" width="486px">
                        <tr>
                            <td class="datos">
                                <asp:Label ID="Label9" runat="server" Text="Fecha Inicio:"></asp:Label>
                                &nbsp;
                            </td>
                            <td>
                                <asp:TextBox ID="txtFechaInicio" runat="server" Enabled="False" Width="198px"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFechaInicio"
                                    ErrorMessage="Debe Seleccionar la Fecha de Inicio">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:Image ID="Image3" runat="server" ImageUrl="../Imagenes/1410380987_Calendar_24x24.png"
                                    ImageAlign="Middle" Style="vertical-align: middle" />
                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtFechaInicio"
                                    PopupButtonID="Image3" Format="dd/MM/yyyy">
                                </asp:CalendarExtender>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td colspan="3">
                <asp:Panel ID="Panel4" runat="server">
                    <asp:Calendar ID="CalendarFechaInicio" runat="server" BackColor="White" BorderColor="#3366CC"
                        CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                        ForeColor="#003399" Height="200px" OnSelectionChanged="CalendarFechaInicio_SelectionChanged"
                        Visible="False" Width="220px" Style="text-align: center" BorderWidth="1px">
                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" Font-Bold="True" BorderWidth="1px"
                            Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    </asp:Calendar>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="text-align: right" colspan="3">
                <asp:Panel ID="Panel3" runat="server">
                    <table width="470px" style="margin-top: 0px; margin-left: 10px">
                        <tr>
                            <td class="datos">
                                <asp:Label ID="Label10" runat="server" Text="Fecha Fin:"></asp:Label>
                                &nbsp;
                            </td>
                            <td>
                                <asp:TextBox ID="txtFechaFin" runat="server" Enabled="False" Style="text-align: left"
                                    Width="198px"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Debe Seleccionar la Fecha de Fin"
                                    ControlToValidate="txtFechaFin">*</asp:RequiredFieldValidator>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                                <asp:Image ID="Image4" runat="server" ImageUrl="../Imagenes/1410380987_Calendar_24x24.png"
                                    ImageAlign="Middle" Style="vertical-align: middle" />
                                <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtFechaFin"
                                    PopupButtonID="Image4" Format="dd/MM/yyyy">
                                </asp:CalendarExtender>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td colspan="3">
                <asp:Panel ID="Panel5" runat="server">
                    <asp:Calendar ID="CalendarFechaFin" runat="server" BackColor="White" BorderColor="#3366CC"
                        CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                        ForeColor="#003399" Height="200px" OnSelectionChanged="CalendarFechaFin_SelectionChanged"
                        Visible="False" Width="220px" BorderWidth="1px">
                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" Font-Bold="True" BorderWidth="1px"
                            Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    </asp:Calendar>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <table style="margin-left: 50px">
        <tr>
            <td>
                <asp:Label ID="Label11" runat="server" Text=" Turno:"></asp:Label>
            </td>
            <td>
                <asp:UpdatePanel ID="upTurno" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="DDLTurno" runat="server" AutoPostBack="True" DataSourceID="SDSTurno"
                            DataTextField="DESCRIPCION" DataValueField="IDTURNO">
                            <asp:ListItem Selected="True">Seleccionar</asp:ListItem>
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td colspan="4">
                <asp:FormView ID="FormView1" runat="server" DataSourceID="SDSTDescripcionTurno" Style="margin-top: 0px">
                    <EditItemTemplate>
                        HORAINICIO:
                        <asp:TextBox ID="HORAINICIOTextBox" runat="server" Text='<%# Bind("HORAINICIO") %>' />
                        <br />
                        HORAFIN:
                        <asp:TextBox ID="HORAFINTextBox" runat="server" Text='<%# Bind("HORAFIN") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Actualizar" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancelar" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        HORAINICIO:
                        <asp:TextBox ID="HORAINICIOTextBox" runat="server" Text='<%# Bind("HORAINICIO") %>' />
                        <br />
                        HORAFIN:
                        <asp:TextBox ID="HORAFINTextBox" runat="server" Text='<%# Bind("HORAFIN") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insertar" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text=" Hora Inicio:"></asp:Label>
                        <asp:Label ID="HORAINICIOLabel" runat="server" Text='<%# Bind("HORAINICIO") %>' />
                        &nbsp;
                        <asp:Label ID="Label13" runat="server" Text="-  Hora Fin:"></asp:Label>
                        <asp:Label ID="HORAFINLabel" runat="server" Text='<%# Bind("HORAFIN") %>' />
                        <br />
                    </ItemTemplate>
                </asp:FormView>
            </td>
        </tr>
        <tr>
            <td colspan="3" dir="ltr" rowspan="1">
                <asp:SqlDataSource ID="SDSTurno" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                    ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [TURNO]"></asp:SqlDataSource>
            </td>
            <td colspan="3" dir="ltr" rowspan="1">
                <asp:SqlDataSource ID="SDSTDescripcionTurno" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                    ProviderName="System.Data.SqlClient" SelectCommand="SELECT HORAINICIO, HORAFIN  FROM TURNO WHERE IDTURNO = @turno">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLTurno" Name="turno" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <tr>
        <td>
            <asp:Label ID="lblMensajeEmpleadoDisponibles" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <table style="margin-top: 0px; margin-left: 360px">
        <tr>
            <td colspan="6">
                <asp:GridView ID="GVEmpleados" runat="server" AutoGenerateColumns="False" DataKeyNames="IDEMPLEADO"
                    DataSourceID="SDSEmpleados" HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4"
                    ForeColor="#333333" GridLines="None" Style="margin-left: 360; margin-top: 0px">
                    <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Style="position: static" />
                            </ItemTemplate>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="IDEMPLEADO" HeaderText="Legajo" ReadOnly="True" SortExpression="IDEMPLEADO"
                            HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="APELLIDO" HeaderText="Apellido" SortExpression="APELLIDO"
                            HeaderStyle-Width="65px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" SortExpression="NOMBRE" HeaderStyle-Width="65px"
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle CssClass="estiloHeaderTabla"></HeaderStyle>
                </asp:GridView>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td colspan="6">
                <asp:SqlDataSource ID="SDSEmpleados" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                    ProviderName="System.Data.SqlClient" SelectCommand="SELECT E.IDEMPLEADO, P.APELLIDO, P.NOMBRE 
  FROM EMPLEADO E, PERSONA P
  WHERE E.IDTIPODOCUMENTO = P.TIPODOCUMENTO
  AND E.NRODOCUMENTO = P.NRODOCUMENTO
  AND E.IDCARGO = 1
  AND E.IDEMPLEADO NOT IN (SELECT E1.IDEMPLEADO
FROM EMPLEADO E1, EMPLEADOPORGRUPOGR EXG, GRUPOPORTURNO GXT, TURNO T, HISTORIALGRUPO HG
					WHERE EXG.IDEMPLEADO = E1.IDEMPLEADO
					AND EXG.IDGRUPOGUADIARECLAMO = GXT.IDGRUPOGR
					AND GXT.IDTURNO = T.IDTURNO
					AND HG.IDGRUPOGR = EXG.IDGRUPOGUADIARECLAMO
					AND (@fechaInicio BETWEEN HG.FECHAINICIO AND HG.FECHAFIN
					OR @fechaFin BETWEEN HG.FECHAINICIO AND HG.FECHAFIN)
				    OR (HG.FECHAFIN &lt;= @fechaFin 
					AND HG.FECHAINICIO &gt;= @fechaInicio) )">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtFechaInicio" Name="fechaInicio" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtFechaFin" Name="fechaFin" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="BTNGuardar" runat="server" OnClick="BTNGuardar_Click" Text="Guardar"
                            Style="margin-left: 400px" />
                        <asp:Button ID="BTNCanelar" runat="server" Text="Cancelar" OnClick="BTNCanelar_Click" />
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
                    </ContentTemplate>
                </asp:UpdatePanel>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
        </tr>
    </table>
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading">
            <asp:Label ID="Label3" runat="server" Text="¿Desea registrar la asignacion del Turno?"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
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
            <asp:Label ID="Label4" runat="server" Text="Se perderán los datos ingresados" Style="margin-right: 25px"></asp:Label>
            <br />
            <asp:Label ID="Label7" runat="server" Text="¿Desea Continuar?"></asp:Label>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa; width: 360px">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
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
    <asp:Panel ID="popUpExito" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="40px" />
        </div>
        <div class="heading">
            <asp:Label ID="Label5" runat="server" Text="Las Herramientas fueron Asignadas" Style="margin-right: 15px"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarConfirmacion_Click" CssClass="botonPopUp" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <asp:SqlDataSource ID="SDSHistorialXGrupo" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT H.IDGRUPOGR, CONVERT (char(10), H.FECHAINICIO, 103) AS FECHAINICIO, CONVERT (char(10), H.FECHAFIN, 103) AS FECHAFIN, T.DESCRIPCION, P.APELLIDO, P.NOMBRE FROM HISTORIALGRUPO AS H INNER JOIN EMPLEADOPORGRUPOGR AS GXE ON H.IDGRUPOGR = GXE.IDGRUPOGUADIARECLAMO INNER JOIN EMPLEADO AS E ON GXE.IDEMPLEADO = E.IDEMPLEADO INNER JOIN PERSONA AS P ON E.NRODOCUMENTO = P.NRODOCUMENTO AND E.IDTIPODOCUMENTO = P.TIPODOCUMENTO INNER JOIN TURNO AS T ON H.IDTURNO = T.IDTURNO WHERE (H.IDGRUPOGR = @grupo)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLGrupo" Name="grupo" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSHistorialXTurno" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT  H.IDGRUPOGR, CONVERT(char(10), H.FECHAINICIO, 103) AS FECHAINICIO, CONVERT(char(10), H.FECHAFIN, 103) AS FECHAFIN, T.DESCRIPCION, P.APELLIDO, P.NOMBRE
                     FROM HISTORIALGRUPO H, TURNO T, EMPLEADO E, PERSONA P, EMPLEADOPORGRUPOGR GXE 
                     WHERE H.IDGRUPOGR = GXE.IDGRUPOGUADIARECLAMO 
                     AND GXE.IDEMPLEADO = E.IDEMPLEADO 
                     AND E.NRODOCUMENTO = P.NRODOCUMENTO
                     AND E.IDTIPODOCUMENTO = P.TIPODOCUMENTO
                     AND H.IDTURNO = T.IDTURNO
                     AND H.IDTURNO = @turno">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLTurnoHistorial" Name="turno" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
