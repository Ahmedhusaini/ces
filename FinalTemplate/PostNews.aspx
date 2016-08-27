<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="PostNews.aspx.cs" Inherits="FinalTemplate.PostNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
     <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            button();
        });
        function button() {
            $('button[type=submit]').css('padding-right', '130px');
            $('button[type=submit] span').css('color', 'white');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
    <div class="section section-padding news-detail">
                    <div class="container">
                        <div class="news-detail-wrapper">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="news-detail"><img src="assets/images/cesThemeImages/hps.jpg" alt="" class="news-image"/>

                                        <h1 class="title-news">Write the news content below.</h1>
                                        <div class="comment-write">
                                            <div class="comment-write-title underline">Write your message</div>
                                            <form action="#" class="form-comment">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <div class="input-icon right">
                                                                News Title
                                                                <asp:TextBox runat="server" ID="txtNewsTitle" placeholder="News Title" CssClass="form-control form-input"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <div class="input-icon right">
                                                                News Type
                                                                <asp:DropDownList runat="server" ID="ddlnewstype" CssClass="form-control form-input"/>
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
                                                                News Video
                                                                <asp:FileUpload runat="server" ID="fileuploadnewsvideo" CssClass="form-control  form-input"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <div class="input-icon right">
                                                                News Tags
                                                                   <asp:TextBox runat="server" ID="txtTags" placeholder="News Tags" CssClass="form-control form-input"></asp:TextBox>  
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
                                                    <button type="submit" class="btn btn-green btn-bold"><span>SUBMIT POST</span></button>
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
