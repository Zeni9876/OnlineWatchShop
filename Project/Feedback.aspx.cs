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
    public partial class Feedback : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
              ConnectionStrings["sqlconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            if (Session["Email"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void btnGive_Click(object sender, EventArgs e)
        {
            int cid = Convert.ToInt32(Session["cid"]);
            SqlCommand cmd = new SqlCommand("insert into tbl_Feedback(CId,Comment) values" +
                "(@cid,@comment)", con);
            cmd.Parameters.AddWithValue("@cid", cid);
            cmd.Parameters.AddWithValue("@comment", txtFeedback.Text);
            int i=cmd.ExecuteNonQuery();
            if(i == 1)
            {
                MessageBox.Show("Your Feedback Successfully Saved");
                Response.Redirect("~/AfterLoginHome.aspx");
            }
            else
            {
                MessageBox.Show("Your Feedback is not saved");
                Response.Redirect("~/Feedback.aspx");
            }
        }
    }
}