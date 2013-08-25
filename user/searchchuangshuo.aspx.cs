﻿using System;
using System.Data;
using System.Data.Common;
using System.Web.UI.WebControls;
using System.Web;
using System.Web.UI;

namespace nyrs.user
{
    public partial class searchchuangshuo : System.Web.UI.Page
    {
        CommonFun cf = new CommonFun("ChuangShuo");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.AddDropdown();
            }
        }

        protected void CBOrg_CheckedChanged(object sender, EventArgs e)
        {

                DropDownList1.Enabled=CBOrg.Checked;

        }

        protected void CBDateTime_CheckedChanged(object sender, EventArgs e)
        {
            StartDate.Enabled = CBDateTime.Checked;
            EndDate.Enabled = CBDateTime.Checked;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            StartDate_PopupControlExtender.Commit(Calendar1.SelectedDate.ToShortDateString());
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            EndDate_PopupControlExtender.Commit(Calendar2.SelectedDate.ToShortDateString());
        }

        protected void AddDropdown()
        {
            string orgid=Session["OrganizeID"].ToString();
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
            if (dt.Rows.Count>0)
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            string wherestr = " where 1=1";
            if (CBOrg.Checked)
            {
                string selectorgid=DropDownList1.SelectedValue;
                if (selectorgid=="1")
                {
                    wherestr += " and ChuangShuo.OrganizeID in (select OrganizeID from Organize)";
                } 
                else
                {
                    wherestr += " and ChuangShuo.OrganizeID in (select OrganizeID from Organize where organizeid=" + selectorgid + " or parentid=" + selectorgid + ")";
                }
           
            }
            else
            {
                wherestr += " and ChuangShuo.OrganizeID in (select OrganizeID from Organize where organizeid=" + Session["OrganizeID"].ToString() + " or parentid=" + Session["OrganizeID"].ToString() + ")";
            }
            if (CBDateTime.Checked)
            {
                if (StartDate.Text.Length==0 || EndDate.Text.Length==0)
                {
                    CommonFun.Show(this, "请选择起止日期!");
                    return;
                } 
                else
                {
                    wherestr += " and ChuangShuo.HoldDate between '" + StartDate.Text + "' and '" + EndDate.Text + "'";
                }
            }

            string selectstr = @"SELECT ChuangShuo.HoldDate, ChuangShuo.HoldAddr, ChuangShuo.ComeZhzrs,
            ChuangShuo.Xchmsrs, ChuangShuo.jfrs, ChuangShuo.Pxrs, ChuangShuo.shgrs, ChuangShuo.Dzkrs, 
            ChuangShuo.tgrs, ChuangShuo.Field1, ChuangShuo.Field2, ChuangShuo.Field3, ChuangShuo.Field4, 
            ChuangShuo.Field5, Organize.OrgName FROM ChuangShuo INNER JOIN Organize ON 
            ChuangShuo.OrganizeID = Organize.OrganizeID " + wherestr;

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