<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Organize.aspx.cs" Inherits="nyrs.Admin.Organize1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>两会推动查询管理系统</title>
          <link href="../Styles/Site.css" type="text/css" rel="Stylesheet" />
          <script language="javascript" for="document" event="onkeydown">

  if(event.keyCode==13)

     event.keyCode=9;


</script>


    <style type="text/css">
        .style1
        {
            height: 46px;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
    <div class="right" >
    <table style="position:absolute; z-index:2; margin:10px 0 0 30px; background-color: #E0FFFF;color: #333333;" border="0" cellspacing="0" 
   
            cellpadding="0" width="80%" >
    <tr>
    <td >
        <asp:Button ID="BAdd" runat="server" Text="添加分支机构" onclick="BAdd_Click" 
            CausesValidation="False" UseSubmitBehavior="False" />
        <asp:Button ID="Bdel" runat="server" onclick="Bdel_Click" 
            OnClientClick="if(confirm('确定删除机构吗？')){return true;}else{return false;}"   
            Text="删除机构" />
        <asp:Button ID="BSave" runat="server" Text="保存" onclick="BSave_Click" 
            UseSubmitBehavior="False" ValidationGroup="org" />
    </td>
    <td>
    </td>
    </tr>
	<tr >
		<td width="40%" valign="top">
            <asp:TreeView ID="OrganizeTree" runat="server" 
                onselectednodechanged="OrganizeTree_SelectedNodeChanged" ShowLines="True">
             <SelectedNodeStyle  Font-Underline="True" />
            </asp:TreeView>
        </td>
        <td width="60%" valign="top">
        <div>
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
        	<tr>
        		<td width="20%" align="center" class="style1">机构代码</td>
                <td class="style1">
                    <asp:TextBox ID="TBOrgCode" runat="server" Width="80%" 
                        ontextchanged="TBOrgCode_TextChanged" AutoPostBack="True"></asp:TextBox></td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="内容不能为空" ValidationGroup="org" ControlToValidate="TBOrgCode"></asp:RequiredFieldValidator>
        	</tr>
            <tr>
        		<td width="20%" align="center">机构名称</td>
                <td>
                    <asp:TextBox ID="TBOrgName" runat="server" Width="80%" 
                        ontextchanged="TBOrgName_TextChanged" AutoPostBack="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="内容不能为空" ControlToValidate="TBOrgName" ValidationGroup="org"></asp:RequiredFieldValidator>
                </td>
        	</tr>
        </table>
        </div>
        </td>
	</tr>
</table>
    </div>
    </form>
</body>
</html>
