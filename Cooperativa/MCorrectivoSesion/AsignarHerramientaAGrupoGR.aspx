<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true" CodeFile="AsignarHerramientaAGrupoGR.aspx.cs" Inherits="MCorrectivoSesion_AsignarHerramientaAGrupoGR" Title="SISE" %>
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
        	
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    <table  width="850px" style="padding-left:0px">
        <tr>
            <td class="datos">
                <asp:Label ID="Label4" runat="server" style="text-align: right" 
                    Text="Grupo Guardia Reclamo:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLGrupo" runat="server" AutoPostBack="True" 
                    DataSourceID="SDSGrupoGR" DataTextField="IDGRUPOGR" 
                    DataValueField="IDGRUPOGR" onselectedindexchanged="DDLGrupo_SelectedIndexChanged" 
                    >
                </asp:DropDownList>
            </td>
            </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="lblMensajeNoHayGrupos" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            </tr>
            <tr>
            <td colspan="4">
                <asp:GridView ID="GVGrupo" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SDSEmpleadoXGrupo"  HeaderStyle-CssClass="estiloHeaderTabla" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" style="margin-left:165px">
                    <RowStyle  BackColor="#E8EFF8" ForeColor="#333333" />
                    <Columns>
                    
                        <asp:BoundField DataField="IDEMPLEADO" HeaderText="Legajo" 
                            SortExpression="IDEMPLEADO" HeaderStyle-Width="65px" 
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                         <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="APELLIDO" HeaderText="Apellido" 
                            SortExpression="APELLIDO" HeaderStyle-Width="65px" 
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                         <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" 
                            SortExpression="NOMBRE" HeaderStyle-Width="65px" 
                            ItemStyle-CssClass="estiloHeaderTabla" >
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                         <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField >
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:SqlDataSource ID="SDSGrupoGR" runat="server" 
                    ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                    ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT DISTINCT IDGRUPOGR FROM HISTORIALGRUPO WHERE FECHAFIN &gt;= GETDATE()">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SDSEmpleadoXGrupo" runat="server" 
                    ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                    ProviderName="System.Data.SqlClient" SelectCommand="SELECT EXG.IDEMPLEADO, P.APELLIDO, P.NOMBRE   
FROM GRUPOGUARDIARECLAMO GGR, EMPLEADOPORGRUPOGR EXG, PERSONA P, EMPLEADO E
WHERE E.IDTIPODOCUMENTO = P.TIPODOCUMENTO
AND E.NRODOCUMENTO = P.NRODOCUMENTO
AND E.IDEMPLEADO = EXG.IDEMPLEADO
AND GGR.IDGRUPO = EXG.IDGRUPOGUADIARECLAMO
AND GGR.IDGRUPO=@grupo">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLGrupo" Name="grupo" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="6" >
            </td>
        </tr>
         <tr>
            <td  style="text-align: right">
                <asp:Label ID="Label7" runat="server" Text="Grupo GR disponible:"></asp:Label>
                
            </td>
             <td>
                <asp:Label ID="lblMensajeGruposDisponibles" runat="server" ForeColor="Red"></asp:Label>
             </td>
            </tr>
            <tr>
            <td  colspan="5">
                <asp:GridView ID="GVHistorialGR" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SDSHistorialGR"  HeaderStyle-CssClass="estiloHeaderTabla" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" style="margin-left:165px">
                     <RowStyle  BackColor="#E8EFF8" ForeColor="#333333" />
                    <Columns>
                    <asp:TemplateField>
                            <ItemTemplate>
                                <asp:RadioButton ID="GVHistorialGR_rdbSeleccionar" runat="server" 
                                    oncheckedchanged="GVHistorialGR_rdbSeleccionar_CheckedChanged" onclick="RadioCheckOnly(this);" Width="30px" />
                            </ItemTemplate>
                            <ItemStyle CssClass="estiloFilasTabla" Width="20px"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Column1" HeaderText="Fecha Inicio" 
                            SortExpression="FECHAINICIO" HeaderStyle-Width="55px" 
                            ItemStyle-CssClass="estiloHeaderTabla" >
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="55px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        
                        <asp:BoundField DataField="Column2" HeaderText="Fecha Fin" 
                            SortExpression="FECHAFIN" HeaderStyle-Width="55px" 
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="55px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="HORAINICIO" HeaderText="Hora Inicio" 
                            SortExpression="HORAINICIO" HeaderStyle-Width="60px" 
                            ItemStyle-CssClass="estiloHeaderTabla">
                             <HeaderStyle CssClass="estiloHeaderTabla" Width="60px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="HORAFIN" HeaderText="Hora Fin" 
                            SortExpression="HORAFIN" HeaderStyle-Width="60px" 
                            ItemStyle-CssClass="estiloHeaderTabla" >
                             <HeaderStyle CssClass="estiloHeaderTabla" Width="60px" ></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                            
                        </asp:BoundField >
                    </Columns>

<HeaderStyle CssClass="estiloHeaderTabla"></HeaderStyle>
                </asp:GridView>
            </td>
        </tr>
       
        <tr>
            <td colspan="6">
                <asp:Label ID="LBLMensajeFechaInicio" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
       
        <tr>
            <td colspan="6">
                &nbsp;</td>
        </tr>
       
        <tr>

            <td style="text-align: right">
                <asp:Label ID="Label8" runat="server" Text="Fecha Inicio:"></asp:Label>
            </td>
            <td>                <asp:TextBox ID="txtFechaInicio" runat="server" Width="148px" ontextchanged="txtFechaInicio_Leave"
                   ></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="BTNFechaInicio" runat="server" onclick="BTNFechaInicio_Click" 
                    Text="Fecha" />
            </td>
            
            <td colspan="2">
                <asp:Calendar ID="CalendarFechaIncio" runat="server" BackColor="White" 
                    BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" 
                    DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
                    ForeColor="#003399" Height="150px" 
                    onselectionchanged="CalendarFechaIncio_SelectionChanged" Visible="False" 
                    Width="180px">
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" 
                        Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                
                </asp:Calendar>
            </td>
        </tr>

                  
                  

                        <tr>
            <td colspan="6">
                <asp:Label ID="LBLMensajeFechaFin" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td  style="text-align: right">
                <asp:Label ID="Label9" runat="server" Text="Fecha Fin:"></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="txtFechaFin" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td >
                <asp:Button ID="BTNFechaFin" runat="server" onclick="BTNFechaFin_Click" 
                    Text="Fecha"  Enabled="False" />
            </td>
           
            <td  colspan="2">
                <asp:Calendar ID="CalendarFechaFin" runat="server" BackColor="White" 
                     BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" 
                    DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
                     ForeColor="#003399" Height="150px"
                    onselectionchanged="CalendarFechaFin_SelectionChanged" Visible="False" 
                    Width="180px">

                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" 
                        Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                </asp:Calendar>
            </td>
        </tr>
        <tr>
            <td class="datos">
                <asp:Label ID="Label5" runat="server" Text="Tipo de Herramienta:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLTipoHerramienta" runat="server" 
                    DataSourceID="SDSTipoHerramienta" DataTextField="DESCRIPCION" 
                    DataValueField="IDTIPOHERRAMIENTA" AutoPostBack="True" 
                    onselectedindexchanged="DDLTipoHerramienta_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td class="datos">
                <asp:Label ID="Label6" runat="server" Text="Herramienta:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLHerramienta" runat="server" 
                    DataSourceID="SDSHerramienta" DataTextField="DESCRIPCION" 
                    DataValueField="IDHERRAMIENTA" 
                    onselectedindexchanged="DDLHerramienta_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="BTNAgregar" runat="server" Text="Seleccionar" 
                    onclick="BTNAgregar_Click" Enabled="False" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:SqlDataSource ID="SDSTipoHerramienta" runat="server" 
                    ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                    ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT * FROM [TIPOHERRAMIENTA]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SDSHerramienta" runat="server" 
                    ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                    ProviderName="System.Data.SqlClient" SelectCommand="SELECT h.IDHERRAMIENTA, h.DESCRIPCION
FROM HERRAMIENTA h, TIPOHERRAMIENTA t
WHERE h.IDTIPOHERRAMIENTA = t.IDTIPOHERRAMIENTA
and h.IDTIPOHERRAMIENTA= @herramienta
AND h.IDHERRAMIENTA NOT IN 
(SELECT H1.IDHERRAMIENTA
FROM HERRAMIENTA H1, HISTORIALHERRAMIENTA HH1
					WHERE H1.IDTIPOHERRAMIENTA = h.IDTIPOHERRAMIENTA
					AND HH1.IDHERRAMIENTA = H1.IDHERRAMIENTA
					AND (@fechaInicio BETWEEN HH1.FECHAINICIO AND HH1.FECHAFIN
					OR @fechaFin BETWEEN HH1.FECHAINICIO AND HH1.FECHAFIN)
				    AND (HH1.FECHAFIN &lt;=  @fechaFin 
					OR HH1.FECHAINICIO &gt;= @fechaInicio))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLTipoHerramienta" Name="herramienta" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txtFechaInicio" Name="fechaInicio" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtFechaFin" Name="fechaFin" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="6">
            <asp:GridView ID="GVHerramientasSeleccionadas" runat="server" 
                    AutoGenerateColumns="False" HeaderStyle-CssClass="estiloHeaderTabla" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
        style="margin-left:165px" 
        onselectedindexchanged="GVHerramientasSeleccionadas_SelectedIndexChanged">
                     <RowStyle  BackColor="#E8EFF8" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="NroHerramienta" HeaderText="Nro" HeaderStyle-Width="65px" 
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="60px"></HeaderStyle>
                         <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Descripcion" HeaderText="Herramienta" HeaderStyle-Width="65px" 
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="100px"></HeaderStyle>
                         <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
               
               
               </td>
        </tr>
        
        <tr style="height:20px">
            <td colspan="6">
                <asp:SqlDataSource ID="SDSHistorialGR" runat="server" 
                    ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                    ProviderName="System.Data.SqlClient" SelectCommand="SELECT convert(char(10), HG.FECHAINICIO, 103), convert(char(10), HG.FECHAFIN, 103), T.HORAINICIO, T.HORAFIN
  FROM HISTORIALGRUPO HG, TURNO T
  WHERE HG.IDTURNO = T.IDTURNO
  AND HG.FECHAFIN &gt;= GETDATE()
  AND HG.IDGRUPOGR = @grupo">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLGrupo" Name="grupo" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        

        <tr>
            <td  style="text-align: right">
                <asp:Label ID="LabelObserv" runat="server" Text="Observacion:"></asp:Label>
            </td>
            <td  colspan="5">
                <asp:TextBox ID="txtObservacion" runat="server" Width="351px"></asp:TextBox>
            </td>
            
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
    <table>
        <tr>
         <td  style="text-align: right">

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                                     
                     <asp:Button ID="BTNAsignar" runat="server" Text="Asignar"  
                            onclick="BTNAsignar_Click" style="margin-left:200px" ValidationGroup="1" 
                            Enabled="False" />
                     
                   
                      <asp:Button ID="BTNCancelar" runat="server" Text="Cancelar"  onclick="BTNCancelar_Click" />                  
               
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
                             runat="server" TargetControlID="LinkButton2" BackgroundCssClass="reveal-modal-bg" >
                            </asp:ModalPopupExtender>

                            
                    <span style="display: none">
                            <asp:LinkButton ID="LinkButton3" runat="server">LinkButton</asp:LinkButton>
                    </span>
                            <asp:ModalPopupExtender ID="ModalPopupExito" PopupControlID="popUpExito"
                             runat="server" TargetControlID="LinkButton3" BackgroundCssClass="reveal-modal-bg">
                            </asp:ModalPopupExtender>
                            
                    </ContentTemplate>
                </asp:UpdatePanel>
            
               
            </td>
            
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
        case "GVHistorialGR":
        gvControl =  "<%=GVHistorialGR.ClientID%>";       
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
    
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo" >
            <div class="heading">
                <asp:Label ID="Label13" runat="server" Text="¿Desea registrar la diagramación?" ></asp:Label>
                <br />
                </div >
                <div class="content" style="height:100px;border-top: 0.1px solid #bababa">
                <div style="margin-right:15px;text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" >
              
                <ContentTemplate>
              
                    <asp:Button ID="btnAceptarRegistrar" runat="server" Text="Aceptar" onclick="btnAceptarRegistrar_Click" CssClass="botonPopUp" />
                    <asp:Button ID="btnCancelarRegistrar" runat="server" Text="Cancelar" onclick="btnCancelarRegistrar_Click"/>
                 
                </ContentTemplate>
                    
                </asp:UpdatePanel>
                </div>
                </div>
            </asp:Panel>
    
    
    
     <asp:Panel ID="popUpCancelarRegistrar" runat="server" Style="display: none" CssClass="divFondo">
     <div style="float:left; width:40px; margin-left: 20px;margin-top: 3px;">
        <asp:Image ID="Image2" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="40px" />
    </div>
    <div class="heading" style="width:360px">
        <asp:Label ID="Label1" runat="server" Text="Se perderán los datos ingresados" style="margin-right:25px"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="¿Desea Continuar?"></asp:Label>
        </div>
        <div class="content" style="height:100px;border-top: 0.1px solid #bababa; width:360px">
        <div style="margin-right:15px;text-align: center">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <asp:Button ID="btnAceptarCancelacion" runat="server" Text="Aceptar" CausesValidation="False" onclick="btnAceptarCancelacion_Click" style="margin-top:50px"/>
            <asp:Button ID="btnCancelarCancelacion" runat="server" Text="Cancelar" CausesValidation="False" onclick="btnCancelarCancelacion_Click"/>
        </ContentTemplate>
        </asp:UpdatePanel>
        </div>
        </div>
    </asp:Panel>
  
    <asp:Panel ID="popUpExito" runat="server" Style="display: none" CssClass="divFondo">
    <div style="float:left; width:40px; margin-left: 20px;margin-top: 3px;">
        <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="40px" />
    </div>

     <div class="heading">
        <asp:Label ID="Label3" runat="server" Text="La Diagramación fue registrada con éxito" style="margin-right:15px"></asp:Label>
        <br />
        </div>
        <div class="content" style="height:100px;border-top: 0.1px solid #bababa">
        <div style="margin-right:15px;text-align: center">
        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
        <ContentTemplate>
            <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" CausesValidation="False" onclick="btnAceptarConfirmacion_Click"
            CssClass="botonPopUp" />        
        </ContentTemplate>
        </asp:UpdatePanel>
        </div>
        </div>
    </asp:Panel>
    
    
    
    
    
    
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
    
    
    
    
    
    
    
                
                    
    
    
    
    
    
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
    
    
    
    
    
    
    

    
    
    
    
    
    
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
    
    
    
    
    
    
    
                
                    
    
    
    
    
    
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
    
    
    
    
    
    
    
</asp:Content>

