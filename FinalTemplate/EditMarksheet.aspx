<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="EditMarksheet.aspx.cs" Inherits="FinalTemplate.EditMarksheet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TeacherHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TeacherPlaceHolder1" runat="server">
       <div class="section teacher-course section-padding">
                    <div class="container teacher-course-wrapper">
                        <div>Edit Marks For The Student</div>
                        <div class="course-table">
                            <div class="outer-container">
                                <div class="inner-container">
                                    <div class="table-body">
    <table class="edu-table-responsive table-hover">
          <thead>
              <tr class="heading-table">
                 <th class="col-1">SUBJECT</th>
                 <th class="col-2">MARKS OUT OF 100</th>
              </tr>
          </thead>
              <tr class="table-row">
                 <td class="col-6"><span>Maths</span></td>
                 <td class="col-6">
                 <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>
                 </td>
              </tr>
       <tr class="table-row">
                 <td class="col-6"><span>English</span></td>
                 <td class="col-6">
                 <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server"></asp:TextBox>
                 </td>
              </tr>
       <tr class="table-row">
                 <td class="col-6"><span>Urdu</span></td>
                 <td class="col-6">
                 <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server"></asp:TextBox>
                 </td>
              </tr>
       <tr class="table-row">
                 <td class="col-6"><span>Islamiat</span></td>
                 <td class="col-6">
                 <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server"></asp:TextBox>
                 </td>
              </tr>
       <tr class="table-row">
                 <td class="col-6"><span>Science</span></td>
                 <td class="col-6">
                 <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server"></asp:TextBox>
                 </td>
              </tr>
       <tr class="table-row">
                 <td class="col-6"><span>Computer</span></td>
                 <td class="col-6">
                 <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server"></asp:TextBox>
                 </td>
              </tr>
          <tr class="table-row">
                 <td class="col-6">
                     <asp:Button CssClass="form-control" ID="Button1" runat="server" Text="Total" OnClick="Button1_Click" />
                 </td>
              </tr>
           <tr class="table-row">
                 <td class="col-6"><span>Total Percentage</span></td>
                 <td class="col-6">
                 <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server"></asp:TextBox>
                 </td>
              </tr>
     </table>

                                    </div></div></div></div></div></div>
            
</asp:Content>
