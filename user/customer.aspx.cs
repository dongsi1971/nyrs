using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Common;

namespace nyrs.user
{
    public partial class customer : System.Web.UI.Page
    {
        CommonFun cf = new CommonFun("CustomerInfo");
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

        protected void BAdd_Click(object sender, EventArgs e)
        {
            initField();
        }

        protected void BDelete_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex != -1)
            {
                string delstr = "delete CustomerInfo where CustomerID=" + GridView1.SelectedDataKey[0].ToString();
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
            string operid = Session["OperatorID"].ToString();
            string sqlstr = "";
            if (GridView1.SelectedIndex == -1)
            {
                sqlstr = @"insert into CustomerInfo(CustomerName,CreateDate,MeetTitleID,YwyID,
                                   ClientTypeID,Sex,Age,Worked,Phone,Yqd,Hshbf,Hfqk,Remark,Field1,Field2,Field3,OperatorID,OrganizeID) values('"
                          + CustomerName.Text.Trim() + "',getdate(),"
                          + MeetTitleID.SelectedValue + ","
                          + ywyID.SelectedValue + ","
                          + ClientTypeID.SelectedValue + ","
                          + Sex.SelectedValue + ","
                          + Age.Text.Trim() + ",'"
                          + Worked.Text.Trim() + "','"
                          + Phone.Text.Trim() + "',"
                          + Yqd.Text.Trim() + ","
                          + Hshbf.Text.Trim() + ",'"
                          + Hfqk.Text.Trim() + "','"
                          + Remark.Text.Trim() + "','"
                          + Field1.Text.Trim() + "','"
                          + Field2.Text.Trim() + "','"
                          + Field3.Text.Trim() + "',"
                          + Session["OperatorID"].ToString() + ","
                          + Session["OrganizeID"].ToString() + ")";

            }
            else
            {
                sqlstr = @"update CustomerInfo set CustomerName='" + CustomerName.Text.Trim() + "',MeetTitleID=" + MeetTitleID.SelectedValue
                    + ",YwyID=" + ywyID.SelectedValue + ",ClientTypeID=" + ClientTypeID.SelectedValue + ",Sex=" + Sex.SelectedValue
                    + ",Age=" + Age.Text.Trim() + ",Worked='" + Worked.Text.Trim() + "', Phone='" + Phone.Text.Trim() + "',Yqd=" + Yqd.Text.Trim()
                    + ",Hshbf=" + Hshbf.Text.Trim() + ",Hfqk='" + Hfqk.Text.Trim() + "',Remark='" + Remark.Text.Trim() 
                    + "',Field1='" + Field1.Text.Trim() + "',Field2='" + Field2.Text.Trim() + "',Field3='" + Field3.Text.Trim()
                    + "' where CustomerID=" + GridView1.SelectedDataKey[0].ToString();
            }

            DbHelper db = new DbHelper();
            DbCommand cmd = db.GetSqlStringCommond(sqlstr);
            db.ExecuteNonQuery(cmd);
            GridView1.DataBind();
            initField();
        }
        protected void initField()
        {

            ywyID.Visible = LywyName.Visible = cf.isVisibleTrue("YwyName");
            LywyName.Text = cf.labelName("YwyName");
           // ywyID.SelectedIndex=-1;

            CustomerName.Visible = LCustomerName.Visible = cf.isVisibleTrue("CustomerName");
            LCustomerName.Text = cf.labelName("CustomerName");
            CustomerName.Text = " ";

            ClientTypeID.Visible = LCustomerType.Visible = cf.isVisibleTrue("clientType");
            LCustomerType.Text = cf.labelName("clientType");
            ClientTypeID.SelectedIndex = -1;
            ClientTypeID.SelectedValue="4";


            MeetTitleID.Visible = LMeettitle.Visible = cf.isVisibleTrue("Meettitle");
            LMeettitle.Text = cf.labelName("Meettitle");
            MeetTitleID.SelectedIndex = -1;


            Sex.Visible = LSex.Visible = cf.isVisibleTrue("Sex");
            LSex.Text = cf.labelName("Sex");
            Sex.SelectedIndex = -1;

            Age.Visible = LAge.Visible = cf.isVisibleTrue("Age");
            LAge.Text = cf.labelName("Age");
            Age.Text = "0";



            Worked.Visible = LWorked.Visible = cf.isVisibleTrue("Worked");
            LWorked.Text = cf.labelName("Worked");
            Worked.Text = " ";



            Phone.Visible = LPhone.Visible = cf.isVisibleTrue("Phone");
            LPhone.Text = cf.labelName("Phone");
            Phone.Text = " ";


            Yqd.Visible = LYqd.Visible = cf.isVisibleTrue("Yqd");
            LYqd.Text = cf.labelName("Yqd");
            Yqd.Text = "0";

            Hshbf.Visible = LHshbf.Visible = cf.isVisibleTrue("Hshbf");
            LHshbf.Text = cf.labelName("Hshbf");
            Hshbf.Text = "0";


            Hfqk.Visible = LHfqk.Visible = cf.isVisibleTrue("Hfqk");
            LHfqk.Text = cf.labelName("Hfqk");
            Hfqk.SelectedIndex = -1;

            Remark.Visible = LRemark.Visible = cf.isVisibleTrue("Remark");
            LRemark.Text = cf.labelName("Remark");
            Remark.Text = " ";

            Field1.Visible = LField1.Visible = cf.isVisibleTrue("Field1");
            LField1.Text = cf.labelName("Field1");
            Field1.Text = " ";


            Field2.Visible = LField2.Visible = cf.isVisibleTrue("Field2");
            LField2.Text = cf.labelName("Field2");
            Field2.Text = " ";

            Field3.Visible = LField3.Visible = cf.isVisibleTrue("Field3");
            LField3.Text = cf.labelName("Field3");
            Field3.Text = " ";


            GridView1.SelectedIndex = -1;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            ywyID.SelectedValue = GridView1.SelectedDataKey[2].ToString();
            int iCustomerName = returnColumnIndex("CustomerName");
            CustomerName.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[iCustomerName].Text;

            ClientTypeID.SelectedValue = GridView1.SelectedDataKey[3].ToString();

            MeetTitleID.SelectedValue = GridView1.SelectedDataKey[1].ToString();
            int iSex = returnColumnIndex("Sex");
             if(GridView1.Rows[GridView1.SelectedIndex].Cells[iSex].Text=="男")
            {
                Sex.SelectedValue = "0";
            }
             else
             {
                 Sex.SelectedValue = "1";
             }

             int iAge = returnColumnIndex("Age");
             Age.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[iAge].Text;
             int iWorked = returnColumnIndex("Worked");
             Worked.Text = ((Label)(GridView1.Rows[GridView1.SelectedIndex].Cells[iWorked].FindControl("TLWorked"))).Text;
             int iPhone = returnColumnIndex("Phone");
             Phone.Text = ((Label)(GridView1.Rows[GridView1.SelectedIndex].Cells[iPhone].FindControl("TLPhone"))).Text;
             int iYqd = returnColumnIndex("Yqd");
             Yqd.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[iYqd].Text;

             int iHshbf = returnColumnIndex("Hshbf");
             Hshbf.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[iHshbf].Text;
             int iHfqk = returnColumnIndex("Hfqk");
             switch (GridView1.Rows[GridView1.SelectedIndex].Cells[iHfqk].Text)
             {
                 case "优质":
                     Hfqk.SelectedValue = "A";
                     break;
                 case "良好":
                     Hfqk.SelectedValue = "B";
                     break;
                 case "一般":
                     Hfqk.SelectedValue = "C";
                     break;
                 case "拒绝":
                     Hfqk.SelectedValue = "D";
                     break;
                 case "其他":
                     Hfqk.SelectedValue = "E";
                     break;
             }
             int iRemark = returnColumnIndex("Remark");
             Remark.Text = ((Label)(GridView1.Rows[GridView1.SelectedIndex].Cells[iRemark].FindControl("TLRemark"))).Text;
             int iField1 = returnColumnIndex("Field1");
             Field1.Text = ((Label)(GridView1.Rows[GridView1.SelectedIndex].Cells[iField1].FindControl("TLField1"))).Text;
            int iField2 = returnColumnIndex("Field2");
            Field2.Text = ((Label)(GridView1.Rows[GridView1.SelectedIndex].Cells[iField2].FindControl("TLField2"))).Text;
            int iField3 = returnColumnIndex("Field3");
            Field3.Text = ((Label)(GridView1.Rows[GridView1.SelectedIndex].Cells[iField3].FindControl("TLField3"))).Text;
           
        }
    }
}