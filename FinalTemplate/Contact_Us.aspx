<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Contact_Us.aspx.cs" Inherits="FinalTemplate.Contact_Us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="UserHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="UserContentPlaceHolder" runat="server">
    <div class="section background-opacity page-title set-height-top">
        <div class="container">
            <div class="page-title-wrapper">
                <!--.page-title-content-->
                <h2 class="captions">Contact</h2>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><a href="#">Contact</a></li>
                </ol>
            </div>
        </div>
    </div>
    <br /><br />
        <div class="container">
            <div class="contact-main-wrapper">
                <div class="row contact-method">
                    <div class="col-md-4">
                        <div class="method-item">
                            <i class="fa fa-map-marker"></i>

                            <p class="sub">COME TO</p>
                            <asp:Label ID="lab2" CssClass="h5" ForeColor="#8BBD4D" runat="server">SirSyed University Of Engineering & Technology </asp:Label>
                            <div class="detail">
                                <p>Karachi , Pakistan</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="method-item">
                            <i class="fa fa-phone"></i>
                            <p class="sub">CALL TO</p>
                            <div class="detail">
                                <asp:Label CssClass="h5" ID="contact1" runat="server" ForeColor="#8BBD4D">+923322556848</asp:Label>
                                <br />
                                <asp:Label CssClass="h5" ID="contact2" runat="server" ForeColor="#8BBD4D">+923472074535</asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="method-item">
                            <i class="fa fa-envelope"></i>

                            <p class="sub">CONNECT TO</p>

                            <div class="detail">
                                <label>CES Website :</label>
                                <br />
                                <asp:Label CssClass="h5" ID="ces" ForeColor="#8BBD4D" runat="server">www.CES.edu.pk</asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <form class="bg-w-form contact-form">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label form-label">NAME <span class="highlight">*</span><asp:TextBox ID="TextBox1" CssClass="form-control form-input" runat="server" Width="455px" Height="40px"></asp:TextBox></label><!--label.control-label.form-label.warning-label(for="") Warning for the above !--></div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label form-label">EMAIL <span class="highlight">*</span>
                                    <asp:TextBox ID="TextBox2" CssClass="form-control form-input" runat="server" Width="455px" Height="40px" ></asp:TextBox>
                                </label>
                                <!--label.control-label.form-label.warning-label(for="")-->
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label form-label">PURPOSE</label>
                                <br />
                                <asp:DropDownList ID="DropDownList1" runat="server" Height="40px" Width="455px">
                                    <asp:ListItem>Select</asp:ListItem>
                                    <asp:ListItem>Query</asp:ListItem>
                                    <asp:ListItem>Complain</asp:ListItem>
                                    <asp:ListItem>Promotion</asp:ListItem>
                                </asp:DropDownList><!--label.control-label.form-label.warning-label(for="", hidden)-->
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="contact-question form-group">
                                <label class="control-label form-label">Your Query ? <span class="highlight">*</span></label><br />
                                <asp:TextBox ID="TextBox3" CssClass="form-control form-input" runat="server" Width="586px" Height="119px" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="register-submit">
                        <button type="submit" class="btn btn-register btn-green">
                            <span>
                                <asp:Button ID="Button2" runat="server" Text=" Update" Style="background-color: transparent" BorderStyle="None" OnClick="Button1_Click" /></span></button>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </div>
                </form>
            </div>
        </div><br />
    <div id="map-curve"></div>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCs6JNdcD-avNuHSyp-M2ceRrMKlG9FIFQ&libraries=places"
  type="text/javascript"></script>
    <script>
        var map = new google.maps.Map(document.getElementById('#map-curve'),{
            center:{
                Lat:27.72,
                Lng:85.36
            },
            zoom:15
        });

        var marker = new google.maps.Marker({
            position: {
                Lat: 27.72,
                Lng: 85.36
            },
            map: map,
            draggable:true
        });

        var searchbox = new google.maps.places.searchbox(document.getElementById('mapsearch'));
        google.maps.event.addListener(searchbox, 'places_changed', function () {
            //console.log(searchbox.getplaces());
            var places = searchbox.getplaces();
            var bounds = new google.maps.latlngbounds();
            var i, place;

            for (i = 0; place = places[i]; i++){
                bounds.extend(place.geometry.Location);
            marker.setposition(place.geometry.Location);
        }
            map.fitbounds(bounds);
            map.setzoom(15); 

        });
    </script>

    <br/>
            <%--<%GOOGLE_MAP%>--%>
    <iframe src="https://www.google.com/maps/embed?pb=!1m23!1m12!1m3!1d57895.64701802451!2d67.05779682141163!3d24.91578325490705!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m8!3e6!4m0!4m5!1s0x3eb33f32a0f2c3f3%3A0x4fc0a6fd386117f0!2sSir+Syed+University+of+Engineering+and+Technology%2C+Karachi%2C+Pakistan!3m2!1d24.9157095!2d67.0928165!5e0!3m2!1sen!2s!4v1482820514043" width="1400" height="400" frameborder="0" style="border:0" allowfullscreen>
    </iframe>

<%--    <script src='https://maps.googleapis.com/maps/api/js?v=3.exp'></script>
    <div style='overflow: hidden; height: 500px; width: 1007px;'>
        <div id='gmap_canvas' style='height: 500px; width: 1007px;'></div>
        <div><small><a href="http://www.embedgooglemaps.com">Generate your Google map here, quick and easy!</a></small></div>
        <div><small><a href="https://binaireoptieservaringen.nl/">Bij ons leest u alleen betrouwbare reviews!</a></small></div>
        <style>
            #gmap_canvas img {
                max-width: none !important;
                background: none !important;
            }
        </style>
    </div>--%>

</asp:Content>
