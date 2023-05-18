using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Project
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
               ConnectionStrings["sqlconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            
            string password = txtPassword.Text;
            String encryptPass = EasyEncryption.MD5.ComputeMD5Hash(password);
            string finalpass = encryptPass;
            con.Open();
            SqlCommand cmd = new SqlCommand("select Firstname,EmailId,Password,CId from tbl_Cutomer where EmailId=@emailid and Password=@pass", con);
            cmd.Parameters.AddWithValue("@emailid", txtLoginEmail.Text);
            cmd.Parameters.AddWithValue("@pass", finalpass);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (txtLoginEmail.Text.Equals("zenikheni@gmail.com") && txtPassword.Text.Equals("Admin@123"))
            {
                Session["AdminEmail"] = "zenikheni@gmail.com";
                Response.Redirect("~/Dashboard.aspx");
            }
            else if (dt.Rows.Count > 0)
            {
                string email = dt.Rows[0]["EmailId"].ToString();
                Session["emailId"] = email;
                string password1 = dt.Rows[0]["Password"].ToString();
                int cid = Convert.ToInt32(dt.Rows[0]["CId"]);
                if(email.Equals(txtLoginEmail.Text) && password1.Equals(finalpass))
                {
                    string Firstname = dt.Rows[0]["Firstname"].ToString();
                    Session["Firstname"] = Firstname;
                    Session["Email"] = txtLoginEmail.Text;
                    Session["cid"] = cid;
                    Response.Redirect("~/AfterLoginHome.aspx");
                }
                else
                {
                    lblError.Visible = true;
                    lblError.Text = "UserId and Password are Incorrect";
                }
                
            }
            else
            {
                lblError.Visible = true;
                lblError.Text = "UserId and Password is Incorrect";
            }
        }
    }
}