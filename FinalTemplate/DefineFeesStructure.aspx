<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="DefineFeesStructure.aspx.cs" Inherits="FinalTemplate.DefineFeesStructure" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">

    <script src="assets/js/jquery-2.2.3.js"></script>
    <script src="assets/js/jquery.validate.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {


            validation();

        });


        $.validator.addMethod("lettersonly", function (value, element) {
            return this.optional(element) || /^[a-z\s]+$/i.test(value);
        }, "Letters only please");
        $.validator.addMethod("phone", function (phone_number, element) {
            phone_number = phone_number.replace(/\s+/g, "");
            return this.optional(element) || phone_number.length > 9 &&
                phone_number.match(/^((\+92)|(0092))-{0,1}\d{3}-{0,1}\d{7}$|^\d{11}$|^\d{4}-\d{7}$/);
        }, "Please specify a valid phone number with+92");
        $.validator.addMethod("digitsonly", function (value, element) {
            return this.optional(element) || /^[0-9]+$/i.test(value);
        }, "Numbers only please");
        $.validator.addMethod("pwcheck", function (value) {
            return /^[A-Za-z0-9\d=!\-@._*]*$/.test(value) // consists of only these
                && /[a-z]/.test(value) // has a lowercase letter
                && /\d/.test(value) // has a digit
        }, "please only Lowercase and must have digits ");
        $.validator.addMethod("imageonly", function (value, element) {
            return this.optional(element) || /^([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$/.test(value);
        }, ".jpeg ,.png, .gif format allow only ");


        function validation() {

            $("#form1").validate({


                rules: {
                    <%=txtRegistrationFees.UniqueID%>:{
                        required:true,
                        digitsonly:true
                    },
                     <%=txtAddmissionFees.UniqueID%>:{
                         required:true,
                         digitsonly:true
                     },
                      <%=txtSecurityFees.UniqueID%>:{
                          required:true,
                          digitsonly:true
                      },
                      <%=txtAnnualFees.UniqueID%>:{
                          required:true,
                          digitsonly:true
                      },
                     <%=txtTuitionFees.UniqueID%>:{
                         required:true,
                         digitsonly:true
                     },
                     <%=txtTransportfees03km.UniqueID%>:{
                         required:true,
                         digitsonly:true
                     },
                     <%=txtTransportfees48km.UniqueID%>:{
                         required:true,
                         digitsonly:true
                     },
                     <%=txtTransportfees916km.UniqueID%>:{
                         required:true,
                         digitsonly:true
                     },
                      <%=txtTransportfeesgreaterthan16km.UniqueID%>:{
                          required:true,
                          digitsonly:true
                      },
                },

                messages: {
                 
                    
                      
                 
                
                
                }

            });


        }






    </script>




    <link href="assets/css/mycss.css" rel="stylesheet" />
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
      <link href="assets/css/mycss.css" rel="stylesheet" />
    <style>
        
         label.error {

            color: red;
            display: inline-flexbox;
            display:block;
           
        }
        input.error {
            border:1px solid red;
            float: none; color: red;
        padding-left: .3em; vertical-align: top;
        }
      
      
    </style>
    <div class="section teacher-course section-padding">
                    <div class="container teacher-course-wrapper">
                        <div class="underline">Define fees structure for your school</div>
                        <div class="course-table">
                            <div class="outer-container">
                                <div class="inner-container">
                                    <div class="table-body">
                                        <table class="edu-table-responsive table-hover">
                                            <tbody>
                                            <tr class="table-row">
                                                    <td class="col-6"><span>Registration Fees</span></td>
                                                    <td class="col-6">
                                                        <asp:TextBox runat="server" ID="txtRegistrationFees"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="table-row">
                                                    <td class="col-6"><span>Admission Fees</span></td>
                                                    <td class="col-6">
                                                        <asp:TextBox runat="server" ID="txtAddmissionFees"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="table-row">
                                                    <td class="col-6"><span>Security Fees</span></td>
                                                    <td class="col-6">
                                                        <asp:TextBox runat="server" ID="txtSecurityFees"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="table-row">
                                                    <td class="col-6"><span>Annual Fees</span></td>
                                                    <td class="col-6">
                                                        <asp:TextBox runat="server" ID="txtAnnualFees"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="table-row">
                                                    <td class="col-6"><span>Tuition Fees</span></td>
                                                    <td class="col-6">
                                                        <asp:TextBox runat="server" ID="txtTuitionFees"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="table-row">
                                                    <td class="col-6"><span>Transport Fees (0-3 Km)</span></td>
                                                    <td class="col-6">
                                                        <asp:TextBox runat="server" ID="txtTransportfees03km"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="table-row">
                                                    <td class="col-6"><span>Transport Fees (4-8 km)</span></td>
                                                    <td class="col-6">
                                                        <asp:TextBox runat="server" ID="txtTransportfees48km"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="table-row">
                                                    <td class="col-6"><span>Transport Fees (9-16 km)</span></td>
                                                    <td class="col-6">
                                                        <asp:TextBox runat="server" ID="txtTransportfees916km"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="table-row">
                                                    <td class="col-6"><span>Transport Fees (greater than 16 km)</span></td>
                                                    <td class="col-6">
                                                        <asp:TextBox runat="server" ID="txtTransportfeesgreaterthan16km"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <asp:Button runat="server" style="width: 100px; margin: 20px 0px 0px 550px;" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click"></asp:Button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
</asp:Content>
