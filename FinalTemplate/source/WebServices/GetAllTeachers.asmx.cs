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
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class GetAllTeachers : System.Web.Services.WebService
    {
        private Database.Database myDatabase = new Database.Database("cesConnectionString");


        [WebMethod]
        public void GetAllTeachersByFirstName(string SearchKey)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            List<TeacherSearch> listteacherSearches = new List<TeacherSearch>();
            myDatabase.CreateConnection();
            myDatabase.InitializeSQLCommandObject(myDatabase.GetCurrentConnection, "sp_SearchTeacherByFirstName", true);
            myDatabase.obj_sqlcommand.Parameters.AddWithValue("@TeacherName", SearchKey);
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
        public string AuthorizedID { get; set; }
    }
}
