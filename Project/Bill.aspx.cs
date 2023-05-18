using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Text;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Data.SqlClient;
using System.Configuration;

namespace Project
{
    public partial class Bill : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
             ConnectionStrings["sqlconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            //int cid =Convert.ToInt32(Session["cuid"]);
            int cid = 9;
            SqlCommand cmd1 = new SqlCommand("select * from tbl_Addtocart where CId=@cid", con);
            cmd1.Parameters.AddWithValue("@cid", cid);
            SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);
            int id = Convert.ToInt32(dt1.Rows[0]["PId"]);
            string companyName = "DZ Watchshop";
            int orderNo = 1234;
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[2] {
                            new DataColumn("ProductName ", typeof(string)),
                            new DataColumn(" Price ", typeof(string)) });
            SqlCommand cmd = new SqlCommand("select c.*,ca.* from tbl_Product c INNER JOIN tbl_Category ca ON c.CatId=ca.CatId where c.Pid='" + id + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dtr = new DataTable();
            sda.Fill(dtr);

            int price = Convert.ToInt32(dtr.Rows[0]["Price"]);
            int gst = price * 18 / 100;
            Session["gst"] = "(18%)GST : " + gst.ToString();
            int total2 = price + gst;
            
            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    StringBuilder sb = new StringBuilder();

                    //Generate Invoice (Bill) Header.
                    sb.Append("<table width='100%' cellspacing='0' cellpadding='2'>");
                    sb.Append("<tr><td align='center' style='background-color: #18B5F0' colspan = '2'><b>Order Sheet</b></td></tr>");
                    sb.Append("<tr><td colspan = '2'></td></tr>");
                    sb.Append("<tr><td><b>Order No: </b>");
                    sb.Append(orderNo);
                    sb.Append("</td><td align = 'right'><b>Date: </b>");
                    sb.Append(DateTime.Now);
                    sb.Append(" </td></tr>");
                    sb.Append("<tr><td colspan = '2'><b>Company Name: </b>");
                    sb.Append(companyName);
                    sb.Append("</td></tr>");
                    sb.Append("</table>");
                    sb.Append("<br />");

                    //Generate Invoice (Bill) Items Grid.
                    sb.Append("<table border = '1'>");
                    sb.Append("<tr>");
                    foreach (DataColumn column in dt.Columns)
                    {
                        sb.Append("<th style = 'background-color: #D20B0C;color:#ffffff'>");
                        sb.Append(column.ColumnName);
                        sb.Append("</th>");
                    }
                    sb.Append("</tr>");
                    foreach (DataRow row in dt.Rows)
                    {
                        sb.Append("<tr>");
                        foreach (DataColumn column in dt.Columns)
                        {
                            sb.Append("<td>");
                            sb.Append(row[column]);
                            sb.Append("</td>");
                        }
                        sb.Append("</tr>");
                    }
                    sb.Append("<tr><td align = 'right' colspan = '");
                    sb.Append(dt.Columns.Count - 1);
                    sb.Append("'>Product Name</td>");
                    sb.Append("<td>");
                    sb.Append(dtr.Rows[0]["ProductName"]);
                    sb.Append("</td>");
                    sb.Append("</tr></table>");

                    sb.Append("<tr><td colspan = '");
                    sb.Append(dt.Columns.Count - 1);
                    sb.Append("'>Product price</td>");
                    sb.Append("<td>");
                    sb.Append(dtr.Rows[0]["Price"]);
                    sb.Append("</td>");
                    sb.Append("</tr>");

                    sb.Append("<tr><td colspan = '");
                    sb.Append(dt.Columns.Count - 1);
                    sb.Append("'>GST(18% )</td>");
                    sb.Append("<td>");
                    sb.Append(gst);
                    sb.Append("</td>");
                    sb.Append("</tr>");

                    sb.Append("<tr><td align = 'right' colspan = '");
                    sb.Append(dt.Columns.Count - 1);
                    sb.Append("'>Total Price</td>");
                    sb.Append("<td>");
                    sb.Append(total2);
                    sb.Append("</td>");
                    sb.Append("</tr>");

                    sb.Append("<tr><td align = 'right' colspan = '");
                    sb.Append(dt.Columns.Count - 1);
                    sb.Append("'>");
                    sb.Append("<td>");
                    sb.Append("");
                    sb.Append("</td>");
                    sb.Append("</tr>");
                    //Export HTML String as PDF.
                    StringReader sr = new StringReader(sb.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    htmlparser.Parse(sr);
                    pdfDoc.Close();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=Quatation_" + dtr.Rows[0]["ProductName"] + ".pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    Response.End();
                    //    string productname;
                    //    string companyName = "DZ Watchshop";

                    //    int orderNo = 1234;
                    //    int cuid = Convert.ToInt32(Session["cuid"]);

                    //    SqlCommand cmdcount = new SqlCommand("select OrderId from tbl_Order where CId=@cid", con);
                    //    cmdcount.Parameters.AddWithValue("@cid", cuid);
                    //    SqlDataAdapter sdacount = new SqlDataAdapter(cmdcount);
                    //    DataTable dtcount = new DataTable();
                    //    sdacount.Fill(dtcount);

                    //    DataTable dt2 = new DataTable();
                    //    dt2.Columns.Add("Order_detail_ID");
                    //    dt2.Columns.Add("OrderID");
                    //    dt2.Columns.Add("PId");
                    //    dt2.Columns.Add("Quantity");
                    //    dt2.Columns.Add("Price");

                    //    for (int i = 0; i < dtcount.Rows.Count; i++)
                    //    {
                    //        string oid = dtcount.Rows[i][0].ToString();

                    //        SqlCommand cmdodid = new SqlCommand("select Order_detail_ID from tbl_Order_detail where OrderId=@oid", con);
                    //        cmdodid.Parameters.AddWithValue("@oid", oid);
                    //        SqlDataAdapter sdaodid = new SqlDataAdapter(cmdodid);
                    //        DataTable dtodid = new DataTable();
                    //        sdaodid.Fill(dtodid);

                    //        for (int j = 0; j < dtodid.Rows.Count; j++)
                    //        {
                    //            string odid = dtodid.Rows[j][0].ToString();

                    //            SqlCommand cmdorder = new SqlCommand("select * from tbl_Order_detail where Order_detail_ID=@odid", con);
                    //            cmdorder.Parameters.AddWithValue("@odid", odid);
                    //            SqlDataAdapter sdaorder = new SqlDataAdapter(cmdorder);
                    //            DataTable dt1 = new DataTable();
                    //            sdaorder.Fill(dt2);

                    //            for (int k = 0; k < dt1.Rows.Count; k++)
                    //            {
                    //                int prid = Convert.ToInt32(dt1.Rows[0]["PId"]);
                    //                SqlCommand cmdprname = new SqlCommand("select * from tbl_Product where Pid=@pid", con);
                    //                cmdprname.Parameters.AddWithValue("@pid", prid);
                    //                SqlDataAdapter sdaprname = new SqlDataAdapter(cmdprname);
                    //                DataTable dtprname = new DataTable();
                    //                sdaprname.Fill(dtprname);
                    //                Session["prid"] = prid;
                    //                productname = dtprname.Rows[0]["ProductName"].ToString();
                    //                Session["PrProduct"] = productname;
                    //                Double price = Convert.ToDouble(dtprname.Rows[0]["Price"]);
                    //                Session["PrPrice"] = price;
                    //                Session["quantity"] = Convert.ToInt32(dt1.Rows[0]["Quantity"]);



                    //            }
                    //        }
                    //    }
                    //    DataTable dt = new DataTable();
                    //    dt.Columns.Add("PId");
                    //    dt.Columns.Add("ProductName");
                    //    dt.Columns.Add("Price");
                    //    dt.Columns.Add("Quantity");
                    //    dt.Columns.Add("Total");

                    //    dt.Rows.Add(Session["prid"].ToString(), Session["PrProduct"].ToString(),
                    //        Session["PrPrice"].ToString(), Session["quantity"].ToString());

                    //    using (StringWriter sw = new StringWriter())
                    //    {
                    //        using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                    //        {
                    //            StringBuilder sb = new StringBuilder();

                    //            Generate Invoice(Bill) Header.
                    //           sb.Append("<table width='100%' cellspacing='0' cellpadding='2'>");
                    //            sb.Append("<tr><td align='center' style='background-color: #18B5F0' colspan = '2'><b>Order Sheet</b></td></tr>");
                    //            sb.Append("<tr><td colspan = '2'></td></tr>");
                    //            sb.Append("<tr><td><b>Order No: </b>");
                    //            sb.Append(orderNo);
                    //            sb.Append("</td><td align = 'right'><b>Date: </b>");
                    //            sb.Append(DateTime.Now);
                    //            sb.Append(" </td></tr>");
                    //            sb.Append("<tr><td colspan = '2'><b>Company Name: </b>");
                    //            sb.Append(companyName);
                    //            sb.Append("</td></tr>");
                    //            sb.Append("</table>");
                    //            sb.Append("<br />");

                    //            Generate Invoice(Bill) Items Grid.
                    //            sb.Append("<table border = '1'>");
                    //            sb.Append("<tr>");
                    //            foreach (DataColumn column in dt.Columns)
                    //            {
                    //                sb.Append("<th style = 'background-color: #D20B0C;color:#ffffff'>");
                    //                sb.Append(column.ColumnName);
                    //                sb.Append("</th>");
                    //            }
                    //            sb.Append("</tr>");
                    //            foreach (DataRow row in dt.Rows)
                    //            {
                    //                sb.Append("<tr>");
                    //                foreach (DataColumn column in dt.Columns)
                    //                {
                    //                    sb.Append("<td>");
                    //                    sb.Append(row[column]);
                    //                    sb.Append("</td>");
                    //                }
                    //                sb.Append("</tr>");
                    //            }
                    //            StringReader sr = new StringReader(sb.ToString());
                    //            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    //            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                    //            PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    //            pdfDoc.Open();
                    //            htmlparser.Parse(sr);
                    //            pdfDoc.Close();
                    //            Response.ContentType = "application/pdf";
                    //            Response.AddHeader("content-disposition", "attachment;filename=Invoice_" + orderNo + ".pdf");
                    //            Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    //            Response.Write(pdfDoc);
                    //            Response.End();

                    //            Export HTML String as PDF.


                    //        }
                    //    }
                    //}
                }
    }
        }
    }
}