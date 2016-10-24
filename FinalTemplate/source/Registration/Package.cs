

using FinalTemplate.source.Functions;
using System;

namespace FinalTemplate.source.Registration
{
    public class Package
    {
        //database object
        private Database.Database myDatabase = new Database.Database("cesConnectionString");
        //Defining the package attributes
        #region DatabaseAttributes
        public int PackageID { get; set; }
        public int PackageTypeID { get; set; }
        public int OnlineAdmission { get; set; }
        public int TeacherProfile { get; set; }
        public int PostJobVacancies { get; set; }
        public string Emails { get; set; }
        public string AttendanceForStaff { get; set; }
        public string AttendanceForStudent { get; set; }
        public int Results { get; set; }
        public int FeesStructure { get; set; }
        public string Syllabus { get; set; }
        public string DateSheets { get; set; }
        public string Events { get; set; }
        public string Gallery { get; set; }
        public string Reports { get; set; }
        public int StudentOfTheMonth { get; set; }
        public int AssignmentAndHomework { get; set; }
        public int SMS { get; set; }
        public int EmailAccounts { get; set; }
        public string Notifications { get; set; }
        public int ComparisonOfSchools { get; set; }
        public int SchoolRating { get; set; }
        public int SchoolPublicProfile { get; set; }
        public int SchoolIntroductionVideo { get; set; }
        public string ActiveUsers { get; set; }
        public string SameAccountForOtherBranch { get; set; }
        public string SchoolToSchoolMessage { get; set; }
        public string DatabaseBackup { get; set; }
        public string SecurityAndConfidentiality { get; set; }
        public string DataAvailability { get; set; }
        public int PackageCustomization { get; set; }
        public int PackageTerminationReport { get; set; }
        public string OnlineSupport { get; set; }
        public string DataFilters { get; set; }
        public string AdminPanelType { get; set; }
        public string SchoolID { get; set; }


        #endregion
        //method for assigning these attributes values and insert data into database according to selected package.
        public void InitializePackageAttributes(string packageName, string schoolID)
        {
            if (packageName == "Silver")
            {
                PackageID = Convert.ToInt32(myDatabase.GetLastValueByColumnName("package_id", "tbl_packages")) + 1;
                PackageTypeID = 1;
                OnlineAdmission = 1;
                TeacherProfile = 1;
                PostJobVacancies = 0;
                Emails = "700";
                AttendanceForStaff = "Manual";
                AttendanceForStudent = "No";
                Results = 1;
                FeesStructure = 1;
                Syllabus = "Yes - allow 1 change";
                DateSheets = "unlimited";
                Events = "3";
                Gallery = "no";
                Reports = "Admin can view";
                StudentOfTheMonth = 1;
                AssignmentAndHomework = 1;
                SMS = 1500;
                EmailAccounts = 5;
                Notifications = "Email";
                ComparisonOfSchools = 5;
                SchoolRating = 1;
                SchoolPublicProfile = 0;
                SchoolIntroductionVideo = 0;
                ActiveUsers = "No";
                SchoolToSchoolMessage = "No";
                SameAccountForOtherBranch = "Not Allowed";
                DatabaseBackup = "One when package expires";
                SecurityAndConfidentiality = "High";
                DataAvailability = "High";
                PackageCustomization = 0;
                PackageTerminationReport = 1;
                OnlineSupport = "Yes, by Email";
                DataFilters = "No";
                AdminPanelType = "Basic";
                SchoolID = schoolID;
            }
            else if (packageName == "Gold")
            {
                PackageID = Convert.ToInt32(myDatabase.GetLastValueByColumnName("package_id", "tbl_packages")) + 1;
                PackageTypeID = 2;
                OnlineAdmission = 1;
                TeacherProfile = 1;
                PostJobVacancies = 1;
                Emails = "1500";
                AttendanceForStaff = "Manual";
                AttendanceForStudent = "No";
                Results = 1;
                FeesStructure = 1;
                Syllabus = "Yes - allow 3 change";
                DateSheets = "unlimited";
                Events = "8";
                Gallery = "10 Pics";
                Reports = "Admin/Teacher can view";
                StudentOfTheMonth = 1;
                AssignmentAndHomework = 1;
                SMS = 4000;
                EmailAccounts = 8;
                Notifications = "Email and SMS";
                ComparisonOfSchools = 15;
                SchoolRating = 1;
                SchoolPublicProfile = 1;
                SchoolIntroductionVideo = 0;
                ActiveUsers = "Yes";
                SchoolToSchoolMessage = "3 messages by Email";
                SameAccountForOtherBranch = "Not Allowed";
                DatabaseBackup = "2 on demand";
                SecurityAndConfidentiality = "High";
                DataAvailability = "High";
                PackageCustomization = 0;
                PackageTerminationReport = 1;
                OnlineSupport = "Yes, by Email/SMS";
                DataFilters = "Basic";
                AdminPanelType = "Medium";
                SchoolID = schoolID;
            }
            else if (packageName == "Platinum")
            {
                PackageID = Convert.ToInt32(myDatabase.GetLastValueByColumnName("package_id", "tbl_packages")) + 1;
                PackageTypeID = 3;
                OnlineAdmission = 1;
                TeacherProfile = 1;
                PostJobVacancies = 1;
                Emails = "Unlimited";
                AttendanceForStaff = "Manual/Biometric";
                AttendanceForStudent = "Manual";
                Results = 1;
                FeesStructure = 1;
                Syllabus = "Yes - unlimited changes";
                DateSheets = "unlimited";
                Events = "Unlimited";
                Gallery = "30 Pics";
                Reports = "Admin/Teacher can view & export";
                StudentOfTheMonth = 1;
                AssignmentAndHomework = 1;
                SMS = 7000;
                EmailAccounts = 12;
                Notifications = "Email/SMS";
                ComparisonOfSchools = 20;
                SchoolRating = 1;
                SchoolPublicProfile = 1;
                SchoolIntroductionVideo = 1;
                ActiveUsers = "Yes with identification";
                SchoolToSchoolMessage = "10 by Email/SMS";
                SameAccountForOtherBranch = "extra 4000 per branch";
                DatabaseBackup = "Unlimited on demand";
                SecurityAndConfidentiality = "High";
                DataAvailability = "High";
                PackageCustomization = 1;
                PackageTerminationReport = 1;
                OnlineSupport = "24/7";
                DataFilters = "Advance";
                AdminPanelType = "Advance";
                SchoolID = schoolID;
            }
        }

        public string GetMyPackageID()
        {
            string[,] packageid;
            string[] col = { "package_id" };
            string[] wherecol = { "school_id" };
            string[] whereoperator = { "=" };
            string[] wherevalue = { "'" + JSchool.SchoolID + "'" };
            string[] multiwhere = { "" };
            packageid = myDatabase.SelectQuery("tbl_packages", col, wherecol, whereoperator, wherevalue, multiwhere);
            return packageid[0, 0];
        }
        public bool GetPackageDetailsByID(int _packageid)
        {
            myDatabase.CreateConnection();
            myDatabase.InitializeSQLCommandObject(myDatabase.GetCurrentConnection, "select * from tbl_packages where package_id=@packageid;");
            myDatabase.obj_sqlcommand.Parameters.AddWithValue("@packageid", _packageid);
            try
            {
                myDatabase.OpenConnection();
                myDatabase.obj_reader = myDatabase.obj_sqlcommand.ExecuteReader();
                if (myDatabase.obj_reader.HasRows)
                {
                    while (myDatabase.obj_reader.Read())
                    {
                        PackageID = Convert.ToInt32(myDatabase.obj_reader["package_id"]);
                        OnlineAdmission = Convert.ToInt32(myDatabase.obj_reader["online_admission"]);
                        TeacherProfile = Convert.ToInt32(myDatabase.obj_reader["teacher_profile"]);
                        PostJobVacancies = Convert.ToInt32(myDatabase.obj_reader["post_job_vacancies"]);
                        Emails = myDatabase.obj_reader["emails"].ToString();
                        AttendanceForStaff = myDatabase.obj_reader["attendance_for_staff"].ToString();
                        AttendanceForStudent = myDatabase.obj_reader["attendance_for_students"].ToString();
                        Results = Convert.ToInt32(myDatabase.obj_reader["results"]);
                        FeesStructure = Convert.ToInt32(myDatabase.obj_reader["fee_structure"]);
                        Syllabus = myDatabase.obj_reader["syllabus"].ToString();
                        DateSheets = myDatabase.obj_reader["date_sheets"].ToString();
                        Events = myDatabase.obj_reader["events"].ToString();
                        Gallery = myDatabase.obj_reader["gallery"].ToString();
                        Reports = myDatabase.obj_reader["report"].ToString();
                        StudentOfTheMonth = Convert.ToInt32(myDatabase.obj_reader["student_of_the_month"]);
                        AssignmentAndHomework = Convert.ToInt32(myDatabase.obj_reader["assignment_homework"]);
                        SMS = Convert.ToInt32(myDatabase.obj_reader["sms"]);
                        EmailAccounts = Convert.ToInt32(myDatabase.obj_reader["email_accounts"]);
                        Notifications = myDatabase.obj_reader["notifications"].ToString();
                        ComparisonOfSchools = Convert.ToInt32(myDatabase.obj_reader["comparison_of_schools"]);
                        SchoolRating = Convert.ToInt32(myDatabase.obj_reader["school_rating"]);
                        SchoolPublicProfile = Convert.ToInt32(myDatabase.obj_reader["school_public_profile"]);
                        SchoolIntroductionVideo = Convert.ToInt32(myDatabase.obj_reader["school_intro_video"]);
                        ActiveUsers = myDatabase.obj_reader["active_users"].ToString();
                        SchoolToSchoolMessage = myDatabase.obj_reader["school_to_school_communication"].ToString();
                        SameAccountForOtherBranch = myDatabase.obj_reader["same_account_for_other_branch"].ToString();
                        DatabaseBackup = myDatabase.obj_reader["database_backup"].ToString();
                        SecurityAndConfidentiality = myDatabase.obj_reader["security_confidenctiality"].ToString();
                        DataAvailability = myDatabase.obj_reader["data_availability"].ToString();
                        PackageCustomization = Convert.ToInt32(myDatabase.obj_reader["package_customization"]);
                        PackageTerminationReport = Convert.ToInt32(myDatabase.obj_reader["package_termination_report"]);
                        OnlineSupport = myDatabase.obj_reader["online_support"].ToString();
                        DataFilters = myDatabase.obj_reader["data_filters"].ToString();
                        AdminPanelType = myDatabase.obj_reader["admin_panel_type"].ToString();
                    }
                    return true;
                }
            }
            finally
            {
                myDatabase.CloseConnection();
                myDatabase.obj_reader.Close();
                myDatabase.obj_reader.Dispose();
            }
            return false;
        }

        public string AssignPackage()
        {
            string[] columns = { "package_id", "package_type_id", "online_admission", "teacher_profile", "post_job_vacancies", "emails", "attendance_for_staff", "attendance_for_students", "results", "fee_structure", "syllabus", "date_sheets", "events", "gallery", "report", "student_of_the_month", "assignment_homework", "sms", "email_accounts", "notifications", "comparison_of_schools", "school_rating", "school_public_profile", "school_intro_video", "active_users", "school_to_school_communication", "same_account_for_other_branch", "database_backup", "security_confidenctiality", "data_availability", "package_customization", "package_termination_report", "online_support", "data_filters", "admin_panel_type", "school_id" };
            object[] values = { PackageID, PackageTypeID, OnlineAdmission, TeacherProfile, PostJobVacancies, Emails, AttendanceForStaff, AttendanceForStudent, Results, FeesStructure, Syllabus, DateSheets, Events, Gallery, Reports, StudentOfTheMonth, AssignmentAndHomework, SMS, EmailAccounts, Notifications, ComparisonOfSchools, SchoolRating, SchoolPublicProfile, SchoolIntroductionVideo, ActiveUsers, SchoolToSchoolMessage, SameAccountForOtherBranch, DatabaseBackup, SecurityAndConfidentiality, DataAvailability, PackageCustomization, PackageTerminationReport, OnlineSupport, DataFilters, AdminPanelType, SchoolID };
            int rowsAffected = myDatabase.InsertQuery("tbl_packages", columns, values);
            if (rowsAffected > 0)
                return "true";

            return "false";
        }
    }
}