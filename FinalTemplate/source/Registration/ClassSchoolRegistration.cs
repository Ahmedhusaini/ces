using FinalTemplate.source.Functions;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace FinalTemplate.source.Registration
{
    public class ClassSchoolRegistration
    {
        private Database.Database myDatabase = new Database.Database("cesConnectionString");
        public string RegisterSchool(string country_id, string city_id, string postalcode, string username, string password, string accountpin, string primaryemail, string secondaryemail, string schoolName, string ownerName, string foundedIn, string logo, string school_type_id, string campusName)
        {
            myDatabase.CreateConnection();
            myDatabase.InitializeSQLCommandObject(myDatabase.GetCurrentConnection, "spRegisterSchool", true);
            myDatabase.obj_sqlparameter = new SqlParameter[4];
            myDatabase.obj_sqlparameter[0] = new SqlParameter("@location_id_out", SqlDbType.Int);
            myDatabase.obj_sqlparameter[1] = new SqlParameter("@authorized_id_out", SqlDbType.VarChar, 20);
            myDatabase.obj_sqlparameter[2] = new SqlParameter("@school_id_out", SqlDbType.VarChar, 50);
            myDatabase.obj_sqlparameter[3] = new SqlParameter("@campus_id_out", SqlDbType.VarChar, 50);
            //setting the direction of the parameters
            myDatabase.obj_sqlparameter[0].Direction = ParameterDirection.Output;//location id
            myDatabase.obj_sqlparameter[1].Direction = ParameterDirection.Output;//authorized id
            myDatabase.obj_sqlparameter[2].Direction = ParameterDirection.Output;//school id
            myDatabase.obj_sqlparameter[3].Direction = ParameterDirection.Output;//campus id
            //adding the parameters to sql command object
            myDatabase.obj_sqlcommand.Parameters.Add(myDatabase.obj_sqlparameter[0]);
            myDatabase.obj_sqlcommand.Parameters.Add(myDatabase.obj_sqlparameter[1]);
            myDatabase.obj_sqlcommand.Parameters.Add(myDatabase.obj_sqlparameter[2]);
            myDatabase.obj_sqlcommand.Parameters.Add(myDatabase.obj_sqlparameter[3]);

            //adding intput parameters to the sql command object
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@location_id", Convert.ToInt32(myDatabase.GetLastValueByColumnName("loc_id", "tbl_location") + 1)));
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@country_id", Convert.ToInt32(country_id)));
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@city_id", Convert.ToInt32(city_id)));
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@postalcode", Convert.ToInt32(postalcode)));
            //myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@loc_id_out", Convert.ToInt32(myDatabase.obj_sqlparameter[0].Value)));
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@authorized_id", GenerateAuthorizedID(username, password)));
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@username", username));
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@password", password));
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@account_pin", Convert.ToInt32(accountpin)));
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@primary_email", primaryemail));
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@secondary_email", secondaryemail));
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@usertype_id", 1));
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@login_count", 0));
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@last_login_date", Convert.ToDateTime(JFunctions.GetSystemDate())));
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@school_id", GenerateSchoolID(schoolName, ownerName)));
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@school_name", schoolName));
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@owner_name", ownerName));
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@founded_in", Convert.ToDateTime(foundedIn)));
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@logo", logo));
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@school_type_id", Convert.ToInt32(school_type_id)));
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@campus_id", GenerateCampusID(schoolName)));
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@campus_name", campusName));
            try
            {
                myDatabase.OpenConnection();
                int flag = myDatabase.obj_sqlcommand.ExecuteNonQuery();
                if (flag > 0)
                {
                    return "true";
                }

            }
            catch (Exception exception)
            {

                return "false" + exception.ToString();
            }
            finally
            {
                myDatabase.obj_sqlcommand.Dispose();
                myDatabase.obj_sqlconnection.Close();
                myDatabase.obj_sqlconnection.Dispose();
                myDatabase.obj_sqlcommand.Parameters.Clear();
                myDatabase.CloseConnection();
            }
            return "true";
        }

        private string GenerateCampusID(string schoolName)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append(schoolName.Substring(0, 3));
            builder.Append("/CES/");
            builder.Append(JFunctions.GetSystemDate());
            builder.Append("/");
            builder.Append(JFunctions.GetSystemTime());
            return builder.ToString();
        }

        private string GenerateAuthorizedID(string Username, string AccountPin)
        {
            return Convert.ToString(Username.Substring(0, 3) + AccountPin.Substring(0, 3));
        }

        private string GenerateSchoolID(string SchoolName, string OwnerName)
        {
            StringBuilder id = new StringBuilder();
            id.Append("C/");
            id.Append(SchoolName.Take(3));
            id.Append("/E/");
            id.Append(OwnerName.Take(3));
            id.Append("S/");
            id.Append(JFunctions.GetSystemDate());
            id.Append("/");
            id.Append(JFunctions.GetSystemTime());
            return id.ToString();
        }
    }
}