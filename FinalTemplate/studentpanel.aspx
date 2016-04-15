<%@ Page Title="" Language="C#" MasterPageFile="~/studentpanel.Master" AutoEventWireup="true" CodeBehind="studentpanel.aspx.cs" Inherits="FinalTemplate.studentpanel1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!-- SLIDER BANNER-->
   <div class="section background-opacity page-title set-height-top">
         
                    <div class="container">
                        <div class="page-title-wrapper"><!--.page-title-content-->
                           <div class="slider-banner-wrapper"><h4 data-wow-delay="0.5s" class="sub-title wow fadeInUp">Login Date:03/08/2016 &nbsp;&nbsp; Login Time: 09:23:00 AM</h4>
                             <h2 class="captions">Student profile</h2>
                            <ol class="breadcrumb">
                                <li><a href="index.html">Home</a></li>
                                <li class="active"><a href="#">profile</a></li>
                            </ol>
                        </div>
                    </div>
                </div>
        </div><br />
    <%--profile pic--%>
       <div class="staff-item">
        <div class="staff-item-wrapper">
            <div class="staff-info">
                <a href="#" class="staff-avatar">
                    <img src="assets/images/people-avatar-2.jpg" alt="" class="img-responsive" /></a><a href="#" class="staff-name">Sufiyan Big</a>
                      <div class="staff-job">student class 5B</div>
             </div>
        </div>
    </div><br />
    <!-- WHY CHOOSE US-->
                <div class="section why-choose-us">
                    <div class="why-choose-us-wrapper-bottom background-opacity">
                        <div class="container">
                            <div data-wow-delay="0.4s" data-wow-duration="1s" class="row why-choose-us-wrapper wow zoomIn">
                                <div class="customs-row">
                                    <div class="col-sm-4 col-xs-6 section-icon"><i class="fa fa-calendar"></i>

                                        <p>365 Days</p></div>
                                    <div class="col-sm-4 col-xs-6 section-icon"><i class="fa fa-bookmark-o"></i>
                                        <p>300 Days Present</p>
                                    </div>
                                    <div class="col-sm-4 col-xs-6 section-icon"><i class="fa fa-close"></i>

                                        <p>003 Days Absent</p></div>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div><br />        
    
   

    <%--ststus--%>
      <div class="section teacher-skill">
                    <div class="container teacher-skill-content">
                        <div class="teacher-skill-wrapper">
                            <div class="title">Shows Some Important Works</div>
                            <div class="row skill-content">
                                <div class="col-md-6 skill-level">
                                    <div class="skill-name">Home Work or Assignment</div>
                                    <div class="progress">
                                        <div role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" class="progress-bar skill-1"></div>
                                    </div>
                                </div>
                                <div class="col-md-6 skill-level">
                                    <div class="skill-name">Your Fees Of Month</div>
                                    <div class="progress">
                                        <div role="progressbar" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100" class="progress-bar skill-2"></div>
                                    </div>
                                </div>
                                <%--<div class="col-md-6 skill-level">
                                    <div class="skill-name">Assignment</div>
                                    <div class="progress">
                                        <div role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" class="progress-bar skill-3"></div>
                                    </div>
                                </div>
                                <div class="col-md-6 skill-level">
                                    <div class="skill-name">Fee Payment</div>
                                    <div class="progress">
                                        <div role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" class="progress-bar skill-4"></div>
                                    </div>
                            </div>--%>
                        </div>
                            </div>
                    </div>
                </div>
  
</asp:Content>
