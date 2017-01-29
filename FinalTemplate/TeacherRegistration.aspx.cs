using FinalTemplate.source.Database;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using FinalTemplate.source.Functions;

namespace FinalTemplate
{
    public partial class TeacherRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string date = dob.Text;
            string a = ConfigurationManager.ConnectionStrings["ces"].ConnectionString;
            Database db = new Database("ces");
            int general_id = Convert.ToInt32(db.GetLastValueByColumnName("general_id", "tbl_general"));
            int dob_id = Convert.ToInt32(db.GetLastValueByColumnName("dob_id", "tbl_dob"));
            int loc_id = Convert.ToInt32(db.GetLastValueByColumnName("loc_id", "tbl_location"));
            int teacher_id = Convert.ToInt32(db.GetLastValueByColumnName("teacher_id", "tbl_teacher"));
            var authorized_id = Convert.ToString(db.GetLastValueByColumnName("authorized_id", "tbl_authorized_users"));
            int class_sec_info_id = Convert.ToInt32(db.GetLastValueByColumnName("class_sec_info_id", "tbl_class_sec_info"));

            using (SqlConnection con = new SqlConnection(a))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_TEACHERREGISTRATION", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@general_id", SqlDbType.Int).Value = general_id + 1;
                cmd.Parameters.AddWithValue("@dob_id", SqlDbType.Int).Value = dob_id + 1;
                cmd.Parameters.AddWithValue("@dob_id_out", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.AddWithValue("@loc_id", SqlDbType.Int).Value = loc_id + 1;
                cmd.Parameters.AddWithValue("@loc_id_out", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.AddWithValue("@teacher_id", SqlDbType.Int).Value = teacher_id + 1;
                cmd.Parameters.AddWithValue("@teacher_id_out", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.AddWithValue("@authorized_id", SqlDbType.VarChar).Value = authorized_id + 1;
                cmd.Parameters.AddWithValue("@authorized_id_out", SqlDbType.VarChar).Direction = ParameterDirection.Output;
                cmd.Parameters.AddWithValue("@class_sec_info_id", SqlDbType.Int).Value = class_sec_info_id + 1;
                cmd.Parameters.AddWithValue("@class_sec_info_id_out", SqlDbType.Int).Direction = ParameterDirection.Output;



                cmd.Parameters.AddWithValue("@firstname", SqlDbType.VarChar).Value = name.Text;
                cmd.Parameters.AddWithValue("@lastname", SqlDbType.VarChar).Value = lname.Text;
                cmd.Parameters.AddWithValue("@phone", SqlDbType.VarChar).Value = contact1.Text;
                cmd.Parameters.AddWithValue("@cnic_no", SqlDbType.VarChar).Value = nic.Text;
                cmd.Parameters.AddWithValue("@gender", SqlDbType.VarChar).Value = radiobut.SelectedValue;
                cmd.Parameters.AddWithValue("@year", SqlDbType.Int).Value = Convert.ToInt32(date.Substring(0, 4));
                cmd.Parameters.AddWithValue("@month", SqlDbType.Int).Value = Convert.ToInt32(date.Substring(5, 2));
                cmd.Parameters.AddWithValue("@day", SqlDbType.Int).Value = Convert.ToInt32(date.Substring(8, 2));
                cmd.Parameters.AddWithValue("@nationality", SqlDbType.VarChar).Value = nation.Text;
                cmd.Parameters.AddWithValue("@religion", SqlDbType.VarChar).Value = religion.Text;
                cmd.Parameters.AddWithValue("@address", SqlDbType.VarChar).Value = address.Text;
                cmd.Parameters.AddWithValue("@postal_code", SqlDbType.Int).Value = Convert.ToInt32(postal.Text);
                cmd.Parameters.AddWithValue("@city_id", SqlDbType.Int).Value = Convert.ToInt32(DropDownList2.SelectedValue);
                cmd.Parameters.AddWithValue("@country_id", SqlDbType.Int).Value = Convert.ToInt32(DropDownList1.SelectedValue);
                cmd.Parameters.AddWithValue("@photo", SqlDbType.VarChar).Value = fileupload.FileName;
                cmd.Parameters.AddWithValue("@username", SqlDbType.VarChar).Value = user.Text;
                cmd.Parameters.AddWithValue("@account_pin", SqlDbType.Int).Value = Convert.ToInt32(accountp.Text);
                cmd.Parameters.AddWithValue("@password", SqlDbType.VarChar).Value = pass.Text;
                cmd.Parameters.AddWithValue("@primary_email", SqlDbType.VarChar).Value = pemail.Text;
                cmd.Parameters.AddWithValue("@secondary_email", SqlDbType.VarChar).Value = semail.Text;
                cmd.Parameters.AddWithValue("@login_count", SqlDbType.Int).Value = 0;
                cmd.Parameters.AddWithValue("@last_login_date", SqlDbType.Date).Value = DateTime.Now.ToString("");
                cmd.Parameters.AddWithValue("@usertype_id", SqlDbType.Int).Value = 2;
                cmd.Parameters.AddWithValue("@date_of_join", SqlDbType.Date).Value = DateTime.Now.ToString("");
                cmd.Parameters.AddWithValue("@school_id", SqlDbType.VarChar).Value = DropDownList3.SelectedValue;
                cmd.Parameters.AddWithValue("@class_id", SqlDbType.Int).Value = Convert.ToInt32(DropDownList4.SelectedValue);
                cmd.Parameters.AddWithValue("@section_id", SqlDbType.Int).Value = Convert.ToInt32(DropDownList5.SelectedValue);

                try
                {
                    cmd.ExecuteNonQuery();
                    if (JFunctions.UploadSingleFile(fileupload, "images/teachers/" + fileupload.FileName) == "true")
                        Response.Write("<script>alert('Image has been uploaded to server.');</script>");
                    else
                        Response.Write("<script>alert('Image not uploaded but registration is complete. You can update you image after login.');</script>");
                    
                    Response.Redirect("logintype.aspx");
                }
                catch (Exception ex)
                {
                    //Response.Write(ex.ToString());
                    Response.Redirect("logintype.aspx");
                }

                con.Close();
            }

            string result = string.Empty;
            try
            {
                Label1.Text = "REGISTRATION SUCCESSFULL";
            }

            catch (Exception ex)
            {

                Label1.Text = "REGISTRATION FAILED";
            }

        }
    }
}
