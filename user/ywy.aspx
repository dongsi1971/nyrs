<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ywy.aspx.cs" Inherits="nyrs.user.ywy" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>两会推动查询管理系统</title>
          <link href="../Styles/Site.css" type="text/css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxToolkit:ToolkitScriptManager>
    <div class="right">
    <div class="editlayer">

        <asp:ListView ID="ListView1" runat="server" DataKeyNames="YwyID" 
            DataSourceID="SqlDataSource1" EnableModelValidation="True" 
            InsertItemPosition="LastItem" oniteminserting="ListView1_ItemInserting" 
            onitemupdating="ListView1_ItemUpdating" 
            onitemdeleting="ListView1_ItemDeleting">
           
            <EditItemTemplate>
                <tr style="background-color: #999999;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                    </td>
                    
                    <td>
                        <asp:TextBox ID="YwyCodeTextBox" runat="server" Text='<%# Bind("YwyCode") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="YwyNameTextBox" runat="server" Text='<%# Bind("YwyName") %>' />
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
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                    </td>
                    
                    <td>
                        <asp:TextBox ID="YwyCodeTextBox" runat="server" Text='<%# Bind("YwyCode") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="YwyNameTextBox" runat="server" Text='<%# Bind("YwyName") %>' />
                    </td>
                    
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #E0FFFF;color: #333333;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                    </td>
                   
                    <td>
                        <asp:Label ID="YwyCodeLabel" runat="server" Text='<%# Eval("YwyCode") %>' />
                    </td>
                    <td>
                        <asp:Label ID="YwyNameLabel" runat="server" Text='<%# Eval("YwyName") %>' />
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
                                       业务员代码</th>
                                    <th runat="server">
                                        业务员名</th>
                                    
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
            <SelectedItemTemplate>
                <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                    </td>
                    
                    <td>
                        <asp:Label ID="YwyCodeLabel" runat="server" Text='<%# Eval("YwyCode") %>' />
                    </td>
                    <td>
                        <asp:Label ID="YwyNameLabel" runat="server" Text='<%# Eval("YwyName") %>' />
                    </td>
                    
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
            DeleteCommand="DELETE FROM YwyInfo WHERE (YwyID = ?)" 
            InsertCommand="INSERT INTO YwyInfo(YwyCode, YwyName, OrganizeID) VALUES (?, ?, ?)" 
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
            SelectCommand="SELECT YwyID, YwyCode, YwyName, OrganizeID FROM YwyInfo WHERE (OrganizeID = ?) AND (isDel = 0)" 
            
            UpdateCommand="UPDATE YwyInfo SET YwyCode = ?, YwyName = ?, OrganizeID = ? WHERE (YwyID = ?)">
            <SelectParameters>
                <asp:SessionParameter Name="OrgID" SessionField="OrganizeID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="BImport" runat="server" Text="导入业务员文件" 
            onclick="BImport_Click" />
        <ajaxToolkit:ConfirmButtonExtender ID="BImport_ConfirmButtonExtender" 
            runat="server" ConfirmText="该项操作需要较长时间，是否继续？" Enabled="True" TargetControlID="BImport">
        </ajaxToolkit:ConfirmButtonExtender>
    </div>
    </div>
    </form>
</body>
</html>
