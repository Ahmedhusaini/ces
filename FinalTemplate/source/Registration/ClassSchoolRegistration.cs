using FinalTemplate.source.Functions;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace FinalTemplate.source.Registration
{
    public class ClassSchoolRegistration
    {
        private Database.Database myDatabase = new Database.Database("cesConnectionString");
        public string RegisterSchool(int country_id, int city_id, int postalcode, string username, string password, int accountpin, string primaryemail, string secondaryemail, string schoolName, string ownerName, string foundedIn, string logo, int school_type_id, string campusName)
        {
            string locationid = myDatabase.GetLastValueByColumnName("loc_id", "tbl_location");

            myDatabase.CreateConnection();
            myDatabase.InitializeSQLCommandObject(myDatabase.GetCurrentConnection, "spRegisterSchool", true);
            SqlParameter locidParameter = new SqlParameter("@loc_id", SqlDbType.Int);
            SqlParameter countryidParameter = new SqlParameter("@country_id", SqlDbType.Int);
            SqlParameter cityidParameter = new SqlParameter("@city_id", SqlDbType.Int);
            SqlParameter postalcodeParameter = new SqlParameter("@postal_code", SqlDbType.Int);
            SqlParameter locidoutParameter = new SqlParameter("@loc_id_out", SqlDbType.Int);
            SqlParameter authorizedidParameter = new SqlParameter("@authorized_id", SqlDbType.VarChar, 20);
            SqlParameter usernameParameter = new SqlParameter("@username", SqlDbType.VarChar, 50);
            SqlParameter passwordParameter = new SqlParameter("@password", SqlDbType.VarChar, 50);
            SqlParameter accountpinParameter = new SqlParameter("@account_pin", SqlDbType.Int);
            SqlParameter primaryemailParameter = new SqlParameter("@primary_email", SqlDbType.VarChar, 50);
            SqlParameter secondaryemailParameter = new SqlParameter("@secondary_email", SqlDbType.VarChar, 50);
            SqlParameter usertypeidParameter = new SqlParameter("@usertype_id", SqlDbType.Int);
            SqlParameter logincountParameter = new SqlParameter("@login_count", SqlDbType.Int);
            SqlParameter lastlogindateParameter = new SqlParameter("@last_login_date", SqlDbType.Date);
            SqlParameter authorizedidoutParameter = new SqlParameter("@authorized_id_out", SqlDbType.VarChar, 20);
            SqlParameter schoolidParameter = new SqlParameter("@school_id", SqlDbType.VarChar, 50);
            SqlParameter schoolnameParameter = new SqlParameter("@school_name", SqlDbType.VarChar, 50);
            SqlParameter ownernameParameter = new SqlParameter("@owner_name", SqlDbType.VarChar, 50);
            SqlParameter foundedinParameter = new SqlParameter("@founded_in", SqlDbType.Date);
            SqlParameter logoParameter = new SqlParameter("@logo", SqlDbType.VarChar, 200);
            SqlParameter schooltypeidParameter = new SqlParameter("@school_type_id", SqlDbType.Int);
            SqlParameter schoolidoutParameter = new SqlParameter("@school_id_out", SqlDbType.VarChar, 20);
            SqlParameter campusidParameter = new SqlParameter("@campus_id", SqlDbType.VarChar, 20);
            SqlParameter campusnameParameter = new SqlParameter("@campus_name", SqlDbType.VarChar, 50);


            locidParameter.Value = Convert.ToInt32(locationid) + 1;
            countryidParameter.Value = country_id;
            cityidParameter.Value = city_id;
            postalcodeParameter.Value = postalcode;
            locidoutParameter.Direction = ParameterDirection.Output;
            authorizedidParameter.Value = GenerateAuthorizedID(username, accountpin.ToString());
            usernameParameter.Value = username;
            passwordParameter.Value = password;
            accountpinParameter.Value = accountpin;
            primaryemailParameter.Value = primaryemail;
            secondaryemailParameter.Value = secondaryemail;
            usertypeidParameter.Value = 1;
            logincountParameter.Value = 0;
            lastlogindateParameter.Value = Convert.ToDateTime(JFunctions.GetSystemDate());
            authorizedidoutParameter.Direction = ParameterDirection.Output;
            schoolidParameter.Value = GenerateSchoolID(schoolName, ownerName);
            schoolnameParameter.Value = schoolName;
            ownernameParameter.Value = ownerName;
            foundedinParameter.Value = Convert.ToDateTime(JFunctions.GetSystemDate());
            logoParameter.Value = logo;
            schooltypeidParameter.Value = school_type_id;
            schoolidoutParameter.Direction = ParameterDirection.Output;
            campusidParameter.Value = GenerateCampusID(schoolName);
            campusnameParameter.Value = campusName;

            myDatabase.obj_sqlcommand.Parameters.Add(locidParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(countryidParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(cityidParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(postalcodeParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(locidoutParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(authorizedidParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(usernameParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(passwordParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(accountpinParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(primaryemailParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(secondaryemailParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(usertypeidParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(logincountParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(lastlogindateParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(authorizedidoutParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(schoolidParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(schoolnameParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(ownernameParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(foundedinParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(logoParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(schooltypeidParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(schoolidoutParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(campusidParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(campusnameParameter);

            try
            {
                myDatabase.OpenConnection();

                if (myDatabase.obj_sqlcommand.ExecuteNonQuery() > 0)
                {
                    return "true";
                }
                else
                {
                    return "false";
                }

            }
            catch (Exception exception)
            {

                return "false" + exception.ToString();
            }
            finally
            {
                myDatabase.obj_sqlcommand.Dispose();
                myDatabase.obj_sqlconnection.Dispose();
                myDatabase.obj_sqlcommand.Parameters.Clear();
                myDatabase.CloseConnection();
            }
        }

        private string GenerateCampusID(string schoolName)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append(schoolName.Substring(0, 5));
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
            Random random = new Random();

            StringBuilder id = new StringBuilder();
            id.Append("C/");
            id.Append(SchoolName.Substring(0, 3));
            id.Append("/E/");
            id.Append(OwnerName.Substring(0, 3));
            id.Append("/S/");
            id.Append(JFunctions.GetSystemDate());
            id.Append("/");
            id.Append(JFunctions.GetSystemTime());
            id.Append("/");
            id.Append(random.Next(3, 10));
            return id.ToString();
        }
    }
}