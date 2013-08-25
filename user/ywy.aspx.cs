using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Data.Common;
using System.IO;

namespace nyrs.user
{
    public partial class ywy : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void beginProgress()
        {
            //根据ProgressBar.htm显示进度条界面
            string templateFileName = Path.Combine(Server.MapPath("."), "ProgressBar.htm");
            StreamReader reader = new StreamReader(@templateFileName, System.Text.Encoding.GetEncoding("GB2312"));
            string html = reader.ReadToEnd();
            reader.Close();
            Response.Write(html);
            Response.Flush();
        }

        private void setProgress(int percent)
        {
            string jsBlock = "<script>SetPorgressBar('" + percent.ToString() + "'); </script>";
            Response.Write(jsBlock);
            Response.Flush();
        }

        private void finishProgress()
        {
            string jsBlock = "<script>SetCompleted();</script>";
            Response.Write(jsBlock);
            Response.Flush();
        }


        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.InsertItem)
            {
                 TextBox ywycode=(TextBox)ListView1.InsertItem.FindControl("YwyCodeTextBox");
                if (ywycode.Text.Trim().Length==0)
                {
                    e.Cancel = true;
                    Show(this, "请输入业务员代码");
                    return;
                }
               
                 TextBox ywyname = (TextBox)ListView1.InsertItem.FindControl("YwyNameTextBox");
                 if (ywyname.Text.Trim().Length==0)
                {
                    e.Cancel = true;
                    Show(this, "请输入业务员姓名");
                    return;
                }
                 string insertsql = "INSERT INTO YwyInfo(YwyCode, YwyName, OrganizeID) VALUES ('"
                     + ywycode.Text.Trim() + "','"
                     + ywyname.Text.Trim() + "',"
                     + Session["OrganizeID"].ToString() + ")";
                 SqlDataSource1.InsertCommand = insertsql;
             }
        }

        protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            string ywycode =(string)e.NewValues["YwyCode"];
            if (ywycode.Trim().Length == 0)
            {
                e.Cancel = true;
                Show(this, "请输入业务员代码");
                return;
            }
            string ywyname = (string)e.NewValues["YwyName"];
            if (ywyname.Trim().Length == 0)
            {
                e.Cancel = true;
                Show(this, "请输入业务员姓名");
                return;
            }
            string ywyid = e.Keys[0].ToString();

            string updatesql = "UPDATE YwyInfo SET YwyCode = '"
                + ywycode.Trim() + "', YwyName = '"
            + ywyname.Trim() + "' WHERE (YwyID = " + ywyid + ")";
            SqlDataSource1.UpdateCommand = updatesql;
        }
        public static void Show(System.Web.UI.Page page, string msg)
        {
            page.ClientScript.RegisterStartupScript(page.GetType(), "message", "<script language='javascript' defer>alert('" + msg.ToString() + "');</script>");
        }

        protected void BImport_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile == false)//HasFile用来检查FileUpload是否有指定文件
        {
            Show(this, "请选择Excel文件");
            return;//当无文件时,返回
        }
        string IsXls = System.IO.Path.GetExtension(FileUpload1.FileName).ToString().ToLower();//System.IO.Path.GetExtension获得文件的扩展名
        if (IsXls != ".xls")
        {
            Show(this, "你选择的不是Excel文件！"); 
            return;//当选择的不是Excel文件时,返回
        }
        string filename = FileUpload1.FileName;              //获取Execle文件名  DateTime日期函数
        string savePath = Server.MapPath(("upfiles\\") + filename);//Server.MapPath 获得虚拟服务器相对路径
        FileUpload1.SaveAs(savePath);                        //SaveAs 将上传的文件内容保存在服务器上
        DataSet ds = ExcelSqlConnection(savePath, filename);           //调用自定义方法
        DataRow[] dr = ds.Tables[0].Select();            //定义一个DataRow数组
        int rowsnum = ds.Tables[0].Rows.Count;
        if (rowsnum == 0)
        {
            Show(this,"Excel文件是空的！");   //当Excel表为空时,对用户进行提示
        }
        else
        {
            
            int drlength=dr.Length;
            for (int i = 0; i < drlength; i++)
            {
                //前面除了你需要在建立一个“upfiles”的文件夹外，其他的都不用管了，你只需要通过下面的方式获取Excel的值，然后再将这些值用你的方式去插入到数据库里面
                string OrgCode = dr[i]["机构代码"].ToString();
                string ywycode = dr[i]["业务员代码"].ToString();
                string ywyname = dr[i]["业务员"].ToString();
                Insertywy(OrgCode, ywycode, ywyname);
                
                //Response.Write("");
            }
            Show(this, "业务员导入完成!");
            System.IO.File.Delete(savePath);
        }
       

    }

        #region 连接Excel  读取Excel数据   并返回DataSet数据集合
        /// 

        /// 连接Excel  读取Excel数据   并返回DataSet数据集合
        /// 

        /// Excel服务器路径
        /// Excel表名称
        /// 
        public static System.Data.DataSet ExcelSqlConnection(string filepath, string tableName)
        {
            string strCon = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + filepath + ";Extended Properties='Excel 8.0;HDR=YES;IMEX=1'";
            OleDbConnection ExcelConn = new OleDbConnection(strCon);
            try
            {
                string strCom = string.Format("SELECT * FROM [Sheet1$]");
                ExcelConn.Open();
                OleDbDataAdapter myCommand = new OleDbDataAdapter(strCom, ExcelConn);
                DataSet ds = new DataSet();
                myCommand.Fill(ds, "[" + tableName + "$]");
                ExcelConn.Close();
                return ds;
            }
            catch
            {
                ExcelConn.Close();
                return null;
            }
        }
        #endregion

        #region 
        public void Insertywy(string OrgCode, string ywycode, string ywyname)
        {
            if (!IsExist(ywycode))
            {
                string orgid = getOrgID(OrgCode);
                if (orgid.Length > 0)
                {
                    string insertstr="INSERT INTO YwyInfo(YwyCode, YwyName, OrganizeID) VALUES ('"+ywycode+"','"+ywyname+"',"+orgid+")";
                    DbHelper db = new DbHelper();
                    DbCommand cmd = db.GetSqlStringCommond(insertstr);
                    db.ExecuteNonQuery(cmd);
                }
            }
            
            

        }
        #endregion
        #region
        public string getOrgID(string OrgCode)
        {
            
            DbHelper db = new DbHelper();
            string OrgId;
            DbCommand cmd = db.GetSqlStringCommond("select OrganizeID from Organize where OrgCode='" + OrgCode + "'");
            DataTable dt = db.ExecuteDataTable(cmd);
            if (dt.Rows.Count>0)
            {
                OrgId = dt.Rows[0][0].ToString();
            }
            else
            {
                OrgId = "";
            }
            return OrgId;
        }
        #endregion
        #region
        public bool IsExist(string YwyCode)
        {

            DbHelper db = new DbHelper();
            
            DbCommand cmd = db.GetSqlStringCommond("select YwyName from YwyInfo where YwyCode='" + YwyCode + "'");
            DataTable dt = db.ExecuteDataTable(cmd);
            if (dt.Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        }
        #endregion

        protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            string delstr = "update YwyInfo set isdel=1 where YwyID=" + e.Keys[0].ToString();
            SqlDataSource1.DeleteCommand = delstr;
        }
    }
}