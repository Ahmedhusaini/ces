<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateAndViewEventDetails.aspx.cs" Inherits="FinalTemplate.UpdateAndViewEventDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
       <link href="assets/css/toggleSwitch.css" rel="stylesheet" />
    <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#back-top').remove();
            
            $('.heading-table').css('background-color', '#175f96');
            
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
                <h2 class="center-title">Update and view event information</h2>
                <div class="bottom-title"><i class="bottom-icon icon-icon-04"></i></div>
                <p>You can update and view all information related to particular event here.</p>
                <div class="container teacher-course-wrapper">
                     <div class="inner-container">
                        <div class="table-header">
                            <table class="edu-table-responsive">
                                <thead>
                                    <tr class="heading-table">
                                        <th class="col-3">Event ID</th>
                                        
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Event ID</span></td>
                                        <td class="col-2"><asp:TextBox CssClass="fullWidth" ID="txteventid"  runat="server"></asp:TextBox></td>
                                        <td class="col-3">
                                            <asp:Button Text="Get Event Information" runat="server" ID="btngeteventdetails"  />
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
                                        <th class="col-3">Event Details</th>
                                   </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Event Title</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txteventtitle" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Event Discription</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtdescription" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Place</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtplace" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Event Type</span></td>
                                        <td class="col-2"><asp:DropDownList runat="server" ID="ddlEventType" CssClass="fullWidth"/></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Start Time</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtstarttime" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>End Time</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtendtime" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Start Date</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtstartdate" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>End Date</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtenddate" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Event Picture</span></td>
                                        <td class="col-2"><asp:FileUpload runat="server" ID="fueventpicture" CssClass="fullWidth"/></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Tags</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txttags" CssClass="fullWidth"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                     <tr class="table-row">
                                        <td class="col-3"><span></span></td>
                                        <td class="col-2"><asp:Button runat="server" ID="btnupdateeventdetails" CssClass="fullWidth" Text="Update Details"/></td>
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
