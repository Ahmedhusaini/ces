using System;

namespace FinalTemplate.source.Functions
{
    public class Login
    {
        private Database.Database myDatabase = new Database.Database("cesConnectionString");
        private string valideUsername, validePasswoerd;
        public string UserLogin(string username, string password)
        {
            string[] columns = { "username", "password" };
            var returnedValues = myDatabase.SelectQuery("tbl_authorized_users", columns);

            if (String.IsNullOrEmpty(returnedValues[0, 0]) && String.IsNullOrEmpty(returnedValues[0, 1]))
                return "false";
            else
            {
                valideUsername = returnedValues[0, 0];
                validePasswoerd = returnedValues[0, 1];
                return "true";
            }
        }
    }
}