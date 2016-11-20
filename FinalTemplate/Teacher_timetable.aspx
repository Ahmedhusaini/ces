<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="Teacher_timetable.aspx.cs" Inherits="FinalTemplate.Teacher_timetable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TeacherHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TeacherPlaceHolder1" runat="server">

    <div class="table-body">
        <asp:TextBox ID="TextBox1" CssClass="form-control  form-input" runat="server" OnTextChanged="TextBox1_TextChanged" Width="540px"></asp:TextBox>
           <button type="submit"  class="btn btn-register btn-green">
        <asp:Button ID="Button1" runat="server" Text="SEARCH" Style="background-color: transparent" BorderStyle="None" OnClick="Button1_Click" /></button>
        <asp:GridView ID="GridView1" class="edu-table-responsive"  runat="server" AutoGenerateColumns="False" DataSourceID="timetable" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns >
                <asp:BoundField DataField="username" HeaderText="Teacher" SortExpression="username" />
                <asp:BoundField DataField="day" HeaderText="Day" SortExpression="day" />
                <asp:BoundField DataField="school_name" HeaderText="School Name" SortExpression="school_name" />
                <asp:BoundField DataField="class" HeaderText="Class" SortExpression="class" />
                <asp:BoundField DataField="section" HeaderText="Section" SortExpression="section" />
                <asp:BoundField DataField="subject" HeaderText="Subject" SortExpression="subject" />
                <asp:BoundField DataField="starting_time" HeaderText="Starting Time" SortExpression="starting_time" />
                <asp:BoundField DataField="ending_time" HeaderText="Ending Time" SortExpression="ending_time" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="timetable" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT [username], [day], [school_name], [class], [section], [subject], [starting_time], [ending_time] FROM [Teacher_timetable] WHERE ([username] = @username)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="username" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
