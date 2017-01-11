<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="PostJob.aspx.cs" Inherits="FinalTemplate.PostJob" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
    <div id="wrapper-content"><!-- PAGE WRAPPER-->
    <div id="page-wrapper"><!-- MAIN CONTENT-->
        <div class="main-content"><!-- CONTENT-->
                <!-- CONTACT-->
                <div class="section section-padding contact-main2">
                    <div class="container">
                        <div class="contact-main-wrapper">
                            <br/><br/><br/>
                            <div class="underline">Post job on CES portal.</div>
                            <form class="bg-w-form contact-form">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group"><label class="control-label form-label">Job Title<span class="highlight">*</span></label><asp:TextBox runat="server" ID="txtTitle" CssClass="form-control form-input"></asp:TextBox></div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group"><label class="control-label form-label">Category<span class="highlight">*</span></label><asp:DropDownList CssClass="form-select style-1 selectbox" runat="server" ID="ddlJobCategory"/></div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group"><label class="control-label form-label">Description<span class="highlight">*</span></label><asp:TextBox runat="server" ID="txtDescription" CssClass="form-control form-input"></asp:TextBox></div>
                                    </div>
                                </div>
                                <div class="contact-submit">
                                    
                                    <asp:Button runat="server" ID="btnPost" Text="Post" CssClass="btn btn-contact btn-green" OnClick="btnPost_Click" />
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
