<%@ Page Title="" Language="C#" MasterPageFile="~/Register.Master" AutoEventWireup="true" CodeBehind="StudentRgistration.aspx.cs" Inherits="FinalTemplate.StudentRgistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="RegisterHeadPlaceHolder" runat="server">
    <script src="assets/js/jquery-2.2.3.js"></script>
    <script src="assets/js/jquery.validate.js"></script>
    <script type="text/javascript">      
        $.validator.addMethod("lettersonly", function (value, element) {
            return this.optional(element) || /^[a-z\s]+$/i.test(value);
        }, "Letters only please");
        $.validator.addMethod("phone", function (phone_number, element) {
            phone_number = phone_number.replace(/\s+/g, "");
            return this.optional(element) || phone_number.length > 9 &&
                phone_number.match(/^((\+92)|(0092))-{0,1}\d{3}-{0,1}\d{7}$|^\d{11}$|^\d{4}-\d{7}$/);
        }, "Please specify a valid phone number with+92");
        $.validator.addMethod( "digitsonly", function( value, element ) {
            return this.optional( element ) || /^[0-9]+$/i.test( value );
        }, "Numbers only please" );
        $(document).ready(function () {
            $.validator.addMethod( "romanonly", function( value, element ) {
                return this.optional( element ) || /^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/g.test( value );
            }, "Please type in Roman ( I,II,IX,X ) " ); 
            $.validator.addMethod( "imageonly", function( value, element ) {
                return this.optional( element ) || /^([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$/.test( value );
            }, ".jpeg ,.png, .gif format allow only " );  
            $.validator.addMethod("pwcheck", function(value) {
                return /^[A-Za-z0-9\d=!\-@._*]*$/.test(value) // consists of only these
                    && /[a-z]/.test(value) // has a lowercase letter
                    && /\d/.test(value) // has a digit
            },"please only Lowercase and must have digits ");
          
            $("#form1").validate({
                   
                rules: {
                    <%=name.UniqueID%>:{
                        required: true,
                        lettersonly: true
                    },
                    <%=lname.UniqueID%>:{
                           required:true,
                           lettersonly:true
                       },
                    <%=contact1.UniqueID%>:{
                           required:true,
                           phone:true
                       },
                   
                     
                    <%=contact2.UniqueID%>:{
                           required:true,
                           phone:true
                       },
                    <%=radiobut.UniqueID%>:{
                           required:true
                         
                       },
                    <%=guardian.UniqueID%>:{
                           required:true,
                           lettersonly:true

                       },

                    <%=nation.UniqueID%>:{
                           required:true,
                           lettersonly:true
                       },
                    <%=religion.UniqueID%>:{
                           required:true,
                           lettersonly:true,
                           maxlength:8
                       },
                    <%=address.UniqueID%>:{
                           required:true

                       },
                    <%=postal.UniqueID%>:{
                           required:true,
                           digitsonly:true,
                           minlength:5,
                           maxlength:6
                       },
                    <%=user.UniqueID%>:{
                           required:true
                       
                       },
                    <%=accountp.UniqueID%>:{
                           required:true,
                           digitsonly:true
                       },
                    <%=sname.UniqueID%>:{
                              required:true,
                              lettersonly:true
                          },
                       <%=pass.UniqueID%>:{
                         required:true,
                         pwcheck:true

                        },
                       
                    <%=repass.UniqueID%>:{
                           required:true,
                         
                           
                       },
                       <%=emaill.UniqueID%>:{
                           required:true,
                           email:true
                       },
                    <%=pemail.UniqueID%>:{
                           required:true,
                           email:true
                       },
                    <%=semail.UniqueID%>:{
                           required:true,
                           email:true
                       },
                    <%=prevchool.UniqueID%>:{
                           required:true,
                           lettersonly:true
                       },
                    <%=preclass.UniqueID%>:{
                           required:true, 
                           romanonly:true
                       },
                    <%=classtxt.UniqueID%>:{
                           required:true,
                           romanonly:true
                       
                       },
                    <%=section.UniqueID%>:{
                           required:true,
                           minlength:1,
                           maxlength:2
                       },
                    <%=Dropd.UniqueID%>:{
                           required:true,
                       },
                    <%=fileupload.UniqueID%>:{
                           required:true,
                           imageonly:true
                       },
                    <%=dob.UniqueID%>: {
                        required:true
                       
                    }
                },

                messages: {
                    <%=name.UniqueID%>: {
                           required: "Please enter your name"

                       },
                       <%=lname.UniqueID%>:{
                           required:"Please enter your last name"
                       },
                       <%=guardian.UniqueID%>:{
                           required:"Please mention your guardian name"
                       },
                       <%=sname.UniqueID%>:{
                           required:"Please mention your full name"
                       },
                       <%=classtxt.UniqueID%>:{
                           required:"Please mention your current Class"
                       },
                       <%=section.UniqueID%>:{
                           required:"Please mention your current Section",
                           minlenght:"minimum 1 character or maximum 2",
                           maxlength:"minimum 1 character or maximum 2"
                        
                       },
                       <%=fileupload.UniqueID%>:{
                           required:"Please upload your photo"    
                       },
                       <%=Dropd.UniqueID%>:{
                           required:"Selection is required"
                       },
                         
                       <%=contact2.UniqueID%>:{
                           required:"Provide  contact number",
                           digitsonly:"Only digits"
                       },
                       <%=radiobut.UniqueID%>:{
                           required:"Please select your Gender"
                       },
                       <%=nation.UniqueID%>:{
                           required:"What's your nationality ?"
                       },
                       <%=religion.UniqueID%>:{
                           required:"What's your religion ?",
                           maxlength:"Can't exceed more then 8 character"
                       },
                       <%=address.UniqueID%>:{
                           required:"Please enter your Home address"
                       },
                       <%=postal.UniqueID%>:   {
                           minlength:"Postal code must contain 5 digits",
                           maxlength:"Postal code can't exceed more then 6 digits"
                       },
                       <%=prevchool.UniqueID%>:{
                           required:"Please mention your previous school name"
                       },
                       <%=preclass.UniqueID%>:{
                           required:"Please mention last class attended"
                       },
                        <%=pass.UniqueID%>:{
                             required:"What is your password ?"

                         },
                     <%=repass.UniqueID%>:{
                             required:"You must confirm your password",
                         
                         },
                       <%=emaill.UniqueID%>:{
                           required:"Please enter your an email"
                       },
                       <%=pemail.UniqueID%>:{
                           required:"Please enter your an email"
                       },
                       <%=semail.UniqueID%>:{
                           required:"Please enter your an email"
                       },
                       <%=dob.UniqueID%>: {
                           required:"Please mention your correct Date of Birth"
                       
                       }
                        
                   }
            });
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RegisterPlaceHolder1" runat="server">

    <link href="assets/css/mycss.css" rel="stylesheet" />
    <style>
        .reg-sk {
            padding-top: 26px;
            padding-bottom: 26px;
        }

        label.error {
            color: red;
            display: inline-flexbox;
            display: block;
        }

        input.error {
            border: 1px solid red;
            float: none;
            color: red;
            padding-left: .3em;
            vertical-align: top;
        }
    </style>
    <div class="page-register rlp">
        <div class="container">
            <div id="RegistrationSchoolWidthFix" class="register-wrapper rlp-wrapper reg-sk ">

                <div class="register-table rlp-table">
                    <!-- PRICING-->
                    <div class="section pricing">
                        <div class="container">
                            <div class="row">
                                <div class="pricing-wrapper">
                                    <div class="col-sm-4">
                                        <div class="pricing-widget">
                                            <div class="pricing-header">
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="pricing-widget main active ">
                                            <div class="pricing-header">
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="pricing-widget">
                                            <div class="pricing-header">
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="section pricing">
                        <div class="container">
                            <div class="group-title-index">
                                <br />
                                <h2 class="center-title">Student Detail's</h2>
                            </div>
                            <div class="row">
                                <div class="pricing-wrapper">
                                    <div class="col-md-6">

                                        <label for="regname" class="control-label form-label">
                                            NAME <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!--p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="name" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Last Name <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="lname" CssClass="form-control  form-input " runat="server" OnTextChanged="lname_TextChanged"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Email <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="emaill" CausesValidation="true" CssClass="form-control  form-input" runat="server"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Contact No <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="contact1" CssClass="form-control  form-input" runat="server"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Guardian Name <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="guardian" CssClass="form-control  form-input" runat="server"></asp:TextBox>


                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Guardian Contact No <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="contact2" CssClass="form-control  form-input" runat="server"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Gender <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <br />
                                        <!-- p.help-block Warning !-->
                                        <%--&nbsp; &nbsp;&nbsp;    <asp:RadioButton ID="RadioButton1" runat="server" Text="Male" />
                                        &nbsp;&nbsp;   <asp:RadioButton ID="RadioButton2" runat="server" Text="Female" />--%>
                                        <asp:RadioButtonList ID="radiobut" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Text="Male &nbsp &nbsp " Value="Male"></asp:ListItem>
                                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                        </asp:RadioButtonList>

                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Date of birth <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="dob" CssClass="form-control  form-input" type="date" runat="server"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Nationality <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="nation" CssClass="form-control  form-input" runat="server"></asp:TextBox>


                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Religion <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="religion" CssClass="form-control  form-input" runat="server"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            City <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:DropDownList ID="DropDownList2" CssClass="form-control  form-input" placeholder="----Select----" runat="server">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem>Karachi</asp:ListItem>
                                            <asp:ListItem>Lahore</asp:ListItem>
                                            <asp:ListItem>Peshawar</asp:ListItem>
                                            <asp:ListItem>Islamabad</asp:ListItem>
                                            <asp:ListItem>Quetta</asp:ListItem>
                                            <asp:ListItem>Hyderabad</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Country  <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="country" CssClass="form-control  form-input" runat="server" Text="Pakistan"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Address <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="address" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            postal Code <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="postal" CssClass="form-control  form-input" runat="server"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Previous School <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="prevchool" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Class last Attend <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="preclass" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                    </div>
                                    <br />
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Upload an Image<span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:FileUpload ID="fileupload" runat="server" CssClass="form-control  form-input" />

                                    </div>
                                </div>
                            </div>


                            <h3 class="center-title">School Detail's</h3>

                            <div class="col-md-6">
                                <label for="regname" class="control-label form-label">
                                    School Name <span class="highlight">*<br />
                                    </span>
                                </label>
                                <!-- p.help-block Warning !-->
                                <br />
                                <asp:TextBox ID="sname" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6">

                                <label for="regname" class="control-label form-label">
                                    Primary / Secondary <span class="highlight">*<br />
                                    </span>
                                </label>
                                <!-- p.help-block Warning !-->
                                <br />

                                <asp:DropDownList ID="Dropd" CssClass="form-control  form-input" placeholder="----Select----" runat="server">

                                    <asp:ListItem>Primary</asp:ListItem>
                                    <asp:ListItem>Secondary</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="col-md-6">
                                <label for="regname" class="control-label form-label">
                                    Class <span class="highlight">*<br />
                                    </span>
                                </label>
                                <!-- p.help-block Warning !-->
                                <br />
                                <asp:TextBox ID="classtxt" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                            </div>

                            <div class="col-md-6">
                                <label for="regname" class="control-label form-label">
                                    Section <span class="highlight">*<br />
                                    </span>
                                </label>
                                <!-- p.help-block Warning !-->
                                <br />
                                <asp:TextBox ID="section" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                            </div>
                            <div class="section pricing">
                                <div class="container">
                                    <div class="group-title-index">
                                    </div>
                                </div>

                            </div>
                        </div>


                        <div class="section pricing">
                            <div class="container">
                                <div class="group-title-index">
                                    <h2 class="center-title">we need your authentication details</h2>
                                </div>
                                <div class="row">
                                    <div class="pricing-wrapper">
                                        <div class="col-md-6">
                                            <label for="regname" class="control-label form-label">
                                                Username <span class="highlight">*<br />
                                                </span>
                                            </label>
                                            <!-- p.help-block Warning !-->
                                            <br />
                                            <asp:TextBox ID="user" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="regname" class="control-label form-label">
                                                Acccount pin <span class="highlight">*<br />
                                                </span>
                                            </label>
                                            <!-- p.help-block Warning !-->
                                            <br />
                                            <asp:TextBox ID="accountp" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="regname" class="control-label form-label">
                                                Password <span class="highlight">*<br />
                                                </span>
                                            </label>
                                            <!-- p.help-block Warning !-->
                                            <br />
                                            <asp:TextBox ID="pass" CssClass="form-control  form-input" TextMode="Password" runat="server"></asp:TextBox>
                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="pass" ErrorMessage="What's Your password?"></asp:RequiredFieldValidator>--%>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="regname" class="control-label form-label">
                                                Re-Password <span class="highlight">*<br />
                                                </span>
                                            </label>
                                            <!-- p.help-block Warning !-->
                                            <br />
                                            <asp:TextBox ID="repass" CssClass="form-control  form-input" TextMode="Password" runat="server"></asp:TextBox>
                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="repass" ErrorMessage="Retype your password"></asp:RequiredFieldValidator>--%>
                                            <asp:CompareValidator ID="CompareValidator1" ControlToCompare="pass" ControlToValidate="repass" CssClass=" input.error" ForeColor="#ff0000" ErrorMessage="Your password does not match" runat="server" Display="Dynamic"></asp:CompareValidator>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="regname" class="control-label form-label">
                                                Primary Email <span class="highlight">*<br />
                                                </span>
                                            </label>
                                            <!-- p.help-block Warning !-->
                                            <br />
                                            <asp:TextBox ID="pemail" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="regname" class="control-label form-label">
                                                Secondary Email <span class="highlight">*<br />
                                                </span>
                                            </label>
                                            <!-- p.help-block Warning !-->
                                            <br />
                                            <asp:TextBox ID="semail" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                        </div>


                                    </div>

                                </div>
                                <div class="register-submit">
                                    <button type="submit" class="btn btn-register btn-green">
                                        <span>
                                            <asp:Button ID="Button1" runat="server" Text="Submit" Style="background-color: transparent" BorderStyle="None" OnClick="Button1_Click" /></span></button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>


            </div>
        </div>
</asp:Content>
