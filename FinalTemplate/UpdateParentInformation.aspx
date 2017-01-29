<%@ Page Title="" Language="C#" MasterPageFile="~/parentpanel.Master" AutoEventWireup="true" CodeBehind="UpdateParentInformation.aspx.cs" Inherits="FinalTemplate.UpdateParentInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script src="assets/js/jquery-2.2.3.js"></script>   
      
   
    <script src="assets/js/jquery.validate.js"></script>

<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css"
    rel="stylesheet" type="text/css" />
       

    <script type="text/javascript">

        $(document).ready(function(){
        
        
            validation();

            $('li a[title="Child Profile"]').attr("href","parentpanel.aspx");
            $('[title="Update Profile"]').css('display','none')
           
        });


    
        $(document).ready(function () {
            teacherwidth();
            samesizeimage();
            setbuttonlayout();
            formfieldswidths();
            rowbg();
            
            
            $('tr[title="hide"]').css('display', 'none');
           
            $('.heading-table').css('background-color', '#86bc42');
            $('[title="hidding"]').css('background-color', 'white');

        });

        $.validator.addMethod("lettersonly", function (value, element) {
            return this.optional(element) || /^[a-z\s]+$/i.test(value);
        }, "Letters only please");
        $.validator.addMethod("phone", function (phone_number, element) {
            phone_number = phone_number.replace(/\s+/g, "");
            return this.optional(element) || phone_number.length > 9 &&
                phone_number.match(/^((\+92)|(0092))-{0,1}\d{3}-{0,1}\d{7}$|^\d{11}$|^\d{4}-\d{7}$/);
        }, "Please specify a valid phone number with+92");
        $.validator.addMethod("digitsonly", function (value, element) {
            return this.optional(element) || /^[0-9]+$/i.test(value);
        }, "Numbers only please");
        $.validator.addMethod("pwcheck", function (value) {
            return /^[A-Za-z0-9\d=!\-@._*]*$/.test(value) // consists of only these
                && /[a-z]/.test(value) // has a lowercase letter
                && /\d/.test(value) // has a digit
        }, "please only Lowercase and must have digits ");
        $.validator.addMethod("imageonly", function (value, element) {
            return this.optional(element) || /^([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$/.test(value);
        }, ".jpeg ,.png, .gif format allow only ");



        function SelectedDivAnimation(aspControl) {
            $(aspControl).on('focus', function () {
                $(this).css({ 'background-color': 'rgb(108, 208, 91)', 'transition': '2s', 'border-color': 'green', 'color': 'white', 'height': '40px' });
            });
            $(aspControl).on('focusout', function () {
                $(this).css({ 'background-color': 'white', 'transition': '2s', 'border-color': 'white', 'color': 'black', 'height': '30px' });
            });
        }

        function rowbg() {
            $('.table-row').css('background-color', '#fafafa');
         
            $('span').css('color', 'black');
        }
        function formfieldswidths() {
            $('#<%=txtFirstName.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtLastName.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtDateofB.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=ddlNationality.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=rbtnMale.ClientID%>').css({ 'width': '20%', 'border-radius': '5px' });
            $('#<%=rbtnFemale.ClientID%>').css({ 'width': '20%', 'border-radius': '5px' });
            $('#<%=txtReligion.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtPhone.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtAddress.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=ddlCountry.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=ddlCity.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtPostalCode.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtUsername.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtPrimaryEmail.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtSecondaryEmail.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtautho.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtofficeadd.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtofficeno.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtsal.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtsal.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtdesig.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
      
            $('#<%=txtGenealID.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtDOB.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtLocationID.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
            $('#<%=txtCNIC.ClientID%>').css({ 'width': '100%', 'border-radius': '5px', 'height': '30px' });
           
        }
        function samesizeimage() {
            $('a img').css({ 'height': '200px', 'width': '300px' });
        }

        function setbuttonlayout() {
            $('button.btn.btn-green').css('padding-right', '115px');
        }
        function teacherwidth() {
            var path = "url(assets/images/cesThemeImages/searchTeacher.jpg)";
            $('.page-title').css({
                'background-image': path,
                'height': '450px'
            });
        }
        function validation() {

            $("#form1").validate({

                rules: {
                    <%=txtFirstName.UniqueID%>:{
                        required:true,
                        lettersonly:true,
                    },
                     <%=txtLastName.UniqueID%>:{
                            required:true,
                            lettersonly:true,
                     },
                     <%=txtDateofB.UniqueID%>:{
                         required:true,
                         
                     },
                    <%=ddlNationality.UniqueID%>:{
                        required:true,
                        lettersonly:true
                         
                    },
                      <%=txtReligion.UniqueID%>:{
                          required:true,
                          lettersonly:true,
                          maxlength: 8
                      },
                     <%=txtPhone.UniqueID%>:{
                         required: true,
                         phone: true,
                         
                     },
                     <%=txtAddress.UniqueID%>:{
                         required:true,
                         lettersonly:true,
                     },
                      <%=txtofficeadd.UniqueID%>:{
                          required:true,
                          lettersonly:true,
                      },
                       <%=txtofficeno.UniqueID%>:{
                           required: true,
                           digitsonly: true
                       },
                     <%=txtsal.UniqueID%>:{
                         required: true,
                         digitsonly: true
                     },
                     <%=txtPostalCode.UniqueID%>:{
                         required: true,
                         digitsonly: true,
                         minlength: 5,
                         maxlength: 6
                     },
                    <%=txtCNIC.UniqueID%>:{
                        required: true,
                        digitsonly: true,
                        minlength: 13
                    },
                    <%=txtUsername.UniqueID%>:{
                        required: true,
                        lettersonly:true
                    },
                      <%=txtPrimaryEmail.UniqueID%>:{
                          required: true,
                          email: true
                      },
                      <%=txtSecondaryEmail.UniqueID%>:{
                          required: true,
                          email: true
                      }


                },

                messages:{
                     <%=txtFirstName.UniqueID%>:{
                        required:"Please enter your name"
                     },
                    <%=txtLastName.UniqueID%>:{
                    
                        required: "Please enter your last name"
                    },
                     <%=txtDateofB.UniqueID%>:{
                         required:"Please mention your correct Date of birth"
                     },
                    <%=ddlNationality.UniqueID%>:{
                        required: "What's your religion ?",
                        maxlength: "Can't exceed more then 8 character"
    
                    
                     },
                     <%=txtAddress.UniqueID%>:{
                         required: "Please enter your Home address"
                         
                     },
                     <%=txtofficeadd.UniqueID%>:{
                         required: "Please enter your Office address"
                     },
                    <%=txtofficeno.UniqueID%>:{
                        required: "Please provide office contact number",
                        digitsonly: "Only digits"
                    },
                     <%=txtsal.UniqueID%>:{
                         required: "Please enter your salary",
                         digitsonly: "Only digits"
                     },
                     <%=txtPostalCode.UniqueID%>:{
                         minlength: "Postal code must contain 5 digits",
                         maxlength: "Postal code can't exceed more then 6 digits"
                     },
                      <%=txtCNIC.UniqueID%>:{
                          required: "Please enter your CNIC",
                          digitsonly: " Invalid entry only numbers",
                          minlength: "CNIC should have 13 character"
                      },
                      <%=txtUsername.UniqueID%>:{
                          required: "Please enter Username"
                          
                      },
                     <%=txtPrimaryEmail.UniqueID%>:{
                         required: "Please enter your an email"
                     },
                     <%=txtSecondaryEmail.UniqueID%>:{
                         required: "Please enter your an email"
                     },

                }

            });

        }

        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link href="assets/css/mycss.css" rel="stylesheet" />
    <style>
        
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
    
    <div class="section section-padding top-courses">
        <div class="container">
            <div class="group-title-index">
                <h2 class="center-title">Update Your Information</h2>
                <div class="bottom-title"><i class="bottom-icon icon-icon-04"></i></div>
                <div class="container teacher-course-wrapper">
                    <div class="inner-container">
                        <div class="table-header">
                          <%--  <table class="edu-table-responsive">
                                <thead>
                                    <tr class="heading-table">
                                        <th class="col-3">Insert teacher id to populate his/her all details</th>
                                    </tr>
                                </thead>
                            </table>--%>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row">
                                        <td class="col-2"><span>Your ID</span></td>
                                        <td class="col-2"> <asp:Label ID="txtuser" runat="server"></asp:Label></td>
                                        <td class="col-3"><span></span>
                                            
                                       
                                    </tr>
                                   
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="inner-container">
                        <div class="table-header">
                            <table class="edu-table-responsive">
                                <thead>
                                    <tr class="heading-table">
                                        <th class="col-3">Personal Information</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row">
                                        <td class="col-3"><span>First Name</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtFirstName"></asp:TextBox></td>
                                       <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Last Name</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtLastName"></asp:TextBox></td>
                                       <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Date Of Birth</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtDateofB" ></asp:TextBox></td>
                                       <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Nationality</span></td>
                                        <td class="col-2"><asp:DropDownList Enabled="false" runat="server" ID="ddlNationality"><asp:ListItem>Pakistan</asp:ListItem></asp:DropDownList></td>
                                       <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Gender</span></td>
                                        <td class="col-2"><asp:RadioButton runat="server" ID="rbtnMale" Text="Male" GroupName="gender"  /><asp:RadioButton runat="server" ID="rbtnFemale" Text="Female" GroupName="gender"/></td>
                                       <td class="col-3"></td>
                                    </tr>
                                    
                                    <tr class="table-row">
                                        <td class="col-3"><span>Religion</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtReligion"></asp:TextBox></td>
                                       <td class="col-3"></td>
                                    </tr>

                                    <tr class="table-row">
                                        <td class="col-3"><span>Phone</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtPhone"></asp:TextBox></td>
                                       <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Address</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtAddress"></asp:TextBox></td>
                                       <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Office Address</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtofficeadd"></asp:TextBox></td>
                                       <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Office NO</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtofficeno"></asp:TextBox></td>
                                       <td class="col-3"></td>
                                    </tr>
                                  
                                    <tr class="table-row">
                                        <td class="col-3"><span>Designation</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtdesig"></asp:TextBox></td>
                                       <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Salary</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtsal"></asp:TextBox></td>
                                       <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>City</span></td>
                                        <td class="col-2"><asp:DropDownList runat="server" ID="ddlCity" ></asp:DropDownList>
                                        </td>
                                     <tr class="table-row">
                                        <td class="col-3"><span>Country</span></td>
                                        <td class="col-2"><asp:DropDownList runat="server" ID="ddlCountry" ></asp:DropDownList>
                                        </td>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Postal Code</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtPostalCode"></asp:TextBox></td>
                                       <td class="col-3"></td>
                                    </tr>
                                    
                                     <tr class="table-row">
                                        <td class="col-3"><span>CNIC</span></td>
                                        <td class="col-2"><asp:TextBox runat="server"  ID="txtCNIC"></asp:TextBox></td>
                                       <td class="col-3"></td>
                                    </tr>
                                  
                                   
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="inner-container">
                        <div class="table-header">
                            <table class="edu-table-responsive">
                                <thead>
                                    <tr class="heading-table">
                                        <th class="col-3">Authentication Information</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                <tr class="table-row" title="hide">
                                        <td class="col-3" ><span>authorized ID</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtautho"></asp:TextBox></td>
                                       <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Username</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtUsername"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    
                                    <tr class="table-row">
                                        <td class="col-3"><span>Primary Email Address</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtPrimaryEmail" TextMode="Email"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    
                                    
                                    <tr class="table-row">
                                        <td class="col-3"><span>Secondary Email Address</span></td>
                                        <td class="col-2"><asp:TextBox ReadOnly="True" runat="server" ID="txtSecondaryEmail"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>

                                    <tr class="table-row">
                                        <td class="col-3"></td>
                                        <td class="col-3"><span>
                                            <asp:Button ID="Button1" Text="Update Information" runat="server" ForeColor="Black" OnClick="Button1_Click"  /></span></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                     <div class="inner-container">
                        
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row" title="hide">
                                        <td class="col-3" ><span>General Details ID</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtGenealID" ReadOnly="true"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    
                                    <tr class="table-row" title="hide">
                                        <td class="col-3"><span>Location ID</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtLocationID" ReadOnly="true" ></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    
                                    <tr class="table-row" title="hide">
                                        <td class="col-3"><span>Date Of Birth ID</span></td>
                                        <td class="col-2"><asp:TextBox runat="server" ID="txtDOB"  ></asp:TextBox></td>
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
