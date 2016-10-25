using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics.Eventing.Reader;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using  System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using FinalTemplate.source.Database;


namespace FinalTemplate
{
    public partial class TeacherUpload : System.Web.UI.Page
    {
        string a = ConfigurationManager.ConnectionStrings["abc"].ConnectionString;
        Database db = new Database("abc");
        protected void Page_Load(object sender, EventArgs e)
        {
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
            int lec_id = Convert.ToInt32(db.GetLastValueByColumnName("lec_id", "tbl_Teacher_lecture"));
           
            using (SqlConnection con = new SqlConnection(a))
            {

                SqlCommand cmd = new SqlCommand("SP_Insert_file", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@lec_id", SqlDbType.Int).Value = lec_id + 1;
                cmd.Parameters.AddWithValue("@lectures", SqlDbType.VarChar).Value = name;
                cmd.Parameters.AddWithValue("@content", SqlDbType.VarChar).Value = documentcontent;
                cmd.Parameters.AddWithValue("@extension", SqlDbType.VarChar).Value = extension;

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}
        //    if (FileUpload1.HasFile)
        //    {
        //        FileUpload1.PostedFile.SaveAs(Server.MapPath("/files/") + FileUpload1.FileName);
        //    }
        //    DataTable d = new DataTable();
        //    d.Columns.Add("FILE", typeof(string));
        //    d.Columns.Add("SIZE", typeof(string));
        //    d.Columns.Add("EXTENSION", typeof(string));
        //    foreach (string files in Directory.GetFiles(Server.MapPath("/files/")) )
        //    {
        //        FileInfo f=new FileInfo(files);
        //        d.Rows.Add(f.Name, f.Length, f.Extension);
        //    }
        //    GridView1.DataSource = d;
        //    GridView1.DataBind();
        //}

        //protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        //{
           
        //}

        //protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    if (e.CommandName == "Download")
        //    {
             
        //        Response.Clear();
        //        Response.ContentType = "application/octect-stream";
        //        Response.AppendHeader("content-disposition", "filename=" + e.CommandArgument);
        //        Response.TransmitFile(Server.MapPath("/files/") + e.CommandArgument);
        //        Response.End(); 
        //        }          
           
        //    else
        //    {
        //        Label1.ForeColor=System.Drawing.Color.Red;
        //        Label1.Text = "FILE NOT FOUND";
        //    }
        
         
    
