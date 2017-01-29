<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="PostNews.aspx.cs" Inherits="FinalTemplate.PostNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
     <script src="assets/js/jquery-2.2.3.js"></script>
    <script src="assets/js/jquery.validate.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            button();
            validation();
        });
        function button() {
            $('#<%=btnPostNews.ClientID%>').css('width', '140px');
        }


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

                     <%=txtNewsTitle.UniqueID%>:{
                         required:true,
                         
                     },
                     <%=txtNewsContent.UniqueID%>:{
                         required:true,
                         minlength:10

                         
                     }

                },

                messages: {
                    <%=txtNewsTitle.UniqueID%>:{
                        required:"Please mention News Title"
                         
                    },
                      <%=txtNewsContent.UniqueID%>:{
                          required:true,
                          minlength:"Must be 10 letters long"

                         
                      },


                }

            });


        }


    </script>
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
    <div class="section section-padding news-detail">
                    <div class="container">
                        <div class="news-detail-wrapper">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="news-detail"><img src="assets/images/cesThemeImages/hps.jpg" height="300px" alt="" class="news-image"/>

                                        <div class="comment-write">
                                            <div class="comment-write-title underline">Category of news type will set its priority in news feed on CES Portal.</div>
                                            <form action="#" class="form-comment">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <div class="input-icon right">
                                                                News Title
                                                                <asp:TextBox runat="server" ID="txtNewsTitle"  CssClass="form-control form-input"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <div class="input-icon right">
                                                                News Type
                                                                <asp:DropDownList runat="server" ID="ddlnewstype" CssClass="form-select style-1 selectbox"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <div class="input-icon right">
                                                                News Image
                                                                <asp:FileUpload runat="server" ID="fileuploadnewsimage" CssClass="form-control  form-input"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                     
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <div class="input-icon right">
                                                                News Tags
                                                                   <asp:TextBox runat="server" ID="txtTags" placeholder="Separate tags with comma ( , ) to add multiple tags."  CssClass="form-control form-input"></asp:TextBox>  
                                                            </div>
                                                        </div>
                                                    </div>
                                                  
                                                    <div class="col-md-12">
                                                        <div class="contact-question form-group">
                                                            News Content
                                                             <asp:TextBox runat="server" ID="txtNewsContent" CssClass="form-control form-input" Height="251px" TextMode="MultiLine" Width="555px"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="contact-submit">
                                                    
                                                    <asp:Button runat="server" ID="btnPostNews" Text="Post News" CssClass="btn btn-green btn-bold" OnClick="btnPostNews_Click" />
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
</asp:Content>
