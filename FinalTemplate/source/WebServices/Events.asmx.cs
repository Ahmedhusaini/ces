using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace FinalTemplate.source.WebServices
{
    /// <summary>
    /// Summary description for Events
    /// </summary>
    [WebService(Namespace = "http://ces.edu.pk/Events")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Events : System.Web.Services.WebService
    {
        //to hold the properties and those are only visible to the events class
        private class EventDetails
        {
            public int EventID { get; set; }
            public string Title { get; set; }
            public string Description { get; set; }
            public string Place { get; set; }
            public string Picture { get; set; }
            public string EventCreatorID { get; set; }
        }
        private Database.Database eventDatabase = new Database.Database("cesConnectionString");
        [WebMethod]
        public void GetAllEvents(string _schoolID)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            List<EventDetails> listeventDetails = new List<EventDetails>();
            eventDatabase.CreateConnection();
            eventDatabase.InitializeSQLCommandObject(eventDatabase.GetCurrentConnection, "select * from tbl_events where school_id =@schoolid;");
            eventDatabase.obj_sqlcommand.Parameters.Add("@schoolid", SqlDbType.VarChar, 50).Value = _schoolID;
            try
            {
                eventDatabase.OpenConnection();
                eventDatabase.obj_reader = eventDatabase.obj_sqlcommand.ExecuteReader();
                if (eventDatabase.obj_reader.HasRows)
                {
                    while (eventDatabase.obj_reader.Read())
                    {
                        EventDetails eventDetails = new EventDetails();
                        eventDetails.EventID = Convert.ToInt32(eventDatabase.obj_reader["event_id"]);
                        eventDetails.Title = eventDatabase.obj_reader["title"].ToString();
                        eventDetails.Description = eventDatabase.obj_reader["discription_of_event"].ToString();
                        eventDetails.Place = eventDatabase.obj_reader["place"].ToString();
                        eventDetails.EventCreatorID = eventDatabase.obj_reader["event_creator_id"].ToString();
                        eventDetails.Picture = eventDatabase.obj_reader["event_picture"].ToString();
                        listeventDetails.Add(eventDetails);
                    }
                }
                else
                    HttpContext.Current.Response.Write("No record found with given school id, Try to put a valid id.");
            }
            finally
            {
                eventDatabase.CloseConnection();
                eventDatabase.obj_reader.Close();
                eventDatabase.obj_reader.Dispose();
            }
            HttpContext.Current.Response.Write(serializer.Serialize(listeventDetails));
        }
    }


}
