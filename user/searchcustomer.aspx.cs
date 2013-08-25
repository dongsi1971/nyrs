using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Common;
using System.Data;

namespace nyrs.user
{
    public partial class searchcustomer : System.Web.UI.Page
    {
        CommonFun cf = new CommonFun("CustomerInfo");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.AddDropdown();
            }
        }
        protected void AddDropdown()
        {
            string orgid = Session["OrganizeID"].ToString();
            string wherestr = "";
            switch (Session["TreeLevel"].ToString())
            {
                case "1":
                    wherestr = "where 1=1";
                    break;
                case "2":
                    wherestr = "where organizeid=" + orgid + " or parentid=" + orgid;
                    break;
                case "3":
                    wherestr = "where organizeid=" + orgid;
                    break;
            }

            string selectstr = "select organizeid,orgname from organize " + wherestr;
            DbHelper db = new DbHelper();
            DbCommand cmd = db.GetSqlStringCommond(selectstr);
            DataTable dt = db.ExecuteDataTable(cmd);
            DropDownList1.Items.Clear();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    ListItem item = new ListItem();
                    item.Value = row["organizeid"].ToString();
                    item.Text = row["orgname"].ToString();
                    DropDownList1.Items.Add(item);
                }
            }

        }
        protected void CBOrg_CheckedChanged(object sender, EventArgs e)
        {
            DropDownList1.Enabled = CBOrg.Checked;
        }

        protected void CBDateTime_CheckedChanged(object sender, EventArgs e)
        {
            StartDate.Enabled = CBDateTime.Checked;
            EndDate.Enabled = CBDateTime.Checked;
        }

        protected void CBMeettitle_CheckedChanged(object sender, EventArgs e)
        {
            DropDownList2.Enabled = CBMeettitle.Checked;
        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            StartDate_PopupControlExtender.Commit(Calendar1.SelectedDate.ToShortDateString());
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            EndDate_PopupControlExtender.Commit(Calendar2.SelectedDate.ToShortDateString());
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string wherestr = " where 1=1";
            if (CBOrg.Checked)
            {
                string selectorgid = DropDownList1.SelectedValue;
                if (selectorgid == "1")
                {
                    wherestr += " and CustomerInfo.OrganizeID in (select OrganizeID from Organize)";
                }
                else
                {
                    wherestr += " and CustomerInfo.OrganizeID in (select OrganizeID from Organize where organizeid=" + selectorgid + " or parentid=" + selectorgid + ")";
                }

            }
            else
            {
                wherestr += " and CustomerInfo.OrganizeID in (select OrganizeID from Organize where organizeid=" + Session["OrganizeID"].ToString() + " or parentid=" + Session["OrganizeID"].ToString() + ")";
            }
            if (CBDateTime.Checked)
            {
                if (StartDate.Text.Length == 0 || EndDate.Text.Length == 0)
                {
                    CommonFun.Show(this, "请选择起止日期!");
                    return;
                }
                else
                {
                    wherestr += " and CustomerInfo.CreateDate between '" + StartDate.Text + "' and '" + EndDate.Text + "'";
                }
            }
            if (CBMeettitle.Checked)
            {
                wherestr += " and CustomerInfo.MeetTitleID=" + DropDownList2.SelectedValue;
            }

            if (CBYwy.Checked)
            {
                wherestr += " and CustomerInfo.YwyID=" + ywy.SelectedValue;
            }
            string selectstr = @"SELECT YwyInfo.YwyName, CustomerInfo.CustomerName, CustomerInfo.CreateDate, 
            Meettitle.Meettitle, ClientType.clientType, Organize.OrgName, CustomerInfo.Sex, CustomerInfo.Age, 
            CustomerInfo.Worked, CustomerInfo.Phone, CustomerInfo.Yqd, CustomerInfo.Hshbf, CustomerInfo.Hfqk, 
            CustomerInfo.Remark, CustomerInfo.Field1, CustomerInfo.Field2, CustomerInfo.Field3, 
            CustomerInfo.OperatorID FROM CustomerInfo INNER JOIN ClientType 
            ON CustomerInfo.ClientTypeID = ClientType.ClientTypeID INNER JOIN Meettitle 
            ON CustomerInfo.MeetTitleID = Meettitle.MeetTitleID INNER JOIN Organize 
            ON CustomerInfo.OrganizeID = Organize.OrganizeID INNER JOIN YwyInfo 
            ON CustomerInfo.YwyID = YwyInfo.YwyID " + wherestr;
            Session["selectstr"] = selectstr;
            int recount = BindData();
            LPage.Visible = true;
            LPage.Text = "共" + recount.ToString() + "条记录，每页" + GridView1.PageSize.ToString() + "条记录";
        }
        public DataTable getSelectData(string sqlstr)
        {
            DataTable dt;

            DbHelper dh = new DbHelper();
            DbCommand cmd = dh.GetSqlStringCommond(sqlstr);
            dt = dh.ExecuteDataTable(cmd);
            return dt;
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count > 0)
            {
                //调用导出方法  
                GridView1.AllowPaging = false;
                BindData();
                ExportGridViewForUTF8(GridView1, DateTime.Now.ToShortDateString() + ".xls");
            }
            else
            {
                CommonFun.Show(this, "没有数据可导出，请先查询数据!");
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);  
        }
        public static void ExportGridViewForUTF8(GridView GridView, string filename) //导出gridview控件中的数据到excel文件中
        {

            string attachment = "attachment; filename=" + filename;

            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.AddHeader("content-disposition", attachment);

            HttpContext.Current.Response.Charset = "GB2312";
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
            HttpContext.Current.Response.ContentType = "application/ms-excel";
            System.IO.StringWriter sw = new System.IO.StringWriter();

            HtmlTextWriter htw = new HtmlTextWriter(sw);
            GridView.RenderControl(htw);

            HttpContext.Current.Response.Output.Write(sw.ToString());
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();

        }
        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count > 0)
            {

                for (int i = 0; i < GridView1.Columns.Count; i++)
                {

                    GridView1.HeaderRow.Cells[i].Text = cf.labelName(GridView1.Columns[i].SortExpression);
                    GridView1.Columns[i].Visible = cf.isVisibleTrue(GridView1.Columns[i].SortExpression);
                }
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            int iSex = returnColumnIndex("Sex");
            int ihfqk = returnColumnIndex("Hfqk");
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[iSex].Text == "False")
                {
                    e.Row.Cells[iSex].Text = "男";
                }
                else
                {
                    e.Row.Cells[iSex].Text = "女";
                }
                switch (e.Row.Cells[ihfqk].Text)
                {
                    case "A":
                        e.Row.Cells[ihfqk].Text = "优质";
                        break;
                    case "B":
                        e.Row.Cells[ihfqk].Text = "良好";
                        break;
                    case "C":
                        e.Row.Cells[ihfqk].Text = "一般";
                        break;
                    case "D":
                        e.Row.Cells[ihfqk].Text = "拒绝";
                        break;
                    case "E":
                        e.Row.Cells[ihfqk].Text = "其他";
                        break;
                }
            }

        }
        public int returnColumnIndex(string ColumnName)
        {
            int ci = -1;
            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                if (GridView1.Columns[i].GetType().ToString() == "System.Web.UI.WebControls.BoundField")
                {
                    if (ColumnName == ((BoundField)(GridView1.Columns[i])).DataField)
                    {
                        ci = i;
                        break;
                    }
                }

            }
            return ci;
        }

        protected void CBYwy_CheckedChanged(object sender, EventArgs e)
        {
            ywy.Enabled = CBYwy.Checked;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.GridView1.PageIndex = e.NewPageIndex;
            BindData();
        }

        private int BindData()
        {
            string selectstr = Session["selectstr"].ToString();
            DataTable dt = getSelectData(selectstr);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            return dt.Rows.Count;
        }
    }
}