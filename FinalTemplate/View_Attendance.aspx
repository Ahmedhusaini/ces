<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="view_attendance.aspx.cs" Inherits="FinalTemplate.view_attendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TeacherHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TeacherPlaceHolder1" runat="server">
        <div class="search-input">
                        <div class="container">
                            <div class="search-input-wrapper">
                              
                                       <asp:DropDownList ID="DropDownList1" runat="server" class="sbHolder"  DataSourceID="class" DataTextField="class" DataValueField="class_id"></asp:DropDownList>
                                       <asp:SqlDataSource ID="class" runat="server" ConnectionString="<%$ ConnectionStrings:abc %>" SelectCommand="SELECT [class_id], [class] FROM [tbl_class]">
                                       </asp:SqlDataSource>
                                       <asp:DropDownList ID="DropDownList2" runat="server" class="sbHolder" DataSourceID="section" DataTextField="section" DataValueField="section_id"></asp:DropDownList>
                                       <asp:SqlDataSource ID="section" runat="server" ConnectionString="<%$ ConnectionStrings:abc %>" SelectCommand="SELECT [section_id], [section] FROM [tbl_section]">
                                       </asp:SqlDataSource>
                                       <asp:DropDownList ID="DropDownList3" runat="server" class="sbHolder" DataSourceID="month" DataTextField="month" DataValueField="month_id"></asp:DropDownList>
                                       <asp:SqlDataSource ID="month" runat="server" ConnectionString="<%$ ConnectionStrings:abc %>" SelectCommand="SELECT [month_id], [month] FROM [tbl_month]">
                                       </asp:SqlDataSource>
                                       <asp:DropDownList ID="DropDownList4" runat="server" class="sbHolder" DataSourceID="day" DataTextField="day" DataValueField="day_id"></asp:DropDownList>         
                                       <asp:SqlDataSource ID="day" runat="server" ConnectionString="<%$ ConnectionStrings:abc %>" SelectCommand="SELECT [day_id], [day] FROM [tbl_day]"></asp:SqlDataSource>

                                    <span>
                                               
                                                </span>
                                <button type="submit" class="form-submit btn btn-blue">
                                     <asp:Button ID="Button1" runat="server" Text="SEARCH" Style="background-color: transparent" BorderStyle="None" OnClick="Button1_Click" />
                                    </button>

                           
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
            <asp:BoundField DataField="std_attend_id" HeaderText="ID" SortExpression="std_attend_id" ReadOnly="True" />
            <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
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
                   
    <asp:SqlDataSource ID="student_attendance" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT [std_attend_id], [username], [remarks] FROM [Studentattendance] WHERE (([class_id] = @class_id) AND ([section_id] = @section_id) AND ([month_id] = @month_id) AND ([day_id] = @day_id))">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="class_id" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownList2" Name="section_id" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownList3" Name="month_id" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownList4" Name="day_id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
       
    </asp:SqlDataSource>
                                                      
                                                    </div>
                                                
                            </div>
                        </div>
                    </div>
                </div>

</asp:Content>
