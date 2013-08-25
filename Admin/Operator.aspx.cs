using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Common;
using System.Web.UI;
using System.Web.Security;

namespace nyrs.Admin
{
    public partial class Operator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CreateOrganizeTree();

            }
        }
        public void CreateOrganizeTree()
        {
            DbHelper db = new DbHelper();
            DbCommand cmd = db.GetSqlStringCommond("select * from Organize");
            DataTable dt = db.ExecuteDataTable(cmd);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    if (row["parentID"].ToString() == "0")
                    {
                        TreeNode rootnode = new TreeNode();
                        rootnode.Value = row["OrganizeID"].ToString();
                        rootnode.Text = row["OrgName"].ToString();
                        rootnode.ToolTip = row["OrgCode"].ToString();
                        rootnode.Selected = true;
                        OrganizeTree.Nodes.Add(rootnode);
                        AddChildNode(dt);
                    }

                }

            }
        }

        private void AddChildNode(DataTable dt)
        {
            foreach (TreeNode node in OrganizeTree.Nodes)
            {
                foreach (DataRow row in dt.Rows)
                {
                    if (row["parentId"].ToString() != "0" && node.Value == row["parentId"].ToString())
                    {
                        TreeNode newnode = new TreeNode();
                        newnode.Value = row["OrganizeID"].ToString();
                        newnode.Text = row["OrgName"].ToString();
                        newnode.ToolTip = row["OrgCode"].ToString();
                        //node.Expanded = true;
                        node.ChildNodes.Add(newnode);
                    }
                }
            }
            TreeNode rootnode = OrganizeTree.Nodes[0];
            foreach (TreeNode node in rootnode.ChildNodes)
            {
                foreach (DataRow row in dt.Rows)
                {
                    if ((int)row["parentId"] > 1 && node.Value == row["parentId"].ToString())
                    {
                        TreeNode newnode = new TreeNode();
                        newnode.Value = row["OrganizeID"].ToString();
                        newnode.Text = row["OrgName"].ToString();
                        newnode.ToolTip = row["OrgCode"].ToString();
                        //node.Expanded = true;
                        node.ChildNodes.Add(newnode);
                    }
                }
            }

        }

        protected void OrganizeTree_SelectedNodeChanged(object sender, EventArgs e)
        {
            TreeNode selectnode = OrganizeTree.SelectedNode;
            TextBox BelongtoTextBox =(TextBox)ListView1.InsertItem.FindControl("BelongtoTextBox");
            BelongtoTextBox.Text = selectnode.Value.ToString();
        }

       
        

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            TreeNode selectnode = OrganizeTree.SelectedNode;
            if (e.Item.ItemType == ListViewItemType.InsertItem)
            {
                TextBox OperatorNameTextBox = (TextBox)ListView1.InsertItem.FindControl("OperatorNameTextBox");
                TextBox LoginNameTextBox = (TextBox)ListView1.InsertItem.FindControl("LoginNameTextBox");
                TextBox PasswordTextBox = (TextBox)ListView1.InsertItem.FindControl("PasswordTextBox");
                string md5password = FormsAuthentication.HashPasswordForStoringInConfigFile(PasswordTextBox.Text, "MD5");
                string insertsql="INSERT INTO Operator(OperatorName, LoginName, Password, Belongto) VALUES ('"
                    +OperatorNameTextBox.Text.Trim()+"', '"
                +LoginNameTextBox.Text.Trim()+"', '"
                +md5password+"',"
                +selectnode.Value.ToString()+")";

                SqlDataSource1.InsertCommand = insertsql;
                
            }
            //e.Cancel = false;
        }

        protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            string OperatorName = (string)e.NewValues["OperatorName"];
            string LoginName = (string)e.NewValues["LoginName"];
            string Password = (string)e.NewValues["Password"];
            string OperatorID = e.Keys[0].ToString();
            string md5password = FormsAuthentication.HashPasswordForStoringInConfigFile(Password, "MD5");
            string updatesql = "UPDATE Operator SET OperatorName = '"
                +OperatorName+"', LoginName = '"
                +LoginName+"', Password = '"
                +md5password+"' WHERE (OperatorID = "
                + OperatorID + ")";

            SqlDataSource1.UpdateCommand = updatesql;

           
        }

        

       

        
        
    }
}