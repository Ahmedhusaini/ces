<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="FinalTemplate.Attendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TeacherHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TeacherPlaceHolder1" runat="server">
    <div class="search-input">
                        <div class="container">
                            <div class="search-input-wrapper">
                              
                                   
                                     <asp:DropDownList ID="DropDownList1" runat="server" CssClass="sbHolder">
                                        <asp:ListItem>Class 1</asp:ListItem>
                                        <asp:ListItem>Class 2</asp:ListItem>
                                        <asp:ListItem>Class 3</asp:ListItem>
                                        <asp:ListItem>Class 4</asp:ListItem>
                                        <asp:ListItem>Class 5</asp:ListItem>
                                        <asp:ListItem>Class 6</asp:ListItem>
                                        <asp:ListItem>Class 7</asp:ListItem>
                                        <asp:ListItem>Class 8</asp:ListItem>
                                        <asp:ListItem>Class 9</asp:ListItem>
                                        <asp:ListItem>Class 10</asp:ListItem>
                                    </asp:DropDownList>                                                             
                              <div >
                                 <asp:DropDownList ID="DropDownList2" runat="server" CssClass="sbHolder">
                                        <asp:ListItem>A</asp:ListItem>
                                        <asp:ListItem>B</asp:ListItem>
                                        <asp:ListItem>C</asp:ListItem>
                                        <asp:ListItem>D</asp:ListItem>
                                        <asp:ListItem>E</asp:ListItem>
                                    </asp:DropDownList>

                              </div>
                                    <div>
                                        <asp:DropDownList ID="DropDownList3" runat="server" CssClass="sbHolder">
                                        <asp:ListItem>20-01-2016</asp:ListItem>
                                        <asp:ListItem>20-01-2016</asp:ListItem>
                                        <asp:ListItem>20-01-2016</asp:ListItem>
                                        <asp:ListItem>20-01-2016</asp:ListItem>
                                        <asp:ListItem>20-01-2016</asp:ListItem>
                                    </asp:DropDownList>
                                    </div>
                                        
                                
                                    <button type="submit" class="form-submit btn btn-blue"><span>Search</span></button>
                                    <div class="clearfix"></div>
                               
                            </div>
                        </div>
                    </div>  
                                                  
                                          
                   
    <div class="section attendance">
                    <div class="container">
                        <div class="attendance-logo-wrapper">
                            <div class="attendance-logo-content">
           
                                                    <div class="table-body">
                                                        <table class="Attendance-table" id="datatable">

                                                         
                                                                <thead>
                                                            <tr class="heading-table">
                                                                <th class="col-1">Student ID</th>
                                                                <th class="col-2">Student Rollno</th>
                                                                <th class="col-3">Student Name</th>
                                                                <th class="col-4">Remarks</th>
                                                            </tr>
                                                            </thead>
                                                               <tbody>
                                                            <tr class="table-row">
                                                                <td class="col-1"><a href="#"><span>1</span></a></td>
                                                                <td class="col-2"><span>96</span></td>
                                                                <td class="col-3"><span>Ahmed</span></td>
                                                                <td class="col-4">
                                                                    <asp:CheckBox ID="CheckBox1" runat="server" />PRESENT
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox2" runat="server" />ABSENT
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox3" runat="server" />LEAVE
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox4" runat="server" />LATE
                                                                </td>                                                                                                                               
                                                            </tr>      
                                                                <tr class="table-row">
                                                                <td class="col-1"><a href="#"><span>2</span></a></td>
                                                                <td class="col-2"><span>101</span></td>
                                                                <td class="col-3"><span>Siddique</span></td>
                                                                <td class="col-4">
                                                                    <asp:CheckBox ID="CheckBox5" runat="server" />PRESENT
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox6" runat="server" />ABSENT
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox7" runat="server" />LEAVE
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox8" runat="server" />LATE
                                                                </td>                                                                                                                               
                                                            </tr>     
                                                                 <tr class="table-row">
                                                                <td class="col-1"><a href="#"><span>3</span></a></td>
                                                                <td class="col-2"><span>106</span></td>
                                                                <td class="col-3"><span>Shahwaiz</span></td>
                                                                <td class="col-4">
                                                                    <asp:CheckBox ID="CheckBox9" runat="server" />PRESENT
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox10" runat="server" />ABSENT
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox11" runat="server" />LEAVE
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox12" runat="server" />LATE
                                                                </td> 
                                                                     </tr> 
                                                                      <tr class="table-row">
                                                                <td class="col-1"><a href="#"><span>4</span></a></td>
                                                                <td class="col-2"><span>120</span></td>
                                                                <td class="col-3"><span>Jahangeer</span></td>
                                                                <td class="col-4">
                                                                    <asp:CheckBox ID="CheckBox13" runat="server" />PRESENT
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox14" runat="server" />ABSENT
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox15" runat="server" />LEAVE
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox16" runat="server" />LATE
                                                                </td>                                                                                                                               
                                                            </tr>     
                                                                      <tr class="table-row">
                                                                <td class="col-1"><a href="#"><span>5</span></a></td>
                                                                <td class="col-2"><span>439</span></td>
                                                                <td class="col-3"><span>Shehreyar</span></td>
                                                                <td class="col-4">
                                                                    <asp:CheckBox ID="CheckBox17" runat="server" />PRESENT
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox18" runat="server" />ABSENT
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox19" runat="server" />LEAVE
                                                                    &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox20" runat="server" />LATE
                                                                </td>                                                                                                                               
                                                            </tr>                                                                                                                                  
                                                                                                                                                                    
                                                          </tbody>
                                                        </table>
                                                    </div>
                                                
                            </div>
                        </div>
                    </div>
                </div>
              <div class="container">
                        <div class="group-button">    
                            <button class="btn btn-transition-2"><span>Submit</span></button>
                            <button class="btn btn-transition-2"><span>Clear</span></button>
                                    </div>
                    </div>
</asp:Content>
