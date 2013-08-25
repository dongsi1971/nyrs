using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Common;
using System.Data;

namespace nyrs.Admin
{
    public partial class Organize1 : System.Web.UI.Page
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
                        TBOrgCode.Text = rootnode.ToolTip;
                        TBOrgName.Text = rootnode.Text;
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
                    if (row["parentId"].ToString()!= "0" && node.Value == row["parentId"].ToString())
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
            TreeNode rootnode=OrganizeTree.Nodes[0];
            foreach (TreeNode node in rootnode.ChildNodes)
            {
                foreach (DataRow row in dt.Rows)
                {
                    if ((int)row["parentId"]>1 && node.Value == row["parentId"].ToString())
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

        protected void BAdd_Click(object sender, EventArgs e)
        {
            TreeNode currentnode = OrganizeTree.SelectedNode;
            if (currentnode!=null)
            {
                if (currentnode.Value == "-1")
                {
                    Show(this, "该机构还没有保存，不能添加下级机构！");
                   
                }
                else
                {


                    if (currentnode.Depth < 2)
                    {
                        TreeNode newnode = new TreeNode();
                        newnode.Value = "-1";
                        newnode.ToolTip = currentnode.ToolTip;
                        newnode.Text = "新机构";
                        TBOrgCode.Text = newnode.ToolTip;
                        TBOrgName.Text = newnode.Text;
                        currentnode.Selected = false;
                        currentnode.Expanded = true;
                        newnode.Selected = true;

                        currentnode.ChildNodes.Add(newnode);
                        TBOrgCode.Focus();
                    }
                    else
                    {
                        Show(this,"该机构不能有下级分支!");
                       

                    }
                }
            }
        }

        protected void BSave_Click(object sender, EventArgs e)
        {
           
            DbHelper db = new DbHelper();
            DbCommand cmd=null;
            DataTable dt = null;

            TreeNode selectnode = OrganizeTree.SelectedNode;
            string orgcode = selectnode.ToolTip;
            string orgname = selectnode.Text;
            string orgid=selectnode.Value;
            if (orgid!="-1")
            {
                string updatesql="update Organize set orgcode='"+orgcode+"',orgname='"+orgname+"' where OrganizeID="+orgid;
                cmd = db.GetSqlStringCommond(updatesql);
            } 
            else
            {
                string insertsql = "insert into Organize (orgcode,orgname,parentid,treelevel) values('" + orgcode + "','" + orgname + "'," + selectnode.Parent.Value + "," + (selectnode.Depth + 1).ToString() + ") SELECT @@IDENTITY AS ID";
                cmd = db.GetSqlStringCommond(insertsql);
            }
            dt = db.ExecuteDataTable(cmd);
            if (dt.Rows.Count>0)
            {
                selectnode.Value = dt.Rows[0][0].ToString();
            }
            Show(this,"保存成功!");
        }

        protected void OrganizeTree_SelectedNodeChanged(object sender, EventArgs e)
        {
            TreeNode selectnode = OrganizeTree.SelectedNode;
            TBOrgCode.Text = selectnode.ToolTip;
            TBOrgName.Text = selectnode.Text;
        }

        protected void TBOrgCode_TextChanged(object sender, EventArgs e)
        {
            TreeNode selectnode = OrganizeTree.SelectedNode;
            selectnode.ToolTip = TBOrgCode.Text;
            TBOrgName.Focus();
            
        }

        protected void TBOrgName_TextChanged(object sender, EventArgs e)
        {
            TreeNode selectnode = OrganizeTree.SelectedNode;
            selectnode.Text = TBOrgName.Text;
        }

        protected void Bdel_Click(object sender, EventArgs e)
        {
            TreeNode selectnode = OrganizeTree.SelectedNode;
            if (selectnode.ChildNodes.Count>0)
            {
                Show(this,"本机构有下级单位，不能删除！");
            }
            else
            {
                if (selectnode.Value=="-1")
                {
                    selectnode.Parent.ChildNodes.Remove(selectnode);
                } 
                else
                {
                    string organizeid = selectnode.Value;
                    string delsql = "delete Organize where OrganizeID=" + organizeid + "";
                    DbHelper db = new DbHelper();
                    DbCommand cmd = db.GetSqlStringCommond(delsql);
                    db.ExecuteNonQuery(cmd);
                    selectnode.Parent.Selected = true;
                    TBOrgCode.Text = selectnode.Parent.ToolTip;
                    TBOrgName.Text = selectnode.Parent.Text;
                    selectnode.Parent.ChildNodes.Remove(selectnode);
                }

            }
        }
        public static void Show(System.Web.UI.Page page, string msg)
        {
            page.ClientScript.RegisterStartupScript(page.GetType(), "message", "<script language='javascript' defer>alert('" + msg.ToString() + "');</script>");
        }

    }
}