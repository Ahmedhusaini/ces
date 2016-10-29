using System;
namespace FinalTemplate.source.Functions
{
    public class Login
    {

        public Database.Database myDatabase = new Database.Database("ces");
        public string valideUsername, validePasswoerd;
        public string UserLogin(string username, string password)
        {

            string[] columns = { "username", "password" };
            string[] wherecolumns = { "username", "password" };
            string[] whereoperators = { "=", "=" };
            string[] wherevalues = { valideUsername, validePasswoerd };
            string[] multiplewhereclauseoperators = { " and " };
            var returnedValues = myDatabase.SelectQuery("tbl_authorized_users", columns, wherecolumns, whereoperators, wherevalues, multiplewhereclauseoperators);

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