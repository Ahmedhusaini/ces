using System;
using System.Data;

namespace FinalTemplate.source.Functions
{
    public class JEvents
    {
        private Database.Database objeventdatabase = new Database.Database("ces");
        public int EventID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Place { get; set; }
        public int EventTypeID { get; set; }
        public string StartTime { get; set; }
        public string EndTime { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string Tags { get; set; }

        public bool GetEventDetails(int _id)
        {
            objeventdatabase.CreateConnection();
            objeventdatabase.InitializeSQLCommandObject(objeventdatabase.GetCurrentConnection, "spGetEventDetails", true);
            objeventdatabase.obj_sqlcommand.Parameters.Add("@eventid", SqlDbType.Int).Value = _id;
            try
            {
                objeventdatabase.OpenConnection();
                objeventdatabase.obj_reader = objeventdatabase.obj_sqlcommand.ExecuteReader();
                if (objeventdatabase.obj_reader.HasRows)
                {
                    while (objeventdatabase.obj_reader.Read())
                    {
                        EventID = Convert.ToInt32(objeventdatabase.obj_reader["event_id"]);
                        Title = objeventdatabase.obj_reader["title"].ToString();
                        Description = objeventdatabase.obj_reader["discription_of_event"].ToString();
                        Place = objeventdatabase.obj_reader["place"].ToString();
                        EventTypeID = Convert.ToInt32(objeventdatabase.obj_reader["event_type_id"]);
                        StartTime = objeventdatabase.obj_reader["starting_time"].ToString();
                        EndTime = objeventdatabase.obj_reader["ending_time"].ToString();
                        StartDate = (Convert.ToDateTime(objeventdatabase.obj_reader["start_date"].ToString()).ToString("d")).ToString();
                        EndDate = (Convert.ToDateTime(objeventdatabase.obj_reader["end_date"].ToString()).ToString("d")).ToString();
                        Tags = objeventdatabase.obj_reader["event_tags"].ToString();
                    }
                    return true;
                }
            }
            finally
            {
                objeventdatabase.CloseConnection();
                objeventdatabase.obj_reader.Close();
                objeventdatabase.obj_reader.Dispose();
            }
            return false;
        }

        public string UpdateEvent(string _eventID, string _title, string _description, string _place, int _eventtypeid, string _starttime, string _endtime, string _startdate, string _enddate, string _tags)
        {
            string returnvalue;
            objeventdatabase.CreateConnection();
            objeventdatabase.InitializeSQLCommandObject(objeventdatabase.GetCurrentConnection, "spUpdateEvent", true);
            objeventdatabase.obj_sqlcommand.Parameters.Add("@eventid", SqlDbType.Int).Value = Convert.ToInt32(_eventID);
            objeventdatabase.obj_sqlcommand.Parameters.Add("@title", SqlDbType.VarChar, 20).Value = _title;
            objeventdatabase.obj_sqlcommand.Parameters.Add("@description", SqlDbType.VarChar, 50).Value = _description;
            objeventdatabase.obj_sqlcommand.Parameters.Add("@place", SqlDbType.VarChar, 20).Value = _place;
            objeventdatabase.obj_sqlcommand.Parameters.Add("@eventtype", SqlDbType.Int).Value = _eventtypeid;
            objeventdatabase.obj_sqlcommand.Parameters.Add("@starttime", SqlDbType.VarChar, 50).Value = _starttime;
            objeventdatabase.obj_sqlcommand.Parameters.Add("@endtime", SqlDbType.VarChar, 50).Value = _endtime;
            objeventdatabase.obj_sqlcommand.Parameters.Add("@startdate", SqlDbType.Date).Value =
                Convert.ToDateTime(_startdate);
            objeventdatabase.obj_sqlcommand.Parameters.Add("@enddate", SqlDbType.Date).Value =
                Convert.ToDateTime(_enddate);

            objeventdatabase.obj_sqlcommand.Parameters.Add("@tags", SqlDbType.VarChar, 50).Value = _tags;
            try
            {
                objeventdatabase.OpenConnection();
                if (objeventdatabase.obj_sqlcommand.ExecuteNonQuery() > 0)
                {
                    returnvalue = "true";
                }
                else
                {
                    returnvalue = "false";
                }
            }
            finally
            {
                objeventdatabase.CloseConnection();
                objeventdatabase.obj_sqlcommand.Dispose();
            }
            return returnvalue;
        }
    }
}