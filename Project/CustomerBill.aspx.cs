using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace Project
{
    public partial class CustomerBill : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
                  ConnectionStrings["sqlconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            if(!IsPostBack)
            {
                getData();
            }
        }
        public void getData()
        {
            string query = "select c.Firstname,c.Lastname,c.Contactno,c.Address,c.City,c.Area,c.Pincode,p.ProductName,p.Pid,p.Price,od.Quantity,od.Price,o.odate,b.Amount,b.Billno,b.gst,b.TotalAmount from tbl_Bill b inner join tbl_Order o on b.OrderId=o.OrderId inner join tbl_Order_detail od on o.OrderId=od.OrderId inner join  tbl_Product p on p.Pid=od.PId inner join tbl_Cutomer c on b.CId=c.CId where b.Billno=@id";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", Session["id"]);
            SqlDataReader sdr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(sdr);

            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dt));
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataSet2", dt));
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataSet3", dt));
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataSet4", dt));
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataSet5", dt));

            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/BillReport.rdlc");

            //SqlCommand cmdcart = new SqlCommand("delete from tbl_Addtocart", con);
            //cmdcart.ExecuteNonQuery();
        }
    }
}