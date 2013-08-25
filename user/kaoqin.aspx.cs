using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Common;

namespace nyrs.user
{
    public partial class kaoqin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                initField();
            }
        }

       

        protected void BDelete_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex != -1)
            {
                string delstr = "delete kaoqin where KaoqinID=" + GridView1.SelectedDataKey[0].ToString();
                DbHelper db = new DbHelper();
                DbCommand cmd = db.GetSqlStringCommond(delstr);
                db.ExecuteNonQuery(cmd);
                GridView1.DataBind();
                initField();
            }
        }

        protected void BSave_Click(object sender, EventArgs e)
        {
            string Orgid = Session["OrganizeID"].ToString();
            
            string sqlstr = "";
            if (GridView1.SelectedIndex == -1)
            {
                sqlstr = @"insert into kaoqin(KaoqinDate,Rs,remark,OrganizeID) values('"
                          + KaoqinDate.Text.Trim() + "',"
                          + Rs.Text.Trim() + ",'"
                          + remark.Text.Trim() + "',"
                          + Orgid + ")";

            }
            else
            {
                sqlstr = @"update kaoqin set KaoqinDate='" + KaoqinDate.Text.Trim() + "',Rs=" + Rs.Text.Trim()
                    + ",remark='" + remark.Text.Trim() + "' where KaoqinID=" + GridView1.SelectedDataKey[0].ToString();
            }

            DbHelper db = new DbHelper();
            DbCommand cmd = db.GetSqlStringCommond(sqlstr);
            db.ExecuteNonQuery(cmd);
            GridView1.DataBind();
            initField();
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            KaoqinDate_PopupControlExtender.Commit(Calendar1.SelectedDate.ToShortDateString());
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int iKaoqinDate = returnColumnIndex("KaoqinDate");
            KaoqinDate.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[iKaoqinDate].Text;
            int iRs = returnColumnIndex("Rs");
            Rs.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[iRs].Text;
            int iremark = returnColumnIndex("remark");
            remark.Text = ((Label)(GridView1.Rows[GridView1.SelectedIndex].Cells[iremark].FindControl("TLremark"))).Text;
        }
        public void initField()
        {
            KaoqinDate.Text = "";
            Rs.Text = "0";
            remark.Text = " ";
            GridView1.SelectedIndex = -1;
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
                if (GridView1.Columns[i].GetType().ToString() == "System.Web.UI.WebControls.TemplateField")
                {
                    if (ColumnName == (GridView1.Columns[i].SortExpression))
                    {
                        ci = i;
                        break;
                    }
                }

            }
            return ci;
        }
    }
}