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
            centerText( <%=stdid.ClientID%>);
            centerText( <%=name.ClientID%>);
            centerText( <%=lastname.ClientID%>);
            centerText( <%=contact.ClientID%>);
            centerText( <%=dateofbirth.ClientID%>);
            centerText( <%=nationality.ClientID%>);
            centerText( <%=religion.ClientID%>);
            centerText( <%=address.ClientID%>);
            centerText( <%=postalcode.ClientID%>);
            centerText( <%=gurdianname.ClientID%>);
            centerText( <%=gurdiancontact.ClientID%>);
            centerText( <%=previousschool.ClientID%>);
            centerText( <%=lastclassattend.ClientID%>);
            centerText( <%=postalcode.ClientID%>);
            centerText( <%=username.ClientID%>);
            centerText( <%=primaryemail.ClientID%>); 
            centerText( <%=generalid.ClientID%>);
            centerText( <%=dobid.ClientID%>);
            centerText( <%=authorizeid.ClientID%>);
            centerText( <%=locationid.ClientID%>);
            removeBackToTop();
            validation();
        });


        function centerText(control) {
            $(control).css({ 'text-align': 'center' });
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
                <div class="register-table rlp-table" style="box-shadow: 5px 5px 50px 5px; background-color: #C4EF98;">
                    <h2 class="center-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Update Student Detail</h2>
                    <hr style="border: solid; border-width: 1px" />
                    <asp:Panel ID="Panel1" runat="server">
                        <div class="register-form bg-w-form rlp-form">
                            <div style="padding-left: 131px">
                                <br />
                                <!--p.help-block Warning !-->
                                <asp:TextBox ID="stdid" runat="server" CssClass="form-control form-input" Height="35px" placeholder="Enter Your Student ID" Width="331px"></asp:TextBox>
                            </div>
                            <div style="padding-left: 131px">
                                <br />
                                <!--p.help-block Warning !-->
                                <asp:TextBox ID="name" runat="server" CssClass="form-control form-input" Height="35px" placeholder="Enter First name" Width="331px"></asp:TextBox>
                            </div>
                            <div style="padding-left: 131px">
                                <br />
                                <!--p.help-block Warning !-->
                                <asp:TextBox ID="lastname" runat="server" CssClass="form-control form-input" Height="35px" placeholder="Enter Last name" Width="331px"></asp:TextBox>
                            </div>
                            <div style="padding-left: 131px">
                                <br />
                                <!-- p.help-block Warning !-->
                                <asp:TextBox ID="contact" CssClass="form-control  form-input " placeholder="Enter Contact no" Width="331px" runat="server" Height="35px"></asp:TextBox>
                            </div>
                            <div style="padding-left: 131px">
                                <br />
                                <!--p.help-block Warning !-->
                                <asp:TextBox ID="nationality" runat="server" CssClass="form-control form-input" Height="35px" placeholder="Enter Nationality" Width="331px"></asp:TextBox>
                            </div>
                            <div style="padding-left: 131px">
                                <br />
                                <!--p.help-block Warning !-->
                                <asp:TextBox ID="religion" runat="server" CssClass="form-control form-input" Height="35px" placeholder="Enter Religion" Width="331px"></asp:TextBox>
                            </div>
                            <div style="padding-left: 131px">
                                <br />
                                <!-- p.help-block Warning !-->
                                <asp:TextBox ID="address" CssClass="form-control  form-input " placeholder="Enter Address" Width="331px" runat="server" Height="35px"></asp:TextBox>
                            </div>
                            <div style="padding-left: 131px">
                                <br />
                                <!-- p.help-block Warning !-->
                                <asp:TextBox ID="dateofbirth" CssClass="form-control  form-input " type="date" placeholder="Enter Date Of Birth" Width="331px" runat="server" Height="35px"></asp:TextBox>
                            </div>
                            <div style="padding-left: 131px">
                                <br />
                                <!--p.help-block Warning !-->
                                <asp:TextBox ID="gurdianname" runat="server" CssClass="form-control form-input" Height="35px" placeholder="Enter Parent name" Width="331px"></asp:TextBox>
                            </div>
                            <div style="padding-left: 131px">
                                <br />
                                <!--p.help-block Warning !-->
                                <asp:TextBox ID="gurdiancontact" runat="server" CssClass="form-control form-input" Height="35px" placeholder="Enter Parent Contact" Width="331px"></asp:TextBox>
                            </div>
                            <div style="padding-left: 131px">
                                <br />
                                <!--p.help-block Warning !-->
                                <asp:TextBox ID="previousschool" runat="server" CssClass="form-control form-input" Height="35px" placeholder="Enter Previous school" Width="331px"></asp:TextBox>
                            </div>
                            <div style="padding-left: 131px">
                                <br />
                                <!--p.help-block Warning !-->
                                <asp:TextBox ID="lastclassattend" runat="server" CssClass="form-control form-input" Height="35px" placeholder="Enter Last class attend" Width="331px"></asp:TextBox>
                            </div>
                            <div style="padding-left: 131px">
                                <br />
                                <!-- p.help-block Warning !-->
                                <asp:TextBox ID="postalcode" CssClass="form-control  form-input " placeholder="Enter Postal Code" Width="331px" runat="server" Height="35px"></asp:TextBox>
                            </div>
                            <div style="padding-left: 131px">
                                <br />
                                <!--p.help-block Warning !-->
                                <asp:TextBox ID="username" runat="server" CssClass="form-control form-input" Height="35px" placeholder="Enter USER NAME" Width="331px"></asp:TextBox>
                            </div>
                            <div style="padding-left: 131px">
                                <br />
                                <!--p.help-block Warning !-->
                                <asp:TextBox ID="primaryemail" runat="server" CssClass="form-control form-input" Height="35px" placeholder="Enter Email" Width="331px"></asp:TextBox>
                            </div>
                            <div style="padding-left: 131px">
                                <br />
                                <!--p.help-block Warning !-->
                                <asp:TextBox ID="generalid" runat="server" CssClass="form-control form-input" Height="35px" placeholder="General id" Width="331px"></asp:TextBox>
                            </div>
                            <div style="padding-left: 131px">
                                <br />
                                <!--p.help-block Warning !-->
                                <asp:TextBox ID="dobid" runat="server" CssClass="form-control form-input" Height="35px" placeholder="dob id" Width="331px"></asp:TextBox>
                            </div>
                            <div style="padding-left: 131px">
                                <br />
                                <!--p.help-block Warning !-->
                                <asp:TextBox ID="locationid" runat="server" CssClass="form-control form-input" Height="35px" placeholder="Location id" Width="331px"></asp:TextBox>
                            </div>
                            <div style="padding-left: 131px">
                                <br />
                                <!--p.help-block Warning !-->
                                <asp:TextBox ID="authorizeid" runat="server" CssClass="form-control form-input" Height="35px" placeholder="General id" Width="331px"></asp:TextBox>
                            </div>
                        </div>
                        <div class="register-submit">
                            <button type="submit" class="btn btn-register btn-green">
                                <span>
                                    <asp:Button ID="Button1" runat="server" Text=" Update" Style="background-color: transparent" BorderStyle="None" OnClick="Button1_Click" /></span></button>
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
