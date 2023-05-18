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
    public partial class AreaForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
               ConnectionStrings["sqlconnection"].ToString());
        SqlCommand cmd;
        SqlDataAdapter da;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            filldrop();
           
        }
        private void filldrop()
        {
            ddlCityname.DataSource = getuserdata();
            ddlCityname.DataTextField = "Cityname";
            ddlCityname.DataValueField = "CityId";
            ddlCityname.DataBind();
            //throw new NotImplementedException();
        }
        private object getuserdata()
        {
            cmd = new SqlCommand("select * from tbl_City", con);
            cmd.CommandType = System.Data.CommandType.Text;
            da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            //throw new NotImplementedException();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
        }
    }
}