using FinalTemplate.source.Database;
using FinalTemplate.source.Functions;
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Collections.Concurrent;

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
                    //int std_attend_id = Convert.ToInt32(db.GetLastValueByColumnName("std_attend_id", "tbl_student_attendance"));
                  //  int class_sec_info_id = Convert.ToInt32(db.GetLastValueByColumnName("class_sec_info_id", "tbl_class_sec_info"));
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

                            cmd.Parameters.AddWithValue("@std_attend_id", SqlDbType.Int).Value = teacher.attend_id;
                            cmd.Parameters.AddWithValue("@std_attend_id_out", SqlDbType.Int).Direction = ParameterDirection.Output;
                            cmd.Parameters.AddWithValue("@date", SqlDbType.VarChar).Value = DateTime.Now.ToString("");
                            cmd.Parameters.AddWithValue("@time", SqlDbType.VarChar).Value = DateTime.Now.ToString("");
                            cmd.Parameters.AddWithValue("@class_sec_info_id", SqlDbType.Int).Value = teacher.class_id;
                            cmd.Parameters.AddWithValue("@school_id", SqlDbType.VarChar).Value = teacher.schoolid;
                            cmd.Parameters.AddWithValue("@remark_id", SqlDbType.Int).Value = value;
                            cmd.Parameters.AddWithValue("@teacher_id", SqlDbType.Int).Value = teacher.teacher_id;


                            cmd.ExecuteNonQuery();
                            con.Close();

                            Response.Write("<script>alert('Attendance Marked Sucessfully');</script>");
                            con.Open();
                            SqlCommand cmd1 = new SqlCommand("SP_studentprofile_schoolid", con);
                            cmd1.CommandType = System.Data.CommandType.StoredProcedure;
                            cmd1.Parameters.AddWithValue("@school_id", SqlDbType.VarChar).Value = teacher.schoolid;
                            SqlDataReader std_id = cmd1.ExecuteReader();
                            List<IDictionary<string, string>> listid = new List<IDictionary<string, string>>();
                            while (std_id.Read())
                            {
                                IDictionary<string, string> id = new ConcurrentDictionary<string, string>();
                                id["id"] = std_id["std_id"].ToString();
                                listid.Add(id);
                            }
                            SqlDataAdapter adapter = new SqlDataAdapter(cmd1);
                            DataTable table = new DataTable();
                            adapter.Fill(table);
                            GridView1.DataSource = table;
                            GridView1.DataBind();
                            con.Close();
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

