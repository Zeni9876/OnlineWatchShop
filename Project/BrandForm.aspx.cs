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
    public partial class BrandForm : System.Web.UI.Page
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
        }

        protected void btnBrandSave_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("insert into tbl_Brand values(@brandname,@branddesc)", con);
            cmd.Parameters.AddWithValue("@brandname", txtBrandname.Text);
            cmd.Parameters.AddWithValue("@branddesc", txtBrandDescription.Text);
            cmd.ExecuteNonQuery();
            Response.Redirect("~/ProductAdmin.aspx");
            con.Close();
        }
    }
}