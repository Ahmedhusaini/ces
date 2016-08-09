using System;
using System.Collections.Generic;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;
using System.Data.Sql;
using System.Data.SqlClient;

namespace FinalTemplate
{
    public partial class studentpanel1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=SHAHWAIZHASAN;Initial Catalog=ces;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (FileUpload1.HasFile)
                {
                    string filename = FileUpload1.FileName;
                    FileUpload1.PostedFile.SaveAs(Server.MapPath(".") + "//images//" + filename);
                    string filepath = Server.MapPath(@"~\images\" + filename.ToString());
                    string fullfilepath = filepath + filename;
                    string extension = Path.GetExtension(filename);
                    label.Text = filepath;
                    int filesize = FileUpload1.PostedFile.ContentLength / 1024;
                    int i = 0;
                    if (extension == ".jpg" || extension == ".png")
                    {
                        if (filesize > 5000)
                        {
                            FileUpload1.SaveAs(fullfilepath);
                            i = 1;
                        }
                        else
                        {
                            label.Text = "Filesize Exceed 1MB.";
                        }
                    }
                    con.Open();
                    string path = @"~\images\" + filename.ToString();
                    SqlCommand cmd = new SqlCommand("update tbl_general set photo='" + path + "' where General_Id=1", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    label.Text = "upload";
                }
            }
            catch (Exception ex)
            {
                label.Text = (ex.Message);
            }
        }
    }
}