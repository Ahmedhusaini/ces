<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/updatepasswordpanel.Master" AutoEventWireup="true" CodeBehind="ContactUs_Student.aspx.cs" Inherits="FinalTemplate.ContactUs_Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper-content">
        <!-- PAGE WRAPPER-->
        <div id="page-wrapper">
            <!-- MAIN CONTENT-->
            <div class="main-content">
                <!-- CONTENT-->
                <div class="content">
                    <div class="section background-opacity page-title set-height-top">
                        <div class="container">
                            <div class="page-title-wrapper">
                                <!--.page-title-content-->
                                <h2 class="captions">Contact</h2>
                                <ol class="breadcrumb">
                                    <li class="active">Home</li>
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
                                        <div class="method-item">
                                            <i class="fa fa-map-marker"></i>

                                            <p class="sub">COME TO</p>
                                            <label>School Name :</label>
                                            <asp:Label ID="lab2" CssClass="h5" ForeColor="#8BBD4D" runat="server"></asp:Label>
                                            <div class="detail">
                                                <p>Karachi,Pakistan</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="method-item">
                                            <i class="fa fa-phone"></i>
                                            <p class="sub">CALL TO</p>
                                            <div class="detail">
                                                <label>Contact 1: </label>
                                                &nbsp;<asp:Label CssClass="h5" ID="contact1" runat="server" ForeColor="#8BBD4D"></asp:Label>
                                                <br />
                                                <label>Contact 2: </label>
                                                &nbsp;<asp:Label CssClass="h5" ID="contact2" runat="server" ForeColor="#8BBD4D"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="method-item">
                                            <i class="fa fa-envelope"></i>

                                            <p class="sub">CONNECT TO</p>

                                            <div class="detail">
                                                <label>School Website :</label>&nbsp;<asp:Label CssClass="h5" ID="school" ForeColor="#8BBD4D" runat="server"></asp:Label>
                                                <br />
                                                <label>CES Website :</label>&nbsp;<asp:Label CssClass="h5" ID="ces" ForeColor="#8BBD4D" runat="server">www.CES.edu.pk</asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <br />
                                <form class="bg-w-form contact-form">
                                    <div class="row">
                                        <div class="col-md-6" style="width: 40%">
                                            <div class="form-group">
                                                <label class="control-label form-label">NAME </label>
                                                <asp:TextBox runat="server" ID="name" class="form-control form-input"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="contact-question form-group">
                                                <label class="control-label form-label">Enter your Message</label>
                                                <asp:TextBox runat="server" ID="TextBox1" Height="100px" class="form-control form-input" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-register btn-green">
                                        <span>
                                            <asp:Button ID="Button1" OnClick="messege" runat="server" Text=" Message" Style="background-color: transparent" BorderStyle="None" />
                                        </span>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
