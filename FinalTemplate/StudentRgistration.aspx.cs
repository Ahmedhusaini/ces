using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalTemplate
{
    public partial class StudentRgistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = "name";
            string lname = "lname";
            string email = "email";
            string contact1 = "contact1";
            string guardian = "guardian";
            string contact2 = "contact2";
            string dob = "dob";
            string nation = "nation";
            string religion = "religion";
            string city = "city";
            string country = "country";
            string address = "address";
            string postal = "postal";
            string prevchool = "prevchool";
            string preclass = "preclass";
            string sname = "sname";
            string classtxt = "classtxt";
            string section = "section";
            string user = "user";
            string accountp = "accountp";
            string pass = "pass";
            string repass = "repass";
            string pemail = "pemail";
            string semail = "semail";
            string radiobut = "radiobut";
            string fileupload = "fileupload";

            string student_connection_string = "Data Source=SHAHWAIZHASAN;Initial Catalog=ces;Integrated Security=True";
            SqlConnection std_con = new SqlConnection(student_connection_string);
            SqlCommand std_cmd = new SqlCommand("sp_student_registr", std_con);
            std_cmd.CommandType = CommandType.StoredProcedure;

            std_cmd.Parameters.Add("@Std_id", SqlDbType.VarChar).Direction = ParameterDirection.Output;
            std_cmd.Parameters.Add("@General_Id", SqlDbType.Int).Direction = ParameterDirection.Output;
            std_cmd.Parameters.Add("@dob_id", SqlDbType.Int).Direction = ParameterDirection.Output;
            std_cmd.Parameters.Add("@class_sec_info_id", SqlDbType.Int).Direction = ParameterDirection.Output;
            std_cmd.Parameters.Add("@loc_id", SqlDbType.Int).Direction = ParameterDirection.Output;
            std_cmd.Parameters.Add("@authorized_id", SqlDbType.VarChar).Direction = ParameterDirection.Output;

            std_cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = name;
            std_cmd.Parameters.AddWithValue ("@lname", SqlDbType.VarChar);
            std_cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
            std_cmd.Parameters.Add("@contact1", SqlDbType.VarChar).Value = contact1;
            std_cmd.Parameters.Add("@guardian", SqlDbType.VarChar).Value = guardian;
            std_cmd.Parameters.Add("@contact2", SqlDbType.VarChar).Value = contact2;
            std_cmd.Parameters.Add("@dob", SqlDbType.Int).Value = dob;
            std_cmd.Parameters.Add("@radiobut", SqlDbType.Int).Value = radiobut;
            std_cmd.Parameters.Add("@nation", SqlDbType.VarChar).Value = nation;
            std_cmd.Parameters.Add("@religion", SqlDbType.VarChar).Value = religion;
            std_cmd.Parameters.Add("@city",DropDownList2.SelectedValue);
            std_cmd.Parameters.Add("@country", SqlDbType.VarChar).Value = country;
            std_cmd.Parameters.Add("@address", SqlDbType.VarChar).Value = address;
            std_cmd.Parameters.Add("@postal", SqlDbType.Int).Value = postal;
            std_cmd.Parameters.Add("@prevchool", SqlDbType.VarChar).Value = prevchool;
            std_cmd.Parameters.Add("@preclass", SqlDbType.VarChar).Value = preclass;
            std_cmd.Parameters.Add("@fileupload", SqlDbType.VarChar).Value = fileupload;


            std_cmd.Parameters.Add("@sname", SqlDbType.VarChar).Value = sname;
            std_cmd.Parameters.Add("@Dropd",Dropd.SelectedValue);
            std_cmd.Parameters.Add("@classtxt", SqlDbType.Int).Value = classtxt;
            std_cmd.Parameters.Add("@sec", SqlDbType.Int).Value = section;
            std_cmd.Parameters.Add("@user", SqlDbType.VarChar).Value = user;
            std_cmd.Parameters.Add("@accountp", SqlDbType.Int).Value = accountp;
            std_cmd.Parameters.Add("@pass", SqlDbType.VarChar).Value = pass;
            std_cmd.Parameters.Add("@repass", SqlDbType.VarChar).Value = repass;
            std_cmd.Parameters.Add("@pemail", SqlDbType.VarChar).Value = pemail;
            std_cmd.Parameters.Add("@semail", SqlDbType.VarChar).Value = semail;

            string Std_id = "5";
            int General_Id = 5;
            int dob_id = 5;
            int class_sec_info_id = 5;
            int loc_id = 5;
            string authorized_id = "5";

        SqlParameter outputpareamter = new SqlParameter();
        outputpareamter.ParameterName = "@Std_id";
        outputpareamter.ParameterName = "@General_Id";
        outputpareamter.ParameterName = "@dob_id";
        outputpareamter.ParameterName = "@class_sec_info_id";
        outputpareamter.ParameterName = "@loc_id";
        outputpareamter.ParameterName = "@authorized_id";
        outputpareamter.SqlDbType = System.Data.SqlDbType.Int;
        outputpareamter.Direction = System.Data.ParameterDirection.Output;
        std_cmd.Parameters.Add(outputpareamter);
        std_con.Open();
        std_cmd.ExecuteNonQuery();

        string sd = outputpareamter.Value.ToString();
        std_con.Close();

        FileUpload1.SaveAs(Request.PhysicalApplicationPath + "/assets/" + FileUpload1.FileName.ToString());
        }
    }
}