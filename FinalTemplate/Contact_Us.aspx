<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Contact_Us.aspx.cs" Inherits="FinalTemplate.Contact_Us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="UserHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="UserContentPlaceHolder" runat="server">
    <div class="section background-opacity page-title set-height-top">
                    <div class="container">
                        <div class="page-title-wrapper"><!--.page-title-content--><h2 class="captions">Contact</h2>
                            <ol class="breadcrumb">
                                <li><a href="index.html">Home</a></li>
                                <li class="active"><a href="#">Contact</a></li>
                            </ol>
                        </div>
                    </div>
                </div>
    <div class="section section-padding contact-main">
                    <div class="container">
                        <div class="contact-main-wrapper">
                            <div class="row contact-method">
                                <div class="col-md-4">
                                    <div class="method-item"><i class="fa fa-map-marker"></i>

                                        <p class="sub">COME TO</p>

                                        <div class="detail"><p>Sir Syed University of Enginerring &amp; Technology</p>

                                            <p>Karachi, Pakistan</p></div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="method-item"><i class="fa fa-phone"></i>

                                        <p class="sub">CALL TO</p>

                                        <div class="detail"><p>Local: 021-36330034-hello</p>

                                            <p>Mobile: 0332-22345645-hello</p></div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="method-item"><i class="fa fa-envelope"></i>

                                        <p class="sub">CONNECT TO</p>

                                        <div class="detail"><p><a href="mailto:CES@gmail.com">ces@gmail.com</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>

                                            <p class="text-left">www.ces.edu.pk</p></div>
                                    </div>
                                </div>
                            </div>
                            <form class="bg-w-form contact-form">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group"><label class="control-label form-label">NAME <span class="highlight">*</span><asp:TextBox ID="TextBox1" CssClass="form-control form-input" runat="server" Width="455px" Height="40px"></asp:TextBox></label><!--label.control-label.form-label.warning-label(for="") Warning for the above !--></div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group"><label class="control-label form-label">EMAIL <span class="highlight">*</span> <asp:TextBox  ID="TextBox2" CssClass="form-control form-input"  runat="server" Width="455px" Height="40px"></asp:TextBox> </label><!--label.control-label.form-label.warning-label(for="")--></div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group"><label class="control-label form-label">PURPOSE</label><asp:DropDownList ID="DropDownList1" runat="server" Height="40px" Width="455px">
                                            <asp:ListItem>Select</asp:ListItem>
                                            <asp:ListItem>Visit</asp:ListItem>
                                            <asp:ListItem>Complain</asp:ListItem>
                                            <asp:ListItem>Promotion</asp:ListItem>
                                            </asp:DropDownList><!--label.control-label.form-label.warning-label(for="", hidden)--></div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group"><label class="control-label form-label">SUBJECT</label> <asp:TextBox ID="TextBox3" CssClass="form-control form-input" runat="server" Width="455px" Height="40px" runat="server"></asp:TextBox><!--label.control-label.form-label.warning-label(for="", hidden)--></div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="contact-question form-group"><label class="control-label form-label">HOW CAN WE HELP? <span class="highlight">*</span></label><br />
                                        <textarea id="TextArea1" rows="7" cols="131" Width="455px" Height="40px" style="textarea" runat="server" ></textarea ></div>
                                    </div>
                                </div>
                                <div class="contact-submit" style="margin-left: 400px">
                                    <asp:Button ID="Button1" CssClass="btn btn-contact btn-green" runat="server" Text="SUBMIT" OnClick="Button1_Click" />
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

    <script src='https://maps.googleapis.com/maps/api/js?v=3.exp'></script><div style='overflow:hidden;height:500px;width:1007px;'><div id='gmap_canvas' style='height:500px;width:1007px;'></div><div><small><a href="http://www.embedgooglemaps.com">Generate your Google map here, quick and easy!</a></small></div><div><small><a href="https://binaireoptieservaringen.nl/">Bij ons leest u alleen betrouwbare reviews!</a></small></div><style>#gmap_canvas img{max-width:none!important;background:none!important}</style></div><script type='text/javascript'>function init_map() { var myOptions = { zoom: 13, center: new google.maps.LatLng(24.906151648112107, 67.08625832216798), mapTypeId: google.maps.MapTypeId.ROADMAP }; map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions); marker = new google.maps.Marker({ map: map, position: new google.maps.LatLng(24.906151648112107, 67.08625832216798) }); infowindow = new google.maps.InfoWindow({ content: '<strong>Our Office</strong><br>Sir Syed University Karachi Pakistan<br>' }); google.maps.event.addListener(marker, 'click', function () { infowindow.open(map, marker); }); infowindow.open(map, marker); } google.maps.event.addDomListener(window, 'load', init_map);</script>
</asp:Content>
