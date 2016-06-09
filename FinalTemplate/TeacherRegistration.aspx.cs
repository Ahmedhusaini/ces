using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

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


                 cmd.Parameters.AddWithValue("@firstname", name.Text);
                 cmd.Parameters.AddWithValue("@lastname", lname.Text);
                 cmd.Parameters.AddWithValue("@phone", contact1.Text);
                 cmd.Parameters.AddWithValue("@gender", radiobut.SelectedValue);
                 cmd.Parameters.AddWithValue("@day", day.Text);
                 cmd.Parameters.AddWithValue("@month", month.Text);
                 cmd.Parameters.AddWithValue("@year", year.Text);
                 cmd.Parameters.AddWithValue("@nationality", nation.Text);
                 cmd.Parameters.AddWithValue("@religion", religion.Text);
                 cmd.Parameters.AddWithValue("@address", address.Text);
                 cmd.Parameters.AddWithValue("@postalcode", postal.Text);
                 cmd.Parameters.AddWithValue("@city", DropDownList2.SelectedValue);
                 cmd.Parameters.AddWithValue("@country", country.Text);
                 cmd.Parameters.AddWithValue("@photo", photo.Text);
                 cmd.Parameters.AddWithValue("@username", user.Text);
                 cmd.Parameters.AddWithValue("@accountpin", accountp.Text);
                 cmd.Parameters.AddWithValue("@password", pass.Text);
                 cmd.Parameters.AddWithValue("@primary_email", pemail.Text);
                 cmd.Parameters.AddWithValue("@secondary_email", semail.Text);



                 SqlParameter outputparameter = new SqlParameter();
                 // outputparameter.ParameterName = "@user_type_id_out";
                 outputparameter.ParameterName = "@authorized_id_out";
                 outputparameter.ParameterName = "@dob_id_out";
                 outputparameter.ParameterName = "@loc_id";
                 //  outputparameter.ParameterName = "@teacher_id_out";
                 outputparameter.SqlDbType = System.Data.SqlDbType.Int;
                 outputparameter.Direction = System.Data.ParameterDirection.Output;
                 cmd.Parameters.Add(outputparameter);


                 con.Open();
                 cmd.ExecuteNonQuery();
             }
        }
    }
}