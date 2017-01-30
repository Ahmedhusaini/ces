<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="StudentOfTheMonth.aspx.cs" Inherits="FinalTemplate.StudentOfTheMonth" %>
<%@ Import Namespace="FinalTemplate.source.Functions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
     <script src="assets/js/jquery-2.2.3.js"></script> 
    <script type="text/javascript">
        $(document).ready(function () {
            GetAllStudents();
        });

        function GetAllStudents() {
            var jquerySchoolID = $('#schoolhidden').val();
            $.ajax({
                url: 'source/WebServices/Student.asmx/GetStudents',
                method: 'post',
                data: { _schoolID: jquerySchoolID },
                dataType: 'json',
                success: function(data) {
                    var table = $('tbody');
                    var jsonString = JSON.stringify(data);
                    var jsonArray = $.parseJSON(jsonString);
                    $.each(jsonArray, function(i, v) {
                        table.append('<tr class="table-row"><td class="col-1"><span>' + v.StudentID + '</span></td><td class="col-2"><a href="#">' + v.FirstName + ' ' + v.LastName + '</a></td></tr>');
                    });
                    
                },
                error: function(data) {
                    
                }
            });
        }
        
        function EmptyTable() {
            $('tbody').empty();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
    <input type="hidden" value="<%=JSchool.SchoolID%>" id="schoolhidden"/>
      <div class="section teacher-course section-padding">
                    <div class="container teacher-course-wrapper">
                        <div class="underline">Teacher list</div>
                        <div class="course-table">
                            <div class="outer-container">
                                <div class="inner-container">
                                    <div class="table-header">
                                        <table class="edu-table-responsive">
                                            <thead>
                                            <tr class="heading-table">
                                                <th class="col-1">Student ID</th>
                                                <th class="col-2">Student Name</th>

                                            </tr>
                                            </thead>
                                        </table>
                                    </div>
                                    
                                    <div class="table-body">
                                        <table class="edu-table-responsive table-hover">
                                            <tbody>
                                         
                                           <!---<tr class="table-row">
                                                <td class="col-1"><span>ED1</span></td>
                                                <td class="col-2"><a href="courses-detail.html">Sport Exercise Sciences</a></td>
                                            </tr>--->
                                         
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="studentofthemonth">
                                    <asp:TextBox ID="txtstudentofthemonth" runat="server" placeholder="Enter Student ID for student of the month" Width="515px"></asp:TextBox><asp:Button ID="btnMakeStudentOfTheMonth" runat="server" Text="Make student of the month" OnClick="btnMakeStudentOfTheMonth_Click" />
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
</asp:Content>
