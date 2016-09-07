<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="FinalTemplate.Attendance" %>
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
                                                  

                   
    <div class="section attendance">
                    <div class="container">
                        <div class="attendance-logo-wrapper">
                            <div class="attendance-logo-content">
           
                                                    <div class="table-body">
                                                            <asp:GridView ID="GridView1" class="edu-table-responsive" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataSourceID="student_attendance" GridLines="Horizontal" DataKeyNames="std_attend_id">
        <Columns>
            <asp:BoundField DataField="std_attend_id" HeaderText="std_attend_id" SortExpression="std_attend_id" ReadOnly="True" />
            <asp:BoundField DataField="remarks" HeaderText="remarks" SortExpression="remarks" />
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
                   
    <asp:SqlDataSource ID="student_attendance" runat="server" ConnectionString="<%$ ConnectionStrings:abc %>" SelectCommand="SELECT [std_attend_id], [remarks] FROM [tbl_student_attendance]"></asp:SqlDataSource>
                                                      
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
