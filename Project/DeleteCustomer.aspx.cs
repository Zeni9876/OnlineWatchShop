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
    public partial class DeleteCustomer : System.Web.UI.Page
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
            int Id = Convert.ToInt32(Session["customerid"]);
            string cid = Id.ToString();
            SqlCommand cmd = new SqlCommand("delete from tbl_Customer where CId=@cid",con);
            cmd.Parameters.AddWithValue("@cid",cid);
            cmd.ExecuteNonQuery();
            Response.Redirect("~/Customer.aspx");
        }
    }
}