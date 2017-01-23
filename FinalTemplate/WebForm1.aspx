<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="FinalTemplate.WebForm1" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel="icon" href="assets/images/logo/logo-carousel-6.png" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- LIBRARY FONT-->
    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:400,400italic,700,900,300" />
    <link type="text/css" rel="stylesheet" href="assets/font/font-icon/font-awesome-4.4.0/css/font-awesome.css" />
    <link type="text/css" rel="stylesheet" href="assets/font/font-icon/font-svg/css/Glyphter.css" />
    <!-- LIBRARY CSS-->
    <link type="text/css" rel="stylesheet" href="assets/css/color-1.css" />
    <link href="assets/css/mycss.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="assets/libs/animate/animate.css" />
    <link type="text/css" rel="stylesheet" href="assets/libs/bootstrap-3.3.5/css/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="assets/libs/owl-carousel-2.0/assets/owl.carousel.css" />
    <link type="text/css" rel="stylesheet" href="assets/libs/selectbox/css/jquery.selectbox.css" />
    <link type="text/css" rel="stylesheet" href="assets/libs/fancybox/css/jquery.fancybox.css" />
    <link type="text/css" rel="stylesheet" href="assets/libs/fancybox/css/jquery.fancybox-buttons.css" />
    <link type="text/css" rel="stylesheet" href="assets/libs/media-element/build/mediaelementplayer.min.css" />
    <!-- STYLE CSS    -->
    <!--link(type="text/css", rel='stylesheet', href='assets/css/color-1.css', id="color-skins")-->
    <link type="text/css" rel="stylesheet" href="#" id="colorskins" />
    <script src="assets/libs/jquery/jquery-2.1.4.min.js"></script>
    <script src="assets/libs/js-cookie/js.cookie.js"></script>
    <script>if ((Cookies.get('colorskin') != undefined) && (Cookies.get('colorskin') != 'color-1')) {
    $('#colorskins').attr('href', 'assets/css/' + Cookies.get('colorskin') + '.css');
} else if ((Cookies.get('colorskin') == undefined) || (Cookies.get('colorskin') == 'color-1')) {
    $('#colorskins').attr('href', 'assets/css/color-1.css');
}</script>
</head>
<body>
<div class="section background-opacity page-title set-height-top">
        <div class="container">
            <div class="page-title-wrapper">
                <!--.page-title-content-->
                <h2 class="captions">Date Sheet</h2>
            </div>
        </div>
    </div>
    <br />
    <form runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
                <LocalReport ReportPath="Report3.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet1" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT [day], [period_1], [period_2], [period_3], [period_4], [period_5], [period_6], [period_7], [period_8], [class], [section], [school_id] FROM [view_timetable_1_test] WHERE (([class] = @class) AND ([section] = @section) AND ([school_id] = @school_id))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label1" Name="class" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="Label2" Name="section" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="Label3" Name="school_id" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server">
        <EmptyDataTemplate>
            <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("Marksheet") %>'></asp:LinkButton>
        </EmptyDataTemplate>
            </asp:GridView>

    </form>

    </body>
</html>
