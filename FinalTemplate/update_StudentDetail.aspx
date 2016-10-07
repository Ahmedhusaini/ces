<%@ Page Title="Update Detail" Language="C#" MasterPageFile="~/updatepasswordpanel.Master" AutoEventWireup="true" CodeBehind="update_StudentDetail.aspx.cs" Inherits="FinalTemplate.update_StudentDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="assets/js/jquery-2.2.3.js"></script>
    <script src="assets/js/jquery.validate.js"></script>
    <script type="text/javascript">

        $.validator.addMethod("lettersonly", function (value, element) {
            return this.optional(element) || /^[a-z\s]+$/i.test(value);
        }, "Letters only please");

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
            $(control).css({ 'text-align': 'center'});
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

    <div class="section background-opacity page-title set-height-top">
        <div class="container">
            <div class="page-title-wrapper">
                <!--.page-title-content-->
                <h2 class="captions">Update Details</h2>
            </div>
        </div>
    </div>
    <br />
    <div class="page-login rlp">
        <div class="container">
            <div class="register-wrapper rlp-wrapper reg-sk" style="opacity: 0.98;">
                <div class="register-table rlp-table" style="box-shadow: 5px 5px 50px 5px; background-color: #EEFBFD;">
                    <h2 class="center-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Update Student Detail</h2>
                    <hr style="border:solid;border-width:1px" />
                    <asp:Panel ID="Panel1" runat="server">
                        <div class="register-form bg-w-form rlp-form">
                            <div style="padding-left: 131px">
                                <label for="regname" class="control-label form-label">
                                    Email <span class="highlight">*<br />
                                    </span>
                                </label>
                                <!--p.help-block Warning !-->
                                <asp:TextBox ID="email" runat="server" CssClass="form-control form-input" Height="35px" placeholder="User name" Width="331px"></asp:TextBox>
                            </div>
                            <div style="padding-left: 131px">
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

                        </div>
                        <div class="register-submit">
                            <button type="submit" class="btn btn-register btn-green">
                                <span>
                                    <asp:Button ID="Button1" runat="server" Text="Update" Style="background-color: transparent" BorderStyle="None" /></span></button>
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
