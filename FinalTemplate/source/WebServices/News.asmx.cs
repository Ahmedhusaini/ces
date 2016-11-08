using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using FinalTemplate.source.Database;
using System.Web.Script.Serialization;
using FinalTemplate.source.Functions;
namespace FinalTemplate.source.WebServices
{
    /// <summary>
    /// Summary description for News
    /// </summary>
    [WebService(Namespace = "http://ces.com.pk/news")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class News : System.Web.Services.WebService
    {
        private Database.Database objnews = new Database.Database("ces");
        JavaScriptSerializer objserializer = new JavaScriptSerializer();
        [WebMethod]
        public void GetAllNewsBySchoolID(string _schoolid)
        {
            List<JNews> listnews = new List<JNews>();
            objnews.CreateConnection();
            objnews.InitializeSQLCommandObject(objnews.GetCurrentConnection, "GetAllNews",true);
            objnews.obj_sqlcommand.Parameters.AddWithValue("@schoolID", _schoolid);
            try
            {
                objnews.OpenConnection();
                objnews.obj_reader = objnews.obj_sqlcommand.ExecuteReader();
                if (objnews.obj_reader.HasRows)
                {
                    while (objnews.obj_reader.Read())
                    {
                        JNews newsobj = new JNews();
                        newsobj.NewsTypeID = Convert.ToInt32(objnews.obj_reader["news_type_id"]);
                        newsobj.NewsID = Convert.ToInt32(objnews.obj_reader["news_id"]);
                        newsobj.Title = objnews.obj_reader["news_title"].ToString();
                        newsobj.Description = objnews.obj_reader["news_description"].ToString();
                        newsobj.Tags = objnews.obj_reader["news_tags"].ToString();
                        newsobj.Image = objnews.obj_reader["news_image"].ToString();
                        newsobj.SchoolID = objnews.obj_reader["school_id"].ToString();
                        listnews.Add(newsobj);
                    }
                }
                else
                    HttpContext.Current.Response.Write("No rows found");
            }
            finally
            {
                objnews.CloseConnection();
                objnews.obj_reader.Close();
                objnews.obj_reader.Dispose();
            }
            HttpContext.Current.Response.Write(objserializer.Serialize(listnews));
        }
    }
}
