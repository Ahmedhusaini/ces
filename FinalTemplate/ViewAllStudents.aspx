<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewAllStudents.aspx.cs" Inherits="FinalTemplate.ViewAllStudents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
      <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">
        $(window).load(function () {
            searchboxwidth();
        });
        $(document).ready(function () {
            teacherwidth();
            samesizeimage();
            setbuttonlayout();
            removechilddivs();
            GetAllStudents();
            $('#btnsubmit').click(function (e) {
                e.preventDefault();
                removechilddivs();
                
                var school_id = $('#hiddenschoolid').val();
                var studentname = $('#<%=txtSearch.ClientID%>').val();
                $.ajax({
                    url: 'source/WebServices/Student.asmx/GetAllStudentsBySchoolID',
                    method: 'post',
                    data: { _school_id: school_id, studentfirstname: studentname },
                    datatype: 'json',
                    success: function (data) {
                        var jsonarray = $.parseJSON(data);
                        $.each(jsonarray, function (i, v) {
                            var parentDiv = $('div.customs-row');
                            parentDiv.append('<div class="col-md-4 col-sm-6"> <div class="edugate-layout-3"><div class="edugate-layout-3-wrapper">  <a class="edugate-image"> <img src="assets/images/cesThemeImages/' + v.photo + '" alt="" class="img-responsive" /></a> <div class="edugate-content">  <a href="#" class="title">' + v.FirstName + ' ' + v.LastName + '</a>  <ul> <li>First Name:' + v.FirstName + '</li><li>Last Name:' + v.LastName + '</li><li>Email: ' + v.PrimaryEmail + '</li><li>Phone: ' + v.Phone + '</li><li>Gender: ' + v.Gender + '</li><li>Address: ' + v.Address + '</li><li>School ID: ' + v.SchoolID + '</li><li>Authorized ID: ' + v.AuthorizedID + '</li><li>General ID: ' + v.GeneralID + '</li><li>Student ID: ' + v.StudentID + '</li></ul> <button class="btn btn-green "style="padding-right:115px;"><span>View Details</span></button> </div></div></div></div>');
                        });
                    },
                    error: function (data) {
                        alert('Error' + data);
                    }
                });
            });
        });
        function GetAllStudents() {
            var school_id = $('#hiddenschoolid').val();
            var studentname = $('#<%=txtSearch.ClientID%>').val();
            $.ajax({
                url: 'source/WebServices/Student.asmx/GetAllStudentsBySchoolID',
                method: 'post',
                data: { _school_id: school_id, studentfirstname: studentname },
                datatype: 'json',
                success: function (data) {                   
                    var jsonarray = $.parseJSON(data);
                    $.each(jsonarray, function (i, v) {                       
                        var parentDiv = $('div.customs-row');
                        parentDiv.append('<div class="col-md-4 col-sm-6"> <div class="edugate-layout-3"><div class="edugate-layout-3-wrapper">  <a class="edugate-image"> <img src="assets/images/cesThemeImages/' + v.photo + '" alt="" class="img-responsive" /></a> <div class="edugate-content">  <a href="#" class="title">' + v.FirstName + ' ' + v.LastName + '</a>  <ul> <li>First Name:' + v.FirstName + '</li><li>Last Name:' + v.LastName + '</li><li>Email: ' + v.PrimaryEmail + '</li><li>Phone' + v.Phone + '</li><li>Gender: ' + v.Gender + '</li><li>Address: ' + v.Address + '</li><li>School ID: ' + v.SchoolID + '</li><li>Authorized ID: ' + v.AuthorizedID + '</li><li>General ID: ' + v.GeneralID + '</li><li>Student ID: ' + v.StudentID + '</li></ul> <button class="btn btn-green "style="padding-right:115px;"><span>View Details</span></button> </div></div></div></div>');
                    });
                },
                error: function (data) {
                    alert('Error'+data);
                }
            });
        }
        function removechilddivs() {
            $('div[class=customs-row]').empty();
        }
        function samesizeimage() {
            $('a img').css({ 'height': '200px', 'width': '300px' });
        }
        function setbuttonlayout() {
            $('button.btn.btn-green').css('padding-right', '115px');
        }
        function teacherwidth() {
            var path = "url(assets/images/cesThemeImages/pakstudents.jpg)";
            $('.page-title').css({
                'background-image': path,
                'height': '450px'
            });
        }

        function searchboxwidth() {
            $('.form-input').css('width', '900px');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
      <div id="wrapper-content"><!-- PAGE WRAPPER-->
    <div id="page-wrapper"><!-- MAIN CONTENT-->
        <div class="main-content"><!-- CONTENT-->
            <div class="content">
                <div id="allteachers" class="section background-opacity page-title set-height-top">
                    <div class="container">
                        <div class="page-title-wrapper"><!--.page-title-content--><h2 class="captions">Student</h2>
                            <ol class="breadcrumb">
                              <li>All student registered at your school will be shown here.</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="section">
                    <div class="search-input">
                        <div class="container">
                            <div class="search-input-wrapper">
                                <form>
                                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-input" placeholder="Type student name you want to search"></asp:TextBox>
                                <button id="btnsubmit" type="submit" class="form-submit btn btn-blue"><span>search now<i class="fa fa-search"></i></span></button>
                                <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="section section-padding list-categories">
                    <div class="container">
                        <div class="list-categories-wrapper">
                            <div class="top-content">
                                <div class="result-output"><p class="result-count">Showing total<strong>12</strong> student records</p></div>
                            </div>
                            <div class="list-categories-content row">
                                <input type="hidden" id="hiddenschoolid" value="<%=schoolid %>" />
                                <div class="customs-row">
                                    
                                  <div class="col-md-4 col-sm-6">
                                    <div class="edugate-layout-3">
                                        <div class="edugate-layout-3-wrapper">
                                            <a class="edugate-image">
                                                <img src="assets/images/cesThemeImages/student (1).jpg" alt="" class="img-responsive" /></a>

                                            <div class="edugate-content">
                                                <a href="#" class="title">Student Name</a>

                                                <div class="description">
                                                    <ul>
                                                        <li>FirstName</li>
                                                        <li>Last Name</li>
                                                        <li>Gender</li>
                                                        <li>Email</li>
                                                        <li>Address</li>                                                        
                                                    </ul>

                                                </div>                                                
                                                <button class="btn btn-green"><span>View Details</span></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>   
                                    
                                                                
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BUTTON BACK TO TOP-->
    <div id="back-top"><a href="#top"><i class="fa fa-angle-double-up"></i></a></div>
</div>
</asp:Content>
