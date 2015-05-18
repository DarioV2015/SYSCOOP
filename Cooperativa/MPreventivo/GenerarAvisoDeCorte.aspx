<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="GenerarAvisoDeCorte.aspx.cs" Inherits="MPreventivo_GenerarAvisoDeCorte"
    Title="Aviso de Corte" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Componentes.css" rel="stylesheet" type="text/css" />
    <link href="../Style/PopUp2.css" rel="stylesheet" type="text/css" />
    <link href="../Style/TabStyle2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #overlay {
    position: fixed;
    z-index: 99;
    top: 0px;
    left: 0px;
    background-color: #f8f8f8;
    width: 100%;
    height: 100%;
    filter: Alpha(Opacity=90);
    opacity: 0.9;
    -moz-opacity: 0.9;
}            
#theprogress {
    background-color: #bababa;
    border:1px solid #ccc;
    padding:10px;
    width: 300px;
    height: 30px;
    line-height:30px;
    text-align: center;
    filter: Alpha(Opacity=100);
    opacity: 1;
    -moz-opacity: 1;
}
#modalprogress {
    position: absolute;
    top: 40%;
    left: 50%;
    margin: -11px 0 0 -150px;
    color: #990000;
    font-weight:bold;
    font-size:14px;
}

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
        .hidden
        {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:TabContainer ID="tabconteiner1" runat="server" ActiveTabIndex="0" CssClass="TabStyle2"
                Style="margin-top: 10px">
                <asp:TabPanel ID="tabPanel1" runat="server" HeaderText="Cortes Programados">
                    <ContentTemplate>
                        <asp:Panel ID="Panel1" runat="server">
                            <table style="width: 830px; margin-top: 0px">
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvCortes" runat="server" AutoGenerateColumns="False" DataKeyNames="idcorte"
                                            DataSourceID="sdsCortes" CellPadding="4" ForeColor="#333333" GridLines="None"
                                            OnRowDataBound="gvCortes_RowDataBound" OnSelectedIndexChanged="gvCortes_SelectedIndexChanged" Width="960px"
                                            style="margin-bottom:10px">
                                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                            <Columns>
                                                <asp:TemplateField HeaderStyle-Width="40px">
                                                    <ItemTemplate>
                                                        <asp:RadioButton ID="gvCortes_rdbSeleccionado" runat="server" AutoPostBack="true"
                                                            OnCheckedChanged="rdbCorte_CheckedChanged" onclick="RadioCheckOnly(this);" />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="idcorte" HeaderText="Corte" ReadOnly="True" SortExpression="idcorte">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="45px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="motivo" HeaderText="Motivo" ReadOnly="True" 
                                                    SortExpression="Column1">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="185px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="fechaI" HeaderText="Fecha Inicio" ReadOnly="True" SortExpression="Column2">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="85px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="horaI" HeaderText="Hora Inicio" ReadOnly="True" SortExpression="Column3">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="85px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="fechaF" HeaderText="Fecha Fin" ReadOnly="True" SortExpression="Column4">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="horaF" HeaderText="Hora Fin" ReadOnly="True" SortExpression="Column5">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="duracion" HeaderText="Duración" ReadOnly="True" SortExpression="Column6">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="125px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="idsubestacion" HeaderText="Subestación" ReadOnly="True" 
                                                    SortExpression="idlinea">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="descripcion" HeaderText="Zona" SortExpression="descripcion">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="45px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="btnOcultarCorte" runat="server" CausesValidation="False" CommandName="Select"
                                                            ImageUrl="../Imagenes/cancelar.png" Width="20px" Style="margin-bottom: 3px" />
                                                        <%-- <asp:Button ID="btnOcultarCorte" runat="server" CausesValidation="False" CommandName="Select"
                                                Text="Cancelar" Width="80px"></asp:Button>--%>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="estiloFilasTabla" Width="30px"></ItemStyle>
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle CssClass="estiloHeaderTabla" />
                                        </asp:GridView>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblNoHayCortes" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:SqlDataSource ID="sdsCortes" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                                            ProviderName="System.Data.SqlClient" SelectCommand="select  cp.idcorte, cp.motivo as motivo, convert(char(10), cp.fechainicio, 103) as fechaI, convert(nvarchar(5), cp.horainicio, 108) as horaI,
convert(char(10), cp.fechafin, 103) as fechaF, convert(nvarchar(5), cp.horafin, 108) as horaF,DATEDIFF(minute,cp.fechainicio, cp.fechafin) as duracion,
 z.descripcion, s.idsubestacion
from corteprogramado cp,  subestacion s,  domicilio d, zona z
where s.iddomicilio = d.iddomicilio
and d.idzona = z.idzona
and cp.notificacion = 1
and s.idsubestacion = cp.idsubestacion
and cp.fechainicio &gt; CURRENT_TIMESTAMP"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="tabPanel2" runat="server" HeaderText="Detalle del Corte">
                    <ContentTemplate>
                        <asp:Panel ID="panelDetalle" runat="server" Visible="False">
                            <table style="margin-top:0px">
                                <tr>
                                    <td>
                                        <asp:SqlDataSource ID="sdsDetalleCorte" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                                            ProviderName="System.Data.SqlClient" SelectCommand="select distinct s.idsocio, p.apellido, p.nombre, p.email, m.idmedidor, c.nombre as calle, d.nrocalle, d.piso, d.dpto
from corteprogramado cp, linea l,subestacion sub, medidor m, socio s, persona p, calle c, domicilio d, zona z
where m.idlinea = l.idlinea
and cp.idsubestacion = sub.idsubestacion
and l.idsubestacion = sub.idsubestacion
and m.idsocio = s.idsocio
and m.iddomicilio = d.iddomicilio
and s.nrodocumento = p.nrodocumento
and s.idtipodocumento = p.tipodocumento
and d.idcalle = c.idcalle
and d.idzona = z.idzona
and cp.idcorte = @nroCorte">
                                            <SelectParameters>
                                                <asp:Parameter Name="nroCorte" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:GridView ID="grillaDetalleCorte" runat="server" AutoGenerateColumns="False"
                                            DataKeyNames="idsocio,idmedidor" DataSourceID="sdsDetalleCorte"
                                            CellPadding="4" ForeColor="#333333" GridLines="None" 
                                            OnRowDataBound="grillaDetalleCorte_RowDataBound" style=" margin-bottom:10px; margin-left:120px">
                                            <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                                            <Columns>
                                                <asp:BoundField DataField="idsocio" HeaderText="Socio" ReadOnly="True" 
                                                    SortExpression="idsocio">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="apellido" HeaderText="Apellido" 
                                                    SortExpression="apellido">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="email" HeaderText="Mail" SortExpression="email">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="idmedidor" HeaderText="Medidor" ReadOnly="True" 
                                                    SortExpression="idmedidor">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="calle" HeaderText="Calle" SortExpression="calle">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="75px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="nrocalle" HeaderText="Nº" SortExpression="nrocalle">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="piso" HeaderText="Piso" SortExpression="piso">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="dpto" HeaderText="Dpto." SortExpression="dpto">
                                                    <HeaderStyle CssClass="estiloHeaderTabla" Width="65px"></HeaderStyle>
                                                    <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                                                </asp:BoundField>
                                            </Columns>
                                            <HeaderStyle CssClass="estiloHeaderTabla" />
                                        </asp:GridView>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <table>
                <tr>
                    <td>
                        <asp:Button ID="btnEnviarMail" runat="server" Text="Enviar" OnClick="btnEnviarMail_Click"
                            Style="margin-left: 250px; margin-top: 20px" />
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <span style="display: none">
        <asp:LinkButton ID="lnkbtn_DummyLnkBtn" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopUpEnviar" PopupControlID="popUpConfirmacion"
        runat="server" TargetControlID="lnkbtn_DummyLnkBtn">
    </asp:ModalPopupExtender>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupCancelarEnvio" PopupControlID="popUpCancelarEnvio"
        runat="server" TargetControlID="LinkButton1">
    </asp:ModalPopupExtender>
    <span style="display: none">
        <asp:LinkButton ID="LinkButton2" runat="server">LinkButton</asp:LinkButton>
    </span>
    <asp:ModalPopupExtender ID="ModalPopupExito" PopupControlID="popUpExito" runat="server"
        TargetControlID="LinkButton2">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popUpConfirmacion" runat="server" Style="display: none" CssClass="divFondo">
        <div class="heading">
            <asp:Label ID="lblNoMedidores" runat="server" Text="¿Desea enviar los mails notificando sobre el corte?"></asp:Label>
            <br />
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAceptarEnvio" runat="server" Text="Aceptar" OnClick="btnAceptarEnvio_Click"
                            CssClass="botonPopUp" />
                        <asp:Button ID="btnCancelarEnvio" runat="server" Text="Cancelar" OnClick="btnCancelarEnvio_Click" />
                        <asp:UpdateProgress ID="prgLoadingStatus" runat="server" DynamicLayout="true">
    <ProgressTemplate>
        <div id="overlay">
            <div id="modalprogress">
                <div id="theprogress">
                    <asp:Image ID="imgWaitIcon" runat="server" ImageAlign="AbsMiddle" 
                        ImageUrl="~/Imagenes/wait.gif" />
                    <asp:Label runat="server"  ID="lblEspere" Text="Enviando mails espere..." 
                        ForeColor="#0066FF" /> 
                </div>
            </div>
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>  
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="popUpCancelarEnvio" runat="server" Style="display: none" CssClass="divFondo">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image2" runat="server" ImageUrl="../Imagenes/advertencia.png" Width="35px" />
        </div>
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label5" runat="server" Text="Se cancelará el envío de los mails" Style="margin-right: 25px"></asp:Label>
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
    <asp:Panel ID="popUpExito" runat="server" CssClass="divFondo" Width="400px">
        <div style="float: left; width: 40px; margin-left: 20px; margin-top: 3px;">
            <asp:Image ID="Image1" runat="server" ImageUrl="../Imagenes/confirmación.png" Width="36px" />
        </div>
        <div class="heading" style="width: 400px">
            <asp:Label ID="Label6" runat="server" Text="Se enviaron las notificaciones correspondientes"></asp:Label>
        </div>
        <div class="content" style="height: auto; border-top: 0.1px solid #bababa; text-align: center;
            width: 400px" align="center">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <asp:Label ID="Label1" runat="server" Style="margin-right: 26px" Text="Los siguientes socios no han sido notificados porque no tienen registrada una dirección de correo electrónico:"
                        Visible="False"></asp:Label>
                    <br />
                    <asp:GridView ID="grillaSociosSinMail" runat="server" AutoGenerateColumns="False"
                        HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4" ForeColor="#333333"
                        GridLines="None" Visible="False">
                        <Columns>
                            <asp:BoundField DataField="nombre" HeaderText="Nombre" ReadOnly="True" HeaderStyle-Width="60px"
                                ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="apellido" HeaderText="Apellido" ReadOnly="True" HeaderStyle-Width="250 px"
                                ItemStyle-CssClass="estiloHeaderTabla">
                                <HeaderStyle CssClass="estiloHeaderTabla" Width="90px"></HeaderStyle>
                                <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <asp:Label ID="lblSinMail" runat="server" Style="margin-right: 26px" Visible="False"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
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
        case "gvCortes":
        gvControl =  "<%=gvCortes.ClientID%>";       
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
