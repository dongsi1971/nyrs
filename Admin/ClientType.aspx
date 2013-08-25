<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientType.aspx.cs" Inherits="nyrs.Admin.ClientType" %>

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

         <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" 
             EnableModelValidation="True" InsertItemPosition="LastItem" 
             DataKeyNames="ClientTypeID">
           
             
             <EditItemTemplate>
                 <tr style="background-color: #999999;">
                     <td>
                         <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" ValidationGroup="updateval" />
                         <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                     </td>
                     <td>
                         <asp:TextBox ID="clientTypeTextBox" runat="server" 
                             Text='<%# Bind("clientType") %>' />
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入客户类别" ControlToValidate="clientTypeTextBox" ValidationGroup="updateval"></asp:RequiredFieldValidator>
                         
                     </td>
                     
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
                         <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" ValidationGroup="clienttype" />
                         <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                     </td>
                     <td>
                         <asp:TextBox ID="clientTypeTextBox" runat="server" 
                             Text='<%# Bind("clientType") %>' />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入客户类别" ControlToValidate="clientTypeTextBox" ValidationGroup="clienttype"></asp:RequiredFieldValidator>
                     </td>
                     
                 </tr>
             </InsertItemTemplate>
             <ItemTemplate>
                 <tr style="background-color: #E0FFFF;color: #333333;">
                     <td>
                         <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" OnClientClick="if(confirm('确定删除机构吗？')){return true;}else{return false;}" />
                         <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                     </td>
                     <td>
                         <asp:Label ID="clientTypeLabel" runat="server" 
                             Text='<%# Eval("clientType") %>' />
                     </td>
                    
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
                                         客户类别</th>
                                    
                                 </tr>
                                 <tr runat="server" ID="itemPlaceholder">
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr runat="server">
                         <td runat="server" 
                             style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
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
             
             
         </asp:ListView>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
             ConnectionString="<%$ ConnectionStrings:MySqlConnectionString %>" 
             DeleteCommand="DELETE FROM ClientType WHERE (ClientTypeID = ?)" 
             InsertCommand="INSERT INTO ClientType(clientType) VALUES (?)" 
             ProviderName="<%$ ConnectionStrings:MySqlConnectionString.ProviderName %>" 
             SelectCommand="SELECT clientType, ClientTypeID FROM ClientType ORDER BY ClientTypeID DESC" 
             
             UpdateCommand="UPDATE ClientType SET clientType = ? WHERE (ClientTypeID = ?)">
         </asp:SqlDataSource>

     </div>
    </div>
    </form>
</body>
</html>
