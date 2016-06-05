<%@ Page Title="" Language="C#" MasterPageFile="~/parentpanel.Master" AutoEventWireup="true" CodeBehind="parentpanel.aspx.cs" Inherits="FinalTemplate.parentpanel1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
           <div class="section">
                    <div class="search-input">
                        <div class="container">
                            <div class="search-input-wrapper">
                                <form>
                                    <select class="form-select style-1 selectbox">
                                    <option value="all">all categories</option>
                                    <option value="languages">languages</option>
                                    <option value="science">science</option>
                                </select><select class="form-select style-2 selectbox">
                                    <option value="price">price</option>
                                    <option value="datetime">datetime</option>
                                    <option value="teacher">teacher</option>
                                </select><input type="text" placeholder="Do you want to learn today?" class="form-input"/>
                                    <button type="submit" class="form-submit btn btn-blue"><span>search now<i class="fa fa-search"></i></span></button>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
     <div class="section section-padding edu-ab">
                    <div class="container">
                        <div class="edu-ab">
                            <div class="group-title-index edu-ab-title"><h2 class="center-title">Account <b> Detail</b> Graph</h2></div>
                            <div class="edu-ab-content">
                                <ul class="list-unstyled list-inline">
                                    <li>
                                        <div class="circle-icon"><i class="fa fa fa-2x"></i></div>
                                        <span>Learning online 100%</span></li>
                                    <li>
                                        <div class="circle-icon fa-2x"><i class="fa fa-search"></i></div>
                                        <span>Learn everything you want</span></li>
                                    <li>
                                        <div class="circle-icon fa-2x"><i class="fa fa-thumbs-up"></i></div>
                                        <span>Learn from top expert</span></li>
                                    <li>
                                        <div class="circle-icon fa-2x"><i class="fa fa-user"></i></div>
                                        <span>Training internal HR</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
    <%--timetable--%>
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
</asp:Content>
