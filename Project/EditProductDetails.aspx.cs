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
    public partial class EditProductDetails : System.Web.UI.Page
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
                    string prid = Session["productId"].ToString();
                    SqlCommand cmd = new SqlCommand("select * from tbl_Product where Pid=@prid", con);
                    cmd.Parameters.AddWithValue("@prid", prid);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    string Name = dt.Rows[0]["ProductName"].ToString();
                    string Sid = dt.Rows[0]["Sid"].ToString();
                    string CatId = dt.Rows[0]["CatId"].ToString();
                    string Bid = dt.Rows[0]["Bid"].ToString();
                    string Tid = dt.Rows[0]["Tid"].ToString();
                    string Price = dt.Rows[0]["Price"].ToString();
                    string Quantity = dt.Rows[0]["Quantity"].ToString();
                    string Description = dt.Rows[0]["Descripiton"].ToString();

                    SqlCommand cmd1 = new SqlCommand("select SubcategoryName from tbl_Subcategory where Sid=@sid", con);
                    cmd1.Parameters.AddWithValue("@sid", Sid);
                    SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
                    DataTable dt1 = new DataTable();
                    sda1.Fill(dt1);
                    string subname = dt1.Rows[0]["SubcategoryName"].ToString();

                    SqlCommand cmd2 = new SqlCommand("select CategoryName from tbl_Category where CatId=@catid", con);
                    cmd2.Parameters.AddWithValue("@catid", CatId);
                    SqlDataAdapter sda2 = new SqlDataAdapter(cmd2);
                    DataTable dt2 = new DataTable();
                    sda2.Fill(dt2);
                    string catname = dt2.Rows[0]["CategoryName"].ToString();

                    SqlCommand cmd3 = new SqlCommand("select BrandName from tbl_Brand where Bid=@bid", con);
                    cmd3.Parameters.AddWithValue("@bid", Bid);
                    SqlDataAdapter sda3 = new SqlDataAdapter(cmd3);
                    DataTable dt3 = new DataTable();
                    sda3.Fill(dt3);
                    string brandname = dt3.Rows[0]["BrandName"].ToString();

                    SqlCommand cmd4 = new SqlCommand("select Type from tbl_Type where Tid=@tid", con);
                    cmd4.Parameters.AddWithValue("@tid", Tid);
                    SqlDataAdapter sda4 = new SqlDataAdapter(cmd4);
                    DataTable dt4 = new DataTable();
                    sda4.Fill(dt4);
                    string type = dt4.Rows[0]["Type"].ToString();

                    txtName.Text = Name;
                    txtSub.Text = subname;
                    txtCat.Text = catname;
                    txtBrand.Text = brandname;
                    txtType.Text = type;
                    txtPrice.Text = Price;
                    txtQuant.Text = Quantity;
                    txtDesc.Text = Description;
                }
            }
           
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlCommand cmd1 = new SqlCommand("select Sid from tbl_Subcategory where SubcategoryName=@sid", con);
            cmd1.Parameters.AddWithValue("@sid", txtSub.Text);
            SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);
            string subid1 = dt1.Rows[0]["Sid"].ToString();
            int subid = Convert.ToInt32(subid1);

            SqlCommand cmd2 = new SqlCommand("select CatId from tbl_Category where CategoryName=@catid", con);
            cmd2.Parameters.AddWithValue("@catid", txtCat.Text );
            SqlDataAdapter sda2 = new SqlDataAdapter(cmd2);
            DataTable dt2 = new DataTable();
            sda2.Fill(dt2);
            string catid1 = dt2.Rows[0]["CatId"].ToString();
            int catid = Convert.ToInt32(catid1);

            SqlCommand cmd3 = new SqlCommand("select Bid from tbl_Brand where BrandName=@bid", con);
            cmd3.Parameters.AddWithValue("@bid", txtBrand.Text);
            SqlDataAdapter sda3 = new SqlDataAdapter(cmd3);
            DataTable dt3 = new DataTable();
            sda3.Fill(dt3);
            string brandid1 = dt3.Rows[0]["Bid"].ToString();
            int brandid = Convert.ToInt32(brandid1);

            SqlCommand cmd4 = new SqlCommand("select Tid from tbl_Type where Type=@tid", con);
            cmd4.Parameters.AddWithValue("@tid", txtType.Text);
            SqlDataAdapter sda4 = new SqlDataAdapter(cmd4);
            DataTable dt4 = new DataTable();
            sda4.Fill(dt4);
            string tid1 = dt4.Rows[0]["Tid"].ToString();
            int tid = Convert.ToInt32(tid1);
            string pid = Session["productId"].ToString();

            SqlCommand cmdp = new SqlCommand("select Status,Quantity from tbl_Product where Pid=@pid", con);
            cmdp.Parameters.AddWithValue("@pid", pid);
            SqlDataAdapter sdap = new SqlDataAdapter(cmdp);
            DataTable dtp = new DataTable();
            sdap.Fill(dtp);
            int pquant = Convert.ToInt32(dtp.Rows[0]["Quantity"]);

            string name = txtName.Text.ToString();
            string price = txtPrice.Text.ToString();
            string quant = txtQuant.Text.ToString();
            string desc = txtDesc.Text.ToString();
            string status = "Available";
            string status1 = "Not Available";
            if(pquant > 0)
            {
                SqlCommand cmdstock = new SqlCommand("select Quantity from tbl_Product where Pid=@pid", con);
                cmdstock.Parameters.AddWithValue("@pid", pid);
                SqlDataAdapter sdastock = new SqlDataAdapter(cmdstock);
                DataTable dtstock = new DataTable();
                sdastock.Fill(dtstock);
                int stockquant = Convert.ToInt32(dtstock.Rows[0]["Quantity"]);

                SqlCommand cmdu = new SqlCommand("update tbl_Product set ProductName=@name, Sid=@sid, CatId=@catid,Bid=@bid, Tid=@tid, Price=@price, Quantity=@quant, Descripiton=@desc, Status=@status where Pid=@pid", con);
                cmdu.Parameters.AddWithValue("@pid", pid);
                cmdu.Parameters.AddWithValue("@name", name);
                cmdu.Parameters.AddWithValue("@sid", subid);
                cmdu.Parameters.AddWithValue("@catid", catid);
                cmdu.Parameters.AddWithValue("@bid", brandid);
                cmdu.Parameters.AddWithValue("@tid", tid);
                cmdu.Parameters.AddWithValue("@price", price);
                cmdu.Parameters.AddWithValue("@quant", quant);
                cmdu.Parameters.AddWithValue("@desc", desc);
                cmdu.Parameters.AddWithValue("@status", status);

                cmdu.ExecuteNonQuery();

                int nquant = Convert.ToInt32(quant);
                int Pquant = nquant - stockquant;

                SqlCommand cmdinsert = new SqlCommand("insert into tbl_Stock(Pid,Quantity,Date) values(@pid,@quant,@date)", con);
                cmdinsert.Parameters.AddWithValue("@pid", pid);
                cmdinsert.Parameters.AddWithValue("@quant", Pquant);
                cmdinsert.Parameters.AddWithValue("@date", DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss").ToString());
                cmdinsert.ExecuteNonQuery();
               
                Response.Redirect("~/ProductAdmin.aspx");
            }
            else
            {
                

                SqlCommand cmdu = new SqlCommand("update tbl_Product set ProductName=@name, Sid=@sid, CatId=@catid,Bid=@bid, Tid=@tid, Price=@price, Quantity=@quant, Descripiton=@desc, Status=@status where Pid=@pid", con);
                cmdu.Parameters.AddWithValue("@pid", pid);
                cmdu.Parameters.AddWithValue("@name", name);
                cmdu.Parameters.AddWithValue("@sid", subid);
                cmdu.Parameters.AddWithValue("@catid", catid);
                cmdu.Parameters.AddWithValue("@bid", brandid);
                cmdu.Parameters.AddWithValue("@tid", tid);
                cmdu.Parameters.AddWithValue("@price", price);
                cmdu.Parameters.AddWithValue("@quant", quant);
                cmdu.Parameters.AddWithValue("@desc", desc);
                cmdu.Parameters.AddWithValue("@status", status1);

                cmdu.ExecuteNonQuery();
                Response.Redirect("~/ProductAdmin.aspx");
            }
           
        }
    }
}