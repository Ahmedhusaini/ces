<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateTeacherInformation.aspx.cs" Inherits="FinalTemplate.UpdateTeacherInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">

<script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">
        $(window).load(function () {
            searchboxwidth();
        });
        $(document).ready(function () {
            teacherwidth();
            samesizeimage();
            setbuttonlayout();

        });

        function samesizeimage() {
            $('a img').css({ 'height': '200px', 'width': '300px' });
        }

        function setbuttonlayout() {
            $('button.btn.btn-green').css('padding-right', '115px');
        }
        function teacherwidth() {
            var path = "url(assets/images/cesThemeImages/searchTeacher.jpg)";
            $('.page-title').css({
                'background-image': path,
                'height': '450px'
            });
        }

        function searchboxwidth() {
            $('.form-input').css('width', '900px');
        }
    </script>
        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
    <div class="section intro-edu">
                    <div class="container">
                        <div class="intro-edu-wrapper">
                            <div class="row">
                                <div class="col-md-4"><img src="assets/images/people-avatar-8.png" alt="" class="intro-image fadeInLeft animated wow"/></div>
                                <div class="col-md-8">
                                    <div class="intro-title">WHAT IS <b>EDUGATE</b> ?</div>
                                    <div class="course-syllabus">
                                        <div class="course-syllabus-title underline">Courses syllabus</div>
                                        <div class="course-table">
                                            <div class="outer-container">
                                                <div class="inner-container">                                                   
                                                    <div class="table-body">
                                                        <!--here put the gridview to display teacher record------>
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
</asp:Content>
