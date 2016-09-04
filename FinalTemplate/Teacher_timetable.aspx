<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="Teacher_timetable.aspx.cs" Inherits="FinalTemplate.Teacher_timetable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TeacherHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TeacherPlaceHolder1" runat="server">

    <div class="table-body">
        <asp:TextBox ID="TextBox1" CssClass="form-control  form-input" runat="server" OnTextChanged="TextBox1_TextChanged" Width="540px"></asp:TextBox>
           <button type="submit"  class="btn btn-register btn-green">
        <asp:Button ID="Button1" runat="server" Text="SEARCH" Style="background-color: transparent" BorderStyle="None" OnClick="Button1_Click" /></button>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="timetable">
            <Columns>
                <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                <asp:BoundField DataField="day" HeaderText="day" SortExpression="day" />
                <asp:BoundField DataField="school_name" HeaderText="school_name" SortExpression="school_name" />
                <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
                <asp:BoundField DataField="section" HeaderText="section" SortExpression="section" />
                <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject" />
                <asp:BoundField DataField="starting_time" HeaderText="starting_time" SortExpression="starting_time" />
                <asp:BoundField DataField="ending_time" HeaderText="ending_time" SortExpression="ending_time" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="timetable" runat="server" ConnectionString="<%$ ConnectionStrings:abc %>" SelectCommand="SELECT [username], [day], [school_name], [class], [section], [subject], [starting_time], [ending_time] FROM [Teacher_timetable]">
        </asp:SqlDataSource>
    </div>
</asp:Content>
