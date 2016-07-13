using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using FinalTemplate.source.Database;
using FinalTemplate.source;

namespace FinalTemplate.source.Functions
{
    public class Jfunctionstudents
    {
        public static string GetSystemDate()
        {
            return Convert.ToString(System.DateTime.Today.ToString("d"));
        }

        public static string GetSystemTime()
        {
            return Convert.ToString(System.DateTime.Today.ToString("t"));
        }
        public static void BindDropDownList(DropDownList ddl1, string displayField1, string valueField1, string query1)
        {
            Database.Database myDatabase = new Database.Database("cesConnectionString2");
            myDatabase.CreateConnection();
            myDatabase.InitializeSQLCommandObject(myDatabase.GetCurrentConnection, query1);
            try
            {
                myDatabase.OpenConnection();
                ddl1.DataSource = myDatabase.obj_sqlcommand.ExecuteReader();
                ddl1.DataTextField = displayField1;
                ddl1.DataValueField = valueField1;
                ddl1.DataBind();
            }
            finally
            {
                myDatabase.CloseConnection();
                myDatabase.obj_sqlcommand.Dispose();
            }
        }
    }
}