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
    public partial class Customer : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
                 ConnectionStrings["sqlconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            if(!IsPostBack)
            {
                if (Session["AdminEmail"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
 
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            int id = int.Parse((sender as LinkButton).CommandArgument);
            SqlCommand cmd = new SqlCommand("delete from tbl_Cutomer where CId=@cid", con);
            cmd.Parameters.AddWithValue("@cid", id);
            cmd.ExecuteNonQuery();
            Response.Redirect("~/Customer.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            tblGridview.Visible = false;
            SqlCommand cmd1 = new SqlCommand("select CId,Firstname,Lastname,EmailId,Contactno,Address,City,Area,Pincode,Status from tbl_Cutomer where EmailId=@em or Firstname=@fname or Lastname=@lname or City=@city or Area=@area or Status=@st", con);
            cmd1.Parameters.AddWithValue("@em", txtSearchCustomer.Text);
            cmd1.Parameters.AddWithValue("@fname", txtSearchCustomer.Text);
            cmd1.Parameters.AddWithValue("@lname", txtSearchCustomer.Text);
            cmd1.Parameters.AddWithValue("@city", txtSearchCustomer.Text);
            cmd1.Parameters.AddWithValue("@area", txtSearchCustomer.Text);
            cmd1.Parameters.AddWithValue("@st", txtSearchCustomer.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd1);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            Gridviewsearch.Visible = true;
            Gridviewsearch.DataSource = ds;
            Gridviewsearch.DataBind();
            
            
        }

        protected void Deletesearch_Click(object sender, EventArgs e)
        {
            int cid = int.Parse((sender as LinkButton).CommandArgument);
            SqlCommand cmd = new SqlCommand("delete from tbl_Cutomer where CId=@cid", con);
            cmd.Parameters.AddWithValue("@cid", cid);
            cmd.ExecuteNonQuery();
            Response.Redirect("~/Customer.aspx");
        }
    }
}