<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="StudentOfTheMonth.aspx.cs" Inherits="FinalTemplate.StudentOfTheMonth" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
     <script src="assets/js/jquery-2.2.3.js"></script> 
    <script type="text/javascript">
        $(document).ready(function () {
            buttonFix();
            profileimageresolution();
        });

        function GetAllStudents() {
            
        }

        function EmptyTable() {
            $('tbody').empty();
        }
        function buttonFix() {
            $('button.btn.btn-transition-2').css('width', '175px');
            $('button.btn.btn-green').css('width', '175px');
        }

        function profileimageresolution() {
            $('div.col-md-5 img').css({ 'height': '500px', 'width': '450px', 'border-radius': '15px' });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
      <div class="section teacher-course section-padding">
                    <div class="container teacher-course-wrapper">
                        <div class="underline">Teacher list</div>
                        <div class="course-table">
                            <div class="outer-container">
                                <div class="inner-container">
                                    <div class="table-header">
                                        <table class="edu-table-responsive">
                                            <thead>
                                            <tr class="heading-table">
                                                <th class="col-1">Teacher ID</th>
                                                <th class="col-2">Teacher Name</th>

                                            </tr>
                                            </thead>
                                        </table>
                                    </div>
                                    <input id="inputschoolid" type="hidden" value="<%= schoolID %>"/>
                                    <div class="table-body">
                                        <table class="edu-table-responsive table-hover">
                                            <tbody>
                                         
                                           <!---- <tr class="table-row">
                                                <td class="col-1"><span>ED1</span></td>
                                                <td class="col-2"><a href="courses-detail.html">Sport Exercise Sciences</a></td>
                                                <td class="col-3"><span><asp:Button ID="btn1" Text="Okay" runat="server"/><asp:Button ID="btn2" Text="Reject" runat="server"/></span></td>
                                            </tr>---->
                                         
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="teacherofthemonth">
                                    <asp:TextBox ID="txt_teacherid" runat="server" placeholder="Enter Teacher ID for Teacher of the month" Width="515px"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="Make teacher of the month" OnClick="Button1_Click" />
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
</asp:Content>
