<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="nyrs.Account.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>两会推动查询管理系统</title>
    <style type="text/css">
        .loginbg{  
     width:100%;  
     height:100%;  
      z-index:-2;
     filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='/images/loginbg.jpg',sizingMethod='scale');  
     }
     .loginbox
     {
         position:absolute;
         margin-top:14%;
         margin-left:50%;
          z-index:50;
         width:516px;
         height:321px;
         background-image:url("/images/login.png");
         
         }
    
     .logintable
     {
         position:relative;
         margin-top:22%;
         margin-left:25%;
         z-index:100;
         }   
         
    </style>
   
</head>
<body  style=" margin:0 0 0 0; padding:0 0 0 0; font-size;12px" onload="__resize()" >
<div id="maindiv" class="loginbg" style="width:100%;">

<div class="loginbox">

<form id="form1" runat="server">
<asp:Login ID="Login1" runat="server" onauthenticate="Login1_Authenticate" 
             onloggedin="Login1_LoggedIn" FailureText="您的用户名或密码不正确。请重试。" >
             <LayoutTemplate>
             
<table class="logintable" cellpadding="2" 
    contenteditable="true" cellspacing="0" >
                               
                                <tr  >
                                    <td align="right">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" 
                                            ForeColor="#104570" Font-Bold="True" Font-Names="微软雅黑" >用户名:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UserName" runat="server" Font-Size="1em" Width="160px" EnableTheming="false"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                            ControlToValidate="UserName" ErrorMessage="必须填写“用户名”。" ToolTip="必须填写“用户名”。" 
                                            ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                           
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" 
                                            ForeColor="#104570" Font-Bold="True" Font-Names="微软雅黑">密码:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" Font-Size="1em" TextMode="Password" 
                                            Width="160px" EnableTheming="false"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                            ControlToValidate="Password" ErrorMessage="必须填写“密码”。" ToolTip="必须填写“密码”。" 
                                            ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                      
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color:Red;">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:ImageButton ID="LoginButton" runat="server" 
                                             CommandName="Login" 
                                            CssClass="login_button" Font-Names="Verdana"  
                                              ValidationGroup="Login1" ImageUrl="/images/loginbotton.jpg" />
                                        <asp:ImageButton ID="Breset" runat="server" 
                                            ImageUrl="/images/resetbotton.jpg"   OnClientClick="resettext();" />
                                    </td>
                                </tr>
                            </table>
                 
                            </LayoutTemplate>
                            </asp:Login>
                            </form>
                            </div>
</div>
</div>
</div>
 
</body>
 <script type="text/javascript">
     window.onresize = __resize;
     //document.getElementById("UserName").focus();
    function __resize() {
        var bodyheight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
        
        document.getElementById("maindiv").style.height = bodyheight;
    }
    function resettext() {
        document.getElementById("Login1_UserName").innerText = "";
        document.getElementById("Login1_Password").innerText = "";
     }
 </script>
</html>
