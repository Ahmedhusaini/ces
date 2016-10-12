<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="TeacherPrivileges.aspx.cs" Inherits="FinalTemplate.TeacherPrivileges" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
    <link href="assets/css/toggleSwitch.css" rel="stylesheet" />
    <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            
            $('#tablebody').empty();
            $('.heading-table').css('background-color', '#c50d0d');
            RemoveBackButton();

            $('#<%=btnGetPrivileges.ClientID%>').click(function (e) {
                e.preventDefault();
                $('#tablebody').empty();
                GetTeacherPrivileges();
            });
        });
        function RemoveBackButton() {
            $('#back-top').remove();
        }

        function columnvalue(controlid) {
            
                if ($(controlid).css('display') == 'block') {
                    return true;
                } else if ($(controlid).css('display') == 'none') {
                    return false;
                }
            
        }
        function UpdatePrivilege(column,value) {
            var teacherid = $('#<%=txtTeacherIDToPopulatePrivileges.ClientID%>').val();
            var inputparametersobjects = { _columnName: column, _value: value, _teacherid: teacherid };
            var intputparameters = JSON.stringify(inputparametersobjects);
            $.ajax({
                url: 'source/WebServices/GetAllTeachers.asmx/UpdatePrivileges',
                method:'POST',
                data: intputparameters,
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {},
                error: function(data) {
                    console.log(data);
                }
            });
        }

        function GetTeacherPrivileges() {
            var teacherid = $('#<%=txtTeacherIDToPopulatePrivileges.ClientID%>').val();
            $.ajax({
                url: 'source/WebServices/GetAllTeachers.asmx/GetPrivileges',
                method: 'post',
                data: { _teacherID: teacherid},
                datatype: 'json',
                success: function (data) {
                    
                    var obj = JSON.stringify(data);
                    var arrayjson = $.parseJSON(obj);
                    var actualarray = $.parseJSON(arrayjson);
                    $.each(actualarray, function (i, v) {
                        $('#tablebody').append('<tr class="table-row"> <td class="col-3"><span>Events</span></td><td class="col-2"><a href="#">is this teacher eligible to making events?</a></td><td class="col-3"><label class="switch centerbuttion "><input id="check_event" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="No"></span><span class="switch-handle"></span></label></td></tr><tr class="table-row">  <td class="col-3"><span>Attendance</span></td><td class="col-2"><a href="#">Do you want this teacher can mark attendance?</a></td><td class="col-3"><label class="switch centerbuttion "><input id="check_attendance" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="NO"></span><span class="switch-handle"></span></label></td></tr><tr class="table-row"><td class="col-3"><span>Homework</span></td><td class="col-2"><a href="#">Teacher will be able to upload homework with their respective classes.</a></td><td class="col-3"><label class="switch centerbuttion "><input id="check_homework" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="NO"></span><span class="switch-handle"></span></label></td></tr><tr class="table-row"><td class="col-3"><span>Reports</span></td><td class="col-2"><a href="#">Do you want this teacher to generate reports?</a></td><td class="col-3"><label class="switch centerbuttion "><input id="check_reports" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="NO"></span><span class="switch-handle"></span></label></td></tr><tr class="table-row"><td class="col-3"><span>Timetable</span></td><td class="col-2"><a href="#">Can this teacher make time table(s)?</a></td><td class="col-3"><label class="switch centerbuttion "><input id="check_timetable" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="NO"></span><span class="switch-handle"></span></label></td></tr><tr class="table-row"><td class="col-3"><span>Datesheet</span></td><td class="col-2"><a href="#">Can this teacher make Date Sheet(s)?</a></td><td class="col-3"><label class="switch centerbuttion "><input id="check_datesheets" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="NO"></span><span class="switch-handle"></span></label></td></tr>');
                        var event = v.Event;
                        var attendance = v.Attendance;
                        var homework = v.Homework;
                        var reports = v.Reports;
                        var timetable = v.TimeTable;
                        var datesheet = v.DateSheet;
                        if (event == 1) {
                            $('#check_event').trigger('click');
                            $('#check_event').data('clicked',true);
                        }
                        if (attendance == 1) {
                            $('#check_attendance').trigger('click');
                            $('#check_attendance').data('clicked', true);
                        }
                        if (homework == 1) {
                            $('#check_homework').trigger('click');
                            $('#check_homework').data('clicked', true);
                        }
                        if (reports == 1) {
                            $('#check_reports').trigger('click');
                            $('#check_reports').data('clicked', true);
                        }
                        if (timetable == 1) {
                            $('#check_timetable').trigger('click');
                            $('#check_timetable').data('clicked', true);
                        }
                        if (datesheet == 1) {
                            $('#check_datesheets').trigger('click');
                            $('#check_datesheets').data('clicked', true);
                        }
                        $('#check_event').bind({
                            click: function () {
                                var status = columnvalue('#check_event');
                                if (status) {
                                    if ($('#check_event').data('clicked')) {
                                        $('#check_event').data('clicked', false);
                                        UpdatePrivilege('event', 0);
                                    } else {
                                        $('#check_event').data('clicked', true);
                                        UpdatePrivilege('event',1);
                                    }
                                } else {
                                    UpdatePrivilege('event', 0);
                                    $('#check_event').css('display', 'block');
                                }

                            }
                        });
                        $('#check_attendance').bind({
                            click: function () {
                                var flag = columnvalue('#check_attendance');
                                if (flag) {
                                    if ($('#check_attendance').data('clicked')) {
                                        $('#check_attendance').data('clicked', false);
                                        UpdatePrivilege('attendence', 0);
                                    } else {
                                        $('#check_attendance').data('clicked', true);
                                        UpdatePrivilege('attendence', 1);
                                    }
                                } else {
                                    UpdatePrivilege('attendence', 0);
                                    $('#check_attendance').css('display', 'block');
                                }
                            }
                        });
                        $('#check_homework').bind({
                            click: function () {
                                var flag = columnvalue('#check_homework');
                                if (flag) {
                                    if ($('#check_homework').data('clicked')) {
                                        $('#check_homework').data('clicked', false);
                                        UpdatePrivilege('homework', 0);
                                    } else {
                                        $('#check_homework').data('clicked', true);
                                        UpdatePrivilege('homework', 1);
                                    }
                                } else {
                                    UpdatePrivilege('homework', 0);
                                    $('#check_homework').css('display', 'block');
                                }
                            }
                        });
                        $('#check_reports').bind({
                            click: function () {
                                var flag = columnvalue('#check_reports');
                                if (flag) {
                                    if ($('#check_reports').data('clicked')) {
                                        $('#check_reports').data('clicked', false);
                                        UpdatePrivilege('reports', 0);
                                    } else {
                                        $('#check_reports').data('clicked', true);
                                        UpdatePrivilege('reports', 1);
                                    }
                                } else {
                                    UpdatePrivilege('reports', 0);
                                    $('#check_reports').css('display', 'block');
                                }

                            }
                        });
                        $('#check_timetable').bind({
                            click: function () {
                                var flag = columnvalue('#check_timetable');
                                if (flag) {
                                    if ($('#check_timetable').data('clicked')) {
                                        $('#check_timetable').data('clicked', false);
                                        UpdatePrivilege('timetable', 0);
                                    } else {
                                        $('#check_timetable').data('clicked', true);
                                        UpdatePrivilege('timetable', 1);
                                    }
                                } else {
                                    UpdatePrivilege('timetable', 0);
                                    $('#check_timetable').css('display', 'block');
                                }

                            }
                        });
                        $('#check_datesheets').bind({
                            click: function () {
                                var flag = columnvalue('#check_datesheets');
                                if (flag) {
                                    if ($('#check_datesheets').data('clicked')) {
                                        $('#check_datesheets').data('clicked', false);
                                        UpdatePrivilege('datesheets', 0);
                                    } else {
                                        $('#check_datesheets').data('clicked', true);
                                        UpdatePrivilege('datesheets', 1);
                                    }

                                } else {
                                    UpdatePrivilege('datesheets', 0);
                                    $('#check_datesheets').css('display', 'block');
                                }
                            }
                        });
                    });
                    $(window).href.reload();
                },
                error: function (error) {
                    alert("Teacher ID require to get privileges details.");
                }
            });
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
    <div class="section section-padding top-courses">
        <div class="container">
            <div class="group-title-index">
                <h2 class="center-title">Insert Teacher ID to get his/her privileges status</h2>
                <div class="bottom-title"><i class="bottom-icon icon-icon-04"></i></div>
                <p>By clicking on Yes/No button privilege will be assign and unassign respectivily. Changes will be reflected immediately after you press the Yes/NO toggle button.</p>
                <div class="container teacher-course-wrapper">
                    <div class="inner-container">
                        <div class="table-header">
                            <table class="edu-table-responsive">
                                <thead>
                                    <tr class="heading-table">
                                        <th class="col-3">Teacher ID</th>
                                        
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Teacher ID</span></td>
                                        <td class="col-2"><asp:TextBox CssClass="fullWidth" ID="txtTeacherIDToPopulatePrivileges" runat="server"></asp:TextBox></td>
                                        <td class="col-3">
                                            <asp:Button Text="Get Privileges" runat="server" ID="btnGetPrivileges" />
                                        </td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                     <div class="inner-container">
                        <div class="table-header">
                            <table class="edu-table-responsive">
                                <thead>
                                    <tr class="heading-table">
                                        <th class="col-3">Privilege</th>
                                        <th class="col-2">Privilege Description</th>
                                        <th class="col-3">Privilege Status</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody id="tablebody">
                                    <tr class="table-row">
                                        <td class="col-3"><span>Events</span></td>
                                        <td class="col-2"><a href="#">is this teacher eligible to making events?</a></td>
                                        <td class="col-3">
                                            <label class="switch centerbuttion ">
                                                <input id="check_event" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="No"></span><span class="switch-handle"></span></label></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Attendance</span></td>
                                        <td class="col-2"><a href="#">Do you want this teacher can mark attendance?</a></td>
                                        <td class="col-3">
                                            <label class="switch centerbuttion ">
                                                <input id="check_attendence" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="NO"></span><span class="switch-handle"></span></label></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Homework</span></td>
                                        <td class="col-2"><a href="#">Teacher will be able to upload homework with their respective classes.</a></td>
                                        <td class="col-3">
                                            <label class="switch centerbuttion ">
                                                <input id="check_homework" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="NO"></span><span class="switch-handle"></span></label></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Reports</span></td>
                                        <td class="col-2"><a href="#">Do you want this teacher to generate reports?</a></td>
                                        <td class="col-3">
                                            <label class="switch centerbuttion ">
                                                <input id="check_reports" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="NO"></span><span class="switch-handle"></span></label></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Timetable</span></td>
                                        <td class="col-2"><a href="#">Can this teacher make time table(s)?</a></td>
                                        <td class="col-3">
                                            <label class="switch centerbuttion ">
                                                <input id="check_timetable" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="NO"></span><span class="switch-handle"></span></label></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Datesheet</span></td>
                                        <td class="col-2"><a href="#">Can this teacher make Date Sheet(s)?</a></td>
                                        <td class="col-3">
                                            <label class="switch centerbuttion ">
                                                <input id="check_datesheets" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="NO"></span><span class="switch-handle"></span></label></td>
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
