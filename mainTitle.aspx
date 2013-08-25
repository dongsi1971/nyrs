<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mainTitle.aspx.cs" Inherits="nyrs.mainTitle" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>两会推动查询管理系统</title>
      <link href="../Styles/Site.css" type="text/css" rel="Stylesheet" />
</head>
<body >
    <form id="Form1" runat="server">
    
            <div class="title">
                
                <table class="buttontable"  cellspacing="0" cellpadding="0"   align="right" >
                	<tr>	
                     <td align="center"> 
                         <asp:ImageButton ID="IBhome" runat="server" 
                     ImageUrl="/Images/home.gif" onclick="IBhome_Click"  /></td>
                     <td align="center">
                         <asp:ImageButton ID="IBexit" runat="server" 
                    EnableTheming="False"  ImageUrl="/Images/logout.gif" onclick="IBexit_Click" /></td>
                	</tr>
                    <tr>
                		<td align="center" class="whitefont"><asp:Label CssClass="clear" ID="Label1" runat="server" 
                                Text="返回首页" ></asp:Label></td>
                         <td align="center" class="whitefont"> <asp:Label ID="Label2" runat="server" Text="退出"></asp:Label>
                    </td>
                	</tr>
                </table>  
            </div>
            <div class="loginDisplay" align="right" style="vertical-align: middle;">
                <asp:Label ID="loginuser" runat="Server"  Font-Names="微软雅黑"  CssClass="midlogin"
                    ForeColor="White" Text="登录用户信息"></asp:Label>
                    
  
    </div>
   
    </form>
</body>

</html>
