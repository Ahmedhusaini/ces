

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
        public bool OnlineAdmission { get; set; }
        public bool TeacherProfile { get; set; }
        public bool PostJobVacancies { get; set; }
        public string Emails { get; set; }
        public string AttendanceForStaff { get; set; }
        public string AttendanceForStudent { get; set; }
        public bool Results { get; set; }
        public bool FeesStructure { get; set; }
        public string Syllabus { get; set; }
        public string DateSheets { get; set; }
        public string Events { get; set; }
        public string Gallery { get; set; }
        public string Reports { get; set; }
        public bool StudentOfTheMonth { get; set; }
        public bool AssignmentAndHomework { get; set; }
        public int SMS { get; set; }
        public int EmailAccounts { get; set; }
        public string Notifications { get; set; }
        public int ComparisonOfSchools { get; set; }
        public bool SchoolRating { get; set; }
        public bool SchoolPublicProfile { get; set; }
        public bool SchoolIntroductionVideo { get; set; }
        public string ActiveUsers { get; set; }
        public string SameAccountForOtherBranch { get; set; }
        public string SchoolToSchoolMessage { get; set; }
        public string DatabaseBackup { get; set; }
        public string SecurityAndConfidentiality { get; set; }
        public string DataAvailability { get; set; }
        public bool PackageCustomization { get; set; }
        public bool PackageTerminationReport { get; set; }
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
                OnlineAdmission = true;
                TeacherProfile = true;
                PostJobVacancies = false;
                Emails = "700";
                AttendanceForStaff = "Manual";
                AttendanceForStudent = "No";
                Results = true;
                FeesStructure = true;
                Syllabus = "Yes - allow 1 change";
                DateSheets = "unlimited";
                Events = "3";
                Gallery = "no";
                Reports = "Admin can view";
                StudentOfTheMonth = true;
                AssignmentAndHomework = true;
                SMS = 1500;
                EmailAccounts = 5;
                Notifications = "Email";
                ComparisonOfSchools = 5;
                SchoolRating = true;
                SchoolPublicProfile = false;
                SchoolIntroductionVideo = false;
                ActiveUsers = "No";
                SchoolToSchoolMessage = "No";
                SameAccountForOtherBranch = "Not Allowed";
                DatabaseBackup = "One when package expires";
                SecurityAndConfidentiality = "High";
                DataAvailability = "High";
                PackageCustomization = false;
                PackageTerminationReport = true;
                OnlineSupport = "Yes, by Email";
                DataFilters = "No";
                AdminPanelType = "Basic";
                SchoolID = schoolID;
            }
            else if (packageName == "Gold")
            {
                PackageID = Convert.ToInt32(myDatabase.GetLastValueByColumnName("package_id", "tbl_packages")) + 1;
                PackageTypeID = 2;
                OnlineAdmission = true;
                TeacherProfile = true;
                PostJobVacancies = true;
                Emails = "1500";
                AttendanceForStaff = "Manual";
                AttendanceForStudent = "No";
                Results = true;
                FeesStructure = true;
                Syllabus = "Yes - allow 3 change";
                DateSheets = "unlimited";
                Events = "8";
                Gallery = "10 Pics";
                Reports = "Admin & Teacher can view";
                StudentOfTheMonth = true;
                AssignmentAndHomework = true;
                SMS = 4000;
                EmailAccounts = 8;
                Notifications = "Email and SMS";
                ComparisonOfSchools = 15;
                SchoolRating = true;
                SchoolPublicProfile = true;
                SchoolIntroductionVideo = false;
                ActiveUsers = "Yes";
                SchoolToSchoolMessage = "3 messages by Email";
                SameAccountForOtherBranch = "Not Allowed";
                DatabaseBackup = "2 on demand";
                SecurityAndConfidentiality = "High";
                DataAvailability = "High";
                PackageCustomization = false;
                PackageTerminationReport = true;
                OnlineSupport = "Yes, by Email/SMS";
                DataFilters = "Basic";
                AdminPanelType = "Medium";
                SchoolID = schoolID;
            }
            else if (packageName == "Platinum")
            {
                PackageID = Convert.ToInt32(myDatabase.GetLastValueByColumnName("package_id", "tbl_packages")) + 1;
                PackageTypeID = 3;
                OnlineAdmission = true;
                TeacherProfile = true;
                PostJobVacancies = true;
                Emails = "Unlimited";
                AttendanceForStaff = "Manual/Biometric";
                AttendanceForStudent = "Manual";
                Results = true;
                FeesStructure = true;
                Syllabus = "Yes - unlimited changes";
                DateSheets = "unlimited";
                Events = "Unlimited";
                Gallery = "30 Pics";
                Reports = "Admin/Teacher can view & export";
                StudentOfTheMonth = true;
                AssignmentAndHomework = true;
                SMS = 7000;
                EmailAccounts = 12;
                Notifications = "Email/SMS";
                ComparisonOfSchools = 20;
                SchoolRating = true;
                SchoolPublicProfile = true;
                SchoolIntroductionVideo = true;
                ActiveUsers = "Yes with identification";
                SchoolToSchoolMessage = "10 by Email/SMS";
                SameAccountForOtherBranch = "extra 4000 per branch";
                DatabaseBackup = "Unlimited on demand";
                SecurityAndConfidentiality = "High";
                DataAvailability = "High";
                PackageCustomization = true;
                PackageTerminationReport = true;
                OnlineSupport = "24/7";
                DataFilters = "Advance";
                AdminPanelType = "Advance";
                SchoolID = schoolID;
            }
        }
    }
}