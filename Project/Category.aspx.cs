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
    public partial class Category : System.Web.UI.Page
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

        protected void btncatsave_Click(object sender, EventArgs e)
        {
            if(!catfileupload.HasFile)
            {
                lblError.Visible = true;
                lblError.Text = "Please Select Image";
            }
            else
            {
                string path;
                catfileupload.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "Image/" + catfileupload.FileName);
                path = catfileupload.FileName;
                //int length = catfileupload.PostedFile.ContentLength;
                //byte[] pic = new byte[length];


                //catfileupload.PostedFile.InputStream.Read(pic, 0, length);
                SqlCommand cmd = new SqlCommand("insert into tbl_Category values(@catname,@catimage,@catdesc)",con);
                cmd.Parameters.AddWithValue("@catname", txtCatname.Text);
                cmd.Parameters.AddWithValue("@catimage", path);
                cmd.Parameters.AddWithValue("@catdesc", txtCatdescription.Text);
                cmd.ExecuteNonQuery();
                Response.Redirect("~/ProductAdmin.aspx");
            }
           
        }
    }
}