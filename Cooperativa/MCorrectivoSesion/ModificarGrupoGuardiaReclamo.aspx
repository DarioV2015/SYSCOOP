<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true" CodeFile="ModificarGrupoGuardiaReclamo.aspx.cs" Inherits="MCorrectivoSesion_ModificarGrupoGuardiaReclamo" Title="Página sin título" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
<link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />    

    <style type="text/css">
       
     
         .datos
        {
            text-align: right;
        }
          .estiloHeaderTabla
        {
        	    font-family:Sans-Serif;
                Font-Size :13px; 
                background-color:#b9c9fe;
        
                font-weight: bold;
                background: #b9c9fe;
                border-top: 4px solid #aabcfe;
                border-bottom: 1px solid #fff;
                color: #039;
                padding: 8px;
                border-left-style:none;
                border-right-style:none;
                border-left:none;
          
        }
        .estiloFilasTabla
        {
              text-align:center;
              font-family:Sans-Serif;
              font-size:13px;
              border-left-style:none;
              border-left-width:0px;
              border-bottom: 1px solid #fff;
        }
        .tablaMargen
        { margin-left:63px;
        	}
        .botonPopUp
        {
        	margin-left:0px;
        	margin-top:30px;
        	text-align:center;
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
        	
        .style9
        {
            height: 277px;
        }
        .style11
        {
            height: 157px;
        }
        	
        .style12
        {
            width: 100%;
        }
        	
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style9">
        <tr>
            <td colspan="6">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table class="style9">
                            <tr>
                                <td style="text-align: right">
                                    <asp:Label ID="Label4" runat="server" Text="Grupo GR:"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlGrupo" runat="server" 
                                        DataSourceID="sdsGruposDisponibles" DataTextField="IDGRUPOGR" 
                                        DataValueField="IDGRUPOGR" AutoPostBack="True">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="4" class="style11">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                        CellPadding="4" DataSourceID="sdsGruposGrilla" ForeColor="#333333" 
                                        GridLines="None" HeaderStyle-CssClass="estiloHeaderTabla" 
                                        onselectedindexchanged="GridView1_SelectedIndexChanged" 
                                        style="margin-left:165px">
                                        <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:RadioButton ID="GridView1_rdbSeleccionar" runat="server" 
                                                        oncheckedchanged="GridView1_rdbSeleccionar_CheckedChanged" 
                                                        onclick="RadioCheckOnly(this);" Width="30px" AutoPostBack="True" />
                                                </ItemTemplate>
                                                <ItemStyle CssClass="estiloFilasTabla" Width="20px" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Column1" HeaderStyle-Width="65px" 
                                                HeaderText="Fecha Inicio" ItemStyle-CssClass="estiloHeaderTabla" 
                                                ReadOnly="True" SortExpression="Column1">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px" />
                                                <ItemStyle CssClass="estiloFilasTabla" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Column2" HeaderStyle-Width="65px" 
                                                HeaderText="Fecha Fin" ItemStyle-CssClass="estiloHeaderTabla" ReadOnly="True" 
                                                SortExpression="Column2">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px" />
                                                <ItemStyle CssClass="estiloFilasTabla" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="HORAINICIO" HeaderStyle-Width="65px" 
                                                HeaderText="Hora Inicio" ItemStyle-CssClass="estiloHeaderTabla" 
                                                SortExpression="HORAINICIO">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px" />
                                                <ItemStyle CssClass="estiloFilasTabla" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="HORAFIN" HeaderStyle-Width="65px" 
                                                HeaderText="Hora Fin" ItemStyle-CssClass="estiloHeaderTabla" 
                                                SortExpression="HORAFIN">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px" />
                                                <ItemStyle CssClass="estiloFilasTabla" />
                                            </asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <asp:Label ID="Label3" runat="server" Text="Empleados titulares del grupo" Visible="false"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <asp:GridView ID="gvEmpleadosGrupo" runat="server" AutoGenerateColumns="False" ForeColor="#333333" 
                                        GridLines="None" HeaderStyle-CssClass="estiloHeaderTabla" 
 
                                        style="margin-left:165px">
                                        <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                        <Columns>
                                         <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:RadioButton ID="gvEmpleadosGrupo_rdbSeleccionar" runat="server" 
                                                        oncheckedchanged="gvEmpleadosGrupo_rdbSeleccionar_CheckedChanged" 
                                                        onclick="RadioCheckOnly(this);" Width="30px" AutoPostBack="True" />
                                                </ItemTemplate>
                                                <ItemStyle CssClass="estiloFilasTabla" Width="20px" />
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="Legajo" DataField="IdEmpleado" 
                                                SortExpression="IdEmpleado" ItemStyle-CssClass="estiloHeaderTabla">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px" />
                                                <ItemStyle CssClass="estiloFilasTabla" />
                                            </asp:BoundField>
                                            <asp:BoundField HeaderText="Apellido" DataField="ApellidoEmpleado" 
                                                SortExpression="ApellidoEmpleado" ItemStyle-CssClass="estiloHeaderTabla">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px" />
                                                <ItemStyle CssClass="estiloFilasTabla" />
                                            </asp:BoundField>
                                            <asp:BoundField HeaderText="Nombre" DataField="NombreEmpleado" 
                                                SortExpression="NombreEmpleado" ItemStyle-CssClass="estiloHeaderTabla">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px" />
                                                <ItemStyle CssClass="estiloFilasTabla" />
                                            </asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                                </tr>
                                <tr>
                                <td colspan="4">
                                <asp:Label ID="LblMensajeGrupoGR" runat="server" ForeColor="Red"></asp:Label>
                                </td>
                                </tr>
                           
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lblGuardiaReclamoSumplentesDisponibles" runat="server" 
                                        Text="Guardias Reclamos Suplentes Disponibles" Visible="False"></asp:Label>
                                </td>
                                <td colspan="2">
                                    <asp:Label ID="lblMensajeGRSuplente" runat="server" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <asp:GridView ID="gvGuardiasSuplentes" runat="server" 
                                        AutoGenerateColumns="False" ForeColor="#333333" 
                                        GridLines="None" HeaderStyle-CssClass="estiloHeaderTabla" 
                                        onselectedindexchanged="GridView1_SelectedIndexChanged" 
                                        style="margin-left:165px">
                                        <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                        <Columns>
                                        <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:RadioButton ID="gvGuardiasSuplentes_rdbSeleccionar" runat="server" 
                                                        oncheckedchanged="gvGuardiasSuplentes_rdbSeleccionar_CheckedChanged" 
                                                        onclick="RadioCheckOnly(this);" Width="30px" />
                                                </ItemTemplate>
                                                <ItemStyle CssClass="estiloFilasTabla" Width="20px" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="IdEmpleado" HeaderText="Legajo" 
                                                SortExpression="IdEmpleado" ItemStyle-CssClass="estiloHeaderTabla" HeaderStyle-Width="65px">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px" />
                                                <ItemStyle CssClass="estiloFilasTabla" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ApellidoEmpleado" HeaderText="Apellido" 
                                                SortExpression="ApellidoEmpleado" ItemStyle-CssClass="estiloHeaderTabla"
                                                HeaderStyle-Width="65px">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px" />
                                                <ItemStyle CssClass="estiloFilasTabla" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="NombreEmpleado" HeaderText="Nombre" 
                                                SortExpression="NombreEmpleado" ItemStyle-CssClass="estiloHeaderTabla"
                                                HeaderStyle-Width="65px">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px" />
                                                <ItemStyle CssClass="estiloFilasTabla" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="FechaInicio" HeaderText="Fecha Inicio" 
                                                SortExpression="FechaInicio" ItemStyle-CssClass="estiloHeaderTabla"
                                                HeaderStyle-Width="65px">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px" />
                                                <ItemStyle CssClass="estiloFilasTabla" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="FechaFin" HeaderText="Fecha Fin" 
                                                SortExpression="FechaFin" ItemStyle-CssClass="estiloHeaderTabla"
                                                HeaderStyle-Width="65px">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px" />
                                                <ItemStyle CssClass="estiloFilasTabla" />
                                            </asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        
        
        <tr>
        <td colspan="6">
                                    
            <asp:UpdatePanel ID="UpdatePanelCalendarios" runat="server">
             <ContentTemplate>

                <table class="style12">
                   <tr>
        <td colspan="4">
            <asp:Label ID="lblMensajeFecha" runat="server" ForeColor="Red"></asp:Label>
        </td>
        </tr> 
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Fecha Inicio:"></asp:Label></td>
                        <td colspan="2">
                             <asp:TextBox ID="DateTextBox" runat="server" AutoPostBack="True" 
                            ontextchanged="text_Changed"  />
                            <asp:Image ID="Image1" runat="server" ImageUrl="Calendar_scheduleHS.png" />
                            <asp:CalendarExtender ID="CalendarExtender2" runat="server" 
                             TargetControlID="DateTextBox" PopupButtonID="Image1" Format="dd/MM/yyyy">
                                </asp:CalendarExtender></td>
                        <td rowspan="2">
                           </td>
                        
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Fecha Fin:"></asp:Label></td>
                        <td colspan = "2">
                        <asp:TextBox ID="DateTextBoxFin" runat="server" AutoPostBack="True" 
                            ontextchanged="textFin_Changed"  />
                            <asp:Image ID="Image2" runat="server" ImageUrl="Calendar_scheduleHS.png" />
                            <asp:CalendarExtender ID="CalendarExtender3" runat="server" 
                             TargetControlID="DateTextBoxFin" PopupButtonID="Image2" Format="dd/MM/yyyy">
                             </asp:CalendarExtender>
                             </td>
                                                     
                    </tr rowspan="3">
                    <tr>
                        <td colspan="4">
                            
                            <asp:Button ID="btnAgregarDiag" runat="server" onclick="btnAgregarDiag_Click" 
                                Text="Agregar" />
                            
                        </td>
                    </tr>
                    
                </table>
            </td>
            </tr>
            </tabla>
             </ContentTemplate>
            </asp:UpdatePanel>
                                    
       </td>
            
        </tr>
        <tr>
        <td colspan="6">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
             <ContentTemplate>

                <table class="style12">
                   <tr>
                   <td>
                   <asp:GridView ID="gvModificaciones" runat="server" ForeColor="#333333" 
                                GridLines="None" HeaderStyle-CssClass="estiloHeaderTabla" 
                                style="margin-left:165px" AutoGenerateColumns="False">
                                <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="FechaInicio" HeaderText="Fecha Inicio" 
                                        SortExpression="FechaInicio" ItemStyle-CssClass="estiloHeaderTabla"
                                                HeaderStyle-Width="65px">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px" />
                                                <ItemStyle CssClass="estiloFilasTabla" />
                                            </asp:BoundField>
                                    <asp:BoundField DataField="FechaFin" HeaderText="Fecha Fin" 
                                        SortExpression="FechaFin" ItemStyle-CssClass="estiloHeaderTabla"
                                                HeaderStyle-Width="65px">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px" />
                                                <ItemStyle CssClass="estiloFilasTabla" />
                                            </asp:BoundField>
                                    <asp:BoundField DataField="LegajoTitular" HeaderText="Legajo Titular" 
                                        SortExpression="LegajoTitular" ItemStyle-CssClass="estiloHeaderTabla"
                                                HeaderStyle-Width="65px">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px" />
                                                <ItemStyle CssClass="estiloFilasTabla" />
                                            </asp:BoundField>
                                    <asp:BoundField DataField="ApellidoTitular" HeaderText="Apellido Tiular" 
                                        SortExpression="ApellidoTitular" ItemStyle-CssClass="estiloHeaderTabla"
                                                HeaderStyle-Width="65px">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px" />
                                                <ItemStyle CssClass="estiloFilasTabla" />
                                            </asp:BoundField>
                                    <asp:BoundField DataField="LegajoSuplente" HeaderText="Legajo Reemplazo" 
                                        SortExpression="LegajoSuplente" ItemStyle-CssClass="estiloHeaderTabla"
                                                HeaderStyle-Width="65px">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px" />
                                                <ItemStyle CssClass="estiloFilasTabla" />
                                            </asp:BoundField>
                                    <asp:BoundField DataField="ApellidoSuplente" HeaderText="Apellido Reemplazo" 
                                        SortExpression="ApellidoSuplente" ItemStyle-CssClass="estiloHeaderTabla"
                                                HeaderStyle-Width="65px">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px" />
                                                <ItemStyle CssClass="estiloFilasTabla" />
                                            </asp:BoundField>
                                </Columns>
                                <HeaderStyle CssClass="estiloHeaderTabla" />
                            </asp:GridView>
                   
                   
                   </td>
                   </tr>
                   </table>
                   </ContentTemplate>
                   </asp:UpdatePanel>
        </td>
        </tr>
        <tr>
            <td colspan="4">
                &nbsp;</td>
            
        </tr>
        <tr>
            <td>
            
            
               

</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    
     <script type="text/javascript">
    
     function RadioCheckOnly(rbControl) {
     
      var gvName = rbControl.defaultValue.split('_')[0];
      var gvControl;
      
      switch (gvName)
      {
        case "GridView1":
        gvControl =  "<%=GridView1.ClientID%>";       
        break;  
        
        case "gvGuardiasSuplentes":
        gvControl = "<%=gvGuardiasSuplentes.ClientID%>";
        break;
        
        case "gvEmpleadosGrupo":
        gvControl = "<%=gvEmpleadosGrupo.ClientID%>";
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
    
    
    <asp:SqlDataSource ID="sdsGruposDisponibles" runat="server" 
                    ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                    ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT DISTINCT IDGRUPOGR FROM HISTORIALGRUPO WHERE FECHAFIN &gt;= GETDATE()">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsGruposGrilla" runat="server" 
                    ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                    ProviderName="System.Data.SqlClient" SelectCommand="SELECT convert(char(10), HG.FECHAINICIO, 103), convert(char(10), HG.FECHAFIN, 103), T.HORAINICIO, T.HORAFIN
  FROM HISTORIALGRUPO HG, TURNO T
  WHERE HG.IDTURNO = T.IDTURNO
  AND HG.FECHAFIN &gt;= GETDATE()
  AND HG.IDGRUPOGR = @grupo">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlGrupo" Name="grupo" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsGRSuplente" runat="server"></asp:SqlDataSource>
                                    
                                
                                    
                                
                                    
                                
                                    
                                </asp:Content>

