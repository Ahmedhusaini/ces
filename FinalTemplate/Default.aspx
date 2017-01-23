<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FinalTemplate.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="UserHeadPlaceHolder" runat="server">
    <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            UserCount();
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
        function Jobs() {

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
                                    <%--<div  data-from="0" data-to="0" data-speed="1000" class="num">0</div>
                                    <p class="name-inner">Registered Teachers</p>--%>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div id="divparent" class="progress-bar-number">
                                    <%--<div data-from="0" data-to="0" data-speed="1000" class="num">0</div>
                                    <p class="name-inner">Offered Courses</p>--%>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div id="divstudent" class="progress-bar-number">
                                    <%--<div id="totalstudents" data-from="0" data-to="0" data-speed="1000" class="num">0</div>
                                    <p class="name-inner">Registered Students</p>--%>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div id="divschool" class="progress-bar-number">
                                    <%--<div data-from="0" data-to="0" data-speed="1000" class="num">0</div>
                                    <p class="name-inner">Total Registered Users</p>--%>
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
                    <div class="top-courses-item">
                        <div class="edugate-layout-2">
                            <div class="edugate-layout-2-wrapper">
                                <div class="edugate-content">
                                    <a href="courses-detail.html" class="title">Photoghaphy Master</a>

                                    <div class="info">
                                        <div class="author item"><a href="#">By Admin</a></div>
                                        <div class="date-time item"><a href="#">17 sep 2015</a></div>
                                    </div>
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
                                    <div title="Rated 5.00 out of 5" class="star-rating"><span class="width-80"><strong class="rating">5.00</strong> out of 5</span></div>
                                    <div class="description">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout...</div>
                                    <button onclick="window.location.href='courses-detail.html'" style="padding-right: 106px" class="btn btn-green"><span>learn now</span></button>
                                </div>
                                <div class="edugate-image">
                                    <img src="assets/images/courses/courses-1.jpg" alt="" class="img-responsive" /></div>
                            </div>
                        </div>
                    </div>
                    <div class="top-courses-item">
                        <div class="edugate-layout-2">
                            <div class="edugate-layout-2-wrapper">
                                <div class="edugate-content">
                                    <a href="courses-detail.html" class="title">Photoghaphy Master</a>

                                    <div class="info">
                                        <div class="author item"><a href="#">By Admin</a></div>
                                        <div class="date-time item"><a href="#">17 sep 2015</a></div>
                                    </div>
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
                                    <div title="Rated 5.00 out of 5" class="star-rating"><span class="width-10"><strong class="rating">5.00</strong> out of 5</span></div>
                                    <div class="description">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout...</div>
                                    <button onclick="window.location.href='courses-detail.html'" style="padding-right: 106px" class="btn btn-green"><span>learn now</span></button>
                                </div>
                                <div class="edugate-image">
                                    <img src="assets/images/courses/courses-2.jpg" alt="" class="img-responsive" /></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="top-courses-slider">
                    <div class="top-courses-item">
                        <div class="edugate-layout-2">
                            <div class="edugate-layout-2-wrapper">
                                <div class="edugate-content">
                                    <a href="courses-detail.html" class="title">Photoghaphy Master</a>

                                    <div class="info">
                                        <div class="author item"><a href="#">By Admin</a></div>
                                        <div class="date-time item"><a href="#">17 sep 2015</a></div>
                                    </div>
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
                                    <div title="Rated 5.00 out of 5" class="star-rating"><span class="width-70"><strong class="rating">5.00</strong> out of 5</span></div>
                                    <div class="description">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout...</div>
                                    <button onclick="window.location.href='courses-detail.html'" style="padding-right: 106px" class="btn btn-green"><span>learn now</span></button>
                                </div>
                                <div class="edugate-image">
                                    <img src="assets/images/courses/courses-3.jpg" alt="" class="img-responsive" /></div>
                            </div>
                        </div>
                    </div>
                    <div class="top-courses-item">
                        <div class="edugate-layout-2">
                            <div class="edugate-layout-2-wrapper">
                                <div class="edugate-content">
                                    <a href="courses-detail.html" class="title">Photoghaphy Master</a>

                                    <div class="info">
                                        <div class="author item"><a href="#">By Admin</a></div>
                                        <div class="date-time item"><a href="#">17 sep 2015</a></div>
                                    </div>
                                    <div class="info-more">
                                        <div class="view item">
                                            <i class="fa fa-user"></i>

                                            <p>00</p>
                                        </div>
                                        <div class="comment item">
                                            <i class="fa fa-comment"></i>

                                            <p>02</p>
                                        </div>
                                    </div>
                                    <div title="Rated 5.00 out of 5" class="star-rating"><span class="width-90"><strong class="rating">5.00</strong> out of 5</span></div>
                                    <div class="description">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout...</div>
                                    <button onclick="window.location.href='courses-detail.html'" style="padding-right: 106px" class="btn btn-green"><span>learn now</span></button>
                                </div>
                                <div class="edugate-image">
                                    <img src="assets/images/courses/courses-4.jpg" alt="" class="img-responsive" /></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="group-btn-top-courses-slider">
                    <div class="btn-prev">&lsaquo;</div>
                    <div class="btn-next">&rsaquo;</div>
                </div>
            </div>
        </div>
    </div>
    <%--   <!-- WHY CHOOSE US-->
                <div class="section why-choose-us">
                    <div class="why-choose-us-wrapper-top">
                        <div class="container">
                            <div class="why-choose-us-wrapper"><h2 class="title-2">Why Edugate?</h2>

                                <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.</p>
                                <button onclick="window.location.href='categories.html'" class="btn btn-green-2"><span>start Learn now</span></button>
                            </div>
                            <div data-wow-delay="0.2s" data-wow-duration="1.2s" class="background-girl-1 wow fadeInUp"><img src="assets/images/girl-1.png" alt="" class="img-responsive"/></div>
                        </div>
                    </div>
                    <div class="why-choose-us-wrapper-bottom background-opacity">
                        <div class="container">
                            <div data-wow-delay="0.4s" data-wow-duration="1s" class="row why-choose-us-wrapper wow zoomIn">
                                <div class="customs-row">
                                    <div class="col-sm-4 col-xs-6 section-icon"><i class="fa fa-pencil-square-o"></i>

                                        <p> Over 600 free tutorial</p></div>
                                    <div class="col-sm-4 col-xs-6 section-icon"><i class="fa fa-compress"></i>

                                        <p> Refund if not Satisfied</p></div>
                                </div>
                                <div class="customs-row">
                                    <div class="col-sm-4 col-xs-6 section-icon"><i class="fa fa-paper-plane"></i>

                                        <p> Easy to learning everytime, everywhere</p></div>
                                    <div class="col-sm-4 col-xs-6 section-icon"><i class="fa fa-folder-open"></i>

                                        <p> Over 3000 Ebook a-vailable</p></div>
                                </div>
                                <div class="customs-row">
                                    <div class="col-sm-4 col-xs-6 section-icon"><i class="fa fa-external-link"></i>

                                        <p> Free updates & support</p></div>
                                    <div class="col-sm-4 col-xs-6 section-icon"><i class="fa fa-stumbleupon-circle"></i>

                                        <p> Flexible payment methods</p></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- PRICING-->
                <div class="section section-padding pricing">
                    <div class="container">
                        <div class="group-title-index"><h4 class="top-title">chooses your pricing</h4>

                            <h2 class="center-title">the best pricing we offered</h2>

                            <div class="bottom-title"><i class="bottom-icon icon-a-1-01-01"></i></div>
                        </div>
                        <div class="row">
                            <div class="pricing-wrapper">
                                <div class="col-sm-4">
                                    <div class="pricing-widget">
                                        <div class="pricing-header">
                                            <div class="price-cost">
                                                <div class="inner"><p data-from="0" data-to="0" data-speed="1000" class="inner-number">0</p></div>
                                            </div>
                                        </div>
                                        <div class="pricing-content"><h3 class="pricing-title">trial</h3>

                                            <p class="pricing-subtitle">30 days free trial</p>
                                            <ul class="pricing-list">
                                                <li><p><strong>One day</strong> trial</p></li>
                                                <li><p><strong>Limited</strong> courses</p></li>
                                                <li><p><strong>Free</strong> 3 lessons</p></li>
                                                <li><p><strong>No</strong> supporter</p></li>
                                                <li><p><strong>No</strong> ebook</p></li>
                                                <li><p><strong>No</strong> tutorial</p></li>
                                                <li><p><strong>Limited</strong> registered user</p></li>
                                            </ul>
                                            <div class="pricing-button"><a href="#">choose plan</a></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="pricing-widget main active">
                                        <div class="pricing-header">
                                            <div class="price-cost">
                                                <div class="inner"><p data-from="0" data-to="35" data-speed="1000" class="inner-number">0</p></div>
                                            </div>
                                        </div>
                                        <div class="pricing-content"><h3 class="pricing-title">Standard</h3>

                                            <p class="pricing-subtitle">per month when paid annually</p>
                                            <ul class="pricing-list">
                                                <li><p><strong>One year</strong> standard access</p></li>
                                                <li><p><strong>Limited</strong> courses</p></li>
                                                <li><p><strong>300+</strong> lessons</p></li>
                                                <li><p><strong>Random</strong> supporter</p></li>
                                                <li><p><strong>View only</strong> ebook</p></li>
                                                <li><p><strong>Standard</strong> tutorials</p></li>
                                                <li><p><strong>Unlimited</strong> registered user</p></li>
                                            </ul>
                                            <div class="pricing-button"><a href="#">choose plan</a></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="pricing-widget">
                                        <div class="pricing-header">
                                            <div class="price-cost">
                                                <div class="inner"><p data-from="0" data-to="89" data-speed="1000" class="inner-number">0</p></div>
                                            </div>
                                        </div>
                                        <div class="pricing-content"><h3 class="pricing-title">Premiere</h3>

                                            <p class="pricing-subtitle">per month when paid annually</p>
                                            <ul class="pricing-list">
                                                <li><p><strong>Life time</strong> access</p></li>
                                                <li><p><strong>Unlimited</strong> All courses</p></li>
                                                <li><p><strong>3000+</strong> lessons & growing</p></li>
                                                <li><p><strong>Free</strong> supporter</p></li>
                                                <li><p><strong>Free</strong> Ebook Downloads</p></li>
                                                <li><p><strong>Premium</strong> tutorials</p></li>
                                                <li><p><strong>Unlimited</strong> registered user</p></li>
                                            </ul>
                                            <div class="pricing-button"><a href="#">choose plan</a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="group-btn-slider">
                            <div class="btn-prev"><i class="fa fa-angle-left"></i></div>
                            <div class="btn-next"><i class="fa fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>--%>
    <!-- SLIDER TALK ABOUT US-->
    <%--<div class="section background-opacity slider-talk-about-us">
        <div class="container">
            <div id="people-talk" data-ride="carousel" data-interval="5000" class="slider-talk-about-us-wrapper carousel slide">
                <div role="listbox" class="slider-talk-about-us-content carousel-inner">
                    <div class="peopel-item item active">
                        <p class="peopel-comment">" There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. "</p>

                        <div class="group-peole-info">
                            <div class="peopel-avatar">
                                <img src="assets/images/people-avatar-1.jpg" alt="" class="img-responsive" /></div>
                            <div class="peopel-name">john doe</div>
                            <div class="people-job">Microshop Crop.SEO</div>
                        </div>
                    </div>
                    <div class="peopel-item item">
                        <p class="peopel-comment">" There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. "</p>

                        <div class="group-peole-info">
                            <div class="peopel-avatar">
                                <img src="assets/images/people-avatar-1.jpg" alt="" class="img-responsive" /></div>
                            <div class="peopel-name">john doe</div>
                            <div class="people-job">Microshop Crop.SEO</div>
                        </div>
                    </div>
                    <div class="peopel-item item">
                        <p class="peopel-comment">" There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. "</p>

                        <div class="group-peole-info">
                            <div class="peopel-avatar">
                                <img src="assets/images/people-avatar-1.jpg" alt="" class="img-responsive" /></div>
                            <div class="peopel-name">john doe</div>
                            <div class="people-job">Microshop Crop.SEO</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>--%>
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
    <!-- BEST STAFF-->
    <%--<div class="section section-padding background-opacity best-staff">
        <div class="container">
            <div class="group-title-index">
                <h4 class="top-title">touch them if you want</h4>

                <h2 class="center-title">learn from the best</h2>

                <div class="bottom-title"><i class="bottom-icon icon-icon-05"></i></div>
            </div>
            <div class="best-staff-wrapper">
                <div class="best-staff-content">
                    <div class="staff-item">
                        <div class="staff-item-wrapper">
                            <div class="staff-info">
                                <a href="#" class="staff-avatar">
                                    <img src="assets/images/people-avatar-2.jpg" alt="" class="img-responsive" /></a><a href="#" class="staff-name">Alex trevor</a>

                                <div class="staff-job">head teacher</div>
                                <div class="staff-desctiption">Nam libelo tempore, cum soluta nobis est eligendi optio cumque nilhi impedil quo minus end maximie fade posimus the end.</div>
                            </div>
                        </div>
                        <div class="staff-socials"><a href="#" class="facebook"><i class="fa fa-facebook"></i></a><a href="#" class="google"><i class="fa fa-google-plus"></i></a><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></div>
                    </div>
                    <div class="staff-item">
                        <div class="staff-item-wrapper">
                            <div class="staff-info">
                                <a href="#" class="staff-avatar">
                                    <img src="assets/images/people-avatar-3.jpg" alt="" class="img-responsive" /></a><a href="#" class="staff-name">lana simth</a>

                                <div class="staff-job">vice head teacher</div>
                                <div class="staff-desctiption">Nam libelo tempore, cum soluta nobis est eligendi optio cumque nilhi impedil quo minus end maximie fade posimus the end.</div>
                            </div>
                        </div>
                        <div class="staff-socials"><a href="#" class="facebook"><i class="fa fa-facebook"></i></a><a href="#" class="google"><i class="fa fa-google-plus"></i></a><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></div>
                    </div>
                    <div class="staff-item">
                        <div class="staff-item-wrapper">
                            <div class="staff-info">
                                <a href="#" class="staff-avatar">
                                    <img src="assets/images/people-avatar-4.jpg" alt="" class="img-responsive" /></a><a href="#" class="staff-name">barry join</a>

                                <div class="staff-job">advisory professor</div>
                                <div class="staff-desctiption">Nam libelo tempore, cum soluta nobis est eligendi optio cumque nilhi impedil quo minus end maximie fade posimus the end.</div>
                            </div>
                        </div>
                        <div class="staff-socials"><a href="#" class="facebook"><i class="fa fa-facebook"></i></a><a href="#" class="google"><i class="fa fa-google-plus"></i></a><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></div>
                    </div>
                    <div class="staff-item">
                        <div class="staff-item-wrapper">
                            <div class="staff-info">
                                <a href="#" class="staff-avatar">
                                    <img src="assets/images/people-avatar-5.jpg" alt="" class="img-responsive" /></a><a href="#" class="staff-name">Ven Tomarme</a>

                                <div class="staff-job">Design teacher</div>
                                <div class="staff-desctiption">Nam libelo tempore, cum soluta nobis est eligendi optio cumque nilhi impedil quo minus end maximie fade posimus the end.</div>
                            </div>
                        </div>
                        <div class="staff-socials"><a href="#" class="facebook"><i class="fa fa-facebook"></i></a><a href="#" class="google"><i class="fa fa-google-plus"></i></a><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="group-btn-slider">
            <div class="btn-prev"><i class="fa fa-angle-left"></i></div>
            <div class="btn-next"><i class="fa fa-angle-right"></i></div>
        </div>
    </div>--%>
    <!-- PICTURE AND GALLERY-->
    
</asp:Content>
