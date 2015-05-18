<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true" CodeFile="RegistrarGuardiaReclamo.aspx.cs" Inherits="MCorrectivoSesion_RegistrarGrupoGuardiaReclamo" Title="SISE" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
        	margin-left:10px;
        }
         .margenTabla
        {
        	margin-right:450px;
        }
         .styleTitulo
        {
            height:10px;
            text-align:left;
            border-bottom-style: solid;
            border-width: 1px;
            border-bottom-color: rgb(192, 192, 165);
            border-width: 1px;
            font-family: "Source Sans Pro", Helvetica, Arial;
            font-weight:bold;
            font-size:12px;
            
        }
     .style8
     {
         width: 250px;
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table>
<tr>
     <td colspan="7" width="1800px" class="styleTitulo">
         <asp:Label ID="Label3" runat="server" Text="Empleados"></asp:Label>
     </td>
     </tr>
</table>
    
        <table style="margin-top:0px" >
        <tr>
            <td style="margin-top:0px">
                &nbsp;
                <asp:GridView ID="gvEmpleado" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="idempleado" DataSourceID="sdsEmpleado" HeaderStyle-CssClass="estiloHeaderTabla" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" style="margin-top:0px"
                    >
                    <RowStyle  BackColor="#E8EFF8" ForeColor="#333333" />
                     
                    <Columns>
                    <asp:TemplateField >
                      <ItemTemplate>
                         <asp:RadioButton ID="gvEmpleado_rdbSeleccionar" runat="server" 
                             oncheckedchanged="gvEmpleado_rdbSeleccionar_CheckedChanged" onclick="RadioCheckOnly(this);" Width="30px" />
                      </ItemTemplate>
                        <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>      
                    </asp:TemplateField>
                        <asp:BoundField DataField="idempleado" HeaderText="Legajo" ReadOnly="True" 
                            SortExpression="idempleado" HeaderStyle-Width="65px" 
                            ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="75px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="apellido" HeaderText="Apellido" 
                            SortExpression="apellido" HeaderStyle-Width="75px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="75px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                            SortExpression="nombre" HeaderStyle-Width="75px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="75px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="descripcion" HeaderText="Categoría" 
                            SortExpression="descripcion" HeaderStyle-Width="170px" ItemStyle-CssClass="estiloHeaderTabla">
                            <HeaderStyle CssClass="estiloHeaderTabla" Width="170px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        
                    
                    </Columns>
                 
                </asp:GridView>
                <asp:SqlDataSource ID="sdsEmpleado" runat="server" 
                    ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
                    ProviderName="System.Data.SqlClient" SelectCommand="select  e.idempleado, p.apellido, p.nombre, isnull (ce.descripcion,'Sin Asignar') descripcion
from persona p, empleado e left OUTER JOIN cargoempleado ce
on e.idcargo = ce.idcargoempleado
where e.nrodocumento = p.nrodocumento
and e.idtipodocumento = p.tipodocumento
and (e.idcargo in (2, 3) 
or e.idcargo is null)"></asp:SqlDataSource>
            </td>
           
        </tr>
        </table>
        <table>
        <tr>
            <td style="margin-top:20px; width:400px">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        
                        <asp:Button ID="btnRegistrar" runat="server" style="margin-left:100px; margin-top:15px" 
                            Text="Registrar" OnClick="btnRegistrar_Click" />
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CausesValidation="false" onclick="btnCancelar_Click"  />
                        <span style="display: none">
                        <asp:LinkButton ID="lnkbtn_DummyLnkBtn" runat="server">LinkButton</asp:LinkButton>
                        </span>
                        <asp:ModalPopupExtender ID="ModalPopupRegistrar" runat="server" PopupControlID="popUpConfirmacion" 
                         TargetControlID= "lnkbtn_DummyLnkBtn"  BackgroundCssClass= "reveal-modal-bg">
                        </asp:ModalPopupExtender>
                        <span style="display: none">
                            <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
                        </span>                        
                        <asp:ModalPopupExtender ID="ModalPopupCancelarRegistrar"   PopupControlID="popUpCancelarRegistrar" 
                        runat="server"  TargetControlID="LinkButton1"  BackgroundCssClass="reveal-modal-bg">
                        </asp:ModalPopupExtender>
                        <span style="display: none">
                            <asp:LinkButton ID="LinkButton2" runat="server">LinkButton</asp:LinkButton>
                        </span>
                        <asp:ModalPopupExtender ID="ModalPopupExito"  PopupControlID="popUpExito" runat="server"
                         TargetControlID="LinkButton2"  BackgroundCssClass="reveal-modal-bg">
                        </asp:ModalPopupExtender>
                          <span style="display: none">
                            <asp:LinkButton ID="LinkButton3" runat="server">LinkButton</asp:LinkButton>
                        </span>
                        <asp:ModalPopupExtender ID="ModalPopupCuadrilla" PopupControlID="popupCuadrilla" runat="server"
                         TargetControlID="LinkButton3" BackgroundCssClass="reveal-modal-bg">
                        </asp:ModalPopupExtender>

                    </ContentTemplate>
                </asp:UpdatePanel>
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
     <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo">
    <div class="heading">
        <asp:Label ID="Label5" runat="server" Text="¿Desea cambiar a la categoria 'Guardia-Reclamo'?"></asp:Label>
        <br />
        </div>
        <div class="content" style="height:100px;border-top: 0.1px solid #bababa">
        <div style="margin-right:15px;text-align: center;">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:Button ID="btnAceptarConfirmar" runat="server" Text="Aceptar" OnClick="btnAceptarConfirmar_Click" CssClass="botonPopUp"/>
                <asp:Button ID="btnCancelarConfirmar" runat="server" Text="Cancelar" OnClick="btnCancelarConfirmar_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="popUpCancelarRegistrar" runat="server" Style="display: none" CssClass="divFondo">
    <div style="float:left; width:40px; margin-left: 20px;margin-top: 3px;">
        <asp:Image ID="Image2" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="40px" />
    </div>
    <div class="heading" style="width:420px">
        <asp:Label ID="Label6" runat="server" Text="¿Está seguro que desea cancelar la registración?" style="margin-right:25px"></asp:Label>
        </div>
         <div class="content" style="height:100px;border-top: 0.1px solid #bababa; width:420px">
        <div style="margin-right:15px;text-align: center">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <asp:Button ID="btnAceptarCancelacion" runat="server" Text="Aceptar" CausesValidation="False"
                    OnClick="btnAceptarCancelacion_Click" style="margin-top:35px"/>
                <asp:Button ID="btnCancelarCancelacion" runat="server" Text="Cancelar" CausesValidation="False"
                    OnClick="btnCancelarCancelacion_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="popUpExito" runat="server" Style="display: none" CssClass="divFondo">
    <div style="float:left; width:40px; margin-left: 20px;margin-top: 3px;">
        <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="35px" />
    </div>
    <div class="heading" style="width:400px">
        <asp:Label ID="Label7" runat="server" Text="El Guardia Reclamo fue registrado con éxito" style="margin-right:15px"></asp:Label>
       
        </div>
         <div class="content" style="height:100px;border-top: 0.1px solid #bababa; width:400px">
        <div style="margin-right:15px;text-align: center">
        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
            <ContentTemplate>
                <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" CausesValidation="False"
                    OnClick="btnAceptarConfirmacion_Click" CssClass="botonPopUp" />
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
        </div>
    </asp:Panel>
     <asp:Panel ID="popupCuadrilla" runat="server" Style="display: none" CssClass="divFondo">
    <div style="float:left; width:40px; margin-left: 20px;margin-top: 3px;">
        <asp:Image ID="Image3" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="35px" />
    </div>
    <div class="heading" style="width:430px">
        <asp:Label ID="Label1" runat="server" Text="El Oficial Electricista se quitará de su Cuadrilla" style="margin-right:15px"></asp:Label>
       
        </div>
         <div class="content" style="height:100px;border-top: 0.1px solid #bababa; width:430px">
        <div style="margin-right:15px;text-align: center">
        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
            <ContentTemplate>
                <asp:Button ID="btnAceptarConfirmacionCuadrilla" runat="server" Text="Aceptar" CausesValidation="False"
                    OnClick="btnAceptarConfirmacionCuadrilla_Click" CssClass="botonPopUp" />
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
        case "gvEmpleado":
        gvControl =  "<%=gvEmpleado.ClientID%>";       
        break;       
      }
            
      var gv = document.getElementById(gvControl);
      var rbs = gv.getElementsByTagName("input");
      var row = rbControl.parentNode.parentNode.parentNode;
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

