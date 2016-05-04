<%@ Page Title="" Language="C#" MasterPageFile="~/Register.Master" AutoEventWireup="true" CodeBehind="School_Rgistration.aspx.cs" Inherits="FinalTemplate.School_Rgistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="RegisterHeadPlaceHolder" runat="server">
    
     <script src="assets/js/jquery.validate.js"></script>
     <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
     <script type="text/javascript">
         $(document).ready(function () {
             $('#submitbutton').addClass('submitbutton');
             $('#RegistrationSchoolWidthFix').css('width', '70%');
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
                 $('.active').removeClass('active');
                 var pricingwidget = $(this).parent().parent();
                 pricingwidget.addClass('active');
                 if (pricingwidget.hasClass('active')) {                     
                     var pricingwrapper = pricingwidget.parent().parent();
                     var silver = pricingwrapper.children().eq(0).children().eq(0).children().eq(1);
                     var gold = pricingwrapper.children().eq(1).children().eq(0).children().eq(1)
                     var platinum = pricingwrapper.children().eq(2).children().eq(0).children().eq(1)
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
             $('#<%= btn_goto_summary.ClientID%>').addClass('btn btn-register  btn-green');
             $('.btn').css('width', 'auto');
         }
         function Validate() {
             $('#form1').validate({
                 rules: {
                     <%=txt_schoolName.UniqueID%>:{
                         required:true,
                         minlength:5,
                         maxlength:20
                     }
                 }
             });
         }
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RegisterPlaceHolder1" runat="server">
    <style>
        .reg-sk {
            padding-top:26px;
            padding-bottom:26px;
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
                                            Owner's Name <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="name" CssClass="form-control  form-input " runat="server"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Campus name  <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="cname" CausesValidation="true" CssClass="form-control  form-input" runat="server"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Founded In <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="email" CssClass="form-control  form-input" runat="server"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Email <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="contact" CssClass="form-control  form-input" runat="server"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Contact No <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="contact2" CssClass="form-control  form-input" runat="server"></asp:TextBox>

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
                                            City <span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:DropDownList ID="DropDownList2" CssClass="form-control  form-input" placeholder="----Select----" runat="server">
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
                                        <asp:TextBox ID="txt_password" CssClass="form-control  form-input " runat="server"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6">
                                        <label for="regname" class="control-label form-label">
                                            Confirm Password<span class="highlight">*<br />
                                            </span>
                                        </label>
                                        <!-- p.help-block Warning !-->
                                        <br />
                                        <asp:TextBox ID="txt_confirmPassword" CausesValidation="true" CssClass="form-control  form-input" runat="server"></asp:TextBox>

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

                        <asp:Button ID="btn_goto_summary" runat="server" Text="Submit Order" OnClick="btn_goto_summary_Click" />

                    </div>
                </div>
               
                
            </div>          
            </div>
        </div>
      
</asp:Content>
