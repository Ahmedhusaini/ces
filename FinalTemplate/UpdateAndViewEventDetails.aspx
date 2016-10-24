<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateAndViewEventDetails.aspx.cs" Inherits="FinalTemplate.UpdateAndViewEventDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
        <link href="assets/AddEventDatePicker/dist/bootstrap-clockpicker.css" rel="stylesheet" />
    <script src="assets/AddEventDatePicker/dist/bootstrap-clockpicker.js"></script>
    <link href="assets/AddEventDatePicker/dist/bootstrap-clockpicker.min.css" rel="stylesheet" />
    <script src="assets/AddEventDatePicker/dist/bootstrap-clockpicker.min.js"></script>
    <link href="assets/AddEventDatePicker/dist/jquery-clockpicker.css" rel="stylesheet" />
    <script src="assets/AddEventDatePicker/dist/jquery-clockpicker.js"></script>
    <link href="assets/AddEventDatePicker/dist/jquery-clockpicker.min.css" rel="stylesheet" />
    <script src="assets/AddEventDatePicker/dist/jquery-clockpicker.min.js"></script>
    
    <link href="assets/AddEventDatePicker/src/clockpicker.css" rel="stylesheet" />
    <script src="assets/AddEventDatePicker/src/clockpicker.js"></script>
    <link href="assets/AddEventDatePicker/src/standalone.css" rel="stylesheet" />

    <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#back-top').remove();
            $('.heading-table').css('background-color', '#800080');
            
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
                                        <td class="col-2"><asp:TextBox CssClass="form-control" ID="txteventid"  runat="server"></asp:TextBox></td>
                                        <td class="col-3">
                                            <asp:Button Text="Get Event Information" runat="server" ID="btngeteventdetails" OnClick="btngeteventdetails_Click"  />
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
                                        <td class="col-2"><asp:TextBox runat="server" ID="txteventtitle" CssClass="form-control"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Event Discription</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtdescription" CssClass="form-control"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Place</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtplace" CssClass="form-control"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Event Type</span></td>
                                        <td class="col-2"><asp:DropDownList runat="server" ID="ddlEventType" CssClass="form-control"/></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Start Time</span></td>
                                        <td class="col-2">
                                            
                                             <div id="starttime" class="input-group clockpicker" data-placement="top" data-align="top" data-autoclose="true">
                                                 <asp:TextBox runat="server" CssClass="form-control" ID="txtstarttime"  value="00:00"></asp:TextBox>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-time"></span>
                                                </span>
                                            </div>
                                        </td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>End Time</span></td>
                                        <td class="col-2">
                                            
                                            <div id="endtime" class="input-group clockpicker" data-placement="top" data-align="top" data-autoclose="true">
                                                 <asp:TextBox runat="server" CssClass="form-control" ID="txtendtime"   value="00:00"></asp:TextBox>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-time"></span>
                                                </span>
                                            </div>
                                        </td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Start Date</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtstartdate" CssClass="form-control"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>End Date</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtenddate" CssClass="form-control"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Tags</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txttags" CssClass="form-control"></asp:TextBox></td>
                                        <td class="col-3"></td>

                                    </tr>
                                     <tr class="table-row">
                                        <td class="col-3"><span></span></td>
                                        <td class="col-2"><asp:Button runat="server" ID="btnupdateeventdetails" CssClass="form-control" Text="Update Details" OnClick="btnupdateeventdetails_Click"/></td>
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
    <script type="text/javascript" src="assets/AddEventDatePicker/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/AddEventDatePicker/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/AddEventDatePicker/dist/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript">
    $('.clockpicker').clockpicker();
    $('.clockpicker').clockpicker()
        .find('input').change(function () {
            console.log(this.value);
        });
    var input = $('#single-input').clockpicker({
        placement: 'bottom',
        align: 'left',
        autoclose: true,
        'default': 'now'
    });

    $('.clockpicker-with-callbacks').clockpicker({
        donetext: 'Done',
        init: function () {
            console.log("colorpicker initiated");
        },
        beforeShow: function () {
            console.log("before show");
        },
        afterShow: function () {
            console.log("after show");
        },
        beforeHide: function () {
            console.log("before hide");
        },
        afterHide: function () {
            console.log("after hide");
        },
        beforeHourSelect: function () {
            console.log("before hour selected");
        },
        afterHourSelect: function () {
            console.log("after hour selected");
        },
        beforeDone: function () {
            console.log("before done");
        },
        afterDone: function () {
            console.log("after done");
        }
    })
        .find('input').change(function () {
            console.log(this.value);
        });

    // Manually toggle to the minutes view
    $('#check-minutes').click(function (e) {
        // Have to stop propagation here
        e.stopPropagation();
        input.clockpicker('show')
            .clockpicker('toggleView', 'minutes');
    });
    if (/mobile/i.test(navigator.userAgent)) {
        $('input').prop('readOnly', true);
    }
</script>
<script type="text/javascript" src="assets/AddEventDatePicker/assets/js/highlight.min.js"></script>
<script type="text/javascript">
    hljs.configure({ tabReplace: '    ' });
    hljs.initHighlightingOnLoad();
</script>
</asp:Content>
