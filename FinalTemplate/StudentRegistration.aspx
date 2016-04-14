<%@ Page Title="" Language="C#" MasterPageFile="~/Register.Master" AutoEventWireup="true" CodeBehind="StudentRegistration.aspx.cs" Inherits="FinalTemplate.StudentRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="RegisterHeadPlaceHolder" runat="server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RegisterPlaceHolder1" runat="server">
    
    <div class="page-register rlp" >
                    <div class="container">
                        <div  class="register-wrapper rlp-wrapper">
                            <div class="register-table rlp-table"><a href="index.html"><img src="assets/images/logo-color-1.png" alt="" class="login"/></a>
                                
                                <div class="register-title rlp-title">create your account and join with us!</div>
                                <asp:Panel ID="Panel1" runat="server">
                                <div class="register-form bg-w-form rlp-form">
                                    
                                    <div class="row">
                                        <div class="col-md-6"><label for="regname" class="control-label form-label">NAME <span class="highlight">*<br />
                                            </span></label><!--p.help-block Warning !-->
                                            <br />
                                            <asp:TextBox ID="TextBox1" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                        </div>
                                       <div class="col-md-6"><label for="regname" class="control-label form-label">Last Name <span class="highlight">*<br />
                                           </span></label><!-- p.help-block Warning !-->
                                           <br />   
                                            <asp:TextBox ID="TextBox2" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                           
                                            </div>
                                      <div class="col-md-6"><label for="regname" class="control-label form-label">Email <span class="highlight">*<br />
                                           </span></label><!-- p.help-block Warning !-->
                                           <br />   
                                            <asp:TextBox ID="TextBox3" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                           
                                            </div>
                                      <div class="col-md-6"><label for="regname" class="control-label form-label"> Contact No <span class="highlight">*<br />
                                           </span></label><!-- p.help-block Warning !-->
                                           <br />   
                                            <asp:TextBox ID="TextBox4" CssClass="form-control  form-input" runat="server"></asp:TextBox>
                                           
                                            </div>                     
                                    </div>
                                    
                                </div>
                                
                                 
                                <div class="register-submit">
                                    <button type="submit" onclick="window.location.href='index.html'" class="btn btn-register btn-green"><span>create account</span></button>
                                </div>
                                    </asp:Panel>
                                
                                
                                    
                            </div>
                            
                        </div>
                    </div>
                </div>
</asp:Content>
