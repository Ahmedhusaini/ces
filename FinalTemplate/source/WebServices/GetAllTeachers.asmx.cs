using FinalTemplate.source.Registration;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
namespace FinalTemplate.source.WebServices
{
    /// <summary>
    /// Summary description for GetAllTeachers
    /// </summary>
    [WebService(Namespace = "http://ces.edu.pk/getallteachers")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class GetAllTeachers : System.Web.Services.WebService
    {
        private Database.Database myDatabase = new Database.Database("cesConnectionString");
        private ClassSchoolRegistration objSchool = new ClassSchoolRegistration();
        [WebMethod]
        public void GetAllTeachersByFirstName(string SearchKey, string _schoolid)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            List<TeacherSearch> listteacherSearches = new List<TeacherSearch>();
            myDatabase.CreateConnection();
            myDatabase.InitializeSQLCommandObject(myDatabase.GetCurrentConnection, "sp_SearchTeacherByFirstName", true);
            myDatabase.obj_sqlcommand.Parameters.AddWithValue("@TeacherName", SearchKey);
            myDatabase.obj_sqlcommand.Parameters.AddWithValue("@SchoolID", _schoolid);
            try
            {
                DateTime actualDate;
                DateTime date = new DateTime();
                string dateformat = "dd/mm/yyyy";
                myDatabase.OpenConnection();
                myDatabase.obj_reader = myDatabase.obj_sqlcommand.ExecuteReader();
                if (myDatabase.obj_reader.HasRows)
                {
                    while (myDatabase.obj_reader.Read())
                    {
                        TeacherSearch teacherSearch = new TeacherSearch();
                        teacherSearch.FirstName = myDatabase.obj_reader["firstname"].ToString();
                        teacherSearch.LastName = myDatabase.obj_reader["lastname"].ToString();
                        teacherSearch.Photo = myDatabase.obj_reader["photo"].ToString();
                        actualDate = Convert.ToDateTime(myDatabase.obj_reader["date_of_join"]);
                        teacherSearch.DateOfJoin = actualDate.ToString("D");
                        teacherSearch.CNIC = myDatabase.obj_reader["cnic_no"].ToString();
                        teacherSearch.GeneralID = Convert.ToInt32(myDatabase.obj_reader["General_Id"]);
                        teacherSearch.TeacherID = Convert.ToInt32(myDatabase.obj_reader["teacher_id"]);
                        teacherSearch.AuthorizedID = myDatabase.obj_reader["authorized_id"].ToString();
                        teacherSearch.SchoolID = myDatabase.obj_reader["school_id"].ToString();
                        listteacherSearches.Add(teacherSearch);
                    }
                }
                else
                    HttpContext.Current.Response.Write("No teacher record found.");

            }
            catch (Exception exception)
            {
                HttpContext.Current.Response.Write(exception.ToString());
            }
            finally
            {
                myDatabase.CloseConnection();
                myDatabase.obj_reader.Dispose();
            }
            HttpContext.Current.Response.Write(serializer.Serialize(listteacherSearches));

        }
        [WebMethod]
        public void TeacherOFTheMonth(string schoolid)
        {
            List<AllTeachers> teacherList = new List<AllTeachers>();
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            myDatabase.CreateConnection();
            myDatabase.InitializeSQLCommandObject(myDatabase.GetCurrentConnection, "select teacher_id,firstname,lastname,school_id from view_ViewAllTeachers where school_id='" + schoolid + "'");
            try
            {
                myDatabase.OpenConnection();
                myDatabase.obj_reader = myDatabase.obj_sqlcommand.ExecuteReader();
                while (myDatabase.obj_reader.Read())
                {
                    AllTeachers teacher = new AllTeachers();
                    teacher.TeacherID = Convert.ToInt32(myDatabase.obj_reader["teacher_id"]);
                    teacher.FirstName = myDatabase.obj_reader["firstname"].ToString();
                    teacher.LastName = myDatabase.obj_reader["lastname"].ToString();
                    teacher.SchoolID = myDatabase.obj_reader["school_id"].ToString();
                    teacherList.Add(teacher);
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                myDatabase.CloseConnection();
                myDatabase.obj_reader.Dispose();
            }
            HttpContext.Current.Response.Write(serializer.Serialize(teacherList));
        }
        [WebMethod]
        public void GetPrivileges(int _teacherID)
        {
            List<Privileges> privilegesesList = new List<Privileges>();
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            myDatabase.CreateConnection();
            myDatabase.InitializeSQLCommandObject(myDatabase.GetCurrentConnection, "spGetTeacherPrivileges", true);
            myDatabase.obj_sqlcommand.Parameters.AddWithValue("@teacher_id", _teacherID);
            try
            {
                myDatabase.OpenConnection();
                myDatabase.obj_reader = myDatabase.obj_sqlcommand.ExecuteReader();
                if (myDatabase.obj_reader.HasRows)
                {
                    while (myDatabase.obj_reader.Read())
                    {
                        Privileges privilege = new Privileges
                        {
                            PrivilegeID = Convert.ToInt32(myDatabase.obj_reader["privileges_id"]),
                            TeacherID = Convert.ToInt32(myDatabase.obj_reader["teacher_id"]),
                            Event = Convert.ToBoolean(myDatabase.obj_reader["event"]),
                            Attendance = Convert.ToBoolean(myDatabase.obj_reader["attendence"]),
                            Homework = Convert.ToBoolean(myDatabase.obj_reader["homework"]),
                            Reports = Convert.ToBoolean(myDatabase.obj_reader["reports"]),
                            TimeTable = Convert.ToBoolean(myDatabase.obj_reader["timetable"]),
                            DateSheet = Convert.ToBoolean(myDatabase.obj_reader["datesheets"])
                        };
                        privilegesesList.Add(privilege);
                    }
                }

            }
            catch (Exception exception)
            {
                HttpContext.Current.Response.Write(exception.ToString());
            }
            finally
            {
                myDatabase.CloseConnection();
                myDatabase.obj_reader.Close();
                myDatabase.obj_reader.Dispose();
            }
            HttpContext.Current.Response.Write(serializer.Serialize(privilegesesList));
        }
        [WebMethod]
        public void UpdatePrivileges(string _columnName, byte _value, int _teacherid)
        {
            JavaScriptSerializer objserializer = new JavaScriptSerializer();
            myDatabase.CreateConnection();
            myDatabase.InitializeSQLCommandObject(myDatabase.GetCurrentConnection, "update tbl_privileges set " + _columnName + " = @val where teacher_id = @tid");
            myDatabase.obj_sqlcommand.Parameters.AddWithValue("@tid", _teacherid);
            myDatabase.obj_sqlcommand.Parameters.AddWithValue("@val", Convert.ToByte(_value));
            try
            {
                myDatabase.OpenConnection();
                myDatabase.obj_sqlcommand.ExecuteNonQuery();
            }
            finally
            {
                myDatabase.CloseConnection();
                myDatabase.obj_sqlcommand.Dispose();
            }
            HttpContext.Current.Response.Write(objserializer.Serialize("Updated"));
        }

    }

    public class Privileges
    {
        public int PrivilegeID { get; set; }
        public int TeacherID { get; set; }
        public bool Event { get; set; }
        public bool Attendance { get; set; }
        public bool Homework { get; set; }
        public bool Reports { get; set; }
        public bool TimeTable { get; set; }
        public bool DateSheet { get; set; }
    }

    public class AllTeachers
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string SchoolID { get; set; }
        public int TeacherID { get; set; }
    }

    public class TeacherSearch
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Photo { get; set; }
        public string CNIC { get; set; }
        public string DateOfJoin { get; set; }
        public int GeneralID { get; set; }
        public int TeacherID { get; set; }
        public string SchoolID { get; set; }
        public string AuthorizedID { get; set; }
    }

}
