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
    public partial class UserProfile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
                 ConnectionStrings["sqlconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            if(!IsPostBack)
            {
                string uemail = Session["emailId"].ToString();
                SqlCommand cmd = new SqlCommand("select * from tbl_Cutomer where EmailId=@email", con);
                cmd.Parameters.AddWithValue("@email", uemail);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                string fname = dt.Rows[0]["Firstname"].ToString();
                string lname = dt.Rows[0]["Lastname"].ToString();
                string phone = dt.Rows[0]["Contactno"].ToString();
                string email = dt.Rows[0]["EmailId"].ToString();
                string add = dt.Rows[0]["Address"].ToString();
                string city = dt.Rows[0]["City"].ToString();
                string area = dt.Rows[0]["Area"].ToString();
                string pin = dt.Rows[0]["Pincode"].ToString();

                txtFname.Text = fname;
                txtLname.Text = lname;
                txtPhone.Text = phone;
                txtEmail.Text = email;
                txtAddress.Text = add;
                ddlCity.SelectedValue = city;
                ddlArea.SelectedValue = area;
                txtPin.Text = pin;
            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            string email= Session["emailId"].ToString();
            SqlCommand cmd1 = new SqlCommand("update tbl_Cutomer set Firstname=@fname,Lastname=@lname," +
                "Contactno=@cno,Address=@add,City=@city,Area=@area,Pincode=@pin where EmailId=@em", con);
            cmd1.Parameters.AddWithValue("@fname",txtFname.Text);
            cmd1.Parameters.AddWithValue("@lname",txtLname.Text);
            cmd1.Parameters.AddWithValue("@cno",txtPhone.Text);
            cmd1.Parameters.AddWithValue("@add",txtAddress.Text);
            cmd1.Parameters.AddWithValue("@city",ddlCity.SelectedValue);
            cmd1.Parameters.AddWithValue("@area",ddlArea.SelectedValue);
            cmd1.Parameters.AddWithValue("@pin",txtPin.Text);
            cmd1.Parameters.AddWithValue("@em", email);
            cmd1.ExecuteNonQuery();
            Response.Redirect("~/UserProfile.aspx");
        }

        protected void btnChangepass_Click(object sender, EventArgs e)
        {

        }
    }
}