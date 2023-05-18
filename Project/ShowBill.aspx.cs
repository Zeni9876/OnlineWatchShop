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
    public partial class ShowBill : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
             ConnectionStrings["sqlconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from tbl_Addtocart", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            
            for(int i=0;i<dt.Rows.Count;i++)
            {
                int prid = Convert.ToInt32(dt.Rows[0]["PId"]);
                int prquant = Convert.ToInt32(dt.Rows[0]["Quantity"]);
                
                SqlCommand cmdname = new SqlCommand("select * from tbl_Product where Pid=@pid", con);
                cmdname.Parameters.AddWithValue("@pid", prid);
                SqlDataAdapter sdaname = new SqlDataAdapter(cmdname);
                DataTable dtname = new DataTable();
                sdaname.Fill(dtname);
                string name = dtname.Rows[0]["Productname"].ToString();
                int prprice = Convert.ToInt32(dtname.Rows[0]["Price"]);
                lblId.Text = prid.ToString();
                lblName.Text = name;
                lblPrice.Text = prprice.ToString();
                lblQuant.Text = prquant.ToString();
            }
        }
    }
}