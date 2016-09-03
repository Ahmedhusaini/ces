<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="Teacher_timetable.aspx.cs" Inherits="FinalTemplate.Teacher_timetable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TeacherHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TeacherPlaceHolder1" runat="server">

    <div class="table-body">
        <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="timetable">
            <Columns>
                <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                <asp:BoundField DataField="day" HeaderText="day" SortExpression="day" />
                <asp:BoundField DataField="period_name" HeaderText="period_name" SortExpression="period_name" />
                <asp:BoundField DataField="starting_time" HeaderText="starting_time" SortExpression="starting_time" />
                <asp:BoundField DataField="ending_time" HeaderText="ending_time" SortExpression="ending_time" />
                <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject" />
                <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
                <asp:BoundField DataField="section" HeaderText="section" SortExpression="section" />
                <asp:BoundField DataField="school_name" HeaderText="school_name" SortExpression="school_name" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="timetable" runat="server" ConnectionString="<%$ ConnectionStrings:abc %>" SelectCommand="SELECT [username], [day], [period_name], [starting_time], [ending_time], [subject], [class], [section], [school_name] FROM [Teacher_timetable] WHERE ([username] = @username)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="username" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
