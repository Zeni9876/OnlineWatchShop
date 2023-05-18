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
    public partial class DeleteCart : System.Web.UI.Page
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
            else
            {
                string id = Session["pid"].ToString();
                SqlCommand cmd = new SqlCommand("delete from tbl_Addtocart where PId='"+id+"'", con);
                
                cmd.ExecuteNonQuery();
                Response.Redirect("ViewCart.aspx");
            }
        }
    }
}