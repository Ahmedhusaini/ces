using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace FinalTemplate.source.Functions
{
    public class CurrentUser
    {
        private Database.Database myDatabase = new Database.Database("cesConnectionString");

        public string AuthorizedID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string PrimaryEmailAddress { get; set; }
        public string SecondaryEmailAddress { get; set; }
        public int UserTypeID { get; set; }
        public string UserType { get; set; }
        public int LoginCount { get; set; }
        public int AccountPin { get; set; }
        public string GeneralID { get; set; }
        public string LastLoginDate { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string DateOfBirth { get; set; }
        public string Nationality { get; set; }
        public string Gender { get; set; }
        public string Photo { get; set; }
        public string Religion { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }

        public void GetAuthorizedDetails(string _authorizedid)
        {
            myDatabase.CreateConnection();
            myDatabase.InitializeSQLCommandObject(myDatabase.GetCurrentConnection, "sp_GetAuthorizedDetailsByAuthorizedID", true);
            try
            {
                myDatabase.OpenConnection();
                SqlParameter p_authorizedID = new SqlParameter("@authorized_id", SqlDbType.VarChar, 20);
                //myDatabase.obj_sqlparameter = new SqlParameter[1];
                //myDatabase.obj_sqlparameter[0].ParameterName = "@authorized_id";
                //myDatabase.obj_sqlparameter[0].SqlDbType = SqlDbType.VarChar;
                //myDatabase.obj_sqlparameter[0].Size = 20;
                //myDatabase.obj_sqlparameter[0].Value = _authorizedid;
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
    }
}