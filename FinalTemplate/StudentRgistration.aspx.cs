using FinalTemplate.source;
using FinalTemplate.source.Functions;
using FinalTemplate.source.Registration;
using System;
using System.Data.SqlClient;
using System.Data.ProviderBase;
using System.Data.Sql;
using System.Collections;


namespace FinalTemplate
{
    public partial class StudentRgistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Jfunctionstudents.BindDropDownList(DropDownList2, "city", "city_id", "select * from tbl_city");
                Jfunctionstudents.BindDropDownList(Dropd, "school_type", "school_type_id", "select * from tbl_school_type");
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            //string name = "name";
            //string lname = "lname";
            //string email = "email";
            //string contact1 = "contact1";
            //string guardian = "guardian";
            //string contact2 = "contact2";
            //string dob = "dob";
            //string nation = "nation";
            //string religion = "religion";
            //string city = "city";
            //string country = "country";
            //string address = "address";
            //string postal = "postal";
            //string prevchool = "prevchool";
            //string preclass = "preclass";
            //string sname = "sname";
            //string classtxt = "classtxt";
            //string section = "section";
            //string user = "user";
            //string accountp = "accountp";
            //string pass = "pass";
            //string repass = "repass";
            //string pemail = "pemail";
            //string semail = "semail";
            //string radiobut = "radiobut";

            //string student_connection_string = "Data Source=SHAHWAIZHASAN;Initial Catalog=ces;Integrated Security=True";
            //SqlConnection std_con = new SqlConnection(student_connection_string);
            //SqlCommand std_cmd = new SqlCommand("sp_student_registr", std_con);
            //std_cmd.CommandType = CommandType.StoredProcedure;

            //std_cmd.Parameters.AddWithValue("@Std_id", SqlDbType.VarChar).Direction = ParameterDirection.Output;
            //std_cmd.Parameters.AddWithValue("@General_Id", SqlDbType.Int).Direction = ParameterDirection.Output;
            //std_cmd.Parameters.AddWithValue("@dob_id", SqlDbType.Int).Direction = ParameterDirection.Output;
            //std_cmd.Parameters.AddWithValue("@class_sec_info_id", SqlDbType.Int).Direction = ParameterDirection.Output;
            //std_cmd.Parameters.AddWithValue("@loc_id", SqlDbType.Int).Direction = ParameterDirection.Output;
            //std_cmd.Parameters.AddWithValue("@authorized_id", SqlDbType.VarChar).Direction = ParameterDirection.Output;

            //std_cmd.Parameters.AddWithValue("@firstname", SqlDbType.VarChar).Value = name;
            //std_cmd.Parameters.AddWithValue("@lastname", SqlDbType.VarChar).Value = lname;
            //std_cmd.Parameters.AddWithValue("@email", SqlDbType.VarChar).Value = email;
            //std_cmd.Parameters.AddWithValue("@phone", SqlDbType.VarChar).Value = contact1;
            //std_cmd.Parameters.AddWithValue("@guardian", SqlDbType.VarChar).Value = guardian;
            //std_cmd.Parameters.AddWithValue("@phone", SqlDbType.VarChar).Value = contact2;
            //std_cmd.Parameters.AddWithValue("@gender", SqlDbType.Int).Value = radiobut;
            //std_cmd.Parameters.AddWithValue("@dob", SqlDbType.Int).Value = dob;
            //std_cmd.Parameters.AddWithValue("@nationality", SqlDbType.VarChar).Value = nation;
            //std_cmd.Parameters.AddWithValue("@religion", SqlDbType.VarChar).Value = religion;
            //std_cmd.Parameters.AddWithValue("@city", SqlDbType.Int).Value = DropDownList2.SelectedValue;
            //std_cmd.Parameters.AddWithValue("@country", SqlDbType.Int).Value = country;
            //std_cmd.Parameters.AddWithValue("@address", SqlDbType.VarChar).Value = address;
            //std_cmd.Parameters.AddWithValue("@postalcode", SqlDbType.Int).Value = postal;
            //std_cmd.Parameters.AddWithValue("@previous_chool", SqlDbType.VarChar).Value = prevchool;
            //std_cmd.Parameters.AddWithValue("@last_class_attended", SqlDbType.VarChar).Value = preclass;
            //std_cmd.Parameters.AddWithValue("@photo", SqlDbType.VarChar).Value = FileUpload1.FileName;
            ////if (FileUpload1.HasFile)
            ////{
            ////    //FileUpload1.PostedFile.SaveAs(Server.MapPath("~/assets/") + FileUpload1.FileName);
            ////    FileUpload1.SaveAs(Request.PhysicalApplicationPath + "/images/" + FileUpload1.FileName.ToString());
            ////}
            //std_cmd.Parameters.AddWithValue("@school_name", SqlDbType.VarChar).Value = sname;
            //std_cmd.Parameters.AddWithValue("@class", SqlDbType.Int).Value = classtxt;
            //std_cmd.Parameters.AddWithValue("@section", SqlDbType.Int).Value = section;
            //std_cmd.Parameters.AddWithValue("@username", SqlDbType.VarChar).Value = user;
            //std_cmd.Parameters.AddWithValue("@accountpin", SqlDbType.Int).Value = accountp;
            //std_cmd.Parameters.AddWithValue("@password", SqlDbType.VarChar).Value = pass;
            //std_cmd.Parameters.AddWithValue("@primary_email", SqlDbType.VarChar).Value = pemail;
            //std_cmd.Parameters.AddWithValue("@secondary_email", SqlDbType.VarChar).Value = semail;

            //SqlParameter outputpareamter = new SqlParameter();
            //outputpareamter.ParameterName = "@Std_id";
            //outputpareamter.SqlDbType = System.Data.SqlDbType.VarChar;
            //outputpareamter.Direction = System.Data.ParameterDirection.Output;
            //std_cmd.Parameters.Add(outputpareamter);

            //SqlParameter outputpareamter1 = new SqlParameter();
            //outputpareamter1.ParameterName = "@General_Id";
            //outputpareamter1.SqlDbType = System.Data.SqlDbType.Int;
            //outputpareamter1.Direction = System.Data.ParameterDirection.Output;
            //std_cmd.Parameters.Add(outputpareamter1);

            //SqlParameter outputpareamter2 = new SqlParameter();
            //outputpareamter2.ParameterName = "@dob_id";
            //outputpareamter2.SqlDbType = System.Data.SqlDbType.Int;
            //outputpareamter2.Direction = System.Data.ParameterDirection.Output;
            //std_cmd.Parameters.Add(outputpareamter2);

            //SqlParameter outputpareamter3 = new SqlParameter();
            //outputpareamter3.ParameterName = "@class_sec_info_id";
            //outputpareamter3.SqlDbType = System.Data.SqlDbType.Int;
            //outputpareamter3.Direction = System.Data.ParameterDirection.Output;
            //std_cmd.Parameters.Add(outputpareamter3);

            //SqlParameter outputpareamter4 = new SqlParameter();
            //outputpareamter4.ParameterName = "@loc_id";
            //outputpareamter4.SqlDbType = System.Data.SqlDbType.Int;
            //outputpareamter4.Direction = System.Data.ParameterDirection.Output;
            //std_cmd.Parameters.Add(outputpareamter4);

            //SqlParameter outputpareamter5 = new SqlParameter();
            //outputpareamter5.ParameterName = "@authorized_id";
            //outputpareamter5.SqlDbType = System.Data.SqlDbType.VarChar;
            //outputpareamter5.Direction = System.Data.ParameterDirection.Output;
            //std_cmd.Parameters.Add(outputpareamter5);

            ////int Std_id ;
            ////int General_Id ;
            ////int dob_id ;
            ////int class_sec_info_id ;
            ////int loc_id ;
            ////int authorized_id ;

            //std_con.Open();

            //std_cmd.Parameters["@Std_id"].Value.ToString();
            //Convert.ToInt32(std_cmd.Parameters["@General_Id"].Value);
            //Convert.ToInt32(std_cmd.Parameters["@location_id"].Value);
            //Convert.ToInt32(std_cmd.Parameters["@class_sec_info_id"].Value);
            //Convert.ToInt32(std_cmd.Parameters["@loc_id"].Value);
            //std_cmd.Parameters["@authorized_id"].Value.ToString();

            //std_cmd.ExecuteNonQuery();
            //std_con.Close();

           
            ClassStudentRegistration classStudent = new ClassStudentRegistration();
            string result = string.Empty;

            try
            {

                result = classStudent.studentregister(Convert.ToString(name), Convert.ToString(lname),
                    Convert.ToString(emaill), Convert.ToString(contact1),Convert.ToString(guardian),
                    Convert.ToString( contact2), radiobut.SelectedValue,Convert.ToString(dob), 
                    Convert.ToString(nation), Convert.ToString(religion), Convert.ToInt32(DropDownList2.SelectedValue),
                    Convert.ToInt32(country), Convert.ToString(address), Convert.ToInt32(postal), Convert.ToString(prevchool),
                    Convert.ToString(preclass), FileUpload1.FileName, Convert.ToString(sname), Convert.ToString(Dropd.SelectedValue),
                    Convert.ToInt32(classtxt), Convert.ToInt32(section),
                    Convert.ToString(user),Convert.ToInt32( accountp),Convert.ToString( pass),
                    Convert.ToString( repass),Convert.ToString( pemail),Convert.ToString( semail));

                if (result == "true")
                {
                    Response.Write("register");
                }
                else
                {
                    Response.Write("not register");
                }
            }
            catch (Exception exception)
            {
                result = exception.ToString();
                Response.Write(result);
            }

        }
    }
}