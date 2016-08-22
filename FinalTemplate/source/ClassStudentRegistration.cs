using FinalTemplate.source.Functions;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace FinalTemplate.source
{
    public class ClassStudentRegistration
    {
        private Database.Database myDatabase = new Database.Database("cesConnectionString2");

        public string studentregister(string firstname, string lastname, string phone, string guardian, string contact2,
             string gender,string dob, string nationality, string religion, int city_id, int country_id, string address, int postalcode,
             string previousschool, string last_class_attended, string photo, string schoolName, int class_id,
            int section_id, string username, int accountpin, string password, string primaryemail, string secondaryemail)
        // , befpre gender,int dob
        {
            string locationid = myDatabase.GetLastValueByColumnName("loc_id", "tbl_location");
            string GeneralId = myDatabase.GetLastValueByColumnName("General_Id", "tbl_general");
            string tbl_Student_Reg = myDatabase.GetLastValueByColumnName("Std_id", "tbl_Student_Reg");
            string dobid = myDatabase.GetLastValueByColumnName("dob_id", "tbl_dob");

            myDatabase.CreateConnection();
            myDatabase.InitializeSQLCommandObject(myDatabase.GetCurrentConnection, "sp_student_registr", true);

            SqlParameter General_IdParameter = new SqlParameter("@General_Id", SqlDbType.Int);
            SqlParameter firstnameParameter = new SqlParameter("@firstname", SqlDbType.VarChar, 50);
            SqlParameter lastnameParameter = new SqlParameter("@lastname", SqlDbType.VarChar, 50);
            SqlParameter NationalityParameter = new SqlParameter("@Nationality", SqlDbType.VarChar, 15);
            SqlParameter genderParameter = new SqlParameter("@Gender", SqlDbType.VarChar, 7);
            SqlParameter photoParameter = new SqlParameter("@photo", SqlDbType.VarChar, 50);
            SqlParameter religionParameter = new SqlParameter("@religion", SqlDbType.VarChar, 20);
            SqlParameter phoneParameter = new SqlParameter("@phone", SqlDbType.VarChar, 50);
            SqlParameter addressParameter = new SqlParameter("@address", SqlDbType.VarChar, 50);
            SqlParameter generalidoutParameter = new SqlParameter("@General_Id_out", SqlDbType.Int);

            SqlParameter dobidParameter = new SqlParameter("@dob_id", SqlDbType.Int);
            SqlParameter dayParameter = new SqlParameter("@day", SqlDbType.Int);
            SqlParameter monthParameter = new SqlParameter("@month", SqlDbType.Int);
            SqlParameter yearParameter = new SqlParameter("@year", SqlDbType.Int);
            SqlParameter dobidoutParameter = new SqlParameter("@dob_id_out", SqlDbType.Int);

            SqlParameter stdidParameter = new SqlParameter("@Std_id", SqlDbType.VarChar, 50);
            SqlParameter gurdianParameter = new SqlParameter("@Guardian_Name", SqlDbType.VarChar, 50);
            SqlParameter PreviousschoolParameter = new SqlParameter("@Previous_school", SqlDbType.VarChar, 50);
            SqlParameter lastclassattendedParameter = new SqlParameter("@last_class_attended", SqlDbType.VarChar, 10);
            SqlParameter gurdiancontactParameter = new SqlParameter("@gurdian_contact", SqlDbType.VarChar, 50);
            SqlParameter schoolidParameter = new SqlParameter("@school_id", SqlDbType.VarChar, 50);
            SqlParameter stdidoutParameter = new SqlParameter("@Std_id_out", SqlDbType.VarChar, 50);

            SqlParameter classsecinfoidParameter = new SqlParameter("@class_sec_info_id", SqlDbType.Int);
            SqlParameter classidParameter = new SqlParameter("@class_id", SqlDbType.Int);
            SqlParameter sectionidParameter = new SqlParameter("@section_id", SqlDbType.Int);
            SqlParameter classsecinfoidoutParameter = new SqlParameter("@class_sec_info_id_out", SqlDbType.Int);

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

            General_IdParameter.Value = Convert.ToInt32(GeneralId) + 1;
            firstnameParameter.Value = firstname;
            lastnameParameter.Value = lastname;
            NationalityParameter.Value = nationality;
            genderParameter.Value = gender;
            photoParameter.Value = photo;
            religionParameter.Value = religion;
            phoneParameter.Value = phone;
            addressParameter.Value = address;
            generalidoutParameter.Direction = ParameterDirection.Output;

            dobidParameter.Value = Convert.ToInt32(dobid) + 1;
            dayParameter.Value = Convert.ToInt32(dob.Substring(2, 2));
            monthParameter.Value = Convert.ToInt32(dob.Substring(0, 1));
            yearParameter.Value = Convert.ToInt32(dob.Substring(5, 4));
            locidoutParameter.Direction = ParameterDirection.Output;

            stdidParameter.Value = Generatestudentid(schoolName, username, class_id, section_id);
            gurdianParameter.Value = guardian;
            PreviousschoolParameter.Value = previousschool;
            lastclassattendedParameter.Value = last_class_attended;
            gurdiancontactParameter.Value = contact2;
            schoolidParameter.Value = (schoolName);
            stdidoutParameter.Direction = ParameterDirection.Output;

            classsecinfoidParameter.Value = GenerateclasssecinfoID(class_id, section_id);
            classidParameter.Value = class_id;
            sectionidParameter.Value = section_id;
            classsecinfoidoutParameter.Direction = ParameterDirection.Output;

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
            lastlogindateParameter.Value = Convert.ToDateTime(Jfunctionstudents.GetSystemDate());
            authorizedidoutParameter.Direction = ParameterDirection.Output;

            myDatabase.obj_sqlcommand.Parameters.Add(General_IdParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(firstnameParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(lastnameParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(NationalityParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(genderParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(phoneParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(religionParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(phoneParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(addressParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(generalidoutParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(dobidParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(dayParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(monthParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(yearParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(locidoutParameter);

            myDatabase.obj_sqlcommand.Parameters.Add(stdidParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(gurdianParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(PreviousschoolParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(lastclassattendedParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(gurdiancontactParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(schoolidParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(stdidoutParameter);

            myDatabase.obj_sqlcommand.Parameters.Add(classsecinfoidParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(classidParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(sectionidParameter);
            myDatabase.obj_sqlcommand.Parameters.Add(classsecinfoidoutParameter);
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

        private string GenerateclasssecinfoID(int class_id, int section_id)
        {
            Random random = new Random();

            StringBuilder id = new StringBuilder();
            id.Append("C/");
            id.Append(class_id);
            id.Append("/E/");
            id.Append(section_id);
            id.Append("/S/");
            id.Append(JFunctions.GetSystemDate());
            id.Append("/");
            id.Append(JFunctions.GetSystemTime());
            id.Append(random.Next(3, 10));
            return id.ToString();
        }

        private string GenerateAuthorizedID(string Username, string AccountPin)
        {
            return Convert.ToString(Username.Substring(0, 3) + AccountPin.Substring(0, 3));
        }


        private string Generatestudentid(string SchoolName, string username, int class_id, int section_id)
        {
            Random random = new Random();

            StringBuilder id = new StringBuilder();
            id.Append("G/");
            id.Append(SchoolName.Substring(0, 3));
            id.Append("/E/");
            id.Append(username.Substring(0, 3));
            id.Append("/N/");
            id.Append(class_id);
            id.Append("/");
            id.Append(section_id);
            id.Append("/");
            id.Append(Jfunctionstudents.GetSystemDate());
            id.Append("/");
            id.Append(Jfunctionstudents.GetSystemTime());
            id.Append(random.Next(3, 10));
            return id.ToString();
        }
    }
}