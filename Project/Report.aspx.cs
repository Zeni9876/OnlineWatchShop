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
    public partial class Report : System.Web.UI.Page
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
            else
            {
                int countorder = 0;
                SqlCommand cmdd = new SqlCommand("Select COUNT(*) from tbl_Order", con);
                countorder = (int)cmdd.ExecuteScalar();
                Session["TotalOrder"] = countorder;
            }
        }
    }
}