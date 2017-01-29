using FinalTemplate.source.Database;
using FinalTemplate.source.Functions;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace FinalTemplate
{
    public partial class mark_attendance : System.Web.UI.Page
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
            GridView1.DataSource = teacher.AllStudentsBySchoolID(teacher.schoolid);
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow g in GridView1.Rows)
            {
                if (g.RowType == DataControlRowType.DataRow)
                {
                    string a = ConfigurationManager.ConnectionStrings["ces"].ConnectionString;
                    Database db = new Database("ces");
                    int std_attend_id = Convert.ToInt32(db.GetLastValueByColumnName("std_attend_id", "tbl_student_attendance"));
                    int class_sec_info_id = Convert.ToInt32(db.GetLastValueByColumnName("class_sec_info_id", "tbl_class_sec_info"));
                    //var std_id = Convert.ToString(db.GetLastValueByColumnName("std_id", "tbl_Student_Reg"));


                    using (SqlConnection con = new SqlConnection(a))
                    {
                        try
                        {
                            con.Open();
                            SqlCommand cmd = new SqlCommand("sp_Mark_std_attendance", con);
                            cmd.CommandType = System.Data.CommandType.StoredProcedure;
                            string value = ((DropDownList)g.FindControl("remark")).SelectedValue;

                            cmd.Parameters.AddWithValue("@std_id", SqlDbType.VarChar).Value = teacher.student_id;
                            cmd.Parameters.AddWithValue("@std_id_out", SqlDbType.VarChar).Direction = ParameterDirection.Output;

                            cmd.Parameters.AddWithValue("@std_attend_id", SqlDbType.Int).Value = std_attend_id + 1;
                            cmd.Parameters.AddWithValue("@std_attend_id_out", SqlDbType.Int).Direction = ParameterDirection.Output;
                            cmd.Parameters.AddWithValue("@date", SqlDbType.VarChar).Value = DateTime.Now.ToString("");
                            cmd.Parameters.AddWithValue("@time", SqlDbType.VarChar).Value = DateTime.Now.ToString("");
                            cmd.Parameters.AddWithValue("@class_id", SqlDbType.Int).Value = ddlclass.SelectedValue;
                            cmd.Parameters.AddWithValue("@section_id", SqlDbType.Int).Value = ddlsection.SelectedValue;
                            cmd.Parameters.AddWithValue("@class_sec_info_id", SqlDbType.Int).Value = class_sec_info_id + 1;
                            cmd.Parameters.AddWithValue("@class_sec_info_id_out", SqlDbType.Int).Direction = ParameterDirection.Output;
                            cmd.Parameters.AddWithValue("@school_id", SqlDbType.VarChar).Value = teacher.schoolid;
                            cmd.Parameters.AddWithValue("@remark_id", SqlDbType.Int).Value = value;
                            cmd.Parameters.AddWithValue("@teacher_id", SqlDbType.Int).Value = teacher.teacher_id;


                            cmd.ExecuteNonQuery();
                            con.Close();

                            Response.Write("<script>alert('Attendance Marked Sucessfully');</script>");
                        }

                        catch (Exception ex)
                        {
                            Response.Write("<script>alert('Please Mark you Attendance first');</script>");
                        }

                    }
                }
            }
        }
    }
}

