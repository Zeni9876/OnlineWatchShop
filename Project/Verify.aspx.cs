using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Project
{
    public partial class Verify : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
                  ConnectionStrings["sqlconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (txtOtp.Text == Session["otp"].ToString())
            {
                if (txtPassword.Text == txtConfirmPassword.Text)
                {
                    String pass1 = txtPassword.Text.ToString();
                    String encryptpass = EasyEncryption.MD5.ComputeMD5Hash(pass1);
                    String Password = encryptpass;

                    SqlCommand cmd = new SqlCommand("insert into tbl_Cutomer(Firstname,Lastname,EmailId,Contactno,Password,Status) values(@firstname,@lastname,@emailid,@contact,@password,@status)", con);
                    cmd.Parameters.AddWithValue("@firstname", Session["firstname"].ToString());
                    cmd.Parameters.AddWithValue("@lastname", Session["lastname"].ToString());
                    cmd.Parameters.AddWithValue("@emailid", Session["email"].ToString());
                    cmd.Parameters.AddWithValue("@contact", Session["contact"].ToString());
                    cmd.Parameters.AddWithValue("@password", Password);
                    cmd.Parameters.AddWithValue("@status", "Active");
                    cmd.ExecuteNonQuery();
                    Response.Redirect("~/Login.aspx");
                    con.Close();
                }
                else
                {
                    MessageBox.Show("Password and Confirm Password must be match");
                }
            }

            else
            {
                MessageBox.Show("Incorrect OTP");
                Response.Redirect("RegistrationForm.aspx");
            }
        }
    }
}