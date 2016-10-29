<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="Teacherprofile.aspx.cs" Inherits="FinalTemplate.Teacherprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TeacherHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TeacherPlaceHolder1" runat="server">
    <div class="section section-padding profile-teacher">
                    <div class="container">
                         <div class="profile-teacher-wrapper">
                            <div class="teacher-info">
                                <div class="staff-item2 customize">
                                    <div class="staff-item-wrapper">
                                        <div class="staff-info"><a href="#" class="staff-avatar">
                                            <%--<img src="assets/images/people-avatar-4.jpg" alt="" class="img-responsive"/>--%>
                                           
                                         
                                           
                                            
                                             
                                                                </a><a href="#" class="staff-name">
                                                                   </a></div>
                                    </div>
                                   </div>
                                <div class="teacher-des">
                                    <div class="title"> <h1><asp:Label ID="name" runat="server" Text="name"></asp:Label></h1></div>
                                    <div class="subtitle">
                                        <asp:Label ID="usertype" runat="server" Text="usertype"></asp:Label></div>
                                    <div class="content"><p class="content-detail"></p>
                                        <ul class="detail-list">
                                        <li><asp:Label ID="Gender" runat="server" Text="Label"></asp:Label></li>
                                        <li><asp:Label ID="Nationality" runat="server" Text="Label"></asp:Label></li>
                                        <li><asp:Label ID="Religion" runat="server" Text="Label"></asp:Label></li>
                                        <li><asp:Label ID="Email" runat="server" Text="Label"></asp:Label></li>
                                        <li><asp:Label ID="Email2" runat="server" Text="Label"></asp:Label></li>
                                        <li><asp:Label ID="Phone" runat="server" Text="Label"></asp:Label></li>
                                        <li><asp:Label ID="Address" runat="server" Text="Label"></asp:Label></li>




                                        </ul>
                                    </div>
                                </div>
                            </div>                      
                        </div>
                    </div>
                </div>
</asp:Content>
