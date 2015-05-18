<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ConsultarMedicionMedidor.aspx.cs" Inherits="Medidor_ConsultarMedicionMedidor"
    Title="Consultar Medición Medidor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style2
        {
        }
        .style3
        {
            width: 132px;
            height: 95px;
        }
        .style4
        {
            height: 95px;
        }
        .style5
        {
            height: 95px;
            width: 153px;
        }
        .style6
        {
            width: 153px;
        }
        .style7
        {
            height: 171px;
        }
        .style8
        {
            height: 17px;
        }
        .style9
        {
            width: 153px;
            height: 17px;
        }
        .style10
        {
            height: 144px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 95%; height: 707px;">
        <tr>
            <td class="style3">
                <asp:RadioButtonList ID="rbl_Consultar" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rbl_Consultar_SelectedIndexChanged">
                    <asp:ListItem>Zona</asp:ListItem>
                    <asp:ListItem>Socio</asp:ListItem>
                    <asp:ListItem>Medidor</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="style5" colspan="2">
                <asp:TextBox ID="txtBuscar" runat="server" Visible="False"></asp:TextBox>
                <asp:DropDownList ID="ddlPrioridad" runat="server" AutoPostBack="True" DataSourceID="sdsZonaMostrar"
                    DataTextField="DESCRIPCION" DataValueField="IDZONA" Visible="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsZonaMostrar" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                    ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [ZONA]"></asp:SqlDataSource>
            </td>
            <td class="style4">
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
            </td>
        </tr>
        <tr>
            <td class="style7" colspan="2">
                <asp:Panel ID="Panel1" runat="server" Height="165px" Width="299px">
                    <asp:GridView ID="gvZona" runat="server" AutoGenerateColumns="False" DataSourceID="sdsZona"
                        OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="nombre" HeaderText="nombre" ReadOnly="True" SortExpression="nombre" />
                            <asp:BoundField DataField="apellido" HeaderText="apellido" ReadOnly="True" SortExpression="apellido" />
                            <asp:BoundField DataField="calle" HeaderText="calle" ReadOnly="True" SortExpression="calle" />
                            <asp:BoundField DataField="nro" HeaderText="nro" ReadOnly="True" SortExpression="nro" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:RadioButton ID="gvZona_rdbSeleccionado" runat="server" AutoPostBack="True" OnCheckedChanged="rdbSeleccionado_CheckedChanged" onclick="RadioCheckOnly(this);" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sdsZona" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=SISE;Integrated Security=True"
                        ProviderName="System.Data.SqlClient" SelectCommand="SELECT busq.id, busq.nombre, busq.apellido, busq.calle, busq.nro FROM 
(
select (m.idmedidor) id, (p.nombre) nombre, (p.apellido) apellido, (c.nombre) calle, (d.nrocalle) nro 
from socio s, persona p, domicilio d, medidor m, calle c
where s.idtipodocumento=p.tipodocumento
and s.nrodocumento= p.nrodocumento
and d.iddomicilio=m.iddomicilio
and m.idsocio=s.idsocio
and d.idcalle=c.idcalle
and m.idzona=@idzona
union
select (m.idmedidor) id, (se.razonsocial) nombre, (null) apellido, (c.nombre) calle, (d.nrocalle) nro
from socioempresa se, domicilio d, medidor m, calle c
where m.iddomicilio= d.iddomicilio
and m.idsocio=se.idsocio
and m.idsocio=se.idsocio
and d.idcalle=c.idcalle
and m.idzona=@idzona
)BUSQ">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlPrioridad" DefaultValue="0" Name="idzona" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
            </td>
            <td class="style7" colspan="2">
                &nbsp;
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style6" colspan="2">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="4">
                <asp:Panel ID="Panel2" runat="server" Height="173px">
                    <asp:SqlDataSource ID="sdsSocio" runat="server"></asp:SqlDataSource>
                    <asp:GridView ID="GridView2" runat="server">
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="style8">
                <asp:Panel ID="Panel3" runat="server" Height="170px">
                    <asp:SqlDataSource ID="sdsMedidor" runat="server"></asp:SqlDataSource>
                    <asp:GridView ID="GridView3" runat="server">
                    </asp:GridView>
                </asp:Panel>
            </td>
            <td class="style9" colspan="2">
            </td>
            <td class="style8">
            </td>
        </tr>
        <tr>
            <td class="style10" colspan="4">
                &nbsp;
            </td>
        </tr>
    </table>

    <script type="text/javascript">
    
     function RadioCheckOnly(rbControl) {
     
      var gvName = rbControl.defaultValue.split('_')[0];
      var gvControl;
      
      switch (gvName)
      {
        case "gvZona":
        gvControl =  "<%=gvZona.ClientID%>";       
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


