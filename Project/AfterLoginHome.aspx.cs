using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class AfterLoginHome : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
                  ConnectionStrings["sqlconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            if (Session["Firstname"] == null)
            {
               
                Response.Redirect("Login.aspx");
            }
            else
            {
                SqlCommand cmd = new SqlCommand("select c.Firstname,f.Comment from tbl_Feedback f inner join tbl_Cutomer c on f.CId=c.CId", con);
                review.DataSource = cmd.ExecuteReader();
                review.DataBind();
            }
        }
    }
}