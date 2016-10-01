<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateTeacherInformation.aspx.cs" Inherits="FinalTemplate.UpdateTeacherInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">

<script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">
        $(window).load(function () {
            searchboxwidth();
        });
        $(document).ready(function () {
            teacherwidth();
            samesizeimage();
            setbuttonlayout();
            formfieldswidths();
            rowbg();

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
            $('.table-row').css('background-color', '#90a1ae');
            $('.heading-table').css('background-color', 'rgb(61, 154, 45)');
            $('span').css('color', 'white');
        }
        function formfieldswidths() {
            $('#<%=txtFirstName.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtLastName.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtDateOfBirth.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=ddlNationality.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=rbtnMale.ClientID%>').css({ 'width': '20%', 'border-radius': '5px' });
            $('#<%=rbtnFemale.ClientID%>').css({ 'width': '20%', 'border-radius': '5px' });
            $('#<%=txtReligion.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtPhone.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtAddress.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=ddlCountry.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=ddlCity.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtPostalCode.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtUsername.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtPrimaryEmail.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=ddlUserType.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtLoginCount.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtlastLoginDate.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtDateOfJoin.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtCNIC.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtSchoolID.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtTeacherIDToPopulateDetails.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
        }
        function samesizeimage() {
            $('a img').css({ 'height': '200px', 'width': '300px' });
        }

        function setbuttonlayout() {
            $('button.btn.btn-green').css('padding-right', '115px');
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
                <h2 class="center-title">Update Teacher Information</h2>
                <div class="bottom-title"><i class="bottom-icon icon-icon-04"></i></div>
                <div class="container teacher-course-wrapper">
                    <div class="inner-container">
                        <div class="table-header">
                            <table class="edu-table-responsive">
                                <thead>
                                    <tr class="heading-table">
                                        <th class="col-3">Insert teacher id to populate his/her all details</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Teacher ID</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" CssClass="roundborder" ID="txtTeacherIDToPopulateDetails"></asp:TextBox></td>
                                        <td class="col-3"><span>
                                            <asp:Button ID="btnPopulateDetails"  Text="Populate Details" runat="server" ForeColor="Black" OnClick="btnPopulateDetails_Click" /></span></td>
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
                                        <th class="col-3">Personal Information</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row">
                                        <td class="col-3"><span>First Name</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtFirstName"></asp:TextBox></td>
                                       <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Last Name</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtLastName"></asp:TextBox></td>
                                       <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Date Of Birth</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtDateOfBirth" placeholder="mm/dd/yyyy"></asp:TextBox></td>
                                       <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Nationality</span></td>
                                        <td class="col-2"><asp:DropDownList Enabled="false" runat="server" ID="ddlNationality"><asp:ListItem>Pakistan</asp:ListItem></asp:DropDownList></td>
                                       <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Gender</span></td>
                                        <td class="col-2"><asp:RadioButton runat="server" ID="rbtnMale" Text="Male" GroupName="gender" /><asp:RadioButton runat="server" ID="rbtnFemale" Text="Female" GroupName="gender" /></td>
                                       <td class="col-3"></td>
                                    </tr>
                                    
                                    <tr class="table-row">
                                        <td class="col-3"><span>Religion</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtReligion"></asp:TextBox></td>
                                       <td class="col-3"></td>
                                    </tr>

                                    <tr class="table-row">
                                        <td class="col-3"><span>Phone</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtPhone"></asp:TextBox></td>
                                       <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Address</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtAddress"></asp:TextBox></td>
                                       <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Country</span></td>
                                        <td class="col-2"><asp:DropDownList runat="server" ID="ddlCountry"><asp:ListItem>Pakistan</asp:ListItem></asp:DropDownList></td>
                                       <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>City</span></td>
                                        <td class="col-2"><asp:DropDownList runat="server" ID="ddlCity"><asp:ListItem>Karachi</asp:ListItem></asp:DropDownList>
                                        </td>
                                       <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Postal Code</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtPostalCode"></asp:TextBox></td>
                                       <td class="col-3"></td>
                                    </tr>
                                     <tr class="table-row">
                                        <td class="col-3"><span>Date Of Join</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtDateOfJoin" placeholder="mm/dd/yyyy"></asp:TextBox></td>
                                       <td class="col-3"></td>
                                    </tr>
                                     <tr class="table-row">
                                        <td class="col-3"><span>CNIC</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" Enabled="false" ID="txtCNIC"></asp:TextBox></td>
                                       <td class="col-3"></td>
                                    </tr>
                                     <tr class="table-row">
                                        <td class="col-3"><span>School ID</span></td>
                                        <td class="col-2"><asp:TextBox Enabled="false" runat="server" ID="txtSchoolID"></asp:TextBox></td>
                                        <td class="col-3"></td>
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
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtUsername" Enabled="false"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    
                                    <tr class="table-row">
                                        <td class="col-3"><span>Primary Email Address</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtPrimaryEmail" Enabled="false" TextMode="Email"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    
                                    <tr class="table-row">
                                        <td class="col-3"><span>User Type</span></td>
                                        <td class="col-2"><asp:DropDownList Enabled="false" runat="server" ID="ddlUserType"><asp:ListItem>Teacher</asp:ListItem></asp:DropDownList></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Login Count</span></td>
                                        <td class="col-2"><asp:TextBox Enabled="false" runat="server" ID="txtLoginCount"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>

                                    <tr class="table-row">
                                        <td class="col-3"><span>Last Login Date</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" Enabled="false" ID="txtlastLoginDate"></asp:TextBox></td>
                                        <td class="col-3"></td>
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
                                        <th class="col-3">Unique Information</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row">
                                        <td class="col-3"><span>General Details ID</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtGenealID" ReadOnly="true"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    
                                    <tr class="table-row">
                                        <td class="col-3"><span>Location ID</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtLocationID" ReadOnly="true" ></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    
                                    <tr class="table-row">
                                        <td class="col-3"><span>Date Of Birth ID</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtDOBId" ReadOnly="true" ></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Teacher ID</span></td>
                                        <td class="col-2"><asp:TextBox ReadOnly="true" runat="server" ID="txtTeacherID"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                     <tr class="table-row">
                                        <td class="col-3"></td>
                                        <td class="col-3"><span>
                                            <asp:Button ID="Button21" Text="Update Information" runat="server" ForeColor="Black" OnClick="Button21_Click" /></span></td>
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
