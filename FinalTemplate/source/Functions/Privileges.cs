using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FinalTemplate.source.Database;

namespace FinalTemplate.source.Functions
{
    public class Privileges
    {
        #region Properties
        public int PrivilegeID { get; set; }
        public int TeacherID { get; set; }
        public bool Event { get; set; }
        public bool Attendance { get; set; }
        public bool HomeWork { get; set; }
        public bool Reports { get; set; }
        public bool TimeTables { get; set; }
        public bool DateSheets { get; set; }
        #endregion
    }
}