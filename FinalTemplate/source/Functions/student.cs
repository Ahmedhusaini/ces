using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using FinalTemplate.source.Database;
using FinalTemplate.source.Validation;

namespace FinalTemplate.source.Functions
{
    public class student
    {
        static private Database.Database mydatabse = new Database.Database("cesConnectionString2");

        //  Get StudentID
        static public string studentid { get; set; }
        static public int generalid { get; set; }
        static public int classsecinfoid { get; set; }
        static public string authorizedid { get; set; }
        static public string schoolid { get; set; }
        static public int Day { get; set; }
        static public int Month { get; set; }
        static public int Year { get; set; }

        //complete detail of student
        static public string s_class { get; set; }
        static public string s_section { get; set; }
        static public string postalcode { get; set; }
        static public string gurdianname { get; set; }
        static public string gurdiancontact { get; set; }
        static public string previousschool { get; set; }
        static public string lastclassattend { get; set; }

        // school detail
        static public string s_username { get; set; }
        static public string s_schoolname { get; set; }
        static public string s_primaryemail { get; set; }
        static public string s_secondaryemail { get; set; }
        static public string s_primarycontact { get; set; }
        static public string s_secondarycontact { get; set; }

        static public void GetstudentlDetails(string stdlid)
        {
            mydatabse.CreateConnection();
            mydatabse.InitializeSQLCommandObject(mydatabse.GetCurrentConnection, "GetStudentID", true);
            try
            {
                mydatabse.OpenConnection();
                SqlParameter p_autho = new SqlParameter("@authorized_id", SqlDbType.VarChar, 20);
                p_autho.Value = stdlid;
                mydatabse.obj_sqlcommand.Parameters.Add(p_autho);
                mydatabse.obj_reader = mydatabse.obj_sqlcommand.ExecuteReader();
                if (mydatabse.obj_reader.HasRows)
                {
                    int totalRows = mydatabse.obj_reader.RecordsAffected;
                    while (mydatabse.obj_reader.Read())
                    {
                        studentid = mydatabse.obj_reader["Std_id"].ToString();
                    }
                }
                else
                {
                    HttpContext.Current.Response.Write("No records");
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                mydatabse.CloseConnection();
                mydatabse.obj_reader.Close();
            }
        }

        static public void SchoolDetails(string SchoolDEtail)
        {
            mydatabse.CreateConnection();
            mydatabse.InitializeSQLCommandObject(mydatabse.GetCurrentConnection, "sp_schooldetailforstudent1", true);
            try
            {
                mydatabse.OpenConnection();
                SqlParameter p_autho = new SqlParameter("@authorized_id", SqlDbType.VarChar, 20);
                p_autho.Value = SchoolDEtail;
                mydatabse.obj_sqlcommand.Parameters.Add(p_autho);
                mydatabse.obj_reader = mydatabse.obj_sqlcommand.ExecuteReader();
                if (mydatabse.obj_reader.HasRows)
                {
                    int totalRows = mydatabse.obj_reader.RecordsAffected;
                    while (mydatabse.obj_reader.Read())
                    {
                        s_schoolname = mydatabse.obj_reader["school_name"].ToString();
                        s_primarycontact = mydatabse.obj_reader["contact_primary"].ToString();
                        s_secondarycontact = mydatabse.obj_reader["contact_secondary"].ToString();
                        //s_primaryemail = mydatabse.obj_reader["primary_email"].ToString();
                        //s_secondaryemail = mydatabse.obj_reader["secondary_email"].ToString();
                        //s_username = mydatabse.obj_reader["username"].ToString();
                    }
                }
                else
                {
                    HttpContext.Current.Response.Write("No records");
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                mydatabse.CloseConnection();
                mydatabse.obj_reader.Close();
            }
        }


        static public void Complete_Detail_Of_Student(string com_stu)
        {
            mydatabse.CreateConnection();
            mydatabse.InitializeSQLCommandObject(mydatabse.GetCurrentConnection, "sp_Complete_Detail_Of_Student", true);
            try
            {
                mydatabse.OpenConnection();
                SqlParameter p_autho = new SqlParameter("@authorized_id", SqlDbType.VarChar, 20);
                p_autho.Value = com_stu;
                mydatabse.obj_sqlcommand.Parameters.Add(p_autho);
                mydatabse.obj_reader = mydatabse.obj_sqlcommand.ExecuteReader();
                if (mydatabse.obj_reader.HasRows)
                {
                    int totalRows = mydatabse.obj_reader.RecordsAffected;
                    while (mydatabse.obj_reader.Read())
                    {
                        postalcode = mydatabse.obj_reader["postal_code"].ToString();
                        lastclassattend = mydatabse.obj_reader["last_class_attended"].ToString();
                        gurdianname = mydatabse.obj_reader["Guardian_Name"].ToString();
                        gurdiancontact = mydatabse.obj_reader["gurdian_contact"].ToString();
                        previousschool = mydatabse.obj_reader["Previous_school"].ToString();
                        s_class = mydatabse.obj_reader["class"].ToString();
                        s_section = mydatabse.obj_reader["section"].ToString();
                        Day = Convert.ToInt32(mydatabse.obj_reader["day"]);
                        Month = Convert.ToInt32(mydatabse.obj_reader["month"]);
                        Year = Convert.ToInt32(mydatabse.obj_reader["year"]);
                    }
                }
                else
                {
                    HttpContext.Current.Response.Write("No records");
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                mydatabse.CloseConnection();
                mydatabse.obj_reader.Close();
            }
        }

        public string Updatestudentdetail(int general_id, string firstname, string lastname, string nationality, string gender, string phone,
                                         string religion, string address, int dob_id, string _dateofbirth, string std_id, string gurdian_name,
                                        string gurdian_contact, string previous_school, string last_class_attend, int loc_id, int city_id,
                                        int postal_code, string authorized_id, string username, string primary_email, string secoundary_email)
        {
            string returnvalue = string.Empty;
            mydatabse.CreateConnection();
            mydatabse.InitializeSQLCommandObject(mydatabse.GetCurrentConnection, "sp_Update_StudentInformation", true);

            SqlParameter s_general_id = new SqlParameter("@general_id", SqlDbType.Int);
            SqlParameter s_firstname = new SqlParameter("@firstname", SqlDbType.VarChar, 50);
            SqlParameter s_lastname = new SqlParameter("@lastname", SqlDbType.VarChar, 50);
            SqlParameter s_dob_id = new SqlParameter("@dob_id", SqlDbType.Int);
            SqlParameter s_nationality = new SqlParameter("@nationality", SqlDbType.VarChar, 15);
            SqlParameter s_gender = new SqlParameter("@gender", SqlDbType.VarChar, 7);
            SqlParameter s_religion = new SqlParameter("@religion", SqlDbType.VarChar, 20);
            SqlParameter s_phone = new SqlParameter("@phone", SqlDbType.VarChar, 50);
            SqlParameter s_address = new SqlParameter("@address", SqlDbType.VarChar, 50);
            SqlParameter s_locid = new SqlParameter("@loc_id", SqlDbType.Int);
            SqlParameter s_day = new SqlParameter("@day", SqlDbType.Int);
            SqlParameter s_month = new SqlParameter("@month", SqlDbType.Int);
            SqlParameter s_year = new SqlParameter("@year", SqlDbType.Int);
            SqlParameter s_stdid = new SqlParameter("@Std_id", SqlDbType.VarChar, 50);
            SqlParameter s_gurdianname = new SqlParameter("@Guardian_Name", SqlDbType.VarChar, 50);
            SqlParameter s_previousschool = new SqlParameter("@Previous_school", SqlDbType.VarChar, 50);
            SqlParameter s_lastclassattend = new SqlParameter("@last_class_attended", SqlDbType.VarChar, 10);
            SqlParameter s_gurdiancontact = new SqlParameter("@gurdian_contact", SqlDbType.VarChar, 50);
            SqlParameter s_cityid = new SqlParameter("@city_id", SqlDbType.Int);
            SqlParameter s_postalcode = new SqlParameter("@postal_code", SqlDbType.Int);
            SqlParameter s_authorizedid = new SqlParameter("@authorized_id", SqlDbType.VarChar, 20);
            SqlParameter s_username = new SqlParameter("@username", SqlDbType.VarChar, 50);
            SqlParameter s_primaryemail = new SqlParameter("@primary_email", SqlDbType.VarChar, 50);
            SqlParameter s_secondaryemail = new SqlParameter("@secondary_email", SqlDbType.VarChar, 50);

            s_general_id.Value = general_id;
            s_firstname.Value = firstname;
            s_lastname.Value = lastname;
            s_dob_id.Value = dob_id;
            s_nationality.Value = nationality;
            s_gender.Value = gender;
            s_religion.Value = religion;
            s_phone.Value = phone;
            s_address.Value = address;
            s_locid.Value = loc_id;
            s_day.Value = Convert.ToInt32(_dateofbirth.Substring(0, 2));
            s_month.Value = Convert.ToInt32(_dateofbirth.Substring(3, 2));
            s_year.Value = Convert.ToInt32(_dateofbirth.Substring(_dateofbirth.Length - 4, 4));
            s_stdid.Value = std_id;
            s_gurdianname.Value = gurdian_name;
            s_previousschool.Value = previous_school;
            s_lastclassattend.Value = last_class_attend;
            s_gurdiancontact.Value = gurdian_contact;
            s_postalcode.Value = postal_code;
            s_cityid.Value = city_id;
            s_authorizedid.Value = authorized_id;
            s_username.Value = username;
            s_primaryemail.Value = primary_email;
            s_secondaryemail.Value = secoundary_email;

            mydatabse.obj_sqlcommand.Parameters.Add(s_general_id);
            mydatabse.obj_sqlcommand.Parameters.Add(s_firstname);
            mydatabse.obj_sqlcommand.Parameters.Add(s_lastname);
            mydatabse.obj_sqlcommand.Parameters.Add(s_dob_id);
            mydatabse.obj_sqlcommand.Parameters.Add(s_nationality);
            mydatabse.obj_sqlcommand.Parameters.Add(s_gender);
            mydatabse.obj_sqlcommand.Parameters.Add(s_religion);
            mydatabse.obj_sqlcommand.Parameters.Add(s_phone);
            mydatabse.obj_sqlcommand.Parameters.Add(s_address);
            mydatabse.obj_sqlcommand.Parameters.Add(s_locid);
            mydatabse.obj_sqlcommand.Parameters.Add(s_day);
            mydatabse.obj_sqlcommand.Parameters.Add(s_month);
            mydatabse.obj_sqlcommand.Parameters.Add(s_year);
            mydatabse.obj_sqlcommand.Parameters.Add(s_stdid);
            mydatabse.obj_sqlcommand.Parameters.Add(s_gurdianname);
            mydatabse.obj_sqlcommand.Parameters.Add(s_previousschool);
            mydatabse.obj_sqlcommand.Parameters.Add(s_lastclassattend);
            mydatabse.obj_sqlcommand.Parameters.Add(s_gurdiancontact);
            mydatabse.obj_sqlcommand.Parameters.Add(s_cityid);
            mydatabse.obj_sqlcommand.Parameters.Add(s_postalcode);
            mydatabse.obj_sqlcommand.Parameters.Add(s_authorizedid);
            mydatabse.obj_sqlcommand.Parameters.Add(s_username);
            mydatabse.obj_sqlcommand.Parameters.Add(s_primaryemail);
            mydatabse.obj_sqlcommand.Parameters.Add(s_secondaryemail);
            try
            {
                mydatabse.OpenConnection();
                if (mydatabse.obj_sqlcommand.ExecuteNonQuery() > 0)
                    return "true";
                else
                    return "false";
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                mydatabse.CloseConnection();
                mydatabse.obj_sqlcommand.Dispose();
            }
            return returnvalue;
        }
    }
}