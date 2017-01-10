<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="DefineFeesStructure.aspx.cs" Inherits="FinalTemplate.DefineFeesStructure" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
    <link href="assets/css/mycss.css" rel="stylesheet" />
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
    <div class="section teacher-course section-padding">
                    <div class="container teacher-course-wrapper">
                        <div class="underline">Define fees structure for your school</div>
                        <div class="course-table">
                            <div class="outer-container">
                                <div class="inner-container">
                                    <div class="table-body">
                                        <table class="edu-table-responsive table-hover">
                                            <tbody>
                                            <tr class="table-row">
                                                    <td class="col-6"><span>Registration Fees</span></td>
                                                    <td class="col-6">
                                                        <asp:TextBox runat="server" ID="txtRegistrationFees"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="table-row">
                                                    <td class="col-6"><span>Addmission Fees</span></td>
                                                    <td class="col-6">
                                                        <asp:TextBox runat="server" ID="txtAddmissionFees"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="table-row">
                                                    <td class="col-6"><span>Security Fees</span></td>
                                                    <td class="col-6">
                                                        <asp:TextBox runat="server" ID="txtSecurityFees"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="table-row">
                                                    <td class="col-6"><span>Annual Fees</span></td>
                                                    <td class="col-6">
                                                        <asp:TextBox runat="server" ID="txtAnnualFees"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="table-row">
                                                    <td class="col-6"><span>Tuition Fees</span></td>
                                                    <td class="col-6">
                                                        <asp:TextBox runat="server" ID="txtTuitionFees"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="table-row">
                                                    <td class="col-6"><span>Transport Fees (0-3 Km)</span></td>
                                                    <td class="col-6">
                                                        <asp:TextBox runat="server" ID="txtTransportfees03km"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="table-row">
                                                    <td class="col-6"><span>Transport Fees (4-8 km)</span></td>
                                                    <td class="col-6">
                                                        <asp:TextBox runat="server" ID="txtTransportfees48km"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="table-row">
                                                    <td class="col-6"><span>Transport Fees (9-16 km)</span></td>
                                                    <td class="col-6">
                                                        <asp:TextBox runat="server" ID="txtTransportfees916km"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="table-row">
                                                    <td class="col-6"><span>Transport Fees (greater than 16 km)</span></td>
                                                    <td class="col-6">
                                                        <asp:TextBox runat="server" ID="txtTransportfeesgreaterthan16km"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <asp:Button runat="server" style="width: 100px; margin: 20px 0px 0px 550px;" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click"></asp:Button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
</asp:Content>
