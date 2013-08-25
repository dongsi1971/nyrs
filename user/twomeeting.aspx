<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="twomeeting.aspx.cs" Inherits="nyrs.user.twomeeting" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>两会推动查询管理系统</title>
          <link href="../Styles/Site.css" type="text/css" rel="Stylesheet" />
          <script language="javascript" for="document" event="onkeydown">

  if(event.keyCode==13)

     event.keyCode=9;

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxToolkit:ToolkitScriptManager>
    <div class="right">
    <div class="editlayer">
    <table border="0" cellspacing="0" cellpadding="0" width="100%" 
            style="background-color: #E0FFFF;color: #333333;">
    	<tr>
    		<td width="100%" height="230px" valign="top">
            <div style="overflow: scroll">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    DataSourceID="SqlDataSource1" EnableModelValidation="True" 
                    ondatabound="GridView1_DataBound" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" 
                    DataKeyNames="TwoMeetID">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="选择" />
                        <asp:BoundField DataField="HoldDate" HeaderText="HoldDate" DataFormatString="{0:yyyy-MM-dd}"
                            SortExpression="HoldDate" />
                        <asp:BoundField DataField="HoldAddr" HeaderText="HoldAddr" 
                            SortExpression="HoldAddr" />
                        <asp:TemplateField HeaderText="HoldName" SortExpression="HoldName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HoldName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="TLHoldName" runat="server" Text='<%# Bind("HoldName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="FormType" HeaderText="FormType" 
                            SortExpression="FormType" />
                        <asp:BoundField DataField="ComePeopleNum" HeaderText="ComePeopleNum" 
                            SortExpression="ComePeopleNum" />
                        <asp:BoundField DataField="Qybf" HeaderText="Qybf" 
                            SortExpression="Qybf" />
                        <asp:BoundField DataField="Qyjs" HeaderText="Qyjs" 
                            SortExpression="Qyjs" />
                        <asp:BoundField DataField="Zhzyrs" HeaderText="Zhzyrs" 
                            SortExpression="Zhzyrs" />
                        <asp:BoundField DataField="Hshbf" HeaderText="Hshbf" 
                            SortExpression="Hshbf" />
                        <asp:TemplateField HeaderText="Field1" SortExpression="Field1">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Field1") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="TLField1" runat="server" Text='<%# Bind("Field1") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Field2" SortExpression="Field2">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Field2") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="TLField2" runat="server" Text='<%# Bind("Field2") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Field3" SortExpression="Field3">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Field3") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="TLField3" runat="server" Text='<%# Bind("Field3") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Field4" SortExpression="Field4">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Field4") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="TLField4" runat="server" Text='<%# Bind("Field4") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Field5" SortExpression="Field5">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Field5") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="TLField5" runat="server" Text='<%# Bind("Field5") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
                    
                    
                    
                    SelectCommand="SELECT dbo.TwoMeeting.HoldDate, dbo.TwoMeeting.HoldAddr, dbo.TwoMeeting.ComePeopleNum, dbo.TwoMeeting.Qybf, dbo.TwoMeeting.Qyjs, dbo.TwoMeeting.Zhzyrs, dbo.TwoMeeting.Hshbf, dbo.TwoMeeting.Field1, dbo.TwoMeeting.Field2, dbo.TwoMeeting.Field3, dbo.TwoMeeting.Field4, dbo.TwoMeeting.Field5, dbo.HoldForm.FormType, dbo.TwoMeeting.HoldFormID, dbo.TwoMeeting.TwoMeetID, dbo.TwoMeeting.OrganizeID, dbo.TwoMeeting.OperatorID, dbo.TwoMeeting.HoldName FROM dbo.TwoMeeting INNER JOIN dbo.HoldForm ON dbo.TwoMeeting.HoldFormID = dbo.HoldForm.HoldFormID WHERE (dbo.TwoMeeting.OperatorID = ?) ORDER BY dbo.TwoMeeting.TwoMeetID DESC">
                    <SelectParameters>
                        <asp:SessionParameter Name="OperatorID" SessionField="OperatorID" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            </td>
    	</tr>
        <tr>
        <td>
        <div class="toolbar">
            <asp:Button ID="BDelete" runat="server" Text="删除" onclick="BDelete_Click" 
                UseSubmitBehavior="False" />
                
            <ajaxToolkit:ConfirmButtonExtender ID="BDelete_ConfirmButtonExtender" 
                runat="server" ConfirmText="确实要删除记录吗?"  TargetControlID="BDelete">
            </ajaxToolkit:ConfirmButtonExtender>
                
            <asp:Button ID="BSave" runat="server" Text="保存" onclick="BSave_Click" 
                UseSubmitBehavior="False" ValidationGroup="newvalue" />
        </div>
        <div align="center">
        
        <table border="1" cellspacing="0" cellpadding="0" width="90%">
        	<tr>
        		<td  style="text-align: right">
                    <asp:Label ID="LHoldDate" runat="server" Text="举办时间"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="HoldDate" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="*" ControlToValidate="HoldDate" ValidationGroup="newvalue"></asp:RequiredFieldValidator>
                    <ajaxToolkit:PopupControlExtender ID="HoldDate_PopupControlExtender" 
                        runat="server" DynamicServicePath="" Enabled="True" PopupControlID="UpdatePanel1"
                         CommitProperty="value" CommitScript="e.value" OffsetY="-30" OffsetX="30"
                        TargetControlID="HoldDate">
                    </ajaxToolkit:PopupControlExtender>
                </td>
                <td  style="text-align: right">
                    <asp:Label ID="LHoldAddr" runat="server" Text="举办地点"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="HoldAddr" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="HoldAddr" ErrorMessage="*" ValidationGroup="newvalue"></asp:RequiredFieldValidator>
                </td>
        	</tr>
            <tr>
        		<td width="20%" style="text-align: right">
                    <asp:Label ID="LFormType" runat="server" Text="举办形式"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:DropDownList ID="FormType" runat="server" Width="90%" 
                        DataSourceID="SqlDataSource2" DataTextField="FormType" 
                        DataValueField="HoldFormID">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="*" ControlToValidate="FormType" ValidationGroup="newvalue"></asp:RequiredFieldValidator>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
                        SelectCommand="SELECT [HoldFormID], [FormType] FROM [HoldForm]">
                    </asp:SqlDataSource>
                </td>
                <td width="20%" style="text-align: right">
                    <asp:Label ID="LHoldName" runat="server" Text="举办人"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="HoldName" runat="server"></asp:TextBox>
                </td>
        	</tr>
            <tr>
        		<td width="20%" style="text-align: right">
                    <asp:Label ID="LQybf" runat="server" Text="签约保费"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Qybf" runat="server"></asp:TextBox>
                    万元<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="Qybf" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationExpression="^[0-9]+(.[0-9]{0,2})?$"></asp:RegularExpressionValidator>
                </td>
                <td width="20%" style="text-align: right">
                    <asp:Label ID="LComePeopleNum" runat="server" Text="到场客户人数"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="ComePeopleNum" runat="server"></asp:TextBox>
                    位<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="ComePeopleNum" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                </td>
        	</tr>
            <tr>
        		<td width="20%" style="text-align: right">
                    <asp:Label ID="LZhzyrs" runat="server" Text="准增员人数"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Zhzyrs" runat="server"></asp:TextBox>
                    位<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                        ControlToValidate="Zhzyrs" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                </td>
                <td width="20%" style="text-align: right">
                    <asp:Label ID="LQyjs" runat="server" Text="签约件数"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Qyjs" runat="server"></asp:TextBox>
                    件<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="Qyjs" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                </td>
        	</tr>
            <tr>
        		<td width="20%" style="text-align: right">
                    <asp:Label ID="LField1" runat="server" Text="自定义字段1"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Field1" runat="server"></asp:TextBox>
                </td>
                <td width="20%" style="text-align: right">
                    <asp:Label ID="LHshbf" runat="server" Text="回收保费"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Hshbf" runat="server"></asp:TextBox>
                    万元<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="Hshbf" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationExpression="^[0-9]+(.[0-9]{0,2})?$"></asp:RegularExpressionValidator>
                </td>
        	</tr>
            <tr>
        		<td width="20%" style="text-align: right">
                    <asp:Label ID="LField2" runat="server" Text="自定义字段2"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Field2" runat="server"></asp:TextBox>
                </td>
                <td width="20%" style="text-align: right">
                    <asp:Label ID="LField3" runat="server" Text="自定义字段3"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Field3" runat="server"></asp:TextBox>
                </td>
        	</tr>
            <tr>
        		<td width="20%" style="text-align: right">
                    <asp:Label ID="LField4" runat="server" Text="自定义字段4"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Field4" runat="server"></asp:TextBox>
                </td>
                <td width="20%" style="text-align: right">
                    <asp:Label ID="LField5" runat="server" Text="自定义字段5"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Field5" runat="server" ></asp:TextBox>
                </td>
        	</tr>
        </table>
        </div>
        </td>
        </tr>
    </table>
    </div>
        </td>
        </tr>
    </table>
    </div>
    </div>
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
    
    </form>
</body>
</html>
