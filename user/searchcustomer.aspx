<%@ Page Language="C#" EnableEventValidation = "false" AutoEventWireup="true" CodeBehind="searchcustomer.aspx.cs" Inherits="nyrs.user.searchcustomer" %>

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
                <asp:CheckBox ID="CBMeettitle" runat="server" Text="举办主题" AutoPostBack="True" oncheckedchanged="CBMeettitle_CheckedChanged" 
                     />
                <asp:DropDownList ID="DropDownList2" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="Meettitle" 
                    DataValueField="MeetTitleID" Enabled="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
                    SelectCommand="SELECT [MeetTitleID], [Meettitle] FROM [Meettitle]">
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:CheckBox ID="CBYwy" runat="server" AutoPostBack="True" 
                    oncheckedchanged="CBYwy_CheckedChanged" Text="业务员姓名" />
                <asp:DropDownList ID="ywy" runat="server" DataSourceID="SqlDataSource3" 
                    DataTextField="YwyName" DataValueField="YwyID" Enabled="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
                    SelectCommand="SELECT YwyID, YwyName, OrganizeID FROM dbo.YwyInfo WHERE (isDel = 0) AND (OrganizeID = ?)">
                    <SelectParameters>
                        <asp:SessionParameter Name="?" SessionField="OrganizeID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
    	</tr>
        <tr>
    		<td  colspan="5">
            <div style="width: 790px; overflow: scroll">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3"  EnableModelValidation="True" 
                ondatabound="GridView1_DataBound" 
                    onrowdatabound="GridView1_RowDataBound" AllowPaging="True" PageSize="15" 
                    onpageindexchanging="GridView1_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="OrgName" HeaderText="OrgName" 
                        SortExpression="OrgName" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="YwyName" HeaderText="YwyName" 
                        SortExpression="YwyName" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="CustomerName" SortExpression="CustomerName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CustomerName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("CustomerName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" DataFormatString="{0:yyyy-MM-dd}"
                        SortExpression="CreateDate" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Meettitle" HeaderText="Meettitle" 
                        SortExpression="Meettitle" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="clientType" HeaderText="clientType" 
                        SortExpression="clientType" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Worked" SortExpression="Worked">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Worked") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Worked") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Yqd" HeaderText="Yqd" 
                        SortExpression="Yqd" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Hshbf" HeaderText="Hshbf" 
                        SortExpression="Hshbf" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Hfqk" HeaderText="Hfqk" 
                        SortExpression="Hfqk" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
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
