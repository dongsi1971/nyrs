using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.Common;

namespace nyrs.Admin
{
    public partial class changepassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BSave_Click(object sender, EventArgs e)
        {
            string operatorid = Session["OperatorID"].ToString();
            string newpass = NewPassword.Text;
            string md5password = FormsAuthentication.HashPasswordForStoringInConfigFile(newpass, "MD5");
            string updatesql = "update Operator set Password='" + md5password + "' where OperatorID=" + operatorid;
            DbHelper db = new DbHelper();
            DbCommand cmd = db.GetSqlStringCommond(updatesql);
            db.ExecuteNonQuery(cmd);
            Show(this, "密码修改成功!");
        }
        public static void Show(System.Web.UI.Page page, string msg)
        {
            page.ClientScript.RegisterStartupScript(page.GetType(), "message", "<script language='javascript' defer>alert('" + msg.ToString() + "');</script>");
        }
    }
}