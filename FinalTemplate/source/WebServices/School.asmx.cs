using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using FinalTemplate.source.Functions;
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

        [WebMethod]
        public void GetNumberOfUsers(string _schoolid)
        {
            IDictionary<string, int> usercount = new ConcurrentDictionary<string, int>();
            JavaScriptSerializer objSerializer = new JavaScriptSerializer();
            usercount["teacher"] = objSchoolRelatedFunction.TotalTeachers(_schoolid);
            usercount["student"] = objSchoolRelatedFunction.TotalStudent(_schoolid);
            usercount["course"] = objSchoolRelatedFunction.TotalCourse(_schoolid);
            usercount["totaluser"] = objSchoolRelatedFunction.TotalCourse(_schoolid) +
                                     objSchoolRelatedFunction.TotalStudent(_schoolid) +
                                     objSchoolRelatedFunction.TotalTeachers(_schoolid);
            HttpContext.Current.Response.Write(objSerializer.Serialize(usercount));
        }

    }
}
