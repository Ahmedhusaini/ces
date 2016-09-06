﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="FinalTemplate.Attendance" %>
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
                                                  
    <asp:GridView ID="GridView1" class="edu-table-responsive" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataSourceID="student_attendance" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="Std_id" HeaderText="Student Id" SortExpression="Std_id" />
            <asp:BoundField DataField="username" HeaderText="Student Name" SortExpression="username" />
            <asp:BoundField DataField="remarks" HeaderText="Remarks" SortExpression="remarks" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />
    </asp:GridView>                     
                   
    <asp:SqlDataSource ID="student_attendance" runat="server" ConnectionString="<%$ ConnectionStrings:abc %>" SelectCommand="SELECT [Std_id], [username], [remarks] FROM [student_attendance]"></asp:SqlDataSource>
                   
    <div class="section attendance">
                    <div class="container">
                        <div class="attendance-logo-wrapper">
                            <div class="attendance-logo-content">
           
                                                    <div class="table-body">
                                                        <table class="Attendance-table" id="datatable">

                                                         
                                                                <thead>
                                                            <tr class="heading-table">
                                                                <th class="col-1">Student ID</th>
                                                                <th class="col-2">Student Rollno</th>
                                                                <th class="col-3">Student Name</th>
                                                                <th class="col-4">Remarks</th>
                                                            </tr>
                                                            </thead>
                                                               <tbody>
                                                            <tr class="table-row">
                                                                <td class="col-1"><a href="#"><span>1</span></a></td>
                                                                <td class="col-2"><span>96</span></td>
                                                                <td class="col-3"><span>Ahmed</span></td>
                                                                <td class="col-4">
                                                                    <asp:CheckBox ID="CheckBox1" runat="server" />PRESENT
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox2" runat="server" />ABSENT
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox3" runat="server" />LEAVE
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox4" runat="server" />LATE
                                                                </td>                                                                                                                               
                                                            </tr>      
                                                                <tr class="table-row">
                                                                <td class="col-1"><a href="#"><span>2</span></a></td>
                                                                <td class="col-2"><span>101</span></td>
                                                                <td class="col-3"><span>Siddique</span></td>
                                                                <td class="col-4">
                                                                    <asp:CheckBox ID="CheckBox5" runat="server" />PRESENT
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox6" runat="server" />ABSENT
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox7" runat="server" />LEAVE
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox8" runat="server" />LATE
                                                                </td>                                                                                                                               
                                                            </tr>     
                                                                 <tr class="table-row">
                                                                <td class="col-1"><a href="#"><span>3</span></a></td>
                                                                <td class="col-2"><span>106</span></td>
                                                                <td class="col-3"><span>Shahwaiz</span></td>
                                                                <td class="col-4">
                                                                    <asp:CheckBox ID="CheckBox9" runat="server" />PRESENT
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox10" runat="server" />ABSENT
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox11" runat="server" />LEAVE
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox12" runat="server" />LATE
                                                                </td> 
                                                                     </tr> 
                                                                      <tr class="table-row">
                                                                <td class="col-1"><a href="#"><span>4</span></a></td>
                                                                <td class="col-2"><span>120</span></td>
                                                                <td class="col-3"><span>Jahangeer</span></td>
                                                                <td class="col-4">
                                                                    <asp:CheckBox ID="CheckBox13" runat="server" />PRESENT
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox14" runat="server" />ABSENT
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox15" runat="server" />LEAVE
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox16" runat="server" />LATE
                                                                </td>                                                                                                                               
                                                            </tr>     
                                                                      <tr class="table-row">
                                                                <td class="col-1"><a href="#"><span>5</span></a></td>
                                                                <td class="col-2"><span>439</span></td>
                                                                <td class="col-3"><span>Shehreyar</span></td>
                                                                <td class="col-4">
                                                                    <asp:CheckBox ID="CheckBox17" runat="server" />PRESENT
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox18" runat="server" />ABSENT
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox19" runat="server" />LEAVE
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox20" runat="server" />LATE
                                                                </td>                                                                                                                               
                                                            </tr>                                                                                                                                  
                                                                                                                                                                    
                                                          </tbody>
                                                        </table>
                                                    </div>
                                                
                            </div>
                        </div>
                    </div>
                </div>
              <div class="container">
                        <div class="group-button">    
                            <button class="btn btn-transition-2"><span>Submit</span></button>
                            <button class="btn btn-transition-2"><span>Clear</span></button>
                                    </div>
                    </div>
</asp:Content>
