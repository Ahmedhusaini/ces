using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using FinalTemplate.source.Database;
using FinalTemplate.source.Functions;
using FinalTemplate.source.WebServices;

namespace FinalTemplate
{
	public partial class Teacher_Marksheet : System.Web.UI.Page
	{
        string a = ConfigurationManager.ConnectionStrings["ces"].ConnectionString;
        Database db = new Database("ces");
		protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] != null)
            {
                 string[] col = { "General_Id" };
                 string[] colwhere = { "authorized_id" };
                 string[] whereoperator = { "=" };
                 string[] multiwhere = { "" };
              
             }
            else
            {
                 Response.Redirect("Default.aspx");
            }
		}

        protected void Button1_Click(object sender, EventArgs e)
        {
            FileInfo f = new FileInfo(FileUpload1.FileName);
            string marksheet_name = f.Name;
    
             int marksheet_id = Convert.ToInt32(db.GetLastValueByColumnName("marksheet_id", "tbl_Marksheet"));
 
             using (SqlConnection con = new SqlConnection(a))
             {
 
                 SqlCommand cmd = new SqlCommand("SP_Insert_Marksheet", con);
                 cmd.CommandType = System.Data.CommandType.StoredProcedure;
 
                 cmd.Parameters.AddWithValue("@marksheet_id", SqlDbType.Int).Value = marksheet_id + 1;
                 cmd.Parameters.AddWithValue("@teacher_id", SqlDbType.Int).Value = teacher.teacher_id;
                 cmd.Parameters.AddWithValue("@teacher_id_out", SqlDbType.Int).Direction = ParameterDirection.Output;
                 cmd.Parameters.AddWithValue("@std_id", SqlDbType.VarChar).Value = "C/sha/E/4/S/4/11/4";       
                 cmd.Parameters.AddWithValue("@marksheet", SqlDbType.VarChar).Value = marksheet_name;
 
                 con.Open();
                 cmd.ExecuteNonQuery();
             }
             if (FileUpload1.HasFile)
              {
                // FileUpload1.PostedFile.SaveAs(Server.MapPath("~/files/") + FileUpload1.FileName);
                 string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName);
 
                 if (fileExtension.ToLower() != ".xlsx" && fileExtension.ToLower() != ".xlsm")
                 {
                     Label1.Text = "Only Excel File are allowed to upload";
                     Label1.ForeColor = System.Drawing.Color.Red;
                 }
                 else
                 {
                     int filesize = FileUpload1.PostedFile.ContentLength;
                     if (filesize > 2097152)
                     {
                         Label1.Text = "Maximum Size of 2MB can upload";
                         Label1.ForeColor = System.Drawing.Color.Red;
                     }
                    else
                     {
                         FileUpload1.SaveAs(Server.MapPath("~/files" + FileUpload1.FileName));
                         Label1.Text = "file uploaded";
                         Label1.ForeColor = System.Drawing.Color.Green;
                         // FileUpload1.PostedFile.SaveAs(Server.MapPath("~/files") + FileUpload1.FileName);
                     }
                 }
             }
             else
             {
                 Label1.Text = "Please Upload the File";
                Label1.ForeColor = System.Drawing.Color.Red;
              }
        }
	}
}