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
	public partial class mark_attendance : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void Button1_Click(object sender, EventArgs e)
        {
             string a = ConfigurationManager.ConnectionStrings["abc"].ConnectionString;
            Database db = new Database("abc");
            int std_attend_id = Convert.ToInt32(db.GetLastValueByColumnName("std_attend_id", "tbl_student_attendance"));
            var std_id = Convert.ToString(db.GetLastValueByColumnName("std_id", "tbl_Student_Reg"));
            var guardian_name = Convert.ToString(db.GetLastValueByColumnName("guardian_name", "tbl_Student_Reg"));
            var previous_school = Convert.ToString(db.GetLastValueByColumnName("previous_school", "tbl_Student_Reg"));
            int general_id = Convert.ToInt32(db.GetLastValueByColumnName("general_id", "tbl_Student_Reg"));
            int class_sec_info_id = Convert.ToInt32(db.GetLastValueByColumnName("class_sec_info_id", "tbl_Student_Reg"));
            var last_class_attended = Convert.ToString(db.GetLastValueByColumnName("last_class_attended", "tbl_Student_Reg"));
            var authorized_id = Convert.ToString(db.GetLastValueByColumnName("uthorized_id", "tbl_Student_Reg"));
            var school_id = Convert.ToString(db.GetLastValueByColumnName("school_id", "tbl_Student_Reg"));
            var guardian_contact = Convert.ToString(db.GetLastValueByColumnName("guardian_contact ", "tbl_Student_Reg"));

            using (SqlConnection con = new SqlConnection(a))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("std_attendance", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@std_id", SqlDbType.VarChar).Value = std_id;
                cmd.Parameters.AddWithValue("@std_id_out", SqlDbType.VarChar).Direction = ParameterDirection.Output;
                cmd.Parameters.AddWithValue("@guardian_name", SqlDbType.VarChar).Value = guardian_name;
                cmd.Parameters.AddWithValue("@previous_school", SqlDbType.VarChar).Value = previous_school;
                cmd.Parameters.AddWithValue("@general_id", SqlDbType.Int).Value = general_id;
                cmd.Parameters.AddWithValue("@class_sec_info_id", SqlDbType.Int).Value = class_sec_info_id;
                cmd.Parameters.AddWithValue("@last_class_attended", SqlDbType.VarChar).Value = last_class_attended;
                cmd.Parameters.AddWithValue("@authorized_id", SqlDbType.VarChar).Value = authorized_id;
                cmd.Parameters.AddWithValue("@school_id", SqlDbType.VarChar).Value = school_id;
                cmd.Parameters.AddWithValue("@guardian_contact", SqlDbType.VarChar).Value = guardian_contact;


                cmd.Parameters.AddWithValue("@std_attend_id", SqlDbType.Int).Value = std_attend_id + 1;
                cmd.Parameters.AddWithValue("@std_attend_id_out", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.AddWithValue("@date", SqlDbType.VarChar).Value = DateTime.Now.ToString("");
                cmd.Parameters.AddWithValue("@time", SqlDbType.VarChar).Value = DateTime.Now.ToString("");



                // cmd.Parameters.AddWithValue("@remarks", SqlDbType.VarChar).Value = DropDownList4.SelectedValue;

                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
	}
}