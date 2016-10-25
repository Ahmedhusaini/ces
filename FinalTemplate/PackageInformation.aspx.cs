using FinalTemplate.source.Registration;
using System;

namespace FinalTemplate
{
    public partial class PackageInformation : System.Web.UI.Page
    {
        private Package objPackage = new Package();
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowDetails();
        }

        private void ShowDetails()
        {
            string totalsms = string.Empty;
            string totalEmailAccounts = string.Empty;
            objPackage.GetPackageDetailsByID(objPackage.GetMyPackageID());
            if (objPackage.PackageTypeID == 1)
            {
                lblPackageName.Text = "Silver";
                totalEmailAccounts = "5";
                totalsms = "1500";
            }
            else if (objPackage.PackageTypeID == 2)
            {
                lblPackageName.Text = "Gold";
                totalEmailAccounts = "8";
                totalsms = "4000";
            }
            else if (objPackage.PackageTypeID == 3)
            {
                lblPackageName.Text = "Platinum";
                totalsms = "7000";
                totalEmailAccounts = "12";
            }

            lblPackageTypeID.Text = objPackage.PackageTypeID.ToString();

            if (objPackage.OnlineAdmission == 1)
                lblOnlineAddmissions.Text = "Yes, Students can take addmissions in your school via CES online addmission portal.";
            else
                lblOnlineAddmissions.Text = "No, This feature is not included in your package";

            if (objPackage.TeacherProfile == 1)
                lblTeacherProfile.Text = "Yes, All teachers who are registered at your school will have this feature.";
            else
                lblTeacherProfile.Text = "No, This feature is not included in your package";

            if (objPackage.PostJobVacancies == 1)
                lblPostJobVacancies.Text = "Yes, You can post job vacancies via CES JOB portal.";
            else
                lblPostJobVacancies.Text = "No, This feature is not included in your package";

            lblEmails.Text = objPackage.Emails;
            lblAttendanceForStaff.Text = objPackage.AttendanceForStaff;
            lblAttendanceForStudents.Text = objPackage.AttendanceForStudent;

            if (objPackage.Results == 1)
                lblResults.Text = "Yes, You can make results and publish them as well.";
            else
                lblResults.Text = "No, This feature is not included in your package";

            if (objPackage.FeesStructure == 1)
                lblFeeStructure.Text = "Yes, Define you fee structure according to your school policy/standard.";
            else
                lblFeeStructure.Text = "No, This feature is not included in your package";

            lblSyllabus.Text = objPackage.Syllabus;
            lblDateSheets.Text = objPackage.DateSheets;
            lblEvents.Text = objPackage.Events;
            lblGallery.Text = objPackage.Gallery;
            lblReports.Text = objPackage.Reports;

            if (objPackage.StudentOfTheMonth == 1)
                lblStudentOfTheMonth.Text = "Yes, You can make any student from any class as student of the month.";
            else
                lblStudentOfTheMonth.Text = "No, This feature is not included in your package";

            if (objPackage.AssignmentAndHomework == 1)
                lblAssignmentsAndHomework.Text = "Yes, Teachers can post assignments and homeworks to students from CES portal which makes their job easy.";
            else
                lblAssignmentsAndHomework.Text = "No, This feature is not included in your package";

            lblSMS.Text = objPackage.SMS + "(s) Left from total of " + totalsms;

            lblEmailAccounts.Text = objPackage.EmailAccounts + "(s) Left from total of " + totalEmailAccounts;
            lblNotifications.Text = objPackage.Notifications;
            lblComparisonOfSchools.Text = objPackage.ComparisonOfSchools.ToString();

            if (objPackage.SchoolRating == 1)
                lblSchoolRating.Text = "Yes, You can view your school rating based on your results and other activities.";
            else
                lblSchoolRating.Text = "No, This feature is not included in your package";

            if (objPackage.SchoolPublicProfile == 1)
                lblSchoolPublicProfile.Text = "Yes, You can create your school's public profile as well.";
            else
                lblSchoolPublicProfile.Text = "No, This feature is not included in your package";

            if (objPackage.SchoolIntroductionVideo == 1)
                lblSchoolIntroductionVideo.Text = "Yes, You can create your school's introduction video which show to people who search of schools in CES portal.";
            else
                lblSchoolIntroductionVideo.Text = "No, This feature is not included in your package";

            lblActiveUsers.Text = objPackage.ActiveUsers;
            lblSchoolToSchoolCommunication.Text = objPackage.SchoolToSchoolMessage;
            lblSameAccountForOtherBranches.Text = objPackage.SameAccountForOtherBranch;
            lblDatabaseBackup.Text = objPackage.DatabaseBackup;
            lblSecurityAndConfidentiality.Text = objPackage.SecurityAndConfidentiality;
            lblDataAvailability.Text = objPackage.DataAvailability;
            lblPackageCustomization.Text = objPackage.PackageCustomization.ToString();

            if (objPackage.PackageTerminationReport == 1)
                lblPackageTerminationReport.Text =
                    "Yes, You will get a package termination report at the end of your package time period.";
            else
                lblPackageTerminationReport.Text = "No, This feature is not included in your package";

            lblOnlineSupport.Text = objPackage.OnlineSupport;
            lblDataFilters.Text = objPackage.DataFilters;
            lblAdminPanelType.Text = objPackage.AdminPanelType;
        }
    }
}