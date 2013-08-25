<%@ Page Language="C#" EnableEventValidation = "false" AutoEventWireup="true" CodeBehind="searchtwomeeting.aspx.cs" Inherits="nyrs.user.searchtwomeeting" %>

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
                &nbsp;</td>
            <td rowspan="2">
            <asp:Button ID="Button1" runat="server" Text="查询" onclick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="导出Excel" 
                    onclick="Button2_Click" />
            </td>
    	</tr>
    	<tr>
    		<td>
                <asp:CheckBox ID="CBFormType" runat="server" Text="举办形式" AutoPostBack="True" 
                    oncheckedchanged="CBFormType_CheckedChanged" />
                <asp:DropDownList ID="DropDownList2" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="FormType" 
                    DataValueField="HoldFormID" Enabled="False">
                </asp:DropDownList>
            </td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
                    SelectCommand="SELECT [HoldFormID], [FormType] FROM [HoldForm]">
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
    	</tr>
        <tr>
        <td colspan="5">
        <div style="width: 790px; overflow: scroll">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3"  EnableModelValidation="True" 
                ondatabound="GridView1_DataBound" 
                AllowPaging="True" PageSize="15" 
                onpageindexchanging="GridView1_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="OrgName" HeaderText="OrgName" 
                        SortExpression="OrgName" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="HoldDate" HeaderText="HoldDate" DataFormatString="{0:yyyy-MM-dd}"
                        SortExpression="HoldDate" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="HoldAddr" SortExpression="HoldAddr">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HoldAddr") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("HoldAddr") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="HoldName" SortExpression="HoldName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("HoldName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("HoldName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="FormType" HeaderText="FormType" 
                        SortExpression="FormType" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ComePeopleNum" HeaderText="ComePeopleNum" 
                        SortExpression="ComePeopleNum" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Qybf" HeaderText="Qybf" SortExpression="Qybf" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Qyjs" HeaderText="Qyjs" SortExpression="Qyjs" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Zhzyrs" HeaderText="Zhzyrs" 
                        SortExpression="Zhzyrs" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Hshbf" HeaderText="Hshbf" SortExpression="Hshbf" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Field1" SortExpression="Field1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Field1") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Field1") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Field2" SortExpression="Field2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Field2") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Field2") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Field3" SortExpression="Field3">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Field3") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Field3") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Field4" SortExpression="Field4">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Field4") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Field4") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Field5" SortExpression="Field5">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Field5") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Field5") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
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
