using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace nyrs
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["login"]!=null)
            //{
            //    Response.Redirect("adminDefault.aspx");
            //} 
            //else
            //{
                Response.Redirect("/Account/Login.aspx");
            //}
            
        }
    }
}