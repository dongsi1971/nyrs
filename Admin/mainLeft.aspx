<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mainLeft.aspx.cs" Inherits="nyrs.Admin.mainLeft" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>两会推动查询管理系统</title>
          <link href="../Styles/Site.css" type="text/css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
     <table class="leftbox" border="0" style=" margin:5px 10px 5px 10px" cellspacing="0" cellpadding="0" width="89%">
	<tr>
		<td width="100%" height="30px" background="/Images/leftbar.jpg" align="center" >
        <div class="whitefont">系统数据管理</div>
        </td>
	</tr>
    <tr>
    <td align="left" valign="top">
        <asp:TreeView ID="TreeView1" runat="server" CssClass="editmenu" 
            ShowLines="True" ForeColor="Black">
            <Nodes>
                <asp:TreeNode Expanded="True" ImageUrl="/Images/rootbook.jpg" Text="基础数据维护" 
                    Value="基础数据维护">
                    <asp:TreeNode ImageUrl="/Images/leafpage.jpg" Target="Right" Text="操作人员管理" 
                        Value="操作员人管理" NavigateUrl="~/Admin/Operator.aspx">
                    </asp:TreeNode>
                    <asp:TreeNode ImageUrl="/Images/leafpage.jpg" Target="Right" Text="机构分支管理" Value="机构分支管理" 
                        NavigateUrl="/Admin/Organize.aspx">
                    </asp:TreeNode>
                    <asp:TreeNode ImageUrl="/Images/leafpage.jpg" Target="Right" Text="客户类别管理" 
                        Value="客户类别管理" NavigateUrl="~/Admin/ClientType.aspx">
                    </asp:TreeNode>
                    <asp:TreeNode ImageUrl="/Images/leafpage.jpg" Target="Right" Text="会议主题管理" 
                        Value="会议主题管理" NavigateUrl="~/Admin/meetingTitle.aspx">
                    </asp:TreeNode>
                    <asp:TreeNode ImageUrl="/Images/leafpage.jpg" Target="Right" Text="业务字段管理" 
                        Value="业务字段管理" NavigateUrl="~/Admin/CustomField.aspx">
                    </asp:TreeNode>
                    <asp:TreeNode ImageUrl="~/Images/leafpage.jpg" 
                        NavigateUrl="~/Admin/HoldForm.aspx" Target="Right" Text="举办形式管理" Value="举办形式管理">
                    </asp:TreeNode>
                    
                </asp:TreeNode>
                <asp:TreeNode ImageUrl="~/Images/rootbook.jpg" Text="修改密码" Value="修改密码" 
                        NavigateUrl="~/changepassword.aspx" Target="Right">
                    </asp:TreeNode>
            </Nodes>
            <SelectedNodeStyle  Font-Underline="True" />
        </asp:TreeView>
    </td>
    </tr>
    <tr>
    <td>
    </td>
    </tr>
</table>
    </form>
</body>
</html>
