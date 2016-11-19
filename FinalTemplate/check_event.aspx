<%@ Page Title="Event" Language="C#" MasterPageFile="~/updatepasswordpanel.Master" AutoEventWireup="true" CodeBehind="check_event.aspx.cs" Inherits="FinalTemplate.check_event" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section background-opacity page-title set-height-top">
        <div class="container">
            <div class="page-title-wrapper">
                <!--.page-title-content-->
                <h2 class="captions">Event</h2>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><a href="#">Event</a></li>
                </ol>
            </div>
        </div>
    </div>
    <div class="container" style="position: relative; margin: 0px 0px 0px 200px">
        <div class="row">
            <div class="col-md-9">
                <div class="news-page-wrapper">
                    <div class="edugate-layout-1">
                        <div class="edugate-image">
                            <asp:Image runat="server" alt="event image" id="eventimg" class="img-responsive" />
                        </div>
                        <div class="edugate-content">
                            <asp:Label runat="server" class="title" ID="new_name"></asp:Label>
                            <div class="info">
                                <div class="author item">
                                    <asp:Label class="text-success" runat="server">Starting Time</asp:Label>
                                </div>
                                <div class="date-time item">
                                    <asp:Label ID="start_t" ForeColor="#86bc42" runat="server"></asp:Label>
                                </div>
                                <div class="author item">
                                    <asp:Label class="text-success" runat="server">Ending Time</asp:Label>
                                </div>
                                <div class="date-time item">
                                    <asp:Label ID="end_t" ForeColor="#86bc42" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="info">
                                <div class="author item">
                                    <asp:Label class="text-success" runat="server">Starting Date</asp:Label>
                                </div>
                                <div class="date-time item">
                                    <asp:Label ID="start_d" ForeColor="#86bc42" runat="server"></asp:Label>
                                </div>
                                <div class="author item">
                                    <asp:Label class="text-success" runat="server">Ending Date</asp:Label>
                                </div>
                                <div class="date-time item">
                                    <asp:Label ID="end_d" ForeColor="#86bc42" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="info-more">
                                <div class="comment item">
                                    <i class="fa fa-map-marker"></i>
                                    <asp:Label ID="plac" ForeColor="#86bc42" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="description">
                                <asp:Label runat="server">Place : </asp:Label><asp:Label runat="server" ID="desc"></asp:Label>
                            </div>
                            <div class="info-more">
                                <div class="comment item">
                                    <i class="fa fa-tags"></i>
                                    <asp:Label runat="server">Tags : </asp:Label><asp:Label ID="tag" ForeColor="#86bc42" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
