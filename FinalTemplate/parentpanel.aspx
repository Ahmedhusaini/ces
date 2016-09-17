<%@ Page Title="" Language="C#" MasterPageFile="~/parentpanel.Master" AutoEventWireup="true" CodeBehind="parentpanel.aspx.cs" Inherits="FinalTemplate.parentpanel1" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="section background-opacity page-title set-height-top">
        <div class="container">
            <div class="page-title-wrapper">
                <!--.page-title-content-->
                <div class="slider-banner-wrapper">
                    <h1 data-wow-delay="0.5s" class="sub-title wow fadeInUp">
                        <asp:Label Text="Date: " ID="lab1" runat="server" Font-Size="Large"></asp:Label>&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;<asp:Label Text="Time:" ID="lab2" runat="server" Font-Size="Large"></asp:Label></h1>
                    <h2 class="captions">Parent's profile</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active"><a href="#">Profile</a></li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-9">
    <div class="news-page-wrapper">
           <div class="edugate-layout-1" style="    background-color: rgba(144, 161, 174, 0.63)">
                                        <div class="edugate-image"><asp:Image ID="Image1" runat="server"  /></div>
                                        <div class="edugate-content"><a href="news-detail.html" class="title">
                                                <asp:Label ID="headlbl" runat="server" Font-size="18"  ></asp:Label></a>&nbsp;&nbsp;
                                            <a href="news-detail.html" class="title"> 
                                                 <asp:Label ID="headll" runat="server" Font-size="18"  ></asp:Label></a>
                                            <div class="info">
                                                <div class="author item"><a href="#">Gender: </a>&nbsp&nbsp;&nbsp;&nbsp; <asp:Label ID="gender" Font-size="13" runat="server"></asp:Label> </div>
                     
                                            </div>
                                            <div class="info">
                                                <div class="author item"><a href="#">Contact NO: </a> &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="phone" Font-size="13" runat="server"></asp:Label></div>
                     
                                            </div>
                                            <div class="info">
                                                <div class="author item"><a href="#">Address: </a>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="address" Font-size="13" runat="server"></asp:Label></div>
                     
                                            </div>
                                            <div class="info">
                                                <div class="author item"><a href="#">Email ID: </a>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="pemail" Font-size="13" runat="server"></asp:Label></div>
                     
                                            </div>
                                            <div class="info">
                                                <div class="author item"><a href="#">Authorized ID : </a>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="atype" Font-size="13" runat="server"></asp:Label></div>
                     
                                            </div>
                                           
                                            <div class="description"></div>
                                          <%-- <button class="btn btn-green"><span>read more</span></button>--%>
                                        </div>
                                    </div>
        </div>
        </div>
    
   <div class="container teacher-course-wrapper" style="width:1220px">
        <div class="group-title-index edu-ab-title"><h2 class="center-title">
            &nbsp;</h2>
           
                <%--<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cesConnectionString3 %>" SelectCommand="SELECT tbl_Student_Reg.Std_id, tbl_class.class, tbl_section.section, tbl_school.school_name, tbl_general.firstname FROM tbl_class INNER JOIN tbl_class_sec_info ON tbl_class.Class_id = tbl_class_sec_info.class_id INNER JOIN tbl_Student_Reg ON tbl_class_sec_info.class_sec_info_id = tbl_Student_Reg.class_sec_info_id INNER JOIN tbl_general ON tbl_Student_Reg.General_Id = tbl_general.General_Id INNER JOIN tbl_school ON tbl_Student_Reg.school_id = tbl_school.school_id INNER JOIN tbl_section ON tbl_class_sec_info.section_id = tbl_section.Section_id"></asp:SqlDataSource>--%>
            </div>
                       <div class="course-table" style="border-style: none; border-width: inherit; border-color: #FFFFFF">
                          
                        
                          
       </div>
                                    </div>
                            
      
        <!-- CHOOSE COURSES-->
    <br />
                        <div class="group-title-index"><h4 class="top-title">Your Childerns </h4>

                            <h2 class="center-title">check profile of your Child&nbsp;&nbsp;&nbsp;&nbsp; </h2>

                            <div class="bottom-title"><i class="bottom-icon icon-a-1-01-01"></i></div>
                        </div>
              <div class="section choose-course-3">
                    <div class="choose-course-3-wrapper row">
                        <div class="item-course" style="    width: 800px;     border-radius: 57px; background-color: rgba(144, 161, 174, 0.63)" >
                            <div class="item-course-wrapper">
                                <div class="icon-course"><i class="icons-img fa fa-male"></i></div>
                                
                                <div class="icon-course"><a href="#" class="name-course">

                                &nbsp; &nbsp; &nbsp; <asp:Label ID="Name" runat="server" Font-Size="18" ></asp:Label></a>

                                     <div class="info">
                                   &nbsp; &nbsp; &nbsp;      Guardian Name :&nbsp; <asp:Label ID="gname" runat="server" Font-Size="15"></asp:Label></div>
                                    <div class="info">
                                   &nbsp; &nbsp; &nbsp;      Gender :&nbsp; <asp:Label ID="cgender" runat="server" Font-Size="15"></asp:Label></div>
                                   
                                </div>
                                <br/>
                               
                                 <div class="info">
                                &nbsp; &nbsp; &nbsp;       School :&nbsp; <asp:Label ID="school" Text="dsada" runat="server" Font-Size="15"></asp:Label></div>
                                 <div class="info">
                             &nbsp; &nbsp; &nbsp;       Type : &nbsp;<asp:Label ID="stype" Text="dsada" runat="server" Font-Size="15"></asp:Label></div>
                            
                                 
                                <div class="icon-course"></div>
                                     <br/>
                                    
                                     <div class="info">
                                   &nbsp; &nbsp; &nbsp;      Class :&nbsp; <asp:Label ID="classsss" runat="server" Font-Size="15"></asp:Label></div>
                                    <div class="info">
                                   &nbsp; &nbsp; &nbsp;      Section :&nbsp; <asp:Label ID="section" runat="server" Font-Size="15"></asp:Label></div>                                                           
                                
                                   
                            </div>
                        </div>
                       <div class="item-course" >
                            <div class="item-course-wrapper">
                               <div class="icon-course"><i class="icons-img fa fa-male"></i></div>
                                
                                <div class="icon-course"><a href="#" class="name-course">

                                &nbsp; &nbsp; &nbsp; <asp:Label ID="name2" runat="server" Font-Size="18"  ClientIDMode="Predictable" ></asp:Label></a>

                                     <div class="info">
                                   &nbsp; &nbsp; &nbsp;      Guardian Name :&nbsp; <asp:Label ID="gname2" runat="server" Font-Size="15"></asp:Label></div>
                                    <div class="info">
                                   &nbsp; &nbsp; &nbsp;      Gender :&nbsp; <asp:Label ID="gender2" runat="server" Font-Size="15"></asp:Label></div>
                                   
                                </div>
                        </div>
                        <div class="item-course" style="display:none">
                            <div class="item-course-wrapper">
                                <div class="icon-course"><i class="icons-img fa fa-male"></i></div>
                                <div class="info-course"><a href="#" class="name-course">siddique</a>

                                    <div class="info">check them out</div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>     
    <div class="section teacher-course section-padding">
                    <div class="container teacher-course-wrapper" style="width:1220px">
                        <div class="group-title-index edu-ab-title"><h2 class="center-title">Check<b> your student</b> time table</h2></div>
                       <div class="course-table">
                            <div class="outer-container">
                                <div class="inner-container">
                                    <div class="table-header">
                                        <table class="edu-table-responsive">
                                            <thead>
                                            <tr class="heading-table">
                                                <th class="col-1">ID</th>
                                                <th class="col-3">MONDAY</th>
                                                <th class="col-3">TUESDAY</th>
                                                <th class="col-3">WEDNESDAY</th>
                                                <th class="col-3">THURSDAY</th>
                                                <th class="col-3">FRIDAY</th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </div>
                                    <div class="table-body">
                                        <table class="edu-table-responsive table-hover">
                                            <tbody>
                                            <tr class="table-row">
                                                <td class="col-1"><span>P1</span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>                                                
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                            </tr>
                                            <tr class="table-row">
                                                <td class="col-1"><span>P2</span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>                                                
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                            </tr>
                                            <tr class="table-row">
                                                <td class="col-1"><span>P3</span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>                                                
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                            </tr>
                                            <tr class="table-row">
                                                <td class="col-1"><span>P4</span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>                                                
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                            </tr>
                                            <tr class="table-row">
                                                <td class="col-1"><span>P5</span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>                                                
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                            </tr>
                                            <tr class="table-row">
                                                <td class="col-1"><span>P6</span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>                                                
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                            </tr>
                                            <tr class="table-row">
                                                <td class="col-1"><span>P7</span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>                                                
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                                <td class="col-3"><span><a href="#">2 months</a></span></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
           <div class="section teacher-course section-padding">
                    <div class="container teacher-course-wrapper">
                        <div class="group-title-index edu-ab-title"><h2 class="center-title">check<b> your</b> student cources</h2></div>
                        <div class="course-table">
                            <div class="outer-container">
                                <div class="inner-container">
                                    <div class="table-header">
                                        <table class="edu-table-responsive">
                                            <thead>
                                            <tr class="heading-table">
                                                <th class="col-1">id</th>
                                                <th class="col-2">course name</th>
                                                <th class="col-3">duration</th>
                                                <th class="col-4">timeline</th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </div>
                                    <div class="table-body">
                                        <table class="edu-table-responsive table-hover">
                                            <tbody>
                                            <tr class="table-row">
                                                <td class="col-1"><span>ED1</span></td>
                                                <td class="col-2"><a href="courses-detail.html">Sport Exercise Sciences</a></td>
                                                <td class="col-3"><span>2 months</span></td>
                                                <td class="col-4"><span>01/01/2016 -  02/15/2016</span></td>
                                            </tr>
                                            <tr class="table-row">
                                                <td class="col-1"><span>ED1</span></td>
                                                <td class="col-2"><a href="courses-detail.html">Learning Website Optimization With Bootstrap</a></td>
                                                <td class="col-3"><span>2 months</span></td>
                                                <td class="col-4"><span>01/01/2016 -  02/15/2016</span></td>
                                            </tr>
                                            <tr class="table-row">
                                                <td class="col-1"><span>ED1</span></td>
                                                <td class="col-2"><a href="courses-detail.html">Skeching Custom Item Prize Design</a></td>
                                                <td class="col-3"><span>2 months</span></td>
                                                <td class="col-4"><span>01/01/2016 -  02/15/2016</span></td>
                                            </tr>
                                            <tr class="table-row">
                                                <td class="col-1"><span>ED1</span></td>
                                                <td class="col-2"><a href="courses-detail.html">Learning Website Optimization With Bootstrap</a></td>
                                                <td class="col-3"><span>2 months</span></td>
                                                <td class="col-4"><span>01/01/2016 -  02/15/2016</span></td>
                                            </tr>
                                            <tr class="table-row">
                                                <td class="col-1"><span>ED1</span></td>
                                                <td class="col-2"><a href="courses-detail.html">Learning Viral Web Design Projects</a></td>
                                                <td class="col-3"><span>2 months</span></td>
                                                <td class="col-4"><span>01/01/2016 -  02/15/2016</span></td>
                                            </tr>
                                            <tr class="table-row">
                                                <td class="col-1"><span>ED1</span></td>
                                                <td class="col-2"><a href="courses-detail.html">Email Marketing Strategy With MailChimp</a></td>
                                                <td class="col-3"><span>2 months</span></td>
                                                <td class="col-4"><span>01/01/2016 -  02/15/2016</span></td>
                                            </tr>
                                            <tr class="table-row">
                                                <td class="col-1"><span>ED1</span></td>
                                                <td class="col-2"><a href="courses-detail.html">Social Media Network & Marketing</a></td>
                                                <td class="col-3"><span>2 months</span></td>
                                                <td class="col-4"><span>01/01/2016 -  02/15/2016</span></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
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
                    </a><a href="#people-talk" role="button" data-slide="next">
                        <div class="btn-next carousel-control right"><i class="fa fa-angle-right"></i></div>
                    </a></div>
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
</asp:Content>
