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
    public partial class MyOrder : System.Web.UI.Page
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
                string email = Session["Email"].ToString();
                SqlCommand cmdcid = new SqlCommand("Select CId from tbl_Cutomer where Emailid=@em", con);
                cmdcid.Parameters.AddWithValue("@em", email);
                SqlDataAdapter sdacid = new SqlDataAdapter(cmdcid);
                DataTable dtcid = new DataTable();
                sdacid.Fill(dtcid);
                int cid = Convert.ToInt32(dtcid.Rows[0]["CId"]);
                Session["cuid"] = cid;

                SqlCommand cmdcount = new SqlCommand("select OrderId from tbl_Order where CId=@cid", con);
                cmdcount.Parameters.AddWithValue("@cid", cid);
                SqlDataAdapter sdacount = new SqlDataAdapter(cmdcount);
                DataTable dtcount = new DataTable();
                sdacount.Fill(dtcount);

                DataTable dt = new DataTable();
                dt.Columns.Add("Order_detail_ID");
                dt.Columns.Add("OrderID");
                dt.Columns.Add("PId");
                dt.Columns.Add("Quantity");
                dt.Columns.Add("Price");

                for (int i=0;i<dtcount.Rows.Count;i++)
                {
                    string oid = dtcount.Rows[i][0].ToString();

                    SqlCommand cmdodid = new SqlCommand("select Order_detail_ID from tbl_Order_detail where OrderId=@oid", con);
                    cmdodid.Parameters.AddWithValue("@oid", oid);
                    SqlDataAdapter sdaodid = new SqlDataAdapter(cmdodid);
                    DataTable dtodid = new DataTable();
                    sdaodid.Fill(dtodid);

                    for(int j=0;j<dtodid.Rows.Count;j++)
                    {
                        string odid = dtodid.Rows[j][0].ToString();
                      
                        SqlCommand cmdorder = new SqlCommand("select PId,Quantity,Price from tbl_Order_detail where Order_detail_ID=@odid", con);
                        cmdorder.Parameters.AddWithValue("@odid", odid);
                        SqlDataAdapter sdaorder = new SqlDataAdapter(cmdorder);
                        DataTable dt1 = new DataTable();
                        sdaorder.Fill(dt);
                        
                        for(int k=0; k<dt1.Rows.Count; k++)
                        {
                            DataRow dr = dt.NewRow();
                            
                            dr["Order_detail_ID"] = dt1.Rows[i]["Order_detail_ID"];
                            dr["OrderID"] = dt1.Rows[i]["OrderID"];
                            dr["PId"] = dt1.Rows[i]["PId"].ToString();
                            
                            dr["Quantity"] = dt1.Rows[i]["Quantity"];
                            dr["Price"] = dt1.Rows[i]["Price"];

                            dt.Rows.Add(dr);
                        }
                        
                    }                    
                }
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}