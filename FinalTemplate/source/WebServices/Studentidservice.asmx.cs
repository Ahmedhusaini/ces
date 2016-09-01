using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Services;
using System.Web.UI;

namespace FinalTemplate
{
    /// <summary>
    /// Summary description for Studentidservice
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Studentidservice : System.Web.Services.WebService
    {

        [WebMethod]
        [ScriptMethod]
        public void Savestudentid(studentid studentid)
        {
            string cs = ConfigurationManager.ConnectionStrings["cesConnectionString3"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spinsertstudent",con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlParameter parameterstudentidParameter = new SqlParameter()
                {
                    ParameterName = "@Std_id",
                    Value = studentid.Std_id
                };
                cmd.Parameters.Add(parameterstudentidParameter);
                con.Open();
                cmd.ExecuteNonQuery();

            }
        }
    }
}
