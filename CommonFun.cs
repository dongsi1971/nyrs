using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Data;
using System.Data.Common;

namespace nyrs
{
    public class CommonFun
    {
        DataTable dt;
        public  CommonFun(string TableName)
        {
            DbHelper db = new DbHelper();
            DbCommand cmd = db.GetSqlStringCommond("select * from CustomField where TableName='"+TableName+"'");
            dt = db.ExecuteDataTable(cmd);
        }
        public static void Show(System.Web.UI.Page page, string msg) //显示前台对话框
        {
            page.ClientScript.RegisterStartupScript(page.GetType(), "message", "<script language='javascript' defer>alert('" + msg.ToString() + "');</script>");
        }
       
        /// <summary>  
        /// 导出方法  
        /// </summary>  
        /// <param name="GridView"></param>  
        /// <param name="filename">保存的文件名称</param>  
        public static void ExportGridViewForUTF8(GridView GridView, string filename) //导出gridview控件中的数据到excel文件中
        {

            string attachment = "attachment; filename=" + filename;

            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.AddHeader("content-disposition", attachment);

            HttpContext.Current.Response.Charset = "UTF-8";
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.GetEncoding("UTF-8");
            HttpContext.Current.Response.ContentType = "application/ms-excel";
            System.IO.StringWriter sw = new System.IO.StringWriter();

            HtmlTextWriter htw = new HtmlTextWriter(sw);
            GridView.RenderControl(htw);

            HttpContext.Current.Response.Output.Write(sw.ToString());
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();

        }
        public bool isVisibleTrue(string fieldName)
        {
            bool flag = true;
            foreach (DataRow row in dt.Rows)
            {
                if (row["ColumnName"].ToString() == fieldName)
                {
                    flag = (bool)row["IsVisible"];
                }
            }
            return flag;
        }
        public bool isEditTrue(string fieldName)
        {
            bool flag = true;
            foreach (DataRow row in dt.Rows)
            {
                if (row["ColumnName"].ToString() == fieldName)
                {
                    flag = (bool)row["IsEdit"];
                }
            }
            return flag;
        }
        public string labelName(string fieldName)
        {
            string lName = "";
            foreach (DataRow row in dt.Rows)
            {
                if (row["ColumnName"].ToString() == fieldName)
                {
                    if (row["CustomName"].ToString().Length == 0)
                        lName = row["DefaultName"].ToString();
                    else
                        lName = row["CustomName"].ToString();
                }
            }
            return lName;

        }
    }
}