<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateNews.aspx.cs" Inherits="FinalTemplate.UpdateNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
    
<script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">
        $(window).load(function () {
            searchboxwidth();
        });
        $(document).ready(function () {
            teacherwidth();
            $('#<%=txtDescription.ClientID%>').css('width', '100%');
            $('#<%=imgNews.ClientID%>').css({'width':'150px','height':'250px'});
            rowbg();
            setbuttonlayout();
        });
        function SelectedDivAnimation(aspControl) {
            $(aspControl).on('focus', function () {
                $(this).css({ 'background-color': 'rgb(108, 208, 91)', 'transition': '2s', 'border-color': 'green', 'color': 'white', 'height': '40px' });
            });
            $(aspControl).on('focusout', function () {
                $(this).css({ 'background-color': 'white', 'transition': '2s', 'border-color': 'white', 'color': 'black', 'height': '30px' });
            });
        }

        function rowbg() {
            $('.table-row').css('background-color', '#fafafa');
            $('.heading-table').css('background-color', '#b1500b');
            $('span').css('color', 'black');
        }


        function setbuttonlayout() {
            $('#<%=btnUpdateNews.ClientID%>').mouseup(function () {
                $(this).css('border-color', 'teal');
            });
            $('#<%=btnUpdateNews.ClientID%>').mousedown(function () {
                $(this).css('border-color', 'salmon');
            });
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
<div class="section section-padding top-courses">
        <div class="container">
            <div class="group-title-index">
                <h2 class="center-title">Update News Information</h2>
                <div class="bottom-title"><i class="bottom-icon icon-icon-04"></i></div>
                <div class="container teacher-course-wrapper">
                    <div class="inner-container">
                        <div class="table-header">
                            <table class="edu-table-responsive">
                                <thead>
                                    <tr class="heading-table">
                                        <th class="col-3">News Details</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Enter News ID</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtNewsID" CssClass="form-control"></asp:TextBox></td>
                                        <td class="col-3"><asp:Button runat="server" ID="btnGetNewsDetails" OnClick="GetNewsDetailsOnClick"  Text="Get Details"/></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="inner-container">
                        <div class="table-header">
                            <table class="edu-table-responsive">
                                <thead>
                                    <tr class="heading-table">
                                        <th class="col-3">News Details</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Title</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtTitle" CssClass="form-control" ></asp:TextBox></td>
                                        <td class="col-3" rowspan="4">
                                            <asp:Image ID="imgNews" runat="server" Height="133px" ImageUrl="~/images/teachers/teachers (2).jpg" Width="133px" />
                                        </td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Type </span></td>
                                        <td class="col-2"><asp:DropDownList ID="ddlNewsType" CssClass="form-select style-1 selectbox" runat="server"></asp:DropDownList></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Image</span></td>
                                        <td class="col-2"><asp:FileUpload CssClass="form-control"  ID="fuImage" runat="server"/></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Description</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtDescription" CssClass="form-control" TextMode="MultiLine" Rows="7"></asp:TextBox></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Tags</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" CssClass="form-control" ID="txtTags"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    
                                     <tr class="table-row">
                                        <td class="col-3"></td>
                                        <td class="col-3"><span>
                                            <asp:Button ID="btnUpdateNews" Text="Update"  runat="server" ForeColor="Black" OnClick="btnUpdateNews_Click"/></span></td>
                                        <td class="col-3"></td>
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
