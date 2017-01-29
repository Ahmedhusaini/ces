<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="update_teacherDetail.aspx.cs" Inherits="FinalTemplate.update_teacherDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TeacherHeadPlaceHolder" runat="server">
       <script src="assets/js/jquery-2.2.3.js"></script>
    <script src="assets/js/jquery.validate.js"></script>
    <script type="text/javascript">

        $.validator.addMethod("lettersonly", function (value, element) {
            return this.optional(element) || /^[a-z\s]+$/i.test(value);
        }, "Letters only please");
        $.validator.addMethod("phone", function (phone_number, element) {
            phone_number = phone_number.replace(/\s+/g, "");
            return this.optional(element) || phone_number.length > 9 &&
                phone_number.match(/^((\+92)|(0092))-{0,1}\d{3}-{0,1}\d{7}$|^\d{11}$|^\d{4}-\d{7}$/);
        });
        $.validator.addMethod( "digitsonly", function( value, element ) {
            return this.optional( element ) || /^[0-9]+$/i.test( value );
        }, "Numbers only please" );
        $(document).ready(function () {
            $.validator.addMethod( "romanonly", function( value, element ) {
                return this.optional( element ) || /^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/g.test( value );
            }, "Please type in Roman ( I,II,IX,X ) " ); 
            $.validator.addMethod( "imageonly", function( value, element ) {
                return this.optional( element ) || /^([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$/.test( value );
            }, ".jpeg ,.png, .gif format allow only " );  
            $.validator.addMethod("pwcheck", function(value) {
                return /^[A-Za-z0-9\d=!\-@._*]*$/.test(value) // consists of only these
                    && /[a-z]/.test(value) // has a lowercase letter
                    && /\d/.test(value) // has a digit
            },"please only Lowercase and must have digits ");
            $.validator.addMethod("email",function(value,element){
                return this.optional(element) || /^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,5}$/i.test(value);
            });    

            $("#form1").validate({                   
                rules: {
                    <%=txtFirstName.UniqueID%>:{
                        required: true,
                        lettersonly: true                        
                    },
                    <%=txtLastName.UniqueID%>:{
                        required: true,
                        lettersonly: true                        
                    },
                    <%=txtReligion.UniqueID%>:{
                        required: true,
                        lettersonly: true                        
                    },
                    <%=txtPhone.UniqueID%>:{
                        required: true,
                        phone:true
                    },
                    <%=addresstxt.UniqueID%>:{
                        required: true                        
                    },
                    <%=DateOfJointxt.UniqueID%>:{
                        required: true,
                        lettersonly: true                        
                    },
                    <%=cnicnotxt.UniqueID%>:{
                        required: true,
                        phone:true
                    },
                    <%=postalcodetxt.UniqueID%>:{
                        required: true ,
                        digitsonly:true,
                        minlength:5,
                        maxlength:6
                    },
                    <%=usernametxt.UniqueID%>:{
                        required: true,
                        lettersonly: true                        
                    },
                     <%=passwordtxt.UniqueID%>:{
                         required: true,
                         lettersonly: true                        
                     },
                    <%=pemailtxt.UniqueID%>:{
                        required: true,
                        email : true                       
                    },
                    <%=semailtxt.UniqueID%>:{
                        required: true,
                        email : true                       
                    }
                },
                messages: {
                    <%=txtFirstName.UniqueID%>: {
                        required: "Please enter First name",
                    },
                    <%=txtLastName.UniqueID%>: {
                        required: "Please enter Last name",
                    },
                    <%=txtReligion.UniqueID%>: {
                        required: "Please enter Religion",
                    },
                    <%=txtPhone.UniqueID%>: {
                        required: "Please enter Contact No",
                    },
                    <%=addresstxt.UniqueID%>: {
                        required: "Please enter Address",
                    },
                    <%=postalcodetxt.UniqueID%>: {
                        required: "Please enter postal code",
                    },
                    <%=usernametxt.UniqueID%>: {
                        required: "Please enter username",
                    },
                     <%=passwordtxt.UniqueID%>: {
                         required: "Please enter password",
                     },
                    <%=semailtxt.UniqueID%>: {
                        required: "please enter a valid Email Address",
                    },
                    <%=pemailtxt.UniqueID%>: {
                        required: "please enter a valid Email Address",
                }                        
                }
            });
        });
        $(document).ready(function () {
            $('.rlp').removeClass("rlp");
            $('.register-form').css('margin-left', '25%');   
            removeBackToTop();
            validation();
        });

        function centerText(control) {
            (control).css({ 'text-align': 'center' });
        }
        function removeBackToTop() {
            $('#back-top').css('display', 'none');
        }
    </script>
</asp:Content>
<%--    <style>
        .reg-sk {
            padding-top: 26px;
            padding-bottom: 26px;
            opacity: 0.95;
        }

        label.error {
            color: red;
            display: inline-flexbox;
            display:inline;
            /*text-align:right;*/
        }

        input.error {
            border: 1px solid red;
            float: none;
            color: green;
            padding-left: .3em;
            vertical-align: top;
            
        }
    </style>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="TeacherPlaceHolder1" runat="server">
    <div class="section background-opacity page-title set-height-top">
        <div class="container">
            <div class="page-title-wrapper">
                <!--.page-title-content-->
                <h2 class="captions">Update Teacher Information</h2>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="register-wrapper rlp-wrapper reg-sk" style="opacity: 0.98;">
            <div class="register-table rlp-table" style="box-shadow: 5px 5px 50px 5px; background-color: #C8E1AE;">
                <div class="group-title-index">
                    <h2 class="center-title">Update Teacher Details</h2>
                    <div class="bottom-title">
                        <i class="bottom-icon icon-icon-04"></i>
                    </div>
                    <div class="inner-container">
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Teacher ID</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" Width="200px" ID="teachertxtid" ReadOnly="true"></asp:TextBox></td>
                                        <td class="col-3"><span></span></td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="inner-container">
                        <div class="table-header">
                            <table class="edu-table-responsive">
                                <thead>
                                    <tr class="heading-table" style="background-color: #88BD46;">
                                        <th class="col-3">Personal Information</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">First Name</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" Width="200px" ID="txtFirstName"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Last Name</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" Width="200px" ID="txtLastName"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Nationality</span></td>
                                        <td class="col-2">
                                            <asp:DropDownList Enabled="false" Width="200px" BackColor="White" CssClass="sbHolder" runat="server" ID="ddlNationality">
                                                <asp:ListItem>Pakistan</asp:ListItem>
                                            </asp:DropDownList></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Religion</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" Width="200px" ID="txtReligion"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>

                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Phone</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" Width="200px" ID="txtPhone"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Address</span></td>
                                        <td class="form-input">
                                            <asp:TextBox runat="server" Width="200px" ID="addresstxt"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3" style="color: black; font-weight: bolder">Date Of Join</td>
                                        <td class="col-2">
                                            <asp:TextBox ID="DateOfJointxt" Width="200px" runat="server" ReadOnly="true"></asp:TextBox>
                                        </td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3" style="color: black; font-weight: bolder">CNIC No</td>
                                        <td class="col-2">
                                            <asp:TextBox ID="cnicnotxt" Width="200px" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3" style="color: black; font-weight: bolder">City</td>
                                        <td class="col-2">
                                           <asp:DropDownList runat="server" CssClass="sbHolder" BackColor="White" Width="200px" ID="ddlCity" DataSourceID="SqlDataSource1" DataTextField="city" DataValueField="city_id">
                                                <asp:ListItem>Karachi</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT [city_id], [city] FROM [tbl_city]"></asp:SqlDataSource>
                                        </td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3" style="color: black; font-weight: bolder">Postal Code</td>
                                        <td class="col-2">
                                            <asp:TextBox ID="postalcodetxt" Width="200px" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="col-3"></td>
                                    </tr>
                                                                     
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3" style="color: black; font-weight: bolder">Username</td>
                                        <td class="col-2">
                                            <asp:TextBox ID="usernametxt" Width="200px" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3" style="color: black; font-weight: bolder">Password</td>
                                        <td class="col-2">
                                            <asp:TextBox ID="passwordtxt" Width="200px" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3" style="color: black; font-weight: bolder">Primary Email</td>
                                        <td class="col-2">
                                            <asp:TextBox ID="pemailtxt" Width="200px" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3" style="color: black; font-weight: bolder">Secondary Email</td>
                                        <td class="col-2">
                                            <asp:TextBox ID="semailtxt" Width="200px" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="col-3"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="inner-container">
                        <div class="table-header">
                            <table class="edu-table-responsive">
                                <thead>
                                    <tr class="heading-table" style="background-color: #88BD46;">
                                        <th class="col-3">Unique Information</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">General Details ID</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" Width="200px" ID="txtGenealID" ReadOnly="true" ></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>

                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Location ID</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" Width="200px" ID="txtLocationID" ReadOnly="true"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>

                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Date Of Birth ID</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" Width="200px" ID="txtDOBId" ReadOnly="true"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Authorized ID</span></td>
                                        <td class="col-2">
                                            <asp:TextBox  runat="server" Width="200px" ID="authorizedidtxt" ReadOnly="true"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"></td>
                                        <td class="col-3"><span>
                                            <div class="register-submit">
                                                <button type="submit" class="btn btn-register btn-green">
                                                    <span>
                                                        <asp:Button ID="Button1" runat="server" Text=" Update" Style="background-color: transparent" BorderStyle="None" OnClick="Button1_Click" /></span></button>
                                                <asp:Label ID="Label1" runat="server"></asp:Label>
                                            </div>
                                            <%--OnClick="Button1_Click"--%>
                                        </span></td>
                                        <td class="col-3"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
