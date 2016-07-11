using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FinalTemplate.source.Database;
namespace FinalTemplate.source.Functions
{
    public class CurrentUser
    {
        //private static variables to hold the current user's when login
        private static string currentid, primaryemail, secondaryemail,lastlogindate,schoolname,ownername;
        private static int accountpin, logincount;
        //public properties for current user data access.
        public static string UserID 
        {
            get { return currentid; }
            set { currentid = value; }
        }
        public static string PrimaryEmail
        {
            get { return primaryemail; }
            set { primaryemail = value; }
        }
        public static string SecondaryEmail
        {
            get { return secondaryemail; }
            set { secondaryemail = value; }
        }
    }
}