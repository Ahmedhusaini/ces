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

             if(!IsPostBack)
            {
                filldata();
            }
        }
        private void filldata()
        {
            DataTable dt=new DataTable();
            int lec_id = Convert.ToInt32(db.GetLastValueByColumnName("lec_id", "tbl_Teacher_lecture"));
              using (SqlConnection con = new SqlConnection(a))
              {
                SqlCommand cmd = new SqlCommand("SP_Get_file", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@lec_id", SqlDbType.Int).Value = lec_id;
                con.Open();
                SqlDataReader reader=cmd.ExecuteReader();
             
                dt.Load(reader);
              }
            if(dt.Rows.Count >0)
            {
                GridView1.DataSource=dt;
                GridView1.DataBind();
            }
        }

        protected void OpenDocument(object sender,EventArgs e)
        {
            LinkButton li = (LinkButton)sender;
            GridViewRow gr = (GridViewRow)li.NamingContainer;

            int lec_id = int.Parse(GridView1.DataKeys[gr.RowIndex].Value.ToString());
            download(lec_id);
        }
        private void download(int lec_id)
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
            string name = dt.Rows[0]["lectures"].ToString();
            byte[] documentBytes=(byte[])dt.Rows[0]["content"];

                   Response.Clear();
                   Response.ContentType = "application/octect-stream";
                   Response.AppendHeader("content-disposition", string.Format("attachment; filename={0}",name));
                   Response.AppendHeader("content-Length",documentBytes.Length.ToString());
                   Response.BinaryWrite(documentBytes);
                   Response.Flush();
                   Response.Close();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            FileInfo f = new FileInfo(FileUpload1.FileName);
            byte[] documentcontent = FileUpload1.FileBytes;

            string name = f.Name;
            string extension = f.Extension;
            int lec_id = Convert.ToInt32(db.GetLastValueByColumnName("lec_id", "tbl_teacher_attandance_test"));
           
            using (SqlConnection con = new SqlConnection(a))
            {

                SqlCommand cmd = new SqlCommand("SP_Insert_file", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@lec_id", SqlDbType.Int).Value = lec_id + 1;
                cmd.Parameters.AddWithValue("@lectures", SqlDbType.VarChar).Value = name;
                cmd.Parameters.AddWithValue("@content", SqlDbType.VarChar).Value = documentcontent;
                cmd.Parameters.AddWithValue("@extension", SqlDbType.VarChar).Value = extension;
                cmd.Parameters.AddWithValue("@teacher_id", SqlDbType.Int).Value = teacher.teacherid;
                cmd.Parameters.AddWithValue("@school_id", SqlDbType.Int).Value = teacher.schoolid;
                cmd.Parameters.AddWithValue("@authorized_id", SqlDbType.Int).Value = teacher.authorizedid;
                cmd.Parameters.AddWithValue("@class_sec_info_id", SqlDbType.Int).Value =  teacher.classsecinfoid;
               
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}
