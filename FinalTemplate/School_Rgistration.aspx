<%@ Page Title="" Language="C#" MasterPageFile="~/Register.Master" AutoEventWireup="true" CodeBehind="School_Rgistration.aspx.cs" Inherits="FinalTemplate.School_Rgistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="RegisterHeadPlaceHolder" runat="server">
     <script src="assets/js/jquery-2.2.3.js"></script>
     <script type="text/javascript">
         $(document).ready(function () {
             $('#submitbutton').addClass('submitbutton');
             $('#RegistrationSchoolWidthFix').css('width', '70%');
             SetTextFont();
             RemoveSelectedPackage();
             ActivePackage();
             PaddingTOButtion();
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
                 var currentPricing = $(this).parent().parent().addClass('active');
             });
         }
         function PriceHover() {
             $('.pricing-content').hover(function () { $(this).css('background-color', '#D2542A'); }, function () { $(this).css('background-color', '#EAEDF5'); });
         }
         function PaddingTOButtion(){
             $('.register-submit').css('padding-top','200px');
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
                                <img src="assets/images/registerschool_green.jpg" height="300px" width="100%" />
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
                                                        <p><strong>One day</strong> trial</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Limited</strong> courses</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Free</strong> 3 lessons</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>No</strong> supporter</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>No</strong> ebook</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>No</strong> tutorial</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Limited</strong> registered user</p>
                                                    </li>
                                                </ul>
                                                <div class="pricing-button">choose plan</div>
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
                                                        <p><strong>One year</strong> standard access</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Limited</strong> courses</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>300+</strong> lessons</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Random</strong> supporter</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>View only</strong> ebook</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Standard</strong> tutorials</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Unlimited</strong> registered user</p>
                                                    </li>
                                                </ul>
                                                <div class="pricing-button">choose plan</div>
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
                                                        <p><strong>Life time</strong> access</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Unlimited</strong> All courses</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>3000+</strong> lessons & growing</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Free</strong> supporter</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Free</strong> Ebook Downloads</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Premium</strong> tutorials</p>
                                                    </li>
                                                    <li>
                                                        <p><strong>Unlimited</strong> registered user</p>
                                                    </li>
                                                </ul>
                                                <div class="pricing-button">choose plan</div>
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

                                        <asp:TextBox ID="TextBox1" CssClass="form-control  form-input" runat="server"></asp:TextBox>
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
                                    
                                    <div id="submitbutton" class="register-submit">
                                        <div class="btn btn-register  btn-green">
                                            <span>
                                                <asp:Button ID="btn_goto_summary" runat="server" Text="Next" Style="background-color: transparent" BorderStyle="None" OnClick="btn_goto_summary_Click" />
                                            </span>
                                        </div>
                                    </div>
                                      
                                </div>
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>          
            </div>
        </div>
</asp:Content>
