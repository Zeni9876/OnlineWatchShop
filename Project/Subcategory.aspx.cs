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
    public partial class Subcategory : System.Web.UI.Page
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
        }

        protected void btnSubcatsave_Click(object sender, EventArgs e)
        {
            if (!txtSubcatfile.HasFile)
            {
                lblError.Visible = true;
                lblError.Text = "Please Select Image";
            }
            else
            {
                string path;
                txtSubcatfile.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "Image/" + txtSubcatfile.FileName);
                path = txtSubcatfile.FileName;
                //int length = catfileupload.PostedFile.ContentLength;
                //byte[] pic = new byte[length];


                //catfileupload.PostedFile.InputStream.Read(pic, 0, length);
                SqlCommand cmd = new SqlCommand("insert into tbl_Subcategory values(@subcatname,@subcatimage,@subcatdesc)", con);
                cmd.Parameters.AddWithValue("@subcatname", txtSubCatname.Text);
                cmd.Parameters.AddWithValue("@subcatimage", path);
                cmd.Parameters.AddWithValue("@subcatdesc", txtSubCatdescription.Text);
                cmd.ExecuteNonQuery();
                Response.Redirect("~/ProductAdmin.aspx");
            }
        }
    }
}