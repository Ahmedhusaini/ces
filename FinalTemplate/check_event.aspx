<%@ Page Title="Event" Language="C#" MasterPageFile="~/updatepasswordpanel.Master" AutoEventWireup="true" CodeBehind="check_event.aspx.cs" Inherits="FinalTemplate.check_event" %>
<%@ Import Namespace="FinalTemplate.source.Functions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="assets/js/jquery-2.2.3.js"></script>  
    <script type="text/javascript">

        $(document).ready(function() {
            GetAllEvents();
            samesizeimage();
            removechilddivs();

        });
        function GetAllEvents() {
            var school_id = $('#schoolIDvalue').val();
            $.ajax({
                url: 'source/WebServices/Events.asmx/GetAllEvents',
                method: 'post',
                data: { _schoolID: school_id },
                dataType: 'json',
                success: function (data) {
                    var obj = JSON.stringify(data);
                    var array = $.parseJSON(obj);
                    $.each(array, function (i, v) {
                        var parentDiv = $('div.customs-row');
                        parentDiv.append('<div class="col-md-4 col-sm-6"> <div class="edugate-layout-3"><div class="edugate-layout-3-wrapper">  <a class="edugate-image"> <img src="images/Events/' + v.Picture + '" alt="" class="img-responsive" /></a> <div class="edugate-content">  <a href="#" class="title">Event ID:' + v.EventID + '</a>  <ul> <li>Event Title:' + v.Title + '</li><li>Description:' + v.Description + '</li><li>Place: ' + v.Place + '</li><li>Event Creator ID: ' + v.EventCreatorID + '</li><li>Starting Time: ' + v.start_time + '</li><li>Ending Time: ' + v.end_time + '</li><li>Start Date: ' + v.StartDate + '</li><li>End Date: ' + v.EndDate + '</li></div></div></div></div>');
                        samesizeimage();
                    });

                },
                error: function (data) {
                    alert('Error: ' + data);
                }
            });
        }
        function samesizeimage() {
            $('a img').css({ 'height': '200px', 'width': '300px' });
        }
        function removechilddivs() {
            $('div[class=customs-row]').empty();
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section background-opacity page-title set-height-top">
        <div class="container">
            <div class="page-title-wrapper">
                <!--.page-title-content-->
                <h2 class="captions">Event</h2>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><a href="#">Event</a></li>
                </ol>
            </div>
        </div>
    </div>
    <input id="schoolIDvalue" type="hidden" value="<%=student.s_schoolid%>" />
    <div class="section section-padding list-categories">
            <div class="container">
                <div class="list-categories-wrapper">
                    <div class="top-content">
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

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    <br />
</asp:Content>
