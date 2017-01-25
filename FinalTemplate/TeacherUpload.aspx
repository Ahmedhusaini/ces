<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="TeacherUpload.aspx.cs" Inherits="FinalTemplate.TeacherUpload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TeacherHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TeacherPlaceHolder1" runat="server">

                
                        <div class="underline">UPLOAD LECTURE </div>
                        <div class="course-table">
                            <div class="outer-container">
                                <div class="inner-container">
                                    <div class="table-body">
      <table class="edu-table-responsive table-hover">
            <thead>
                <tr class="heading-table">
                    <th class="col-1">
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <th class="col-2">
    <asp:Button ID="Button1" runat="server" Text="UPLOAD LECTURE" OnClick="Button1_Click" />
         </tr>
                </thead>
       </table>

                                    </div></div></div></div>
    &nbsp;<asp:GridView ID="GridView1" class="edu-table-responsive" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="lec_id" GridLines="Horizontal">
        <Columns>
            <asp:TemplateField HeaderText="Lectures">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandArgument='<%#Eval("fullpath") %>' runat="server" Text='<%# Eval("fullpath") %>' OnClick="OpenDocument"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
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
    
</asp:Content>
