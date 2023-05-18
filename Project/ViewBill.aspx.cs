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
    public partial class ViewBill : System.Web.UI.Page
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
                string query1 = "select Billno,Date from tbl_Bill where CId=@id";
                SqlCommand cmd = new SqlCommand(query1, con);
                cmd.Parameters.AddWithValue("@id", Session["cid"].ToString());
                billGrid.DataSource = cmd.ExecuteReader();
                billGrid.DataBind();
            }
           
        }

        protected void linkdowload_Click(object sender, EventArgs e)
        {
            int id = int.Parse((sender as LinkButton).CommandArgument);
            // Response.Write(id);
            Session["id"] = id;
            Response.Redirect("~/CustomerBill.aspx");
        }

       
        protected void btnFeedback_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/Feedback.aspx");
        }
    }
}