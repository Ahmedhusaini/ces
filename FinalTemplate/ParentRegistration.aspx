<%@ Page Title="" Language="C#" MasterPageFile="~/Register.Master" AutoEventWireup="true" CodeBehind="ParentRegistration.aspx.cs" Inherits="FinalTemplate.ParentRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="RegisterHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RegisterPlaceHolder1" runat="server">

    <link href="assets/css/mycss.css" rel="stylesheet" />
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

                    <div class="register-title rlp-title">create your account and join with us!</div>
                    <h3>Parent Detail's</h3>
                   
                    <asp:Panel ID="Panel1" runat="server">

                   
                        <div class="register-form bg-w-form rlp-form">          
                                <div class="col-md-6">

                                    <label for="regname" class="control-label form-label">
                                        NAME <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!--p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="TextBox1" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                        Last Name <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="name" CssClass="form-control  form-input " runat="server"></asp:TextBox>

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
                                    <asp:TextBox ID="gardian" CssClass="form-control  form-input" runat="server"></asp:TextBox>


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
                                        City <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="city" CssClass="form-control  form-input" Width="200px" runat="server"></asp:TextBox>

                            </div>
                                <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                        Country  <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="country" CssClass="form-control  form-input" Width="200px" runat="server"></asp:TextBox>

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
                                        
                                <br />
                            <h4>Upload your photo:</h4>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            

                                <h3 style="text-align:center">Authorization Detail's</h3>
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
                        <div class="register-submit">
                            <button type="submit" onclick="window.location.href='index.html'" class="btn btn-register btn-green">
                                <span>
                                    <asp:Button ID="Button1" runat="server" Text="Submit" Style="background-color: transparent" BorderStyle="None" /></span></button>
                     </div>          
                 </asp:Panel>                
                    </div>            
                </div>          
            </div>
        </div>  
</asp:Content>