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
    public partial class Download_Homework : System.Web.UI.Page
    {
        string a = ConfigurationManager.ConnectionStrings["ces"].ConnectionString;
        Database db = new Database("ces");
        string fullpath = "files/Lectures/";

        protected void Page_Load(object sender, EventArgs e)
        {           
           if (Session["userid"] != null)
            {
                student.Complete_Detail_Of_Student(Session["userid"].ToString());
                Label1.Text = student.s_class;
                Label2.Text = student.s_section;
                Label3.Text = student.s_schoolid;
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }

           if (!IsPostBack)
           {
               filldata2();
           }
        }
        public void filldata2()
        {
            DataTable dt = new DataTable();
            int lec_id = Convert.ToInt32(db.GetLastValueByColumnName("lec_id", "lecture_attandance_test"));
            using (SqlConnection con = new SqlConnection(a))
            {
                SqlCommand cmd = new SqlCommand("sp_lecture_test", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@lec_id", SqlDbType.Int).Value = lec_id;
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                dt.Load(reader);
            }
            if (dt.Rows.Count > 0)
            {
                GridView4.DataSource = dt;
                GridView4.DataBind();
            }
        }

        protected void OpenDocument(object sender, EventArgs e)
        {
            LinkButton li = (LinkButton)sender;
            GridViewRow gr = (GridViewRow)li.NamingContainer;

            int lec_id = int.Parse(GridView4.DataKeys[gr.RowIndex].Value.ToString());

            FileInfo fi = new FileInfo(download(lec_id));
            string filePath = (sender as LinkButton).CommandArgument;
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            Response.WriteFile(filePath);
            Response.End();

            //Button li1 = (Button)sender;
            //GridViewRow gr1 = (GridViewRow)li1.NamingContainer;

            //int lec_id = int.Parse(GridView4.DataKeys[gr1.RowIndex].Value.ToString());
            //download(lec_id);
        }

        private string download(int lec_id)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(a))
            {
                SqlCommand cmd = new SqlCommand("sp_lecture_test", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@lec_id", SqlDbType.Int).Value = lec_id;
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                dt.Load(reader);
            }
            return dt.Rows[0]["fullpath"].ToString();

            //DataTable dt1 = new DataTable();
            //using (SqlConnection co = new SqlConnection(@"Data Source=SHAHWAIZ\SQLEXPRESS;Initial Catalog=ces;Integrated Security=True"))
            //{
            //    SqlCommand cmd1 = new SqlCommand("SP_Get_file", co);
            //    cmd1.CommandType = System.Data.CommandType.StoredProcedure;
            //    cmd1.Parameters.AddWithValue("@lec_id", SqlDbType.Int).Value = lec_id;
            //    co.Open();
            //    SqlDataReader reader1 = cmd1.ExecuteReader();
            //    dt1.Load(reader1);
            //}
            //string name = dt1.Rows[0]["lectures"].ToString();
            //byte[] documentBytes = (byte[])dt1.Rows[0]["content"];

            //Response.Clear();
            //Response.ContentType = "application/octect-stream";
            //Response.AppendHeader("content-disposition", string.Format("attachment; filename={0}", name));
            //Response.AppendHeader("content-Length", documentBytes.Length.ToString());
            //Response.BinaryWrite(documentBytes);
            //Response.Flush();
            //Response.Close();
        }
    }        
}