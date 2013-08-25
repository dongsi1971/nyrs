<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chuangshuo.aspx.cs" Inherits="nyrs.user.chuangshuo" %>

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
    <table border="0" cellspacing="0" cellpadding="0" width="100%" style="background-color: #E0FFFF;color: #333333;">
    	<tr>
    		<td width="100%" height="230px" valign="top">
            <div style="overflow: scroll">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="ChuangShuoID" DataSourceID="SqlDataSource1" 
                    EnableModelValidation="True" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" AllowPaging="True" 
                    HorizontalAlign="Center" ShowFooter="True" Width="100%" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    onrowdatabound="GridView1_RowDataBound" ondatabound="GridView1_DataBound">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="选择" />
                        <asp:BoundField DataField="HoldDate" HeaderText="举办时间" 
                            SortExpression="HoldDate" DataFormatString="{0:yyyy-MM-dd}" 
                            HtmlEncode="False" />
                        <asp:TemplateField HeaderText="举办地点" SortExpression="HoldAddr">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HoldAddr") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="TLHoldAddr" runat="server" Text='<%# Bind("HoldAddr") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ComeZhzrs" HeaderText="到场准增员人数" 
                            SortExpression="ComeZhzrs" HtmlEncode="False" />
                        <asp:BoundField DataField="Xchmsrs" HeaderText="现场面试人数" 
                            SortExpression="Xchmsrs" HtmlEncode="False" />
                        <asp:BoundField DataField="jfrs" HeaderText="缴费人数" 
                            SortExpression="jfrs" HtmlEncode="False" />
                        <asp:BoundField DataField="Pxrs" HeaderText="培训人数" 
                            SortExpression="Pxrs" HtmlEncode="False" />
                        <asp:BoundField DataField="shgrs" HeaderText="上岗人数" SortExpression="shgrs" 
                            HtmlEncode="False" />
                        <asp:BoundField DataField="Dzkrs" HeaderText="代资考人数" SortExpression="Dzkrs" 
                            HtmlEncode="False" />
                        <asp:BoundField DataField="tgrs" HeaderText="通过人数" SortExpression="tgrs" 
                            HtmlEncode="False" />
                        <asp:TemplateField HeaderText="自定义字段1" SortExpression="Field1">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Field1") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="TLField1" runat="server" Text='<%# Bind("Field1") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="自定义字段2" SortExpression="Field2">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Field2") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="TLField2" runat="server" Text='<%# Bind("Field2") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="自定义字段3" SortExpression="Field3">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Field3") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="TLField3" runat="server" Text='<%# Bind("Field3") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="自定义字段4" SortExpression="Field4">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Field4") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="TLField4" runat="server" Text='<%# Bind("Field4") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="自定义字段5" SortExpression="Field5">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Field5") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="TLField5" runat="server" Text='<%# Bind("Field5") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" 
                        Wrap="False" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" Wrap="False" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
                    SelectCommand="SELECT * FROM [ChuangShuo] WHERE ([OperatorID] = ?) ORDER BY [ChuangShuoID] DESC">
                    <SelectParameters>
                        <asp:SessionParameter Name="OperatorID" SessionField="OperatorID" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
    	</tr>
        <tr>
        <td>
        <div class="toolbar">
            
            <asp:Button ID="BDelete" runat="server" Text="删除" onclick="BDelete_Click" 
                UseSubmitBehavior="False" 
                 />
                 <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="BDelete" ConfirmText="确实要删除记录吗？">
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
                    <asp:Label ID="LComeZhzrs" runat="server" Text="到场准增员人数"></asp:Label>

                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="ComeZhzrs" runat="server"></asp:TextBox>
                    位<asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
                        ControlToValidate="ComeZhzrs" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                </td>
                <td width="20%" style="text-align: right">
                    <asp:Label ID="LXchmsrs" runat="server" Text="现场面试人数"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Xchmsrs" runat="server"></asp:TextBox>
                    位<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="Xchmsrs" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                </td>
        	</tr>
            <tr>
        		<td width="20%" style="text-align: right">
                    <asp:Label ID="Ljfrs" runat="server" Text="缴费人数"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="jfrs" runat="server"></asp:TextBox>
                    位<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="jfrs" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                </td>
                <td width="20%" style="text-align: right">
                    <asp:Label ID="LPxrs" runat="server" Text="培训人数"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Pxrs" runat="server"></asp:TextBox>
                    位<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="Pxrs" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                </td>
        	</tr>
            <tr>
        		<td width="20%" style="text-align: right">
                    <asp:Label ID="Lshgrs" runat="server" Text="上岗人数"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="shgrs" runat="server"></asp:TextBox>
                    位<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="shgrs" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                </td>
                <td width="20%" style="text-align: right">
                    <asp:Label ID="LDzkrs" runat="server" Text="代资考人数"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Dzkrs" runat="server"></asp:TextBox>
                    位<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                        ControlToValidate="Dzkrs" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                </td>
        	</tr>
            <tr>
        		<td width="20%" style="text-align: right">
                    <asp:Label ID="Ltgrs" runat="server" Text="通过人数"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="tgrs" runat="server"></asp:TextBox>
                    位<asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                        ControlToValidate="tgrs" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                </td>
                <td width="20%" style="text-align: right">
                    <asp:Label ID="LField1" runat="server" Text="自定义字段1"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Field1" runat="server"></asp:TextBox>
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
                    <asp:TextBox ID="Field5" runat="server"></asp:TextBox>
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
