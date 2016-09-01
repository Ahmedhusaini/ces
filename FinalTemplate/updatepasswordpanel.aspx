<%@ Page Title="" Language="C#" MasterPageFile="~/updatepasswordpanel.Master" AutoEventWireup="true" CodeBehind="updatepasswordpanel.aspx.cs" Inherits="FinalTemplate.updatepasswordpanel1" %>

<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="assets/js/jquery-2.2.3.js"></script>
    <script src="assets/js/jquery.validate.js"></script>
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <script type="text/javascript">
        
        $.validator.addMethod( "lettersonly", function( value, element ) {
            return this.optional( element ) || /^[a-z\s]+$/i.test( value );
        }, "Letters only please" );
        function validation() {
            $('#form1').validate({
                
                rules: {
                    <%=username.UniqueID%>: {
                        required: true,
                        lettersonly: true
                    },
                    <%=changepassword.UniqueID%>: {
                        required: true,
                    },
                    <%=newpassword.UniqueID%>: {
                        required: true,
                    },
                    <%=conformpassword.UniqueID%>: {
                        required: true,
                    },
                },

                messages: {
                    <%=username.UniqueID%>: {
                        required: "Please enter your name"

                    },
                    <%=changepassword.UniqueID%>:{
                        required:"Please enter Password"
                    },
                    <%=newpassword.UniqueID%>: {
                        required: "Please enter Password"
                    },
                    <%=conformpassword.UniqueID%>:{
                        required:"Please enter Password"
                    },
                }
            });
        }
       
        $(document).ready(function () {
            $('.rlp').removeClass("rlp");
            $('.register-form').css('margin-left', '25%');
            centerText( <%=username.ClientID%>);
            centerText( <%=changepassword.ClientID%>);
            centerText( <%=newpassword.ClientID%>);
            centerText( <%=conformpassword.ClientID%>);
            removeBackToTop();
            validation();
        });


        function centerText(control) {
            $(control).css('text-align', 'center');
        }
        function removeBackToTop() {
            $('#back-top').css('display', 'none');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .reg-sk {
            padding-top: 26px;
            padding-bottom: 26px;
            opacity: 0.95;
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
                    <div class="page-login rlp" >
                        <div class="container">

                            <div class="register-wrapper rlp-wrapper reg-sk" style="opacity: 0.98;">
                                <div class="register-table rlp-table" style="box-shadow:5px 5px 50px 5px">
                                    <div class="register-title rlp-title">Update Your CES Password</div>
                                    <asp:Panel ID="Panel1" runat="server">
                                        <div class="register-form bg-w-form rlp-form">

                                            <div style="padding-left: 131px">
                                                <label for="regname" class="control-label form-label">
                                                    Email <span class="highlight">*<br />
                                                    </span>
                                                </label>
                                                <!--p.help-block Warning !-->
                                                <asp:TextBox ID="email" runat="server" CssClass="form-control form-input" Height="35px" placeholder="User name" Width="331px"></asp:TextBox>
                                            </div>                                            <div style="padding-left: 131px">
                                                <label for="regname" class="control-label form-label">
                                                    User Name <span class="highlight">*<br />
                                                    </span>
                                                </label>
                                                <!--p.help-block Warning !-->
                                                <asp:TextBox ID="username" runat="server" CssClass="form-control form-input" Height="35px" placeholder="User name" Width="331px"></asp:TextBox>
                                            </div>
                                            <div style="padding-left: 131px">
                                                <label for="regname" class="control-label form-label">
                                                    Password <span class="highlight">*<br />
                                                    </span>
                                                </label>
                                                <!-- p.help-block Warning !-->
                                                <br />
                                                <asp:TextBox ID="changepassword" CssClass="form-control  form-input " placeholder="password" Width="331px" runat="server" TextMode="Password" Height="35px"></asp:TextBox>
                                            </div>
                                            <div style="padding-left: 131px">
                                                <label for="regname" class="control-label form-label">
                                                    New Password <span class="highlight">*<br />
                                                    </span>
                                                </label>
                                                <!-- p.help-block Warning !-->
                                                <br />
                                                <asp:TextBox ID="newpassword" CssClass="form-control  form-input " placeholder="password" Width="331px" runat="server" TextMode="Password" Height="35px"></asp:TextBox>
                                            </div>
                                            <div style="padding-left: 131px">
                                                <label for="regname" class="control-label form-label">
                                                    Conform Password <span class="highlight">*<br />
                                                    </span>
                                                </label>
                                                <!-- p.help-block Warning !-->
                                                <br />
                                                <asp:TextBox ID="conformpassword" CssClass="form-control  form-input " placeholder="password" Width="331px" runat="server" TextMode="Password" Height="35px"></asp:TextBox>
                                                <asp:CompareValidator ID="CompareValidator1" ControlToCompare="newpassword" ControlToValidate="conformpassword" CssClass=" input.error" ForeColor="#ff0000" ErrorMessage="Your password does not match" runat="server" Display="Dynamic"></asp:CompareValidator>
                                            </div>

                                            <div style="padding-left: 131px">
                                                <br />
                                                <recaptcha:RecaptchaControl D="recaptcha" runat="server" PublicKey="6LeB3SgTAAAAAHJYmC1_0bVytnFzfX4S5b_-cy2g"
                                                    PrivateKey="6LeB3SgTAAAAAGAAMNc2nhBvJZcxvIyM83WyvHy5" />
                                            </div>

                                        </div>
                                        <div class="register-submit">
                                            <button type="submit" class="btn btn-register btn-green">
                                                <span>
                                                    <asp:Button ID="Button1" runat="server" Text="Update" Style="background-color: transparent" BorderStyle="None" OnClick="Button1_Click" /></span></button>
                                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                    </div>
</asp:Content>
