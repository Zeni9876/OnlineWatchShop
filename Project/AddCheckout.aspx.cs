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
    public partial class AddCheckout : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
               ConnectionStrings["sqlconnection"].ToString());
       
        SqlDataAdapter da;
        int count=0;
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            if(!IsPostBack)
            {
                if (Session["Firstname"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }



        protected void btnSave_Click(object sender, EventArgs e)
        {
            string cuid = Session["cid"].ToString();
            SqlCommand cmdinsert = new SqlCommand("Update tbl_Cutomer set Address=@add, City=@city, Area=@area, Pincode=@pincode where CId=@cid", con);
            cmdinsert.Parameters.AddWithValue("@cid", cuid);
            cmdinsert.Parameters.AddWithValue("@add", txtAddress.Text);
            cmdinsert.Parameters.AddWithValue("@city", ddlCity.SelectedValue);
            cmdinsert.Parameters.AddWithValue("@area", ddlArea.SelectedValue);
            cmdinsert.Parameters.AddWithValue("@pincode", txtPincode.Text);
            cmdinsert.ExecuteNonQuery();

            string cid = Session["CId"].ToString();
            SqlCommand cmd = new SqlCommand("select * from tbl_Addtocart where CId=@cid", con);
            cmd.Parameters.AddWithValue("@cid", cid);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);


            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string cartid = dt.Rows[i]["CartId"].ToString();
                string customer = dt.Rows[i]["CId"].ToString();
                string pid = dt.Rows[i]["PId"].ToString();
                string quant = dt.Rows[i]["Quantity"].ToString();
                string cdate = dt.Rows[i]["cdate"].ToString();


                SqlCommand cmdselect = new SqlCommand("Select Price from tbl_Product where Pid=@pid", con);
                cmdselect.Parameters.AddWithValue("@pid", pid);
                DataTable dt1 = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(cmdselect);
                adp.Fill(dt1);
                string price = dt1.Rows[0][0].ToString();
               
                count = count + (Convert.ToInt32(price) * Convert.ToInt32(quant));
                Session["Totalamount"] = count.ToString();
            }
            String type = ddlPType.SelectedValue;
            String status = "Pending";
            Session["Paymenttype"] = ddlPType.SelectedValue;
            string date = DateTime.Today.ToString("yyyy-MM-dd");
            string time1 = DateTime.Now.ToString("h:mm:ss");

            SqlCommand cmdorder = new SqlCommand("insert into tbl_Order(CId,Payment_type,Total,Payment_status,odate,otime) values(@cid,@type,@total,@status,@date,@time1)", con);
            cmdorder.Parameters.AddWithValue("@cid", cid);
            cmdorder.Parameters.AddWithValue("@type", ddlPType.SelectedValue);
            cmdorder.Parameters.AddWithValue("@total", count);
            cmdorder.Parameters.AddWithValue("@status", status.ToString());
            cmdorder.Parameters.AddWithValue("@date", date);
            cmdorder.Parameters.AddWithValue("@time1", time1);
            cmdorder.ExecuteNonQuery();

            SqlCommand cmdorderid = new SqlCommand("select OrderId,Total from tbl_Order where CId=@cid and odate=@date and otime=@time", con);
            cmdorderid.Parameters.AddWithValue("@cid", cid);
            cmdorderid.Parameters.AddWithValue("@date", date);
            cmdorderid.Parameters.AddWithValue("@time", time1);
            DataTable dtid = new DataTable();
            SqlDataAdapter adpid = new SqlDataAdapter(cmdorderid);
            adpid.Fill(dtid);
            string orderid = dtid.Rows[0][0].ToString();
            int Total = Convert.ToInt32(dtid.Rows[0]["Total"]);
            Session["orderid"] = orderid;
            SqlCommand cmdcartfetch = new SqlCommand("select * from tbl_Addtocart where CId=@cid and Date", con);
            cmdcartfetch.Parameters.AddWithValue("@cid", cid);
            SqlDataAdapter sda1 = new SqlDataAdapter(cmdcartfetch);
            DataTable dt2 = new DataTable();
            sda.Fill(dt2);


            for (int k = 0; k < dt.Rows.Count; k++)
            {
                string cartid1 = dt.Rows[k]["CartId"].ToString();
                string customer1 = dt.Rows[k]["CId"].ToString();
                string pid1 = dt.Rows[k]["PId"].ToString();
                string quant1 = dt.Rows[k]["Quantity"].ToString();
                string cdate1 = dt.Rows[k]["cdate"].ToString();

                SqlCommand cmdselect = new SqlCommand("Select Price from tbl_Product where Pid=@pid", con);
                cmdselect.Parameters.AddWithValue("@pid", pid1);
                DataTable dtp = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(cmdselect);
                adp.Fill(dtp);
                string price1 = dtp.Rows[0][0].ToString();

                SqlCommand cmdorderdetail = new SqlCommand("insert into tbl_Order_detail(OrderId,PId,Quantity,Price) values(@oid,@pid,@quant,@price)", con);
                cmdorderdetail.Parameters.AddWithValue("@oid", orderid);
                cmdorderdetail.Parameters.AddWithValue("@pid", pid1);
                cmdorderdetail.Parameters.AddWithValue("@quant", quant1);
                cmdorderdetail.Parameters.AddWithValue("@price", price1);
                cmdorderdetail.ExecuteNonQuery();

            }
            SqlCommand cmdbill = new SqlCommand("insert into tbl_Bill(CId,OrderId,Amount,gst,TotalAmount,Date)" +
                "values(@cid,@oid,@amount,@gst,@totalamout,@date)", con);
            int gst = 18;
            float totalamount = Total + (Total * 18 / 100);
            cmdbill.Parameters.AddWithValue("@cid", cuid);
            cmdbill.Parameters.AddWithValue("@oid", orderid);
            cmdbill.Parameters.AddWithValue("@amount", Total);
            cmdbill.Parameters.AddWithValue("@gst", gst);
            cmdbill.Parameters.AddWithValue("@totalamout", totalamount);
            cmdbill.Parameters.AddWithValue("@date", DateTime.Now.ToString("yyyy-MM-dd"));
            cmdbill.ExecuteNonQuery();

            
            SqlCommand cmddelete = new SqlCommand("delete from tbl_Addtocart", con);
            cmddelete.ExecuteNonQuery();

            if(ddlPType.SelectedValue.Equals("Online"))
            {
                Response.Redirect("~/Payment.aspx");
            }
            else if(ddlPType.SelectedValue.Equals("Cash On Delivery"))
            {
                Session["Totalamountcu"] = totalamount;
                Response.Redirect("~/COD.aspx");
            }
           
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AfterLoginHome.aspx");
        }
    }
}