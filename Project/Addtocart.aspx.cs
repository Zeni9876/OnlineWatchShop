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
    public partial class Addtocart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
               ConnectionStrings["sqlconnection"].ToString());
        
       // DataAccess da = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            if(Session["Email"] != null)
            {
                lblSuccess.Text = Session["Firstname"].ToString();
                lblid.Text = Session["cid"].ToString();
            }
            else
            {
               
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void btnaddtocart_Click(object sender, EventArgs e)
        {
            string cuid = Session["cid"].ToString();
            string prid = Request.QueryString["Pid"];
            string quantity = txtquantity.Text;
            string cdate = DateTime.Now.ToString("yyyy-MM-dd HH:mm;ss");
            SqlCommand cmd = new SqlCommand("insert into tbl_Addtocart values(@cid,@pid,@quant,@cdate)", con);
            cmd.Parameters.AddWithValue("@cid", cuid);
            cmd.Parameters.AddWithValue("@pid", prid);
            cmd.Parameters.AddWithValue("@quant", quantity);
            cmd.Parameters.AddWithValue("@cdate", cdate);
            cmd.ExecuteNonQuery();

            string quant = txtquantity.Text;
            SqlCommand cmd1 = new SqlCommand("select Quantity from tbl_Product where Pid='" + prid + "'", con);
            SqlDataReader re = cmd1.ExecuteReader();
            if (re.Read())
            {
                int dquant = re.GetInt32(0);
                int cquant = Convert.ToInt32(quant);
                re.Close();
                int totalquant = dquant - cquant;
                string final = totalquant.ToString();
                string status = "Not Available";
                string status1 = "Available";
                if (dquant > 0)
                {
                    if (dquant > cquant)
                    {
                        SqlCommand cmd2 = new SqlCommand("update tbl_Product set Quantity=@totalquant, Status=@status where Pid=@pid", con);
                        cmd2.Parameters.AddWithValue("@totalquant", final);
                        cmd2.Parameters.AddWithValue("@pid", prid);
                        cmd2.Parameters.AddWithValue("@status", status1.ToString());
                        cmd2.ExecuteNonQuery();
                        Response.Redirect("~/ViewCart.aspx");
                    }
                    else
                    {
                       
                        Response.Write("<script>alert('Not Available')</script>");
                    }
                }
                else
                {
                    SqlCommand cmd2 = new SqlCommand("update tbl_Product set Status=@status where Pid=@pid", con);
                    cmd2.Parameters.AddWithValue("@status", status.ToString());
                    cmd2.Parameters.AddWithValue("@pid", prid);
                    cmd2.ExecuteNonQuery();
                }
            }
               

        }
        
        protected void btnbuynow_Click(object sender, EventArgs e)
        {

        }
    }
}