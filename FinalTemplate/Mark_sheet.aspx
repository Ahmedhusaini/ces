<%@ Page Title="Home > Mark Sheet" Language="C#" MasterPageFile="~/updatepasswordpanel.Master" AutoEventWireup="true" CodeBehind="Mark_sheet.aspx.cs" Inherits="FinalTemplate.Mark_sheet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section background-opacity page-title set-height-top">
        <div class="container">
            <div class="page-title-wrapper">
                <!--.page-title-content-->
                <h2 class="captions">Mark Sheet</h2>
            </div>
        </div>
    </div>
    <br />
    <div class="search-input">
        <div class="container">
            <div class="search-input-wrapper">
                <div>
                <asp:TextBox ID="TextBox2" placeholder="Enter Your ID" CssClass="sbHolder" runat="server">
                </asp:TextBox>
                    </div>
                <div>
                <asp:TextBox ID="TextBox1" placeholder="enter your teacher name" CssClass="form-control  form-input" Height="40px" Width="600px" runat="server">
                </asp:TextBox>
                </div>
                <button type="submit" class="form-submit btn btn-blue"><span>Result</span></button>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
