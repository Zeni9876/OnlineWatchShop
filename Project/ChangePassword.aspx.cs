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
    public partial class ChangePassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
                 ConnectionStrings["sqlconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            string user=Session["emailId"].ToString();
            SqlCommand cmd = new SqlCommand("select Password from tbl_Cutomer where EmailId=@em", con);
            cmd.Parameters.AddWithValue("@em", user);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            string opass = dt.Rows[0]["Password"].ToString();
            String pass = txtOldpass.Text.ToString();
            String encryptpass = EasyEncryption.MD5.ComputeMD5Hash(pass);
            String OPassword = encryptpass;
            if(opass.Equals(OPassword))
            {
                String newpass = txtNewpass.Text.ToString();
                String encryptnewpass = EasyEncryption.MD5.ComputeMD5Hash(newpass);
                String NPassword = encryptnewpass;
                if (OPassword.Equals(NPassword))
                {
                    lblError.Visible = true;
                    lblError.Text = "New Password and Old Password Should be Different";
                }
                else
                {
                    SqlCommand cmd1 = new SqlCommand("update tbl_Cutomer set Password=@pass where EmailId=@emi", con);
                    cmd1.Parameters.AddWithValue("@emi", user);
                    cmd1.Parameters.AddWithValue("@pass", NPassword);
                    cmd1.ExecuteNonQuery();
                    Response.Redirect("~/UserProfile.aspx");
                }
            }
            else
            {
                lblError.Visible = true;
                lblError.Text = "Old Password is Incorrect";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UserProfile.aspx");
        }
    }
}