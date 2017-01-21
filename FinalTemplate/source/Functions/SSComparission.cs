using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace FinalTemplate.source.Functions
{
    public class SSComparission
    {
        static private Database.Database mydatabse = new Database.Database("ces");

        static public string school_name { get; set; }
        static public string founnded { get; set; }
        static public string Schoool_type { get; set; }
        static public string country { get; set; }
        static public string city { get; set; }
        static public string campus { get; set; }
        static public string registration { get; set; }
        static public string admission { get; set; }
        static public string security { get; set; }
        static public string annnaul { get; set; }
        static public string tution { get; set; }








        static public void Comparission(string drop)
        {
            mydatabse.CreateConnection();
            mydatabse.InitializeSQLCommandObject(mydatabse.GetCurrentConnection, "sp_comparission", true);
            mydatabse.obj_sqlcommand.Parameters.AddWithValue("@school_name", drop);
            try
            {
                mydatabse.OpenConnection();
                mydatabse.obj_reader = mydatabse.obj_sqlcommand.ExecuteReader();
                if (mydatabse.obj_reader.HasRows)
                {
                    int totalRows = mydatabse.obj_reader.RecordsAffected;
                    while (mydatabse.obj_reader.Read())
                    {

                        school_name = mydatabse.obj_reader["school_name"].ToString();
                        founnded = mydatabse.obj_reader["founded_in"].ToString();
                        Schoool_type = mydatabse.obj_reader["school_type"].ToString();
                        country = mydatabse.obj_reader["country"].ToString();
                        city = mydatabse.obj_reader["city"].ToString();
                        campus = mydatabse.obj_reader["campus_name"].ToString();
                        registration = mydatabse.obj_reader["registration_fees"].ToString();
                        admission = mydatabse.obj_reader["addmission_fees"].ToString();
                        security = mydatabse.obj_reader["security_fees"].ToString();
                        annnaul = mydatabse.obj_reader["annual_fees"].ToString();
                        tution = mydatabse.obj_reader["tuition_fees"].ToString();

                    }

                }
                else
                {
                    HttpContext.Current.Response.Write("No records");
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                mydatabse.CloseConnection();
                mydatabse.obj_reader.Close();
            }
        }
      






       
    }
}