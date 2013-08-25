<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Operator.aspx.cs" Inherits="nyrs.Admin.Operator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>两会推动查询管理系统</title>
          <link href="../Styles/Site.css" type="text/css" rel="Stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
    <div class="right">
    <div class="editlayer">
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
    	<tr>
    		<td valign="top">
             <asp:TreeView ID="OrganizeTree" runat="server" 
                 ShowLines="True" onselectednodechanged="OrganizeTree_SelectedNodeChanged" 
               >
             <SelectedNodeStyle Font-Underline="True" />
            </asp:TreeView>
            </td>
            <td valign="top">
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="OperatorID" 
                    DataSourceID="SqlDataSource1" EnableModelValidation="True" 
                    InsertItemPosition="LastItem" oniteminserting="ListView1_ItemInserting" 
                    onitemupdating="ListView1_ItemUpdating">
                   
                    <EditItemTemplate>
                        <tr style="background-color: #999999;color: #000080;">
                            <td>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" ValidationGroup="updateval" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                            </td>
                            
                            <td>
                                <asp:TextBox ID="OperatorNameTextBox" runat="server" 
                                    Text='<%# Bind("OperatorName") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ValidationGroup="updateval" ControlToValidate="OperatorNameTextBox"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="LoginNameTextBox" runat="server" 
                                    Text='<%# Bind("LoginName") %>' />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ValidationGroup="updateval" ControlToValidate="LoginNameTextBox"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="PasswordTextBox" runat="server" 
                                    Text='<%# Bind("Password") %>' />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ValidationGroup="updateval" ControlToValidate="PasswordTextBox"></asp:RequiredFieldValidator>
                            </td>
                            
                                <asp:TextBox ID="BelongtoTextBox" runat="server"  Visible="false"
                                    Text='<%# Bind("Belongto") %>' />
                            
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" 
                            style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                            <tr>
                                <td>
                                    未返回数据。</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" ValidationGroup="insertval" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                            </td>
                          
                            <td>
                                <asp:TextBox ID="OperatorNameTextBox" runat="server" 
                                    Text='<%# Bind("OperatorName") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="OperatorNameTextBox" ValidationGroup="insertval"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="LoginNameTextBox" runat="server" 
                                    Text='<%# Bind("LoginName") %>' />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="LoginNameTextBox" ValidationGroup="insertval"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="PasswordTextBox" runat="server" 
                                    Text='<%# Bind("Password") %>' />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="PasswordTextBox" ValidationGroup="insertval"></asp:RequiredFieldValidator>
                            </td>
                            
                                <asp:TextBox ID="BelongtoTextBox" runat="server"  Visible="false"
                                    Text='<%# Bind("Belongto") %>' />
                           
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color: #E0FFFF;color: #333333;">
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" OnClientClick="if(confirm('确定此操作员吗？')){return true;}else{return false;}"/>
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                            </td>
                            
                            <td>
                                <asp:Label ID="OperatorNameLabel" runat="server" 
                                    Text='<%# Eval("OperatorName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="LoginNameLabel" runat="server" Text='<%# Eval("LoginName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' />
                            </td>
                            
                                <asp:Label ID="BelongtoLabel" runat="server" Text='<%# Eval("Belongto") %>'  Visible="false"/>
                            
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                        style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                            <th runat="server">
                                            </th>
                                           
                                            <th runat="server">
                                                操作员姓名</th>
                                            <th runat="server">
                                                登录名</th>
                                            <th runat="server">
                                                密码</th>
                                            <th runat="server" visible="false">
                                                Belongto</th>
                                        </tr>
                                        <tr ID="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" 
                                    style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                                    <asp:DataPager ID="DataPager1" runat="server">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                                ShowLastPageButton="True" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                            </td>
                            
                            <td>
                                <asp:Label ID="OperatorNameLabel" runat="server" 
                                    Text='<%# Eval("OperatorName") %>' />
                                
                            </td>
                            <td>
                                <asp:Label ID="LoginNameLabel" runat="server" Text='<%# Eval("LoginName") %>' />
                               
                            </td>
                            <td>
                                <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' />
                               
                            </td>
                            <td>
                                <asp:Label ID="BelongtoLabel" runat="server" Text='<%# Eval("Belongto") %>' Visible="false" />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
            </td>
    	</tr>
        
    </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
            DeleteCommand="DELETE FROM Operator WHERE (OperatorID = ?)" 
            InsertCommand="INSERT INTO Operator(OperatorName, LoginName, Password, Belongto) VALUES (?, ?, ?, ?)" 
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
            SelectCommand="SELECT OperatorID, OperatorName, LoginName, Password, Belongto FROM Operator WHERE (Belongto=?)" 
            
            
            
            UpdateCommand="UPDATE Operator SET OperatorName = ?, LoginName = ?, Belongto = ?, Password = ? WHERE (OperatorID = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="OrganizeTree" Name="organizeid" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
            
          
           
        </asp:SqlDataSource>
    </div>
    </div>

    </form>
   
    
</body>
</html>
