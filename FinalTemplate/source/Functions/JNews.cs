using FinalTemplate.source.Validation;
using System;
using System.Web;
using System.Web.UI.WebControls;

namespace FinalTemplate.source.Functions
{
    public class JNews
    {
        private Database.Database objdbnews = new Database.Database("ces");
        public int NewsID { get; set; }
        public int NewsTypeID { get; set; }
        public string NewsType { get; set; }
        public string Title { get; set; }
        public string Image { get; set; }
        public string Description { get; set; }
        public string Tags { get; set; }
        public string SchoolID { get; set; }
        #region Methods For NEWS
        public string AddNews(int _newstypeid, string _title, string _imgae, string _descrption, string _tags)
        {
            string returnvalue = string.Empty;
            string[] blacklistedKeywords = { _title, _imgae, _descrption, _tags };
            if (Jvalidate.FilterBlackLIstKeywords(blacklistedKeywords))
            {
                int newsID = Convert.ToInt32(objdbnews.GetLastValueByColumnName("news_id", "tbl_news")) + 1;
                objdbnews.CreateConnection();
                objdbnews.InitializeSQLCommandObject(objdbnews.GetCurrentConnection, "spAddNews", true);
                objdbnews.obj_sqlcommand.Parameters.AddWithValue("@newsid", newsID);
                objdbnews.obj_sqlcommand.Parameters.AddWithValue("@newstypeid", _newstypeid);
                objdbnews.obj_sqlcommand.Parameters.AddWithValue("@title", _title);
                objdbnews.obj_sqlcommand.Parameters.AddWithValue("@image", "images/News/" + _imgae);

                objdbnews.obj_sqlcommand.Parameters.AddWithValue("@description", _descrption);
                objdbnews.obj_sqlcommand.Parameters.AddWithValue("@schoolid", JSchool.SchoolID);
                objdbnews.obj_sqlcommand.Parameters.AddWithValue("@tags", _tags);
                try
                {
                    objdbnews.OpenConnection();
                    if (objdbnews.obj_sqlcommand.ExecuteNonQuery() > 0)
                    {
                        returnvalue = "true";
                        //HttpContext.Current.Response.Write("<script>alert('News Added successfully.');</script>");
                    }
                    else
                        returnvalue = "false";
                }
                finally
                {
                    objdbnews.CloseConnection();
                    objdbnews.obj_sqlcommand.Dispose();
                }
            }
            else
            {
                returnvalue = "false";
                //HttpContext.Current.Response.Write("<script>alert('Your input data is not valid, Kindly resubmit the form with valid data.');</script>");
            }
            return returnvalue;
        }
        public string GetNewsDetails(int newsid)
        {
            string returnvalue = string.Empty;
            objdbnews.CreateConnection();
            objdbnews.InitializeSQLCommandObject(objdbnews.GetCurrentConnection, "spGetNewsDetailsByNewsID", true);
            objdbnews.obj_sqlcommand.Parameters.AddWithValue("@newsID", newsid);
            try
            {
                objdbnews.OpenConnection();
                objdbnews.obj_reader = objdbnews.obj_sqlcommand.ExecuteReader();
                if (objdbnews.obj_reader.HasRows)
                {
                    while (objdbnews.obj_reader.Read())
                    {
                        NewsID = Convert.ToInt32(objdbnews.obj_reader["news_id"]);
                        NewsTypeID = Convert.ToInt32(objdbnews.obj_reader["news_type_id"]);
                        Title = objdbnews.obj_reader["news_title"].ToString();
                        Image = objdbnews.obj_reader["news_image"].ToString();
                        Description = objdbnews.obj_reader["news_description"].ToString();
                        Tags = objdbnews.obj_reader["news_tags"].ToString();
                        SchoolID = objdbnews.obj_reader["school_id"].ToString();
                    }
                    returnvalue = "true";
                }
                else
                    returnvalue = "No record";
            }
            finally
            {
                objdbnews.CloseConnection();
                objdbnews.obj_reader.Close();
                objdbnews.obj_reader.Dispose();
            }
            return returnvalue;
        }
        public string UpdateNews(int _newsID, int _newstypeid, string _title, string _imgae, FileUpload _fileUpload, string _descrption, string _tags)
        {
            string returnvalue = string.Empty;
            string[] blacklistedKeywords = { _title, _imgae, _descrption, _tags };
            if (Jvalidate.FilterBlackLIstKeywords(blacklistedKeywords))
            {
                objdbnews.CreateConnection();
                objdbnews.InitializeSQLCommandObject(objdbnews.GetCurrentConnection, "spUpdateNews", true);
                objdbnews.obj_sqlcommand.Parameters.AddWithValue("@newsid", _newsID);
                objdbnews.obj_sqlcommand.Parameters.AddWithValue("@newstypeid", _newstypeid);
                objdbnews.obj_sqlcommand.Parameters.AddWithValue("@title", _title);
                objdbnews.obj_sqlcommand.Parameters.AddWithValue("@image", "/images/News/" + _imgae);
                objdbnews.obj_sqlcommand.Parameters.AddWithValue("@description", _descrption);
                objdbnews.obj_sqlcommand.Parameters.AddWithValue("@schoolid", JSchool.SchoolID);
                objdbnews.obj_sqlcommand.Parameters.AddWithValue("@tags", _tags);
                try
                {
                    objdbnews.OpenConnection();
                    if (objdbnews.obj_sqlcommand.ExecuteNonQuery() > 0)
                    {
                        JFunctions.UploadSingleFile(_fileUpload, "images/News/" + _imgae);
                        returnvalue = "true";
                        //HttpContext.Current.Response.Write("alert('News updated successfully.');");
                    }
                    else
                        returnvalue = "false";
                }
                finally
                {
                    objdbnews.CloseConnection();
                    objdbnews.obj_sqlcommand.Dispose();
                }
            }
            else
            {
                returnvalue = "Invalid Data.";
                HttpContext.Current.Response.Write("alert('Your input data is not valid, Kindly resubmit the form with valid data.');");
            }
            return returnvalue;
        }
        #endregion
    }
}