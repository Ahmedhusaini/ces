<%@ Page Title="Student Profile | Home" Language="C#" MasterPageFile="~/studentpanel.Master" AutoEventWireup="true" CodeBehind="studentpanel.aspx.cs" Inherits="FinalTemplate.studentpanel1" %>

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
            var path = "url(assets/images/cesThemeImages/378173.jpg)";
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

                    <asp:Label ID="Label6" runat="server" Text="Label" Visible="false"></asp:Label>

                    <h4 runat="server" style="color: #A8CF78">Change Profile Picture</h4>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:Button class="btn-green" BackColor="#86bc42" BorderColor="#86bc42" ID="btnSave" Text="Save" OnClick="btnSave_Click" runat="server" Height="30px" Width="70px"></asp:Button>
                    <asp:Label ID="Label1" runat="server"></asp:Label>

                </div>
                <div id="profilepic" runat="server" data-wow-delay="0.2s" data-wow-duration="1.2s" class="background-girl-1 wow fadeInDown" style="color: transparent">
                    <asp:Image ID="shah" CssClass="img-responsive" runat="server" Style="border-radius: 200px; color: transparent; height: 320px; width: 270px" />
                </div>
            </div>
        </div>
    </div>
    <!-- CHOOSE COURSES-->
    <div class="section choose-course-3">
        <div class="choose-course-3-wrapper row">
            <div class="item-course">
                <div class="item-course-wrapper">
                    <div class="icon-course"><i class="icons-img icon-a-1-01"></i></div>
                    <div class="info-course">
                        <a href="update_StudentDetail.aspx" class="name-course">DETAIL</a>
                        <div class="info">
                            <asp:label runat="server" ForeColor="#86bc42" id="name" Text="name "></asp:label><br />
                            <asp:label runat="server" ForeColor="#86bc42" id="father" Text="father name "></asp:label><br />
                            <asp:label runat="server" ForeColor="#86bc42" id="cotact" Text="contact "></asp:label><br />
                            <asp:label runat="server" ForeColor="#86bc42" id="email" Text="email "></asp:label><br />
                        </div>
                    </div>
                </div>
            </div>
            <div class="item-course">
                <div class="item-course-wrapper">
                    <div class="icon-course"><i class="icons-img icon-credit_card"></i></div>
                    <a href="Attendance_Student.aspx" class="info-course">
                        <div class="name-course">ATTENDANCE</div>
                        <div class="info">Check out Your Attendance Counter and Today's Attendance</div>
                    </a>
                </div>
            </div>
            <div class="item-course">
                <div class="item-course-wrapper">
                    <div class="icon-course"><i class="icons-img icon-computer_network"></i></div>
                    <div class="info-course">
                        <a href="update_StudentDetail.aspx" class="name-course">UPDATE DETAIL</a>
                        <div class="info">Update your Profile with new confidential Information Feel Free without any hesitation.</div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <%--ststus--%>
    <div class="section teacher-skill">
        <div class="container teacher-skill-content">
            <div class="teacher-skill-wrapper">
               <b style="font-size:medium" class="title"> " future is bright when you choose straight or correct path "<br />
                " trigger yourself for future to make sparke light "</b>
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
        </div>
    </div>
    <br />
    <%--ATTENDANCE--%>
    <asp:GridView ID="GridView3" class="edu-table-responsive" runat="server" AutoGenerateColumns="False" DataSourceID="timetable_1test" AllowSorting="True" BackColor="#000066" Font-Bold="False" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="day" HeaderText="Day" SortExpression="day" ItemStyle-ForeColor="#6B9735" />
            <asp:BoundField DataField="period_1" HeaderText="Unit 1" SortExpression="period_1" />
            <asp:BoundField DataField="period_2" HeaderText="Unit 2" SortExpression="period_2" />
            <asp:BoundField DataField="period_3" HeaderText="Unit 3" SortExpression="period_3" />
            <asp:BoundField DataField="period_4" HeaderText="Unit 4" SortExpression="period_4" />
            <asp:BoundField DataField="period_5" HeaderText="Unit 5" SortExpression="period_5" />
            <asp:BoundField DataField="period_6" HeaderText="Unit 6" SortExpression="period_6" />
            <asp:BoundField DataField="period_7" HeaderText="Unit 7" SortExpression="period_7" />
            <asp:BoundField DataField="period_8" HeaderText="Unit 8" SortExpression="period_8" />
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
    <asp:SqlDataSource ID="timetable_1test" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="sp_timetable_test1" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label5" Name="section" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Label4" Name="class" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Label6" Name="school_id" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>
