using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace FinalTemplate
{
    public partial class Teacherprofile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=AHMED;Initial Catalog=images;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string str = FileUpload1.FileName;
                FileUpload1.PostedFile.SaveAs(Server.MapPath(".") + "//images//" + str);
                string path = "~//images//" + str.ToString();
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into image values('" + TextBox1.Text + "','" + path + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Label1.Text = "Image Uploaded Sucessfully";
                SqlDataAdapter da = new SqlDataAdapter("select * from image", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                DataBind();
            }
            else
            {
                Label1.Text = "Upload Your Image";

            }
        }
    }
}