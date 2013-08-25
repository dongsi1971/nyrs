using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Common;
namespace nyrs.user
{
    public partial class twomeeting : System.Web.UI.Page
    {
        CommonFun cf = new CommonFun("TwoMeeting");
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                initField();
            }
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

        protected void BDelete_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex != -1)
            {
                string delstr = "delete TwoMeeting where TwoMeetID=" + GridView1.SelectedDataKey[0].ToString();
                DbHelper db = new DbHelper();
                DbCommand cmd = db.GetSqlStringCommond(delstr);
                db.ExecuteNonQuery(cmd);
                GridView1.DataBind();
                initField();
            }
        }

        protected void BAdd_Click(object sender, EventArgs e)
        {
            initField();
        }

        protected void BSave_Click(object sender, EventArgs e)
        {
            string Orgid = Session["OrganizeID"].ToString();
            string operid = Session["OperatorID"].ToString();
            string sqlstr = "";
            if (GridView1.SelectedIndex == -1)
            {
                sqlstr = @"insert into TwoMeeting(HoldDate,HoldAddr,HoldName,HoldFormID,ComePeopleNum,Qybf,
                                   Qyjs,Zhzyrs,Hshbf,Field1,Field2,Field3,Field4,Field5,OperatorID,OrganizeID) values('"
                          + HoldDate.Text.Trim() + "','"
                          + HoldAddr.Text.Trim() + "','"
                          + HoldName.Text.Trim() + "',"
                          + FormType.SelectedValue + ","
                          + ComePeopleNum.Text.Trim() + ","
                          + Qybf.Text.Trim() + ","
                          + Qyjs.Text.Trim() + ","
                          + Zhzyrs.Text.Trim() + ","
                          + Hshbf.Text.Trim() + ",'"
                          + Field1.Text.Trim() + "','"
                          + Field2.Text.Trim() + "','"
                          + Field3.Text.Trim() + "','"
                          + Field4.Text.Trim() + "','"
                          + Field5.Text.Trim() + "'," + Session["OperatorID"].ToString() + ","
                          + Session["OrganizeID"].ToString() + ")";

            }
            else
            {
                sqlstr = @"update TwoMeeting set HoldDate='" + HoldDate.Text.Trim() + "',HoldAddr='" + HoldAddr.Text.Trim()
                    +"',HoldName='"+HoldName.Text.Trim()
                    + "',HoldFormID=" + FormType.SelectedValue + ",ComePeopleNum=" + ComePeopleNum.Text.Trim() + ",Qybf=" + Qybf.Text.Trim()
                    + ",Qyjs=" + Qyjs.Text.Trim() + ",Zhzyrs=" + Zhzyrs.Text.Trim() + ", Hshbf=" + Hshbf.Text.Trim() 
                    + ",Field1='" + Field1.Text.Trim() + "',Field2='" + Field2.Text.Trim() + "',Field3='" + Field3.Text.Trim()
                    + "',Field4='" + Field4.Text.Trim() + "',Field5='" + Field5.Text.Trim() + "' where TwoMeetID=" + GridView1.SelectedDataKey[0].ToString();
            }

            DbHelper db = new DbHelper();
            DbCommand cmd = db.GetSqlStringCommond(sqlstr);
            db.ExecuteNonQuery(cmd);
            GridView1.DataBind();
            initField();
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            HoldDate_PopupControlExtender.Commit(Calendar1.SelectedDate.ToShortDateString());
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
        public string returnHoldFormID(string FormType)
        {
            string ret = "-1";
            DbHelper db = new DbHelper();
            DbCommand cmd = db.GetSqlStringCommond("select HoldFormID from Holdform where formtype='" + FormType + "'");
            DataTable dt = db.ExecuteDataTable(cmd);
            ret = dt.Rows[0][0].ToString();
            return ret;

        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int iHoldDate = returnColumnIndex("HoldDate");
            HoldDate.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[iHoldDate].Text;
            int iHoldAddr = returnColumnIndex("HoldAddr");
            HoldAddr.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[iHoldAddr].Text;
            int iHoldName = returnColumnIndex("HoldName");
            HoldName.Text = ((Label)(GridView1.Rows[GridView1.SelectedIndex].Cells[iHoldName].FindControl("TLHoldName"))).Text;
            int iFormType = returnColumnIndex("FormType");
            FormType.SelectedValue =returnHoldFormID(GridView1.Rows[GridView1.SelectedIndex].Cells[iFormType].Text);
            int iComePeopleNum = returnColumnIndex("ComePeopleNum");
            ComePeopleNum.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[iComePeopleNum].Text;
            int iQybf = returnColumnIndex("Qybf");
            Qybf.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[iQybf].Text;
            int iQyjs = returnColumnIndex("Qyjs");
            Qyjs.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[iQyjs].Text;
            int iZhzyrs = returnColumnIndex("Zhzyrs");
            Zhzyrs.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[iZhzyrs].Text;
            int iHshbf = returnColumnIndex("Hshbf");
            Hshbf.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[iHshbf].Text;
           
            

            int iField1 = returnColumnIndex("Field1");
            Field1.Text = ((Label)(GridView1.Rows[GridView1.SelectedIndex].Cells[iField1].FindControl("TLField1"))).Text;
            int iField2 = returnColumnIndex("Field2");
            Field2.Text = ((Label)(GridView1.Rows[GridView1.SelectedIndex].Cells[iField2].FindControl("TLField2"))).Text;
            int iField3 = returnColumnIndex("Field3");
            Field3.Text = ((Label)(GridView1.Rows[GridView1.SelectedIndex].Cells[iField3].FindControl("TLField3"))).Text;
            int iField4 = returnColumnIndex("Field4");
            Field4.Text = ((Label)(GridView1.Rows[GridView1.SelectedIndex].Cells[iField4].FindControl("TLField4"))).Text;
            int iField5 = returnColumnIndex("Field5");
            Field5.Text = ((Label)(GridView1.Rows[GridView1.SelectedIndex].Cells[iField5].FindControl("TLField5"))).Text;
        }
        protected void initField()
        {

            HoldDate.Visible = LHoldDate.Visible = cf.isVisibleTrue("HoldDate");
            LHoldDate.Text = cf.labelName("HoldDate");
            HoldDate.Text = "";

            HoldAddr.Visible = LHoldAddr.Visible = cf.isVisibleTrue("HoldAddr");
            LHoldAddr.Text = cf.labelName("HoldAddr");
            HoldAddr.Text = "";
            HoldName.Visible = LHoldName.Visible = cf.isVisibleTrue("HoldName");
            LHoldName.Text = cf.labelName("HoldName");
            HoldName.Text = "";

            FormType.Visible = LFormType.Visible = cf.isVisibleTrue("FormType");
            LFormType.Text = cf.labelName("FormType");
            //FormType.Text = "0";


            ComePeopleNum.Visible = LComePeopleNum.Visible = cf.isVisibleTrue("ComePeopleNum");
            LComePeopleNum.Text = cf.labelName("ComePeopleNum");
            ComePeopleNum.Text = "0";


            Qybf.Visible = LQybf.Visible = cf.isVisibleTrue("Qybf");
            LQybf.Text = cf.labelName("Qybf");
            Qybf.Text = "0";


            Qyjs.Visible = LQyjs.Visible = cf.isVisibleTrue("Qyjs");
            LQyjs.Text = cf.labelName("Qyjs");
            Qyjs.Text = "0";



            Zhzyrs.Visible = LZhzyrs.Visible = cf.isVisibleTrue("Zhzyrs");
            LZhzyrs.Text = cf.labelName("Zhzyrs");
            Zhzyrs.Text = "0";



            Hshbf.Visible = LHshbf.Visible = cf.isVisibleTrue("Hshbf");
            LHshbf.Text = cf.labelName("Hshbf");
            Hshbf.Text = "0";



            Field1.Visible = LField1.Visible = cf.isVisibleTrue("Field1");
            LField1.Text = cf.labelName("Field1");
            Field1.Text = " ";


            Field2.Visible = LField2.Visible = cf.isVisibleTrue("Field2");
            LField2.Text = cf.labelName("Field2");
            Field2.Text = " ";

            Field3.Visible = LField3.Visible = cf.isVisibleTrue("Field3");
            LField3.Text = cf.labelName("Field3");
            Field3.Text = " ";

            Field4.Visible = LField4.Visible = cf.isVisibleTrue("Field4");
            LField4.Text = cf.labelName("Field4");
            Field4.Text = " ";


            Field5.Visible = LField5.Visible = cf.isVisibleTrue("Field5");
            LField5.Text = cf.labelName("Field5");
            Field5.Text = " ";


            GridView1.SelectedIndex = -1;
        }

       

    }
}