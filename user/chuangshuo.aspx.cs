using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Common;

namespace nyrs.user
{
    public partial class chuangshuo : System.Web.UI.Page
    {
        CommonFun cf = new CommonFun("ChuangShuo");

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                initField();
            }
            

        }
        
       
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int iHoldDate = returnColumnIndex("HoldDate");
            HoldDate.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[iHoldDate].Text;
            int iHoldAddr = returnColumnIndex("HoldAddr");
            HoldAddr.Text = ((Label)(GridView1.Rows[GridView1.SelectedIndex].Cells[iHoldAddr].FindControl("TLHoldAddr"))).Text;
            int iComeZhzrs = returnColumnIndex("ComeZhzrs");
            ComeZhzrs.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[iComeZhzrs].Text; 
            int iXchmsrs = returnColumnIndex("Xchmsrs");
            Xchmsrs.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[iXchmsrs].Text; 
            int ijfrs = returnColumnIndex("jfrs");
            jfrs.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[ijfrs].Text; 
            int iPxrs = returnColumnIndex("Pxrs");
            Pxrs.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[iPxrs].Text; 
            int ishgrs = returnColumnIndex("shgrs");
            shgrs.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[ishgrs].Text; 
            int iDzkrs = returnColumnIndex("Dzkrs");
            Dzkrs.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[iDzkrs].Text; 
            int itgrs = returnColumnIndex("tgrs");
            tgrs.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[itgrs].Text; 
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
        public int returnColumnIndex(string ColumnName)
        {
            int ci = -1;
            for (int i = 0; i < GridView1.Columns.Count;i++ )
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

        protected void initField()
        {

                HoldDate.Visible = LHoldDate.Visible = cf.isVisibleTrue("HoldDate");
                LHoldDate.Text = cf.labelName("HoldDate");
                HoldDate.Text = "";

                HoldAddr.Visible = LHoldAddr.Visible = cf.isVisibleTrue("HoldAddr");
                LHoldAddr.Text = cf.labelName("HoldAddr");
                HoldAddr.Text = "";

                ComeZhzrs.Visible = LComeZhzrs.Visible = cf.isVisibleTrue("ComeZhzrs");
                LComeZhzrs.Text = cf.labelName("ComeZhzrs");
                ComeZhzrs.Text = "0";


                Xchmsrs.Visible = LXchmsrs.Visible = cf.isVisibleTrue("Xchmsrs");
                LXchmsrs.Text = cf.labelName("Xchmsrs");
                Xchmsrs.Text = "0";


                jfrs.Visible = Ljfrs.Visible = cf.isVisibleTrue("jfrs");
                Ljfrs.Text = cf.labelName("jfrs");
                jfrs.Text = "0";


                Pxrs.Visible = LPxrs.Visible = cf.isVisibleTrue("Pxrs");
                LPxrs.Text = cf.labelName("Pxrs");
                Pxrs.Text = "0";



                shgrs.Visible = Lshgrs.Visible = cf.isVisibleTrue("shgrs");
                Lshgrs.Text = cf.labelName("shgrs");
                shgrs.Text = "0";



                Dzkrs.Visible = LDzkrs.Visible = cf.isVisibleTrue("Dzkrs");
                LDzkrs.Text = cf.labelName("Dzkrs");
                Dzkrs.Text = "0";


                tgrs.Visible = Ltgrs.Visible = cf.isVisibleTrue("tgrs");
                Ltgrs.Text = cf.labelName("tgrs");
                tgrs.Text = "0";


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
        protected void BDelete_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex!=-1)
            {
                string delstr = "delete ChuangShuo where ChuangShuoID=" + GridView1.SelectedDataKey[0].ToString();
                DbHelper db = new DbHelper();
                DbCommand cmd = db.GetSqlStringCommond(delstr);
                db.ExecuteNonQuery(cmd);
                GridView1.DataBind();
                initField();
            }
        }

        protected void BSave_Click(object sender, EventArgs e)
        {
            string Orgid=Session["OrganizeID"].ToString();
            string operid=Session["OperatorID"].ToString();
            string sqlstr="";
            if (GridView1.SelectedIndex==-1)
            {
                sqlstr = @"insert into ChuangShuo(HoldDate,HoldAddr,ComeZhzrs,Xchmsrs,jfrs,
                                   Pxrs,shgrs,Dzkrs,tgrs,Field1,Field2,Field3,Field4,Field5,OperatorID,OrganizeID) values('"
                          + HoldDate.Text.Trim() + "','"
                          + HoldAddr.Text.Trim() + "',"
                          + ComeZhzrs.Text.Trim() + ","
                          + Xchmsrs.Text.Trim() + ","
                          + jfrs.Text.Trim() + ","
                          + Pxrs.Text.Trim() + ","
                          + shgrs.Text.Trim() + ","
                          + Dzkrs.Text.Trim() + ","
                          + tgrs.Text.Trim() + ",'"
                          + Field1.Text.Trim() + "','"
                          + Field2.Text.Trim() + "','"
                          + Field3.Text.Trim() + "','"
                          + Field4.Text.Trim() + "','"
                          + Field5.Text.Trim() + "'," + Session["OperatorID"].ToString() + ","
                          + Session["OrganizeID"].ToString() + ")";

            } 
            else
            {
                sqlstr=@"update ChuangShuo set HoldDate='"+HoldDate.Text.Trim() + "',HoldAddr='"+HoldAddr.Text.Trim() 
                    + "',ComeZhzrs="+ ComeZhzrs.Text.Trim() + ",Xchmsrs="+ Xchmsrs.Text.Trim() + ",jfrs="+ jfrs.Text.Trim() 
                    + ",Pxrs=" + Pxrs.Text.Trim() + ",shgrs="+ shgrs.Text.Trim() + ", Dzkrs="  + Dzkrs.Text.Trim() + ",tgrs=" + tgrs.Text.Trim() 
                    + ",Field1='" + Field1.Text.Trim() + "',Field2='"  + Field2.Text.Trim() + "',Field3='" + Field3.Text.Trim()
                    + "',Field4='" + Field4.Text.Trim() + "',Field5='" + Field5.Text.Trim() + "' where ChuangShuoID="+GridView1.SelectedDataKey[0].ToString();
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

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           
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
        
    }
}