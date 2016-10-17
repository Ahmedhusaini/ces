<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AllEvents.aspx.cs" Inherits="FinalTemplate.AllEvents" %>
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
            removechilddivs();
            setbuttonlayout();
            searchboxwidth();
            SearchEvent();
        });

        function SearchEvent() {
            var school_id = $('#schoolIDvalue').val();
            $.ajax({
                url: 'source/WebServices/Events.asmx/GetAllEvents',
                method: 'post',
                data: { _schoolID: school_id },
                dataType: 'json',
                success: function(data) {
                    var obj = JSON.stringify(data);
                    var array = $.parseJSON(obj);
                    alert(array);
                    $.each(array, function(i,v) {
                        var parentDiv = $('div.customs-row');
                        parentDiv.append('<div class="col-md-4 col-sm-6"> <div class="edugate-layout-3"><div class="edugate-layout-3-wrapper">  <a class="edugate-image"> <img src="images/Events/' + v.Picture + '" alt="" class="img-responsive" /></a> <div class="edugate-content">  <a href="#" class="title">Event ID:' + v.EventID + '</a>  <ul> <li>Event Title:' + v.Title + '</li><li>Description:' + v.Description + '</li><li>Place: ' + v.Place + '</li><li>Event Creator ID: ' + v.EventCreatorID + '</li><button class="btn btn-green "style="padding-right:115px;"><span><a href="#">View Details</a></span></button> </div></div></div></div>');
                        samesizeimage();
                    });
                },
                error: function(data) {
                    alert('Error: ' + data);
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
            var path = "url(assets/images/cesThemeImages/evetns.jpg)";
            $('.page-title').css({
                'background-image': path,
                'height': '450px',
                'width':'100%'
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
                        <div class="page-title-wrapper"><!--.page-title-content--><h2 class="captions">Events</h2>
                            <ol class="breadcrumb">
                              <li>All event are listed here. You can find them easily by entering enent title or tag keywords.</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="section">
                    <div class="search-input">
                        <div class="container">
                            <div class="search-input-wrapper">
                                <form>
                                <asp:TextBox ID="txtEventSearch" runat="server" CssClass="form-input" placeholder="Type event title/tag"></asp:TextBox>
                                <button type="submit" id="btnEventSearch" class="form-submit btn btn-blue"><span>Search Now<i class="fa fa-search"></i></span></button>
                                    <input id="schoolIDvalue" type="hidden" value="<%= JSchool.SchoolID%>"/>
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
                                    <div class="col-md-4 col-sm-6">
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
