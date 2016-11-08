<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="PostNews.aspx.cs" Inherits="FinalTemplate.PostNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
     <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            button();
        });
        function button() {
            $('#<%=btnPostNews.ClientID%>').css('width', '140px');
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
