using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using FinalTemplate.source.Database;
using System.IO;



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
                    int teacher_id = Convert.ToInt32(db.GetLastValueByColumnName("teacher_id", "tbl_teacher"));
                    int school_id = Convert.ToInt32(db.GetLastValueByColumnName("School_id", "tbl_school"));
                    using (SqlConnection con = new SqlConnection(a))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("INSERT INTO tbl_Teacher_lecture(lectures,type,data) VALUES (@lectures,@type,@data)",con);
                      
                        cmd.Parameters.AddWithValue("@lectures", filename);
                        cmd.Parameters.AddWithValue("@type", filetype);
                        cmd.Parameters.AddWithValue("@size", filesize);

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
    
