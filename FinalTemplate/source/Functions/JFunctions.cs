using System;

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
    }
}