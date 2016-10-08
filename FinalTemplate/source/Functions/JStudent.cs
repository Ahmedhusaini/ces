
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace FinalTemplate.source.Functions
{
    public class JStudent
    {
        private Database.Database jstudentDatabase = new Database.Database("cesConnectionString");
        public int GeneralID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int DOBID { get; set; }
        public string Nationality { get; set; }
        public string Gender { get; set; }
        public string Photo { get; set; }
        public string Religion { get; set; }
        public string Phone { get; set; }
        public int LocationID { get; set; }
        public int CountryID { get; set; }
        public int CityID { get; set; }
        public int PostalCode { get; set; }
        public string City { get; set; }
        public int ClassID { get; set; }
        public string Class { get; set; }
        public int SectionID { get; set; }
        public string Section { get; set; }
        public int ClassSectionInformationID { get; set; }
        public string StudentID { get; set; }
        public string GuardianName { get; set; }
        public string PreviousSchool { get; set; }
        public string LastClassAttended { get; set; }
        public string AuthorizedID { get; set; }
        public string SchoolID { get; set; }
        public string GuardianContact { get; set; }
        public int Day { get; set; }
        public int Month { get; set; }
        public int Year { get; set; }
        public string Address { get; set; }

        public string UpdateStudentInformation(int _dob_id, string _dateofbirth, int _loc_id, int _city_id, int _postal_code, int _class_sec_info_id, int _class_id, int _section_id, string _student_id, string _guardianName, string _previous_school, string _last_class_attended, string _guardian_contact, string _firstname, string _lastname, string _nationality, string _religion, string _phone, string _gender, string _address, int _general_id)
        {
            string returnValue = string.Empty;
            int day, month, year;
            day = Convert.ToInt32(_dateofbirth.Substring(0, 2));
            month = Convert.ToInt32(_dateofbirth.Substring(3, 2));
            year = Convert.ToInt32(_dateofbirth.Substring(_dateofbirth.Length - 4, 4));
            jstudentDatabase.CreateConnection();
            jstudentDatabase.InitializeSQLCommandObject(jstudentDatabase.GetCurrentConnection, "spUpdateStudentInformationByAdmin", true);

            SqlParameter p_dobID = new SqlParameter("@dob_id", SqlDbType.Int);
            SqlParameter p_day = new SqlParameter("@day", SqlDbType.Int);
            SqlParameter p_month = new SqlParameter("@month", SqlDbType.Int);
            SqlParameter p_year = new SqlParameter("@year", SqlDbType.Int);
            SqlParameter p_cityID = new SqlParameter("@city_id", SqlDbType.Int);
            SqlParameter p_postalCode = new SqlParameter("@postal_code", SqlDbType.Int);
            SqlParameter p_classSectionInfo = new SqlParameter("@class_sec_info_id", SqlDbType.Int);
            SqlParameter p_classID = new SqlParameter("@class_id", SqlDbType.Int);
            SqlParameter p_sectionID = new SqlParameter("@section_id", SqlDbType.Int);
            SqlParameter p_studentid = new SqlParameter("@student_id", SqlDbType.VarChar, 50);
            SqlParameter p_guardianName = new SqlParameter("@guardianName", SqlDbType.VarChar, 50);
            SqlParameter p_previousSchool = new SqlParameter("@previousSchool", SqlDbType.VarChar, 50);
            SqlParameter p_lastClassAttended = new SqlParameter("@last_class_attended", SqlDbType.VarChar, 10);
            SqlParameter p_guardianContact = new SqlParameter("@guardianContact", SqlDbType.VarChar, 50);
            SqlParameter p_firstname = new SqlParameter("@firstname", SqlDbType.VarChar, 50);
            SqlParameter p_lastname = new SqlParameter("@lastname", SqlDbType.VarChar, 50);
            SqlParameter p_nationality = new SqlParameter("@nationality", SqlDbType.VarChar, 15);
            SqlParameter p_religion = new SqlParameter("@religion", SqlDbType.VarChar, 20);
            SqlParameter p_phone = new SqlParameter("@phone", SqlDbType.VarChar, 50);
            SqlParameter p_gender = new SqlParameter("@gender", SqlDbType.VarChar, 7);
            SqlParameter p_address = new SqlParameter("@address", SqlDbType.VarChar, 50);
            SqlParameter p_generalid = new SqlParameter("@general_id", SqlDbType.Int);
            SqlParameter p_locID = new SqlParameter("@loc_id", SqlDbType.Int);
            p_dobID.Value = _dob_id;
            p_day.Value = day;
            p_month.Value = month;
            p_year.Value = year;
            p_cityID.Value = _city_id;
            p_postalCode.Value = _postal_code;
            p_classSectionInfo.Value = _class_sec_info_id;
            p_classID.Value = _class_id;
            p_sectionID.Value = _section_id;
            p_studentid.Value = _student_id;
            p_guardianName.Value = _guardianName;
            p_previousSchool.Value = _previous_school;
            p_lastClassAttended.Value = _last_class_attended;
            p_guardianContact.Value = _guardian_contact;
            p_firstname.Value = _firstname;
            p_lastname.Value = _lastname;
            p_nationality.Value = _nationality;
            p_religion.Value = _religion;
            p_phone.Value = _phone;
            p_gender.Value = _gender;
            p_address.Value = _address;
            p_generalid.Value = _general_id;
            p_locID.Value = _loc_id;
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_dobID);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_day);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_month);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_year);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_cityID);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_postalCode);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_classSectionInfo);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_sectionID);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_studentid);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_guardianName);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_previousSchool);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_lastClassAttended);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_guardianContact);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_firstname);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_lastname);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_nationality);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_religion);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_phone);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_gender);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_address);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_generalid);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_locID);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_classID);
            try
            {
                jstudentDatabase.OpenConnection();
                if (jstudentDatabase.obj_sqlcommand.ExecuteNonQuery() > 0)
                    returnValue = "true";
                else
                    returnValue = "false";

            }
            catch (Exception exception)
            {
                HttpContext.Current.Response.Write(exception.ToString());
            }
            finally
            {
                jstudentDatabase.CloseConnection();
                jstudentDatabase.obj_sqlcommand.Dispose();
            }
            return returnValue;
        }

        public string PopulateStudentInformationByAdminUsingStudentID(string _StudentID, string _SchoolID)
        {
            string returnValue = string.Empty;
            jstudentDatabase.CreateConnection();
            jstudentDatabase.InitializeSQLCommandObject(jstudentDatabase.GetCurrentConnection, "spGetStudentByStudentIDAndSchoolID", true);
            SqlParameter p_schoolid = new SqlParameter("@school_id", SqlDbType.VarChar, 50);
            SqlParameter p_studentid = new SqlParameter("@student_id", SqlDbType.VarChar, 50);
            p_schoolid.Value = _SchoolID;
            p_studentid.Value = _StudentID;
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_schoolid);
            jstudentDatabase.obj_sqlcommand.Parameters.Add(p_studentid);
            try
            {
                jstudentDatabase.OpenConnection();
                jstudentDatabase.obj_reader = jstudentDatabase.obj_sqlcommand.ExecuteReader();
                if (jstudentDatabase.obj_reader.HasRows)
                {
                    while (jstudentDatabase.obj_reader.Read())
                    {
                        FirstName = jstudentDatabase.obj_reader["firstname"].ToString();
                        LastName = jstudentDatabase.obj_reader["lastname"].ToString();
                        DOBID = Convert.ToInt32(jstudentDatabase.obj_reader["dob_id"]);
                        Day = Convert.ToInt32(jstudentDatabase.obj_reader["day"]);
                        Month = Convert.ToInt32(jstudentDatabase.obj_reader["month"]);
                        Year = Convert.ToInt32(jstudentDatabase.obj_reader["year"]);
                        Nationality = jstudentDatabase.obj_reader["Nationality"].ToString();
                        Gender = jstudentDatabase.obj_reader["Gender"].ToString();
                        Photo = jstudentDatabase.obj_reader["photo"].ToString();
                        Religion = jstudentDatabase.obj_reader["religion"].ToString();
                        Phone = jstudentDatabase.obj_reader["phone"].ToString();
                        Address = jstudentDatabase.obj_reader["address"].ToString();
                        LocationID = Convert.ToInt32(jstudentDatabase.obj_reader["loc_id"]);
                        PostalCode = Convert.ToInt32(jstudentDatabase.obj_reader["postal_code"]);
                        Class = jstudentDatabase.obj_reader["class"].ToString();
                        Section = jstudentDatabase.obj_reader["section"].ToString();
                        SectionID = Convert.ToInt32(jstudentDatabase.obj_reader["section_id"]);
                        ClassID = Convert.ToInt32(jstudentDatabase.obj_reader["class_id"]);
                        ClassSectionInformationID = Convert.ToInt32(jstudentDatabase.obj_reader["class_sec_info_id"]);
                        City = jstudentDatabase.obj_reader["city"].ToString();
                        CityID = Convert.ToInt32(jstudentDatabase.obj_reader["city_id"]);
                        GuardianName = jstudentDatabase.obj_reader["Guardian_Name"].ToString();
                        PreviousSchool = jstudentDatabase.obj_reader["Previous_school"].ToString();
                        GeneralID = Convert.ToInt32(jstudentDatabase.obj_reader["General_Id"]);
                        LastClassAttended = jstudentDatabase.obj_reader["last_class_attended"].ToString();
                        AuthorizedID = jstudentDatabase.obj_reader["authorized_id"].ToString();
                        SchoolID = jstudentDatabase.obj_reader["school_id"].ToString();
                        GuardianContact = jstudentDatabase.obj_reader["gurdian_contact"].ToString();
                        StudentID = jstudentDatabase.obj_reader["Std_id"].ToString();
                    }
                    returnValue = "true";
                }
                else
                    returnValue = "NoRecord";


            }
            catch (Exception exception)
            {
                HttpContext.Current.Response.Write(exception.ToString());
            }
            finally
            {
                jstudentDatabase.CloseConnection();
                jstudentDatabase.obj_reader.Close();
                jstudentDatabase.obj_sqlcommand.Dispose();
            }
            return returnValue;
        }
    }
}