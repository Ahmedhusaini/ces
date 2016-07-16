using FinalTemplate.source.Functions;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace FinalTemplate.source.Registration
{
    public class CParentRegistration
    {
        private Database.Database myDatabase = new Database.Database("cesConnectionString3");

        public string ParentRegister(int country_id, int city_id, int postalcode, string username, string password,
            int accountpin, string primaryemail, string secondaryemail, string firstname, string lastname, string photo)
        {
            string locationid = myDatabase.GetLastValueByColumnName("loc_id", "tbl_location");

            myDatabase.CreateConnection();
            myDatabase.InitializeSQLCommandObject(myDatabase.GetCurrentConnection, "SP_PARENTREGISTRATIONN", true);
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
            SqlParameter usertypeidParameter = new SqlParameter("@user_type_id", SqlDbType.Int);
            SqlParameter usertypeParameter = new SqlParameter("@user_type", SqlDbType.VarChar, 50);
            //SqlParameter usertypeoutParameter = new SqlParameter("@user_type_id_out", SqlDbType.Int);
            SqlParameter logincountParameter = new SqlParameter("@login_count", SqlDbType.Int);
            SqlParameter lastlogindateParameter = new SqlParameter("@last_login_date", SqlDbType.Date);
            SqlParameter authorizedidoutParameter = new SqlParameter("@authorized_id_out", SqlDbType.VarChar, 20);
            SqlParameter parentidParameter = new SqlParameter("@Parent_id", SqlDbType.VarChar, 50);
            SqlParameter generalParameter = new SqlParameter("@general_id", SqlDbType.Int);
            SqlParameter fnameParameter = new SqlParameter("@firstname", SqlDbType.VarChar, 50);
            SqlParameter lnameParameter = new SqlParameter("@lastname", SqlDbType.VarChar, 50);
            SqlParameter nationParameter = new SqlParameter("@nationality", SqlDbType.VarChar, 50);
            SqlParameter genderParameter = new SqlParameter("@gender", SqlDbType.VarChar, 20);
            SqlParameter photoParameter = new SqlParameter("@photo", SqlDbType.VarChar, 200);
            SqlParameter religionParameter = new SqlParameter("@religion", SqlDbType.VarChar, 50);
            SqlParameter phoneParameter = new SqlParameter("@phone", SqlDbType.VarChar, 50);
            SqlParameter addressParameter = new SqlParameter("@address", SqlDbType.VarChar, 50);
            SqlParameter officeParameter = new SqlParameter("office_address", SqlDbType.VarChar, 50);
            SqlParameter nicParameter = new SqlParameter("CNIC_No", SqlDbType.Int);
            SqlParameter postParameter = new SqlParameter("Post_Designation", SqlDbType.VarChar, 50);
            SqlParameter salaryParameter = new SqlParameter("Salary_Anum", SqlDbType.Int);
            SqlParameter generaloutParameter = new SqlParameter("general_id_out", SqlDbType.VarChar, 20);
            SqlParameter parentoutParameter = new SqlParameter("parent_id_out", SqlDbType.VarChar, 20);
            SqlParameter dobidParameter = new SqlParameter("@dob_id", SqlDbType.Int);
            SqlParameter dayParameter = new SqlParameter("@day", SqlDbType.Int);
            SqlParameter monthParameter = new SqlParameter("@month", SqlDbType.Int);
            SqlParameter yearParameter = new SqlParameter("@year", SqlDbType.Int);
            SqlParameter dobidoutParameter = new SqlParameter("@dob_id_out", SqlDbType.Int);


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
            lastlogindateParameter.Value = Convert.ToDateTime(Jfunctionparents.GetSystemDate());
            authorizedidoutParameter.Direction = ParameterDirection.Output;
            parentidParameter.Value = GenerateParentID(firstname, lastname);
            fnameParameter.Value = firstname;
            lnameParameter.Value = lastname;
            //  nicParameter.Value = cnic;
            dayParameter.Value = Convert.ToDateTime(Jfunctionparents.GetSystemDate());
            monthParameter.Value = Convert.ToDateTime(Jfunctionparents.GetSystemDate());
            yearParameter.Value = Convert.ToDateTime(Jfunctionparents.GetSystemDate());
            photoParameter.Value = photo;
            parentoutParameter.Direction = ParameterDirection.Output;
            generaloutParameter.Direction = ParameterDirection.Output;
            dobidoutParameter.Direction = ParameterDirection.Output;



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
            myDatabase.obj_sqlcommand.Parameters.Add(logincountParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(lastlogindateParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(usertypeParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(authorizedidoutParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(parentidParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(generalParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(fnameParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(lnameParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(nationParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(genderParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(photoParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(religionParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(phoneParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(addressParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(officeParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(nicParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(postParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(salaryParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(parentoutParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(generaloutParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(dobidParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(dayParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(monthParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(yearParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(dobidoutParameter);

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
            catch (Exception ex)
            {

                return "false" + ex.ToString();
            }

            finally
            {
                myDatabase.obj_sqlcommand.Dispose();
                myDatabase.obj_sqlconnection.Close();
                myDatabase.obj_sqlconnection.Dispose();
                myDatabase.obj_sqlcommand.Parameters.Clear();
                myDatabase.CloseConnection();
            }
        }

        private string GenerateParentID(string firstname, string lastname)
        {
            Random random = new Random();

            StringBuilder id = new StringBuilder();
            id.Append("C/");
            id.Append(firstname.Substring(0, 3));
            id.Append("/E/");
            id.Append(lastname.Substring(0, 3));
            id.Append("/S/");
            id.Append(Jfunctionparents.GetSystemDate());
            id.Append("/");
            id.Append(Jfunctionparents.GetSystemTime());
            id.Append(random.Next(3, 10));
            return id.ToString();
        }

        private string GenerateAuthorizedID(string username, string accountPin)
        {
            return Convert.ToString(username.Substring(0, 3) + accountPin.Substring(0, 3));
        }

    }
}
 
