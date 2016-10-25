<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateSchoolInformation.aspx.cs" Inherits="FinalTemplate.UpdateSchoolInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
    
<script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">
        $(window).load(function () {
            searchboxwidth();
        });
        $(document).ready(function () {
            teacherwidth();
      
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
            $('.heading-table').css('background-color', '#7d4646');
            $('span').css('color', 'black');
        }
      

        function setbuttonlayout() {
            $('#<%=btnSaveChanges.ClientID%>').mouseup(function() {
                $(this).css('border-color','teal');
            });
            $('#<%=btnSaveChanges.ClientID%>').mousedown(function () {
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
                <h2 class="center-title">Update School Information</h2>
                <div class="bottom-title"><i class="bottom-icon icon-icon-04"></i></div>
                <div class="container teacher-course-wrapper">
                    <div class="inner-container">
                        <div class="table-header">
                            <table class="edu-table-responsive">
                                <thead>
                                    <tr class="heading-table">
                                        <th class="col-3">School Information</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row">
                                        <td class="col-3"><span>School Name</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtSchoolName" CssClass="form-control" ></asp:TextBox></td>
                                        <td class="col-3" rowspan="10">
                                            <asp:Image ID="imgLogo" Height="25%" Width="90%" runat="server"    />
                                        </td>
                                        
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Owner Name</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtOwnerName" CssClass="form-control" ></asp:TextBox></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Founded In</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtFoundedIn"   CssClass="form-control" placeholder="mm/dd/yyyy"></asp:TextBox></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Logo</span></td>
                                        <td class="col-2"><asp:FileUpload runat="server" ID="fuLogo" CssClass="form-control" /></td>
                                    </tr>

                                    <tr class="table-row">
                                        <td class="col-3"><span>City</span></td>
                                        <td class="col-2"><asp:DropDownList runat="server"  CssClass="form-control" ID="ddlCity"/></td>
                                    </tr>
                                    
                                    <tr class="table-row">
                                        <td class="col-3"><span>Country</span></td>
                                        <td class="col-2"><asp:DropDownList runat="server" CssClass="form-control"  ID="ddlCountry"/></td>
                                    </tr>

                                    <tr class="table-row">
                                        <td class="col-3"><span>PostalCode</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtPostalCode" CssClass="form-control" ></asp:TextBox></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>School Type</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtSchoolTpe" CssClass="form-control" ReadOnly="True"></asp:TextBox></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Contact Primary</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtContactPrimary" CssClass="form-control" ></asp:TextBox></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Contact Secondary</span></td>
                                        <td class="col-2"><asp:TextBox runat="server"  CssClass="form-control" ID="txtContactSecondary"></asp:TextBox></td>
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
                                        <th class="col-3">Authentication Information</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Username</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" CssClass="form-control"  ID="txtUsername"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                     <tr class="table-row">
                                        <td class="col-3"><span>Password</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtPassword" CssClass="form-control"  ReadOnly="True" ></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                     <tr class="table-row">
                                        <td class="col-3"><span>Account Pin</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtAccountPin" CssClass="form-control" ></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                     <tr class="table-row">
                                        <td class="col-3"><span>Primary Email Address</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtPrimaryEmail"  CssClass="form-control" TextMode="Email"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                     <tr class="table-row">
                                        <td class="col-3"><span>Secondary Email Address</span></td>
                                        <td class="col-2"><asp:TextBox CssClass="form-control"  runat="server" ID="txtSecondaryEmail"  TextMode="Email"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Login Count</span></td>
                                        <td class="col-2"><asp:TextBox CssClass="form-control" ReadOnly="True" runat="server" ID="txtLoginCount"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>

                                    <tr class="table-row">
                                        <td class="col-3"><span>Last Login Date</span></td>
                                        <td class="col-2"><asp:TextBox CssClass="form-control" runat="server" ReadOnly="True" ID="txtlastLoginDate"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                   <tr class="table-row">
                                        <td class="col-3"></td>
                                        <td class="col-3"><span>
                                            <asp:Button ID="btnSaveChanges" Text="Update Information" CssClass="form-control" runat="server" ForeColor="Black" /></span></td>
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
