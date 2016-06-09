using System;
using System.Web.UI.WebControls;

namespace FinalTemplate.source.Functions
{
    public class JFunctions
    {
        public static string GetSystemDate()
        {
            return Convert.ToString(System.DateTime.Today.ToString("d"));
        }

        public static string GetSystemTime()
        {
            return Convert.ToString(System.DateTime.Today.ToString("t"));
        }

        public static void BindDropDownList(DropDownList ddl, string displayField, string valueField, string query)
        {
            Database.Database myDatabase = new Database.Database("cesConnectionString");
            myDatabase.CreateConnection();
            myDatabase.InitializeSQLCommandObject(myDatabase.GetCurrentConnection, query);
            try
            {
                myDatabase.OpenConnection();
                ddl.DataSource = myDatabase.obj_sqlcommand.ExecuteReader();
                ddl.DataTextField = displayField;
                ddl.DataValueField = valueField;
                ddl.DataBind();
            }
            catch (Exception)
            {

            }
        }
    }
}