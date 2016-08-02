<%@ Page Title="" Language="C#" MasterPageFile="~/parentpanel.Master" AutoEventWireup="true" CodeBehind="parentpanel.aspx.cs" Inherits="FinalTemplate.parentpanel1" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
           <div class="section">
                    <div class="search-input">
                        <div class="container">
                            <div class="search-input-wrapper">
                                <form>
                                    <asp:DropDownList ID="DropDownList1" CssClass="form-select style-2 selectbox" runat="server" DataSourceID="SqlDataSource1" DataTextField="school_name" DataValueField="school_id" AppendDataBoundItems="True" AutoPostBack="True" >
                                        <asp:ListItem>School</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cesConnectionString3 %>" SelectCommand="SELECT [school_id], [school_name] FROM [tbl_school]"></asp:SqlDataSource>
                                    <asp:DropDownList ID="DropDownList2"  CssClass="form-select style-2 selectbox" runat="server" DataSourceID="SqlDataSource2" DataTextField="class" DataValueField="Class_id" AppendDataBoundItems="True" AutoPostBack="True">
                                   <asp:ListItem>Class</asp:ListItem>
                                         </asp:DropDownList>

                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cesConnectionString3 %>" SelectCommand="SELECT [Class_id], [class] FROM [tbl_class]"></asp:SqlDataSource>
                                    <asp:DropDownList ID="DropDownList3" CssClass="form-select style-2 selectbox" runat="server" DataSourceID="SqlDataSource4" DataTextField="section" DataValueField="section" AppendDataBoundItems="True" AutoPostBack="True">
                                    <asp:ListItem>Section</asp:ListItem>
                                         </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:cesConnectionString3 %>" SelectCommand="SELECT * FROM [tbl_section]"></asp:SqlDataSource>
                                    <asp:TextBox ID="searchbox" placeholder="Enter the Student Name" CssClass="form-input" runat="server" OnTextChanged="searchbox_TextChanged"></asp:TextBox>
                                &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp; &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
                                  &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp; &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
                                     &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp; &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&nbsp;
                                       <button type="submit" class="form-submit btn btn-blue" style="margin-top: 6px; float: none"><span><asp:Button ID="Button1" runat="server" BorderStyle="None" style="background-color: Transparent" Text="Search" OnClick="Button1_Click1" />
                                        <i class="fa fa-search"></i></span></button>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
   <div class="container teacher-course-wrapper" style="width:1220px">
        <div class="group-title-index edu-ab-title"><h2 class="center-title">Check<b> your student</b> time table</h2>
            <p clas&nbsp;&nbsp;&nbsp;
            </p>
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" Width="415px">
                </asp:GridView>
                <%--<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cesConnectionString3 %>" SelectCommand="SELECT tbl_Student_Reg.Std_id, tbl_class.class, tbl_section.section, tbl_school.school_name, tbl_general.firstname FROM tbl_class INNER JOIN tbl_class_sec_info ON tbl_class.Class_id = tbl_class_sec_info.class_id INNER JOIN tbl_Student_Reg ON tbl_class_sec_info.class_sec_info_id = tbl_Student_Reg.class_sec_info_id INNER JOIN tbl_general ON tbl_Student_Reg.General_Id = tbl_general.General_Id INNER JOIN tbl_school ON tbl_Student_Reg.school_id = tbl_school.school_id INNER JOIN tbl_section ON tbl_class_sec_info.section_id = tbl_section.Section_id"></asp:SqlDataSource>--%>
            </div>
                       <div class="course-table" style="border-style: none; border-width: inherit; border-color: #FFFFFF">
                          
       </div>
                                    </div>
                            
      
        <!-- CHOOSE COURSES-->
    <br />
                        <div class="group-title-index"><h4 class="top-title">Your Childerns class="group-title-index"><h4 class="top-title">Your Childerns</h4>

                            <h2 class="center-title">check profile of your student&nbsp;&nbsp;&nbsp;&nbsp; </h2>

                            <div class="bottom-title"><i class="bottom-icon icon-a-1-01-01"></i></div>
                        </div>
              <div class="section choose-course-3">
                    <div class="choose-course-3-wrapper row">
                        <div class="item-course">
                            <div class="item-course-wrapper">
                                <div class="icon-course"><i class="icons-img fa fa-male"></i></div>
                                <div class="info-course"><a href="#" class="name-course">ahmed hussaini</a>

                                    <div class="info">check them out</div>
                                </div>
                            </div>
                        </div>
                       <div class="item-course">
                            <div class="item-course-wrapper">
                                <div class="icon-course"><i class="icons-img fa fa-check"></i></div>
                                <a href="#" class="info-course">
                                    <div class="name-course">jahangeer ahmed</div>
                                    <div class="info">check them out</div>
                                </a></div>
                        </div>
                        <div class="item-course">
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
