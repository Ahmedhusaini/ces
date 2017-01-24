<%@ Page Title="AdminPanel - CES " Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="FinalTemplate.Admin1" %>
<%@ Import Namespace="FinalTemplate.source.Functions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
    
    <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            OtherFix();
            UserCount();
            TeacherOfTheMonth();
            LastestNews();
        });

        function LastestNews() {
            var parentdiv = $('.latest-news-wrapper');
            parentdiv.empty();
            var schid = $('#sid').val();
            $.ajax({
                url: 'source/WebServices/News.asmx/GetLastNewsBySchoolID',
                method: 'post',
                data: { _schoolid: schid },
                dataType: 'json',
                success: function(data) {
                    var str = JSON.stringify(data);
                    var array = $.parseJSON(str);
                    $.each(array, function(i, v) {
                        parentdiv.append('<div class="edugate-layout-1"><div class="edugate-image"><img src="' + v.Image + '" alt="" class="img-responsive" /></div><div class="edugate-content"><a href="#" class="title">' + v.Title + '</a><div class="info"><div class="author item"></div><div class="date-time item"></div></div><div class="description">' + v.Description + '</div><button id="browseall" class="btn btn-green"><span><a href="UpdateNews.aspx?NC=' + v.NewsID + '">Details</a></span></button></div></div><button style="padding-right:175px;" class="btn btn-green btn-latest-new"><span><a href="ViewNews.aspx">Browser All Post</a><i class="fa fa-long-arrow-right"></i></span></button> </div>');
                        $('#browseall').css('width', '200px');
                    });
                },
                error: function(data) {
                    alert("Error:"+data);
                }
            });
        }

        function TeacherOfTheMonth() {
            var schoolid = $('#sid').val();
            $.ajax({
                url: 'source/WebServices/School.asmx/Teacherofthemonthphoto',
                method: 'post',
                data: { _schoolid: schoolid },
                dataType: 'json',
                success: function(data) {
                    var objdata = JSON.stringify(data);
                    var jsonarr = $.parseJSON(objdata);
                    var container = $('#teacherofthemonthimage');
                    
                    container.empty();
                    container.append('<div class="why-choose-us-wrapper"><h2 class="title-2">Teacher of the month</h2><p>' + jsonarr.firstname + ' ' + jsonarr.lastname + '</p><button class="btn btn-green-2"><span><a href="UpdateTeacherInformation.aspx?IAC=' + jsonarr.teacherid + '">View Complete Profile</a></span></button></div><div data-wow-delay="0.2s" data-wow-duration="1.2s" class="background-girl-1 wow fadeInUp"><img src="images/teachers/' + jsonarr.photo + '" alt="TeacherOfTheMonth" class="img-responsive" /></div></div>');
                    $('button[class="btn btn-green-2"]').css('width', '215px');
                },
                error: function(data) {
                    alert("Error" + JSON.stringify(data));
                }
            });
        }
        
        function UserCount() {
            var schoolid = $('#sid').val();
            $.ajax({
                url: 'source/WebServices/School.asmx/GetNumberOfUsers',
                method:'post',
                data: { _schoolid: schoolid },
                dataType: 'json',
                success: function(data) {
                    var jsonarray = JSON.stringify(data);
                    var array = $.parseJSON(jsonarray);
                    var course = $('#divcourse').empty();
                    var student = $('#divstudent').empty();
                    var teacher = $('#divteacher').empty();
                    var totalusers = $('#divtotalusers').empty();
                    course.append(' <div data-from="0" data-to="' + array.course + '" data-speed="1000" class="num">0</div><p class="name-inner">Offered Courses</p>');
                    student.append(' <div  data-from="0" data-to="' + array.student + '" data-speed="1000" class="num">0</div> <p class="name-inner">Registered Students</p>');
                    teacher.append('<div  data-from="0" data-to="' + array.teacher + '" data-speed="1000" class="num">0</div><p class="name-inner">Registered Teachers</p>');
                    totalusers.append('<div data-from="0" data-to="' + array.totaluser + '" data-speed="1000" class="num">0</div><p class="name-inner">Total Registered Users</p>');
                },
                error: function(data) {
                    alert("ERROR" + JSON.stringify(data));
                }
            });
        }

        function OtherFix() {
            $('#topStudents').addClass('topPadding');
            $('#teachingstaff').addClass('teachingbackgroundImage');
            $('.btn').css('width', 'auto');
            $('.item-course').css("height", "280px");
            $('#scrollLogo').css({ 'height': '54px', 'width': '63px' });
            $('#mainLogo').css({ 'height': '90px', 'width': '105px' });
            $('div.staff-info a img[alt=teachers]').css({ 'height': '150px', 'width': '150px' });
           
        }
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
                        <input type="hidden" value="<%=JSchool.SchoolID %>" id="sid" />
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
                    <a href="TeacherOfTheMonth.aspx"><div class="icon-course"><i class="icons-img icon-globe"></i></div></a>
                    <div class="info-course">
                        <a href="TeacherOfTheMonth.aspx" class="name-course">Teacher OF the Month</a>
                        
                        <div class="info">You will be able to make any teacher <b>"Teacher Of The Month"</b> who belong to your shcool. There will be some static data which shows and hightlight the abilities of teacher and gives you the option to view his/her profile.</div>
                    </div>
                </div>
            </div>
            <div class="item-course">
                <div class="item-course-wrapper">
                    <a href="TeacherPrivileges.aspx"><div class="icon-course"><i class="icons-img fa fa-database"></i></div></a>
                    <div class="info-course">
                        <a href="TeacherPrivileges.aspx" class="name-course">Management Of Rights</a>

                        <div class="info">On the teacher privileges page you can assign or unassing different rights to particular teacher. These options are also used for temporary access.</div>
                    </div>
                </div>
            </div>
            <div class="item-course">
                <div class="item-course-wrapper">
                    <a href="UpdateSchoolInformation.aspx"><div class="icon-course"><i class="icons-img icon-computer_network"></i></div></a>
                    <div class="info-course">
                        <a href="UpdateSchoolInformation.aspx" class="name-course">School Profile</a>

                        <div class="info">You are allowed to change your school details as you want. This section of page contain all inforatiom about the school profile.</div>
                    </div>
                </div>
            </div>
            <div class="item-course" style="height: 280px;">
                <div class="item-course-wrapper">
                    <a href="PackageInformation.aspx"><div class="icon-course"><i class="icons-img icon-photocamera_1"></i></div></a>
                    <a href="PackageInformation.aspx" class="info-course">
                        <div class="name-course">View Package Informations</div>
                        <div class="info">You can get every detail about your package and check what options you are left which.</div>
                    </a>
                </div>
            </div>
            <div class="item-course">
                <div class="item-course-wrapper">
                    <a href="PostJob.aspx"><div class="icon-course"><i class="icons-img icon-credit_card"></i></div></a>
                    <div class="info-course">
                        <a href="PostJob.aspx" class="name-course">Jobs</a>

                        <div class="info">You can post jobs directly to the CES Portal where all users can see your post of JOB and will contact you via CES Contact US page.</div>
                    </div>
                </div>
            </div>
            <div class="item-course">
                <div class="item-course-wrapper">
                    <a href="PostNews.aspx"><div class="icon-course"><i class="icons-img icon-chat_bubbles"></i></div></a>
                    <div class="info-course">
                        <a href="PostNews.aspx" class="name-course">NEWS</a>

                        <div class="info">News is very important task to everybody and you can also post NEWS about your school to CES portal and let others know about it. You can post any type of NEWS.</div>
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
                                <div id="divteacher" class="progress-bar-number">
                                    <%--<div  data-from="0" data-to="0" data-speed="1000" class="num">0</div>
                                    <p class="name-inner">Registered Teachers</p>--%>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div id="divcourse" class="progress-bar-number">
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
                                <div id="divtotalusers" class="progress-bar-number">
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
    
    <!-- WHY CHOOSE US-->
    <div class="section why-choose-us">
        <div class="why-choose-us-wrapper-top">
            <div id="teacherofthemonthimage" class="container">
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

                            <p>Works Hard</p>
                        </div>
                        <div class="col-sm-4 col-xs-6 section-icon">
                            <i class="fa fa-folder-open"></i>
                            <p>Updates all tasks on time.</p>
                        </div>
                        <div class="col-sm-4 col-xs-6 section-icon">
                            <i class="fa fa-external-link"></i>

                            <p>Determinant to job</p>
                        </div>
                    </div>
                </div>
            </div>
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
                <button class="btn btn-green btn-latest-new"><span><a href="ViewNews.aspx">Browser All Posts</a><i class="fa fa-long-arrow-right"></i></span></button>
            </div>
        </div>
    </div>


</asp:Content>
