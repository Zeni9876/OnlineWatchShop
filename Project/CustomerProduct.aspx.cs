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
    public partial class CustomerProduct : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
               ConnectionStrings["sqlconnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
           if(Session["Email"]  == null)
            {
                Response.Redirect("~/Login.aspx");
            }
           
        }

       
        //private void fillimage()
        //{
        //    SqlDataAdapter da = new SqlDataAdapter("select * from tbl_Product", con);
        //    DataSet ds = new DataSet();
        //    da.Fill(ds);
        //    ddlimglist.DataSource = ds;
        //    ddlimglist.DataBind();
        //}
        //protected void ddlimglist_ItemCommand(object source,DataListCommandEventArgs e)
        //{
        //    //Label lbl = (Label)e.Item.FindControl("lblDisplay");
        //    //Response.Write(lbl.Text);
        //    //Session["addtocart"] = true;
        //    Label pid = (Label)e.Item.FindControl("lblDisplay");
        //    pid.Visible = true;
        //}

        //protected void btncart_Click(object sender, EventArgs e)
        //{
        //    lblDisplay.Visible = true;
        //    lblDisplay.Text = "Successfully added";
        //}

        


    }
}