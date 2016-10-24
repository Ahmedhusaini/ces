<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AllEvents.aspx.cs" Inherits="FinalTemplate.AllEvents" %>
<%@ Import Namespace="FinalTemplate.source.Functions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
   
      <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">
        $(window).load(function () {
            SetMainLogo();
            searchboxwidth();
        });
        $(document).ready(function () {
            teacherwidth();
            samesizeimage();
            removechilddivs();
            setbuttonlayout();
            GetAllEvents();
            SetMainLogo();
           
            $('#btnsubmit').on('click', function(e) {
                e.preventDefault();
                removechilddivs();
                SearchEventBySearchKey();
            });
            $('#linktoallrecords').click(function(e) {
                e.preventDefault();
                removechilddivs();
                GetAllEvents();
            });

        });
        
        function SetMainLogo() {
            $('.mainLogo').css({
                'height': '90px',
                'width': '105px'
            });
        }

        function SearchEventBySearchKey() {
            var sch_id = $('#schoolIDvalue').val();
            var searchkey = $('#txtsearchKey').val();
            var catid = $('#<%=ddlEventType.ClientID%>').val();

            $.ajax({
                url: 'source/WebServices/Events.asmx/SearchEvent',
                method: 'post',
                data: {
                    _categoryid: catid,
                    _searchKey: searchkey,
                    _schoolid:sch_id
                },
                dataType: 'json',
                success: function(data) {
                    var obj = JSON.stringify(data);
                    var array = $.parseJSON(obj);
                    $.each(array, function (i, v) {
                        var parentDiv = $('div.customs-row');
                        parentDiv.append('<div class="col-md-4 col-sm-6"> <div class="edugate-layout-3"><div class="edugate-layout-3-wrapper">  <a class="edugate-image"> <img src="images/Events/' + v.Picture + '" alt="" class="img-responsive" /></a> <div class="edugate-content">  <a href="#" class="title">Event ID:' + v.EventID + '</a>  <ul> <li>Event Title:' + v.Title + '</li><li>Description:' + v.Description + '</li><li>Place: ' + v.Place + '</li><li>Event Creator ID: ' + v.EventCreatorID + '</li><button class="btn btn-green "style="padding-right:115px;"><span><a href="UpdateAndViewEventDetails.aspx?EIC=' + v.EventID + '">View Details</a></span></button> </div></div></div></div>');
                        samesizeimage();
                    });
                },
                error: function(data) {
                    alert('No record found with given event type and search keyword combination.');
                }
            });
        }

        function GetAllEvents() {
            var school_id = $('#schoolIDvalue').val();
            $.ajax({
                url: 'source/WebServices/Events.asmx/GetAllEvents',
                method: 'post',
                data: { _schoolID: school_id },
                dataType: 'json',
                success: function(data) {
                    var obj = JSON.stringify(data);
                    var array = $.parseJSON(obj);
                    $.each(array, function(i,v) {
                        var parentDiv = $('div.customs-row');
                        parentDiv.append('<div class="col-md-4 col-sm-6"> <div class="edugate-layout-3"><div class="edugate-layout-3-wrapper">  <a class="edugate-image"> <img src="images/Events/' + v.Picture + '" alt="" class="img-responsive" /></a> <div class="edugate-content">  <a href="#" class="title">Event ID:' + v.EventID + '</a>  <ul> <li>Event Title:' + v.Title + '</li><li>Description:' + v.Description + '</li><li>Place: ' + v.Place + '</li><li>Event Creator ID: ' + v.EventCreatorID + '</li><button class="btn btn-green "style="padding-right:115px;"><span><a href="UpdateAndViewEventDetails.aspx?EIC=' + v.EventID + '">View Details</a></span></button> </div></div></div></div>');
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
            $('.form-input').css('width', '366px');
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
                              <li>All Event Are Listed Here. You Can Find Them Easily By Entering Enent Title Or Tag Keywords.</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="section">
                    <div class="search-input">
                        <div class="container">
                    <div class="search-input-wrapper">
                        <form>  
                                
                                <asp:DropDownList CssClass="form-select style-1 selectbox" runat="server" ID="ddlEventType" />
                               
                            
                            <input id="txtsearchKey" type="text" placeholder="Enter key words" class="form-input" />
                            <button type="submit" id="btnsubmit" class="form-submit btn btn-blue"><span>search now<i class="fa fa-search"></i></span></button>
                            <div class="clearfix"></div>
                        </form>
                    </div>
                        </div>
                    </div>
                </div>
               <input id="schoolIDvalue" type="hidden" value="<%= JSchool.SchoolID%>"/> 
                <div class="section section-padding list-categories">
                    <div class="container">
                        <div class="list-categories-wrapper">
                            <div class="top-content">
                                <div class="result-output"><p class="result-count">You can type any search key work suck as keywords from the title of the event or keywords from tags related to that event. The final result is calculated on both the event title and event tags matches found.<b> Click <a href="#" id="linktoallrecords">Here</a> to get all records</b></p></div>
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
