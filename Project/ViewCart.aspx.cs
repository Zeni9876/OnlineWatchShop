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
    public partial class ViewCart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
               ConnectionStrings["sqlconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
           if(Session["Email"]==null)
            {
                Response.Redirect("~/Login.aspx");
            }
           
        }

        protected void btnBuynow_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/AddCheckout.aspx");

        }
        //protected void update_Click(object sender, EventArgs e)
        //{
        //    int cartid = int.Parse((sender as LinkButton).CommandArgument);
            

        //    //SqlCommand cmd = new SqlCommand("update tbl_Addtocart set Qunatity=@quant where CartId=@cartid", con);
        //    //cmd.Parameters.AddWithValue("@quant", finalQuant);
            

        //}

        protected void delete_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];
                int cartid = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values[0]);

                string quant = (row.FindControl("txtQuant") as TextBox).Text;
                int nquant = Convert.ToInt32(quant);

                SqlCommand cmd = new SqlCommand("select Quantity,PId from tbl_Addtocart where CartId=@cid", con);
                cmd.Parameters.AddWithValue("@cid", cartid);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                string oquant = dt.Rows[0]["Quantity"].ToString();
                int opquant = Convert.ToInt32(oquant);
                string pid = dt.Rows[0]["PId"].ToString();

                SqlCommand cmd1 = new SqlCommand("select Quantity from tbl_Product where Pid=@pid", con);
                cmd1.Parameters.AddWithValue("@pid", pid);
                SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);
                string pquant = dt1.Rows[0]["Quantity"].ToString();
                int prquant = Convert.ToInt32(pquant);
                if (prquant > 0)
                {
                    if (prquant > nquant)
                    {
                        SqlCommand cmd2 = new SqlCommand("update tbl_Addtocart set Quantity=@quant where CartId=@caid", con);
                        cmd2.Parameters.AddWithValue("@quant", nquant);
                        cmd2.Parameters.AddWithValue("@caid", cartid);
                        cmd2.ExecuteNonQuery();
                        Response.Write("UPdated");
                        if (opquant < nquant)
                        {
                            SqlCommand cmd3 = new SqlCommand("update tbl_Product set Quantity=@quan where Pid=@pid", con);
                            int q1 = nquant - opquant;
                            cmd3.Parameters.AddWithValue("@quan", prquant - q1);
                            cmd3.Parameters.AddWithValue("@pid", pid);
                            cmd3.ExecuteNonQuery();
                        }
                        else if (opquant > nquant)
                        {
                            SqlCommand cmd4 = new SqlCommand("update tbl_Product set Quantity=@quan where Pid=@pid", con);
                            int q2 = opquant - nquant;
                            cmd4.Parameters.AddWithValue("@quan", prquant + q2);
                            cmd4.Parameters.AddWithValue("@pid", pid);
                            cmd4.ExecuteNonQuery();
                        }
                        Response.Redirect("~/ViewCart.aspx");

                    }
                }
            }
            else if (e.CommandName == "Delete")
            {
                int rowIndex1 = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex1];
                int cartid = Convert.ToInt32(GridView1.DataKeys[rowIndex1].Values[0]);

                string quant = (row.FindControl("txtQuant") as TextBox).Text;
                int nquant = Convert.ToInt32(quant);

                SqlCommand cmd5 = new SqlCommand("select Quantity,PId from tbl_Addtocart where CartId=@cid", con);
                cmd5.Parameters.AddWithValue("@cid", cartid);
                SqlDataAdapter sda1 = new SqlDataAdapter(cmd5);
                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);
                string oquant = dt1.Rows[0]["Quantity"].ToString();
                int opquant = Convert.ToInt32(oquant);
                string pid = dt1.Rows[0]["PId"].ToString();

                SqlCommand cmd8 = new SqlCommand("select Quantity from tbl_Product where Pid=@prid", con);
                cmd5.Parameters.AddWithValue("@prid", pid);
                SqlDataAdapter sda2 = new SqlDataAdapter(cmd8);
                DataTable dt2 = new DataTable();
                sda1.Fill(dt2);
                string prquant = dt1.Rows[0]["Quantity"].ToString();
                int oprquant = Convert.ToInt32(prquant);

                SqlCommand cmd6 = new SqlCommand("delete from tbl_Addtocart where CartId=@caid", con);
                cmd6.Parameters.AddWithValue("@caid", cartid);
                cmd6.ExecuteNonQuery();

                SqlCommand cmd7 = new SqlCommand("update tbl_Product set Quantity=@quant where Pid=@pid", con);
                cmd7.Parameters.AddWithValue("@quant", oprquant + nquant);
                cmd7.Parameters.AddWithValue("@pid", pid);
                cmd7.ExecuteNonQuery();

                Response.Redirect("~/ViewCart.aspx");

            }
        }
    }
}