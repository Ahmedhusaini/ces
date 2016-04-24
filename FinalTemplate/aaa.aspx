<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aaa.aspx.cs" Inherits="FinalTemplate.aaa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
      <script src="assets/js/jquery-2.2.3.js"></script>
    <script src="assets/js/jquery.validate.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
    <script type="text/javascript">
        $.validator.addMethod("lettersonly", function (value, element) {
            return this.optional(element) || /^[a-z]+$/i.test(value);
        }, "Letters only please");
        $.validator.addMethod("phone", function (phone_number, element) {
            phone_number = phone_number.replace(/\s+/g, "");
            return this.optional(element) || phone_number.length > 9 &&
                phone_number.match(/^((\+92)|(0092))-{0,1}\d{3}-{0,1}\d{7}$|^\d{11}$|^\d{4}-\d{7}$/);
        }, "Please specify a valid phone number with+92");
        $(document).ready(function () {
            $('#form1').validate({
                rules: {
                    name: {
                        required: true,
                        lettersonly: true
                    },
                  
                },

                messages: {
                    name: {
                        required: "Please enter your name"

                    },
                  
                }
            });
        });

    </script> 

<head runat="server">
   <title>Edugate | Home</title>    
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>




    <!-- LIBRARY FONT-->
    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:400,400italic,700,900,300"/>
    <link type="text/css" rel="stylesheet" href="assets/font/font-icon/font-awesome-4.4.0/css/font-awesome.css"/>
    <link type="text/css" rel="stylesheet" href="assets/font/font-icon/font-svg/css/Glyphter.css"/>
    <!-- LIBRARY CSS-->
    <link href="assets/css/mycss.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="assets/libs/animate/animate.css"/>
    <link type="text/css" rel="stylesheet" href="assets/libs/bootstrap-3.3.5/css/bootstrap.css"/>
    <link type="text/css" rel="stylesheet" href="assets/libs/owl-carousel-2.0/assets/owl.carousel.css"/>
    <link type="text/css" rel="stylesheet" href="assets/libs/selectbox/css/jquery.selectbox.css"/>
    <link type="text/css" rel="stylesheet" href="assets/libs/fancybox/css/jquery.fancybox.css"/>
    <link type="text/css" rel="stylesheet" href="assets/libs/fancybox/css/jquery.fancybox-buttons.css"/>
    <link type="text/css" rel="stylesheet" href="assets/libs/media-element/build/mediaelementplayer.min.css"/>
    <!-- STYLE CSS    --><!--link(type="text/css", rel='stylesheet', href='assets/css/color-1.css', id="color-skins")-->
    <link type="text/css" rel="stylesheet" href="#" id="colorskins"/>
    <%--<script src="assets/libs/jquery/jquery-2.1.4.min.js"></script>--%>
    <script src="assets/libs/js-cookie/js.cookie.js"></script>
    <script>if ((Cookies.get('colorskin') != undefined) && (Cookies.get('colorskin') != 'color-1')) {
    $('#colorskins').attr('href', 'assets/css/' + Cookies.get('colorskin') + '.css');
} else if ((Cookies.get('colorskin') == undefined) || (Cookies.get('colorskin') == 'color-1')) {
    $('#colorskins').attr('href', 'assets/css/color-1.css');
}</script>

  
      <style type="text/css">
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
  
 
</head>
<body>
    <div id="wrapper-content">
        <!-- PAGE WRAPPER-->
        <div id="page-wrapper">
            <!-- MAIN CONTENT-->
            <div class="main-content">
                <!-- CONTENT-->
                <div class="content">
         <form id="form1" runat="server"> 
           <div class="page-register rlp">
        <div class="container">
               <div class="register-wrapper rlp-wrapper reg-sk">

                
                    
                <div class="register-table rlp-table">
                    
                    
                    <a href="index.html">
                        <img src="assets/images/logo-color-1.png" alt="" class="login" /></a>
                   

                    <div class="register-title rlp-title">create your account and join with us!</div>
                    <h3>Student Detail's</h3>
                   
                  
                    
                      <div class="register-form bg-w-form rlp-form" runat="server">                        
                             

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
                                    <asp:TextBox ID="lname" CssClass="form-control  form-input " runat="server"></asp:TextBox>

                                </div>
                                   <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                        Email <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="email" CausesValidation="true" CssClass="form-control  form-input" runat="server"></asp:TextBox>

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
                                     &nbsp; &nbsp;&nbsp;    <asp:RadioButton ID="RadioButton1" runat="server" Text="Male" />
                                        &nbsp;&nbsp;   <asp:RadioButton ID="RadioButton2" runat="server" Text="Female" />
     
                                </div>
                                   <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                        Date of birth <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="dob" CssClass="form-control  form-input"  runat="server"></asp:TextBox>

                            </div>
                                   <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                        Nationality <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="nationality" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                

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
                                     <asp:DropDownList ID="DropDownList2" CssClass="form-control  form-input" placeholder="----Select----"  runat="server">
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
                                    <asp:TextBox ID="postalcode" CssClass="form-control  form-input" runat="server"></asp:TextBox>

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
                            <h4>Upload your photo:</h4>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            

                                <h3 style="text-align:center">School Detail's</h3>

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
           
                                      <asp:DropDownList ID="DropDownList1" CssClass="form-control  form-input" placeholder="----Select----"  runat="server">
                                          <asp:ListItem></asp:ListItem>
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
                                <h3 style="text-align:center">Authorization Detail's</h3>
                                <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                        Username <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="username" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                      </div>
                                 <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                        Acccount pin <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="accountpin" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                      </div>
                                 <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                        Password <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="password" CssClass="form-control  form-input" TextMode="Password" runat="server"></asp:TextBox>
                                     </div>
                                      <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                        Re-Password <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="repassword" CssClass="form-control  form-input" TextMode="Password" runat="server"></asp:TextBox>
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
                                       
                        <div class="register-submit">
                                    <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-register btn-green" OnClick="Page_Load"/></button>
                     </div>      
                            
                    </div>
                    </div>
                          
                    
                    
                      
                 
                </div>
                    
                
                           
            </div>
        
        </div>  
              </form>     
              
                </div>
            </div>
        </div>
        <!-- BUTTON BACK TO TOP-->
        <div id="back-top"><a href="#top"><i class="fa fa-angle-double-up"></i></a></div>
    </div>
     
    <!-- FOOTER-->
<footer></footer>
<!-- THEME SETTING-->
<div class="theme-setting">
    <div class="theme-loading">
        <div class="theme-loading-content">
            <div class="dots-loader"></div>
        </div>
    </div>
    <a href="javascript:;" class="btn-theme-setting"><i class="fa fa-tint"></i></a>

    <div class="content-theme-setting"><h2 class="title">setting color</h2>
        <ul class="list-unstyled list-inline color-skins">
            <li data-color="color-1"></li>
            <li data-color="color-2"></li>
            <li data-color="color-3"></li>
            <li data-color="color-4"></li>
            <li data-color="color-5"></li>
            <li data-color="color-6"></li>
            <li data-color="color-7"></li>
            <li data-color="color-8"></li>
            <li data-color="color-9"></li>
            <li data-color="color-10"></li>
        </ul>
    </div>
</div>
<!-- LOADING--><!-- JAVASCRIPT LIBS-->
<script>if ((Cookies.get('color-skin') != undefined) && (Cookies.get('color-skin') != 'color-1')) {
    $('.logo .header-logo img').attr('src', 'assets/images/logo-' + Cookies.get('color-skin') + '.png');
} else if ((Cookies.get('color-skin') == undefined) || (Cookies.get('color-skin') == 'color-1')) {
    $('.logo .header-logo img').attr('src', 'assets/images/logo-color-1.png');
}</script>
<script src="assets/libs/bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script src="assets/libs/smooth-scroll/jquery-smoothscroll.js"></script>
<script src="assets/libs/owl-carousel-2.0/owl.carousel.min.js"></script>
<script src="assets/libs/appear/jquery.appear.js"></script>
<script src="assets/libs/count-to/jquery.countTo.js"></script>
<script src="assets/libs/wow-js/wow.min.js"></script>
<script src="assets/libs/selectbox/js/jquery.selectbox-0.2.min.js"></script>
<script src="assets/libs/fancybox/js/jquery.fancybox.js"></script>
<script src="assets/libs/fancybox/js/jquery.fancybox-buttons.js"></script>
<script type="text/javascript" src="jquery.js" ></script>
                 
<!-- MAIN JS-->
<script src="assets/js/main.js"></script>


<!-- LOADING SCRIPTS FOR PAGE-->
</body>
</html>
