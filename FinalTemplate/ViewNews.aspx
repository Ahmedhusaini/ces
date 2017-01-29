<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewNews.aspx.cs" Inherits="FinalTemplate.ViewNews" %>
<%@ Import Namespace="FinalTemplate.source.Functions" %>
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
            searchboxwidth();
            GetAllNews();
        });

        function GetAllNews() {
            $('.customs-rows').empty();
            var schoolid = $('#schoolIDvalue').val();
            
            $.ajax({
                url: 'source/WebServices/News.asmx/GetAllNewsBySchoolID',
                method: 'post',
                data: { _schoolid: schoolid },
                dataType: 'json',
                success: function (data) {
                    var arrData = JSON.stringify(data);
                    var jsonarray = $.parseJSON(arrData);
                    $.each(jsonarray, function (i, v) {
                        var parentdiv = $('div.customs-row');
                          parentdiv.append('<div class="col-md-4 col-sm-6"><div class="edugate-layout-3"><div class="edugate-layout-3-wrapper"><a class="edugate-image"><img class="imgTeacher" src="' + v.Image + '" alt="" class="img-responsive" /></a><div class="edugate-content"><a href="#" class="title">' + v.Title + '</a><ul><li>News Title: <b>' + v.Title + '</b></li><li> News Type: <b>' + v.NewsType+ '</b></li><li>Description: <b>' + v.Description+ '</b></li></ul></div><br><br><br><button class="btn btn-green"style="padding-right:115px;margin-left:80px;"><span><a href="UpdateNews.aspx?NC=' + v.NewsID + '">View Details</a></span></button></div></div></div></div>');

                    });
                },
                error: function (error) {
                    //alert("error"+error);
                }
            });
        }       

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
            $('.form-input').css('width', '900px');
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
                        <div class="page-title-wrapper"><!--.page-title-content--><h2 class="captions">News</h2>
                            <ol class="breadcrumb">
                              <li>All news related to your school will appear here. You are free to search and view news posted by your (admin)</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="section">
                    <div class="search-input">
                        <div class="container">
                            <div class="search-input-wrapper">
                                <form>
                                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-input" placeholder="Type news title or tags here to search for news post"></asp:TextBox>
                                <button type="submit" id="btnsubmit" class="form-submit btn btn-blue"><span>search now<i class="fa fa-search"></i></span></button>
                                    <input id="schoolIDvalue" type="hidden" value="<%=JSchool.SchoolID%>"/>
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
