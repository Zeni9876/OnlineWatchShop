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
    public partial class OrderAdmin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
                  ConnectionStrings["sqlconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            if (Session["AdminEmail"] == null)
            {
                Response.Redirect("Login.aspx");
            }
           
        }

       
        protected void btnSave_Click(object sender, EventArgs e)
        {
                GridView1.Visible = false;
                SqlCommand cmd = new SqlCommand("select *  from tbl_Order where odate between @d1 and @d2", con);
                cmd.Parameters.AddWithValue("@d1", txtd1.Text.ToString());
                cmd.Parameters.AddWithValue("@d2", txtd2.Text.ToString());
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                Gridviewdate.Visible = true;
                Gridviewdate.DataSource = ds;
                Gridviewdate.DataBind();
        }

        protected void Pending_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            string st = "Pending";
            SqlCommand cmd1 = new SqlCommand("select * from tbl_Order where Payment_status=@st", con);
            cmd1.Parameters.AddWithValue("@st", st);
            Gridviewdate.Visible = true;
            Gridviewdate.DataSource = cmd1.ExecuteReader();
            Gridviewdate.DataBind();
        }

        protected void Complete_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            string st = "Completed";
            SqlCommand cmd1 = new SqlCommand("select * from tbl_Order where Payment_status=@st", con);
            cmd1.Parameters.AddWithValue("@st", st);
            Gridviewdate.Visible = true;
            Gridviewdate.DataSource = cmd1.ExecuteReader();
            Gridviewdate.DataBind();
        }

        protected void All_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            Gridviewdate.Visible = false;
        }


        //protected void btnSelect_Click(object sender, EventArgs e)
        //{
        //    
        //}



    }
}