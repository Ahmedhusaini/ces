using FinalTemplate.source.Validation;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace FinalTemplate.source.Functions
{
    public class SchoolRelatedFunction
    {
        Database.Database mydb = new Database.Database("cesConnectionString");
        public int AddEvents(string _title, string _description, string _place, int _eventTypeID, string _startingTime, string _endingTime, string _startingDate, string _endingDate, string _creatorID, string _picture)
        {
            string[] blacklist = { _title, _description, _place, _picture };

            if (Jvalidate.FilterBlackLIstKeywords(blacklist))
            {
                int eventid = Convert.ToInt32(mydb.GetLastValueByColumnName("event_id", "tbl_events"));
                int rowsaffected = 0;
                mydb.CreateConnection();
                mydb.InitializeSQLCommandObject(mydb.GetCurrentConnection, "spAddEvent", true);
                SqlParameter p_eventid = new SqlParameter("@eventID", SqlDbType.Int);
                SqlParameter p_title = new SqlParameter("@title", SqlDbType.VarChar, 20);
                SqlParameter p_description = new SqlParameter("@description", SqlDbType.VarChar, 50);
                SqlParameter p_place = new SqlParameter("@place", SqlDbType.VarChar, 20);
                SqlParameter p_eventType = new SqlParameter("@eventType", SqlDbType.Int);
                SqlParameter p_startingTime = new SqlParameter("@startingTime", SqlDbType.VarChar, 5);
                SqlParameter p_endingTime = new SqlParameter("@endingTime", SqlDbType.VarChar, 5);
                SqlParameter p_startDate = new SqlParameter("@startDate", SqlDbType.Date);
                SqlParameter p_endDate = new SqlParameter("@endDate", SqlDbType.Date);
                SqlParameter p_schoolID = new SqlParameter("@schoolID", SqlDbType.VarChar, 50);
                SqlParameter p_eventCreatorID = new SqlParameter("@eventCreatorID", SqlDbType.VarChar, 50);
                SqlParameter p_eventPicture = new SqlParameter("@eventPicture", SqlDbType.VarChar, 50);

                p_eventid.Value = Convert.ToInt32(eventid + 1);
                p_title.Value = _title;
                p_description.Value = _description;
                p_place.Value = _place;
                p_eventType.Value = _eventTypeID;
                p_startingTime.Value = _startingTime;
                p_endingTime.Value = _endingTime;
                p_startDate.Value = Convert.ToDateTime(_startingDate);
                p_endDate.Value = Convert.ToDateTime(_endingDate);
                p_schoolID.Value = JSchool.SchoolID;
                p_eventCreatorID.Value = _creatorID;
                p_eventPicture.Value = _picture;

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
                try
                {
                    mydb.OpenConnection();
                    rowsaffected = mydb.obj_sqlcommand.ExecuteNonQuery();
                }
                catch (Exception exception)
                {
                    HttpContext.Current.Response.Write(exception.ToString());
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
    }
}