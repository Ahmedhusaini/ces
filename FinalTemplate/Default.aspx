<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FinalTemplate.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="UserHeadPlaceHolder" runat="server">
    <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            UserCount();
            LatestNews();
            Jobs();
        });
        function UserCount() {
            
            $.ajax({
                url: 'source/WebServices/School.asmx/CounterForHomePage',
                method: 'post',
                dataType: 'json',
                success: function (data) {
                    var jsonarray = JSON.stringify(data);
                    var array = $.parseJSON(jsonarray);
                    var parent = $('#divparent').empty();
                    var student = $('#divstudent').empty();
                    var teacher = $('#divteacher').empty();
                    var totalschool = $('#divschool').empty();
                    parent.append(' <div data-from="0" data-to="' + array.parent + '" data-speed="1000" class="num">0</div><p class="name-inner">Total Parents Registered</p>');
                    student.append(' <div  data-from="0" data-to="' + array.student + '" data-speed="1000" class="num">0</div> <p class="name-inner">Total Students Registered</p>');
                    teacher.append('<div  data-from="0" data-to="' + array.teacher + '" data-speed="1000" class="num">0</div><p class="name-inner">Total Teachers Registered</p>');
                    totalschool.append('<div data-from="0" data-to="' + array.school + '" data-speed="1000" class="num">0</div><p class="name-inner">Total Schools Registered</p>');
                },
                error: function (data) {
                    alert("ERROR" + JSON.stringify(data));
                }
            });
        }
        function LatestNews() {

            $.ajax({
                url: 'source/WebServices/News.asmx/GetTopThreeNews',
                method: 'post',
                dataType: 'json',
                success: function (data) {
                    var jsonarray = JSON.stringify(data);
                    var array = $.parseJSON(jsonarray);
                    var parentDiv = $('div[class="latest-news-wrapper"]').empty();
                    $.each(array, function(i,v) {
                        parentDiv.append('<div class="edugate-layout-1"><div class="edugate-image"><img src="' + v.newsimage + '" alt="' + v.newstype + '" class="img-responsive" /></div><div class="edugate-content"><a href="#" class="title">' + v.newstitle + '</a><div class="description">' + v.newsdiscription + '</div>');
                    });

                },
                error: function (data) {
                    alert("ERROR" + JSON.stringify(data));
                }
            });
        }
        function Jobs() {

            $.ajax({
                url: 'source/WebServices/News.asmx/GetTopFourJobs',
                method: 'post',
                dataType: 'json',
                success: function (data) {
                    var jsonarray = JSON.stringify(data);
                    var array = $.parseJSON(jsonarray);
                    var parentDiv = $('div[class="top-courses-slider"]').empty();
                    $.each(array, function (i, v) {
                        parentDiv.append(' <div class="top-courses-item"> <div class="edugate-layout-2"> <div class="edugate-layout-2-wrapper"> <div class="edugate-content"> <a href="#" class="title">Job Title: ' + v.job_title + '</a> <div class="info"> <div class="author item"><a href="#"><b>School Name: </b> ' + v.school_name + '<b><br/> Contact Number:</b> ' + v.contact_primary + '</a></div></div> <div class="description"><b>Job Description:<b/> ' + v.job_discription + '</div> </div>  </div> </div>');
                    });

                },
                error: function (data) {
                    alert("ERROR" + JSON.stringify(data));
                }
            });
        }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="UserContentPlaceHolder" runat="server">
    <!-- SLIDER BANNER-->
    <div class="section slider-banner-03 background-opacity-2">
        <div class="container" style="color: #86bc42">
            <div class="slider-banner-wrapper">
                <h6 data-wow-delay="0.5s" class="main-title wow fadeInUp">Centralized Education System</h6>

            </div>
        </div>
    </div>

   
    
    <!-- PROGRESS BARS-->
    <div class="section progress-bars section-padding">
        <div class="container">
            <div class="progress-bars-content">
                <div class="progress-bar-wrapper">
                    <h2 class="title-2">Some useful information about your school</h2>

                    <div class="row">
                        <div class="content">
                            <div class="col-sm-3">
                                <div id="divteacher" class="progress-bar-number">
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div id="divparent" class="progress-bar-number">
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div id="divstudent" class="progress-bar-number">
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div id="divschool" class="progress-bar-number">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="group-button">
                        <%--<button onclick="window.location.href='categories.html'" class="btn btn-transition-3"><span>View Statics</span></button>
                        <button onclick="window.location.href='about-us.html'" class="btn btn-green-3"><span>Generate Report</span></button>--%>
                    </div>
                    <div class="group-btn-slider">
                        <div class="btn-prev"><i class="fa fa-angle-left"></i></div>
                        <div class="btn-next"><i class="fa fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- TOP COURSES-->
    <div class="section section-padding top-courses">
        <div class="container">
            <div class="group-title-index">
                <h4 class="top-title">CHOOSE YOUR COURSE</h4>

                <h2 class="center-title">the top popular courses for you</h2>

                <div class="bottom-title"><i class="bottom-icon icon-icon-04"></i></div>
            </div>
            <div class="top-courses-wrapper">
                <div class="top-courses-slider">
                    
                    



                   
                </div>
                
                <div class="group-btn-top-courses-slider">
                    <div class="btn-prev">&lsaquo;</div>
                    <div class="btn-next">&rsaquo;</div>
                </div>
            </div>
        </div>
    </div>
    <!--LATEST NEW-->
    <div class="section section-padding latest-news">
        <div class="container">
            <div class="group-title-index">
                <h4 class="top-title">latest news</h4>

                <h2 class="center-title">News updates from school which are registered on CES portal.</h2>

                <div class="bottom-title"><i class="bottom-icon icon-a-01-01"></i></div>
            </div>
            <div class="latest-news-wrapper">
                <div class="edugate-layout-1">
                    <div class="edugate-image">
                        <img src="assets/images/news/news-1.jpg" alt="" class="img-responsive" />
                    </div>
                    <div class="edugate-content">
                        <a href="news-detail.html" class="title">Effective researching method</a>

                       
                        <div class="info-more">
                            <div class="view item">
                                <i class="fa fa-user"></i>

                                <p>56</p>
                            </div>
                            <div class="comment item">
                                <i class="fa fa-comment"></i>

                                <p>239</p>
                            </div>
                        </div>
                        <div class="description">Dalmatian hello amazing the rmore flung as thanks a manta dealt to under emu some the and one baldbe dear sobbingly save and spitefully less Dalmatian hello amazing the rmore flung as thanks a manta dealt to under emu some the and one baldbe dear sobbingly save and spitefully Dalmatian hello amazing the...</div>
                        <button onclick="window.location.href='news-detail.html'" style="padding-right: 106px" class="btn btn-green"><span>learn now</span></button>
                    </div>
                </div>
                
                
                <button class="btn btn-green btn-latest-new" style="padding-right: 180px"><span>Browser All Post<i class="fa fa-long-arrow-right"></i></span></button>
            </div>
        </div>
    </div>
    
</asp:Content>
