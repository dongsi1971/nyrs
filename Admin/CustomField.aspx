<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomField.aspx.cs" Inherits="nyrs.Admin.CustomField" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>两会推动查询管理系统</title>
          <link href="../Styles/Site.css" type="text/css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="right">
    <div class="editlayer">
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
    	<tr>
    		<td>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="ChuangShuo">创说会表</asp:ListItem>
                    <asp:ListItem Value="TwoMeeting">两会合一表</asp:ListItem>
                    <asp:ListItem Value="CustomerInfo">客户档案表</asp:ListItem>
                </asp:DropDownList>
            </td>
    	</tr>
        <tr>
        <td>
         <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" 
            EnableModelValidation="True" AutoGenerateColumns="False" BackColor="White" 
                BorderColor="#999999" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" 
                CellSpacing="1" GridLines="None" DataKeyNames="CustomFieldID">
             <Columns>
                 <asp:CommandField ShowEditButton="True" EditText="编辑" />
                 <asp:BoundField DataField="DefaultName" HeaderText="默认名称" ReadOnly="True" 
                     SortExpression="DefaultName" />
                 <asp:BoundField DataField="CustomName" HeaderText="自定义名称" 
                     SortExpression="CustomName" />
                 <asp:CheckBoxField DataField="IsEdit" HeaderText="可否编辑" 
                     SortExpression="IsEdit" />
                 <asp:CheckBoxField DataField="IsVisible" HeaderText="可否显示" 
                     SortExpression="IsVisible" />
                 <asp:CheckBoxField DataField="IsImport" HeaderText="可否导出" 
                     SortExpression="IsImport" />
             </Columns>
             <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="#E7E7FF" />
             <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
             <RowStyle BackColor="#E0FFFF" ForeColor="Black" />
             <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
                SelectCommand="SELECT ColumnName, DefaultName, CustomName, IsEdit, IsVisible, IsImport, CustomFieldID FROM CustomField WHERE (TableName = ?)" 
                
                UpdateCommand="UPDATE CustomField SET CustomName = ?, IsEdit = ?, IsVisible = ?, IsImport = ? WHERE (CustomFieldID = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="tableName" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            </asp:SqlDataSource>
        </td>
        </tr>
    </table>
       
    </div>
    </div>
    </form>
</body>
</html>
