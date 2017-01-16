using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalTemplate.source.Functions
{
    public class studentid
    {
        public Database.Database mydb = new Database.Database("ces");
        public string students;

        public string checkstudentid(string id) {

            string[] col = { "Std_id" };
            string[] wherecol = { "Std_id" };
            string[] whereoperator = { "=" };
            string[] wherevalue ={students};
            string[] whereclauseoperators = { " and " };
            var returnval= mydb.SelectQuery("tbl_Student_Reg", col, wherecol, whereoperator, wherevalue, whereclauseoperators);
             if (String.IsNullOrEmpty(returnval[0, 0]))
                 return "false";
             else
                 students = returnval[0, 0];
             return "true";
        
        }
    }
}