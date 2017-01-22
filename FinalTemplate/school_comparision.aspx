<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="school_comparision.aspx.cs" Inherits="FinalTemplate.school_comparision" %>

<asp:Content ID="Content1" ContentPlaceHolderID="UserHeadPlaceHolder" runat="server">
    <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript" >
        $(document.window).ready(function() {
            
            

        });

        $(document).ready(function() {
            //$('[title="remove"]').hide();
            $('#<%=Button1.ClientID%>').click(function (e) {
                //e.preventDefault();
                $('[title="remove"]').show();
            });
        });


    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="UserContentPlaceHolder" runat="server">
    <div id="wrapper-content">
        <div class="main-content">
            <div class="content">
                <div class="section section-padding news-page">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3 sidebar layout-right">
                                <div style="left: -880px; position: relative">
                                    <div class="section pricing">
                                        <div class="container">
                                            <div class="group-title-index">
                                                <br />
                                                <h1 class="center-title" style="color: #86bc42">-- Schools Comparision --</h1>
                                            </div>
                                            <div class="row">
                                                <div class="pricing-wrapper">
                                                    <div class="col-md-6">
                                                        <label for="regname" style="color: #86bc42; font-size: 18px" class="control-label form-label">
                                                            Select school Name <span class="highlight">
                                                                <br />
                                                            </span>
                                                        </label>
                                                        <!--p.help-block Warning !-->
                                                        <br />
                                                        <asp:DropDownList runat="server" CssClass="form-select style-1 selectbox" ID="Dd1" DataSourceID="SqlDataSource2" DataTextField="school_name" DataValueField="school_name"></asp:DropDownList>
                                                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ces %>' SelectCommand="SELECT [school_name] FROM [tbl_school]"></asp:SqlDataSource>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label for="regname" style="color: #86bc42; font-size: 18px" class="control-label form-label">
                                                            Select school Name <span class="highlight">
                                                                <br />
                                                            </span>
                                                        </label>
                                                        <!-- p.help-block Warning !-->
                                                        <br />
                                                        <asp:DropDownList runat="server" CssClass="form-select style-1 selectbox" ID="Dd2" DataSourceID="SqlDataSource2" DataTextField="school_name" DataValueField="school_name"></asp:DropDownList>
                                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ces %>' SelectCommand="SELECT [school_name] FROM [tbl_school]"></asp:SqlDataSource>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div style="margin-left: -353px; border-radius: 10px">
                                    <asp:Button ID="Button1"  BackColor="#5bc0de" Font-Bold="true" CssClass=" btn btn-register btn-green" runat="server" Text="Check" OnClick="Button1_Click" />
                                </div>
                                <br />
                                <div  class="archive-widget widget col-sm-6 col-md-12 col-xs-6 sd380" style="margin-left: -781px;">
                                    <div class="title-widget" style="color: #86bc42">Charaterstics</div>
                                    <div class="content-widget">
                                        <ul class="archive-widget list-unstyled">
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server">School Name</asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server">Founded In</asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server">Primary Or Secondary</asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server">Country</asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server">City</asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server">Campus Name</asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server">Registration Fees</asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server">Admission Fees</asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server">Security Fees</asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server">Annual Fees</asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server">Tution Fees</asp:Label></a></li>
                                             <li><a href="#" class="link archive-item"></a></li>
                                        </ul>
                                    </div>
                                </div>

                                <div title="remove" class="archive-widget widget col-sm-6 col-md-12 col-xs-6 sd380" style="margin-left: -435px">
                                    <div class="title-widget">
                                        <asp:TextBox runat="server" BackColor="Transparent" Font-Bold="true" BorderStyle="None" ForeColor="#86bc42" ID="school1" placeholder="School Name 1"></asp:TextBox></div>
                                    <div class="content-widget">
                                        <ul class="archive-widget list-unstyled">
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server" ID="School_Name"></asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server" ID="found"></asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server" ID="pos"></asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server" ID="coun"></asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server" ID="city"></asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server" ID="camp"></asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server" ID="reg"></asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server" ID="adm"></asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server" ID="sec"></asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server" ID="ann"></asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server" ID="tut"></asp:Label></a></li>
                                             <li><a href="#" class="link archive-item"></a></li>
                                        </ul>
                                    </div>
                                </div>

                                <div title="remove" class="archive-widget widget col-sm-6 col-md-12 col-xs-6 sd380" style="margin-left: -81px;">
                                    <div class="title-widget">
                                        <asp:TextBox runat="server" BackColor="Transparent" Font-Bold="true" BorderStyle="None" ForeColor="#86bc42" ID="school2" placeholder="School Name 2"></asp:TextBox></div>
                                    <div class="content-widget">
                                        <ul class="archive-widget list-unstyled">
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server" ID="School_Name1"></asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server" ID="found1"></asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server" ID="pos1"></asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server" ID="coun1"></asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server" ID="city1"></asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server" ID="camp1"></asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server" ID="reg1"></asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server" ID="adm1"></asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server" ID="sec1"></asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server" ID="ann1"></asp:Label></a></li>
                                            <li><a href="#" class="link archive-item">
                                                <asp:Label runat="server" ID="tut1"></asp:Label></a></li>
                                            <li><a href="#" class="link archive-item"></a></li>
                                        </ul>
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
