

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
        public string PostJobVacancies { get; set; }
        public string Emails { get; set; }
        public string AttendanceForStaff { get; set; }
        public string AttendanceForStudent { get; set; }
        public bool Results { get; set; }
        public bool FreeStructure { get; set; }
        public string Syllabus { get; set; }
        public string DateSheets { get; set; }
        public string Events { get; set; }
        public string Gallery { get; set; }
        public string Reports { get; set; }
        public bool StudentOfTheMonth { get; set; }
        public bool AssignmentAndHomework { get; set; }
        public string SMS { get; set; }
        public string EmailAccounts { get; set; }
        public string Notifications { get; set; }
        public string ComparisonOfSchools { get; set; }
        public bool SchoolRating { get; set; }
        public bool SchoolPublicProfile { get; set; }
        public bool SchoolIntroductionVideo { get; set; }
        public string SameAccountForOtherBranch { get; set; }
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
        public void InitializePackageAttributes(string packageName)
        {
            if (packageName == "Silver")
            {
                PackageID = Convert.ToInt32(myDatabase.GetLastValueByColumnName("package_id", "tbl_packages"));
            }
        }
    }
}