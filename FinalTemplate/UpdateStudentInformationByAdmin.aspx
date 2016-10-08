<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateStudentInformationByAdmin.aspx.cs" Inherits="FinalTemplate.UpdateStudentInformationByAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
      <link href="assets/css/toggleSwitch.css" rel="stylesheet" />
    <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#back-top').remove();
            $('#<%=txtStudentIDForGettingInformation.ClientID%>').parent().css('width', '100%');
            $('.heading-table').css('background-color', '#175f96');
            radiobuttonalignment('#<%=rbtnFemale.ClientID%>');
            radiobuttonalignment('#<%=rbtnMale.ClientID%>');
        });

        function radiobuttonalignment(control) {
            $(control).css('margin', '0px 5px 0px 40px');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
        <div class="section section-padding top-courses">
        <div class="container">
            <div class="group-title-index">
                <h2 class="center-title">Update Student Information</h2>
                <div class="bottom-title"><i class="bottom-icon icon-icon-04"></i></div>
                <p>You can view all information related to particular student but only change his/her specific information due to integrity of student policy</p>
                <div class="container teacher-course-wrapper">
                     <div class="inner-container">
                        <div class="table-header">
                            <table class="edu-table-responsive">
                                <thead>
                                    <tr class="heading-table">
                                        <th class="col-3">Teacher ID</th>
                                        
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Student ID</span></td>
                                        <td class="col-2"><asp:TextBox CssClass="fullWidth" ID="txtStudentIDForGettingInformation"  runat="server"></asp:TextBox></td>
                                        <td class="col-3">
                                            <asp:Button Text="Get Student Information" runat="server" ID="btnGetStudentInformation" OnClick="btnGetStudentInformation_Click" />
                                        </td>
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
                                        <th class="col-3">Student Personal Information</th>
                                   </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row">
                                        <td class="col-3"><span>First Name</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtFirstName" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Last Name</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtLastName" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Date Of Birth</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtDateOfBirth" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Nationality</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtNationality" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Gender</span></td>
                                        <td class="col-2"><asp:RadioButton runat="server" ID="rbtnMale" Text="Male"/><asp:RadioButton runat="server" ID="rbtnFemale" Text="Female"/></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Religion</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtReligion" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Address</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtAddress" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Postal Code</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtPostalCode" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Phone</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtPhone" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>City</span></td>
                                        <td class="col-2"><asp:DropDownList runat="server" ID="ddlCity" CssClass="fullWidth"></asp:DropDownList></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Class</span></td>
                                        <td class="col-2"><asp:DropDownList runat="server" ID="ddlClass" CssClass="fullWidth"/></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Section</span></td>
                                        <td class="col-2"><asp:DropDownList runat="server" ID="ddlSection" CssClass="fullWidth"/></td>
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
                                        <th class="col-3">Other Information</th>
                                   </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Guardian Name</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ReadOnly="True" ID="txtGuardianName" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Guardian Contact</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ReadOnly="True" ID="txtGuardianContact" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Previous School</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ReadOnly="True" ID="txtPreviousSchool" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Last Class Attended</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ReadOnly="True" ID="txtLastClassAttended" CssClass="fullWidth"></asp:TextBox></td>
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
                                        <td class="col-3"><span>General ID</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtGeneralID" ReadOnly="True" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Authorized ID</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtAuthorizedID" ReadOnly="True" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Student ID</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtStudentID" ReadOnly="True" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Class Section Information ID</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtClassSectionInformationID" ReadOnly="true" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                     <tr class="table-row">
                                        <td class="col-3"><span>Location ID</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtLocationID" ReadOnly="true" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Date Of Birth ID</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtDateOfBirthID" ReadOnly="True" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"></td>
                                        <td class="col-2"><asp:Button runat="server" ID="btnUpdateStudentInformation" Text="Update Student Information" OnClick="btnUpdateStudentInformation_Click"/></td>
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
