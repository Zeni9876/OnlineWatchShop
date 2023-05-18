using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Payment : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
               ConnectionStrings["sqlconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            string amount = Session["Totalamount"].ToString();
            
        }

        protected void btnPayment_Click(object sender, EventArgs e)
        {
            string type = Session["Paymenttype"].ToString();
            string oid = Session["orderid"].ToString();
            string status = "Completed";
            string status1 = "Pending";
            if (type.Equals("Online"))
            {
                SqlCommand cmd = new SqlCommand("update tbl_Order set Payment_status=@pstatus where OrderId=@oid", con);
                cmd.Parameters.AddWithValue("@pstatus", status.ToString());
                cmd.Parameters.AddWithValue("@oid", oid);
                cmd.ExecuteNonQuery();
            }
            else if (type.Equals("Cash On Delivery"))
            {
                SqlCommand cmd = new SqlCommand("update tbl_Order set Payment_status=@pstatus where OrderId=@oid", con);
                cmd.Parameters.AddWithValue("@pstatus", status1.ToString());
                cmd.Parameters.AddWithValue("@oid", oid);
                cmd.ExecuteNonQuery();
            }
            string merchantKey = "rKFy9v9vGjp7ajt5";  //Change this constant's value with Merchant key

            Dictionary<string, string> parameters = new Dictionary<string, string>();

            parameters.Add("MID", "TYmwCE61492093834199");
            parameters.Add("CHANNEL_ID", "WEB");
            parameters.Add("INDUSTRY_TYPE_ID", "Retail");
            parameters.Add("WEBSITE", "WEBSTAGING");
            //parameters.Add("EMAIL", txtemailid.Text);
            //parameters.Add("MOBILE_NO", txtcontactno.Text);
            parameters.Add("CUST_ID", Session["CId"].ToString());
            parameters.Add("ORDER_ID", "ord" + oid);
            parameters.Add("TXN_AMOUNT", Session["Totalamount"].ToString());
            parameters.Add("CALLBACK_URL", "https://localhost:44377/PaytmResponse.aspx");


            string checksum = Paytm.Checksum.generateSignature(parameters, merchantKey);

            //bool verifySignature = Paytm.Checksum.verifySignature(parameters, merchantKey, checksum);
            //Response.Write(checksum + "<br>");
            //Response.Write(verifySignature+"<br>");

            //if (verifySignature.ToString() == "True" )
            //{
            string paytmURL = "https://securegw-stage.paytm.in/theia/processTransaction";
            string outputHTML = "<html>";
            outputHTML += "<head>";
            outputHTML += "<title>Merchant check out page</title>";
            outputHTML += "</head>";
            outputHTML += "<body>";
            outputHTML += "<center><h1>Please do not refresh this page...</h1></center>";
            outputHTML += "<form method='post' action='" + paytmURL + "' name='f1'>";
            outputHTML += "<table border='1'>";
            outputHTML += "<tbody>";
            foreach (string Key in parameters.Keys)
            {
                outputHTML += "<input type='hidden' name='" + Key + "' value='" + parameters[Key] + "'>";
            }
            outputHTML += "<input type='hidden' name='CHECKSUMHASH' value='" + checksum + "'>";
            outputHTML += "</tbody>";
            outputHTML += "</table>";
            outputHTML += "<script type='text/javascript'>";
            outputHTML += "document.f1.submit();";
            outputHTML += "</script>";
            outputHTML += "</form>";
            outputHTML += "</body>";
            outputHTML += "</html>";
            Response.Write(outputHTML);

            
        }
    }
}
