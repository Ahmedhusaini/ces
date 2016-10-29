<%@ Page Title="Student Profile" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="StudentProfile.aspx.cs" Inherits="FinalTemplate.StudentProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TeacherHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TeacherPlaceHolder1" runat="server">
    <div class="section section-padding profile-teacher">
        <div class="container">
            <div class="profile-teacher-wrapper">
                <div class="teacher-info">
                    <div class="staff-item2 customize">
                        <div class="staff-item-wrapper">
                            <div class="staff-info">
                                <a href="#" class="staff-avatar">
                                    <img src="assets/images/people-avatar-4.jpg" alt="" class="img-responsive" />
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                </a>
                                <a href="#" class="staff-name">barry join</a>
                                <br />
                            </div>
                        </div>
                    </div>
                    <div class="teacher-des">
                        <div class="course-table" style="height: 500px; width: 600px; margin-right: 0px;">
                            <div class="inner-container">
                                <div class="table-header">
                                    <table class="Attendance-table table-hover">
                                        <thead>
                                            <tr class="heading-table">
                                                <th class="col-1">Student ID</th>
                                                <th class="col-2">Name</th>
                                                <th class="col-2">Roll No</th>
                                                <th class="col-3">Address</th>
                                                <th class="col-4">Fee Status</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                                <div class="table-body">
                                    <table class="Attendance-table table-hover">
                                        <tbody>
                                            <tr class="table-row">
                                                <td class="col-1"><span>1</span></td>
                                                <td class="col-2"><span>AHMED</span></td>
                                                <td class="col-2"><span>56</span></td>
                                                <td class="col-3"><span>aca</span></td>
                                                <td class="col-4"><span>paid</span></td>
                                            </tr>
                                            <tr class="table-row">
                                                <td class="col-1"><span>2</span></td>
                                                <td class="col-2"><span>JAHANGEER</span></td>
                                                <td class="col-2"><span>333</span></td>
                                                <td class="col-3"><span>asas</span></td>
                                                <td class="col-4"><span>paid</span></td>
                                            </tr>
                                            <tr class="table-row">
                                                <td class="col-1"><span>3</span></td>
                                                <td class="col-2"><span>SIDDIQUE</span></td>
                                                <td class="col-2"><span>22</span></td>
                                                <td class="col-3"><span>ssd</span></td>
                                                <td class="col-4"><span>paid</span></td>
                                            </tr>
                                            <tr class="table-row">
                                                <td class="col-1"><span>4</span></td>
                                                <td class="col-2"><span>SHEHREYAR</span></td>
                                                <td class="col-2"><span>232</span></td>
                                                <td class="col-3"><span>th</span></td>
                                                <td class="col-4"><span>paid</span></td>
                                            </tr>
                                            <tr class="table-row">
                                                <td class="col-1"><span>5</span></td>
                                                <td class="col-2"><span>SHAHWAIZ</span></td>
                                                <td class="col-2"><span>55</span></td>
                                                <td class="col-3"><span>djd</span></td>
                                                <td class="col-4"><span>paid</span></td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="table-body">
                            <div class="teacher-des">
                                <div class="course-table" style="height: 500px; width: 600px; margin-right: 0px;">
                                    <div class="inner-container">
                                        <div class="table-header">
                                            &nbsp;<asp:TextBox ID="TextBox1" CssClass="form-control  form-input" runat="server" Width="540px"></asp:TextBox>
                                            <button type="submit" class="btn btn-register btn-green">
                                                <asp:Button ID="Button1" runat="server" Text="SEARCH" Style="background-color: transparent" BorderStyle="None" />
                                            </button>
                                            <br />
                                            <br />
                                            <asp:GridView ID="GridView1" class="edu-table-responsive" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#86bc42" GridLines="None">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="day" HeaderText="day" SortExpression="day" />
                                                    <asp:BoundField DataField="starting_time" HeaderText="starting_time" SortExpression="starting_time" />
                                                    <asp:BoundField DataField="ending_time" HeaderText="ending_time" SortExpression="ending_time" />
                                                    <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject" />
                                                    <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                                                </Columns>
                                                <EditRowStyle BackColor="#7C6F57" />
                                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#86bc42" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#E3EAEB" />
                                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT [day], [starting_time], [ending_time], [subject], [username] FROM [student_timetable] WHERE ([username] = @username)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="TextBox1" Name="username" PropertyName="Text" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
