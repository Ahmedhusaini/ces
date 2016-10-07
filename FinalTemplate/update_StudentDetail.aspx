<%@ Page Title="Update Detail" Language="C#" MasterPageFile="~/updatepasswordpanel.Master" AutoEventWireup="true" CodeBehind="update_StudentDetail.aspx.cs" Inherits="FinalTemplate.update_StudentDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <link rel="icon" href="assets/images/logo/logo-carousel-6.png" />

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- LIBRARY FONT-->
    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:400,400italic,700,900,300" />
    <link type="text/css" rel="stylesheet" href="assets/font/font-icon/font-awesome-4.4.0/css/font-awesome.css" />
    <link type="text/css" rel="stylesheet" href="assets/font/font-icon/font-svg/css/Glyphter.css" />

    <!-- LIBRARY CSS-->
    <link type="text/css" rel="stylesheet" href="assets/css/color-1.css" />
    <link href="assets/css/mycss.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="assets/libs/animate/animate.css" />
    <link type="text/css" rel="stylesheet" href="assets/libs/bootstrap-3.3.5/css/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="assets/libs/owl-carousel-2.0/assets/owl.carousel.css" />
    <link type="text/css" rel="stylesheet" href="assets/libs/selectbox/css/jquery.selectbox.css" />
    <link type="text/css" rel="stylesheet" href="assets/libs/fancybox/css/jquery.fancybox.css" />
    <link type="text/css" rel="stylesheet" href="assets/libs/fancybox/css/jquery.fancybox-buttons.css" />
    <link type="text/css" rel="stylesheet" href="assets/libs/media-element/build/mediaelementplayer.min.css" />
    <!-- STYLE CSS    -->
    <!--link(type="text/css", rel='stylesheet', href='assets/css/color-1.css', id="color-skins")-->
    <link type="text/css" rel="stylesheet" href="#" id="colorskins" />
    <script src="assets/libs/jquery/jquery-2.1.4.min.js"></script>
    <script src="assets/libs/js-cookie/js.cookie.js"></script>
    <script>if ((Cookies.get('colorskin') != undefined) && (Cookies.get('colorskin') != 'color-1')) {
    $('#colorskins').attr('href', 'assets/css/' + Cookies.get('colorskin') + '.css');
} else if ((Cookies.get('colorskin') == undefined) || (Cookies.get('colorskin') == 'color-1')) {
    $('#colorskins').attr('href', 'assets/css/color-1.css');
}</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header>
    <div class="header-main homepage-03">
            <div class="container">
                <div class="header-main-wrapper">
                    <div class="navbar-header">
                        <div class="logo pull-left">
                            <a href="index.html" class="header-logo">
                                <img src="assets/images/logo-color-1.png" alt="" /></a>
                        </div>
                        <button type="button" data-toggle="collapse" data-target=".navigation" class="navbar-toggle edugate-navbar"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                    </div>
                    <nav class="navigation collapse navbar-collapse">
                        <ul class="nav-links nav navbar-nav">

                            <li class="dropdown active"><a href="studentpanel.aspx" class="main-menu">Home</a></li>
                            <li class="dropdown"><a href="javascript:void(0)" class="main-menu">Schedules<span class="fa fa-angle-down icons-dropdown"></span></a>
                                <ul class="dropdown-menu edugate-dropdown-menu-1">
                                    <li><a href="Syllabus.aspx" class="link-page">Syllabus</a></li>
                                    <li><a href="Date_sheet.aspx" class="link-page">Date Sheet</a></li>
                                    <li><a href="Mark_sheet.aspx" class="link-page">Mark Sheet</a></li>
                                </ul>
                            </li>

                            <li class="dropdown"><a href="javascript:void(0)" class="main-menu">Download<span class="fa fa-angle-down icons-dropdown"></span></a>
                                <ul class="dropdown-menu edugate-dropdown-menu-1">
                                    <li><a href="news.html" class="link-page">Download Lectures</a></li>
                                    <li><a href="news-grid.html" class="link-page">Download Homework</a></li>
                                    <li><a href="news-grid-nonsidebar.html" class="link-page">Download Assignments</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a href="Admin.aspx" class="main-menu">Attendance</a></li>
                            <li class="dropdown"><a href="#" class="main-menu">News</a></li>
                            <li class="dropdown"><a href="#" class="main-menu">Update Detail</a></li>
                            <li><a href="Contact_Us.aspx" class="main-menu">Contact</a></li>
                            <li class="button-search">
                                <p class="main-menu"><i class="fa fa-search"></i></p>
                            </li>

                            <div class="nav-search hide">
                                <form>
                                    <input type="text" placeholder="Search" class="searchbox" />
                                    <button type="submit" class="searchbutton fa fa-search"></button>
                                </form>
                            </div>                            
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
</header>
    <div class="section background-opacity page-title set-height-top">
        <div class="container">
            <div class="page-title-wrapper">
                <!--.page-title-content-->
                <h2 class="captions">Update Detail</h2>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
