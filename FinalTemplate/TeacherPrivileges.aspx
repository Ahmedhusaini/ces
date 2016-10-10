<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="TeacherPrivileges.aspx.cs" Inherits="FinalTemplate.TeacherPrivileges" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
    <link href="assets/css/toggleSwitch.css" rel="stylesheet" />
    <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#back-top').remove();
        });
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
                                <tbody>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Event</span></td>
                                        <td class="col-2"><a href="courses-detail.html">is this teacher eligible to making events?</a></td>
                                        <td class="col-3">
                                            <label class="switch centerbuttion ">
                                                <input class="switch-input" type="checkbox" />
                                                <span class="switch-label" data-on="Yes" data-off="No"></span>
                                                <span class="switch-handle"></span>
                                            </label>
                                        </td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Attendance</span></td>
                                        <td class="col-2"><a href="courses-detail.html">Do you want this teacher can mark attendance?</a></td>
                                        <td class="col-3">
                                            <label class="switch centerbuttion ">
                                                <input class="switch-input" type="checkbox" />
                                                <span class="switch-label" data-on="Yes" data-off="NO"></span>
                                                <span class="switch-handle"></span>
                                            </label>
                                        </td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Home Work</span></td>
                                        <td class="col-2"><a href="courses-detail.html">Teacher will be able to upload homework with their respective classes.</a></td>
                                        <td class="col-3">
                                            <label class="switch centerbuttion ">
                                                <input class="switch-input" type="checkbox" />
                                                <span class="switch-label" data-on="Yes" data-off="NO"></span>
                                                <span class="switch-handle"></span>
                                            </label>
                                        </td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Reports</span></td>
                                        <td class="col-2"><a href="courses-detail.html">Do you want this teacher to generate reports?</a></td>
                                        <td class="col-3">
                                            <label class="switch centerbuttion ">
                                                <input class="switch-input" type="checkbox" />
                                                <span class="switch-label" data-on="Yes" data-off="NO"></span>
                                                <span class="switch-handle"></span>
                                            </label>
                                        </td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Time Table(s)</span></td>
                                        <td class="col-2"><a href="courses-detail.html">Can this teacher make time table(s)?</a></td>
                                        <td class="col-3">
                                            <label class="switch centerbuttion ">
                                                <input class="switch-input" type="checkbox" />
                                                <span class="switch-label" data-on="Yes" data-off="NO"></span>
                                                <span class="switch-handle"></span>
                                            </label>
                                        </td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Date Sheet(s)</span></td>
                                        <td class="col-2"><a href="courses-detail.html">Can this teacher make Date Sheet(s)?</a></td>
                                        <td class="col-3">
                                            <label class="switch centerbuttion ">
                                                <input class="switch-input" type="checkbox" />
                                                <span class="switch-label" data-on="Yes" data-off="NO"></span>
                                                <span class="switch-handle"></span>
                                            </label>
                                        </td>

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
