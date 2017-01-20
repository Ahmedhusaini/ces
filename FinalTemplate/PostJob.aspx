<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="PostJob.aspx.cs" Inherits="FinalTemplate.PostJob" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">

     <script src="assets/js/jquery-2.2.3.js"></script>
    <script src="assets/js/jquery.validate.js"></script>

    <script type="text/javascript">


        $(document).ready(function () {


            validation();

        });


        $.validator.addMethod("lettersonly", function (value, element) {
            return this.optional(element) || /^[a-z\s]+$/i.test(value);
        }, "Letters only please");
        $.validator.addMethod("phone", function (phone_number, element) {
            phone_number = phone_number.replace(/\s+/g, "");
            return this.optional(element) || phone_number.length > 9 &&
                phone_number.match(/^((\+92)|(0092))-{0,1}\d{3}-{0,1}\d{7}$|^\d{11}$|^\d{4}-\d{7}$/);
        }, "Please specify a valid phone number with+92");
        $.validator.addMethod("digitsonly", function (value, element) {
            return this.optional(element) || /^[0-9]+$/i.test(value);
        }, "Numbers only please");
        $.validator.addMethod("pwcheck", function (value) {
            return /^[A-Za-z0-9\d=!\-@._*]*$/.test(value) // consists of only these
                && /[a-z]/.test(value) // has a lowercase letter
                && /\d/.test(value) // has a digit
        }, "please only Lowercase and must have digits ");
        $.validator.addMethod("imageonly", function (value, element) {
            return this.optional(element) || /^([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$/.test(value);
        }, ".jpeg ,.png, .gif format allow only ");


        function validation() {

            $("#form1").validate({

                rules: {
                      <%=txtTitle.UniqueID%>:{
                          required:true,
                          lettersonly:true,
                          minlength: 10,
                          maxlength: 30

                      },
                       <%=txtDescription.UniqueID%>:{
                           required:true,
                           maxlength: 50
                       }

                },

                messages: {
                     <%=txtTitle.UniqueID%>:{
                         required:"Please mention job Title",
                         minlength: "Must be 10 letters long ",
                         maxlength: "Cannot exceed more then 50"
                         
                     },
                      <%=txtDescription.UniqueID%>:{
                          required:"Please write breif Description",
                          maxlength: "Cannot exceed more then 50"
                          
                      },

                }

            });



        }



    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">  
    <link href="assets/css/mycss.css" rel="stylesheet" />
    <style>
        
         label.error {

            color: red;
            display: inline-flexbox;
            display:block;
           
        }
        input.error {
            border:1px solid red;
            float: none; color: red;
        padding-left: .3em; vertical-align: top;
        }
        </style>

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
