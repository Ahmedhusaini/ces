using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using FinalTemplate.source.Registration;
using System.Web.Script.Serialization;

namespace FinalTemplate.source.WebServices
{
    /// <summary>
    /// Summary description for Student
    /// </summary>
    [WebService(Namespace = "http://ces.edu.pk/student")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Student : System.Web.Services.WebService
    {
        private ClassSchoolRegistration objSchool = new ClassSchoolRegistration();
        [WebMethod]
        public void GetAllStudentsBySchoolID(string _school_id,string studentfirstname)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            List<FoundStudents> liststudents = new List<FoundStudents>();
            objSchool.myDatabase.CreateConnection();
            objSchool.myDatabase.InitializeSQLCommandObject(objSchool.myDatabase.GetCurrentConnection, "select * from View_StudentGeneralInformation where school_id = '" + _school_id + "' and firstname like'" + studentfirstname + "%'");
            try
            {
                objSchool.myDatabase.OpenConnection();
                objSchool.myDatabase.obj_reader = objSchool.myDatabase.obj_sqlcommand.ExecuteReader();
                if (objSchool.myDatabase.obj_reader.HasRows)
                {
                    while (objSchool.myDatabase.obj_reader.Read())
                    {
                        FoundStudents student = new FoundStudents();
                        student.FirstName = objSchool.myDatabase.obj_reader["firstname"].ToString();
                        student.LastName = objSchool.myDatabase.obj_reader["lastname"].ToString();
                        student.Gender = objSchool.myDatabase.obj_reader["Gender"].ToString();
                        student.photo = objSchool.myDatabase.obj_reader["photo"].ToString();
                        student.PrimaryEmail = objSchool.myDatabase.obj_reader["primary_email"].ToString();
                        student.Address = objSchool.myDatabase.obj_reader["address"].ToString();
                        student.SchoolID = objSchool.myDatabase.obj_reader["school_id"].ToString();
                        student.AuthorizedID = objSchool.myDatabase.obj_reader["authorized_id"].ToString();
                        student.GeneralID = objSchool.myDatabase.obj_reader["General_ID"].ToString();
                        student.Phone = objSchool.myDatabase.obj_reader["phone"].ToString();
                        liststudents.Add(student);
                    }
                }
                else
                    HttpContext.Current.Response.Write("No record found");
            }
            catch { }
            finally
            {
                objSchool.myDatabase.CloseConnection();
                objSchool.myDatabase.obj_sqlcommand.Dispose();
            }
            HttpContext.Current.Response.Write(serializer.Serialize(liststudents));
        }       
    }
    public class FoundStudents
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PrimaryEmail { get; set; }
        public string photo { get; set; }
        public string Phone { get; set; }
        public string Gender { get; set; }
        public string Address { get; set; }
        public string SchoolID { get; set; }
        public string AuthorizedID { get; set; }
        public string GeneralID { get; set; }
    }
}
