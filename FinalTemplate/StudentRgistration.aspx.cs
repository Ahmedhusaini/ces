using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace FinalTemplate
{
    public partial class StudentRgistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name="";
            string lname="";
            string email="";
            string contact1="";
            string guardian="";
            string contact2="";
            string dob="";
            string nation="";
            string religion="";
            string country="";
            string address="";
            string postal="";
            string prevchool="";
            string preclass="";
            string sname="";
            string classtxt="";
            string section="";
            string user="";
            string accountp="";
            string pass="";
            string repass="";
            string pemail="";
            string semail="";

            string student_connection_string = "Data Source=SHAHWAIZHASAN;Initial Catalog=ces;Integrated Security=True";
            SqlConnection std_con = new SqlConnection(student_connection_string);
            SqlCommand std_cmd = new SqlCommand("sp_student_registr", std_con);
            std_cmd.CommandType = CommandType.StoredProcedure;

        }

        protected void lname_TextChanged(object sender, EventArgs e)
        {

        }
    }
}