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
    public partial class AdminProduct : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.
               ConnectionStrings["sqlconnection"].ToString());
        SqlCommand cmd,cmd2,selectcmd;
        SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            if (!IsPostBack)
            {
                
                filldrop();
                if (Session["AdminEmail"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }

        }
        private void filldrop()
        {
            ddlCategory.DataSource = getuserdata();
            ddlCategory.DataTextField = "CategoryName";
            ddlCategory.DataValueField = "CatId";
            ddlCategory.DataBind();

            ddlSubcategory.DataSource = getsubcategory();
            ddlSubcategory.DataTextField = "SubcategoryName";
            ddlSubcategory.DataValueField = "Sid";
            ddlSubcategory.DataBind();

            ddlBrand.DataSource = getbrand();
            ddlBrand.DataTextField = "BrandName";
            ddlBrand.DataValueField = "Bid";
            ddlBrand.DataBind();

            ddlType.DataSource = gettype();
            ddlType.DataTextField = "Type";
            ddlType.DataValueField = "Tid";
            ddlType.DataBind();
            //throw new NotImplementedException();
        }
        private object getuserdata()
        {

            cmd = new SqlCommand("select CatId,CategoryName from tbl_Category", con);
            cmd.CommandType = System.Data.CommandType.Text;

            da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            //throw new NotImplementedException();
        }
        private object getsubcategory()
        {
            cmd = new SqlCommand("select * from tbl_Subcategory", con);
            cmd.CommandType = System.Data.CommandType.Text;
            da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            //throw new NotImplementedException();
        }
        private object getbrand()
        {
            cmd = new SqlCommand("select * from tbl_Brand", con);
            cmd.CommandType = System.Data.CommandType.Text;
            da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            //throw new NotImplementedException();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ProductAdmin.aspx");
        }

        private object gettype()
        {
            cmd = new SqlCommand("select * from tbl_Type", con);
            cmd.CommandType = System.Data.CommandType.Text;
            da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            //throw new NotImplementedException();
        }
        protected void btnSaveProduct_Click(object sender, EventArgs e)
        {
            string path1;
            Image1.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "Image/" + Image1.FileName);
            path1 = Image1.FileName;

            string path2;
            Image2.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "Image/" + Image2.FileName);
            path2 = Image2.FileName;

            string path3;
            Image3.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "Image/" + Image3.FileName);
            path3 = Image3.FileName;

            string path4;
            Image4.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "Image/" + Image4.FileName);
            path4 = Image4.FileName;


            int quant = Convert.ToInt32(txtQuantity.Text);
            string status;
            if (quant > 0)
            {
                status = "Available";
            }
            else
            {
                status = "NotAvailable";
            }

            string today = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            cmd = new SqlCommand("insert into tbl_Product values(@pname,@subid,@catid,@brandid,@typeid,@im1,@im2,@im3,@im4,@price,@quant,@desc,@edate,@status)",con);
            cmd.Parameters.AddWithValue("@pname", txtProductName.Text);
            cmd.Parameters.AddWithValue("@subid", ddlSubcategory.SelectedValue);
            cmd.Parameters.AddWithValue("@catid", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@brandid",ddlBrand.SelectedValue);
            cmd.Parameters.AddWithValue("@typeid",ddlType.SelectedValue);
            cmd.Parameters.AddWithValue("@im1", path1);
            cmd.Parameters.AddWithValue("@im2", path2);
            cmd.Parameters.AddWithValue("@im3", path3);
            cmd.Parameters.AddWithValue("@im4", path4);
            cmd.Parameters.AddWithValue("@price", txtPrice.Text);
            cmd.Parameters.AddWithValue("@quant", txtQuantity.Text);
            cmd.Parameters.AddWithValue("@desc", txtDescriptionProduct.Text);
            cmd.Parameters.AddWithValue("@edate",today);
            cmd.Parameters.AddWithValue("@status",status);
            cmd.ExecuteNonQuery();

            string pname = txtProductName.Text;
            selectcmd = new SqlCommand("select Pid from tbl_Product where ProductName='" + pname + "'", con);
            SqlDataReader re = selectcmd.ExecuteReader();
            if(re.Read())
            {
                int pid = re.GetInt32(0);
                re.Close();
               cmd2 = new SqlCommand("insert into tbl_Stock values(@pid,@quantity,@date)", con);
                    cmd2.Parameters.AddWithValue("@pid", pid);
                    cmd2.Parameters.AddWithValue("@quantity", txtQuantity.Text);
                    cmd2.Parameters.AddWithValue("@date", today);
                    cmd2.ExecuteNonQuery();
                    cmd2.Parameters.Clear();
                    Response.Redirect("~/ProductAdmin.aspx");
               
            }
            
            con.Close();
        }
    }
}