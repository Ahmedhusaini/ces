<%@ Page Title="AdminPanel - CES " Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="FinalTemplate.Admin1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
    
    <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#topStudents').addClass('topPadding');
            $('#teachingstaff').addClass('teachingbackgroundImage');
            $('.btn').css('width', 'auto');
            $('.item-course').css("height", "280px");
        });
    </script> 
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
                <!-- SLIDER BANNER-->
                <div class="section slider-banner-03 background-opacity-2">
                    <div class="container">
                        <div class="slider-banner-wrapper"><h3 data-wow-delay="0.5s" class="sub-title wow fadeInUp">Login Date:03/08/2016 &nbsp;&nbsp; Login Time: 09:23:00 AM</h3>

                            <h1 data-wow-delay="0.5s" class="main-title wow fadeInUp"><asp:Label Text="school name" ID="lbl_schoolid" runat="server"></asp:Label></h1>

                            <div class="group-button">
                                <button data-wow-delay="1.3s" data-wow-duration="1s" class="btn btn-transition-3 wow fadeInLeft">
                                    <span>
                                        <asp:Button runat="server" ID="btn_logout" Text="LOGOUT" OnClick="btn_logout_Click" Style="background-color: transparent" BorderStyle="None" />
                                    </span>

                                </button>
                                <button data-wow-delay="1.3s" data-wow-duration="1s" class="btn btn-green-3 wow fadeInRight"><span>Update Profile Details</span></button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- CHOOSE COURSES-->
                <div class="section choose-course-3">
                    <div class="choose-course-3-wrapper row">
                        <div class="item-course">
                            <div class="item-course-wrapper">
                                <div class="icon-course"><i class="icons-img icon-globe"></i></div>
                                <div class="info-course"><a href="#" class="name-course">Results</a>

                                    <div class="info">Search, view and generate results for any type of exames. You can also check feedback regarding any result posted by students or parents.</div>
                                </div>
                            </div>
                        </div>
                        <div class="item-course">
                            <div class="item-course-wrapper">
                                <div class="icon-course"><i class="icons-img fa fa-database"></i></div>
                                <div class="info-course"><a href="#" class="name-course">Management</a>

                                    <div class="info">All features related to any management section are available in this section of website. Click anywhere on this to view more options.</div>
                                </div>
                            </div>
                        </div>
                        <div class="item-course">
                            <div class="item-course-wrapper">
                                <div class="icon-course"><i class="icons-img icon-computer_network"></i></div>
                                <div class="info-course"><a href="#" class="name-course">School Feedback</a>

                                    <div class="info">Check what other people are saying about your school. View their feedback for improvement.</div>
                                </div>
                            </div>
                        </div>
                        <div class="item-course" style="height: 280px;">
                            <div class="item-course-wrapper">
                                <div class="icon-course"><i class="icons-img icon-photocamera_1"></i></div>
                                <a href="#" class="info-course">
                                    <div class="name-course">Photography</div>
                                    <div class="info">Relive the past memories and view all pictures from past events and functions.</div>
                                </a></div>
                        </div>
                        <div class="item-course">
                            <div class="item-course-wrapper">
                                <div class="icon-course"><i class="icons-img icon-credit_card"></i></div>
                                <div class="info-course"><a href="#" class="name-course">Business</a>

                                    <div class="info">Check your monthly expense and view subscription details. Keep an eye on everything that is important. If you find any kind of information irrelevent to your school kindly let us know my going to support section.</div>
                                </div>
                            </div>
                        </div>
                        <div class="item-course">
                            <div class="item-course-wrapper">
                                <div class="icon-course"><i class="icons-img icon-chat_bubbles"></i></div>
                                <div class="info-course"><a href="#" class="name-course">Communication</a>

                                    <div class="info">Make some interaction to students/parents and answer some queries. Click to check what is available now.</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- SLIDER TALK ABOUT US-->                                        
                <div class="section background-opacity slider-talk-about-us">
                    <div class="container">
                         

                        <div id="people-talk" data-ride="carousel" data-interval="5000" class="slider-talk-about-us-wrapper carousel slide">
                            <div role="listbox" class="slider-talk-about-us-content carousel-inner">
                                <div class="peopel-item item active"><p class="peopel-comment">" There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. "</p>

                                    <div class="group-peole-info">
                                        <div class="peopel-avatar"><img src="assets/images/people-avatar-1.jpg" alt="" class="img-responsive"/></div>
                                        <div class="peopel-name">john doe</div>
                                        <div class="people-job">Microshop Crop.SEO</div>
                                    </div>
                                </div>
                                <div class="peopel-item item"><p class="peopel-comment">" There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. "</p>

                                    <div class="group-peole-info">
                                        <div class="peopel-avatar"><img src="assets/images/people-avatar-1.jpg" alt="" class="img-responsive"/></div>
                                        <div class="peopel-name">john doe</div>
                                        <div class="people-job">Microshop Crop.SEO</div>
                                    </div>
                                </div>
                                <div class="peopel-item item"><p class="peopel-comment">" There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. "</p>

                                    <div class="group-peole-info">
                                        <div class="peopel-avatar"><img src="assets/images/people-avatar-1.jpg" alt="" class="img-responsive"/></div>
                                        <div class="peopel-name">john doe</div>
                                        <div class="people-job">Microshop Crop.SEO</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="group-btn-slider"><a href="#people-talk" role="button" data-slide="prev">
                        <div class="btn-prev carousel-control left"><i class="fa fa-angle-left"></i></div>
                    </a><a href="#people-talk" role="button" data-slide="next">
                        <div class="btn-next carousel-control right"><i class="fa fa-angle-right"></i></div>
                    </a></div>
                </div>
                <!-- TOP COURSES-->
                <div class="section section-padding top-courses">
                    <div class="container">
                        <div class="group-title-index"><h4 class="top-title">CHOOSE YOUR COURSE</h4>

                            <h2 class="center-title">the top popular courses for you</h2>

                            <div class="bottom-title"><i class="bottom-icon icon-icon-04"></i></div>
                        </div>
                        <div class="top-courses-wrapper">
                            <div class="top-courses-slider">
                                <div class="top-courses-item">
                                    <div class="edugate-layout-2">
                                        <div class="edugate-layout-2-wrapper">
                                            <div class="edugate-content"><a href="courses-detail.html" class="title">Photoghaphy Master</a>

                                                <div class="info">
                                                    <div class="author item"><a href="#">By Admin</a></div>
                                                    <div class="date-time item"><a href="#">17 sep 2015</a></div>
                                                </div>
                                                <div class="info-more">
                                                    <div class="view item"><i class="fa fa-user"></i>

                                                        <p> 56</p></div>
                                                    <div class="comment item"><i class="fa fa-comment"></i>

                                                        <p> 239</p></div>
                                                </div>
                                                <div title="Rated 5.00 out of 5" class="star-rating"><span class="width-80"><strong class="rating">5.00</strong> out of 5</span></div>
                                                <div class="description">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout...</div>
                                                <button onclick="window.location.href='courses-detail.html'" class="btn btn-green"><span>learn now</span></button>
                                            </div>
                                            <div class="edugate-image"><img src="assets/images/courses/courses-1.jpg" alt="" class="img-responsive"/></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="top-courses-item">
                                    <div class="edugate-layout-2">
                                        <div class="edugate-layout-2-wrapper">
                                            <div class="edugate-content"><a href="courses-detail.html" class="title">Photoghaphy Master</a>

                                                <div class="info">
                                                    <div class="author item"><a href="#">By Admin</a></div>
                                                    <div class="date-time item"><a href="#">17 sep 2015</a></div>
                                                </div>
                                                <div class="info-more">
                                                    <div class="view item"><i class="fa fa-user"></i>

                                                        <p> 56</p></div>
                                                    <div class="comment item"><i class="fa fa-comment"></i>

                                                        <p> 239</p></div>
                                                </div>
                                                <div title="Rated 5.00 out of 5" class="star-rating"><span class="width-10"><strong class="rating">5.00</strong> out of 5</span></div>
                                                <div class="description">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout...</div>
                                                <button onclick="window.location.href='courses-detail.html'" class="btn btn-green"><span>learn now</span></button>
                                            </div>
                                            <div class="edugate-image"><img src="assets/images/courses/courses-2.jpg" alt="" class="img-responsive"/></div>
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
                <!-- SLIDER LOGO-->
                <div class="section slider-logo">
                    <div class="container">
                        <div class="slider-logo-wrapper">
                            <div class="slider-logo-content">
                                <div class="carousel-logos owl-carousel">
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-1.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-2.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-3.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-4.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-5.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-6.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-1.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-2.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-3.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-4.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-5.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-6.png" alt="" class="img-responsive"/></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- PROGRESS BARS-->
                <div class="section progress-bars section-padding">
                    <div class="container">
                        <div class="progress-bars-content">
                            <div class="progress-bar-wrapper"><h2 class="title-2">Some useful information about your school</h2>

                                <div class="row">
                                    <div class="content">
                                        <div class="col-sm-3">
                                            <div class="progress-bar-number">
                                                <div data-from="0" data-to="45" data-speed="1000" class="num">0</div>
                                                <p class="name-inner">teachers</p></div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="progress-bar-number">
                                                <div data-from="0" data-to="56" data-speed="1000" class="num">0</div>
                                                <p class="name-inner">courses</p></div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="progress-bar-number">
                                                <div data-from="0" data-to="165" data-speed="1000" class="num">0</div>
                                                <p class="name-inner">members</p></div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="progress-bar-number">
                                                <div data-from="0" data-to="15" data-speed="1000" class="num">0</div>
                                                <p class="name-inner">Countries</p></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="group-button">
                                    <button onclick="window.location.href='categories.html'" class="btn btn-transition-3"><span>View Statics</span></button>
                                    <button onclick="window.location.href='about-us.html'" class="btn btn-green-3"><span>Generate Report</span></button>
                                </div>
                                <div class="group-btn-slider">
                                    <div class="btn-prev"><i class="fa fa-angle-left"></i></div>
                                    <div class="btn-next"><i class="fa fa-angle-right"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- WHY CHOOSE US-->
                <div class="section why-choose-us">
                    <div class="why-choose-us-wrapper-top">
                        <div class="container">
                            <div class="why-choose-us-wrapper"><h2 class="title-2">Name of the teacher</h2>

                                <p>introduction of the teacher and his/her achievements</p>
                                <button onclick="window.location.href='categories.html'" class="btn btn-green-2"><span>View Complete Profile</span></button>
                            </div>
                            <div data-wow-delay="0.2s" data-wow-duration="1.2s" class="background-girl-1 wow fadeInUp"><img src="assets/images/girl-1.png" alt="" class="img-responsive"/></div>
                        </div>
                    </div>
                    <div class="why-choose-us-wrapper-bottom background-opacity">
                        <div class="container">
                            <div data-wow-delay="0.4s" data-wow-duration="1s" class="row why-choose-us-wrapper wow zoomIn">
                                <div class="customs-row">
                                    <div class="col-sm-4 col-xs-6 section-icon"><i class="fa fa-pencil-square-o"></i>

                                        <p>343 Days Present</p></div>
                                    <div class="col-sm-4 col-xs-6 section-icon"><i class="fa fa-folder-open"></i>
                                        <p>Updates all tasks on time.</p>
                                    </div>
                                    <div class="col-sm-4 col-xs-6 section-icon"><i class="fa fa-external-link"></i>

                                        <p>003 Days Absent</p></div>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>
                <!-- BEST STAFF-->
                <div id="teachingstaff" class="section section-padding background-opacity best-staff">
                    <div class="container">
                        <div class="group-title-index"><h4 class="top-title">Complete teacher list</h4>

                            <h2 class="center-title">Here is your teaching staff</h2>

                            <div class="bottom-title"><i class="bottom-icon icon-icon-05"></i></div>
                        </div>
                        <div class="best-staff-wrapper">
                            <div class="best-staff-content">
                                <div class="staff-item">
                                    <div class="staff-item-wrapper">
                                        <div class="staff-info"><a href="#" class="staff-avatar"><img src="assets/images/people-avatar-2.jpg" alt="" class="img-responsive"/></a><a href="#" class="staff-name">Alex trevor</a>

                                            <div class="staff-job">head teacher</div>
                                            <div class="staff-desctiption">Nam libelo tempore, cum soluta nobis est eligendi optio cumque nilhi impedil quo minus end maximie fade posimus the end.</div>
                                        </div>
                                    </div>
                                    <div class="staff-socials"><a href="#" class="facebook"><i class="fa fa-facebook"></i></a><a href="#" class="google"><i class="fa fa-google-plus"></i></a><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></div>
                                </div>
                                <div class="staff-item">
                                    <div class="staff-item-wrapper">
                                        <div class="staff-info"><a href="#" class="staff-avatar"><img src="assets/images/people-avatar-3.jpg" alt="" class="img-responsive"/></a><a href="#" class="staff-name">lana simth</a>

                                            <div class="staff-job">vice head teacher</div>
                                            <div class="staff-desctiption">Nam libelo tempore, cum soluta nobis est eligendi optio cumque nilhi impedil quo minus end maximie fade posimus the end.</div>
                                        </div>
                                    </div>
                                    <div class="staff-socials"><a href="#" class="facebook"><i class="fa fa-facebook"></i></a><a href="#" class="google"><i class="fa fa-google-plus"></i></a><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></div>
                                </div>
                                <div class="staff-item">
                                    <div class="staff-item-wrapper">
                                        <div class="staff-info"><a href="#" class="staff-avatar"><img src="assets/images/people-avatar-4.jpg" alt="" class="img-responsive"/></a><a href="#" class="staff-name">barry join</a>

                                            <div class="staff-job">advisory professor</div>
                                            <div class="staff-desctiption">Nam libelo tempore, cum soluta nobis est eligendi optio cumque nilhi impedil quo minus end maximie fade posimus the end.</div>
                                        </div>
                                    </div>
                                    <div class="staff-socials"><a href="#" class="facebook"><i class="fa fa-facebook"></i></a><a href="#" class="google"><i class="fa fa-google-plus"></i></a><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></div>
                                </div>
                                <div class="staff-item">
                                    <div class="staff-item-wrapper">
                                        <div class="staff-info"><a href="#" class="staff-avatar"><img src="assets/images/people-avatar-5.jpg" alt="" class="img-responsive"/></a><a href="#" class="staff-name">Ven Tomarme</a>

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
                </div>
                <!--LATEST NEW-->
                <div class="section section-padding latest-news">
                    <div class="container">
                        <div class="group-title-index"><h4 class="top-title">latest news</h4>

                            <h2 class="center-title">all about edugate updates</h2>

                            <div class="bottom-title"><i class="bottom-icon icon-a-01-01"></i></div>
                        </div>
                        <div class="latest-news-wrapper">
                            <div class="edugate-layout-1">
                                <div class="edugate-image"><img src="assets/images/news/news-1.jpg" alt="" class="img-responsive"/></div>
                                <div class="edugate-content"><a href="news-detail.html" class="title">Effective researching method</a>

                                    <div class="info">
                                        <div class="author item"><a href="#">By Admin</a></div>
                                        <div class="date-time item"><a href="#">17 sep 2015</a></div>
                                    </div>
                                    <div class="info-more">
                                        <div class="view item"><i class="fa fa-user"></i>

                                            <p> 56</p></div>
                                        <div class="comment item"><i class="fa fa-comment"></i>

                                            <p> 239</p></div>
                                    </div>
                                    <div class="description">Dalmatian hello amazing the rmore flung as thanks a manta dealt to under emu some the and one baldbe dear sobbingly save and spitefully less Dalmatian hello amazing the rmore flung as thanks a manta dealt to under emu some the and one baldbe dear sobbingly save and spitefully Dalmatian hello amazing the...</div>
                                    <button onclick="window.location.href='news-detail.html'" class="btn btn-green"><span>learn now</span></button>
                                </div>
                            </div>                                                 
                            <button class="btn btn-green btn-latest-new"><span>Browser All Post<i class="fa fa-long-arrow-right"></i></span></button>
                        </div>
                    </div>
                </div>
                                            
              
</asp:Content>
