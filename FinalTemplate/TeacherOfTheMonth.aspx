<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="TeacherOfTheMonth.aspx.cs" Inherits="FinalTemplate.TeacherOfTheMonth" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
     <script src="assets/js/jquery-2.2.3.js"></script> 
     <script type="text/javascript">
         $(document).ready(function() {
             buttonFix();
             profileimageresolution();
             GetAllTeachers();
         });

         function GetAllTeachers() {
             var schoolidvalue = $('#inputschoolid').val();
             
             $.ajax({
                 url: 'source/WebServices/GetAllTeachers.asmx/TeacherOFTheMonth',
                 method:'post',
                 data: { schoolid: schoolidvalue },
                 dataType: 'json',                 
                 success: function (data) {
                     var obj = JSON.stringify(data);
                     var actualArray = $.parseJSON(obj);
                     $.each(actualArray, function(i,v) {
                            var div = $('tbody');
                           div.append('<tr class="table-row"><td class="col-1"><span>'+v.TeacherID+'</span></td><td class="col-2"><a href="courses-detail.html">'+v.FirstName + ' '+v.LastName +'</a></td><td class="col-3"><span><input  type="checkbox" checked data-toggle="toggle" data-onstyle="success" data-offstyle="danger"></span></td></tr>');
                     });
                 },
                 error: function(data) {
                     alert("Error" + data);
                 }
             });
         }        
         function EmptyTable() {
             $('tbody').empty();
         }
         function buttonFix() {
             $('button.btn.btn-transition-2').css('width', '175px');
             $('button.btn.btn-green').css('width', '175px');
         }

         function profileimageresolution() {
             $('div.col-md-5 img').css({'height':'500px','width':'450px','border-radius':'15px'});
         }
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
    <div class="section intro-edu">
        <div class="container">
            <div class="intro-edu-wrapper">
                <div class="row">
                    <div class="col-md-5">
                        <img src="assets/images/cesThemeImages/teachers (2).jpg" alt="" class="intro-image fadeInLeft animated wow" />
                    </div>
                    <div class="col-md-7">
                        <div class="intro-title">Teacher of the Month  <b>Leader</b></div>
                        <div class="intro-content">
                            <p>Aliquam pulvinar pellentesque purus, nec condimentum nibh. Aenean dapibus iaculis odio id vestibulum. Nam at justo ante. Aenean hendrerit gravida ligula, id lacinia sapien tristique eget. In elit ipsum, vestibulum eu pulvinar sed.</p>

                            <p>Maecenas eros mi, lacinia eu ultricies vel, elementum et justo. Ut at tortor a odio vestibulum suscipit non sit amet dolor. Morbi molestie magna nec metus facilisis, at iaculis mi adipiscing. Praesent ac diam velit. Curabitur lacinia tristique velit ut laoreet. Nam pretium id risus vitae fermentum. Aenean eu euismod justo. Aliquam sodales tortor elit, non luctus felis tristique sit amet.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!----Teacher list---->
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
                                                <th class="col-3">Make Teacher Of the Month</th>
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
</asp:Content>
