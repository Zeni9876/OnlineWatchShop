using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class ProductAdmin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
                  ConnectionStrings["sqlconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            if (!IsPostBack)
            {
                if (Session["AdminEmail"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

       

        protected void btnAddproduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminProduct.aspx");
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            int pid = int.Parse((sender as LinkButton).CommandArgument);
            Session["productId"] = pid;
            Response.Redirect("~/EditProductDetails.aspx");
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            int prid = int.Parse((sender as LinkButton).CommandArgument);
            SqlCommand cmd = new SqlCommand("delete from tbl_Product where Pid=@prid", con);
            cmd.Parameters.AddWithValue("@prid", prid);
            cmd.ExecuteNonQuery();
            Response.Redirect("~/ProductAdmin.aspx");
        }

      
        protected void DeleteSearch_Click(object sender, EventArgs e)
        {

        }

        protected void EditSearch_Click(object sender, EventArgs e)
        {

        }

        protected void btnPSearch_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            SqlCommand cmd = new SqlCommand("Select * from tbl_Product where ProductName=@pname or Quantity=@quant or EntryDate=@edate", con);
            cmd.Parameters.AddWithValue("@pname", txtPsearch.Text.ToString());
            cmd.Parameters.AddWithValue("@subname", txtPsearch.Text);
            cmd.Parameters.AddWithValue("@catname", txtPsearch.Text);
            cmd.Parameters.AddWithValue("@brname", txtPsearch.Text);
            cmd.Parameters.AddWithValue("@tname", txtPsearch.Text);
            
            cmd.Parameters.AddWithValue("@quant", txtPsearch.Text);
            cmd.Parameters.AddWithValue("@edate", txtPsearch.Text);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridViewSearch.Visible = true;
            GridViewSearch.DataSource = ds;
            GridViewSearch.DataBind();
        }
    }
}