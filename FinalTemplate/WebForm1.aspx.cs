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
    public partial class WebForm1 : System.Web.UI.Page
    {
        string a = ConfigurationManager.ConnectionStrings["ces"].ConnectionString;
        Database db = new Database("ces");

        protected void Page_Load(object sender, EventArgs e)
        {
            //Label1.Text= CurrentUser.AuthorizedID;
            //Label2.Text = student.studentid;

            Label1.Text = student.s_class;
            Label2.Text = student.s_section;
            Label3.Text = student.s_schoolid;
            
            if (!IsPostBack)
            {
                filldata();
            }
        }

        private void filldata()
        {
            DataTable dt = new DataTable();
            int marksheet_id = Convert.ToInt32(db.GetLastValueByColumnName("marksheet_id", "Tbl_Marksheet"));
            using (SqlConnection con = new SqlConnection(a))
            {
                SqlCommand cmd = new SqlCommand("SP_marksheet_download", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@marksheet_id", SqlDbType.Int).Value = marksheet_id;
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

            int marksheet_id = int.Parse(GridView1.DataKeys[gr.RowIndex].Value.ToString());
            FileInfo fi = new FileInfo(download(marksheet_id));
            string filePath = (sender as LinkButton).CommandArgument;
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            Response.WriteFile(filePath);
            Response.End();
        }

        private string download(int marksheet_id)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(a))
            {
                SqlCommand cmd = new SqlCommand("SP_marksheet_download", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@marksheet_id", SqlDbType.Int).Value = marksheet_id;
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                dt.Load(reader);
            }
            return dt.Rows[0]["Marksheet"].ToString();
        }
    }
}