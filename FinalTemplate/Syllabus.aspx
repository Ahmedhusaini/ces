<%@ Page Title="Home > Syllabus" Language="C#" MasterPageFile="~/updatepasswordpanel.Master" AutoEventWireup="true" CodeBehind="Syllabus.aspx.cs" Inherits="FinalTemplate.Syllabus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section background-opacity page-title set-height-top">
        <div class="container">
            <div class="page-title-wrapper">
                <!--.page-title-content-->
                <h2 class="captions">Syllabus</h2>
            </div>
        </div>
    </div>
    <br />
    <div class="search-input">
        <div class="container">
            <div class="search-input-wrapper">
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="sbHolder" DataSourceID="class_DataSource" DataTextField="class" DataValueField="class">
                </asp:DropDownList>
                <asp:SqlDataSource ID="class_DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:cesConnectionString2 %>" SelectCommand="SELECT [class] FROM [tbl_class]"></asp:SqlDataSource>
                <div>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="sbHolder" DataSourceID="sec_DataSource" DataTextField="section" DataValueField="section">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sec_DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:cesConnectionString2 %>" SelectCommand="SELECT [section] FROM [tbl_section]"></asp:SqlDataSource>
                </div>
                <div>
                    <asp:DropDownList ID="DropDownList3" CssClass="sbHolder" runat="server" DataSourceID="SqlDataSource1" DataTextField="school_name" DataValueField="school_name"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cesConnectionString2 %>" SelectCommand="SELECT [school_name] FROM [tbl_school]"></asp:SqlDataSource>
                </div>
                <div> </div>
                <button type="submit" class="form-submit btn btn-blue"><span>Search</span></button>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
