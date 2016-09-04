using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace FinalTemplate.source.Functions
{
    public class CurrentUser
    {
        static private Database.Database myDatabase = new Database.Database("cesConnectionString3");
        //tbl_authorized_users columns
        static public string AuthorizedID { get; set; }
        static public string Username { get; set; }
        static public string Password { get; set; }
        static public int AccountPin { get; set; }
        static public string PrimaryEmailAddress { get; set; }
        static public string SecondaryEmailAddress { get; set; }
        static public int UserTypeID { get; set; }
        static public int LoginCount { get; set; }
        static public string LastLoginDate { get; set; }

        //personal details
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


        static public void username(string _authorizedid)
        {
            myDatabase.CreateConnection();
            myDatabase.InitializeSQLCommandObject(myDatabase.GetCurrentConnection, "sp_selectusername", true);
            try
            {
                myDatabase.OpenConnection();
                SqlParameter p_authorizedID = new SqlParameter("@authorized_id", SqlDbType.VarChar, 20);
                p_authorizedID.Value = _authorizedid;
                myDatabase.obj_sqlcommand.Parameters.Add(p_authorizedID);
                myDatabase.obj_reader = myDatabase.obj_sqlcommand.ExecuteReader();
                if (myDatabase.obj_reader.HasRows)
                {
                    int totalRows = myDatabase.obj_reader.RecordsAffected;
                    while (myDatabase.obj_reader.Read())
                    {
                        FirstName = myDatabase.obj_reader["firstname"].ToString();
                        LastName = myDatabase.obj_reader["lastname"].ToString();
                    }
                }
                else
                {
                    HttpContext.Current.Response.Write("No record found on this authorized id");
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                myDatabase.CloseConnection();
                myDatabase.obj_reader.Close();

            }
        }
        

        static public void GetAuthorizedDetails(string _authorizedid)
        {
            myDatabase.CreateConnection();
            myDatabase.InitializeSQLCommandObject(myDatabase.GetCurrentConnection, "sp_GetAuthorizedDetailsByAuthorizedID", true);
            try
            {
                myDatabase.OpenConnection();
                SqlParameter p_authorizedID = new SqlParameter("@authorized_id", SqlDbType.VarChar, 20);
                p_authorizedID.Value = _authorizedid;
                myDatabase.obj_sqlcommand.Parameters.Add(p_authorizedID);
                myDatabase.obj_reader = myDatabase.obj_sqlcommand.ExecuteReader();
                if (myDatabase.obj_reader.HasRows)
                {
                    int totalRows = myDatabase.obj_reader.RecordsAffected;
                    while (myDatabase.obj_reader.Read())
                    {
                        AuthorizedID = myDatabase.obj_reader["authorized_id"].ToString();
                        Username = myDatabase.obj_reader["username"].ToString();
                        Password = myDatabase.obj_reader["password"].ToString();
                        AccountPin = Convert.ToInt32(myDatabase.obj_reader["account_pin"]);
                        PrimaryEmailAddress = myDatabase.obj_reader["primary_email"].ToString();
                        SecondaryEmailAddress = myDatabase.obj_reader["secondary_email"].ToString();
                        UserTypeID = Convert.ToInt32(myDatabase.obj_reader["usertype_id"]);
                        LoginCount = Convert.ToInt32(myDatabase.obj_reader["login_count"]);
                        LastLoginDate = myDatabase.obj_reader["last_login_date"].ToString();
                    }
                }
                else
                {
                    HttpContext.Current.Response.Write("No record found on this authorized id");
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                myDatabase.CloseConnection();
                myDatabase.obj_reader.Close();

            }
        }

        static public void GetPersonalDetails(int _generalid)
        {
            //teacher,student,parent,principal mein general id hai
            myDatabase.CreateConnection();
            myDatabase.InitializeSQLCommandObject(myDatabase.GetCurrentConnection, "sp_GetGeneralDetailsByGeneralID", true);
            SqlParameter p_generalid = new SqlParameter("@generalid", SqlDbType.Int);
            p_generalid.Value = _generalid;
            myDatabase.obj_sqlcommand.Parameters.Add(p_generalid);
            try
            {
                myDatabase.obj_reader = myDatabase.obj_sqlcommand.ExecuteReader();
                if (myDatabase.obj_reader.HasRows)
                {
                    while (myDatabase.obj_reader.Read())
                    {
                        GeneralID = Convert.ToInt32(myDatabase.obj_reader["General_Id"]);
                        FirstName = myDatabase.obj_reader["firstname"].ToString();
                        LastName = myDatabase.obj_reader["lastname"].ToString();
                        DateOfBirthID = Convert.ToInt32(myDatabase.obj_reader["dob_id"]);
                        Nationality = myDatabase.obj_reader["Nationality"].ToString();
                        Gender = myDatabase.obj_reader["Gender"].ToString();
                        Photo = myDatabase.obj_reader["photo"].ToString();
                        Religion = myDatabase.obj_reader["religion"].ToString();
                        Phone = myDatabase.obj_reader["phone"].ToString();
                        Address = myDatabase.obj_reader["address"].ToString();
                        LocationID = Convert.ToInt32(myDatabase.obj_reader["loc_id"]);
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
                myDatabase.CloseConnection();
                myDatabase.obj_sqlcommand.Parameters.Clear();
            }
        }
    }
}