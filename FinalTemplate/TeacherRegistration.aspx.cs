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
                 SqlCommand cmd = new SqlCommand("SP_TEACHER", con);
                 cmd.CommandType = System.Data.CommandType.StoredProcedure;

                // cmd.Parameters.Add("@teacher_id", SqlDbType.VarChar).Direction = ParameterDirection.Output;
                // cmd.Parameters.Add("@general_id", SqlDbType.VarChar).Direction = ParameterDirection.Output;
                 cmd.Parameters.AddWithValue("@firstname",SqlDbType.VarChar).Value = name.Text;
                 cmd.Parameters.AddWithValue("@lastname",SqlDbType.VarChar).Value = lname.Text;
                 cmd.Parameters.AddWithValue("@phone",SqlDbType.VarChar).Value = contact1.Text;
                 cmd.Parameters.AddWithValue("@gender",SqlDbType.VarChar).Value = radiobut.SelectedValue;
                 cmd.Parameters.AddWithValue("@day",SqlDbType.VarChar).Value = dob.Text;
              //   cmd.Parameters.AddWithValue("@month",SqlDbType.VarChar).Value = dob.Text;
              //   cmd.Parameters.AddWithValue("@year",SqlDbType.VarChar).Value = dob.Text;
                 cmd.Parameters.AddWithValue("@nationality",SqlDbType.VarChar).Value = nation.Text;
                 cmd.Parameters.AddWithValue("@religion",SqlDbType.VarChar).Value = religion.Text;
                 cmd.Parameters.AddWithValue("@address",SqlDbType.VarChar).Value = address.Text;
                 cmd.Parameters.AddWithValue("@postalcode",SqlDbType.VarChar).Value = postal.Text;
                 cmd.Parameters.AddWithValue("@city",SqlDbType.VarChar).Value = DropDownList2.SelectedValue;
                 cmd.Parameters.AddWithValue("@country",SqlDbType.VarChar).Value = country.Text;
                 cmd.Parameters.AddWithValue("@photo",SqlDbType.VarChar).Value =fileupload ;
                 cmd.Parameters.AddWithValue("@username",SqlDbType.VarChar).Value = user.Text;
                 cmd.Parameters.AddWithValue("@accountpin",SqlDbType.VarChar).Value = accountp.Text;
                 cmd.Parameters.AddWithValue("@password",SqlDbType.VarChar).Value = pass.Text;
                 cmd.Parameters.AddWithValue("@primary_email",SqlDbType.VarChar).Value = pemail.Text;
                 cmd.Parameters.AddWithValue("@secondary_email",SqlDbType.VarChar).Value = semail.Text;

                 int teacher_id = 1;
                 int general_id = 1;
                 int dob_id = 1;
                 int user_type_id = 1;
                 int loc_id = 5;
                 string authorized_id = "5";
             
                 SqlParameter outputparameter = new SqlParameter();
                 outputparameter.ParameterName = "@user_type_id_out";
                 outputparameter.ParameterName = "@authorized_id_out";
                 outputparameter.ParameterName = "@dob_id_out";
                 outputparameter.ParameterName = "@loc_id";
                 outputparameter.ParameterName = "@teacher_id_out";
                 outputparameter.SqlDbType = System.Data.SqlDbType.Int;
                 outputparameter.Direction = System.Data.ParameterDirection.Output;
                 cmd.Parameters.Add(outputparameter);
                 con.Open();
                 cmd.ExecuteNonQuery();                 

                     string authorized_id_out = cmd.Parameters["@authorized_id_out"].Value.ToString();
                     con.Close();
                
            fileupload.SaveAs(Request.PhysicalApplicationPath + "/assets/" + fileupload.FileName.ToString());
             }
        }
    }
}