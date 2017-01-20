<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateSchoolInformation.aspx.cs" Inherits="FinalTemplate.UpdateSchoolInformation2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
     
   
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="assets/js/jquery.validate.js"></script>




    <script type="text/javascript">
        $(window).load(function () {
            searchboxwidth();
        });
        $(document).ready(function () {


            validation();

        });
        $(document).ready(function () {
            teacherwidth();

            rowbg();
            setbuttonlayout();
        });
        function SelectedDivAnimation(aspControl) {
            $(aspControl).on('focus', function () {
                $(this).css({ 'background-color': 'rgb(108, 208, 91)', 'transition': '2s', 'border-color': 'green', 'color': 'white', 'height': '40px' });
            });
            $(aspControl).on('focusout', function () {
                $(this).css({ 'background-color': 'white', 'transition': '2s', 'border-color': 'white', 'color': 'black', 'height': '30px' });
            });
        }

        function rowbg() {
            $('.table-row').css('background-color', '#fafafa');
            $('.heading-table').css('background-color', '#7d4646');
            $('span').css('color', 'black');
        }


        function setbuttonlayout() {
            $('#<%=btnSaveChanges.ClientID%>').mouseup(function () {
                $(this).css('border-color', 'teal');
            });
            $('#<%=btnSaveChanges.ClientID%>').mousedown(function () {
                $(this).css('border-color', 'salmon');
            });
        }
        function teacherwidth() {
            var path = "url(assets/images/cesThemeImages/searchTeacher.jpg)";
            $('.page-title').css({
                'background-image': path,
                'height': '450px'
            });
        }

        function searchboxwidth() {
            $('.form-input').css('width', '900px');
        }


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
                     <%=txtSchoolName.UniqueID%>:{
                         required:true,
                         lettersonly:true,
                     },
                    <%=txtOwnerName.UniqueID%>:{
                        required:true,
                        lettersonly:true,
                    },
                     <%=txtFoundedIn.UniqueID%>:{
                         required:true,
                        
                     },
                      <%=txtPostalCode.UniqueID%>:{
                          required: true,
                          digitsonly: true,
                          minlength: 5,
                          maxlength: 6
                        
                      },
                     <%=txtContactPrimary.UniqueID%>:{
                         required:true,
                         digitsonly: true
                        
                     },
                     <%=txtContactSecondary.UniqueID%>:{
                         required:true,
                         digitsonly: true
                        
                     },
                       <%=txtUsername.UniqueID%>:{
                           required: true,
                           lettersonly:true
                        
                       },
                      <%=txtAccountPin.UniqueID%>:{
                          required: true,
                          digitsonly: true
                        
                      },
                     <%=txtPrimaryEmail.UniqueID%>:{
                         required: true,
                         email: true
                        
                     },
                     <%=txtSecondaryEmail.UniqueID%>:{
                         required: true,
                         email: true
                        
                     },
                },

                messages: {

                     <%=txtSchoolName.UniqueID%>:{
                         required:"Please enter your School name"
                         
                     },
                    <%=txtOwnerName.UniqueID%>:{
                        required:"Please enter your name"
                    },
                      <%=txtPostalCode.UniqueID%>:{
                          minlength: "Postal code must contain 5 digits",
                          maxlength: "Postal code can't exceed more then 6 digits"
                        
                      },
                    <%=txtContactPrimary.UniqueID%>:{
                        required: "Please provide Primary contact number",
                        digitsonly: "Only digits"
                        
                    },
                     <%=txtContactSecondary.UniqueID%>:{
                         required: "Please provide Primary contact number",
                         digitsonly: "Only digits"
                        
                     },
                      <%=txtUsername.UniqueID%>:{
                          required: "Please enter Username"
                        
                      },
                     <%=txtAccountPin.UniqueID%>:{
                         digitsonly: "Only digits"
                        
                     },
                      <%=txtPrimaryEmail.UniqueID%>:{
                          required: "Please enter your an email"
                        
                      },
                     <%=txtSecondaryEmail.UniqueID%>:{
                         required: "Please enter your an email"
                        
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

     <div class="section section-padding top-courses">
        <div class="container">
            <div class="group-title-index">
                <h2 class="center-title">Update School Information</h2>
                <div class="bottom-title"><i class="bottom-icon icon-icon-04"></i></div>
                <div class="container teacher-course-wrapper">
                    <div class="inner-container">
                        <div class="table-header">
                            <table class="edu-table-responsive">
                                <thead>
                                    <tr class="heading-table">
                                        <th class="col-3">School Information</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row">
                                        <td class="col-3"><span>School Name</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtSchoolName" CssClass="form-control" ></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Owner Name</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtOwnerName" CssClass="form-control" ></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Founded In</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtFoundedIn"   CssClass="form-control" placeholder="mm/dd/yyyy"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>City</span></td>
                                        <td class="col-2"><asp:DropDownList  AutoPostBack="true" ViewStateMode="Enabled" EnableViewState="true" runat="server"  CssClass="form-control" ID="ddlCity" /></td>
                                        <td class="col-3"><input type="hidden" id="hiddenlocationid" value="0" runat="server"/></td>
                                    </tr>
                                    
                                    <tr class="table-row">
                                        <td class="col-3"><span>Country</span></td>
                                        <td class="col-2"><asp:DropDownList  runat="server" CssClass="form-control"  ID="ddlCountry"/></td>
                                        <td class="col-3"></td>
                                    </tr>

                                    <tr class="table-row">
                                        <td class="col-3"><span>PostalCode</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtPostalCode" CssClass="form-control" ></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>School Type</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtSchoolTpe" CssClass="form-control" ReadOnly="True"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Contact Primary</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtContactPrimary" CssClass="form-control" ></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Contact Secondary</span></td>
                                        <td class="col-2"><asp:TextBox runat="server"  CssClass="form-control" ID="txtContactSecondary"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="inner-container">
                        <div class="table-header">
                            <table class="edu-table-responsive">
                                <thead>
                                    <tr class="heading-table">
                                        <th class="col-3">Authentication Information</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Username</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" CssClass="form-control"  ID="txtUsername"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                     <tr class="table-row">
                                        <td class="col-3"><span>Account Pin</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtAccountPin" CssClass="form-control" ></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                     <tr class="table-row">
                                        <td class="col-3"><span>Primary Email Address</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtPrimaryEmail"  CssClass="form-control" TextMode="Email"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                     <tr class="table-row">
                                        <td class="col-3"><span>Secondary Email Address</span></td>
                                        <td class="col-2"><asp:TextBox CssClass="form-control"  runat="server" ID="txtSecondaryEmail"  TextMode="Email"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Login Count</span></td>
                                        <td class="col-2"><asp:TextBox CssClass="form-control" ReadOnly="True" runat="server" ID="txtLoginCount"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>

                                    <tr class="table-row">
                                        <td class="col-3"><span>Last Login Date</span></td>
                                        <td class="col-2"><asp:TextBox CssClass="form-control" runat="server" ReadOnly="True" ID="txtlastLoginDate"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                   <tr class="table-row">
                                        <td class="col-3"></td>
                                        <td class="col-3"><span>
                                            <asp:Button ID="btnSaveChanges" Text="Update Information" CssClass="form-control" runat="server" ForeColor="Black" OnClick="btnSaveChanges_Click" /></span></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                     
                </div>
            </div>

        </div>
    </div>
</asp:Content>
