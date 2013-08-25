using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace nyrs.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {

            string connectionString = WebConfigurationManager.ConnectionStrings["MySqlConnectionString"].ConnectionString;
            MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(connectionString);
            //SqlConnection conn = new SqlConnection(connectionString);
            string md5password = FormsAuthentication.HashPasswordForStoringInConfigFile(Login1.Password, "MD5");
            string sqlstr = "select * from Operator_Organize where LoginName='" + Login1.UserName + "' and Password='" + md5password + "'";
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand(sqlstr, conn);
            //SqlCommand cmd = new SqlCommand(sqlstr, conn);
            try
            {
                conn.Open();
            }
            catch (System.Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                MySqlDataReader reader = cmd.ExecuteReader();
                //SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    e.Authenticated = true;
                    Session["OperatorID"] = reader["OperatorID"];
                    Session["OperatorName"] = reader["OperatorName"];
                    Session["LoginName"] = reader["LoginName"];
                    Session["Password"] = reader["Password"];
                    Session["OrganizeID"] = reader["OrganizeID"];
                    Session["OrgCode"] = reader["OrgCode"];
                    Session["OrgName"] = reader["OrgName"];
                    Session["parentID"] = reader["parentID"];
                    Session["TreeLevel"] = reader["TreeLevel"];
                    
                }

                else
                {
                    e.Authenticated = false;
                }
                reader.Close();
                conn.Close();
            }
            
  
        }
        protected void Login1_LoggedIn(object sender, EventArgs e)
        {
            Session["login"] = 1;
            if (Session["LoginName"].ToString()=="admin")
            {
 
                Response.Redirect("/Admin/mainFrame.htm");

            }
            else
            {
                Response.Redirect("/user/mainFrame.htm");
            }
            
        }
       
    }
}