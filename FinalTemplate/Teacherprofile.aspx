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
                                        <div class="staff-info"><a href="#" class="staff-avatar"><%--<img src="assets/images/people-avatar-4.jpg" alt="" class="img-responsive"/>--%>
                                            <asp:Button ID="Button1" runat="server" Text="UPLOAD" OnClick="Button1_Click" />
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                            <asp:Label ID="Label1"  runat="server"  Text="Lbl_status" ></asp:Label>

                                                                </a><a href="#" class="staff-name">barry join</a></div>
                                    </div>
                                   </div>
                                <div class="teacher-des">
                                    <div class="title">Barry Join</div>
                                    <div class="subtitle">Vice Head Teacher</div>
                                    <div class="content"><p class="content-detail">Dalmatian hello amazing the rmore flung as thanks a manta dealt to under emu some the and one baldbe dear sobbingly save and spitefully less. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believabl.</p>

                                        <p class="content-detail">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu tellus ipsum. Nunc maximus sapien ac dui vulputate tincidunt. Morbi luctus nisi vel suscipit volutpat. Donec vitae auctor nisl. Ut malesuada felis in erat rutrum ultrices.</p>
                                        <ul class="detail-list">
                                            <li>Fusce iaculis ornare nunc rutrum ornare.</li>
                                            <li>Proin ut placerat enim, vel venenatis urna.</li>
                                            <li>Phasellus sed diam tincidunt mauris malesuada mattis et in nisl.</li>
                                            <li>Quisque massa eros, molestie at mi eget, aliquam tristique eros.</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>                      
                        </div>
                    </div>
                </div>
</asp:Content>
