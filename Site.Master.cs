using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace nyrs
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string curdate = DateTime.Now.ToLongDateString();
                
                string week = ChineseByEnWeek(DateTime.Now);
                loginuser.Text = "今天是"+curdate+"  "+week;
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
            Response.Write("<script>window.location.href='/Account/Login.aspx'</script>"); 
        }
    }
}
