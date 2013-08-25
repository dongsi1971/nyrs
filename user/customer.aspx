<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer.aspx.cs" Inherits="nyrs.user.customer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>两会推动查询管理系统</title>
          <link href="../Styles/Site.css" type="text/css" rel="Stylesheet" />
          <script language="javascript" for="document" event="onkeydown">
  if(event.keyCode==13)
     event.keyCode=9;
           </script>
</head>
<body>
    <form id="form1" runat="server">
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxToolkit:ToolkitScriptManager>
    <div class="right">
    <div class="editlayer">
    <table border="0" cellspacing="0" cellpadding="0" width="100%" 
            style="background-color: #E0FFFF;color: #333333;">
    	<tr>
    		<td width="100%" height="230px" valign="top">
            <div style="overflow: scroll">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="CustomerID,MeetTitleID,YwyID,ClientTypeID" 
                    DataSourceID="SqlDataSource1" EnableModelValidation="True" 
                    ondatabound="GridView1_DataBound" onrowdatabound="GridView1_RowDataBound" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="选择" />
                        <asp:BoundField DataField="YwyName" HeaderText="YwyName" 
                            SortExpression="YwyName" />
                        <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" 
                            SortExpression="CustomerName" />
                        <asp:BoundField DataField="clientType" HeaderText="clientType" 
                            SortExpression="clientType" />
                        <asp:BoundField DataField="Meettitle" HeaderText="Meettitle" 
                            SortExpression="Meettitle" />
                        <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex" />
                        <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                        <asp:TemplateField HeaderText="Worked" SortExpression="Worked">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Worked") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="TLWorked" runat="server" Text='<%# Bind("Worked") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="TLPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Yqd" HeaderText="Yqd" 
                            SortExpression="Yqd" />
                        <asp:BoundField DataField="Hshbf" HeaderText="Hshbf" SortExpression="Hshbf" />
                        <asp:BoundField DataField="Hfqk" HeaderText="Hfqk" SortExpression="Hfqk" />
                        <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="TLRemark" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Field1" SortExpression="Field1">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Field1") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="TLField1" runat="server" Text='<%# Bind("Field1") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Field2" SortExpression="Field2">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Field2") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="TLField2" runat="server" Text='<%# Bind("Field2") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Field3" SortExpression="Field3">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Field3") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="TLField3" runat="server" Text='<%# Bind("Field3") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
                    
                    SelectCommand="SELECT YwyInfo.YwyName, CustomerInfo.CustomerName, CustomerInfo.CreateDate, Meettitle.Meettitle,  CustomerInfo.Sex, CustomerInfo.Age, CustomerInfo.Worked, CustomerInfo.Phone, CustomerInfo.Yqd, CustomerInfo.Hshbf, CustomerInfo.Hfqk, CustomerInfo.Remark, CustomerInfo.Field1, CustomerInfo.Field2, CustomerInfo.Field3, CustomerInfo.OperatorID, CustomerInfo.CustomerID, CustomerInfo.MeetTitleID, CustomerInfo.YwyID, CustomerInfo.ClientTypeID, ClientType.clientType FROM CustomerInfo INNER JOIN YwyInfo ON CustomerInfo.YwyID = YwyInfo.YwyID INNER JOIN Meettitle ON CustomerInfo.MeetTitleID = Meettitle.MeetTitleID INNER JOIN ClientType ON CustomerInfo.ClientTypeID = ClientType.ClientTypeID WHERE (CustomerInfo.OperatorID = ?) order by CustomerInfo.CreateDate desc">
                    <SelectParameters>
                        <asp:SessionParameter Name="OperatorID" SessionField="OperatorID" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
    	</tr>
        <tr>
    		<td>
             <div class="toolbar">
            
            <asp:Button ID="BDelete" runat="server" Text="删除" onclick="BDelete_Click" 
                UseSubmitBehavior="False" 
                 />
                 <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="BDelete" ConfirmText="确实要删除记录吗？">
            </ajaxToolkit:ConfirmButtonExtender>
            <asp:Button ID="BSave" runat="server" Text="保存" onclick="BSave_Click" 
                UseSubmitBehavior="False" ValidationGroup="newvalue" />
        </div>
        <div align="center">
        
        <table border="1" cellspacing="0" cellpadding="0" width="95%">
        	<tr>
        		<td  style="text-align: right">
                    <asp:Label ID="LywyName" runat="server" Text="业务员姓名"></asp:Label>
                    *</td>
                <td style="text-align: left">
                    <ajaxToolkit:ComboBox ID="ywyID" runat="server" 
                        DataSourceID="SqlDataSource2" DataTextField="YwyName" DataValueField="YwyID" 
                        DropDownStyle="DropDownList" MaxLength="0" style="display: inline;">
                    </ajaxToolkit:ComboBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="ywyID" ErrorMessage="*" ValidationGroup="newvalue"></asp:RequiredFieldValidator>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
                        
                        SelectCommand="SELECT YwyName, YwyCode, YwyID FROM YwyInfo WHERE (OrganizeID = ?) ORDER BY YwyName">
                        <SelectParameters>
                            <asp:SessionParameter Name="OrganizeID" SessionField="OrganizeID" 
                                Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                    
                    </td>
                <td  style="text-align: right">
                    <asp:Label ID="LCustomerName" runat="server" Text="客户姓名"></asp:Label>
                    *</td>
                <td style="text-align: left">
                    <asp:TextBox ID="CustomerName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="CustomerName" ErrorMessage="*" 
                        ValidationGroup="newvalue" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
        	</tr>
            <tr>
        		<td width="20%" style="text-align: right">
                    <asp:Label ID="LCustomerType" runat="server" Text="客户类别"></asp:Label>
                    *</td>
                <td style="text-align: left">
                    <asp:DropDownList ID="ClientTypeID" runat="server" 
                        DataSourceID="SqlDataSource3" DataTextField="clientType" 
                        DataValueField="ClientTypeID">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="ClientTypeID" ErrorMessage="*" ValidationGroup="newvalue"></asp:RequiredFieldValidator>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
                        SelectCommand="SELECT [ClientTypeID], [clientType] FROM [ClientType]">
                    </asp:SqlDataSource>
                </td>
                <td width="20%" style="text-align: right">
                    <asp:Label ID="LMeettitle" runat="server" Text="举办主题"></asp:Label>
                    *</td>
                <td style="text-align: left">
                    <asp:DropDownList ID="MeetTitleID" runat="server" DataSourceID="SqlDataSource4" 
                        DataTextField="Meettitle" DataValueField="MeetTitleID">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="MeetTitleID" ErrorMessage="*" ValidationGroup="newvalue"></asp:RequiredFieldValidator>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
                        SelectCommand="SELECT [MeetTitleID], [Meettitle] FROM [Meettitle]">
                    </asp:SqlDataSource>
                </td>
        	</tr>
            <tr>
        		<td width="20%" style="text-align: right">
                    <asp:Label ID="LSex" runat="server" Text="性别"></asp:Label>
                    *</td>
                <td style="text-align: left">
                    <asp:DropDownList ID="Sex" runat="server">
                        <asp:ListItem Value="0">男</asp:ListItem>
                        <asp:ListItem Value="1">女</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="Sex" ErrorMessage="*" ValidationGroup="newvalue"></asp:RequiredFieldValidator>
                </td>
                <td width="20%" style="text-align: right">
                    <asp:Label ID="LAge" runat="server" Text="年龄"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Age" runat="server" onkeyup="this.value=this.value.replace(/[^\d]+?/g,'')"></asp:TextBox>
                    岁</td>
        	</tr>
            <tr>
        		<td width="20%" style="text-align: right">
                    <asp:Label ID="LWorked" runat="server" Text="职业"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Worked" runat="server"></asp:TextBox>
                </td>
                <td width="20%" style="text-align: right">
                    <asp:Label ID="LPhone" runat="server" Text="联系电话"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Phone" runat="server"></asp:TextBox>
                </td>
        	</tr>
            <tr>
        		<td width="20%" style="text-align: right">
                    <asp:Label ID="LYqd" runat="server" Text="预签单"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Yqd" runat="server" CausesValidation="True"></asp:TextBox>
                    万元<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="Yqd" ErrorMessage="数字" SetFocusOnError="True" 
                        ValidationExpression="^[0-9]+(.[0-9]{0,2})?$" ValidationGroup="newvalue"></asp:RegularExpressionValidator>
                </td>
                <td width="20%" style="text-align: right">
                    <asp:Label ID="LHshbf" runat="server" Text="回收保费"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Hshbf" runat="server"></asp:TextBox>
                    万元<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="Hshbf" ErrorMessage="数字" SetFocusOnError="True" 
                        ValidationExpression="^[0-9]+(.[0-9]{0,2})?$" ValidationGroup="newvalue"></asp:RegularExpressionValidator>
                </td>
        	</tr>
            <tr>
        		<td width="20%" style="text-align: right">
                    <asp:Label ID="LHfqk" runat="server" Text="回访情况"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:DropDownList ID="Hfqk" runat="server">
                        <asp:ListItem Value="A">优质</asp:ListItem>
                        <asp:ListItem Value="B">良好</asp:ListItem>
                        <asp:ListItem Value="C">一般</asp:ListItem>
                        <asp:ListItem Value="D">拒绝</asp:ListItem>
                        <asp:ListItem Value="E">其他</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td width="20%" style="text-align: right">
                    <asp:Label ID="LRemark" runat="server" Text="备注"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Remark" runat="server"></asp:TextBox>
                </td>
        	</tr>
            <tr>
        		<td width="20%" style="text-align: right">
                    <asp:Label ID="LField1" runat="server" Text="自定义字段1"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Field1" runat="server"></asp:TextBox>
                </td>
                <td width="20%" style="text-align: right">
                    <asp:Label ID="LField2" runat="server" Text="自定义字段2"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Field2" runat="server"></asp:TextBox>
                </td>
        	</tr>
            <tr>
        		<td width="20%" style="text-align: right">
                    <asp:Label ID="LField3" runat="server" Text="自定义字段3"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Field3" runat="server"></asp:TextBox>
                </td>
                <td width="20%" style="text-align: right">
                    &nbsp;</td>
                <td style="text-align: left">
                    &nbsp;</td>
        	</tr>
        </table>
        </div>
        </td>
            </td>
    	</tr>
    </table>
    </div>
    </div>
    </form>
</body>
</html>
