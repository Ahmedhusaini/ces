<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="mark_attendance.aspx.cs" Inherits="FinalTemplate.mark_attendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TeacherHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TeacherPlaceHolder1" runat="server">
        <div class="search-input">
                        <div class="container">
                            <div class="search-input-wrapper">
                              
                                   
                                     <asp:DropDownList ID="DropDownList1" runat="server" CssClass="sbHolder" DataSourceID="class_DataSource" DataTextField="class" DataValueField="class">
                                      
                                    </asp:DropDownList>                                                             
                                     <asp:SqlDataSource ID="class_DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:abc %>" SelectCommand="SELECT [class] FROM [tbl_class]"></asp:SqlDataSource>
                              <div >
                                 <asp:DropDownList ID="DropDownList2" runat="server" CssClass="sbHolder" DataSourceID="sec_DataSource" DataTextField="section" DataValueField="section">
                                       
                                    </asp:DropDownList>

                                  <asp:SqlDataSource ID="sec_DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:abc %>" SelectCommand="SELECT [section] FROM [tbl_section]"></asp:SqlDataSource>

                              </div>
                                                                                       
                                    <button type="submit" class="form-submit btn btn-blue"><span>Search</span></button>
                                    <div class="clearfix"></div>
                               
                            </div>
                        </div>
                    </div>  

    </asp:Content>
