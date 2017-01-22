<%@ Page Title="Download | HomeWork" Language="C#" MasterPageFile="~/studentpanel.Master" AutoEventWireup="true" CodeBehind="Download_Homework.aspx.cs" Inherits="FinalTemplate.Download_Homework" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="section background-opacity page-title set-height-top">
        <div class="container">
            <div class="page-title-wrapper">
                <!--.page-title-content-->
                <h2 class="captions">Download Your Home Work</h2>
            </div>
        </div>
    </div>
    <br />
    <asp:Label ID="Label1"  runat="server" Text="Label" Visible="False"></asp:Label>    
    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>    
    <asp:Label ID="Label3" runat="server"  Text="Label" Visible="False"></asp:Label>
    <asp:GridView ID="GridView4" class="edu-table-responsive" runat="server" DataKeyNames="lec_id" CellPadding="4" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="DOWNLOAD">
                <ItemTemplate>
                            <%-- <asp:LinkButton ID="LinkButton1" OnClick="OpenDocument" runat="server" Text='<%# Eval("lectures") %>' Font-Size="Large" Font-Bold="True" Font-Names="'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif"></asp:LinkButton>--%>
                            <%--<asp:Button CssClass="btn btn-green" Height="70%" Width="30%" ID="Button1"  runat="server" OnClick="OpenDocument" Text='<%# Eval("lectures") %>' />--%>
                            <asp:LinkButton ID="LinkButton1" ForeColor="#86bc42" Font-Bold="true" runat="server" CommandArgument='<%# Eval("fullpath") %>' Text='<%# Eval("fullpath") %>' OnClick="OpenDocument"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#86bc42" Font-Bold="True" ForeColor="#86bc42" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <br />
</asp:Content>
