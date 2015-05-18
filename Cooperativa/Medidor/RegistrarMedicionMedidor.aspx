<%@ Page Language="C#" MasterPageFile="~/MasterPrincipal2.master" AutoEventWireup="true"
    CodeFile="RegistrarMedicionMedidor.aspx.cs" Inherits="Medidor_RegistrarMedicionMedidor"
    Title="Registrar Medicion Medidor" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<fieldset class="FieldDatos" style="width:700px; margin-top:10px; margin-left:100px">
<legend class="legendDatos">Cargar Medición</legend>
    <table style="width: 100%;">
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
                <asp:FileUpload ID="FileUploadControl" runat="server" BorderColor="#C7C7C7" BorderStyle="Solid"
                    BorderWidth="1px" Style="font-family: Calibri, Source Sans Pro; margin-left:60px; margin-top:20px" Font-Size="15px" />
                <asp:Button runat="server" ID="UploadButton" Text="Cargar" OnClick="UploadButton_Click" />
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        </table>
        </fieldset>
        <fieldset class="FieldDatos" style="margin-left:100px; width:700px">
        <legend class="legendDatos">Mediciones</legend>
        <table>
        <tr>
            <td>
               
                <asp:GridView ID="gvMediciones" runat="server" AutoGenerateColumns="False"
                HeaderStyle-CssClass="estiloHeaderTabla" CellPadding="4"
                    ForeColor="#333333" GridLines="None" style="margin-top:0px">
                    <RowStyle BackColor="#E8EFF8" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField HeaderText="Ruta" DataField="NRORUTA" 
                        HeaderStyle-Width="85px" ItemStyle-CssClass="estiloHeaderTabla">
                        <HeaderStyle CssClass="estiloHeaderTabla" Width="85px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Numero Medidor" DataField="NROCUENTA" 
                        HeaderStyle-Width="95px" ItemStyle-CssClass="estiloHeaderTabla">
                        <HeaderStyle CssClass="estiloHeaderTabla" Width="95px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Secuencia" DataField="SECUENCIA" 
                        HeaderStyle-Width="85px" ItemStyle-CssClass="estiloHeaderTabla">
                        <HeaderStyle CssClass="estiloHeaderTabla" Width="85px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Estado Leido" DataField="ESTADO" 
                        HeaderStyle-Width="85px" ItemStyle-CssClass="estiloHeaderTabla">
                       <HeaderStyle CssClass="estiloHeaderTabla" Width="85px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField> 
                        <asp:BoundField HeaderText="Fecha Lectura" DataField="FECHA" 
                        HeaderStyle-Width="85px" ItemStyle-CssClass="estiloHeaderTabla">
                        <HeaderStyle CssClass="estiloHeaderTabla" Width="85px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Hora Lectura" DataField="HORA" 
                        HeaderStyle-Width="85px" ItemStyle-CssClass="estiloHeaderTabla">
                        <HeaderStyle CssClass="estiloHeaderTabla" Width="85px"></HeaderStyle>
                            <ItemStyle CssClass="estiloFilasTabla"></ItemStyle>
                        </asp:BoundField>
                        <%--      <asp:BoundField HeaderText="Novedades" DataField="NOVEDADES"/>
                        <asp:BoundField HeaderText="Domicilio Corregido" DataField="DOMICILIOCORREGIDO"/>
                        <asp:BoundField HeaderText="Numero Medidor Corregido" DataField="NROMEDIDORCORREGIDO"/>--%>
                    </Columns>
                </asp:GridView>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        </table>
        </fieldset>
        <table>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
                <table style="width: 100%;">
                    <tr>
                        <td width="80px">
                            <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click"
                                Style="margin-left: 270px" />
                        </td>
                        <td>
                            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar"  OnClick="btnCancelar_Click"/>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                &nbsp;
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
        <div class="heading" style="width: 360px">
            <asp:Label ID="Label6" runat="server" Text="Desea Registar los consumos cargados?" style="margin-right:20px"></asp:Label>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                <ContentTemplate>

                    <asp:Label ID="lblMensaje" runat="server" Style="margin-right: 26px" Text=""></asp:Label>

                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="content" style="height: 100px; border-top: 0.1px solid #bababa">
            <div style="margin-right: 15px; text-align: center">
                <asp:Button ID="btnAceptarConfirmacion" runat="server" Text="Aceptar" CausesValidation="False"
                    Style="margin-top: 30px" onclick="btnAceptarConfirmacion_Click" />
                <asp:Button ID="Button1" runat="server" Text="Cancelar" CausesValidation="False"
                    Style="margin-top: 30px" onclick="btnCancelarConfirmacion_Click" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
