<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="Teacher_student_timetable.aspx.cs" Inherits="FinalTemplate.Teacher_student_timetable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TeacherHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TeacherPlaceHolder1" runat="server">
     <div class="search-input">
                        <div class="container">
                            <div class="search-input-wrapper">
                                <asp:DropDownList ID="DropDownList1" runat="server"  class="sbHolder"  DataSourceID="SqlDataSource2" DataTextField="class" DataValueField="Class_id"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"  ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT * FROM [tbl_class]"></asp:SqlDataSource>
                                <asp:DropDownList ID="DropDownList2" runat="server"  class="sbHolder"  DataSourceID="SqlDataSource3" DataTextField="section" DataValueField="Section_id"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT * FROM [tbl_section]"></asp:SqlDataSource>
                                 <button type="submit" class="form-submit btn btn-blue">
                                     <asp:Button ID="Button1" runat="server" Text="SEARCH" Style="background-color: transparent" BorderStyle="None" OnClick="Button1_Click" />
                                    </button>
      <div class="clearfix"></div>
                            </div>
                        </div>
     </div>  
                               
                         
        <div class="table-body">
  
            <asp:GridView ID="GridView1"  class="edu-table-responsive" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                <Columns>
                    <asp:BoundField DataField="day" HeaderText="day" SortExpression="day" />
                    <asp:BoundField DataField="period_1" HeaderText="period_1" SortExpression="period_1" />
                    <asp:BoundField DataField="period_2" HeaderText="period_2" SortExpression="period_2" />
                    <asp:BoundField DataField="period_3" HeaderText="period_3" SortExpression="period_3" />
                    <asp:BoundField DataField="period_4" HeaderText="period_4" SortExpression="period_4" />
                    <asp:BoundField DataField="period_5" HeaderText="period_5" SortExpression="period_5" />
                    <asp:BoundField DataField="period_6" HeaderText="period_6" SortExpression="period_6" />
                    <asp:BoundField DataField="period_7" HeaderText="period_7" SortExpression="period_7" />
                    <asp:BoundField DataField="period_8" HeaderText="period_8" SortExpression="period_8" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT [day], [period_1], [period_2], [period_3], [period_4], [period_5], [period_6], [period_7], [period_8] FROM [view_timetable_1_test] WHERE (([class_id] = @class) AND ([section_id] = @section))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="class" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList2" Name="section" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
    </div>
</asp:Content>
