<%@ Page Title="" Language="C#" MasterPageFile="~/Register.Master" AutoEventWireup="true" CodeBehind="SchoolRegistration.aspx.cs" Inherits="FinalTemplate.School_Registration" %>
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
                    <h3>School Detail's</h3>
                   
                    <asp:Panel ID="Panel1" runat="server">

                   
                        <div class="register-form bg-w-form rlp-form">          
                                <div class="col-md-6">

                                    <label for="regname" class="control-label form-label">
                                        School Name <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!--p.help-block Warning !-->
                                    <br />

                                    <asp:TextBox ID="TextBox1" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                        Owner's Name <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="name" CssClass="form-control  form-input " runat="server"></asp:TextBox>

                                </div>
                                <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                       Campus name  <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="cname" CausesValidation="true" CssClass="form-control  form-input" runat="server"></asp:TextBox>

                                </div>
                             <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                       Founded In <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="email" CssClass="form-control  form-input" runat="server"></asp:TextBox>

                                </div>
                          
                                <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                       Email <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="contact" CssClass="form-control  form-input" runat="server"></asp:TextBox>

                                </div>
                             <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                       Contact No <span class="highlight">*<br />
                                        </span>
                                    </label>
                                    <!-- p.help-block Warning !-->
                                    <br />
                                    <asp:TextBox ID="contact2" CssClass="form-control  form-input" runat="server"></asp:TextBox>

                                </div>
                            <br />
                            
                             <h4>Upload a Logo :</h4>
                                <asp:FileUpload ID="FileUpload2" runat="server" />
                                 
                           <br />
                            <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">
                                       Address <span class="highlight">*<br />
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
                                    <asp:TextBox ID="country" CssClass="form-control  form-input" Width="200px" runat="server" Text="Pakistan"></asp:TextBox>

                            </div>
                                 
                                <br />
                                 
                                           </div>                      
                        <div class="register-submit">
                            <button type="submit" onclick="window.location.href='index.html'" class="btn btn-register btn-green">
                                <span>
                                    <asp:Button ID="Button1" runat="server" Text="Submit"Style="background-color: transparent" BorderStyle="None" /></span></button>
                     </div>          
                 </asp:Panel>                
                    </div>            
                </div>          
            </div>
        </div>
</asp:Content>
