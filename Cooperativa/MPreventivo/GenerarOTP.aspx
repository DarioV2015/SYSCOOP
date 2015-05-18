<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="GenerarOTP.aspx.cs" Inherits="MPreventivo_GenerarOTP" Title="Generar Orden de Trabajo Preventivo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
     .hidden
     {
         display:none;
     }
</style>
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
    <script type="text/javascript">
    
     function RadioCheckOnly(rbControl) {
     
      var gvName = rbControl.defaultValue.split('_')[0];
      var gvControl;
      
      switch (gvName)
      {
        case "gvTareasPlanificadas":
        gvControl =  "<%=gvTareasPlanificadas.ClientID%>";       
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
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

 <asp:TabContainer   ID="tabconteiner1" runat="server" ActiveTabIndex="0" 
     CssClass="TabStyle2" style="margin-top:10px">
    <asp:TabPanel ID= "tabPanel1" runat="server" HeaderText="Tareas Planificadas" >
        <HeaderTemplate>
            Tareas Planificadas
        </HeaderTemplate>
    <ContentTemplate>

    <table style="margin-top:0px" width="800px">
        <tr>
            <td>
                <asp:Label ID="lblNoExiste" runat="server"></asp:Label>
                <asp:GridView ID="gvTareasPlanificadas" runat="server" 
                    AutoGenerateColumns="False" CellPadding="4"
                    ForeColor="#333333" GridLines="None" Width="950px">
                    <HeaderStyle CssClass="estiloHeaderTabla" />
                    <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:RadioButton ID="gvTareasPlanificadas_rdbSeleccionado" runat="server" AutoPostBack="True"
                                    onclick="RadioCheckOnly(this);" />
                            </ItemTemplate>
                            <ItemStyle CssClass="estiloFilasTabla" Width="30px"></ItemStyle>
                        </asp:TemplateField>              
                        <asp:BoundField DataField="FechaCreacion" HeaderText="Fecha De Creacion">
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Nombre" HeaderText="Tarea">
                         <HeaderStyle CssClass="estiloHeaderTabla" Width="85px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="TiempoEstimado" HeaderText="Tpo Estimado" Visible="False">
                         <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="prioridad" HeaderText="Prioridad">
                         <HeaderStyle CssClass="estiloHeaderTabla" Width="45px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField >
                        <asp:TemplateField HeaderText="Asunto">
                            <ItemTemplate>
                                <asp:Label ID="lblAsunto" Text='<%# Eval("asunto") %>' runat="server" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="150px" />
                            <ItemStyle CssClass="estiloFilasTabla" Width="150px"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="zona" HeaderText="Zona">
                        <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField >
                         <asp:TemplateField HeaderText="Duración (Días)">
                            <ItemTemplate>
                                <asp:Label ID="lblDuracion" Text='<%# Eval("Duracion") %>' runat="server" />
                            </ItemTemplate>
                             <HeaderStyle CssClass="estiloHeaderTabla" />
                            <ItemStyle CssClass="estiloFilasTabla" Width="30px"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha Inicio">
                            <ItemTemplate>
                                <asp:Label ID="lblFechaInicio" Text='<%# Eval("fechainicio", "{0:dd/MM/yyyy}") %>' runat="server" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="estiloHeaderTabla" />
                            <ItemStyle CssClass="estiloFilasTabla" Width="30px"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha Fin">
                            <ItemTemplate>
                                <asp:Label ID="lblFechaFin" Text='<%# Eval("fechafin", "{0:dd/MM/yyyy}") %>' runat="server" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="estiloHeaderTabla" />
                            <ItemStyle CssClass="estiloFilasTabla" Width="30px"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="idtareaplanificada">
                            <ItemTemplate>
                                <asp:Label ID="lblIdTareaPlanificada" Text='<%# Eval("idtareaplanificada") %>' runat="server" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnAsignarCuadrilla" runat="server" Text="Asignar Cuadrilla" OnClick="btnAsignarCuadrilla_Click" style="margin-top:10px; margin-left:400px" />
            </td>
        </tr>
        <tr>
            <td height="10px">
            </td>
        </tr>
        </table>
        </ContentTemplate>
    </asp:TabPanel>
     <asp:TabPanel ID= "tabPanel2" runat="server" HeaderText="Cuadrilla" >
    <ContentTemplate>
    <fieldset class="FieldDatos" style="height:auto; width:600px; margin-left:100px; margin-bottom:20px">
    <legend class="legendDatos"> Asignada</legend>
        <table style="margin-top:0px; margin-left:70px; margin-bottom:10px">
       
        <tr>
            <td>
                <asp:GridView ID="grillaDetalleCuadrilla" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="idempleado" DataSourceID="sdsDetalleCuadrilla"
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    style="margin-top:10px">
                    <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="idempleado" HeaderText="Nro. Legajo" ReadOnly="True">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" ReadOnly="True">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="apellido" HeaderText="Apellido" ReadOnly="True">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="descripcion" HeaderText="Cargo" ReadOnly="True">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle CssClass="estiloHeaderTabla" />
                </asp:GridView>
                <asp:SqlDataSource ID="sdsDetalleCuadrilla" runat="server" ConnectionString="<%$ ConnectionStrings:SISEConnectionString %>"
                    SelectCommand="select distinct e.idempleado, p.nombre, p.apellido, ce.descripcion
from historialcuadrilla hc with(NOLOCK), empleado e with(NOLOCK), empleadoporcuadrilla epc with(NOLOCK),
persona p with(NOLOCK), cargoempleado ce with(NOLOCK)
where hc.idcuadrilla = epc.idcuadrilla
and epc.idempleado = e.idempleado
and e.nrodocumento = p.nrodocumento
and e.idtipodocumento = p.tipodocumento
and e.idcargo = ce.idcargoempleado
and hc.idcuadrilla = @nroCuadrilla">
                    <SelectParameters>
                        <asp:Parameter Name="nroCuadrilla" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
    </fieldset>
    </ContentTemplate>
    </asp:TabPanel>
    </asp:TabContainer>
    <table>
    <tr>
            <td>
                <asp:Button ID="btnRegistrar" runat="server" onclick="btnRegistrar_Click" 
                    Text="Registrar" style="margin-left:350px; margin-top:30px"/>
                     <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" 
                    onclick="btnCancelar_Click" />
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
            <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="40px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label6" runat="server" Text="Se ha generado la Orden de Trabajo"></asp:Label>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <asp:Label ID="lblMensaje" runat="server"  Text=""></asp:Label>
                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center">
                <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" CausesValidation="False"
                    Style="margin-top: 50px" onclick="btnAceptarConfirmacion_Click" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
