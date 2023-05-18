
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Review : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
               ConnectionStrings["sqlconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            if (!IsPostBack)
            {
                if (Session["AdminEmail"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("select f.Id,c.Firstname,f.Comment from tbl_Feedback f inner join tbl_Cutomer c on f.CId=c.CId", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
            }
        }
    }
}