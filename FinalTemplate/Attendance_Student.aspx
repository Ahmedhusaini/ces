<%@ Page Title="Attendence" Language="C#" MasterPageFile="~/studentpanel.Master" AutoEventWireup="true" CodeBehind="Attendance_Student.aspx.cs" Inherits="FinalTemplate.Attendance_Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section background-opacity page-title set-height-top">
        <div class="container">
            <div class="page-title-wrapper">
                <!--.page-title-content-->
                <h2 class="captions">Attendance</h2>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><a href="#">Attendance</a></li>
                </ol>
            </div>
        </div>
    </div>
    <div class="search-input">
        <div class="container">
            <div class="underline" style="height: 20px; text-align: center;">
                <h1 style="color: white;">Your Overall Attendance </h1>
            </div>
        </div>
    </div>
    <!-- WHY CHOOSE US-->
    <div class="section why-choose-us">
        <div class="why-choose-us-wrapper<%-- bottom background-opacity--%>">
            <div class="container">
                <div data-wow-delay="0.4s" data-wow-duration="1s" class="row why-choose-us-wrapper wow zoomIn">
                    <div class="customs-row">
                        <div class="col-sm-4 col-xs-6 section-icon">
                            <i class="fa fa-calendar"></i>
                            <asp:Label runat="server" Text=" Total Days" ID="total"></asp:Label>
                        </div>
                        <div class="col-sm-4 col-xs-6 section-icon">
                            <i class="fa fa-bookmark-o"></i>
                            <asp:Label runat="server" Text=" Days present" ID="present"></asp:Label>
                        </div>
                        <div class="col-sm-4 col-xs-6 section-icon">
                            <i class="fa fa-close"></i>
                            <asp:Label runat="server" Text=" Days present" ID="absent"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="search-input">
        <div class="container">
            <div class="underline" style="height: 20px; text-align: center;">
                <h1 style="color: white;">Your Today Attendance </h1>
            </div>
        </div>
    </div>
    <asp:Label ID="Label7" runat="server" Visible="false" Text="Label"></asp:Label>
    &nbsp;<asp:Label ID="Label8" runat="server" Visible="false" Text="Label"></asp:Label>
    <asp:GridView ID="GridView2" class="edu-table-responsive" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#86BC42" GridLines="None">
        <Columns>
            <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
            <asp:BoundField DataField="Column2" HeaderText="Column2" ReadOnly="True" SortExpression="Column2" />
            <asp:BoundField DataField="Column3" HeaderText="Column3" SortExpression="Column3" ReadOnly="True" />
            <asp:BoundField DataField="time" HeaderText="time" SortExpression="time" />
            <asp:BoundField DataField="remarks" HeaderText="remarks" SortExpression="remarks" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#737373" Font-Bold="True" ForeColor="#86bc42" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="shahwaiz_attendance" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label8" DefaultValue="" Name="Std_id" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Label7" DefaultValue="" Name="date" PropertyName="Text" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>
