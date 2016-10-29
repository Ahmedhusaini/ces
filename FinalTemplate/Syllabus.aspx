<%@ Page Title="Syllabus" Language="C#" MasterPageFile="~/updatepasswordpanel.Master" AutoEventWireup="true" CodeBehind="Syllabus.aspx.cs" Inherits="FinalTemplate.Syllabus" %>

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
    
    <div class="section background-opacity page-title set-height-top">
        <div class="container">
            <div class="page-title-wrapper">
                <!--.page-title-content-->
                <h2 class="captions">Syllabus</h2>
            </div>
        </div>
    </div>
    <br />
    <div class="search-input">
        <div class="container">
            <div class="search-input-wrapper">
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="sbHolder" DataSourceID="class_DataSource" DataTextField="class" DataValueField="class">
                </asp:DropDownList>
                <asp:SqlDataSource ID="class_DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT [class] FROM [tbl_class]"></asp:SqlDataSource>
                <div>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="sbHolder" DataSourceID="sec_DataSource" DataTextField="section" DataValueField="section">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sec_DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT [section] FROM [tbl_section]"></asp:SqlDataSource>
                </div>
                <div>
                    <asp:DropDownList ID="DropDownList3" CssClass="sbHolder" runat="server" DataSourceID="SqlDataSource1" DataTextField="school_name" DataValueField="school_name"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT [school_name] FROM [tbl_school]"></asp:SqlDataSource>
                </div>
                <div></div>
                <button type="submit" class="form-submit btn btn-blue"><span>Search</span></button>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
