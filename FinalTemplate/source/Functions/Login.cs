using System;
namespace FinalTemplate.source.Functions
{
    public class Login
    {

        public Database.Database myDatabase = new Database.Database("ces");
        public string valideUsername, validePasswoerd;
        public int valideTypeID;
        public string UserLogin(string username, string password)
        {

            string[] columns = { "username", "password","usertype_id" };
            string[] wherecolumns = { "username", "password" };
            string[] whereoperators = { "=", "=" };
            string[] wherevalues = { valideUsername, validePasswoerd };
            string[] multiplewhereclauseoperators = { " and " };
            var returnedValues = myDatabase.SelectQuery("tbl_authorized_users", columns, wherecolumns, whereoperators, wherevalues, multiplewhereclauseoperators);

            if (returnedValues[0,0]=="null")
                return "false";
            else
            {
                valideUsername = returnedValues[0, 0];
                validePasswoerd = returnedValues[0, 1];
                valideTypeID = int.Parse(returnedValues[0, 2]);
                return "true";
            }
        }
    }
}