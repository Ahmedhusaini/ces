using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using FinalTemplate.source.Database;

namespace FinalTemplate
{
    public partial class edit_student_timetable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string a = ConfigurationManager.ConnectionStrings["ces"].ConnectionString;
            Database db = new Database("ces");

            using (SqlConnection con = new SqlConnection(a))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_edit_student_timetable", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@timetable_1_id", SqlDbType.Int).Value = Convert.ToInt32(timetableidtxt.Text);
                cmd.Parameters.AddWithValue("@period_1", SqlDbType.VarChar).Value = p1txt.Text;
                cmd.Parameters.AddWithValue("@period_2", SqlDbType.VarChar).Value = p2txt.Text;
                cmd.Parameters.AddWithValue("@period_3", SqlDbType.VarChar).Value = p3txt.Text;
                cmd.Parameters.AddWithValue("@period_4", SqlDbType.VarChar).Value = p4txt.Text;
                cmd.Parameters.AddWithValue("@period_5", SqlDbType.VarChar).Value = p5txt.Text;
                cmd.Parameters.AddWithValue("@period_6", SqlDbType.VarChar).Value = p6txt.Text;
                cmd.Parameters.AddWithValue("@period_7", SqlDbType.VarChar).Value = p7txt.Text;
                cmd.Parameters.AddWithValue("@period_8", SqlDbType.VarChar).Value = p8txt.Text;
                cmd.Parameters.AddWithValue("@day_id", SqlDbType.Int).Value = ddlday.SelectedValue;
                cmd.Parameters.AddWithValue("@class", SqlDbType.Int).Value = ddlclass.SelectedValue;
                cmd.Parameters.AddWithValue("@section", SqlDbType.Int).Value = ddlsection.SelectedValue;
                cmd.Parameters.AddWithValue("@teacher_id", SqlDbType.Int).Value =Convert.ToInt32(teachertxt.Text);
                cmd.Parameters.AddWithValue("@school_id", SqlDbType.Int).Value = ddlschool.SelectedValue; ;
                cmd.ExecuteNonQuery();
                con.Close();

            }
        }
    }
}