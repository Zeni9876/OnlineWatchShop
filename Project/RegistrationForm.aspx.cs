using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Project
{
    
    public partial class RegistrationForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
                ConnectionStrings["sqlconnection"].ToString());
        static string activecode;
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();

        }
            protected void btnSendotp_Click(object sender, EventArgs e)
        {
            Random random = new Random();
            activecode = random.Next(1000, 9999).ToString();

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("19bmiit026@gmail.com", "ZeNiR@98");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "activation code to verify your email address";
            msg.Body = "<h1>Dear " + txtFirstname.Text + ", \n</h1> your activation code is: " + activecode + "\n";
            string toaddress = txtEmailid.Text;
            msg.To.Add(toaddress);
            string fromaddress = "<19bmiit026@gmail.com>";
            msg.From = new MailAddress(fromaddress);

            

            Session["otp"] = activecode;
            Session["firstname"] = txtFirstname.Text;
            Session["lastname"] = txtLastname.Text;
            Session["contact"] = txtContact.Text;
            Session["email"] = txtEmailid.Text;

            SqlCommand cmd = new SqlCommand("spCheckEmail", con);
            cmd.Parameters.AddWithValue("@emailid", Session["email"].ToString());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            int i = (int)cmd.ExecuteScalar();
            if(i == -1)
            {
                Response.Write("<script>alert('This Email Id is Already Registered')</script>");
            }
            else if(i == 1)
            {
                smtp.Send(msg);
                MessageBox.Show("OTP Send Successfully !!!Check Your Mail");
                Response.Redirect("~/Verify.aspx");
            }
           

        }

    }
}
