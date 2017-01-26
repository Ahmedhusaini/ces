<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="mark_attendance.aspx.cs" Inherits="FinalTemplate.mark_attendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TeacherHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TeacherPlaceHolder1" runat="server">
        <div class="search-input">
                        <div class="container">
                            <div class="search-input-wrapper">
                                  <asp:DropDownList ID="ddlclass" runat="server" class="sbHolder" DataSourceID="SqlDataSource3" DataTextField="class" DataValueField="Class_id"></asp:DropDownList>
                                  <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT * FROM [tbl_class]"></asp:SqlDataSource>
                                  <asp:DropDownList ID="ddlsection" runat="server" class="sbHolder"  DataSourceID="SqlDataSource4" DataTextField="section" DataValueField="Section_id"></asp:DropDownList>
                                  <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT * FROM [tbl_section]"></asp:SqlDataSource>
                                        <span>
                                               
 
                                               
                                                </span>
                                <button type="submit" class="form-submit btn btn-blue">
                                     <asp:Button ID="Button2" runat="server" Text="SEARCH" Style="background-color: transparent" BorderStyle="None" OnClick="Button1_Click" />
                                    </button> <span></span>  
                                
                             <div class="clearfix"></div>
                               
                         </div>
                       </div>
        </div>  
  <div class="section attendance">
     <div class="container">
       <div class="attendance-logo-wrapper">
         <div class="attendance-logo-content">
           <div class="table-body">  
   
    <asp:GridView ID="GridView1" class="edu-table-responsive" runat="server"  AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataSourceID="SqlDataSource1" GridLines="Horizontal" Width="1046px">
             <Columns>
                   <asp:BoundField DataField="Std_id" HeaderText="Student ID" SortExpression="Std_id" />
                   <asp:TemplateField HeaderText="Remarks">
                   <ItemTemplate>                               
                   <asp:DropDownList ID="remark" runat="server" DataSourceID="SqlDataSource2" DataTextField="remarks" DataValueField="remark_id">
                   <asp:ListItem>Present</asp:ListItem>
                   <asp:ListItem>Absent</asp:ListItem>
                   <asp:ListItem>Leave</asp:ListItem>     
                   </asp:DropDownList>                           
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT * FROM [tbl_remarks]"></asp:SqlDataSource>                                               
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT [std_id] FROM [tbl_student_attendance] WHERE (([class_id] = @class_id) AND ([section_id] = @section_id))">
                  <SelectParameters>
            <asp:ControlParameter ControlID="ddlclass" Name="class_id" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlsection" Name="section_id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters></asp:SqlDataSource>
            </div>
          </div>
        </div>
      </div>
     </div>              
     <button type="submit" class="form-submit btn btn-blue"><span>
                                        <asp:Button ID="Button1" runat="server" Text="Submit" Style="background-color: transparent" BorderStyle="None" OnClick="Button1_Click" /></span></button>                                     
                                 
                        </asp:Content>
