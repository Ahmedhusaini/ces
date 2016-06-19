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
               $('.register-form').css('margin-left', '25%');
               centerform();
               centerText( <%=ddl_type.ClientID%>);
               centerText( <%=txt_username.ClientID%>);
               centerText( <%=txt_password.ClientID%>);
           });

           function centerform() {
               var windowHeight = $(window).height();
               var formheight = $('div.register-wrappe').height();
               var newheight = windowHeight - formheight;
               $('div.register-wrappe').css('padding-top',newheight+" px");
           }

           function centerText(control) {
               $(control).css('text-align', 'center');
           }

           function invisiblediv() {
               $('#divinvisible').delay(3200).fadeOut(1000);
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
            <div class="register-wrapper rlp-wrapper reg-sk">
                <div class="register-table rlp-table">
                    <a href="index.html">
                        <img src="assets/images/logo-color-1.png" alt="" class="login" /></a>

                    <div class="register-title rlp-title">create your account and join us!</div>
                    <div class="register-title rlp-title">Sign In</div>
                    <div id="divinvisible" class="register-title rlp-title">
                        <asp:Label runat="server" ID="lbl_error">error message</asp:Label>
                    </div>
                   
                    <asp:Panel ID="Panel1" runat="server">
                        <div class="register-form bg-w-form rlp-form">  
                                 
                            
                            <div style="padding-left:131px">
                                 

                                    <label for="regname" class="control-label form-label">
                                        Account Type<span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!--p.help-block Warning !-->
                                    <br />
                              <asp:DropDownList ID="ddl_type" CssClass="form-control form-input" Width="331px" placeholder="----Select----" runat="server" ></asp:DropDownList>
                                </div>

                                <div style="padding-left:131px">

                                    <label for="regname" class="control-label form-label">
                                        User Name<span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!--p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="txt_username" CssClass="form-control  form-input"  placeholder="Email id or User name"  Width="331px" runat="server"></asp:TextBox>
                                </div>
                                
                                      
                               
                                <div style="padding-left:131px">
                                    <label for="regname" class="control-label form-label">
                                        Password <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="txt_password" CssClass="form-control  form-input "  placeholder="Password or Pin code " Width="331px" runat="server"></asp:TextBox>

                                </div>
                                                           
                                           </div>                      
                        <div class="register-submit">
                            <button type="submit" onclick="window.location.href='index.html'" class="btn btn-register btn-green">
                                <span>
                                    <asp:Button ID="Button1" OnClientClick="invisiblediv()" runat="server" Text="Sign In" Style="background-color: transparent" BorderStyle="None" OnClick="Button1_Click" /></span></button>
                     </div>          
                 </asp:Panel>                
                    </div>            
                </div>          
            </div>
        </div>
</asp:Content>
