<%@ Page Title="Student Profile" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="StudentProfile.aspx.cs" Inherits="FinalTemplate.StudentProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TeacherHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TeacherPlaceHolder1" runat="server">
    <div class="section section-padding profile-teacher">
        <div class="container">
            <div class="profile-teacher-wrapper">
                <asp:GridView ID="GridView1" class="edu-table-responsive" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                    <Columns>
                        <asp:BoundField DataField="firstname" HeaderText="FIRST NAME" SortExpression="firstname" />
                        <asp:BoundField DataField="lastname" HeaderText="LAST NAME" SortExpression="lastname" />
                        <asp:BoundField DataField="Gender" HeaderText="GENDER" SortExpression="Gender" />
                        <asp:BoundField DataField="phone" HeaderText="PHONE NO" SortExpression="phone" />
                        <asp:BoundField DataField="address" HeaderText="ADDRESS" SortExpression="address" />
                        <asp:BoundField DataField="primary_email" HeaderText="EMAIL ADDRESS" SortExpression="primary_email" />
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
               
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT [firstname], [lastname], [Gender], [phone], [address], [primary_email] FROM [View_StudentGeneralInformation]"></asp:SqlDataSource>
               
            </div>
        </div>
    </div>
    <br />
</asp:Content>
