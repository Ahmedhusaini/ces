<%@ Page Title="Student Profile" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="StudentProfile.aspx.cs" Inherits="FinalTemplate.StudentProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TeacherHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TeacherPlaceHolder1" runat="server">
    <div class="section section-padding profile-teacher">
        <div class="container">
            <div class="profile-teacher-wrapper">
                <asp:GridView ID="GridView1" class="edu-table-responsive" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" DataKeyNames="Std_id">
                    <Columns>
                        <asp:BoundField DataField="Std_id" HeaderText="Student id" ReadOnly="True" SortExpression="Std_id" />
                        <asp:BoundField DataField="firstname" HeaderText="firstname" SortExpression="firstname" />
                        <asp:BoundField DataField="lastname" HeaderText="lastname" SortExpression="lastname" />
                        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                        <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                        <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                        <asp:BoundField DataField="primary_email" HeaderText="primary_email" SortExpression="primary_email" />
                      
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
               
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT [firstname], [lastname], [Gender], [phone], [address], [primary_email], [Std_id] FROM [View_StudentGeneralInformation]"></asp:SqlDataSource>
               
            </div>
        </div>
    </div>
    <br />
</asp:Content>
