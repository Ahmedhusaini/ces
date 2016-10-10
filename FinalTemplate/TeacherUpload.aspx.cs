using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics.Eventing.Reader;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
using FinalTemplate.source.Database;


namespace FinalTemplate
{
    public partial class TeacherUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    Stream strm = FileUpload1.PostedFile.InputStream;
                    BinaryReader br = new BinaryReader(strm);
                    Byte[] filesize=br.ReadBytes((int)strm.Length);
                    string filetype=FileUpload1.PostedFile.ContentType;

                    string a = ConfigurationManager.ConnectionStrings["abc"].ConnectionString;
                    Database db = new Database("abc");
                    using (SqlConnection con = new SqlConnection(a))
                    {
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = "INSERT INTO Table_1(name,type,data) VALUES (@name,@type,@data)";
                        cmd.Parameters.AddWithValue("@name", filename);
                        cmd.Parameters.AddWithValue("@type", filetype);
                        cmd.Parameters.AddWithValue("@size", filesize);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Label1.ForeColor = System.Drawing.Color.Green;
                        Label1.Text = "Sucessfully Uploaded";
                    }
                 
                }
                catch
                {
                    Label1.ForeColor=System.Drawing.Color.Red;
                    Label1.Text="Uploading failed..!!";
                }
                
            }
            else
            {
                  Label1.ForeColor=System.Drawing.Color.Red;
                    Label1.Text="Please select the file";
            }
         
        }

    }
}    
    
