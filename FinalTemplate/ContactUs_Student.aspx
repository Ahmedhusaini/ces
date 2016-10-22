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
                                            <asp:Label id="lab2" CssClass="h5" ForeColor="#8BBD4D" runat="server"></asp:Label>
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
                                                <label>Contact 1: </label>&nbsp;<asp:Label CssClass="h5" ID="contact1" runat="server" ForeColor="#8BBD4D"></asp:Label>
                                                <br />
                                                <label>Contact 2: </label>&nbsp;<asp:Label CssClass="h5" ID="contact2" runat="server" ForeColor="#8BBD4D"></asp:Label>
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
                                                <input type="text" placeholder="" class="form-control form-input" /><!--label.control-label.form-label.warning-label(for="") Warning for the above !-->
                                            </div>
                                        </div>
                                        <div class="col-md-6" style="width: 40%">
                                            <div class="form-group">
                                                <label class="control-label form-label">EMAIL </label>
                                                <input type="text" placeholder="" class="form-control form-input" /><!--label.control-label.form-label.warning-label(for="")-->
                                            </div>
                                        </div>
                                        <div class="col-md-6" style="width: 40%">
                                            <div class="form-group">
                                                <label class="control-label form-label">SUBJECT</label><input type="text" placeholder="" class="form-control form-input" /><!--label.control-label.form-label.warning-label(for="", hidden)-->
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="contact-question form-group">
                                                <label class="control-label form-label">HOW CAN WE HELP? <span class="highlight">*</span></label>
                                                <textarea class="form-control form-input" style="height: 100px"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="contact-submit">
                                        <span>
                                            <button type="submit" class="btn btn-contact btn-green">Submit</button>
                                        </span>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
