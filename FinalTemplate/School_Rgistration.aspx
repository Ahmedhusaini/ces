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
                 $(this).parent().parent().addClass('active');
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
                    <asp:MultiView ID="MultiviewRegisterSchool" runat="server">
                        <asp:View ID="ViewPackages" runat="server">
                             <!-- PRICING-->
                             <div class="section section-padding pricing">
                                <div class="container">
                                    <div class="group-title-index">
                                        <h4 class="top-title">chooses your pricing</h4>
                                        <h2 class="center-title">the best pricing we offered</h2>
                                        <div class="bottom-title"><i class="bottom-icon icon-a-1-01-01"></i></div>
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
                                                        <h3 class="pricing-title">trial</h3>

                                                        <p class="pricing-subtitle">30 days free trial</p>
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
                                                        <div class="pricing-button"><a href="#">choose plan</a></div>
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
                                                        <h3 class="pricing-title">Standard</h3>

                                                        <p class="pricing-subtitle">per month when paid annually</p>
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
                                                        <div class="pricing-button"><a href="#">choose plan</a></div>
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
                                                        <h3 class="pricing-title">Premiere</h3>

                                                        <p class="pricing-subtitle">per month when paid annually</p>
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
                                                        <div class="pricing-button"><a href="#">choose plan</a></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="group-btn-slider">
                                        <div class="btn-prev"><i class="fa fa-angle-left"></i></div>
                                        <div class="btn-next"><i class="fa fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </asp:View>
                        <asp:View ID="ViewSchoolDetails" runat="server">
                             <h3>School Details</h3>
                             <asp:Panel ID="Panel1" runat="server">


                        <div class="register-form bg-w-form rlp-form">
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
                            <br />

                            <h4>Upload a Logo :</h4>
                            <asp:FileUpload ID="FileUpload2" runat="server" />

                            <br />
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
                                <asp:TextBox ID="country" CssClass="form-control  form-input" Width="200px" runat="server" Text="Pakistan"></asp:TextBox>

                            </div>


                        </div>

                    </asp:Panel>
                        </asp:View>
                        <asp:View ID="ViewRegistrationDetails" runat="server">
                             <h3>Registration Details</h3>
                             <asp:Panel ID="Panel2" runat="server">
                        <div class="register-form bg-w-form rlp-form">
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
                                    Account Pin<span class="highlight">*<br />
                                    </span>
                                </label>
                                <!-- p.help-block Warning !-->
                                <br />
                                <asp:TextBox ID="txt_accountPin" CssClass="form-control  form-input" runat="server"></asp:TextBox>

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
                                <button type="submit" onclick="window.location.href='index.html'" class="btn btn-register btn-green">
                                    <span>
                                        <asp:Button ID="Button1" runat="server" Text="Submit" Style="background-color: transparent" BorderStyle="None" /></span></button>
                            </div>
                    </asp:Panel>
                        </asp:View>                                               
                    </asp:MultiView>
                </div>
            </div>          
            </div>
        </div>
</asp:Content>
