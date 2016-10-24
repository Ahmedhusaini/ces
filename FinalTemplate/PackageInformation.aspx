<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="PackageInformation.aspx.cs" Inherits="FinalTemplate.PackageInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
    <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#back-top').remove();
            $('.heading-table').css('background-color', '#a0522d');

        });

        function radiobuttonalignment(control) {
            $(control).css('margin', '0px 5px 0px 40px');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
     <div class="section section-padding top-courses">
        <div class="container">
            <div class="group-title-index">
                <h2 class="center-title">View Package Information</h2>
                <div class="bottom-title"><i class="bottom-icon icon-icon-04"></i></div>
                <p>Here you can view your remaining amount of features left. You can make use of this page to view included features in your page as well.</p>
                <div class="container teacher-course-wrapper">
                     <div class="inner-container">
                        <div class="table-header">
                            <table class="edu-table-responsive">
                                <thead>
                                   <tr class="heading-table">
                                        <th class="col-3">Your Package Details</th>
                                   </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Package Name</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblPackageName"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Package Type ID</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblPackageTypeID"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Online Addmissions</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblOnlineAddmissions"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Teacher Profile</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblTeacherProfile"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Post Job Vacancies</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblPostJobVacancies"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Emails</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblEmails"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Attendance For Staff</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblAttendanceForStaff"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Attendance For Students</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblAttendanceForStudents"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Results</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblResults"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Fee Structure</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblFeeStructure"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Syllabus</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblSyllabus"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Date Sheets</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblDateSheets"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Events</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblEvents"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Gallery</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblGallery"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Reports</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblReports"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Student OF The Month</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblStudentOfTheMonth"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Assignments and Homework</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblAssignmentsAndHomework"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>SMS</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblSMS"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Email Accounts</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblEmailAccounts"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Notifications</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblNotifications"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Comparison Of Schools</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblComparisonOfSchools"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>School Rating</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblSchoolRating"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>School Public Profile</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblSchoolPublicProfile"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>School Introduction Video</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblSchoolIntroductionVideo"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Active Users</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblActiveUsers"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>School TO School Communication</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblSchoolToSchoolCommunication"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Same Account For Other Branches</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblSameAccountForOtherBranches"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Database Backup</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblDatabaseBackup"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span> Security and Confidentiality</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblSecurityAndConfidentiality"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Data Availability</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblDataAvailability"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Package Customization</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblPackageCustomization"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Package Termination Report</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblPackageTerminationReport"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Online Support</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblOnlineSupport"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Data Filters</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblDataFilters"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Admin Panel Type</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblAdminPanelType"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>School ID</span></td>
                                        <td class="col-2"><asp:Label runat="server" ID="lblSchoolID"></asp:Label></td>
                                        <td class="col-3"></td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                   
                </div>
            </div>

        </div>
    </div>
</asp:Content>
