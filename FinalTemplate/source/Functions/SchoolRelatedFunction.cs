using FinalTemplate.source.Validation;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.WebControls;

namespace FinalTemplate.source.Functions
{
    public class SchoolRelatedFunction
    {
        Database.Database mydb = new Database.Database("ces");
        public string AuthorizedID { get; set; }
        public string Username { get; set; }
        public int AccountPin { get; set; }
        public string PrimaryEmail { get; set; }
        public int LoginCount { get; set; }
        public string SecondaryEmail { get; set; }
        public string PrimaryContact { get; set; }
        public string SecondaryContact { get; set; }
        public int PostalCode { get; set; }
        public int CountryID { get; set; }
        public int LocationID { get; set; }
        public int CityID { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string FoundedIn { get; set; }
        public string OwnerName { get; set; }
        public string SchoolName { get; set; }
        public string SchoolType { get; set; }
        public string LastLoginDate { get; set; }
        public string Logo { get; set; }

        public bool UpdateLastLoginDate()
        {
            string lastLoginDate = string.Empty;
            mydb.CreateConnection();
            mydb.InitializeSQLCommandObject(mydb.GetCurrentConnection, "spLastLoginDate", true);
            mydb.obj_sqlcommand.Parameters.AddWithValue("@date", SqlDbType.Date).Value = JFunctions.GetSystemDate();
            mydb.obj_sqlcommand.Parameters.AddWithValue("@authorizedid", SqlDbType.VarChar).Value = CurrentUser.AuthorizedID;
            try
            {
                mydb.OpenConnection();
                if (mydb.obj_sqlcommand.ExecuteNonQuery() <= 0)
                {
                    return false;
                }
            }
            catch (Exception exception)
            {
                HttpContext.Current.Response.Write(exception.ToString());
            }
            finally
            {
                mydb.CloseConnection();
                mydb.obj_reader.Close();
                mydb.obj_reader.Dispose();
            }
            return true;
        }



        public int TotalStudent(string _schoolID)
        {
            int foundstudent = 0;
            mydb.CreateConnection();
            mydb.InitializeSQLCommandObject(mydb.GetCurrentConnection, "StudentCountBySchoolID", true);
            try
            {
                mydb.obj_sqlcommand.Parameters.AddWithValue("@schoolid", _schoolID);
                mydb.OpenConnection();
                mydb.obj_reader = mydb.obj_sqlcommand.ExecuteReader();
                if (mydb.obj_reader.HasRows)
                {
                    while (mydb.obj_reader.Read())
                    {
                        foundstudent = (int)mydb.obj_reader["TotalStudents"];
                    }
                }
                else
                {
                    return foundstudent;
                }
            }
            finally
            {
                mydb.CloseConnection();
                mydb.obj_reader.Close();
                mydb.obj_reader.Dispose();
            }
            return foundstudent;
        }
        //Returns number of total courses with provided school id.
        public int AddCoordinates(double _longitude, double latitude)
        {
            string[] cols = { "school_id", "longitude", "latitude" };
            object[] vals = { JSchool.SchoolID, _longitude, latitude };
            return mydb.InsertQuery("tbl_maplocation", cols, vals);
        }

        public int PostJob(string _title, string _description, int _jobcategory)
        {
            string[] cols = { "job_title", "job_description", "jcat_id", "school_id" };
            object[] vals = { _title, _description, _jobcategory, JSchool.SchoolID };
            return mydb.InsertQuery("tbl_post_jobs", cols, vals);

        }

        public int TotalCourse(string _schoolID)
        {
            int foundcourse = 0;
            mydb.CreateConnection();
            mydb.InitializeSQLCommandObject(mydb.GetCurrentConnection, "CourseCountBySchoolID", true);
            try
            {
                mydb.obj_sqlcommand.Parameters.AddWithValue("@schoolid", _schoolID);
                mydb.OpenConnection();
                mydb.obj_reader = mydb.obj_sqlcommand.ExecuteReader();
                if (mydb.obj_reader.HasRows)
                {
                    while (mydb.obj_reader.Read())
                    {
                        foundcourse = (int)mydb.obj_reader["CourseCount"];
                    }
                }
                else
                {
                    return foundcourse;
                }
            }
            finally
            {
                mydb.CloseConnection();
                mydb.obj_reader.Close();
                mydb.obj_reader.Dispose();
            }
            return foundcourse;
        }

        public int DefineFeesStructure(string _registrationfees, string _addmissionfees, string _securityfees, string _annualfees, string _tuitionfees, string _transportfees1, string _transportfees2, string _transportfees3, string _transportfees4)
        {
            mydb.CreateConnection();
            mydb.InitializeSQLCommandObject(mydb.GetCurrentConnection, "spDefineFeesStructure", true);
            mydb.obj_sqlcommand.Parameters.Add("@registrationfees", SqlDbType.VarChar, 20).Value = _registrationfees;
            mydb.obj_sqlcommand.Parameters.Add("@addmissionfees", SqlDbType.VarChar, 20).Value = _addmissionfees;
            mydb.obj_sqlcommand.Parameters.Add("@securityfees", SqlDbType.VarChar, 20).Value = _securityfees;
            mydb.obj_sqlcommand.Parameters.Add("@annualfees", SqlDbType.VarChar, 20).Value = _annualfees;
            mydb.obj_sqlcommand.Parameters.Add("@tuitionfees", SqlDbType.VarChar, 20).Value = _tuitionfees;
            mydb.obj_sqlcommand.Parameters.Add("@transport1", SqlDbType.VarChar, 20).Value = _transportfees1;
            mydb.obj_sqlcommand.Parameters.Add("@transport2", SqlDbType.VarChar, 20).Value = _transportfees2;
            mydb.obj_sqlcommand.Parameters.Add("@transport3", SqlDbType.VarChar, 20).Value = _transportfees3;
            mydb.obj_sqlcommand.Parameters.Add("@transport4", SqlDbType.VarChar, 20).Value = _transportfees4;
            mydb.obj_sqlcommand.Parameters.Add("@schoolid", SqlDbType.VarChar, 50).Value = JSchool.SchoolID;
            mydb.obj_sqlcommand.Parameters.Add("@opfeesid", SqlDbType.Int).Direction = ParameterDirection.Output;
            try
            {
                mydb.OpenConnection();
                if (mydb.obj_sqlcommand.ExecuteNonQuery() > 0)
                {
                    return 1;
                }
            }
            catch (Exception exception)
            {
                HttpContext.Current.Response.Write("Error:" + exception.ToString());
            }
            return 0;
        }

        public int TotalTeachers(string _schoolID)
        {
            int foundteachers = 0;
            mydb.CreateConnection();
            mydb.InitializeSQLCommandObject(mydb.GetCurrentConnection, "NumberOfTeachers", true);
            try
            {
                mydb.obj_sqlcommand.Parameters.AddWithValue("@schoolid", _schoolID);
                mydb.OpenConnection();
                mydb.obj_reader = mydb.obj_sqlcommand.ExecuteReader();
                if (mydb.obj_reader.HasRows)
                {
                    while (mydb.obj_reader.Read())
                    {
                        foundteachers = (int)mydb.obj_reader["TotalTeachers"];
                    }
                }
                else
                {
                    return foundteachers;
                }
            }
            finally
            {
                mydb.CloseConnection();
                mydb.obj_reader.Close();
                mydb.obj_reader.Dispose();
            }
            return foundteachers;
        }
        public int TotalTeachers()
        {
            int foundteachers = 0;
            mydb.CreateConnection();
            mydb.InitializeSQLCommandObject(mydb.GetCurrentConnection, "spTotalTeachers", true);
            try
            {
                mydb.OpenConnection();
                mydb.obj_reader = mydb.obj_sqlcommand.ExecuteReader();
                if (mydb.obj_reader.HasRows)
                {
                    while (mydb.obj_reader.Read())
                    {
                        foundteachers = (int)mydb.obj_reader["totalTeacher"];
                    }
                }
                else
                {
                    return foundteachers;
                }
            }
            finally
            {
                mydb.CloseConnection();
                mydb.obj_reader.Close();
                mydb.obj_reader.Dispose();
            }
            return foundteachers;
        }
        public int TotalParents()
        {
            int foundteachers = 0;
            mydb.CreateConnection();
            mydb.InitializeSQLCommandObject(mydb.GetCurrentConnection, "spTotalNumberOfParents", true);
            try
            {
                mydb.OpenConnection();
                mydb.obj_reader = mydb.obj_sqlcommand.ExecuteReader();
                if (mydb.obj_reader.HasRows)
                {
                    while (mydb.obj_reader.Read())
                    {
                        foundteachers = (int)mydb.obj_reader["totalParents"];
                    }
                }
                else
                {
                    return foundteachers;
                }
            }
            finally
            {
                mydb.CloseConnection();
                mydb.obj_reader.Close();
                mydb.obj_reader.Dispose();
            }
            return foundteachers;
        }
        public int TotalSchools()
        {
            int foundschools = 0;
            mydb.CreateConnection();
            mydb.InitializeSQLCommandObject(mydb.GetCurrentConnection, "spTotalSchools", true);
            try
            {
                mydb.OpenConnection();
                mydb.obj_reader = mydb.obj_sqlcommand.ExecuteReader();
                if (mydb.obj_reader.HasRows)
                {
                    while (mydb.obj_reader.Read())
                    {
                        foundschools = (int)mydb.obj_reader["totalSchools"];
                    }
                }
                else
                {
                    return foundschools;
                }
            }
            finally
            {
                mydb.CloseConnection();
                mydb.obj_reader.Close();
                mydb.obj_reader.Dispose();
            }
            return foundschools;
        }
        public int TotalStudents()
        {
            int foundstudents = 0;
            mydb.CreateConnection();
            mydb.InitializeSQLCommandObject(mydb.GetCurrentConnection, "spTotalStudents", true);
            try
            {
                mydb.OpenConnection();
                mydb.obj_reader = mydb.obj_sqlcommand.ExecuteReader();
                if (mydb.obj_reader.HasRows)
                {
                    while (mydb.obj_reader.Read())
                    {
                        foundstudents = (int)mydb.obj_reader["totalStudents"];
                    }
                }
                else
                {
                    return foundstudents;
                }
            }
            finally
            {
                mydb.CloseConnection();
                mydb.obj_reader.Close();
                mydb.obj_reader.Dispose();
            }
            return foundstudents;
        }


        public string GetSchoolDetails()
        {
            string valuereturned = string.Empty;
            mydb.CreateConnection();
            mydb.InitializeSQLCommandObject(mydb.GetCurrentConnection, "spGetSchoolDetailsByID", true);
            mydb.obj_sqlcommand.Parameters.Add("@schoolid", SqlDbType.VarChar, 50).Value = JSchool.SchoolID;
            try
            {
                mydb.OpenConnection();
                mydb.obj_reader = mydb.obj_sqlcommand.ExecuteReader();
                if (mydb.obj_reader.HasRows)
                {
                    while (mydb.obj_reader.Read())
                    {
                        AuthorizedID = mydb.obj_reader["authorized_id"].ToString();
                        Username = mydb.obj_reader["username"].ToString();
                        AccountPin = Convert.ToInt32(mydb.obj_reader["account_pin"]);
                        PrimaryEmail = mydb.obj_reader["primary_email"].ToString();
                        SecondaryEmail = mydb.obj_reader["secondary_email"].ToString();
                        PrimaryContact = mydb.obj_reader["contact_primary"].ToString();
                        SecondaryContact = mydb.obj_reader["contact_secondary"].ToString();
                        PostalCode = Convert.ToInt32(mydb.obj_reader["postal_code"]);
                        CountryID = Convert.ToInt32(mydb.obj_reader["country_id"]);
                        CityID = Convert.ToInt32(mydb.obj_reader["city_id"]);
                        Country = mydb.obj_reader["country"].ToString();
                        City = mydb.obj_reader["city"].ToString();
                        FoundedIn = mydb.obj_reader["founded_in"].ToString();
                        OwnerName = mydb.obj_reader["owner_name"].ToString();
                        SchoolName = mydb.obj_reader["school_name"].ToString();
                        SchoolType = mydb.obj_reader["school_type"].ToString();
                        LoginCount = Convert.ToInt32(mydb.obj_reader["login_count"]);
                        LastLoginDate = mydb.obj_reader["last_login_date"].ToString();
                        LocationID = Convert.ToInt32(mydb.obj_reader["loc_id"]);
                    }
                    valuereturned = "true";
                }
                else
                {
                    valuereturned = "false";
                }
            }
            finally
            {
                mydb.CloseConnection();
                mydb.obj_reader.Close();
                mydb.obj_reader.Dispose();
            }
            return valuereturned;
        }

        public string UpdateSchoolInformation(string _username, int _account_pin, string _primary_email, string _secondary_email, string _authorized_id, int _country_id, int _city_id, int _postal_code, int _loc_id, string _school_name, string _owner_name, string _founded_in, string _contact_primary, string _contact_secondary, string _school_id)
        {
            string value = string.Empty;
            mydb.CreateConnection();
            mydb.InitializeSQLCommandObject(mydb.GetCurrentConnection, "spUpdateSchoolProfile", true);
            mydb.obj_sqlcommand.Parameters.Add("@username", SqlDbType.VarChar, 50).Value = _username;
            mydb.obj_sqlcommand.Parameters.Add("@account_pin", SqlDbType.Int).Value = _account_pin;
            mydb.obj_sqlcommand.Parameters.Add("@primary_email", SqlDbType.VarChar, 50).Value = _primary_email;
            mydb.obj_sqlcommand.Parameters.Add("@secondary_email", SqlDbType.VarChar, 50).Value = _secondary_email;
            mydb.obj_sqlcommand.Parameters.Add("@authorized_id", SqlDbType.VarChar, 50).Value = _authorized_id;
            mydb.obj_sqlcommand.Parameters.Add("@country_id", SqlDbType.Int).Value = _country_id;
            mydb.obj_sqlcommand.Parameters.Add("@city_id", SqlDbType.Int).Value = _city_id;
            mydb.obj_sqlcommand.Parameters.Add("@postal_code", SqlDbType.Int).Value = _postal_code;
            mydb.obj_sqlcommand.Parameters.Add("@loc_id", SqlDbType.Int).Value = _loc_id;
            mydb.obj_sqlcommand.Parameters.Add("@school_name", SqlDbType.VarChar, 50).Value = _school_name;
            mydb.obj_sqlcommand.Parameters.Add("@owner_name", SqlDbType.VarChar, 50).Value = _owner_name;
            mydb.obj_sqlcommand.Parameters.Add("@founded_in", SqlDbType.DateTime).Value = Convert.ToDateTime(_founded_in);
            mydb.obj_sqlcommand.Parameters.Add("@contact_primary", SqlDbType.VarChar, 20).Value = _contact_primary;
            mydb.obj_sqlcommand.Parameters.Add("@contact_secondary", SqlDbType.VarChar, 20).Value = _contact_secondary;
            mydb.obj_sqlcommand.Parameters.Add("@school_id", SqlDbType.VarChar, 50).Value = _school_id;
            try
            {
                mydb.OpenConnection();
                if (mydb.obj_sqlcommand.ExecuteNonQuery() > 0)
                {
                    value = "true";
                }
                else
                {
                    value = "false";
                }
            }
            finally
            {
                mydb.CloseConnection();
                mydb.obj_sqlcommand.Dispose();
            }
            return value;
        }
        public int AddEvents(FileUpload _fileUpload, string _title, string _description, string _place, int _eventTypeID, string _startingTime, string _endingTime, string _startingDate, string _endingDate, string _creatorID, string _picture, string _tags)
        {
            string[] blacklist = { _title, _description, _place, _picture };

            if (Jvalidate.FilterBlackLIstKeywords(blacklist))
            {
                int eventid = Convert.ToInt32(mydb.GetLastValueByColumnName("event_id", "tbl_events"));
                int rowsaffected = 0;
                mydb.CreateConnection();
                mydb.InitializeSQLCommandObject(mydb.GetCurrentConnection, "spAddEvent", true);
                SqlParameter p_eventid = new SqlParameter("@eventID", SqlDbType.Int);
                SqlParameter p_title = new SqlParameter("@title", SqlDbType.VarChar, 20);
                SqlParameter p_description = new SqlParameter("@description", SqlDbType.VarChar, 50);
                SqlParameter p_place = new SqlParameter("@place", SqlDbType.VarChar, 20);
                SqlParameter p_eventType = new SqlParameter("@eventType", SqlDbType.Int);
                SqlParameter p_startingTime = new SqlParameter("@startingTime", SqlDbType.VarChar, 5);
                SqlParameter p_endingTime = new SqlParameter("@endingTime", SqlDbType.VarChar, 5);
                SqlParameter p_startDate = new SqlParameter("@startDate", SqlDbType.Date);
                SqlParameter p_endDate = new SqlParameter("@endDate", SqlDbType.Date);
                SqlParameter p_schoolID = new SqlParameter("@schoolID", SqlDbType.VarChar, 50);
                SqlParameter p_eventCreatorID = new SqlParameter("@eventCreatorID", SqlDbType.VarChar, 50);
                SqlParameter p_eventPicture = new SqlParameter("@eventPicture", SqlDbType.VarChar, 50);
                SqlParameter p_eventTags = new SqlParameter("@eventTags", SqlDbType.VarChar, 50);

                p_eventid.Value = Convert.ToInt32(eventid + 1);
                p_title.Value = _title;
                p_description.Value = _description;
                p_place.Value = _place;
                p_eventType.Value = _eventTypeID;
                p_startingTime.Value = _startingTime;
                p_endingTime.Value = _endingTime;
                p_startDate.Value = Convert.ToDateTime(_startingDate);
                p_endDate.Value = Convert.ToDateTime(_endingDate);
                p_schoolID.Value = JSchool.SchoolID;
                p_eventCreatorID.Value = _creatorID;
                p_eventPicture.Value = _picture;
                p_eventTags.Value = _tags;

                mydb.obj_sqlcommand.Parameters.Add(p_eventid);
                mydb.obj_sqlcommand.Parameters.Add(p_title);
                mydb.obj_sqlcommand.Parameters.Add(p_description);
                mydb.obj_sqlcommand.Parameters.Add(p_place);
                mydb.obj_sqlcommand.Parameters.Add(p_eventType);
                mydb.obj_sqlcommand.Parameters.Add(p_startingTime);
                mydb.obj_sqlcommand.Parameters.Add(p_endingTime);
                mydb.obj_sqlcommand.Parameters.Add(p_startDate);
                mydb.obj_sqlcommand.Parameters.Add(p_endDate);
                mydb.obj_sqlcommand.Parameters.Add(p_schoolID);
                mydb.obj_sqlcommand.Parameters.Add(p_eventCreatorID);
                mydb.obj_sqlcommand.Parameters.Add(p_eventPicture);
                mydb.obj_sqlcommand.Parameters.Add(p_eventTags);
                try
                {
                    mydb.OpenConnection();
                    rowsaffected = mydb.obj_sqlcommand.ExecuteNonQuery();
                    JFunctions.UploadSingleFile(_fileUpload, "images/Events/" + _picture);
                }
                catch (Exception exception)
                {
                    HttpContext.Current.Response.Write(exception.ToString());
                }
                finally
                {
                    mydb.CloseConnection();
                    mydb.obj_sqlcommand.Dispose();
                }
                return rowsaffected;
            }
            return 0;
        }
    }
}
