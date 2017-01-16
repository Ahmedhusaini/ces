<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddSchoolLocation.aspx.cs" Inherits="FinalTemplate.AddSchoolLocation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
<div id="wrapper-content"><!-- PAGE WRAPPER-->
    <div id="page-wrapper"><!-- MAIN CONTENT-->
        <div class="main-content"><!-- CONTENT-->
            <div class="content">
                
                
                <!-- FREQUENTLY ASKED QUESTIONS-->
                <div class="section section-padding">
                        <div class="accordion-faq">
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-8">
                                    <div class="underline">How to get your coordinates</div>
                                    <div id="accordion-1" class="panel-group accordion">
                                        <div class="panel">
                                            <div class="panel-heading"><h5 class="panel-title"><a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-1-1" aria-expanded="false" class="accordion-toggle collapsed">Step # 1</a></h5></div>
                                            <div id="collapse-1-1" aria-expanded="false" style="height: 0px;" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    Follow the URL<br />
                                                    <img src="assets/images/map-instruction/1.png"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel">
                                            <div class="panel-heading"><h5 class="panel-title"><a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-1-2" aria-expanded="true" class="accordion-toggle collapsed">Step # 2</a></h5></div>
                                            <div id="collapse-1-2" style="" aria-expanded="true" class="panel-collapse collapse">
                                                <div class="panel-body">Right click on the location you want to add and click what's here<br/>
                                                    <img src="assets/images/map-instruction/2.png"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel">
                                            <div class="panel-heading"><h5 class="panel-title"><a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-1-3" aria-expanded="false" class="accordion-toggle collapsed">Step # 3</a></h5></div>
                                            <div id="collapse-1-3" style="height: 0px;" aria-expanded="false" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    Copy the coordinates which show in the popup box. Coordinate on left side is for longitude and coordinate location on right is for latitude.<br/>
                                                    <img src="assets/images/map-instruction/3.png" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- CONTACT-->
                <div class="section section-padding contact-main2">
                    <div class="container">
                        <div class="contact-main-wrapper">
                            <div class="underline">Enter your location coordinates</div>
                            <form class="bg-w-form contact-form">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group"><label class="control-label form-label">Longitude <span class="highlight">*</span></label><asp:TextBox runat="server" ID="txtLongitude" CssClass="form-control form-input"></asp:TextBox></div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group"><label class="control-label form-label">Latitude<span class="highlight">*</span></label><asp:TextBox runat="server" CssClass="form-control form-input" ID="txtLatitude"></asp:TextBox></div>
                                    </div>
                                </div>
                                <div class="contact-submit">
                                    
                                    <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="btn btn-contact btn-green" OnClick="btnSubmit_Click"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BUTTON BACK TO TOP-->
    <div id="back-top"><a href="#top"><i class="fa fa-angle-double-up"></i></a></div>
</div>
</asp:Content>
