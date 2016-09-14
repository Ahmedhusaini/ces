using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace FinalTemplate.source.Functions
{
    public class Parents 

    {
        static private Database.Database mydatabse = new Database.Database("cesConnectionString3");

        static public string std_id { get; set; }

        static public string authorized { get; set; }

        static public string UserType { get; set; }
        static public int GeneralID { get; set; }
        static public string FirstName { get; set; }
        static public string LastName { get; set; }
        static public int DateOfBirthID { get; set; }
        static public string Nationality { get; set; }
        static public string Gender { get; set; }
        static public string Photo { get; set; }
        static public string Religion { get; set; }
        static public string Phone { get; set; }
        static public string Address { get; set; }
        static public int LocationID { get; set; }


        static public void GetChildDetails(string _authorizedid)
        {
            mydatabse.CreateConnection();
            mydatabse.InitializeSQLCommandObject(mydatabse.GetCurrentConnection, "parents_child", true);
            try
            {
                mydatabse.OpenConnection();
                SqlParameter p_authrizedID = new SqlParameter("@authorized_id", SqlDbType.VarChar, 20);
                p_authrizedID.Value = _authorizedid;
                mydatabse.obj_sqlcommand.Parameters.Add(p_authrizedID);
                mydatabse.obj_reader = mydatabse.obj_sqlcommand.ExecuteReader();
                if (mydatabse.obj_reader.HasRows)
                {
                    int totalRows = mydatabse.obj_reader.RecordsAffected;
                    while (mydatabse.obj_reader.Read())
                    {
                        std_id = mydatabse.obj_reader["Std_id"].ToString();
                        authorized = mydatabse.obj_reader["authorized_id"].ToString();
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
        static public void GetPersonalDetails(int _generalid)
        {
            //teacher,student,parent,principal mein general id hai
            mydatabse.CreateConnection();
            mydatabse.InitializeSQLCommandObject(mydatabse.GetCurrentConnection, "sp_GetGeneralDetailsByGeneralID", true);
            SqlParameter p_generalid = new SqlParameter("@generalid", SqlDbType.Int);
            p_generalid.Value = _generalid;
           mydatabse.obj_sqlcommand.Parameters.Add(p_generalid);
            try
            {
               mydatabse.OpenConnection();
               mydatabse.obj_reader = mydatabse.obj_sqlcommand.ExecuteReader();
               if (mydatabse.obj_reader.HasRows)
                {
                    while (mydatabse.obj_reader.Read())
                    {
                        GeneralID = Convert.ToInt32(mydatabse.obj_reader["General_Id"]);
                        FirstName = mydatabse.obj_reader["firstname"].ToString();
                        LastName = mydatabse.obj_reader["lastname"].ToString();
                        DateOfBirthID = Convert.ToInt32(mydatabse.obj_reader["dob_id"]);
                        Nationality = mydatabse.obj_reader["Nationality"].ToString();
                        Gender = mydatabse.obj_reader["Gender"].ToString();
                        Photo = mydatabse.obj_reader["photo"].ToString();
                        Religion = mydatabse.obj_reader["religion"].ToString();
                        Phone = mydatabse.obj_reader["phone"].ToString();
                        Address = mydatabse.obj_reader["address"].ToString();
                        LocationID = Convert.ToInt32(mydatabse.obj_reader["loc_id"]);
                    }
                }
                else
                {
                    HttpContext.Current.Response.Write("No record found by current general id");
                }
            }
            catch (Exception exception)
            {
                HttpContext.Current.Response.Write(exception.ToString());
            }
            finally
            {
                mydatabse.CloseConnection();
                mydatabse.obj_sqlcommand.Parameters.Clear();
            }
        }
            

        
    }
}