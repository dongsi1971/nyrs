<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mainLeft.aspx.cs" Inherits="nyrs.user.mainLeft" %>

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
        <div class="whitefont">记录查询系统</div>
        </td>
	</tr>
    <tr>
    <td align="left" valign="top">
        <asp:TreeView ID="TreeView1" runat="server" CssClass="editmenu" 
            ShowLines="True" ForeColor="Black">
            <Nodes>
                <asp:TreeNode Expanded="True" ImageUrl="/Images/rootbook.jpg" Text="记录维护" 
                    Value="记录维护">
                    <asp:TreeNode ImageUrl="/Images/leafpage.jpg" Target="Right" Text="两会记录" 
                        Value="两会记录" NavigateUrl="~/user/twomeeting.aspx">
                    </asp:TreeNode>
                    <asp:TreeNode ImageUrl="/Images/leafpage.jpg" Target="Right" Text="创说会记录" Value="创说会记录" 
                        NavigateUrl="~/user/chuangshuo.aspx">
                    </asp:TreeNode>
                    <asp:TreeNode ImageUrl="/Images/leafpage.jpg" Target="Right" Text="客户档案记录" 
                        Value="客户档案记录" NavigateUrl="~/user/customer.aspx">
                    </asp:TreeNode>
                    <asp:TreeNode ImageUrl="/Images/leafpage.jpg" Target="Right" Text="考勤记录" 
                        Value="考勤记录" NavigateUrl="~/user/kaoqin.aspx">
                    </asp:TreeNode>
                    <asp:TreeNode ImageUrl="/Images/leafpage.jpg" Target="Right" Text="业务员导入" 
                        Value="业务员导入" NavigateUrl="~/user/ywy.aspx">
                    </asp:TreeNode>
                   
                </asp:TreeNode>
                <asp:TreeNode Expanded="False" ImageUrl="~/Images/rootbook.jpg" Text="记录查询" 
                    Value="记录查询">
                    <asp:TreeNode ImageUrl="~/Images/leafpage.jpg" Target="Right" Text="两会记录" 
                        Value="两会记录" NavigateUrl="~/user/searchtwomeeting.aspx"></asp:TreeNode>
                    <asp:TreeNode ImageUrl="~/Images/leafpage.jpg" Target="Right" Text="创说会记录" 
                        Value="创说会记录" NavigateUrl="~/user/searchchuangshuo.aspx"></asp:TreeNode>
                    <asp:TreeNode ImageUrl="~/Images/leafpage.jpg" Target="Right" Text="客户档案记录" 
                        Value="客户档案记录" NavigateUrl="~/user/searchcustomer.aspx"></asp:TreeNode>
                    <asp:TreeNode ImageUrl="~/Images/leafpage.jpg" Target="Right" Text="考勤记录" 
                        Value="考勤记录" NavigateUrl="~/user/searchkaoqin.aspx"></asp:TreeNode>
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
