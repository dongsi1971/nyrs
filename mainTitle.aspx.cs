using System;
using System.Web.UI;
using System.Data;
using System.Data.Common;
using System.Web.Security;

namespace nyrs
{
    public partial class mainTitle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string curdate = DateTime.Now.ToLongDateString();

                string week = ChineseByEnWeek(DateTime.Now);
                loginuser.Text = "欢迎您：" + Session["OperatorName"].ToString() + ",今天是" + curdate + "  " + week;
            }
        }
        public static string ChineseByEnWeek(DateTime dt)
        {
            switch (dt.DayOfWeek.ToString())
            {
                case "Monday": return "星期一";
                case "Tuesday": return "星期二";
                case "Wednesday": return "星期三";
                case "Thursday": return "星期四";
                case "Friday": return "星期五";
                case "Saturday": return "星期六";
                case "Sunday": return "星期日";
                default: return "";
            }
        }

        protected void IBexit_Click(object sender, ImageClickEventArgs e)
        {

            Session.Abandon();
            Response.Write("<script>window.parent.location.href='/Account/Login.aspx'</script>");
        }

        protected void IBhome_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["LoginName"].ToString() == "admin")
            {
                Response.Write("<script>window.parent.location.href='/admin/mainFrame.htm'</script>");
            }
            else
            {
                Response.Write("<script>window.parent.location.href='/user/mainFrame.htm'</script>");
            }
            
        }

        
       
    }
}