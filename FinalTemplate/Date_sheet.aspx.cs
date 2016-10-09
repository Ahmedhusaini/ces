using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace FinalTemplate
{
    public partial class Date_sheet : System.Web.UI.Page
    {
        string prac = @"Data Source=SHAHWAIZ\SQLEXPRESS;Initial Catalog=practice;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                filldata();
            }
        }

        private void filldata()
        {
            DataTable dt =new DataTable ();
            using (SqlConnection con = new SqlConnection(prac))
            {
                SqlCommand comm = new SqlCommand("assignments", con);
                comm.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rd = comm.ExecuteReader();
                dt.Load(rd);
            }
            if(dt.Rows.Count >0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
        private void download(int assignment_id)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(prac))
            {
                SqlCommand comm = new SqlCommand("getassignmentid", con);
                comm.CommandType = CommandType.StoredProcedure;
                con.Open();
                comm.Parameters.Add("@assignment_id", SqlDbType.Int).Value = assignment_id;
                SqlDataReader rd = comm.ExecuteReader();
                dt.Load(rd);
            }

            //string name = dt.Rows[0]["teacher_name"].ToString();
            //byte[] documentsbyte = (byte[])dt.Rows[0]["assignment"];

            //Response.ClearContent();
            //Response.ContentType="application/actetstream";
            //Response.AddHeader=("Content-Disposition",string.Format("attachment;filename={0}",name));
            //Response.AddHeader=("Content-Length",documentsbyte.Length);
        }
        protected void opendoc(object sender,EventArgs e)
        {
            LinkButton link = (LinkButton)sender;
            GridViewRow gr = (GridViewRow)link.NamingContainer;
            int assignment_id = int.Parse(GridView1.DataKeys[gr.RowIndex].Value.ToString());
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            FileInfo fi = new FileInfo(FileUpload1.FileName);
            byte[] documentcontext = FileUpload1.FileBytes;

            string name = fi.Name;
            string assi = fi.Extension;
            using (SqlConnection con = new SqlConnection(prac))
            {
                SqlCommand comm = new SqlCommand("getassignment", con);
                comm.CommandType = CommandType.StoredProcedure;

                comm.Parameters.Add("@teacher_name", SqlDbType.VarChar).Value = name;
                comm.Parameters.Add("@school_name", SqlDbType.VarChar).Value = assi;
                comm.Parameters.Add("@assignment", SqlDbType.VarBinary).Value = documentcontext;
                con.Open();
                comm.ExecuteNonQuery();
            }
        }
    }
}