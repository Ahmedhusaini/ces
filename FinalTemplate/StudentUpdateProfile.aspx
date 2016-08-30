<%@ Page Title="" Language="C#" MasterPageFile="~/Register.Master" AutoEventWireup="true" CodeBehind="StudentUpdateProfile.aspx.cs" Inherits="FinalTemplate.StudentUpdateProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="RegisterHeadPlaceHolder" runat="server">
    <script src="assets/js/jquery-2.2.3.js"></script>

    <script src="assets/js/jquery.validate.js"></script>
    <script type="text/javascript">


        $.validator.addMethod("lettersonly", function (value, element) {
            return this.optional(element) || /^[a-z]+$/i.test(value);
        }, "Letters only please");
        $(document).ready(function () {
            $('#form1').validate({
                rules: {
                    <%=txt_username1.UniqueID%>: {
                        required: true,
                        lettersonly: true
                    },
                    <%=change_password.UniqueID%>: {
                        required: true,
                    },
                     <%=txt_password.UniqueID%>: {
                         required: true,
                     },
                     <%=conform_password.UniqueID%>: {
                         required: true,
                     },
                },

                messages: {
                    <%=txt_username1.UniqueID%>: {
                        required: "Please enter your name"

                    },
                    <%=change_password.UniqueID%>:{
                        required:"Please enter Password"
                    },
                        <%=txt_password.UniqueID%>: {
                            required: "Please enter Password"
                    },
                    <%=conform_password.UniqueID%>:{
                        required:"Please enter Password"
                    },
                }
            });
        });
        $(document).ready(function () {
            $('.rlp').removeClass("rlp");
            $('.register-form').css('margin-left', '25%');
            centerText( <%=txt_username1.ClientID%>);
            centerText( <%=change_password.ClientID%>);
            centerText( <%=txt_password.ClientID%>);
            centerText( <%=txt_password.ClientID%>);
            centerText( <%=conform_password.ClientID%>);
               removeBackToTop();
           });
           function centerform() {
               var windowHeight = $(window).height();
               var formheight = $('div.register-wrappe').height();
               var newheight = windowHeight - formheight;
               $('div.register-wrappe').css('padding-top', newheight + " px");
           }

           function centerText(control) {
               $(control).css('text-align', 'center');
           }

           function invisiblediv() {
               $('#divinvisible').delay(3200).fadeOut(1000);
           }
           function removeBackToTop() {
               $('#back-top').css('display', 'none');
           }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RegisterPlaceHolder1" runat="server">
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
    <div class="page-register rlp">
        <div class="container">
            <div class="register-wrapper rlp-wrapper reg-sk" style="opacity: 0.9;">
                <div class="register-table rlp-table">
                    <div class="register-title rlp-title">Update Your Profile</div>
                    <div id="divinvisible" class="register-title rlp-title">
                        <asp:Label runat="server" ID="lbl_error">error message</asp:Label>
                    </div>
                    <asp:Panel ID="Panel1" runat="server">
                        <div class="register-form bg-w-form rlp-form">
                            <div style="padding-left: 131px">
                                <label for="regname" class="control-label form-label">
                                    Email <span class="highlight"> *<br />
                                    </span>
                                </label>
                                <!--p.help-block Warning !-->
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control  form-input" Height="35px" placeholder="User name" Width="331px"></asp:TextBox>
                            </div>
                            <div style="padding-left: 131px">
                                <label for="regname" class="control-label form-label">
                                    User Name <span class="highlight"> *<br />
                                    </span>
                                </label>
                                <!--p.help-block Warning !-->
                                <asp:TextBox ID="txt_username1" runat="server" CssClass="form-control  form-input" Height="35px" placeholder="User name" Width="331px"></asp:TextBox>
                            </div>
                            <div style="padding-left: 131px">
                                <label for="regname" class="control-label form-label">
                                    Password <span class="highlight">*<br />
                                    </span>
                                </label>
                                <!-- p.help-block Warning !-->
                                <br />
                                <asp:TextBox ID="change_password" CssClass="form-control  form-input " placeholder="****" Width="331px" runat="server" TextMode="Password" Height="35px"></asp:TextBox>
                             </div>
                            <div style="padding-left: 131px">
                                <label for="regname" class="control-label form-label">
                                    New Password <span class="highlight">*<br />
                                    </span>
                                </label>
                                <!-- p.help-block Warning !-->
                                <br />
                                <asp:TextBox ID="txt_password" CssClass="form-control  form-input " placeholder="****" Width="331px" runat="server" TextMode="Password" Height="35px"></asp:TextBox>
                             </div>
                            <div style="padding-left: 131px">
                                <label for="regname" class="control-label form-label">
                                    Conform Password <span class="highlight">*<br />
                                    </span>
                                </label>
                                <!-- p.help-block Warning !-->
                                <br />
                                <asp:TextBox ID="conform_password" CssClass="form-control  form-input " placeholder="****" Width="331px" runat="server" TextMode="Password" Height="35px"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" ControlToCompare="txt_password" ControlToValidate="conform_password" CssClass=" input.error" ForeColor="#ff0000" ErrorMessage="Your password does not match" runat="server" Display="Dynamic"></asp:CompareValidator> 
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
