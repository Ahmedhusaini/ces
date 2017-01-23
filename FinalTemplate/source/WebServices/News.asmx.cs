using FinalTemplate.source.Functions;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
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
        public void GetTopFourJobs()
        {
            List<IDictionary<string, object>> ListJobs = new List<IDictionary<string, object>>();
            objnews.CreateConnection();
            objnews.InitializeSQLCommandObject(objnews.GetCurrentConnection, "select top 4 j.job_title,j.job_description,c.job_category,s.school_name,s.contact_primary from tbl_post_jobs as j inner join tbl_job_category as c on j.jcat_id=c.jcat_id inner join tbl_school as s on j.school_id=s.school_id order by j.pj_id desc;");
            try
            {
                objnews.OpenConnection();
                objnews.obj_reader = objnews.obj_sqlcommand.ExecuteReader();
                if (objnews.obj_reader.HasRows)
                {
                    while (objnews.obj_reader.Read())
                    {
                        IDictionary<string, object> jobsDictionary = new ConcurrentDictionary<string, object>();
                        jobsDictionary["job_title"] = objnews.obj_reader["job_title"].ToString();
                        jobsDictionary["job_discription"] = objnews.obj_reader["job_description"].ToString();
                        jobsDictionary["job_category"] = objnews.obj_reader["job_category"].ToString();
                        jobsDictionary["school_name"] = objnews.obj_reader["school_name"].ToString();
                        jobsDictionary["contact_primary"] = objnews.obj_reader["contact_primary"].ToString();
                        ListJobs.Add(jobsDictionary);
                    }
                }
            }
            catch (Exception exception)
            {
                HttpContext.Current.Response.Write(objserializer.Serialize(exception));
            }
            finally
            {
                objnews.CloseConnection();
                objnews.obj_reader.Close();
                objnews.obj_reader.Dispose();
            }
            HttpContext.Current.Response.Write(objserializer.Serialize(ListJobs));
        }

        [WebMethod]
        public void GetTopThreeNews()
        {
            List<IDictionary<string, object>> listOfNews = new List<IDictionary<string, object>>();
            objnews.CreateConnection();
            objnews.InitializeSQLCommandObject(objnews.GetCurrentConnection, "select top 3 * from View_AllNews order by news_id desc");
            try
            {
                objnews.OpenConnection();
                objnews.obj_reader = objnews.obj_sqlcommand.ExecuteReader();
                if (objnews.obj_reader.HasRows)
                {
                    while (objnews.obj_reader.Read())
                    {
                        IDictionary<string, object> newsDictionary = new ConcurrentDictionary<string, object>();
                        newsDictionary["newsid"] = Convert.ToInt32(objnews.obj_reader["news_id"]);
                        newsDictionary["newstype"] = objnews.obj_reader["news_type"].ToString();
                        newsDictionary["newstitle"] = objnews.obj_reader["news_title"].ToString();
                        newsDictionary["newsimage"] = objnews.obj_reader["news_image"].ToString();
                        newsDictionary["newsdiscription"] = objnews.obj_reader["news_description"].ToString();
                        newsDictionary["schoolid"] = objnews.obj_reader["school_id"].ToString();
                        newsDictionary["newstags"] = objnews.obj_reader["news_tags"].ToString();
                        listOfNews.Add(newsDictionary);
                    }
                }
            }
            catch (Exception exception)
            {
                HttpContext.Current.Response.Write(objserializer.Serialize(exception));
            }
            finally
            {
                objnews.CloseConnection();
                objnews.obj_reader.Close();
                objnews.obj_reader.Dispose();
            }
            HttpContext.Current.Response.Write(objserializer.Serialize(listOfNews));
        }

        [WebMethod]
        public void GetLastNewsBySchoolID(string _schoolid)
        {
            List<JNews> listlastnews = new List<JNews>();
            objnews.CreateConnection();
            objnews.InitializeSQLCommandObject(objnews.GetCurrentConnection, "spLastNewsBySchoolID", true);
            objnews.obj_sqlcommand.Parameters.AddWithValue("@schoolid", _schoolid);
            try
            {
                objnews.OpenConnection();
                objnews.obj_reader = objnews.obj_sqlcommand.ExecuteReader();
                if (objnews.obj_reader.HasRows)
                {
                    while (objnews.obj_reader.Read())
                    {
                        JNews objn = new JNews();
                        objn.Image = objnews.obj_reader["news_image"].ToString();
                        objn.NewsType = objnews.obj_reader["news_type"].ToString();
                        objn.Title = objnews.obj_reader["news_title"].ToString();
                        objn.Description = objnews.obj_reader["news_description"].ToString();
                        objn.NewsID = (int)objnews.obj_reader["news_id"];
                        listlastnews.Add(objn);
                    }
                }
            }
            finally
            {
                objnews.CloseConnection();
                objnews.obj_reader.Close();
                objnews.obj_reader.Dispose();
            }
            HttpContext.Current.Response.Write(objserializer.Serialize(listlastnews));
        }
        [WebMethod]
        public void GetAllNewsBySchoolID(string _schoolid)
        {
            List<JNews> listnews = new List<JNews>();
            objnews.CreateConnection();
            objnews.InitializeSQLCommandObject(objnews.GetCurrentConnection, "GetAllNews", true);
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
                        newsobj.NewsType = objnews.obj_reader["news_type"].ToString();
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
