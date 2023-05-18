using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
         ConnectionStrings["sqlconnection"].ToString());
        static string activecodeforget;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       

        protected void btnsendMail_Click(object sender, EventArgs e)
        {
            Random random = new Random();
            activecodeforget = random.Next(1000, 9999).ToString();

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("19bmiit026@gmail.com", "ZeNiR@98");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "activation code to verify your email address";
            msg.Body = "Dear " + Session["firstname"] + ", \n For Forget Password:\n Activation code is: " + activecodeforget + "\n";
            string toaddress = txtForgetEmail.Text;
            msg.To.Add(toaddress);
            string fromaddress = "<19bmiit026@gmail.com>";
            msg.From = new MailAddress(fromaddress);

            smtp.Send(msg);

            Session["otpforget"] = activecodeforget;
            Session["emailid"] = txtForgetEmail.Text;
            Response.Redirect("~/VerifyPassword.aspx");
        }
    }
}