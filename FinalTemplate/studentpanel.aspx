<%@ Page Title="" Language="C#" MasterPageFile="~/studentpanel.Master" AutoEventWireup="true" CodeBehind="studentpanel.aspx.cs" Inherits="FinalTemplate.studentpanel1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            teacherwidth();
            // samesizeimage();
        });

        //function samesizeimage() {
        //    $('a img').css({ 'height': '200px', 'width': '300px' });
        //}

        function teacherwidth() {
            var path = "url(assets/images/cesThemeImages/searchTeacher.jpg)";
            $('.page-title').css({
                'background-image': path,
                'height': '350px'
            });
        }

    </script>
    <style type="text/css">
        #profile_pic_wrapper {
            position: relative;
            border: #ccc solid 1px;
            width: 200px;
            height: 200px;
        }

            #profile_pic_wrapper a {
                position: absolute;
                display: none;
                top: 0;
                right: 0;
                line-height: 20px;
                padding: 5px;
                color: #fff;
                background-color: #333;
                text-decoration: underline;
            }

            #profile_pic_wrapper:hover a {
                display: block;
            }

                #profile_pic_wrapper:hover a:hover {
                    text-decoration: none;
                }

        .profile_pic {
            width: 200px;
            height: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- SLIDER BANNER-->
    <div class="section background-opacity page-title set-height-top">
        <div class="container">
            <div class="page-title-wrapper">
                <!--.page-title-content-->
                <div class="slider-banner-wrapper">
                    <h1 data-wow-delay="0.5s" class="sub-title wow fadeInUp">
                        <asp:Label Text="Date" ID="lab1" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label Text="Time" ID="lab2" runat="server"></asp:Label></h1>
                    <h2 class="captions">Student profile</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active"><a href="#">Profile</a></li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- WHY CHOOSE US-->
    <div class="section why-choose-us">
        <div class="why-choose-us-wrapper-top">
            <div class="container">

                <div class="why-choose-us-wrapper">
                    <asp:Label ID="namelab" CssClass="title-2" runat="server"></asp:Label>
                    <asp:Label ID="lab3" runat="server"></asp:Label>
                    <p>CLASS-6 SECTION-B</p>
                    <asp:Label ID="cl" runat="server" Text="new"></asp:Label>
                    <div>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:Button class="btn-green" BackColor="#86bc42" BorderColor="#86bc42" ID="btnSave" Text="Save" OnClick="btnSave_Click" runat="server" Height="30px" Width="70px"></asp:Button>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </div>
                </div>
                <div data-wow-delay="0.2s" data-wow-duration="1.2s" class="background-girl-1 wow fadeInDown" style="color: transparent">
                    <asp:Image ID="shah" CssClass="img-responsive" runat="server" Style="border-radius: 80px; color: transparent; height: 350px; width: 300px" />
                </div>
            </div>
        </div>
    </div>
    <%--                    <div class="section why-choose-us">
                    <div class="why-choose-us-wrapper-top">
                        <div class="container">
                            <div class="why-choose-us-wrapper"><h2 class="title-2">Name of the Student</h2>

                                <p>CLASS-9 SECTION-B</p>
                                <button class="btn btn-green-2" formaction="StudentProfile.aspx">
                                    <span>View Complete Profile</span>

                                </button>
                            </div>
                            <div data-wow-delay="0.2s" data-wow-duration="1.2s" class="background-girl-1 wow fadeInDown">
                                <img src="assets/images/edit.jpg" alt="" class="img-responsive" style="border-radius:70%"/>
                            </div>
                        </div>
                    </div>
                </div>--%>
    <!-- WHY CHOOSE US-->
    <div class="section why-choose-us">
        <div class="why-choose-us-wrapper<%-- bottom background-opacity--%>">
            <div class="container">
                <div data-wow-delay="0.4s" data-wow-duration="1s" class="row why-choose-us-wrapper wow zoomIn">
                    <div class="customs-row">
                        <div class="col-sm-4 col-xs-6 section-icon">
                            <i class="fa fa-calendar"></i>

                            <p>365 Days</p>
                        </div>
                        <div class="col-sm-4 col-xs-6 section-icon">
                            <i class="fa fa-bookmark-o"></i>
                            <p>300 Days Present</p>
                        </div>
                        <div class="col-sm-4 col-xs-6 section-icon">
                            <i class="fa fa-close"></i>

                            <p>003 Days Absent</p>
                        </div>
                    </div>
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
                        <div class="info">view results of Your exams. You can also check feedback regarding any result posted by Teachers & parents.</div>
                    </div>
                </div>
            </div>
            <div class="item-course">
                <div class="item-course-wrapper">
                    <div class="icon-course"><i class="icons-img icon-photocamera_1"></i></div>
                    <a href="#" class="info-course">
                        <div class="name-course">Photography</div>
                        <div class="info">Relive the past memories and view the pictures of past events and functions.</div>
                    </a>
                </div>
            </div>
            <div class="item-course">
                <div class="item-course-wrapper">
                    <div class="icon-course"><i class="icons-img icon-chat_bubbles"></i></div>
                    <div class="info-course">
                        <a href="#" class="name-course">Communication</a>
                        <div class="info">Make some interaction to Teacher and ask some queries. Click to check what is available now.</div>
                    </div>
                </div>
            </div>

        </div>
    </div>
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
                </div>
            </div>
        </div>
    </div>
    <%--timetable--%>
    <br />
      <%--   <asp:TextBox ID="TextBox1" placeholder="enter your teacher name" CssClass="form-control  form-input" Height="40px" Width="600px" runat="server">
       </asp:TextBox>--%>
    <div class="container teacher-course-wrapper">
        <div class="underline">TIME TABLE</div>
    </div>
    <div class="search-input">
        <div class="container">
            <div class="search-input-wrapper">
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="sbHolder" DataSourceID="class_DataSource" DataTextField="class" DataValueField="class">
                </asp:DropDownList>
                <asp:SqlDataSource ID="class_DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:cesConnectionString2 %>" SelectCommand="SELECT [class] FROM [tbl_class]"></asp:SqlDataSource>
                <div>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="sbHolder" DataSourceID="sec_DataSource" DataTextField="section" DataValueField="section">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sec_DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:cesConnectionString2 %>" SelectCommand="SELECT [section] FROM [tbl_section]"></asp:SqlDataSource>
                </div>
                <div>
                    <asp:DropDownList ID="DropDownList3" CssClass="sbHolder" runat="server" DataSourceID="SqlDataSource2" DataTextField="school_name" DataValueField="school_name"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cesConnectionString2 %>" SelectCommand="SELECT [school_name] FROM [tbl_school]"></asp:SqlDataSource>
                </div>
                <div> </div>
                <button type="submit" class="form-submit btn btn-blue"><span>Search</span></button>
                <div class="clearfix"></div>
            </div>
        </div>
    </div> 
    <br />

    <asp:GridView ID="GridView1" class="edu-table-responsive" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#86BC42" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="day" HeaderText="day" SortExpression="day" />
            <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject" />
            <asp:BoundField DataField="starting_time" HeaderText="starting_time" SortExpression="starting_time" />
            <asp:BoundField DataField="ending_time" HeaderText="ending_time" SortExpression="ending_time" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#737373" Font-Bold="True" ForeColor="#86bc42" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cesConnectionString2 %>" SelectCommand="SELECT [day], [subject], [starting_time], [ending_time] FROM [View_Student_timetable] WHERE (([class] = @class) AND ([section] = @section))">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="class" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DropDownList2" Name="section" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />

</asp:Content>
