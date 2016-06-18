using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FinalTemplate.source.Functions;
using FinalTemplate.source;

namespace FinalTemplate
{
    public partial class StudentRgistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                JFunctions.BindDropDownList(DropDownList2, "city", "city_id", "select * from tbl_city");
                JFunctions.BindDropDownList(Dropd, "school_type", "school_type_id", "select * from tbl_school_type");
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            //    string name = "name";
            //    string lname = "lname";
            //    string email = "email";
            //    string contact1 = "contact1";
            //    string guardian = "guardian";
            //    string contact2 = "contact2";
            //    string dob = "dob";
            //    string nation = "nation";
            //    string religion = "religion";
            //    string city = "city";
            //    string country = "country";
            //    string address = "address";
            //    string postal = "postal";
            //    string prevchool = "prevchool";
            //    string preclass = "preclass";
            //    string sname = "sname";
            //    string classtxt = "classtxt";
            //    string section = "section";
            //    string user = "user";
            //    string accountp = "accountp";
            //    string pass = "pass";
            //    string repass = "repass";
            //    string pemail = "pemail";
            //    string semail = "semail";
            //    string radiobut = "radiobut";

            //    string student_connection_string = "Data Source=SHAHWAIZHASAN;Initial Catalog=ces;Integrated Security=True";
            //    SqlConnection std_con = new SqlConnection(student_connection_string);
            //    SqlCommand std_cmd = new SqlCommand("sp_student_registr", std_con);
            //    std_cmd.CommandType = CommandType.StoredProcedure;

            //    std_cmd.Parameters.AddWithValue("@Std_id", SqlDbType.VarChar).Direction = ParameterDirection.Output;
            //    std_cmd.Parameters.AddWithValue("@General_Id", SqlDbType.Int).Direction = ParameterDirection.Output;
            //    std_cmd.Parameters.AddWithValue("@dob_id", SqlDbType.Int).Direction = ParameterDirection.Output;
            //    std_cmd.Parameters.AddWithValue("@class_sec_info_id", SqlDbType.Int).Direction = ParameterDirection.Output;
            //    std_cmd.Parameters.AddWithValue("@loc_id", SqlDbType.Int).Direction = ParameterDirection.Output;
            //    std_cmd.Parameters.AddWithValue("@authorized_id", SqlDbType.VarChar).Direction = ParameterDirection.Output;

            //    std_cmd.Parameters.AddWithValue("@firstname", SqlDbType.VarChar).Value = name;
            //    std_cmd.Parameters.AddWithValue("@lastname", SqlDbType.VarChar).Value = lname;
            //    std_cmd.Parameters.AddWithValue("@email", SqlDbType.VarChar).Value = email;
            //    std_cmd.Parameters.AddWithValue("@phone", SqlDbType.VarChar).Value = contact1;
            //    std_cmd.Parameters.AddWithValue("@guardian", SqlDbType.VarChar).Value = guardian;
            //    std_cmd.Parameters.AddWithValue("@phone", SqlDbType.VarChar).Value = contact2;
            //    std_cmd.Parameters.AddWithValue("@gender", SqlDbType.Int).Value = radiobut;
            //    std_cmd.Parameters.AddWithValue("@dob", SqlDbType.Int).Value = dob;
            //    std_cmd.Parameters.AddWithValue("@nationality", SqlDbType.VarChar).Value = nation;
            //    std_cmd.Parameters.AddWithValue("@religion", SqlDbType.VarChar).Value = religion;
            //    std_cmd.Parameters.AddWithValue("@city", SqlDbType.Int).Value = DropDownList2.SelectedValue;
            //    std_cmd.Parameters.AddWithValue("@country", SqlDbType.Int).Value = country;
            //    std_cmd.Parameters.AddWithValue("@address", SqlDbType.VarChar).Value = address;
            //    std_cmd.Parameters.AddWithValue("@postalcode", SqlDbType.Int).Value = postal;
            //    std_cmd.Parameters.AddWithValue("@previous_chool", SqlDbType.VarChar).Value = prevchool;
            //    std_cmd.Parameters.AddWithValue("@last_class_attended", SqlDbType.VarChar).Value = preclass;
            //    std_cmd.Parameters.AddWithValue("@photo", SqlDbType.VarChar).Value = fileupload;
            //    if (FileUpload1.HasFile)
            //    {
            //        //FileUpload1.PostedFile.SaveAs(Server.MapPath("~/assets/") + FileUpload1.FileName);
            //        FileUpload1.SaveAs(Request.PhysicalApplicationPath + "/images/" + FileUpload1.FileName.ToString());
            //    }
            //    std_cmd.Parameters.AddWithValue("@school_name", SqlDbType.VarChar).Value = sname;
            //    std_cmd.Parameters.AddWithValue("@class", SqlDbType.Int).Value = classtxt;
            //    std_cmd.Parameters.AddWithValue("@section", SqlDbType.Int).Value = section;
            //    std_cmd.Parameters.AddWithValue("@username", SqlDbType.VarChar).Value = user;
            //    std_cmd.Parameters.AddWithValue("@accountpin", SqlDbType.Int).Value = accountp;
            //    std_cmd.Parameters.AddWithValue("@password", SqlDbType.VarChar).Value = pass;
            //    std_cmd.Parameters.AddWithValue("@primary_email", SqlDbType.VarChar).Value = pemail;
            //    std_cmd.Parameters.AddWithValue("@secondary_email", SqlDbType.VarChar).Value = semail;

            //    SqlParameter outputpareamter = new SqlParameter();
            //    outputpareamter.ParameterName = "@Std_id";
            //    outputpareamter.ParameterName = "@General_Id";
            //    outputpareamter.ParameterName = "@dob_id";
            //    outputpareamter.ParameterName = "@class_sec_info_id";
            //    outputpareamter.ParameterName = "@loc_id";
            //    outputpareamter.ParameterName = "@authorized_id";
            //    outputpareamter.SqlDbType = System.Data.SqlDbType.Int;
            //    outputpareamter.Direction = System.Data.ParameterDirection.Output;
            //    std_cmd.Parameters.Add(outputpareamter);

            //    //int Std_id ;
            //    //int General_Id ;
            //    //int dob_id ;
            //    //int class_sec_info_id ;
            //    //int loc_id ;
            //    //int authorized_id ;

            //    std_con.Open();
            //    std_cmd.ExecuteNonQuery();

            //    std_cmd.Parameters["@Std_id"].Value.ToString();
            //    Convert.ToInt32(std_cmd.Parameters["@General_Id"].Value);
            //    Convert.ToInt32(std_cmd.Parameters["@location_id"].Value);
            //    Convert.ToInt32(std_cmd.Parameters["@class_sec_info_id"].Value);
            //    Convert.ToInt32(std_cmd.Parameters["@loc_id"].Value);
            //    std_cmd.Parameters["@authorized_id"].Value.ToString();

            //    std_con.Close();
            //}

            ClassStudentRegistration classStudent = new ClassStudentRegistration ();
            string result = string.Empty;

            try
            {
                result = classStudent.studentregister(1, Convert.ToInt32(Dropd.SelectedValue),
                Convert.ToInt32(postal.Text),user.Text,pass.Text, Convert.ToInt32(accountp.Text),
                pemail.Text,semail.Text,sname.Text,FileUpload1.FileName,
                Convert.ToInt32(Dropd.SelectedValue),preclass.Text,prevchool.Text,address.Text,country.Text,religion.Text,nation.Text,dob.Text
                ,Convert.ToInt32(contact2.Text),guardian.Text,Convert.ToInt32(contact1),emaill.Text,lname.Text,name.Text,classtxt.Text,
                section.Text,radiobut.SelectedValue);
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