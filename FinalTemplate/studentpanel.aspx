<%@ Page Title="" Language="C#" MasterPageFile="~/studentpanel.Master" AutoEventWireup="true" CodeBehind="studentpanel.aspx.cs" Inherits="FinalTemplate.studentpanel1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            teacherwidth();
            // samesizeimage();

            $('#<%=DropDownList1.ClientID%>').css('display', 'none'),
                 $('#<%=DropDownList2.ClientID%>').css('display', 'none'),
              $('#<%=DropDownList4.ClientID%>').css('display', 'none')
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
                    <asp:Label ID="Label2" class="captions" runat="server"></asp:Label>
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
                    <label class="title-2">Your Authorized ID : </label>
                    &nbsp;<asp:Label ID="namelab" CssClass="title-2" ForeColor="#86BC42" runat="server"></asp:Label>
                    <asp:Label ID="lab3" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Visible="False"></asp:Label>
                    <br />
                    <label class="rlp-title">CLASS :  </label>
                    <asp:Label ID="Label4" CssClass="title-2" runat="server" ForeColor="#86BC42"></asp:Label>
                    <label class="title-404">SECTION : </label>
                    <asp:Label ID="Label5" CssClass="title-2" runat="server" ForeColor="#86BC42"></asp:Label>

                    <h4 runat="server" style="color: #A8CF78">Change Profile Picture</h4>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:Button class="btn-green" BackColor="#86bc42" BorderColor="#86bc42" ID="btnSave" Text="Save" OnClick="btnSave_Click" runat="server" Height="30px" Width="70px"></asp:Button>
                    <asp:Label ID="Label1" runat="server"></asp:Label>

                </div>
                <div data-wow-delay="0.2s" data-wow-duration="1.2s" class="background-girl-1 wow fadeInDown" style="color: transparent">
                    <asp:Image ID="shah" CssClass="img-responsive" runat="server" Style="border-radius: 100px; color: transparent; height: 320px; width: 270px" />
                </div>
            </div>
        </div>
    </div>
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
    <div class="search-input">
        <div class="container">
            <%--  <div class="search-input-wrapper">--%>

            <div class="underline" style="height: 20px; text-align: center;">
                <h1 style="color: white;">TIME TABLE</h1>
            </div>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="sbHolder" DataSourceID="SqlDataSource3" DataTextField="section" DataValueField="section">
            </asp:DropDownList>
            <div>
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="sbHolder" DataSourceID="SqlDataSource3" DataTextField="school_name" DataValueField="school_name">
                </asp:DropDownList>
            </div>
            <div>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="sp_chileTimetable" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="section" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="DropDownList4" Name="class" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="DropDownList2" Name="school_name" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:DropDownList ID="DropDownList4" runat="server" CssClass="sbHolder" DataSourceID="SqlDataSource3" DataTextField="class" DataValueField="class">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="sp_getstudent_class_section" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="std_id" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <%--<button type="submit" class="form-submit btn btn-blue"><span>Search</span></button>--%>
        </div>
    </div>
    <%-- </div>--%>

    <asp:GridView ID="GridView1" class="edu-table-responsive" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#86BC42" GridLines="None">
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT [day], [subject], [starting_time], [ending_time] FROM [View_Student_timetable] WHERE (([class] = @class) AND ([section] = @section))">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="class" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DropDownList2" Name="section" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <%--ATTENDANCE--%>
    <div class="search-input">
        <div class="container">
            <%--  <div class="search-input-wrapper">--%>

            <div class="underline" style="height: 20px; text-align: center;">
                <h1 style="color: white;">ATTENDANCE </h1>
            </div>
        </div>
    </div>
    <br />
        <label>DAY : </label><asp:DropDownList CssClass="dropdown" ID="DropDownList3" runat="server" DataSourceID="SqlDataSource5" DataTextField="Column1" DataValueField="Column1"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="select DATENAME(DW, [date]) from tbl_student_attendance where Std_id=@Std_id">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label3" Name="Std_id" PropertyName="Text" />
            </SelectParameters>
    </asp:SqlDataSource>
        <label>MONTH : </label><asp:DropDownList CssClass="dropdown" ID="DropDownList5" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource6" DataTextField="Column1" DataValueField="Column1"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="select DATENAME(mm, [date]) from tbl_student_attendance where Std_id=@Std_id">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label3" Name="Std_id" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
        <asp:GridView ID="GridView2" class="edu-table-responsive" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource8" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#86BC42" GridLines="None">
            <Columns>
                <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
                <asp:BoundField DataField="Column2" HeaderText="Column2" ReadOnly="True" SortExpression="Column2" />
                <asp:BoundField DataField="time" HeaderText="time" SortExpression="time" />
                <asp:BoundField DataField="remarks" HeaderText="remarks" SortExpression="remarks" />
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
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="shahwaiz_attendance" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label3" Name="Std_id" PropertyName="Text" Type="String" />
            </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="shahwaiz_attendance" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label3" Name="Std_id" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="DropDownList5" Name="month" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>
    <br />

</asp:Content>
