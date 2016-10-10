<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="TeacherUpload.aspx.cs" Inherits="FinalTemplate.TeacherUpload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TeacherHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TeacherPlaceHolder1" runat="server">
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <br/>
    <asp:Button ID="Button1" runat="server" Text="UPLOAD FILE" OnClick="Button1_Click" />
    
    <asp:Label ID="Label1" runat="server"></asp:Label>

</asp:Content>
