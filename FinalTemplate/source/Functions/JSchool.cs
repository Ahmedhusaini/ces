using FinalTemplate.source.Validation;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace FinalTemplate.source.Functions
{

    public class JSchool
    {
        public static Database.Database mydb = new Database.Database("cesConnectionString");
        public static string SchoolID
        { get { return getschoolid(); } }
        private static string getschoolid()
        {
            string school_id = string.Empty;
            mydb.CreateConnection();
            mydb.InitializeSQLCommandObject(mydb.GetCurrentConnection, "select school_id from tbl_school where authorized_id='" + CurrentUser.AuthorizedID + "'");
            try
            {
                mydb.OpenConnection();
                mydb.obj_reader = mydb.obj_sqlcommand.ExecuteReader();
                if (mydb.obj_reader.HasRows)
                {
                    while (mydb.obj_reader.Read())
                    {
                        school_id = mydb.obj_reader["school_id"].ToString();
                    }
                }
                else
                { HttpContext.Current.Response.Write("No Record Found"); }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                mydb.CloseConnection();
                mydb.obj_reader.Dispose();
                mydb.obj_reader.Close();
            }
            return school_id;
        }

        public int AddEvents(string _title, string _description, string _place, int _eventTypeID, string _startingTime, string _endingTime, string _startingDate, string _endingDate, string _creatorID, string _picture, string _tags)
        {
            string[] blacklist = { _title, _description, _place, _picture, _tags };

            if (Jvalidate.FilterBlackLIstKeywords(blacklist))
            {
                int eventid = Convert.ToInt32(mydb.GetLastValueByColumnName("event_id", "tbl_events"));
                int rowsaffected = 0;
                mydb.CreateConnection();
                mydb.obj_sqlcommand.Connection = mydb.obj_sqlconnection;
                mydb.InitializeSQLCommandObject(mydb.GetCurrentConnection, "spAddEvent", true);
                SqlParameter p_eventid = new SqlParameter("@eventID", SqlDbType.Int);
                SqlParameter p_title = new SqlParameter("@title", SqlDbType.VarChar, 20);
                SqlParameter p_description = new SqlParameter("@description", SqlDbType.VarChar, 50);
                SqlParameter p_place = new SqlParameter("@place", SqlDbType.Int);
                SqlParameter p_eventType = new SqlParameter("@eventType", SqlDbType.Int);
                SqlParameter p_startingTime = new SqlParameter("@startingTime", SqlDbType.Int);
                SqlParameter p_endingTime = new SqlParameter("@endingTime", SqlDbType.Int);
                SqlParameter p_startDate = new SqlParameter("@startDate", SqlDbType.Int);
                SqlParameter p_endDate = new SqlParameter("@endDate", SqlDbType.Int);
                SqlParameter p_schoolID = new SqlParameter("@schoolID", SqlDbType.Int);
                SqlParameter p_eventCreatorID = new SqlParameter("@eventCreatorID", SqlDbType.Int);
                SqlParameter p_eventPicture = new SqlParameter("@eventPicture", SqlDbType.Int);
                SqlParameter p_eventTags = new SqlParameter("@eventTags", SqlDbType.VarChar, 50);
                p_eventid.Value = eventid + 1;
                p_title.Value = _title;
                p_description.Value = _description;
                p_place.Value = _place;
                p_eventType.Value = _eventTypeID;
                p_startingTime.Value = _startingTime;
                p_endingTime.Value = _endingTime;
                p_startDate.Value = _startingDate;
                p_endDate.Value = _endingDate;
                p_schoolID.Value = SchoolID;
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

        public string[,] GetSchoolDetails()
        {
            string[,] result;
            string[] columns = { "authorized_id", "username", "password", "account_pin", "primary_email", "secondary_email", "usertype_id", "login_count", "last_login_date", "loc_id", "country_id", "city_id", "postal_code", "school_id", "school_name", "owner_name", "founded_in", "logo", "contact_primary", "contact_secondary", "school_type_id", "school_type" };
            string[] wherecolumn = { "school_id" };
            string[] whereoperator = { "=" };
            string[] wherevalue = { "'" + SchoolID + "'" };
            string[] multiwhere = { "" };
            result = mydb.SelectQuery("View_SchoolProfile", columns, wherecolumn, whereoperator, wherevalue, multiwhere);
            return result;
        }
    }
}