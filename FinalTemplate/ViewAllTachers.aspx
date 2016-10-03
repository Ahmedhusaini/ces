<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewAllTachers.aspx.cs" Inherits="FinalTemplate.ViewAllTachers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
     <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">
        $(window).load(function() {
            searchboxwidth();
           
        });
        $(document).ready(function () {
            teacherwidth();
            samesizeimage();
            setbuttonlayout();
            searchboxwidth();
            searchTeacher();
            $('#btnsubmit').click(function (e) {
                e.preventDefault();
                removechilddivs();
                var SearchKeyValue = $('#<%=txtSearch.ClientID%>').val();
                var schoolid = $('#schoolIDvalue').val();
                $.ajax({
                    url: 'source/WebServices/GetAllTeachers.asmx/GetAllTeachersByFirstName',
                    method: 'post',
                    data: {SearchKey: SearchKeyValue,_schoolid: schoolid },
                    datatype: 'json',
                    success: function (data) {
                        var arrData = $.parseJSON(data);
                        $.each(arrData, function (i, v) {                            
                            var parentdiv = $('div.customs-row');
                            parentdiv.append('<div class="col-md-4 col-sm-6"><div class="edugate-layout-3"><div class="edugate-layout-3-wrapper"><a class="edugate-image"><img class="imgTeacher" src="images/teachers/' + v.Photo + '" alt="" class="img-responsive" /></a><div class="edugate-content"><a href="#" class="title">' + v.FirstName + ' ' + v.LastName + '</a><ul><li> CNIC Number: <b>' + v.CNIC + '</b></li><li> Teacher ID: <b>' + v.TeacherID + '</b></li><li>General Teacher ID: <b>' + v.GeneralID + '</b></li><li>Teacher Authorized ID: <b>' + v.AuthorizedID + '</b></li><li>Date Of Join: <b>' + v.DateOfJoin + '</b></li></ul></div><br><br><br><button class="btn btn-green" style="padding-right:115px;margin-left:80px;"><span>View Details</span></button></div></div></div></div>');
                        });
                    },
                    error: function (error) {
                        alert("Error: " + error);
                    }
                });
            });
        });

        function samesizeimage() {
            $('a img').css({ 'height': '200px', 'width': '300px' });
        }

        function setbuttonlayout() {
            $('button.btn.btn-green').css('padding-right', '115px');
        }
        function teacherwidth() {
            var path = "url(assets/images/cesThemeImages/searchTeacher.jpg)";
            $('.page-title').css({
                'background-image': path,
                'height': '450px'
            });
        }
        function searchboxwidth() {
            $('.form-input').css('width','900px');
        }

        function searchTeacher() {
            var SearchKeyValue = $('#<%=txtSearch.ClientID%>').val();
            var schoolid = $('#schoolIDvalue').val();
            $.ajax({
                url: 'source/WebServices/GetAllTeachers.asmx/GetAllTeachersByFirstName',
                method: 'post',
                data: { SearchKey: SearchKeyValue, _schoolid: schoolid },
                datatype: 'json',
                success: function (data) {
                    var arrData = $.parseJSON(data);
                    $.each(arrData, function (i, v) {
                        var parentdiv = $('div.customs-row');
                        parentdiv.append('<div class="col-md-4 col-sm-6"><div class="edugate-layout-3"><div class="edugate-layout-3-wrapper"><a class="edugate-image"><img class="imgTeacher" src="images/teachers/' + v.Photo + '" alt="" class="img-responsive" /></a><div class="edugate-content"><a href="#" class="title">' + v.FirstName + ' ' + v.LastName + '</a><ul><li>CNIC Number: <b>' + v.CNIC + '</b></li><li> Teacher ID: <b>' + v.TeacherID + '</b></li><li>General Teacher ID: <b>' + v.GeneralID + '</b></li><li>Teacher Authorized ID: <b>' + v.AuthorizedID + '</b></li><li>Date Of Join: <b>' + v.DateOfJoin + '</b></li></ul></div><br><br><br><button class="btn btn-green"style="padding-right:115px;margin-left:80px;"><span>View Details</span></button></div></div></div></div>');
                    });
                },
                error: function (error) {
                    alert("Error: " + error);
                }
            });
        }
        
        function removechilddivs() {
            $('div[class=customs-row]').empty();
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
                        <div class="page-title-wrapper"><!--.page-title-content--><h2 class="captions">Teachers</h2>
                            <ol class="breadcrumb">
                              <li>All taeachers registered at your school will be shown here.</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="section">
                    <div class="search-input">
                        <div class="container">
                            <div class="search-input-wrapper">
                                <form>
                                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-input" placeholder="Type teacher name you want to search"></asp:TextBox>
                                <button type="submit" id="btnsubmit" class="form-submit btn btn-blue"><span>search now<i class="fa fa-search"></i></span></button>
                                    <input id="schoolIDvalue" type="hidden" value="<%= school_id %>"/>
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
                                <div class="result-output"><p class="result-count">To view all record just empty the search textbox and hit search button to get all records</p></div>
                            </div>
                            <div class="list-categories-content row">
                                <div class="customs-row">
                                  <!---  <div class="col-md-4 col-sm-6">
                                    <div class="edugate-layout-3">
                                        <div class="edugate-layout-3-wrapper">
                                            <a class="edugate-image">
                                                <img src="assets/images/cesThemeImages/teachers (1).jpg" alt="" class="img-responsive" /></a>

                                            <div class="edugate-content">
                                                <a href="#" class="title">language</a>

                                                <div class="description">
                                                    <ul>
                                                        <li>CNIC Number: <b>13245-1234567-1</b></li>
                                                        <li>AuthorizedID: <b>teacher123</b></li>
                                                        <li>Date Of Join: <b>2016-02-08</b></li>
                                                    </ul>
                                                </div>
                                                <div class="total-courses"><i class="fa fa-list"></i><a href="#">total courses 92</a></div>
                                                <button  class="btn btn-green"><span>View Details</span></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>----->
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
