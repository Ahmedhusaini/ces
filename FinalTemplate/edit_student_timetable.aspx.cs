using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using FinalTemplate.source.Functions;
using FinalTemplate.source.Database;

namespace FinalTemplate
{
    public partial class edit_student_timetable : System.Web.UI.Page
    {
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

            string a = ConfigurationManager.ConnectionStrings["ces"].ConnectionString;
            Database db = new Database("ces");
            int class_sec_info_id = Convert.ToInt32(db.GetLastValueByColumnName("class_sec_info_id", "tbl_class_sec_info"));
            try
            {
            using (SqlConnection con = new SqlConnection(a))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_Update_student_timetable", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@timetable_1_id", SqlDbType.Int).Value =Convert.ToInt32(ddltimetable.SelectedValue);
                cmd.Parameters.AddWithValue("@period_1", SqlDbType.VarChar).Value = p1txt.Text;
                cmd.Parameters.AddWithValue("@period_2", SqlDbType.VarChar).Value = p2txt.Text;
                cmd.Parameters.AddWithValue("@period_3", SqlDbType.VarChar).Value = p3txt.Text;
                cmd.Parameters.AddWithValue("@period_4", SqlDbType.VarChar).Value = p4txt.Text;
                cmd.Parameters.AddWithValue("@period_5", SqlDbType.VarChar).Value = p5txt.Text;
                cmd.Parameters.AddWithValue("@period_6", SqlDbType.VarChar).Value = p6txt.Text;
                cmd.Parameters.AddWithValue("@period_7", SqlDbType.VarChar).Value = p7txt.Text;
                cmd.Parameters.AddWithValue("@period_8", SqlDbType.VarChar).Value = p8txt.Text;
                cmd.Parameters.AddWithValue("@day_id", SqlDbType.Int).Value =Convert.ToInt32(ddlday.SelectedValue);
                cmd.Parameters.AddWithValue("@class_sec_info_id", SqlDbType.Int).Value = class_sec_info_id + 1;
                cmd.Parameters.AddWithValue("@class_sec_info_id_out", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.AddWithValue("@class_id", SqlDbType.Int).Value = Convert.ToInt32(ddlclass.SelectedValue);
                cmd.Parameters.AddWithValue("@section_id", SqlDbType.Int).Value = Convert.ToInt32(ddlsection.SelectedValue);
                cmd.Parameters.AddWithValue("@teacher_id", SqlDbType.Int).Value =teacher.teacher_id;
                cmd.Parameters.AddWithValue("@school_id", SqlDbType.VarChar).Value = teacher.schoolid;
                cmd.ExecuteNonQuery();
                con.Close();
            }
                
                    Response.Write("<script>alert('Successfully updated class timetable');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Please Update');</script>");
            }
           
        }
    }
}