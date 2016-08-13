<%@ Page Title="" Language="C#" MasterPageFile="~/Register.Master" AutoEventWireup="true" CodeBehind="School_Rgistration.aspx.cs" Inherits="FinalTemplate.School_Rgistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="RegisterHeadPlaceHolder" runat="server">
    
     <script src="assets/js/jquery.validate.js"></script>
     <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
     <script type="text/javascript">
         $(document).ready(function () {
             $('#submitbutton').addClass('submitbutton');
             $('#RegistrationSchoolWidthFix').css({ 'width':'70%','opacity':'0.95' });
             SetTextFont();
             RemoveSelectedPackage();
             ActivePackage();             
             AspButton();
             Validate();
             
         });
          function SetTextFont() {
             $('.inner').find('.inner-number').removeClass('inner-number').addClass('innerNumber');
         }
         function RemoveSelectedPackage() {
             $('div').find('.active').removeClass('active');
         }
         function ActivePackage() {
             $('.pricing-button').click(function () {  
                 $('.active').removeClass("active");
                 var pricingwidget = $(this).parent().parent();
                 pricingwidget.addClass("active");
                 if (pricingwidget.hasClass("active")) {                     
                     var pricingwrapper = pricingwidget.parent().parent();
                     var silver = pricingwrapper.children().eq(0).children().eq(0).children().eq(1);
                     var gold = pricingwrapper.children().eq(1).children().eq(0).children().eq(1);
                     var platinum = pricingwrapper.children().eq(2).children().eq(0).children().eq(1);
                     var packagename = $(this).siblings(0).html();
                     if (packagename == 'Silver') {
                         silver.css('background-color', '#C0C0C0');
                         gold.css('background-color', '');
                         platinum.css('background-color', '');
                     } else if (packagename == 'Gold') {
                         silver.css('background-color', '');
                         gold.css('background-color', '#CFB53B');
                         platinum.css('background-color', '');
                     } else if (packagename == 'Platinum') {
                         gold.css('background-color', '');
                         silver.css('background-color', '');
                         platinum.css('background-color', '#E5DEDE');
                     }
                 }                 
             });
         }
         function PriceHover() {
             $('.pricing-content').hover(function () { $(this).css('background-color', '#D2542A'); }, function () { $(this).css('background-color', '#EAEDF5'); });
         }
         function TitleImageHover() {

         }
         function AspButton() {
             $('#<%= btn_submit.ClientID%>').addClass('btn btn-register  btn-green');
             $('.btn').css('width', 'auto');
         }
         
         function Validate() {
             $.validator.addMethod("phone", function (phone_number, element) {
                 phone_number = phone_number.replace(/\s+/g, "");
                 return this.optional(element) || phone_number.length > 9 &&
                     phone_number.match(/^((\+92)|(0092))-{0,1}\d{3}-{0,1}\d{7}$|^\d{11}$|^\d{4}-\d{7}$/);
             }, "Please specify a valid phone number with+92");
             $.validator.addMethod( "lettersonly", function( value, element ) {
                 return this.optional( element ) || /^[a-z\s]+$/i.test( value );
             }, "Letters only please" );
             $.validator.addMethod( "digitsonly", function( value, element ) {
                 return this.optional( element ) || /^[0-9]+$/i.test( value );
             }, "Numbers only please" );
             $.validator.addMethod("email", function(value, element) {
                 return this.optional(element) || /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value);
             }, "Please enter a valid email address.");
             //$.validator.addMethod( "date", function( value, element ) {
             //    return this.optional( element ) || /\b\d{1,2}[\/-]\d{1,2}[\/-]\d{4}\b/.test( value );
             //}, "Numbers only please" );
             $.validator.addMethod( "imageonly", function( value, element ) {
                 return this.optional( element ) || /^([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$/.test( value );
             }, ".jpeg ,.png, .gif format allow only " );  
             $.validator.addMethod("pwcheck", function(value) {
                 return /^[A-Za-z0-9\d=!\-@._*]*$/.test(value) // consists of only these
                     && /[a-z]/.test(value) // has a lowercase letter
                     && /\d/.test(value) // has a digit
             },"please only Lowercase and must have digits ");
         
        
          
           
                 $('#form1').validate({

                     //errorPlacement: function(error, element) {
                     //    element.attr("placeholder", error.text());
                     //},
                     rules: {
                         <%=txt_schoolName.UniqueID%>:{
                             lettersonly:true,
                             required:true,
                             minlength:6,
                             maxlength:20                         
                         },
                         <%=txt_ownername.UniqueID%>:{
                             lettersonly:true,
                             required: true,
                             minlength:3,
                             maxlength:20                         
                         },
                         <%=txt_campusname.UniqueID%>:{
                             required:true
                         },
                        
                         <%=txt_address.UniqueID%>:{
                             required:true
                         },

                         <%=txt_postalcode.UniqueID%>:{
                             required:true,
                             digitsonly:true,
                             minlength:5
                       
                         },
                         <%=txt_username.UniqueID%>:{
                             required:true
                         },
                         <%=txt_accountPin.UniqueID%>:{
                             required:true,
                             digitsonly:true,
                             minlength:6,
                             maxlength:10
                         },
                         <%=txt_password.UniqueID%>: {
                             required:true,
                             pwcheck:true
                         },

                         <%=txt_confirmPassword.UniqueID%>:{
                             required:true,
                           
                         
                         },
                         <%=txt_primaryEmailAddress.UniqueID%>:{
                             required:true,
                             email:true
                        
                         },
                         <%=txt_secondaryEmailAddress.UniqueID%>:{
                             required:true,
                             email:true

                         },
                         <%=txt_foundedIn.UniqueID%>:{
                             required:true,
                             
                         },
                           <%=fileupload.UniqueID%>:{
                               required:true,
                               imageonly:true
                           }


                     },
                     messages:{
                         <%=txt_schoolName.UniqueID%>:{
                             required:"Please Enter School name",
                             minlength:"School name must be 6 characters long",
                             maxlength:"School name can not exceed 20 characters in length"
                         },
                         <%=txt_ownername.UniqueID%>:{
                             required:"Please enter Owner's name"
                         },
                         
                         <%=txt_accountPin.UniqueID%>:{
                             minlength:"Pin must contain 6 digits",
                             maxlength:"Pin cannot exceed 10 digits"    
                     
                         },
                         <%=txt_password.UniqueID%>:{
                             required: "What is your password?"  
                         },
                           <%=fileupload.UniqueID%>:{
                               required:"Please upload your photo"    
                           },
                         <%=txt_confirmPassword.UniqueID%>:{
                             required: "You must confirm your password",
                         
                         },
                         <%=txt_primaryEmailAddress.UniqueID%>:{
                     
                             required: "Please enter your an email.",
                       

                         },
                          <%=txt_postalcode.UniqueID%>:{
                            minlength:"Postal code must contain 5 digits"
                          },
                         <%=txt_secondaryEmailAddress.UniqueID%>:{
                             required:"Please enter your an email",
                         },
                       <%--  <%=txt_foundedIn.UniqueID%>:{
                             date:"Please fill the date in pattern  mm/dd/yyyy or mm-dd-yyyy"
                         }--%>
                     }
                 });
             }
         
    </script>
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="RegisterPlaceHolder1" runat="server">
    <style>
        .reg-sk {
            padding-top:26px;
            padding-bottom:26px;
        }
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
      
         <div class="page-register rlp">
        <div class="container">
            <div id="RegistrationSchoolWidthFix" class="register-wrapper rlp-wrapper reg-sk ">
                
                    <div class="register-table rlp-table">
                    <!-- PRICING-->
                    <div class="section pricing">
                        <div class="container">
                            <div class="group-title-index">
                                <h2 class="center-title">Centralized Education System</h2>
                                <h4 class="top-title">We offer pakistan's best online education support</h4>
                                <div class="tilt pic">
                                   <img src="assets/images/registerschool_green.jpg" height="300px" width="100%" />
                                </div>
                                <p class="pGreen">As we are witnessing the age of new technology it is now a fact that everyone is using it for his/her betterment. So CES gives you a chance to contribute in the betterment of education in pakistan by CENTRALIZING your education system and follow new rules that are more easly and very effective.</p>
                                <p class="pGreen">CES offers different packages amoung you can choose and select the best which fits your requirements.</p>
                            </div>
                            <div class="group-title-index">
                                <h2 class="center-title">Choose the desired one</h2>                                
                            </div>
                            <div class="row">
                                <div class="pricing-wrapper">
                                    <div class="col-sm-4">
                                        <div class="pricing-widget">
                                            <div class="pricing-header">
                                                <div class="price-cost">
                                                    <div class="inner">
                                                        <p data-from="0" data-to="0" data-speed="1000" class="inner-number">$57.24</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pricing-content">
                                                <h3 class="pricing-title">Silver</h3>
                                                <p class="pricing-subtitle">The most basic package</p>
                                                <ul class="pricing-list">
                                                    <li>
                                                        <p><strong>Online Admissions</strong> | Yes</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Post job vacancies</strong> | No</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Emails</strong> | 700</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Email Accounts</strong> | 5</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Notifications Via</strong> | Email</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Events</strong> | 3</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>School Rating</strong> | Yes</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Comparison of schools</strong> | 5x</p>
                                                    </li>                                                    
                                                    <li>
                                                        <p><strong>Data Filters</strong> | No</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Admin Panel</strong> | Basic</p>
                                                    </li>
                                                </ul>
                                                <div class="pricing-button">choose plan</div>
                                                <div class="ViewAll"><a href="assets/cesFiles/Packages.pdf" target="_blank">View Full Package</a></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="pricing-widget main active ">
                                            <div class="pricing-header">
                                                <div class="price-cost">
                                                    <div class="inner">
                                                        <p data-from="0" data-to="35" data-speed="1000" class="inner-number">$95.41</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pricing-content">
                                                <h3 class="pricing-title">Gold</h3>

                                                <p class="pricing-subtitle">Most likely and affordable. Fits all requirements</p>
                                                    <ul class="pricing-list">
                                                    <li>
                                                        <p><strong>Online Admissions</strong> | Yes</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Post job vacancies</strong> | Yes</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Emails</strong> | 1500</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Email Accounts</strong> | 8</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Notifications</strong> | Email/SMS</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Events</strong> | 8</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>School Rating</strong> | Yes</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Comparison of schools</strong> | 15x</p>
                                                    </li>                                                   
                                                    <li>
                                                        <p><strong>Data Filters</strong> | Basic</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Admin Panel</strong> | Medium</p>
                                                    </li>
                                                </ul>
                                                <div class="pricing-button">choose plan</div>
                                                <div class="ViewAll"><a href="assets/cesFiles/Packages.pdf" target="_blank">View Full Package</a></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="pricing-widget">
                                            <div class="pricing-header">
                                                <div class="price-cost">
                                                    <div class="inner">
                                                        <p data-from="0" data-to="89" data-speed="1000" class="inner-number">$162.19</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pricing-content">
                                                <h3 class="pricing-title">Platinum</h3>

                                                <p class="pricing-subtitle">Best of all. A wise desicion to select this one </p>
                                                    <ul class="pricing-list">
                                                    <li>
                                                        <p><strong>Online Admissions</strong> | Yes</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Post job vacancies</strong> | Yes</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Emails</strong> | Unlimited</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Email Accounts</strong> | 12</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Notifications</strong> | Email/SMS</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Events</strong> | Unlimited</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>School Rating</strong> | Yes</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Comparison of schools</strong> | 20x</p>
                                                    </li>                                                  
                                                    <li>
                                                        <p><strong>Data Filters</strong> | Advanced</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Admin Panel</strong> | Advanced</p>
                                                    </li>
                                                </ul>
                                                <div class="pricing-button">choose plan</div>
                                                <div class="ViewAll"><a href="assets/cesFiles/Packages.pdf" target="_blank">View Full Package</a></div>
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
                                <h2 class="center-title">Please give us information about your school</h2>                                                            
                            </div>
                            <div class="row">
                                <div class="pricing-wrapper">
                                    <div class="col-md-6">

                                        <label for="regname" class="control-label form-label">
                                            School Name <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!--p.help-block Warning !-->
                                        <br />

                                        <asp:TextBox ID="txt_schoolName" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                    </div>
                                     <div class="col-md-6">

                                        <label for="regname" class="control-label form-label">
                                            School Type <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!--p.help-block Warning !-->
                                        <br />
                                        <asp:DropDownList CssClass="form-control  form-input" ID="ddl_schooltype" runat="server">
                                            <asp:listitem>A-Level</asp:listitem>
                                            <asp:listitem>O-Level</asp:listitem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Owner's Name <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="txt_ownername" CssClass="form-control  form-input " runat="server"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Campus name  <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="txt_campusname" CausesValidation="true" CssClass="form-control  form-input" runat="server"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6">
                                        
                                        <label for="regname" class="control-label form-label">
                                            Founded In <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        
                                        <br />
                                                                                       
                                                <asp:TextBox ID="txt_foundedIn" type="date"  runat="server" CssClass="form-control  form-input"></asp:TextBox>
                                                
                                            
                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Logo<span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:FileUpload  ID="fileupload" runat="server"  CssClass="form-control  form-input"/>

                                    </div>
                                  
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Address <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="txt_address" CssClass="form-control  form-input" runat="server"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            postal Code <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="txt_postalcode" CssClass="form-control  form-input" runat="server"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            City <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:DropDownList ID="ddl_city" CssClass="form-control  form-input" placeholder="----Select----" runat="server">
                                            

                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Country  <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="txt_country" CssClass="form-control  form-input" runat="server" Text="Pakistan"></asp:TextBox>

                                    </div>
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
                                        <!--p.help-block Warning !-->
                                        <br />

                                        <asp:TextBox ID="txt_username" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Account Pin<span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="txt_accountPin" CssClass="form-control  form-input" runat="server"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Password<span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="txt_password" CssClass="form-control  form-input " TextMode="Password" runat="server"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Confirm Password<span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="txt_confirmPassword" CausesValidation="true" TextMode="Password" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                          <asp:CompareValidator ID="CompareValidator1" ControlToCompare="txt_password" ControlToValidate="txt_confirmPassword" CssClass=" input.error" ForeColor="#ff0000" ErrorMessage="Your password does not match" runat="server" Display="Dynamic"></asp:CompareValidator>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Primary Email Address <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="txt_primaryEmailAddress" CssClass="form-control  form-input" runat="server"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Secondary Email Address<span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="txt_secondaryEmailAddress" CssClass="form-control  form-input" runat="server"></asp:TextBox>

                                    </div>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div id="submitbutton" class="register-submit">

                        <asp:Button ID="btn_submit" runat="server" Text="Submit Order" OnClick="btn_submit_Click" />

                    </div>
                </div>
               
                
            </div>          
            </div>
        </div>
      
</asp:Content>
