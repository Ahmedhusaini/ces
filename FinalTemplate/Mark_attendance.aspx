<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="mark_attendance.aspx.cs" Inherits="FinalTemplate.mark_attendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TeacherHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TeacherPlaceHolder1" runat="server">
                                                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataSourceID="SqlDataSource1" GridLines="Horizontal" Width="293px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField DataField="Std_id" HeaderText="Student ID" SortExpression="Std_id" />
                                        <asp:TemplateField HeaderText="Remarks">
                                            <ItemTemplate>
                                              
                                               <asp:RadioButtonList ID="Radio1" runat="server">
                                                   <asp:ListItem>Present</asp:ListItem>
                                                   <asp:ListItem>Absent</asp:ListItem>
                                                   <asp:ListItem>Leave</asp:ListItem>
                                               </asp:RadioButtonList>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField ShowSelectButton="True" />
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

    
                                                                         
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:abc %>" SelectCommand="SELECT [Std_id] FROM [tbl_student_attendance]"></asp:SqlDataSource>
                                                                         
                                  
        <div class="search-input">
                        <div class="container">

                            <div class="search-input-wrapper">
                              

                                    <div class="clearfix"></div>
                               
                            </div>
                        </div>
                    </div>  

    </asp:Content>
