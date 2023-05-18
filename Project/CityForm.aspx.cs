using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Project
{
    public partial class CityForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.
                ConnectionStrings["sqlconnection"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into tbl_City(Cityname) values(@name)", con);
            cmd.Parameters.AddWithValue("@name", txtCityname.Text);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}