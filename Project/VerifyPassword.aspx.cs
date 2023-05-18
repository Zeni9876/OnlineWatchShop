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
   
    public partial class VerifyPassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
                  ConnectionStrings["sqlconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtPasswordOtp.Text == Session["otpforget"].ToString())
            {
                if (txtFPassword.Text == txtFConfirmPassword.Text)
                {
                    String pass1 = txtFPassword.Text.ToString();
                    String encryptpass = EasyEncryption.MD5.ComputeMD5Hash(pass1);
                    String Password = encryptpass;

                    SqlCommand cmd = new SqlCommand("update tbl_Cutomer set Password = @password where EmailId=@emailid ", con);
                    
                    cmd.Parameters.AddWithValue("@emailid", Session["emailid"].ToString());
                    cmd.Parameters.AddWithValue("@password", Password);
                   
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
