<%@ Page Title="" Language="C#" MasterPageFile="~/Register.Master" AutoEventWireup="true" CodeBehind="ParentRegistration.aspx.cs" Inherits="FinalTemplate.Parent_Registration" %>
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
           $.validator.addMethod( "digitsonly", function( value, element ) {
               return this.optional( element ) || /^[0-9]+$/i.test( value );
           }, "Numbers only please" );
           $(document).ready(function () {
              
               $("#form1").validate({
                   
                   rules: {
                       <%=name.UniqueID%>:{
                           required: true,
                           lettersonly: true
                       },
                       <%=lname.UniqueID%>:{
                           required:true,
                           lettersonly:true
                       },
                       <%=contact1.UniqueID%>:{
                           required:true,
                           phone:true
                       },
                       <%=nic.UniqueID%>:{
                           required:true,
                           digitsonly:true,
                           minlength:13
                        
                       },
                       <%=post.UniqueID%>:{
                           required:true,
                           lettersonly:true

                       },
                       <%=salary.UniqueID%>:{
                           required:true,
                           digitsonly:true
                       },
                       <%=officeadd.UniqueID%>:{
                       required:true
                       },
                         <%=contact2.UniqueID%>:{
                             required:true,
                             digitsonly:true
                         }

                      
                       
                      
                       },

                   messages: {
                      <%=name.UniqueID%>: {
                           required: "Please enter your name"

                      },
                         <%=nic.UniqueID%>:{
                             required:"Please enter your CNIC",
                             digitsonly:" Invalid entry only numbers",
                             minlength:"CNIC should have 13 character"
                         },
                         <%=salary.UniqueID%>:{
                             required:"Please enter your salary",
                             digitsonly:"Only digits"
                         },
                         <%=officeadd.UniqueID%>:{
                             required:"Please provide your office address"
                         },
                        <%=contact2.UniqueID%>:{
                            required:"Provide office contact number",
                            digitsonly:"Only digits"
                        }
                     
                   }
               });
           });

    </script> 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="RegisterPlaceHolder1" runat="server">

    <link href="assets/css/mycss.css" rel="stylesheet" />
    <style>
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
    <div class="page-register rlp">
        <div class="container">
            <div id="RegistrationSchoolWidthFix" class="register-wrapper rlp-wrapper reg-sk ">
                
                    <div class="register-table rlp-table">
                    <!-- PRICING-->
                    <div class="section pricing">
                        <div class="container">                   
                            <div class="row">
                                <div class="pricing-wrapper">
                                    <div class="col-sm-4">
                                        <div class="pricing-widget">
                                            <div class="pricing-header">
                                                
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="pricing-widget main active ">
                                            <div class="pricing-header">
                                                
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="pricing-widget">
                                            <div class="pricing-header">
                                                
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="section pricing">
                        <div class="container">
                            <div class="group-title-index">
                                <br />
                                <h2 class="center-title">Parents Detail's</h2>                                                            
                            </div>
                            <div class="row">
                                <div class="pricing-wrapper">
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
                                        Contact No <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="contact1" CausesValidation="true" CssClass="form-control  form-input" runat="server"></asp:TextBox>

                                </div>
                                <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                       CNIC NO <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="nic" CssClass="form-control  form-input" runat="server"></asp:TextBox>

                                </div>
                                   <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                       Post Designation <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="post" CssClass="form-control  form-input" runat="server"></asp:TextBox>

                                </div>
                                   <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                       Salary Per Anum <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="salary" CssClass="form-control  form-input" runat="server"></asp:TextBox>

                                </div>
                                     <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                         Office address <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="officeadd" CssClass="form-control  form-input" runat="server"></asp:TextBox>


                                </div>
                                     <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                    Office Contact No <span class="highlight">*<br />
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
                                  <%--   &nbsp; &nbsp;&nbsp;    <asp:RadioButton ID="RadioButton1" runat="server" Text="Male" />
                                        &nbsp;&nbsp;   <asp:RadioButton ID="RadioButton2" runat="server" Text="Female" />--%>
                                          <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Text="Male &nbsp &nbsp " Value="Male"></asp:ListItem> 
                                               <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                             </asp:RadioButtonList>
     
                                </div>
                                <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                        Date of birth <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="dob" CssClass="form-control  form-input"  placeholder="dd/mm/yyyy"  runat="server"></asp:TextBox>

                            </div>
                            <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                        Nationality <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="nation" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                

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
                                     Home Address <span class="highlight">*<br />
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
                                    <asp:TextBox ID="country" CssClass="form-control  form-input" Width="200px" runat="server" Text="Pakistan" OnTextChanged="country_TextChanged"></asp:TextBox>

                            </div>
                                  
                                        
                                <br />
                             <h4>Upload your photo:</h4>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            
                            


                                </div>
                            </div>                           
                        </div>
                    </div>
                    <div class="section pricing">
                        <div class="container">
                            <div class="group-title-index">                                
                                <h2 class="center-title">we need your authentication details</h2>                                
                            </div>
                            <div class="row">
                                <div class="pricing-wrapper">
                                   <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                        Username <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="user" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                      </div>
                                 <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                        Acccount pin <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="accountp" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                      </div>
                                 <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                        Password <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="pass" CssClass="form-control  form-input" TextMode="Password" runat="server"></asp:TextBox>
                                     </div>
                                      <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                        Re-Password <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="repass" CssClass="form-control  form-input" TextMode="Password" runat="server"></asp:TextBox>
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
                                  
                                </div>
                                                    <div class="register-submit">
                            <button type="submit"   class="btn btn-register btn-green">
                                <span>
                                    <asp:Button ID="Button1" runat="server" Text="Submit" Style="background-color: transparent" BorderStyle="None" /></span></button>
                     </div> 
                            </div>                            
                        </div>
                    </div>

                    </div>
               
                
            </div>          
            </div>
</asp:Content>