using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using FinalTemplate.source.Database;
using FinalTemplate.source.Functions;

namespace FinalTemplate
{
    public partial class StudentProfile : System.Web.UI.Page
    {
        private Database myDatabase = new Database("ces");
        protected void Page_Load(object sender, EventArgs e)
        {
            string a = ConfigurationManager.ConnectionStrings["ces"].ConnectionString;
            Database db = new Database("ces");

            using (SqlConnection con = new SqlConnection(a))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_studentprofile_schoolid", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@school_id", SqlDbType.VarChar).Value = teacher.schoolid;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();
                adapter.Fill(table);
                GridView1.DataSource = table;
                GridView1.DataBind();
                con.Close();
                //if (Session["userid"] != null)
                //{
                //    string[] col = { "General_Id" };
                //    string[] colwhere = { "authorized_id" };
                //    string[] whereoperator = { "=" };
                //    string[] multiwhere = { "" };

                //    CurrentUser.GetAuthorizedDetails(Session["userid"].ToString());
                //    string[] whereoperatorvale = { "'" + CurrentUser.AuthorizedID + "'" };
                //    string[,] teacherid = myDatabase.SelectQuery("tbl_teacher", col, colwhere, whereoperator, whereoperatorvale, multiwhere);
                //    CurrentUser.GetPersonalDetails(Convert.ToInt32(teacherid[0, 0]));

                //}
                //else
                //{
                //    Response.Redirect("Default.aspx");
                //}
            }
        }
    }
}