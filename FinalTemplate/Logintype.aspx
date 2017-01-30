<%@ Page Title="" Language="C#" MasterPageFile="~/Register.Master" AutoEventWireup="true" CodeBehind="Logintype.aspx.cs" Inherits="FinalTemplate.Logintype" %>
<asp:Content ID="Content1" ContentPlaceHolderID="RegisterHeadPlaceHolder" runat="server">
     <script src="assets/js/jquery-2.2.3.js"></script>
    
    <script src="assets/js/jquery.validate.js"></script>
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
               $('#name').validate({
                   rules: {
                       name: {
                           required: true,
                           lettersonly: true
                       },
                       lname: {
                           required: true,
                           lettersonly: true
                       },
                       contact1: {
                           required: true,
                           contact1: true
                       }
                   },

                   messages: {
                       name: {
                           required: "Please enter your name"

                       },
                       lname:
                           {
                               required: "Please enter your last name"
                           },
                   }
               });
           });

           $(document).ready(function() {
               $('.rlp').removeClass("rlp");
               $('.container').css('width', '50%');
               removeBackToTop();
               sameheight('#<%=txt_password.ClientID%>');
               sameheight('#<%=txt_username.ClientID%>');

           });

           function sameheight(id) {
               $(id).css('height','35px');
           }

           function removeBackToTop() {
               $('#back-top').css('display', 'none');
           }
    </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RegisterPlaceHolder1" runat="server">

    <style>
        .reg-sk {
            padding-top:26px;
            padding-bottom:26px;
            opacity: 0.95;
        }
    </style>
    <div class="page-register rlp">
        <div class="container">
            <div class="register-wrapper rlp-wrapper reg-sk" style="opacity:0.9;">
                <div class="register-table rlp-table">
                    <!----
                    <a href="index.html">
                        <img src="assets/images/logo-color-1.png" alt="" style="opacity: 0.7;" class="login" />

                    </a>
                        ---->
                    <div><img src="assets/images/logo-color-1.png" height="150px" /></div>
                    <%--<div class="register-title rlp-title">Sign In</div>--%>
                    <%--<div id="divinvisible" class="register-title rlp-title">--%>
                        <asp:Label runat="server" ID="lbl_error">error message</asp:Label>
                    <%--</div>--%>
                   
                    <asp:Panel ID="Panel1" runat="server">
                        <div class="register-form bg-w-form rlp-form">  
                                 
                            
                           <%-- <div style="padding-left:95px">
                                 

                                    <label for="regname" class="control-label form-label">
                                        Account Type<span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!--p.help-block Warning !-->
                                    <br />
                              <asp:DropDownList ID="ddl_type" CssClass="form-control form-input" Width="331px"  placeholder="----Select----" runat="server" ></asp:DropDownList>
                                </div>--%>

                                <div style="padding-left:95px">

                                    <label for="regname" class="control-label form-label">
                                        User Name<span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!--p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="txt_username" CssClass="form-control  form-input"  placeholder="Email id or User name"  Width="331px" runat="server"></asp:TextBox>
                                </div>
                                
                                      
                               
                                <div style="padding-left:95px">
                                    <label for="regname" class="control-label form-label">
                                        Password <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="txt_password" CssClass="form-control  form-input "  placeholder="Password or Pin code " Width="331px" runat="server" TextMode="Password"></asp:TextBox>

                                </div>
                                                           
                                           </div>                      
                        <div class="register-submit">
                            <button type="submit" class="btn btn-register btn-green">
                                <span>
                                    <asp:Button ID="Button1" runat="server" Text="Sign In" Style="background-color: transparent" BorderStyle="None" OnClick="Button1_Click" /></span>

                            </button>
                     </div>          
                 </asp:Panel>                
                    </div>            
                </div>          
            </div>
        </div>
</asp:Content>
