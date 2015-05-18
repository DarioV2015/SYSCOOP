<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="AsignarCuadrillaAOTP.aspx.cs" Inherits="MPreventivo_AsignarCuadrillaAOTP"
    Title="Página sin título" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
   
    <asp:TabContainer   ID="tabconteiner1" runat="server" ActiveTabIndex="0" 
     CssClass="TabStyle2">
     
    <asp:TabPanel ID= "tabPanel1" runat="server" HeaderText="Orden de Tabajo" Height="160px">
    <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server">
               <fieldset class="FieldDatos" style="height:auto; width:600px; 
                   margin-left:140px; margin-top:15px">
                   
               <legend class="legendDatos">Datos Actuales</legend>
                    <table width="400px" style="margin-left:7px" >
                    <tr>

                            <td  class="datos" width="85px">
                                <asp:Label ID="Label1" runat="server" Text="Descripción:" ></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblDescripcionOTP" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        </table>
                        <table width="400px" style="margin-bottom:20px">
                        <tr>
                            <td class="datos">
                                <asp:Label ID="Label2" runat="server"  Text="Fecha de Inicio:" ></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblFechaInicio" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        
                            <td class="datos">
                                <asp:Label ID="Label4" runat="server"  Text="Fecha de Fin:" ></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblFechaFin" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                    
                </table>
                </fieldset>
                </asp:Panel>
             </ContentTemplate>
             </asp:TabPanel>
             
              <asp:TabPanel ID= "tabPanel2" runat="server" HeaderText="Cuadrilla" style="height:160px">
              <ContentTemplate>
             <asp:Panel ID="Panel3" runat="server">
             
               <fieldset class="FieldDatos" style="height:auto; margin-left:140px; margin-top:15px; width:600px">
               <legend class="legendDatos">Cuadrillas Disponibles</legend>
                <table width="400px" style="margin-top:10px;  margin-left:100px; margin-bottom:10px">

                    <tr>
                        <td>
                            <asp:Label ID="lblNoCuadrillas" runat="server" Style="margin-right: 26px" Visible="false"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <asp:GridView ID="gvCuadrillasDisponibles" runat="server" AutoGenerateColumns="False"
                                HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                                GridLines="None" OnRowDataBound="gvCuadrillasDisponibles_RowDataBound" style="margin-top:10px">
                                 <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:RadioButton ID="gvCuadrillasDisponibles_rdbCuadrilla" runat="server" AutoPostBack="True"
                                                OnCheckedChanged="rdbCuadrilla_CheckedChanged" onclick="RadioCheckOnly(this); "
                                                Width="20px" />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="nroCuadrilla" HeaderText="Nro. Cuadrilla" ReadOnly="True"
                                        HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fechaInicio" HeaderText="Fecha Inicio" ReadOnly="True"
                                        HeaderStyle-Width="250 px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fechaFin" HeaderText="Fecha Fin" ReadOnly="True" HeaderStyle-Width="60px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="idEstado" ReadOnly="True" HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </td>

                        <td>
                            <asp:GridView ID="grillaDetalleCuadrilla" runat="server" AutoGenerateColumns="False"
                                DataKeyNames="idempleado" DataSourceID="sdsDetalleCuadrilla" HeaderStyle-CssClass="estiloHeaderTabla"
                                CellPadding="1" ForeColor="#333333" GridLines="None" Visible="False">
                                 <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="idempleado" HeaderText="Nro. Legajo" ReadOnly="True" HeaderStyle-Width="60px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nombre" HeaderText="Nombre" ReadOnly="True" HeaderStyle-Width="60px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="apellido" HeaderText="Apellido" ReadOnly="True" HeaderStyle-Width="60px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="descripcion" HeaderText="Cargo" ReadOnly="True" HeaderStyle-Width="60px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
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
                        <td>
                        </td>
                    </tr>
                </table>
                </fieldset> 
            </asp:Panel>
            </ContentTemplate>
            </asp:TabPanel>
<asp:TabPanel ID= "tabPanel3" runat="server" HeaderText="Historial de Cuadrilla" >
  <ContentTemplate>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

            <asp:Panel ID="panelHistoriales" runat="server" Visible = "false" style="display:inline-flex; margin-left:100px">
            <fieldset class="FieldDatos" style="height:auto; margin-bottom:20px; margin-top:15px">
            <legend class="legendDatos">En Servicio</legend>
                <table width="300px" style="margin-top:0px; margin-bottom:10px">
                   
                    <tr>
                        <td valign="top">
                            <asp:GridView ID="grillaHistorialNuevo" runat="server" AutoGenerateColumns="False"
                                HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                                GridLines="None" OnRowDataBound="grillaHistorialNuevo_RowDataBound">
                                 <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="nroCuadrilla" HeaderText="Cuadrilla" ReadOnly="True"
                                        HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fechaInicio" HeaderText="Fecha Inicio" ReadOnly="True"
                                        HeaderStyle-Width="250 px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fechaFin" HeaderText="Fecha Fin" ReadOnly="True" HeaderStyle-Width="60px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="idEstado" ReadOnly="True" HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </td>
                        </tr>
                        </table>
                        </fieldset>
                        
                        
                        <fieldset class="FieldDatos" style="height:auto; margin-left:20px; margin-bottom:20px; margin-top:15px">
                        <legend class="legendDatos">Disponible</legend>
                        <table style="margin-top:0px">
                        <tr>
                        <td valign="top">
                            <asp:GridView ID="grillaHistorialActualizado" runat="server" AutoGenerateColumns="False"
                                HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                                GridLines="None" OnRowDataBound="grillaHistorialActualizado_RowDataBound">
                                 <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="nroCuadrilla" HeaderText="Cuadrilla" ReadOnly="True"
                                        HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fechaInicio" HeaderText="Fecha Inicio" ReadOnly="True"
                                        HeaderStyle-Width="250 px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fechaFin" HeaderText="Fecha Fin" ReadOnly="True" HeaderStyle-Width="60px"
                                        ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="idEstado" ReadOnly="True" HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                        <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </td>
                        
                    </tr>
                </table>
                </fieldset>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
    </ContentTemplate>
    </asp:TabPanel>
    </asp:TabContainer>
    
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel2" runat="server">
                <table style="margin-top:45px; margin-left:250px">
                    <tr>
                        <td>
                            <asp:Button ID="btnAsignarCuadrilla" runat="server" Text="Asignar Cuadrilla" OnClick="btnAsignarCuadrilla_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnCancelarAsignar" runat="server" Text="Cancelar" OnClick="btnCancelarAsignarCuadrilla_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    
    
    <span style="display: none">
        <asp:LinkButton ID="LinkButton2" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopUpAsignar" runat="server" PopupControlID="popUpConfirmacion"
        TargetControlID="LinkButton2" BackgroundCssClass="reveal-modal-bg">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading">
            <asp:Label ID="lblNoMedidores" runat="server" Text="¿Desea asignar la Cuadrilla a la OTP?"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarAsignacion" runat="server" Text="Aceptar" OnClick="btnAceptarAsignacion_Click"
                            CssClass="botonPopUp" />
                        <asp:Button ID="btnCancelarAsignacion" runat="server" Text="Cancelar" OnClick="btnCancelarAsignacion_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton4" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupCancelarAsignar" runat="server" PopupControlID="popUpCancelarAsignar"
        TargetControlID="LinkButton4" BackgroundCssClass="reveal-modal-bg">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpCancelarAsignar" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image2" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="35px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label5" runat="server" Text="Se cancelará la asignación de la Cuadrilla"
                Style="margin-right: 25px"></asp:Label>
            <br />
            <asp:Label ID="Label16" runat="server" Text="¿Desea Continuar?"></asp:Label>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
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
    <span style="display: none">
        <asp:LinkButton ID="LinkButton3" runat="server"></asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupExito" runat="server" PopupControlID="popUpExito"
        TargetControlID="LinkButton3" BackgroundCssClass="reveal-modal-bg">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpExito" runat="server" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="40px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label6" runat="server" Text="Se asignó con éxito la Cuadrilla a la OTP"
                Style="margin-right: 26px"></asp:Label>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center">
                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" CausesValidation="False"
                            OnClick="btnAceptarConfirmacion_Click" Style="margin-top: 50px" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>

    <script type="text/javascript">
    
     function RadioCheckOnly(rbControl) {
     
      var gvName = rbControl.defaultValue.split('_')[0];
      var gvControl;
      
      switch (gvName)
      {
        case "gvCuadrillasDisponibles":
        gvControl =  "<%=gvCuadrillasDisponibles.ClientID%>";       
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

</asp:Content>
