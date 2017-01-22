<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="Teacher_Marksheet.aspx.cs" Inherits="FinalTemplate.Teacher_Marksheet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TeacherHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TeacherPlaceHolder1" runat="server">
       <div class="section teacher-course section-padding">
                    <div class="container teacher-course-wrapper">
                        <div class="underline">Upload Student Marksheet</div>
                        <div class="course-table">
                            <div class="outer-container">
                                <div class="inner-container">
                                    <div class="table-body">
      <table class="edu-table-responsive table-hover">
            <thead>
                <tr class="heading-table">
                     <th class="col-1"><asp:FileUpload ID="FileUpload1" runat="server" /></th>
      <th class="col-2">
                      <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" ForeColor="Black" /></th>
                </tr>
                <tr>
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                </tr>
            </thead>
                <tr class="table-row"> <td>
                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                       <Columns>
                           <asp:TemplateField HeaderText="File">
                               <ItemTemplate>
                                   <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("File") %>' CommandName="Download" Text='<%# Eval("File") %>'></asp:LinkButton>
                               </ItemTemplate>
                           </asp:TemplateField>
                           <asp:BoundField DataField="Size" HeaderText="Size" />
                           <asp:BoundField DataField="File" HeaderText="Type" />
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
                  </td>
               </tr>
    
       </table>

                                    </div></div></div></div></div></div>
</asp:Content>
