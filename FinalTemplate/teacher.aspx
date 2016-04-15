<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="teacher.aspx.cs" Inherits="FinalTemplate.teacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TeacherHeadPlaceHolder" runat="server">
    <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#topStudents').addClass('topPadding');
            $('#teachingstaff').addClass('staff');
        });
    </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TeacherPlaceHolder1" runat="server">

    <div id="teachingstaff" class="section section-padding background-opacity best-staff">
                    <div class="container">
                        <div class="group-title-index"><h4 class="top-title">SCHOOL FACULTY</h4>

                            <h2 class="center-title">TEACHING STAFF PROFILE</h2>

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
    <div class="course-syllabus-title underline">Faculty Members</div>
    <div class="course-table" style="height: 1378px; width:100%;">
                                            <div class="outer-container">
                                                <div class="inner-container">
                                                    <div class="table-header">
                                                        <table class="edu-table-responsive">
                                                            <thead>
                                                            <tr class="heading-table">
                                                                <th class="col-1">Name</th>
                                                                <th class="col-2">Qualification</th>
                                                                <th class="col-3">Joining Date</th>
                                                                <th class="col-4">Address</th>
                                                            </tr>
                                                            </thead>
                                                        </table>
                                                    </div>
                                                    <div class="table-body">
                                                        <table class="edu-table-responsive table-hover">
                                                            <tbody>
                                                            <tr class="heading-content">
                                                                <td colspan="4" class="left heading-content">Principle</td>
                                                            </tr>
                                                            <tr class="table-row">
                                                                <td class="left col-1"><a href="#"><span>1. HILAL QURESHI</span></a></td>
                                                                <td class="col-2"><span>PHD CS</span></td>
                                                                <td class="col-3"><span>10-4-2010</span></td>
                                                                <td class="col-4"><span>abc</span></td>
                                                            </tr>
                                                           
                                                            <tr class="spacing-table">
                                                                <td colspan="4"></td>
                                                            </tr>
                                                            <tr class="heading-content">
                                                                <td colspan="4" class="left heading-content">Senior Teachers</td>
                                                            </tr>
                                                            <tr class="table-row">
                                                                <td class="left col-1"><a href="#"><span>1. Ms. Mehwish Wahid</span></a></td>
                                                                <td class="col-2"><span>MS CS</span></td>
                                                                <td class="col-3"><span>05-04-2011</span></td>
                                                                <td class="col-4"><span>abc</span></td>
                                                            </tr>
                                                            <tr class="table-row">
                                                                <td class="left col-1"><a href="#"><span>2. Mr. Waleej Haider</span></a></td>
                                                                <td class="col-2"><span>MS CS</span></td>
                                                                <td class="col-3"><span>01-5-2011</span></td>
                                                                <td class="col-4"><span>ate</span></td>
                                                            </tr>
                                                            <tr class="spacing-table">
                                                                <td colspan="4"></td>
                                                            </tr>
                                                            <tr class="heading-content">
                                                                <td colspan="4" class="left heading-content">Junior Teachers</td>
                                                            </tr>
                                                            <tr class="table-row">
                                                                <td class="left col-1"><a href="#"><span>1. Ms. Aqsa</span></a></td>
                                                                <td class="col-2"><span>BS CS</span></td>
                                                                <td class="col-3"><span>4-5-2013</span></td>
                                                                <td class="col-4"><span>CGHFHDGe</span></td>
                                                            </tr>
                                                            <tr class="table-row">
                                                                <td class="left col-1"><a href="#"><span>2. Ms. Mehwish</span></a></td>
                                                                <td class="col-2"><span>BS CS</span></td>
                                                                <td class="col-3"><span>20-5-2013</span></td>
                                                                <td class="col-4"><span>Leing</span></td>
                                                            </tr>
                                                          
                                                            <tr class="table-row">
                                                                <td class="left col-1"><a href="#"><span>3. Mr. Sallar Khan</span></a></td>
                                                                <td class="col-2"><span>BS CS</span></td>
                                                                <td class="col-3"><span>10-2-2015</span></td>
                                                                <td class="col-4"><span>Prvt</span></td>
                                                            </tr>
                                                      
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
</asp:Content>
