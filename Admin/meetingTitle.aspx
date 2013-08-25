<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="meetingTitle.aspx.cs" Inherits="nyrs.Admin.meetingTitle" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>两会推动查询管理系统</title>
          <link href="../Styles/Site.css" type="text/css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="right">
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
    	<tr >
    		<td colspan="3"></td>
    	</tr>
        <tr>
        <td>
        <div class="editlayer">
        
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="MeetTitleID" 
                DataSourceID="SqlDataSource1" EnableModelValidation="True" 
                InsertItemPosition="LastItem" >
               
                <EditItemTemplate>
                    <tr style="background-color: #999999;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" ValidationGroup="updatevalid" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                        </td>
                        <td>
                            <asp:TextBox ID="MeettitleTextBox" runat="server" 
                                Text='<%# Bind("Meettitle") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="请输入会议内容" ControlToValidate="MeettitleTextBox" ValidationGroup="updatevalid"></asp:RequiredFieldValidator>
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
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" ValidationGroup="meeting" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                        </td>
                        <td>
                            <asp:TextBox ID="MeettitleTextBox" runat="server" 
                                Text='<%# Bind("Meettitle") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="需要输入内容" ValidationGroup="meeting" Text="请输入会议内容" ControlToValidate="MeettitleTextBox"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #E0FFFF;color: #333333;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" OnClientClick="if(confirm('确定删除会议内容吗？')){return true;}else{return false;}" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                        </td>
                        <td>
                            <asp:Label ID="MeettitleLabel" runat="server" Text='<%# Eval("Meettitle") %>' />
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
                                            会议主题</th>
                                       
                                    </tr>
                                    <tr ID="itemPlaceholder" runat="server">
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
            </div>
            </td>
        <td></td>
        
        </tr>
    </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
            DeleteCommand="DELETE FROM Meettitle WHERE (MeetTitleID = ?)" 
            InsertCommand="INSERT INTO Meettitle(Meettitle) VALUES (?)" 
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
            SelectCommand="SELECT Meettitle,MeetTitleID FROM Meettitle ORDER BY MeetTitleID DESC" 
            UpdateCommand="UPDATE Meettitle SET Meettitle = ? WHERE (MeetTitleID = ?)">
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
