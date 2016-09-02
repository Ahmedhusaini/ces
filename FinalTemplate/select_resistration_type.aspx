<%@ Page Title="Registration Type" Language="C#" MasterPageFile="~/Register.Master" AutoEventWireup="true" CodeBehind="select_resistration_type.aspx.cs" Inherits="FinalTemplate.select_resistration_type" %>
<asp:Content ID="Content1" ContentPlaceHolderID="RegisterHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RegisterPlaceHolder1" runat="server">
    <div class="page-register rlp">
                     <div class="container">
                         <div class="register-wrapper rlp-wrapper" style="opacity: 0.9; padding: 6px ">
                <div class="register-table rlp-table">
                            <div class="register-table rlp-table"><h1 class="table-hover">REGISTRATION</h1><h3 class="table-hover">-- Who You Are --</h3><br />
                               <div style="width:150%">  
                                   <div class="row contact-method">
                                       <div class="col-md-4">
                                    <div class="method-item" style=" border-radius: 57px;">
                                <button class="btn btn-green" style="width:200px;height:190px; border-radius: 57px;  "  formaction="ParentRegistration.aspx"><span><h2 class="heading-content">PARENT</h2></span></button>
                                    </div>
                                </div>
                               <div class="col-md-4">
                                    <div class="method-item" style="  border-radius: 57px;">
                                        <button class="btn btn-green" style="width:200px;height:190px; border-radius: 57px;" formaction="Student_Registration.aspx"><span><h2 class="heading-content">STUDENT</h2></span></button>
                                    </div>
                                </div>
                                       <div class="col-md-4" style="left:-295px;top:310px;">
                                    <div class="method-item" style="  border-radius: 57px;">
                                       <button  class="btn btn-green" style="width:200px;height:190px; border-radius: 57px;" formaction="TeacherRegistration.aspx"><span><h2 class="heading-content">TEACHER</h2></span></button>
                                    </div>
                                </div>
                                       <div class="col-md-4" style="top:17px;">
                                    <div class="method-item" style="  border-radius: 57px;">
                                       <button  class="btn btn-green" style="width:200px;height:190px; border-radius: 57px;" formaction="School_Rgistration.aspx"><span><h2 class="heading-content">SCHOOL</h2></span></button>
                                    </div>
                                </div>
                                
                                 </div>
                               </div>
                                </div>
                        </div>
                             </div>
                         </div>
         </div>
</asp:Content>
