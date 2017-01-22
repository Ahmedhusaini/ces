using FinalTemplate.source.Functions;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
namespace FinalTemplate.source.WebServices
{
    /// <summary>
    /// Summary description for School
    /// </summary>
    [WebService(Namespace = "http://ces.com.pk/school")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class School : System.Web.Services.WebService
    {
        private SchoolRelatedFunction objSchoolRelatedFunction = new SchoolRelatedFunction();
        private Database.Database myDatabase = new Database.Database("ces");
        JavaScriptSerializer objSerializer = new JavaScriptSerializer();

        [WebMethod]
        public void GetNumberOfUsers(string _schoolid)
        {
            IDictionary<string, int> usercount = new ConcurrentDictionary<string, int>();
            usercount["teacher"] = objSchoolRelatedFunction.TotalTeachers(_schoolid);
            usercount["student"] = objSchoolRelatedFunction.TotalStudent(_schoolid);
            usercount["course"] = objSchoolRelatedFunction.TotalCourse(_schoolid);
            usercount["totaluser"] = objSchoolRelatedFunction.TotalStudent(_schoolid) +
                                     objSchoolRelatedFunction.TotalTeachers(_schoolid);
            HttpContext.Current.Response.Write(objSerializer.Serialize(usercount));
        }
        [WebMethod]
        public void CounterForHomePage()
        {
            IDictionary<string, int> userDictionary = new ConcurrentDictionary<string, int>();
            userDictionary["teacher"] = objSchoolRelatedFunction.TotalTeachers();
            userDictionary["parent"] = objSchoolRelatedFunction.TotalParents();
            userDictionary["school"] = objSchoolRelatedFunction.TotalSchools();
            userDictionary["student"] = objSchoolRelatedFunction.TotalStudents();
            HttpContext.Current.Response.Write(objSerializer.Serialize(userDictionary));
        }

        [WebMethod]
        public void Teacherofthemonthphoto(string _schoolid)
        {
            IDictionary<string, string> returnInformation = new Dictionary<string, string>();
            myDatabase.CreateConnection();
            myDatabase.InitializeSQLCommandObject(myDatabase.GetCurrentConnection, "TeacherOfTheMonthImage", true);
            myDatabase.obj_sqlcommand.Parameters.AddWithValue("@schoolid", _schoolid);
            try
            {
                myDatabase.OpenConnection();
                myDatabase.obj_reader = myDatabase.obj_sqlcommand.ExecuteReader();
                if (myDatabase.obj_reader.HasRows)
                {
                    while (myDatabase.obj_reader.Read())
                    {
                        returnInformation["photo"] = myDatabase.obj_reader["photo"].ToString();
                        returnInformation["schoolid"] = myDatabase.obj_reader["school_id"].ToString();
                        returnInformation["teacherid"] = myDatabase.obj_reader["teacher_id"].ToString();
                        returnInformation["firstname"] = myDatabase.obj_reader["firstname"].ToString();
                        returnInformation["lastname"] = myDatabase.obj_reader["lastname"].ToString();
                    }
                }
            }
            finally
            {
                myDatabase.CloseConnection();
                myDatabase.obj_reader.Close();
                myDatabase.obj_reader.Dispose();
            }
            HttpContext.Current.Response.Write(objSerializer.Serialize(returnInformation));
        }

    }
}
