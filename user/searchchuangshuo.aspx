<%@ Page Language="C#" EnableEventValidation = "false" AutoEventWireup="true" CodeBehind="searchchuangshuo.aspx.cs" Inherits="nyrs.user.searchchuangshuo" %>

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
    <table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#E0FFFF">
    	<tr>
    		<td>
            <asp:CheckBox ID="CBOrg" runat="server" Text="机构" AutoPostBack="True" 
                    oncheckedchanged="CBOrg_CheckedChanged" /> 
                <asp:DropDownList ID="DropDownList1" runat="server" 
                   Enabled="False" EnableTheming="True">
                </asp:DropDownList>   
            </td>
            <td>
            <asp:CheckBox ID="CBDateTime" runat="server" Text="日期" AutoPostBack="True" 
                    oncheckedchanged="CBDateTime_CheckedChanged" />
                从<asp:TextBox ID="StartDate" runat="server" Enabled="False" AutoPostBack="True" Width="80px" 
                    ></asp:TextBox>
                <ajaxToolkit:PopupControlExtender ID="StartDate_PopupControlExtender" 
                    runat="server" DynamicServicePath="" Enabled="True"   PopupControlID="UpdatePanel1"
                    CommitProperty="value" CommitScript="e.value"
                    TargetControlID="StartDate">
                </ajaxToolkit:PopupControlExtender>
                到<asp:TextBox ID="EndDate" runat="server" Enabled="False" AutoPostBack="True" Width="80px" 
                    ></asp:TextBox>
                <ajaxToolkit:PopupControlExtender ID="EndDate_PopupControlExtender" 
                    runat="server" DynamicServicePath="" Enabled="True"  PopupControlID="UpdatePanel2"
                    CommitProperty="value" CommitScript="e.value"
                    TargetControlID="EndDate">
                </ajaxToolkit:PopupControlExtender>
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
            BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" 
            Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" 
            Width="330px" onselectionchanged="Calendar1_SelectionChanged">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                Height="8pt" />
            <DayStyle BackColor="#CCCCCC" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" 
                Font-Size="12pt" ForeColor="White" Height="12pt" />
            <TodayDayStyle BackColor="#999999" ForeColor="White" />
        </asp:Calendar>
        </ContentTemplate>
        </asp:UpdatePanel>
         <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
        <asp:Calendar ID="Calendar2" runat="server" BackColor="White" 
            BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" 
            Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" 
            Width="330px" onselectionchanged="Calendar2_SelectionChanged">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                Height="8pt" />
            <DayStyle BackColor="#CCCCCC" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" 
                Font-Size="12pt" ForeColor="White" Height="12pt" />
            <TodayDayStyle BackColor="#999999" ForeColor="White" />
        </asp:Calendar>
        </ContentTemplate>
        </asp:UpdatePanel>
            </td>
            <td>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="查询" onclick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="导出Excel" 
                    onclick="Button2_Click" />
            </td>
    	</tr>
        <tr>
        <td colspan="4">
        <div style="overflow: scroll; width: 790px;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3"  EnableModelValidation="True" 
                ondatabound="GridView1_DataBound" 
                AllowPaging="True" PageSize="15" CaptionAlign="Top" 
                onpageindexchanging="GridView1_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="OrgName" HeaderText="举办机构" 
                        SortExpression="OrgName" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="HoldDate" HeaderText="举办时间" 
                        SortExpression="HoldDate" DataFormatString="{0:yyyy-MM-dd}" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="HoldAddr" HeaderText="举办地点" 
                        SortExpression="HoldAddr" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ComeZhzrs" HeaderText="ComeZhzrs" 
                        SortExpression="ComeZhzrs" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Xchmsrs" HeaderText="Xchmsrs" 
                        SortExpression="Xchmsrs" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="jfrs" HeaderText="jfrs" SortExpression="jfrs" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Pxrs" HeaderText="Pxrs" SortExpression="Pxrs" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="shgrs" HeaderText="shgrs" SortExpression="shgrs" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Dzkrs" HeaderText="Dzkrs" SortExpression="Dzkrs" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="tgrs" HeaderText="tgrs" SortExpression="tgrs" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Field1" HeaderText="Field1" 
                        SortExpression="Field1" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Field2" HeaderText="Field2" 
                        SortExpression="Field2" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Field3" HeaderText="Field3" 
                        SortExpression="Field3" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Field4" HeaderText="Field4" 
                        SortExpression="Field4" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Field5" HeaderText="Field5" 
                        SortExpression="Field5" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" 
                    Wrap="False" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" Wrap="False" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            </div>
             <asp:Label ID="LPage" runat="server" Visible="False"></asp:Label>
        </td>
        </tr>
    </table>
    </div>
    </div>
    </form>
</body>
</html>
