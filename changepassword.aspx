<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" Inherits="nyrs.Admin.changepassword" %>

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
    <table border="1" cellspacing="0" cellpadding="0" >
    	<tr>
    		<td style="text-align: right">
            
                <asp:Label ID="Label3" runat="server" Text="新密码：" ></asp:Label></td>
            <td>
                <asp:TextBox ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" 
                             CssClass="failureNotification" ErrorMessage="必须填写“新密码”。" ToolTip="必须填写“新密码”。" 
                             ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                </td>
    	</tr>
        <tr>
        <td>
        <asp:Label ID="Label4" runat="server" Text="确认新密码：" style="text-align: right" 
               ></asp:Label></td>
        </td __designer:mapid="71">
        <td>
        <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox>
         <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword" 
                             CssClass="failureNotification" Display="Dynamic" ErrorMessage="必须填写“确认新密码”。"
                             ToolTip="必须填写“确认新密码”。" 
                ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="NewPasswordCompare" runat="server" 
                ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                             CssClass="failureNotification" Display="Dynamic" ErrorMessage="“确认新密码”与“新密码”项必须匹配。"
                             ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:CompareValidator>
        </td>
        </td __designer:mapid="76">
        </tr>
        <tr>
        <td style="text-align: center">
            <asp:Button ID="BSave" runat="server" Text="确认" style="text-align: center" 
                ValidationGroup="ChangeUserPasswordValidationGroup" 
                onclick="BSave_Click" />
        </td>
        <td style="text-align: center">
            <asp:Button ID="BExit" runat="server" Text="取消" />
        </td>
        </tr>
    </table>
    </div>
    </div>
    </form>
</body>
</html>
