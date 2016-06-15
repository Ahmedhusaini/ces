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


namespace FinalTemplate
{
    public partial class Teacher_Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
             string a = ConfigurationManager.ConnectionStrings["abc"].ConnectionString;
             using (SqlConnection con = new SqlConnection(a))
             {
                 SqlCommand cmd = new SqlCommand("SP_TEACHERREGISTRATION", con);
                 cmd.CommandType = System.Data.CommandType.StoredProcedure;

                 cmd.Parameters.AddWithValue("@dob_id_out", SqlDbType.Int).Direction = ParameterDirection.Output;
                 cmd.Parameters.AddWithValue("@loc_id", SqlDbType.Int).Direction = ParameterDirection.Output;
                 cmd.Parameters.AddWithValue("@authorized_id_out", SqlDbType.VarChar).Direction = ParameterDirection.Output;
                 cmd.Parameters.AddWithValue("@teacher_id_out", SqlDbType.Int).Direction = ParameterDirection.Output;
                 cmd.Parameters.AddWithValue("@authorized_id", SqlDbType.VarChar).Value = '5';
                 cmd.Parameters.AddWithValue("@firstname",SqlDbType.VarChar).Value = name.Text;
                 cmd.Parameters.AddWithValue("@lastname",SqlDbType.VarChar).Value = lname.Text;
                 cmd.Parameters.AddWithValue("@phone",SqlDbType.VarChar).Value = contact1.Text;
                 cmd.Parameters.AddWithValue("@cnic_no", SqlDbType.VarChar).Value = nic.Text;
                 cmd.Parameters.AddWithValue("@gender",SqlDbType.VarChar).Value = radiobut.SelectedValue;
                 cmd.Parameters.AddWithValue("@day",SqlDbType.VarChar).Value = dob.Text;
                 cmd.Parameters.AddWithValue("@month",SqlDbType.VarChar).Value = dob.Text;
                 cmd.Parameters.AddWithValue("@year",SqlDbType.VarChar).Value = dob.Text;
                 cmd.Parameters.AddWithValue("@nationality",SqlDbType.VarChar).Value = nation.Text;
                 cmd.Parameters.AddWithValue("@religion",SqlDbType.VarChar).Value = religion.Text;
                 cmd.Parameters.AddWithValue("@address",SqlDbType.VarChar).Value = address.Text;
                 cmd.Parameters.AddWithValue("@postal_code",SqlDbType.VarChar).Value = postal.Text;
                 cmd.Parameters.AddWithValue("@city_id",SqlDbType.Int).Value = DropDownList2.SelectedValue;
                 cmd.Parameters.AddWithValue("@country_id",SqlDbType.Int).Value =DropDownList1.SelectedValue;
                 cmd.Parameters.AddWithValue("@photo",SqlDbType.VarChar).Value =photo.Text;
                 cmd.Parameters.AddWithValue("@username",SqlDbType.VarChar).Value = user.Text;
                 cmd.Parameters.AddWithValue("@account_pin",SqlDbType.VarChar).Value = accountp.Text;
                 cmd.Parameters.AddWithValue("@password",SqlDbType.VarChar).Value = pass.Text;     
                 cmd.Parameters.AddWithValue("@primary_email",SqlDbType.VarChar).Value = pemail.Text;
                 cmd.Parameters.AddWithValue("@secondary_email",SqlDbType.VarChar).Value = semail.Text;
                 cmd.Parameters.AddWithValue("@login_count", SqlDbType.VarChar).Value = 0;
                 cmd.Parameters.AddWithValue("@last_login_date", SqlDbType.Date).Value = DateTime.Now.ToString("");
                 cmd.Parameters.AddWithValue("@date_of_join", SqlDbType.Date).Value = DateTime.Now.ToString("");

             
           
                 con.Open();
                 cmd.ExecuteNonQuery();                 

        
             }
        }
    }
}