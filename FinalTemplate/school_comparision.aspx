<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="school_comparision.aspx.cs" Inherits="FinalTemplate.school_comparision" %>
<asp:Content ID="Content1" ContentPlaceHolderID="UserHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="UserContentPlaceHolder" runat="server">
        <br />
    <div>

       <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
       </asp:DropDownList>
       
         <asp:TextBox ID="school_name" runat="server"></asp:TextBox>
        <asp:Label runat="server" ID="new1" ForeColor="Red"></asp:Label>

        <asp:Button Text="click" runat="server" id="comp" OnClick="comp_Click"/>
    </div>
    <br />
</asp:Content>
