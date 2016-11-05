<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="update_teacherDetail.aspx.cs" Inherits="FinalTemplate.update_teacherDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TeacherHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TeacherPlaceHolder1" runat="server">
    <div class="section background-opacity page-title set-height-top">
        <div class="container">
            <div class="page-title-wrapper">
                <!--.page-title-content-->
                <h2 class="captions">Update Teacher Information</h2>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="register-wrapper rlp-wrapper reg-sk" style="opacity: 0.98;">
            <div class="register-table rlp-table" style="box-shadow: 5px 5px 50px 5px; background-color: #C8E1AE;">
                <div class="group-title-index">
                    <h2 class="center-title">Update Teacher Details</h2>
                    <div class="bottom-title">
                        <i class="bottom-icon icon-icon-04"></i>
                    </div>
                    <div class="inner-container">
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Teacher ID</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" Width="200px" ID="stdtxtid" ReadOnly="True"></asp:TextBox></td>
                                        <td class="col-3"><span></span></td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="inner-container">
                        <div class="table-header">
                            <table class="edu-table-responsive">
                                <thead>
                                    <tr class="heading-table" style="background-color: #88BD46;">
                                        <th class="col-3">Personal Information</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">First Name</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" Width="200px" ID="txtFirstName"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Last Name</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" Width="200px" ID="txtLastName"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Date Of Birth</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" ID="txtDateOfBirth" Width="200px"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Nationality</span></td>
                                        <td class="col-2">
                                            <asp:DropDownList Enabled="false" Width="200px" BackColor="White" CssClass="sbHolder" runat="server" ID="ddlNationality">
                                                <asp:ListItem>Pakistan</asp:ListItem>
                                            </asp:DropDownList></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Gender</span></td>
                                        <td class="col-2">
                                            <asp:RadioButton runat="server" ID="rbtnMale" Text="Male" GroupName="gender" />&nbsp;&nbsp;
                                        <asp:RadioButton runat="server" ID="rbtnFemale" Text="Female" GroupName="gender" /></td>
                                        <td class="col-3"></td>
                                    </tr>

                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Religion</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" Width="200px" ID="txtReligion"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>

                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Phone</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" Width="200px" ID="txtPhone"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Address</span></td>
                                        <td class="form-input">
                                            <asp:TextBox runat="server" Width="200px" ID="addresstxt"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3" style="color: black; font-weight: bolder">Date Of Join</td>
                                        <td class="col-2">
                                            <asp:TextBox ID="DateOfJointxt" Width="200px" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3" style="color: black; font-weight: bolder">CNIC No</td>
                                        <td class="col-2">
                                            <asp:TextBox ID="cnicnotxt" Width="200px" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3" style="color: black; font-weight: bolder">City</td>
                                        <td class="col-2">
                                            <asp:DropDownList runat="server" CssClass="sbHolder" BackColor="White" Width="200px" ID="ddlCity">
                                                <asp:ListItem>Karachi</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3" style="color: black; font-weight: bolder">Postal Code</td>
                                        <td class="col-2">
                                            <asp:TextBox ID="postalcodetxt" Width="200px" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3" style="color: black; font-weight: bolder">Username</td>
                                        <td class="col-2">
                                            <asp:TextBox ID="usernametxt" Width="200px" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3" style="color: black; font-weight: bolder">Primary Email</td>
                                        <td class="col-2">
                                            <asp:TextBox ID="pemailtxt" Width="200px" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3" style="color: black; font-weight: bolder">Secondary Email</td>
                                        <td class="col-2">
                                            <asp:TextBox ID="semailtxt" Width="200px" runat="server"></asp:TextBox>
                                        </td>
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
                                    <tr class="heading-table" style="background-color: #88BD46;">
                                        <th class="col-3">Unique Information</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">General Details ID</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" Width="200px" ID="txtGenealID" ReadOnly="true"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>

                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Location ID</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" Width="200px" ID="txtLocationID" ReadOnly="true"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>

                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Date Of Birth ID</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" Width="200px" ID="txtDOBId" ReadOnly="true"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Authorized ID</span></td>
                                        <td class="col-2">
                                            <asp:TextBox ReadOnly="true" runat="server" Width="200px" ID="authorizedidtxt"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"></td>
                                        <td class="col-3"><span>
                                            <div class="register-submit">
                                                <button type="submit" class="btn btn-register btn-green">
                                                    <span>
                                                        <asp:Button ID="Button1" runat="server" Text=" Update" Style="background-color: transparent" BorderStyle="None" /></span></button>
                                                <asp:Label ID="Label1" runat="server"></asp:Label>
                                            </div>
                                            <%--OnClick="Button1_Click"--%>
                                        </span></td>
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
