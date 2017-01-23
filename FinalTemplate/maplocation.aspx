<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="maplocation.aspx.cs" Inherits="FinalTemplate.maplocation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="UserHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="UserContentPlaceHolder" runat="server">
   <style type="text/css">
html { height: 100% }
body { height: 100%; margin: 0; padding: 0 }
#map_canvas { height: 100% }
</style>
 <script type="text/javascript" src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyC6v5-2uaq_wusHDktM9ILcqIrlPtnZgEk&sensor=false">
</script>
   <script type="text/javascript">
       window.onload = function () {
           var markers = JSON.parse('<%=ConvertDataTabletoString() %>');
           var mapOptions = {
               center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
               zoom: 3,
               mapTypeId: google.maps.MapTypeId.ROADMAP
               //marker:true
    };
    var infoWindow = new google.maps.InfoWindow();
    var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
    for (i = 0; i < markers.length; i++) {
        var data = markers[i]
        var myLatlng = new google.maps.LatLng(data.lat, data.lng);
        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title: data.title
        });
        (function (marker, data) {

            // Attaching a click event to the current marker
            google.maps.event.addListener(marker, "click", function (e) {
                infoWindow.setContent(data.school_name);
                infoWindow.open(map, marker);
            });
        })(marker, data);
    }
}
</script>

    <form id="form1">
<div id="map_canvas" style="width: auto; height: 400px"></div>
</form>
</asp:Content>
