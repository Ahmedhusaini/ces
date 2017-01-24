<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="edit_student_timetable.aspx.cs" Inherits="FinalTemplate.edit_student_timetable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TeacherHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TeacherPlaceHolder1" runat="server">
    <div class="group-title-index">
                    <h2 class="center-title">Update Student Timetable</h2>
                    <div class="bottom-title">
                        <i class="bottom-icon icon-icon-04"></i>
                    </div>
                    <div class="inner-container">
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Timetable ID</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" Width="200px" ID="timetableidtxt"></asp:TextBox></td>
                                        <td class="col-3"><span></span></td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="inner-container">
                       
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Period 1</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" Width="200px" ID="p1txt"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Period 2</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" Width="200px" ID="p2txt"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Period 3</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" ID="p3txt" Width="200px"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Period 4</span></td>
                                        <td class="col-2">
                                              <asp:TextBox ID="p4txt" Width="200px" runat="server"></asp:TextBox>
                                            </td>
                                        <td class="col-3"></td>
                                    </tr>

                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Period 5</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" Width="200px" ID="p5txt"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>

                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Period 6</span></td>
                                        <td class="col-2">
                                            <asp:TextBox runat="server" Width="200px" ID="p6txt"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3"><span style="color: black; font-weight: bolder">Period 7</span></td>
                                        <td class="form-input">
                                            <asp:TextBox runat="server" Width="200px" ID="p7txt"></asp:TextBox></td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3" style="color: black; font-weight: bolder">Period 8</td>
                                        <td class="col-2">
                                            <asp:TextBox ID="p8txt" Width="200px" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3" style="color: black; font-weight: bolder">day</td>
                                        <td class="col-2"><asp:DropDownList  runat="server" ID="ddlday" Width="200px" DataSourceID="SqlDataSource1" DataTextField="day" DataValueField="day_id"></asp:DropDownList>                        
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT * FROM [tbl_day]"></asp:SqlDataSource>
                                        </td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3" style="color: black; font-weight: bolder">class</td>
                                        <td class="col-2"><asp:DropDownList runat="server" ID="ddlclass" Width="200px" DataSourceID="SqlDataSource2" DataTextField="class" DataValueField="Class_id"></asp:DropDownList>
                                           
                                            
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT * FROM [tbl_class]"></asp:SqlDataSource>
                                           
                                            
                                        </td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3" style="color: black; font-weight: bolder">section</td>
                                        <td class="col-2"><asp:DropDownList runat="server" ID="ddlsection" Width="200px" DataSourceID="SqlDataSource3" DataTextField="section" DataValueField="Section_id"></asp:DropDownList>
                                           
                                           
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT * FROM [tbl_section]"></asp:SqlDataSource>
                                           
                                           
                                        </td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3" style="color: black; font-weight: bolder">teacher id</td>
                                        <td class="col-2">
                                            <asp:TextBox ID="teachertxt" Width="200px" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="col-3"></td>
                                    </tr>
                                    <tr class="table-row" style="background-color: transparent;">
                                        <td class="col-3" style="color: black; font-weight: bolder">school</td>
                                        <td class="col-2"><asp:DropDownList  runat="server" ID="ddlschool" Width="200px" DataSourceID="SqlDataSource4" DataTextField="school_name" DataValueField="school_id">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT [school_id], [school_name] FROM [tbl_school]"></asp:SqlDataSource>
                                        </td>
                                        <td class="col-3">
                                              <div class="register-submit">
                            <button type="submit"   class="btn btn-register btn-green">
                                <asp:Button ID="Button1" runat="server" BackColor="Transparent" Text="UPDATE" OnClick="Button1_Click" />
                              </button>
                                  
                     </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                  
                </div>
</asp:Content>
