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
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
                  ConnectionStrings["sqlconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            if (Session["AdminEmail"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                int countrecord = 0;
                SqlCommand cmdd = new SqlCommand("Select COUNT(*) from tbl_Cutomer", con);
                countrecord = (int) cmdd.ExecuteScalar();
                Session["TotalCustomer"] = countrecord;

                int countproduct = 0;
                SqlCommand cmd = new SqlCommand("select COUNT(*) from tbl_Product", con);
                countproduct = (int)cmd.ExecuteScalar();
                Session["TotalProducts"] = countproduct;

                int TimexBrand = 0;
                int Timex = 1;
                string[] brand=new string[6];
                brand[0] = "Titan";
                SqlCommand cmdb = new SqlCommand("select COUNT(*) from tbl_Product where Bid=@timex", con);
                cmdb.Parameters.AddWithValue("@timex", Timex);
                TimexBrand = (int)cmdb.ExecuteScalar();
                Session["Timex"] = TimexBrand;

                int TitanBrand = 0;
                int Titan = 2;
                brand[1]= "Titan";
                SqlCommand cmdt = new SqlCommand("select COUNT(*) from tbl_Product where Bid=@titan", con);
                cmdt.Parameters.AddWithValue("@titan", Titan);
                TitanBrand = (int)cmdt.ExecuteScalar();
                Session["Titan"] = TitanBrand;

                int FastrackBrand = 0;
                int Fastrack = 3;
                brand[2] = "Fastrack";
                SqlCommand cmdf = new SqlCommand("select COUNT(*) from tbl_Product where Bid=@fast", con);
                cmdf.Parameters.AddWithValue("@fast", Fastrack);
                FastrackBrand = (int)cmdf.ExecuteScalar();
                Session["Fastrack"] = FastrackBrand;

                int RolexBrand = 0;
                int Rolex = 4;
                brand[3] = "Rolex";
                SqlCommand cmdr = new SqlCommand("select COUNT(*) from tbl_Product where Bid=@rol", con);
                cmdr.Parameters.AddWithValue("@rol", Rolex);
                RolexBrand = (int)cmdr.ExecuteScalar();
                Session["Rolex"] = RolexBrand;

                int FossilBrand = 0;
                int Fossil = 3;
                brand[4] = "Fossil";
                SqlCommand cmdfo = new SqlCommand("select COUNT(*) from tbl_Product where Bid=@fossil", con);
                cmdfo.Parameters.AddWithValue("@fossil", Fossil);
                FossilBrand = (int)cmdfo.ExecuteScalar();
                Session["Fossil"] = FossilBrand;

                this.Chart1.Series["Bid"].Points.AddXY("Timex", Session["Timex"]);
                this.Chart1.Series["Bid"].Points.AddXY("Titan", Session["Titan"]);
                this.Chart1.Series["Bid"].Points.AddXY("Fastrack", Session["Fastrack"]);
                this.Chart1.Series["Bid"].Points.AddXY("Rolex", Session["Rolex"]);
                this.Chart1.Series["Bid"].Points.AddXY("Fossil", Session["Fossil"]);

                int Maletype = 0;
                int Male = 1;
                string[] type = new string[5];
                type[1] = "Male";
                SqlCommand cmdm = new SqlCommand("select COUNT(*) from tbl_Product where Tid=@male", con);
                cmdm.Parameters.AddWithValue("@male", Male);
                Maletype = (int)cmdm.ExecuteScalar();
                Session["Male"] = Maletype;

                int Femaletype = 0;
                int Female = 2;
                type[2] = "Female";
                SqlCommand cmdfm = new SqlCommand("select COUNT(*) from tbl_Product where Tid=@female", con);
                cmdfm.Parameters.AddWithValue("@female", Female);
                Femaletype = (int)cmdfm.ExecuteScalar();
                Session["Female"] = Femaletype;

                int Kidstype = 0;
                int Kids = 3;
                type[3] = "Kids";
                SqlCommand cmdk = new SqlCommand("select COUNT(*) from tbl_Product where Tid=@kids", con);
                cmdk.Parameters.AddWithValue("@kids", Kids);
                Kidstype = (int)cmdk.ExecuteScalar();
                Session["Kids"] = Kidstype;

                int Coupletype = 0;
                int Couple = 4;
                type[4] = "Couple";
                SqlCommand cmdc = new SqlCommand("select COUNT(*) from tbl_Product where Tid=@couple", con);
                cmdc.Parameters.AddWithValue("@couple", Couple);
                Coupletype = (int)cmdc.ExecuteScalar();
                Session["Couple"] = Coupletype;

                this.Chart2.Series["Tid"].Points.AddXY("Male", Session["Male"]);
                this.Chart2.Series["Tid"].Points.AddXY("Female", Session["Female"]);
                this.Chart2.Series["Tid"].Points.AddXY("Kids", Session["Kids"]);
                this.Chart2.Series["Tid"].Points.AddXY("Couple", Session["Couple"]);
                
            }
        }
    }
}