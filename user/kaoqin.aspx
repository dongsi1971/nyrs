<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kaoqin.aspx.cs" Inherits="nyrs.user.kaoqin" %>

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
    <table border="0" cellspacing="0" cellpadding="0" width="100%" style="background-color: #E0FFFF;color: #333333;">
    	<tr>
    		<td width="100%" height="230px" valign="top">
             <div style="overflow: scroll">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    DataSourceID="SqlDataSource1" EnableModelValidation="True" 
                    
                    onselectedindexchanged="GridView1_SelectedIndexChanged" 
                    DataKeyNames="KaoqinID">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="KaoqinDate" HeaderText="考勤日期" 
                            SortExpression="KaoqinDate" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="Rs" HeaderText="出勤人数" 
                            SortExpression="Rs" />
                        <asp:TemplateField HeaderText="备注" SortExpression="remark">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("remark") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="TLremark" runat="server" Text='<%# Bind("remark") %>'></asp:Label>
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
                    
                    
                    
                     SelectCommand="SELECT KaoqinDate, Rs, remark, KaoqinID FROM kaoqin WHERE (OrganizeID = ?)">
                    <SelectParameters>
                        <asp:SessionParameter Name="OrganizeID" SessionField="OrganizeID" 
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
                <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="BDelete" ConfirmText="确实要删除记录吗？">
            </ajaxToolkit:ConfirmButtonExtender>
            <asp:Button ID="BSave" runat="server" Text="保存" onclick="BSave_Click" 
                UseSubmitBehavior="False" ValidationGroup="newvalue" />
        </div>
        <div align="center">
        
        <table border="1" cellspacing="0" cellpadding="0" width="80%">
        	<tr>
        		<td  style="text-align: right">
                    <asp:Label ID="LKaoqinDate" runat="server" Text="考勤时间"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="KaoqinDate" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="*" ControlToValidate="KaoqinDate" ValidationGroup="newvalue"></asp:RequiredFieldValidator>
                    <ajaxToolkit:PopupControlExtender ID="KaoqinDate_PopupControlExtender" 
                        runat="server" DynamicServicePath="" Enabled="True" PopupControlID="UpdatePanel1"
                         CommitProperty="value" CommitScript="e.value" OffsetY="-30" OffsetX="30"
                        TargetControlID="KaoqinDate">
                    </ajaxToolkit:PopupControlExtender>
                </td>
                <td  style="text-align: right">
                    <asp:Label ID="LRs" runat="server" Text="出勤人数"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="Rs" runat="server" CausesValidation="True"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="Rs" SetFocusOnError="True" 
                        ValidationExpression="^[0-9]*$">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="Rs" ErrorMessage="*" ValidationGroup="newvalue"></asp:RequiredFieldValidator>
                </td>
        	</tr>
            <tr>
        		<td width="20%" style="text-align: right">
                    <asp:Label ID="Lremark" runat="server" Text="备注"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="remark" runat="server"></asp:TextBox>
                </td>
                <td width="20%" style="text-align: right">
                    &nbsp;</td>
                <td style="text-align: left">
                    &nbsp;</td>
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
