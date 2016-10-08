
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