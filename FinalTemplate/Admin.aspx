<%@ Page Title="AdminPanel - CES " Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="FinalTemplate.Admin1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
    
    <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#topStudents').addClass('topPadding');
            $('#teachingstaff').addClass('teachingbackgroundImage');
            $('.btn').css('width', 'auto');
            $('.item-course').css("height", "280px");
            $('#scrollLogo').css({ 'height': '54px', 'width': '63px' });
            $('#mainLogo').css({ 'height': '90px', 'width': '105px' });
            $('div img[alt=TeacherOfTheMonth]').css({ 'width': '350px', 'height': '450px', 'border-radius': '50%' });
            $('div.staff-info a img[alt=teachers]').css({ 'height': '150px', 'width': '150px' });
            $('.best-staff-wrapper').mouseenter(function () {
                 $('a img').css({ 'height': '150px', 'width': '150px','transition':'3s'});
            });
        });
    </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
    <!-- SLIDER BANNER-->
    <div class="section slider-banner-03 background-opacity-2">
        <div class="container">
            <div class="slider-banner-wrapper">
                <h3 data-wow-delay="0.5s" class="sub-title wow fadeInUp">Last Login Date:03/08/2016 &nbsp;&nbsp;Last Login Time: 09:23:00 AM</h3>

                <h1 data-wow-delay="0.5s" class="main-title wow fadeInUp">
                    <asp:Label Text="school name" ID="lbl_schoolid" runat="server"></asp:Label></h1>

                <div class="group-button">
                    <button data-wow-delay="1.3s" data-wow-duration="1s" class="btn btn-transition-3 wow fadeInLeft">
                        <span>
                            <asp:Button runat="server" ID="btn_logout" Text="LOGOUT" OnClick="btn_logout_Click" Style="background-color: transparent" BorderStyle="None" />
                        </span>

                    </button>
                    <a href="UpdateSchoolInformation.aspx" data-wow-delay="1.3s" data-wow-duration="1s" class="btn btn-green-3 wow fadeInRight"><span>Update Profile Details</span></a>
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
                    <div class="info-course">
                        <a href="#" class="name-course">Results</a>

                        <div class="info">Search, view and generate results for any type of exames. You can also check feedback regarding any result posted by students or parents.</div>
                    </div>
                </div>
            </div>
            <div class="item-course">
                <div class="item-course-wrapper">
                    <div class="icon-course"><i class="icons-img fa fa-database"></i></div>
                    <div class="info-course">
                        <a href="#" class="name-course">Management</a>

                        <div class="info">All features related to any management section are available in this section of website. Click anywhere on this to view more options.</div>
                    </div>
                </div>
            </div>
            <div class="item-course">
                <div class="item-course-wrapper">
                    <div class="icon-course"><i class="icons-img icon-computer_network"></i></div>
                    <div class="info-course">
                        <a href="#" class="name-course">School Feedback</a>

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
                    </a>
                </div>
            </div>
            <div class="item-course">
                <div class="item-course-wrapper">
                    <div class="icon-course"><i class="icons-img icon-credit_card"></i></div>
                    <div class="info-course">
                        <a href="#" class="name-course">Business</a>

                        <div class="info">Check your monthly expense and view subscription details. Keep an eye on everything that is important. If you find any kind of information irrelevent to your school kindly let us know my going to support section.</div>
                    </div>
                </div>
            </div>
            <div class="item-course">
                <div class="item-course-wrapper">
                    <div class="icon-course"><i class="icons-img icon-chat_bubbles"></i></div>
                    <div class="info-course">
                        <a href="#" class="name-course">Communication</a>

                        <div class="info">Make some interaction to students/parents and answer some queries. Click to check what is available now.</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- TOP COURSES-->
    <div class="section section-padding top-courses">
        <div class="container">
            <div class="group-title-index">
                <h2 class="center-title">Pending Requests</h2>
                <div class="bottom-title"><i class="bottom-icon icon-icon-04"></i></div>
                <div class="container teacher-course-wrapper">
                    <div class="inner-container">
                        <div class="table-header">
                            <table class="edu-table-responsive">
                                <thead>
                                    <tr class="heading-table">
                                        <th class="col-3">Teacher ID</th>
                                        <th class="col-2">Teacher Name</th>
                                        <th class="col-3">Make Teacher Of the Month</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row">
                                        <td class="col-3"><span>ED1</span></td>
                                        <td class="col-2"><a href="courses-detail.html">Sport Exercise Sciences</a></td>
                                        <td class="col-3"><span>
                                            <asp:Button ID="btn1" Text="Okay" runat="server" /><asp:Button ID="btn2" Text="Reject" runat="server" /></span></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>ED1</span></td>
                                        <td class="col-2"><a href="courses-detail.html">Learning Website Optimization With Bootstrap</a></td>
                                        <td class="col-3"><span>
                                            <asp:Button ID="Button1" Text="Okay" runat="server" /><asp:Button ID="Button2" Text="Reject" runat="server" /></span></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>ED1</span></td>
                                        <td class="col-2"><a href="courses-detail.html">Skeching Custom Item Prize Design</a></td>
                                        <td class="col-3"><span>
                                            <asp:Button ID="Button3" Text="Okay" runat="server" /><asp:Button ID="Button4" Text="Reject" runat="server" /></span></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>ED1</span></td>
                                        <td class="col-2"><a href="courses-detail.html">Learning Website Optimization With Bootstrap</a></td>
                                        <td class="col-3"><span>
                                            <asp:Button ID="Button5" Text="Okay" runat="server" /><asp:Button ID="Button6" Text="Reject" runat="server" /></span></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>ED1</span></td>
                                        <td class="col-2"><a href="courses-detail.html">Learning Viral Web Design Projects</a></td>
                                        <td class="col-3"><span>
                                            <asp:Button ID="Button7" Text="Okay" runat="server" /><asp:Button ID="Button8" Text="Reject" runat="server" /></span></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>ED1</span></td>
                                        <td class="col-2"><a href="courses-detail.html">Email Marketing Strategy With MailChimp</a></td>
                                        <td class="col-3"><span>
                                            <asp:Button ID="Button9" Text="Okay" runat="server" /><asp:Button ID="Button10" Text="Reject" runat="server" /></span></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>ED1</span></td>
                                        <td class="col-2"><a href="courses-detail.html">Social Media Network & Marketing</a></td>
                                        <td class="col-3"><span>
                                            <asp:Button ID="Button11" Text="Okay" runat="server" /><asp:Button ID="Button12" Text="Reject" runat="server" /></span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                        </div>
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
                                <div class="progress-bar-number">
                                    <div data-from="0" data-to="45" data-speed="1000" class="num">0</div>
                                    <p class="name-inner">Registered Teachers</p>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="progress-bar-number">
                                    <div data-from="0" data-to="56" data-speed="1000" class="num">0</div>
                                    <p class="name-inner">Offered Courses</p>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="progress-bar-number">
                                    <div data-from="0" data-to="165" data-speed="1000" class="num">0</div>
                                    <p class="name-inner">Registered Students</p>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="progress-bar-number">
                                    <div data-from="0" data-to="15" data-speed="1000" class="num">0</div>
                                    <p class="name-inner">Total Registered Users</p>
                                </div>
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
                <div class="why-choose-us-wrapper">
                    <h2 class="title-2">Teacher of the month </h2>

                    <p>Miss shaista noor was selected as teacher of the month on the basis of her execellent performance.</p>
                    <button onclick="window.location.href='categories.html'" class="btn btn-green-2"><span>View Complete Profile</span></button>
                </div>
                <div data-wow-delay="0.2s" data-wow-duration="1.2s" class="background-girl-1 wow fadeInUp">
                    <img src="assets/images/girl-1.png" alt="TeacherOfTheMonth" class="img-responsive" /></div>
            </div>
        </div>
        
        <div class="why-choose-us-wrapper-bottom background-opacity">
            <div class="container">
                <div data-wow-delay="0.4s" data-wow-duration="1s" class="row why-choose-us-wrapper wow zoomIn">
                    <div class="customs-row">
                        <div class="col-sm-4 col-xs-6 section-icon">
                            <i class="fa fa-pencil-square-o"></i>

                            <p>343 Days Present</p>
                        </div>
                        <div class="col-sm-4 col-xs-6 section-icon">
                            <i class="fa fa-folder-open"></i>
                            <p>Updates all tasks on time.</p>
                        </div>
                        <div class="col-sm-4 col-xs-6 section-icon">
                            <i class="fa fa-external-link"></i>

                            <p>003 Days Absent</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BEST STAFF-->
    <div id="teachingstaff" class="section section-padding background-opacity best-staff">
        <div class="container">
            <div class="group-title-index">
                <h4 class="top-title">Complete teacher list</h4>

                <h2 class="center-title">Here is your teaching staff</h2>

                <div class="bottom-title"><i class="bottom-icon icon-icon-05"></i></div>
            </div>
            <div class="best-staff-wrapper">
                <div class="best-staff-content">
                    <div class="staff-item">
                        <div class="staff-item-wrapper">
                            <div class="staff-info">
                                <a href="#" class="staff-avatar">
                                    <img src="assets/images/cesThemeImages/teachers (1).jpg" alt="teachers" class="img-responsive" /></a><a href="#" class="staff-name">Zaheer Abro</a>

                                <div class="staff-job">head teacher</div>
                                <div class="staff-desctiption"><a href="#">Send Email</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#" >Send SMS</a></div>
                            </div>
                        </div>
                        <div class="staff-socials"><a href="#" class="facebook"><i class="fa fa-facebook"></i></a><a href="#" class="google"><i class="fa fa-google-plus"></i></a><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></div>
                    </div>
                    <div class="staff-item">
                        <div class="staff-item-wrapper">
                            <div class="staff-info">
                                <a href="#" class="staff-avatar">
                                    <img src="assets/images/cesThemeImages/teachers (2).jpg" alt="teachers" class="img-responsive" /></a><a href="#" class="staff-name">Saeen Soomro</a>

                                <div class="staff-job">vice head teacher</div>
                                <div class="staff-desctiption"><a href="#" >Send Email</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" >Send SMS</a></div>
                            </div>
                        </div>
                        <div class="staff-socials"><a href="#" class="facebook"><i class="fa fa-facebook"></i></a><a href="#" class="google"><i class="fa fa-google-plus"></i></a><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></div>
                    </div>
                    <div class="staff-item">
                        <div class="staff-item-wrapper">
                            <div class="staff-info">
                                <a href="#" class="staff-avatar">
                                    <img src="assets/images/cesThemeImages/teachers (3).jpg" alt="teachers" class="img-responsive" /></a><a href="#" class="staff-name">barry join</a>

                                <div class="staff-job">advisory professor</div>
                                <div class="staff-desctiption"><a href="#" >Send Email</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" >Send SMS</a></div>
                            </div>
                        </div>
                        <div class="staff-socials"><a href="#" class="facebook"><i class="fa fa-facebook"></i></a><a href="#" class="google"><i class="fa fa-google-plus"></i></a><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></div>
                    </div>
                    <div class="staff-item">
                        <div class="staff-item-wrapper">
                            <div class="staff-info">
                                <a href="#" class="staff-avatar">
                                    <img src="assets/images/cesThemeImages/teachers (4).jpg" alt="teachers" class="img-responsive" /></a><a href="#" class="staff-name">Ven Tomarme</a>

                                <div class="staff-job">Design teacher</div>
                                <div class="staff-desctiption"><a href="#" >Send Email</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" >Send SMS</a></div>
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
            <div class="group-title-index">
                <h4 class="top-title">latest news</h4>

                <h2 class="center-title">Last news you have updated on the portal</h2>

                <div class="bottom-title"><i class="bottom-icon icon-a-01-01"></i></div>
            </div>
            <div class="latest-news-wrapper">
                <div class="edugate-layout-1">
                    <div class="edugate-image">
                        <img src="assets/images/news/news-1.jpg" alt="" class="img-responsive" /></div>
                    <div class="edugate-content">
                        <a href="news-detail.html" class="title">New Year Function</a>

                        <div class="info">
                            <div class="author item"><a href="#">By Admin</a></div>
                            <div class="date-time item"><a href="#">17 sep 2015</a></div>
                        </div>
                        <div class="description">All Students from all classes are invited to attend the event. It is for every student and they can bring their friends and loved ones too. All Students from all classes are invited to attend the event. It is for every student and they can bring their friends and loved ones too.</div>
                        <button onclick="window.location.href='news-detail.html'" class="btn btn-green"><span>learn now</span></button>
                    </div>
                </div>
                <button class="btn btn-green btn-latest-new"><span>Browser All Post<i class="fa fa-long-arrow-right"></i></span></button>
            </div>
        </div>
    </div>


</asp:Content>
