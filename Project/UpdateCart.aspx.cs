﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class UpdateCart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
               ConnectionStrings["sqlconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
        }

        protected void btnquant_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Update tbl_Addtocart set Quantity=@quant where CartId=@Cartid", con);
            cmd.Parameters.AddWithValue("@quant",txtquant.Text);
            cmd.ExecuteNonQuery();
        }
    }
}