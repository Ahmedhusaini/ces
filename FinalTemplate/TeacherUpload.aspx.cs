using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics.Eventing.Reader;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using FinalTemplate.source.Database;
using FinalTemplate.source.Functions;
using FinalTemplate.source.WebServices;


namespace FinalTemplate
{
    public partial class TeacherUpload : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                filldata();
            }
        }
        private void filldata()
        {
            DataTable dt = new DataTable();
            int lec_id = Convert.ToInt32(db.GetLastValueByColumnName("lec_id", "lecture_attandance_test"));
            using (SqlConnection con = new SqlConnection(a))
            {
                SqlCommand cmd = new SqlCommand("SP_Get_file", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@lec_id", SqlDbType.Int).Value = lec_id;
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                dt.Load(reader);
            }
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void OpenDocument(object sender, EventArgs e)
        {
            LinkButton li = (LinkButton)sender;
            GridViewRow gr = (GridViewRow)li.NamingContainer;

            int lec_id = int.Parse(GridView1.DataKeys[gr.RowIndex].Value.ToString());

            FileInfo fi = new FileInfo(download(lec_id));
            string filePath = (sender as LinkButton).CommandArgument;
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            Response.WriteFile(filePath);
            Response.End();
        }
        private string download(int lec_id)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(a))
            {
                SqlCommand cmd = new SqlCommand("SP_Get_file", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@lec_id", SqlDbType.Int).Value = lec_id;
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                dt.Load(reader);
            }
            return dt.Rows[0]["fullpath"].ToString();
            //byte[] documentBytes = (byte[])dt.Rows[0]["content"];
            
            //Response.AppendHeader("content-Length", documentBytes.Length.ToString());
            //Response.BinaryWrite(documentBytes);
            
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            string fullpath="files/Lectures/";

            
            int lec_id = Convert.ToInt32(db.GetLastValueByColumnName("lec_id", "lecture_attandance_test"));
            
            using (SqlConnection con = new SqlConnection(a))
            {

                SqlCommand cmd = new SqlCommand("SP_Insert_file", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@lec_id", SqlDbType.Int).Value = lec_id + 1;
                cmd.Parameters.AddWithValue("@fullpath", SqlDbType.VarChar).Value = fullpath+FileUpload1.FileName;
                cmd.Parameters.AddWithValue("@teacher_id", SqlDbType.Int).Value = teacher.teacher_id;
                cmd.Parameters.AddWithValue("@authorized_id", SqlDbType.VarChar).Value = CurrentUser.AuthorizedID;
                cmd.Parameters.AddWithValue("@class_sec_info_id", SqlDbType.Int).Value = teacher.class_id;


                try
                {

                    con.Open();

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        if (JFunctions.UploadSingleFile(FileUpload1, fullpath + FileUpload1.FileName) == "true")
                        { HttpContext.Current.Response.Write("<script>alert('File Uploaded.')</script>"); }
                    }

                }
                catch (Exception ex)
                {
                    HttpContext.Current.Response.Write(ex.ToString());
                }
                finally
                {
                    con.Close();
                    cmd.Dispose();                   
                }
                Server.TransferRequest(Request.Url.AbsolutePath, false);
            }
        }
    }
}
