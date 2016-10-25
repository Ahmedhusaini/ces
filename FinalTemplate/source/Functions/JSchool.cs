using System;
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
                { HttpContext.Current.Response.Write("No school id Found"); }
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




    }
}