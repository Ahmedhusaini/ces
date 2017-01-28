<%@ Page Title="" Language="C#" MasterPageFile="~/parentpanel.Master" AutoEventWireup="true" CodeBehind="parentpanel.aspx.cs" Inherits="FinalTemplate.parentpanel1" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


     <script src="assets/js/jquery-2.2.3.js"></script>  <script src="assets/js/jquery.validate.js"></script>
   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css"
    rel="stylesheet" type="text/css" />
    <link href="assets/css/mycss.css" rel="stylesheet" />
    <script type="text/javascript">

   

        $(document).ready(function () {

            $('#<%=DropDownList1.ClientID%>').css('display', 'none'),
            $('#<%=Label3.ClientID%>').css('display', 'none'),
            $('#<%=Label2.ClientID%>').hide();
            $('#<%=Image1.ClientID%>').css('border-radius', '50px'),
            $('[title="Update Password"]').css('display','none'),

                $('.table-row').css(' text-align', 'inherit'),
            $('[title="Dialog"]').css('dsiplay', 'none'),
            $('li a[title="Reset Password"]').hide(),

                check();
                validation();
               

          
        });

        function refresh(){
        
        
            
        
        }
       
        $('li a[title="click"]').live("click", function () {
            alert("kam kar raha hai")
            //$("#dialog").dialog({
            //    title: "jQuery Dialog Popup",
              
        });

         
        function check()
        {
            $('li a[title="Child Profile"]')
                .click(function (e) {
                var seectionID = e.currentTarget.id + "section";
               

            })
            
        }
        function validation() {
            $("#form1").validate({

                rules: {
                    <%=TextBox1.UniqueID%>:{
                        required:true,

                    }
                },
                messages: {
                     <%=TextBox1.UniqueID%>:{
                         required:"You have to mention your Child's ID"

                     }
                }

            });

        }





    </script>
    <style type="text/css">
       .header { text-align:inherit; }
         }
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
        .modalBackground {
        opacity: 0.6;
    background-color: black;
        
        }
        .modalpopup
{
       position: fixed;
    z-index: 100001;
    left: 726.5px;
    top: 304px;
    background-color: #86BC42;
    border-color: #86BC42;
    padding-top: 52px;
    padding-bottom: 48px;
    padding-left: 24px;
}

   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section background-opacity page-title set-height-top">
        <div class="container">
            <div class="page-title-wrapper">
                <!--.page-title-content-->
                <div class="slider-banner-wrapper">
                    <h1 data-wow-delay="0.5s" class="sub-title wow fadeInUp">
                        <asp:Label Text="Date: " ID="lab1" runat="server" Font-Size="Large"></asp:Label>&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;<asp:Label Text="Time:" ID="lab2" runat="server" Font-Size="Large"></asp:Label></h1>
                    <h2 class="captions">Parent's profile</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active"><a href="#">Profile</a></li>
                    </ol>
                    
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-9">
    <div class="news-page-wrapper">
           <div id="detail" class="edugate-layout-1" style="border-radius: 50px;   background-color: rgba(144, 161, 174, 0.63)">
                                        <div class="edugate-image" style="border-radius: 100px"><asp:Image ID="Image1" runat="server" />
                                                                          <div>
               <asp:FileUpload ID="FileUpload1"  runat="server" />
               <asp:Button class="btn-green" BackColor="#86bc42" BorderColor="#86bc42" ID="btnSave" Text="upload" runat="server" Height="30px" Width="70px" OnClick="btnSave_Click"></asp:Button>
                                        <asp:Label ID="Label3"  runat="server" Text="Label"></asp:Label>
                <asp:Label ID="Label1" runat="server"></asp:Label>
<asp:Label ID="Label2" runat="server"></asp:Label>
                   </div>
                          
                                        </div>
               <br/>

            
                                        <div class="edugate-content"><a href="news-detail.html" class="title">
                                                
                                                <asp:Label ID="headlbl" runat="server" Font-size="18"  ></asp:Label>
                                            </a>&nbsp;&nbsp;
                                            <a href="news-detail.html" class="title"> 
                                                 <asp:Label ID="headll" runat="server" Font-size="18"  ></asp:Label></a>
                                            <div class="info">
                                                <div class="author item"><a href="#">Gender: </a> &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="gender" Font-size="13" runat="server"></asp:Label></div>
                     
                                            </div>
                                            <div class="info">
                                                <div class="author item"><a href="#">Contact NO: </a> &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="phone" Font-size="13" runat="server"></asp:Label></div>
                     
                                            </div>
                                            <div class="info">
                                                <div class="author item"><a href="#">Address: </a>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="address" Font-size="13" runat="server"></asp:Label></div>
                     
                                            </div>
                                            <div class="info">
                                                <div class="author item"><a href="#">Email ID: </a>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="pemail" Font-size="13" runat="server"></asp:Label></div>
                     
                                            </div>
                                            <div class="info">
                                                <div class="author item"><a href="#">Authorized ID : </a>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="atype" Font-size="13" runat="server"></asp:Label></div>
                     
                                            </div>
                                            <div class="info">
                                                <div class="author item"><a href="#">Add child record to ur profile  &nbsp;&nbsp;</div>
                                                                  
                                                <asp:Button ID="btnShow" runat="server" Text="ADD" OnClick="btnShow_Click" />

                                               
                                                <div id="pop">
                                                    <center>

                                                    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">

                                                    </asp:ToolkitScriptManager>
                                                        <asp:Panel ID="Panel1" runat="server" CssClass="modalpopup">
                                                            Enter&#39;s your Child ID :&nbsp;&nbsp;
                                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                            &nbsp;<br />
                                                            &nbsp;
                                                            <br />
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click2"  />

                                                            &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<asp:Button ID="Button2" runat="server" Text="Cancel" />


                                                        </asp:Panel>
                                                        <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" CancelControlID="Button2" PopupControlID="Panel1" TargetControlID="btnShow" BackgroundCssClass="modalBackground" >

                                                        </asp:ModalPopupExtender>
                                                    </center>
                                                </div>

                     
                                            </div>

                                           
              <%--                                                             <div>
               <asp:FileUpload ID="FileUpload1"  runat="server" />
               <asp:Button class="btn-green" BackColor="#86bc42" BorderColor="#86bc42" ID="btnSave" Text="upload" runat="server" Height="30px" Width="70px" OnClick="btnSave_Click"></asp:Button>
                                        <asp:Label ID="Label3"  runat="server" Text="Label"></asp:Label>
                <asp:Label ID="Label1" runat="server"></asp:Label>
                   </div>
                          --%>                 
                                            <div class="description"></div>
                                          <%-- <button class="btn btn-green"><span>read more</span></button>--%>

                                        </div>
                 

                                    </div>

        </div>
        </div>
    
   <div class="container teacher-course-wrapper" style="width:1220px">
        <div class="group-title-index edu-ab-title"><h2 class="center-title">
            &nbsp;</h2>
           
            </div>
                       <div class="course-table" style="border-style: none; border-width: inherit; border-color: #FFFFFF">
                          
                        
                          
       </div>
                                    </div>

                      
      
        <!-- CHOOSE COURSES-->
    <br />
     <br />
     <br />
     <br />
     <br />
     <br />
                        <div class="group-title-index"> <div id="checkstudent"> <h4 class="top-title">Your Childerns </h4></div>

                            <h2 class="center-title" >check profile of your Child&nbsp;&nbsp;&nbsp;&nbsp; </h2>

                            <div class="bottom-title">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="GetParentid" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="authorized_id" SessionField="userid" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Parent_ID" DataValueField="Parent_ID">
                                </asp:DropDownList>
                                <i class="bottom-icon icon-a-1-01-01"></i>
                                <br />
                                <br />
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="spchild" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList1" Name="Parent_ID" PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="GridView1"  class="edu-table-responsive"  runat="server"  AutoGenerateColumns="False" Width="1220px" AllowPaging="True" AllowSorting="True" CellPadding="4" DataSourceID="SqlDataSource2"  ForeColor="#86BC42" GridLines="None" DataKeyNames="Std_id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Std_id" >
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1"  OnClick="linkbutton" Text='<%#Eval("Std_id") %>' runat="server">Link</asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle BackColor="#737373" Font-Bold="True" ForeColor="#86bc42"/>
                                        </asp:TemplateField>

                                        
                                        <asp:BoundField DataField="firstname" HeaderText="firstname" SortExpression="firstname" />
                                        <asp:BoundField DataField="lastname" HeaderText="lastname" SortExpression="lastname" />
                                        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                                        <asp:BoundField DataField="Guardian_Name" HeaderText="Guardian_Name" SortExpression="Guardian_Name" />
                                        <asp:BoundField DataField="school_name" HeaderText="school_name" SortExpression="school_name" />
                                        <asp:BoundField DataField="school_type" HeaderText="school_type" SortExpression="school_type" />
                                        
                                          <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
                                          <asp:BoundField DataField="section" HeaderText="section" SortExpression="section" />
                                        
                                    </Columns>
                                     <EditRowStyle BackColor="#7C6F57" />
                                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#737373" Font-Bold="True" ForeColor="#86bc42" />
                                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#E3EAEB" />
                                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                                </asp:GridView>
                                <br />
                            </div>
                        </div>
              <div class="section choose-course-3">
                    <div class="choose-course-3-wrapper row">

                        <div class="item-course"  style=" width: 800px;   display:none  " >
                            <div class="item-course-wrapper">
                                <div class="icon-course"><i class="icons-img fa fa-male"></i></div>
                                
                                <div class="icon-course"><a href="#" class="name-course">

                                &nbsp; &nbsp; &nbsp; <asp:Label ID="Name" runat="server" Font-Size="18" ></asp:Label></a>

                                     <div class="info">
                                   &nbsp; &nbsp; &nbsp;      Guardian Name :&nbsp; <asp:Label ID="gname" runat="server" Font-Size="15"></asp:Label></div>
                                    <div class="info">
                                   &nbsp; &nbsp; &nbsp;      Gender :&nbsp; <asp:Label ID="cgender" runat="server" Font-Size="15"></asp:Label></div>
                                   
                                </div>
                                <br/>
                               
                                 <div class="info">
                                &nbsp; &nbsp; &nbsp;       School :&nbsp; <asp:Label ID="school" Text="dsada" runat="server" Font-Size="15"></asp:Label></div>
                                 <div class="info">
                             &nbsp; &nbsp; &nbsp;       Type : &nbsp;<asp:Label ID="stype" Text="dsada" runat="server" Font-Size="15"></asp:Label></div>
                            
                                 
                                <div class="icon-course"></div>
                                     <br/>
                                    
                                     <div class="info">
                                   &nbsp; &nbsp; &nbsp;      Class :&nbsp; <asp:Label ID="classsss" runat="server" Font-Size="15"></asp:Label></div>
                                    <div class="info">
                                   &nbsp; &nbsp; &nbsp;      Section :&nbsp; <asp:Label ID="section" runat="server" Font-Size="15"></asp:Label></div>                                                           
                                
                                   
                            </div>
                        </div>
                       <div class="item-course" style=" display:none" >
                            <div class="item-course-wrapper">
                               <div class="icon-course"><i class="icons-img fa fa-male"></i></div>
                              <%--  
                                <div class="icon-course"><a href="#" class="name-course">

                                &nbsp; &nbsp; &nbsp; <asp:Label ID="name2" runat="server" Font-Size="18"  ClientIDMode="Predictable" ></asp:Label></a>

                                     <div class="info">
                                   &nbsp; &nbsp; &nbsp;      Guardian Name :&nbsp; <asp:Label ID="gname2" runat="server" Font-Size="15"></asp:Label></div>
                                    <div class="info">
                                   &nbsp; &nbsp; &nbsp;      Gender :&nbsp; <asp:Label ID="gender2" runat="server" Font-Size="15"></asp:Label></div>
                                   
                                </div>--%>
                        </div>
                     
                        
                    </div>
                </div>     
    <div class="section teacher-course section-padding">
                </div>
           <div class="section teacher-course section-padding">
                    <div class="container teacher-course-wrapper">
                        <div class="course-table">
                            <div class="outer-container">
                                <div class="inner-container">
                                    <div class="table-body">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
     <!-- SLIDER TALK ABOUT US-->                                        
                <%--<div class="section background-opacity slider-talk-about-us">
                    <div class="group-btn-slider"><a href="#people-talk" role="button" data-slide="prev">
                    </a><a href="#people-talk" role="button" data-slide="next">
                        <div class="btn-next carousel-control right"><i class="fa fa-angle-right"></i></div>
                    </a></div>
                </div>--%>
                    <!-- SLIDER LOGO-->
                <%--<div class="section slider-logo">
                    <div class="container">
                        <div class="slider-logo-wrapper">
                            <div class="slider-logo-content">
                                <div class="carousel-logos owl-carousel">
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-1.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-2.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-3.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-4.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-5.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-6.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-1.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-2.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-3.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-4.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-5.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-6.png" alt="" class="img-responsive"/></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
 
         
              </div>
</asp:Content>
