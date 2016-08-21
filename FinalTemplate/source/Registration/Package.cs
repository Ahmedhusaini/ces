

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
                SameAccountForOtherBranch = "No";
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
                SameAccountForOtherBranch = "No";
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
            else if (packageName == "Platinum")
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
                SameAccountForOtherBranch = "No";
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
        }
    }
}