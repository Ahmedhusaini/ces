using FinalTemplate.source.Functions;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace FinalTemplate.source
{
    public class ClassStudentRegistration
    {
        private Database.Database studentdatabase = new Database.Database("cesConnectionString2");
        public string studentregister(string name,string lastname,string contactno,string gurdianname,string gurdiancontact,
                                string gender, string dob, string nationality, string religion, int country, int city, string address, int postalcode,
                                string prvschool,string lastclass,string image,string schoolname,int classname,int section,string username,
                                int accountpin,string password,string primaryemail,string secondaryemail) 
        {
            string dobid = studentdatabase.GetLastValueByColumnName("dob_id", "tbl_dob");
            string locationid = studentdatabase.GetLastValueByColumnName("loc_id", "tbl_location");
            string genaralid = studentdatabase.GetLastValueByColumnName("General_Id", "tbl_general");
            string classsectioninfo = studentdatabase.GetLastValueByColumnName("class_sec_info_id", "tbl_class_sec_info");
            string studentregid = studentdatabase.GetLastValueByColumnName("Std_id", "tbl_Student_Reg");
            
            studentdatabase.CreateConnection();
            studentdatabase.InitializeSQLCommandObject(studentdatabase.GetCurrentConnection, "sp_student_register", true);
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
            SqlParameter schoolidParameter = new SqlParameter("@school_id", SqlDbType.VarChar, 50);
            SqlParameter gurdiancontactParameter = new SqlParameter("@gurdian_contact", SqlDbType.VarChar, 50);
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
            SqlParameter authorizedidParameter = new SqlParameter("@authorized_id", SqlDbType.VarChar,20);
            SqlParameter usernameParameter = new SqlParameter("@username", SqlDbType.VarChar, 50);
            SqlParameter passwordParameter = new SqlParameter("@password", SqlDbType.VarChar, 50);
            SqlParameter accountpinParameter = new SqlParameter("@account_pin", SqlDbType.Int);
            SqlParameter primaryemailParameter = new SqlParameter("@primary_email", SqlDbType.VarChar, 50);
            SqlParameter secondaryemailParameter = new SqlParameter("@secondary_email", SqlDbType.VarChar, 50);
            SqlParameter usertypeidParameter = new SqlParameter("@usertype_id", SqlDbType.Int);
            SqlParameter logincountParameter = new SqlParameter("@login_count", SqlDbType.Int);
            SqlParameter lastlogindateParameter = new SqlParameter("@last_login_date", SqlDbType.Date);
            SqlParameter authorizedidoutParameter = new SqlParameter("@authorized_id_out", SqlDbType.VarChar, 20);

            General_IdParameter.Value = Convert.ToInt32(genaralid)+1;
            firstnameParameter.Value=name;
            lastnameParameter.Value=lastname;
            NationalityParameter.Value=nationality;
            genderParameter.Value=gender;
            photoParameter.Value=image;
            religionParameter.Value=religion;
            phoneParameter.Value=contactno;
            addressParameter.Value=address;
            generalidoutParameter.Direction= ParameterDirection.Output;
            dobidParameter.Value= Convert.ToInt32(dobid)+1;
            dayParameter.Value = Convert.ToInt32(dob.Substring(0, 2));
            monthParameter.Value = Convert.ToInt32(dob.Substring(0, 2));
            yearParameter.Value = Convert.ToInt32(dob.Substring(0, 4));
            dobidoutParameter.Direction= ParameterDirection.Output;
            stdidParameter.Value=Generatestudentid(username,classname.ToString(),section.ToString());
            gurdianParameter.Value=gurdianname; 
            PreviousschoolParameter.Value=prvschool;
            lastclassattendedParameter.Value=lastclass;
            schoolidParameter.Value=schoolname;
            gurdiancontactParameter.Value=gurdiancontact;
            stdidoutParameter.Direction= ParameterDirection.Output;
            classsecinfoidParameter.Value = Convert.ToInt32(classsectioninfo) ;
            classidParameter.Value=classname;
            sectionidParameter.Value=section;
            classsecinfoidoutParameter.Direction= ParameterDirection.Output;
            locidParameter.Value=Convert.ToInt32(locationid) + 1;
            countryidParameter.Value=country;
            cityidParameter.Value=city;
            postalcodeParameter.Value=postalcode;
            locidoutParameter.Direction= ParameterDirection.Output;
            authorizedidParameter.Value=GenerateAuthorizedID(username, accountpin.ToString());
            usernameParameter.Value=username;
            passwordParameter.Value=password;
            accountpinParameter.Value=accountpin;
            primaryemailParameter.Value=primaryemail;
            secondaryemailParameter.Value=secondaryemail;
            usertypeidParameter.Value=4;
            logincountParameter.Value=0;
            lastlogindateParameter.Value = Convert.ToDateTime(Jfunctionstudents.GetSystemDate());
            authorizedidoutParameter.Direction= ParameterDirection.Output;

            studentdatabase.obj_sqlcommand.Parameters.Add(General_IdParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(firstnameParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(lastnameParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(NationalityParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(genderParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(photoParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(religionParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(phoneParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(addressParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(generalidoutParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(dobidParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(dayParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(monthParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(yearParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(dobidoutParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(stdidParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(gurdianParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(PreviousschoolParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(lastclassattendedParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(schoolidParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(gurdiancontact);
            studentdatabase.obj_sqlcommand.Parameters.Add(stdidoutParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(classsecinfoidParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(classidParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(sectionidParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(classsecinfoidoutParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(locidParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(countryidParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(cityidParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(postalcodeParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(locidoutParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(authorizedidParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(usernameParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(passwordParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(accountpinParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(primaryemailParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(secondaryemailParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(usertypeidParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(logincountParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(lastlogindateParameter);
            studentdatabase.obj_sqlcommand.Parameters.Add(authorizedidoutParameter);

            try
            {
                studentdatabase.OpenConnection();

                if (studentdatabase.obj_sqlcommand.ExecuteNonQuery() > 0)
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
                studentdatabase.obj_sqlcommand.Dispose();
                studentdatabase.obj_sqlconnection.Dispose();
                studentdatabase.obj_sqlcommand.Parameters.Clear();
                studentdatabase.CloseConnection();
            }
        }

        private string GenerateAuthorizedID(string Username, string AccountPin)
        {
            return Convert.ToString(Username .Substring(0, 3) + AccountPin.Substring(0, 3));
        }

        private string Generatestudentid(string lastname, string classname, string section)
        {
            Random random = new Random();

            StringBuilder id = new StringBuilder();
            id.Append("C/");
            id.Append(Convert.ToString(lastname.Substring(0, 3)));
            id.Append("/E/");
            id.Append((classname));
            id.Append("/S/");
            id.Append((section));
            id.Append("/");
            id.Append(Jfunctionstudents.GetSystemDate().Substring(0, 3));
            id.Append(random.Next(3, 10));
            return id.ToString();
        }
    }
}