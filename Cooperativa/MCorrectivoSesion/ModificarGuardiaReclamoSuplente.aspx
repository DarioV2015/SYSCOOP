<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true" CodeFile="ModificarGuardiaReclamoSuplente.aspx.cs" Inherits="MCorrectivoSesion_ModificarGuardiaReclamoSuplente" Title="Página sin título" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
<link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />

 <style type="text/css">
       
        .datos
        {
        	text-align: right;
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
         width: 100%;
     }

 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="4px" style="margin-top:5px" >
    
        <tr>
            <td class="datos">
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <table class="style9">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="Mes:"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DDLMes" runat="server" AutoPostBack="True" 
                                        onselectedindexchanged="DDLMes_SelectedIndexChanged">
                                        <asp:ListItem Selected="True">Seleccionar</asp:ListItem>
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
                                <td>
                                    <asp:Label ID="lblMensajeMes" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text="Año:"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DDLAño" runat="server" AutoPostBack="True" 
                                        Enabled="False" onselectedindexchanged="DDLAño_SelectedIndexChanged">
                                        <asp:ListItem Selected="True">Seleccionar</asp:ListItem>
                                        <asp:ListItem>2016</asp:ListItem>
                                        <asp:ListItem>2015</asp:ListItem>
                                        <asp:ListItem>2014</asp:ListItem>
                                        <asp:ListItem>2013</asp:ListItem>
                                        <asp:ListItem>2012</asp:ListItem>
                                        <asp:ListItem>2011</asp:ListItem>
                                        <asp:ListItem>2010</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="lblMesnajeAño" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
           
        </tr>

        
     
    </table>        
  
    <table style="margin-top:0px; margin-left:45px">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                    <ContentTemplate>
                        <table class="style9">
                            <tr>
                                <td>
                                    <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GVGuardiaSuplente" runat="server" AutoGenerateColumns="False" 
                                        DataKeyNames="IDEMPLEADO" DataSourceID="SDSGuardiaSuplente" Visible="False"
                                        HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <RowStyle  BackColor="#E8EFF8" ForeColor="#333333" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:RadioButton ID="GVGuardiaSuplente_rdbSeleccionar" runat="server" 
                                                        oncheckedchanged="GVGuardiaSuplente_rdbSeleccionar_CheckedChanged" 
                                                        onclick="RadioCheckOnly(this);" Width="30px" />
                                                </ItemTemplate>
                                                <ItemStyle CssClass="estiloFilasTabla" Width="30px" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="IDEMPLEADO" HeaderText="Legajo" ReadOnly="True" 
                                                SortExpression="IDEMPLEADO" HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                 <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                            <asp:BoundField DataField="APELLIDO" HeaderText="Apellido" 
                                                SortExpression="APELLIDO" HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                 <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                            <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" 
                                                SortExpression="NOMBRE" HeaderStyle-Width="60px" ItemStyle-CssClass="estiloHeaderTabla">
                                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                                 <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                
                                        </Columns>
                                        <EmptyDataTemplate>
                                            <asp:RadioButton ID="GVGuardiaSuplente_rdbSeleccionar" runat="server" 
                                                Width="30px" />
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <asp:SqlDataSource ID="SDSGuardiaSuplente" runat="server" 
            ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True" 
            ProviderName="System.Data.SqlClient" SelectCommand="SELECT E.IDEMPLEADO, P.APELLIDO, P.NOMBRE
FROM EMPLEADO E, PERSONA P
WHERE E.IDTIPODOCUMENTO = P.TIPODOCUMENTO
AND E.NRODOCUMENTO = P.NRODOCUMENTO
AND E.IDCARGO = 2
AND E.IDEMPLEADO NOT IN (SELECT HE1.IDEMPLEADO 
FROM HISTORIALEMPLEADO HE1 
WHERE MONTH(HE1.FECHAINICIO) = @mes 
AND YEAR(HE1.FECHAINICIO) = @año)" >
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLMes" Name="mes" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DDLAño" Name="año" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </table>
    <table>
       <tr>
       <td class="style40">
       
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="BTNAsignar" runat="server" Text="Asignar" 
                            style="margin-left:90px; margin-top:20px" onclick="BTNAsignar_Click" Enabled="False" />
                        <asp:Button ID="Button2" runat="server" Text="Cancelar" onclick="Button2_Click" />                  
                   
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
       
       
       
       
       
       
       
           
       
       </table>

  








       
       
        <script type="text/javascript">
    
     function RadioCheckOnly(rbControl) {
     
      var gvName = rbControl.defaultValue.split('_')[0];
      var gvControl;
      
      switch (gvName)
      {
        case "GVGuardiaSuplente":
        gvControl =  "<%=GVGuardiaSuplente.ClientID%>";       
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
                <asp:Label ID="Label2" runat="server" Text="¿Desea registrar la diagramación del GR Suplente?" ></asp:Label>
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
        <asp:Label ID="Label4" runat="server" Text="Se perderán los datos ingresados" style="margin-right:25px"></asp:Label>
        <br />
        <asp:Label ID="Label7" runat="server" Text="¿Desea Continuar?"></asp:Label>
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

     <div class="heading" style="width:370px">
        <asp:Label ID="Label5" runat="server" Text="Se ha Diagramado el GR Suplente con éxito" style="margin-right:15px"></asp:Label>
        <br />
        </div>
        <div class="content" style="height:100px;border-top: 0.1px solid #bababa; width:370px">
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

